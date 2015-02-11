<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:bc="urn:com.workday/bc"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xtt="urn:com.workday/xtt"
    xmlns:wd="urn:com.workday.report/CR_INT0046_MarketPay_Employee_File_Outbound"
    xmlns:etv="urn:com.workday/etv" xmlns:out="http://www.workday.com/integration/output"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    version="2.0" exclude-result-prefixes="xsd xsl bc out">


    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Dec 3, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> Darren Ustaris</xd:p>
            <xd:p>INT0046a MarketPay Employee File Outbound Document Transform XSLT</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>
            <xd:p> Set the output method to xml</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="xml" indent="yes"/>


    <xd:doc>
        <xd:desc>
            <xd:p>General Description of the template</xd:p>
        </xd:desc>
        <xd:param name="Param1">Detail Record</xd:param>
    </xd:doc>
    
    

    <xsl:template match="wd:Report_Data">
        
        <File >
         
            <xsl:for-each select="wd:Report_Entry">
              
                <!--Detail Record-->
                <DetailRecord xtt:endTag="&#xA;" xtt:separator="," xtt:quotes="csv" xtt:align="left">
                   <xsl:choose>
                       <xsl:when test="wd:CF_INT0046a_TC_T__Global_= 'T'">
                           <EmployeeNumber><xsl:value-of select="wd:testEmployee_ID"/></EmployeeNumber>
                       </xsl:when>
                       <xsl:otherwise>
                           <EmployeeNumber><xsl:value-of select="wd:Employee_ID"/></EmployeeNumber>
                       </xsl:otherwise>
                   </xsl:choose>
                    
                   <Blank></Blank>
                   <FullName><xsl:value-of select="wd:Full_Legal_Name"/></FullName>
                    <xsl:choose>
                        <xsl:when test="wd:CF_INT0046a_TC_T__Global_= 'T'">
                            <JobCode><xsl:value-of select="wd:Job_Profile/wd:CF_INT0046b_CT__X____Job_Code__Job_Profile_"/></JobCode>
                        </xsl:when>
                        <xsl:otherwise>
                            <JobCode><xsl:value-of select="wd:Job_Profile/wd:ID"/></JobCode>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                   
                   <JobCodeKey/>
                    <EmplOrgUnit1><xsl:value-of select="wd:CF_INT_LRV_GL_Business_Unit_Code__Worker_"/></EmplOrgUnit1>
                    <EmplOrgUnit2><xsl:value-of select="wd:CF_INT_LRV_GL_Department_Code__Worker_"/></EmplOrgUnit2>
                   <Department><xsl:value-of select="wd:CF_INT_LRV_GL_Department_Code__Worker_"/></Department>
                    <WorkLocation><xsl:value-of select="wd:location/wd:CF_INT0046a_CT_Location_Code_Description__Location_"/></WorkLocation>
                   <WorkZipCode><xsl:value-of select="wd:Work_Address_-_Postal_Code"/></WorkZipCode>
                   <ExemptFlag><xsl:value-of select="wd:Exempt"/></ExemptFlag>
                   <EmpStatus><xsl:value-of select="wd:Active_Status"/></EmpStatus>
                   <FullPartTime><xsl:value-of select="wd:Time_Type"/></FullPartTime>
                   <ScheduledWorkHours><xsl:value-of select="wd:Scheduled_Weekly_Hours"/></ScheduledWorkHours>
                   <PerformanceRating/>
                   <BaseSalary><xsl:value-of select="wd:Unit_Salary_Plans"/></BaseSalary>
                   <PayPeriod><xsl:value-of select="wd:Total_Base_Pay_-_Frequency"/></PayPeriod>
                    <SalaryEffectiveDate><xsl:value-of select="wd:CF_INT0046a_LRV_BP_Comp_Change_Eff_Date__Worker_"/></SalaryEffectiveDate>
                   <LastBasePayIncrease><xsl:value-of select="wd:Last_Base_Pay_Increase_-_Amount"/></LastBasePayIncrease>
                   <IncentiveEligible/>
                   <OvertimeEligible/>
                   <LongTermIncentiveEligible/>
                   <IncentivePlan><xsl:value-of select="wd:Bonus_Plans/@wd:Descriptor"/></IncentivePlan>
                   <IncentivePaid/>
                   <CommissionsPaid/>
                   <OtherCashPaid/>
                   <IncentiveThresholdPercent/>
                   <IncentiveTargetPercent><xsl:value-of select="wd:Target_Bonus_-_Percent"/></IncentiveTargetPercent>
                   <IncentiveMaxPercent/>
                   <IncentiveThresholdDollars/>
                   <IncentiveTargetDollars/>
                   <IncentiveMaxDollars/>
                    <EmployeeTitle><xsl:value-of select="wd:businessTitle"/></EmployeeTitle>
                   <EmployeeGrade/>
                   <EmployeeStructure/>
                   <EmployeeMinimum/>
                   <EmployeeMidpoint/>
                   <EmployeeMaximum/>
                   <SupervisorName/>
                    <SupervisorTitle><xsl:value-of select="wd:Supervisor"/></SupervisorTitle>
                   <ManagerName/>
                    <Managertitle><xsl:value-of select="wd:Manager"/></Managertitle>
                   <ExecutiveName/>
                    <ExecutiveTitle><xsl:value-of select="wd:Executive"/></ExecutiveTitle>
                   
                   <Dateofhire><xsl:value-of select="wd:Original_Hire_Date"/></Dateofhire>
                    <DateinPosition><xsl:value-of select="wd:Time_in_Job_Profile_Start_Date"/></DateinPosition>
                   <HighestDegree><xsl:value-of select="wd:Highest_Degree/@wd:Descriptor"/></HighestDegree>
                   <highestDegreeDate/>
                    <YearsExperience><xsl:value-of select="wd:Total_Years_Experience"/></YearsExperience>
                    <PlannedIncrease1><xsl:value-of select="wd:Last_Base_Pay_Increase/@wd:Descriptor"/></PlannedIncrease1>
                   <PlannedIncreaseDate1/>
                   <PlannedIncrease2/>
                   <PlannedIncreaseDate2/>
                   <PlannedIncentive/>
                   <PlannedIncentiveDate/>
                   <PlannedOtherCash/>
                   <PlannedOtherCashDate/>
                   <StockOptionsGranted/>
                   <StockOptionsGrantedDate/>
                   <StockPriceonGrantDate/>
                   <StockOptionsStrikePrice/>
                   <StockOptionsterm/>
                   <RestStockValue/>
                   <RestStockGrantedDate/>
                   <OtherLongTermIncentiveValue/>
                   <OtherLongTermIncentiveTarget/>
                   <LongTermIncentiveTarget/>
                   <UDF1><xsl:value-of select="wd:Hourly_Rate_-_Amount"/></UDF1>
                   <UDF2/>
                   <UDF3/>
                   <UDF4/>
                   <UDF5/>
                   <UDF6/>
                   <UDF7/>
                   <UDF8/>
                   <UDF9/>
                   <UDF10/>
                   <UDFVarchar1><xsl:value-of select="wd:Primary_Work_Address_-_Country/wd:alpha3Code"/></UDFVarchar1>
                   <UDFVarchar2/>
                   <UDFVarchar3/>
                   <UDFVarchar4/>
                   <UDFVarchar5/>
                   <UDFVarchar6/>
                   <UDFVarchar7/>
                   <UDFVarchar8/>
                   <UDFVarchar9/>
                   <UDFVarchar10/>
                   <UDFVarchar11/>
                   <UDFVarchar12/>
                   <UDFVarchar13/>
                   <UDFVarchar14/>
                   <UDFVarchar15/>
                   <UDFVarchar16/>
                   <UDFVarchar17/>
                   <UDFVarchar18/>
                   <UDFVarchar19/>
                   <UDFVarchar20/>
                   <UDDate1/>
                   <UDDate2/>
                   <UDDate3/>
                   <UDDate4/>
                   <UDDate5/>
                   <UDDate6/>
                   <UDDate7/>
                   <UDDate8/>
                   <UDDate9/>
                   <UDDate10/>
                   <currency><xsl:value-of select="wd:Total_Base_Pay_-_Currency/@wd:Descriptor"/></currency>
                   <UDNum11/>
                   <UDNum12/>
                   <UDNum13/>
                   <UDNum14/>
                   <UDNum15/>
                   <UDNum16/>
                   <UDNum17/>
                   <UDNum18/>
                   <UDNum19/>
                   <UDNum20/>
                   <UDNum21/>
                   <UDNum22/>
                   <UDNum23/>
                   <UDNum24/>
                   <UDNum25/>
                   <UDNum26/>
                   <UDNum27/>
                   <UDNum28/>
                   <UDNum29/>
                   <UDNum30/>
                   <UDNum31/>
                   <UDNum32/>
                   <UDNum33/>
                   <UDNum34/>
                   <UDNum35/>
                   <UDNum36/>
                   <UDNum37/>
                   <UDNum38/>
                   <UDNum39/>
                   <UDNum40/>
            
                   <UDFVarchar21/>
                   <UDFVarchar22/>
                   <UDFVarchar23/>
                   <UDFVarchar24/>
                   <UDFVarchar25/>
                   <UDFVarchar26/>
                   <UDFVarchar27/>
                   <UDFVarchar28/>
                   <UDFVarchar29/>
                   <UDFVarchar30/>
                   <UDFVarchar31/>
                   <UDFVarchar32/>
                   <UDFVarchar33/>
                   <UDFVarchar34/>
                   <UDFVarchar35/>
                   <UDFVarchar36/>
                   <UDFVarchar37/>
                   <UDFVarchar38/>
                   <UDFVarchar39/>
                   <UDFVarchar40/>
                   
                   <UDDate11/>
                   <UDDate12/>
                   <UDDate13/>
                   <UDDate14/>
                   <UDDate15/>
                   <UDDate16/>
                   <UDDate17/>
                   <UDDate18/>
                   <UDDate19/>
                   <UDDate20/>

        
                </DetailRecord>
               
            </xsl:for-each>
           
            
        </File>
    </xsl:template>

    
</xsl:stylesheet>