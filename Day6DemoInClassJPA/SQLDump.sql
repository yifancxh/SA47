DROP TABLE IF EXISTS  EMP_PHONE;
DROP TABLE IF EXISTS  PHONE;
DROP TABLE IF EXISTS PARKING_SPACE;
DROP TABLE IF EXISTS DEPARTMENT;
DROP TABLE IF EXISTS EMPLOYEE;


CREATE TABLE PHONE (ID INTEGER  NOT NULL, 
                    TYPE VARCHAR(255), NUM VARCHAR(32), PRIMARY KEY (ID));
                    
CREATE TABLE PARKING_SPACE (ID INTEGER  NOT NULL, 
                            LOT INTEGER, LOCATION VARCHAR(255), PRIMARY KEY (ID));
CREATE TABLE DEPARTMENT (ID INTEGER NOT NULL, 
                         NAME VARCHAR(255), PRIMARY KEY (ID));                            
CREATE TABLE EMPLOYEE (ID INTEGER  NOT NULL , 
                       NAME VARCHAR(255), SALARY BIGINT, 
                       PSPACE_ID INTEGER, DEPARTMENT_ID INTEGER, PRIMARY KEY (ID),
                       CONSTRAINT PSPACE_FK FOREIGN KEY (PSPACE_ID) REFERENCES PARKING_SPACE(ID),
                       CONSTRAINT DEPT_FK FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT (ID));
                       
CREATE TABLE EMP_PHONE (PHONE_ID INTEGER NOT NULL, EMP_ID INTEGER NOT NULL,
                        CONSTRAINT PHONE_FK FOREIGN KEY (PHONE_ID) REFERENCES PHONE (ID),
                        CONSTRAINT EMP_FK FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE (ID), 
                        PRIMARY KEY (PHONE_ID, EMP_ID));                       

                       
INSERT INTO PHONE (ID, TYPE, NUM) VALUES(1,"Residence", "65677723");
INSERT INTO PHONE (ID, TYPE, NUM) VALUES(2,"Residence", "67886772");

INSERT INTO PARKING_SPACE (ID, LOCATION) VALUES (1, "Near West Link");   
INSERT INTO PARKING_SPACE (ID, LOCATION) VALUES (2, "Near West Link");  
INSERT INTO PARKING_SPACE (ID, LOCATION) VALUES (3, "Near East Link");  
INSERT INTO PARKING_SPACE (ID, LOCATION) VALUES (4, "Near East Link");  
INSERT INTO PARKING_SPACE (ID, LOCATION) VALUES (5, "Near East Link");

INSERT INTO DEPARTMENT (ID, NAME) VALUES (1,"Software Engineering");

INSERT INTO EMPLOYEE (ID, NAME, SALARY, PSPACE_ID, DEPARTMENT_ID) VALUES (1, "Dilbert", 5000, 1,1);
INSERT INTO EMPLOYEE (ID, NAME, SALARY, PSPACE_ID, DEPARTMENT_ID) VALUES (2, "Alice", 4500, 2, 1);
INSERT INTO EMPLOYEE (ID, NAME, SALARY, PSPACE_ID, DEPARTMENT_ID) VALUES (3, "Pointy", 10000, 3, 1);
INSERT INTO EMPLOYEE (ID, NAME, SALARY, PSPACE_ID, DEPARTMENT_ID) VALUES (4, "Catbert", 5000, 4, 1);
INSERT INTO EMPLOYEE (ID, NAME, SALARY, PSPACE_ID, DEPARTMENT_ID) VALUES (5, "Dogbert", 25000, 5, 1);

INSERT INTO EMP_PHONE (PHONE_ID, EMP_ID) VALUES (1,1);
INSERT INTO EMP_PHONE (PHONE_ID, EMP_ID) VALUES (2,2);

--------------------------------------------------------------------------                       
--- MANY TO MANY BIDIRECTIONAL
--------------------------------------------------------------------------
DROP TABLE EMPLOYEE_PROJECT;
DROP TABLE EMPLOYEE;
DROP TABLE PROJECT;

CREATE TABLE PROJECT (ID INTEGER  NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), 
                      NAME VARCHAR(255), PRIMARY KEY (ID));
CREATE TABLE EMPLOYEE (ID INTEGER  NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), 
                       NAME VARCHAR(255), SALARY BIGINT, PRIMARY KEY (ID));
CREATE TABLE EMPLOYEE_PROJECT (PROJECTS_ID INTEGER NOT NULL, EMPLOYEES_ID INTEGER NOT NULL,
                               CONSTRAINT PROJECTS_FK FOREIGN KEY (PROJECTS_ID) REFERENCES PROJECT (ID),
                               CONSTRAINT EMPLOYEES_FK FOREIGN KEY (EMPLOYEES_ID) REFERENCES EMPLOYEE (ID),
                               PRIMARY KEY (PROJECTS_ID, EMPLOYEES_ID))                     
--------------------------------------------------------------------------
--- MANY TO MANY JOIN TABLE
--------------------------------------------------------------------------
DROP TABLE EMP_PROJ;
DROP TABLE EMPLOYEE;
DROP TABLE PROJECT;

CREATE TABLE PROJECT (ID INTEGER  NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), 
                      NAME VARCHAR(255), PRIMARY KEY (ID));
CREATE TABLE EMPLOYEE (ID INTEGER  NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), 
                       NAME VARCHAR(255), SALARY BIGINT, PRIMARY KEY (ID));
CREATE TABLE EMP_PROJ (PROJ_ID INTEGER NOT NULL, EMP_ID INTEGER NOT NULL,
                       CONSTRAINT PROJ_FK FOREIGN KEY (PROJ_ID) REFERENCES PROJECT (ID),
                       CONSTRAINT EMP_FK FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE (ID), 
                       PRIMARY KEY (PROJ_ID, EMP_ID))


                               