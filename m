Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9343C433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 22:08:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.172.1641334085433952714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 14:08:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eD3U603A;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8003e9f8a5=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 204LNTjZ022481
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Jan 2022 22:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=DgkGso0/2GaqyS/2ngJO9HcgNlGpZE7XN5cG2v3l0ZM=;
 b=eD3U603AmMAj7tRvwn+DVhBY/1xdlsRLv/z0Siyj5OrL1GnxJ1d4HzslBsvEQaTjbALM
 xf4jaSUsgPp9y4kd7q4wcx5zxOstrfGjdItw3arjFx4UX3oNP5vce8RWs4XkALjHkyDV
 eCKBW90QxUKDdlcXT4TmQ8AwhsLOmlKIVYoeFDGhDJ+rzSu1rf39yNafr82Ev5D8vK4i
 vW9lAXufKcT9UrhE4fJfXJDJzdPlBvDnP2jbd2e42RY5jvZZFTDqZ/kV1FYUVjroPFL4
 hpG2cnKeaB3ec63yTNth+sm9rhCZPFYIrPXJn3a4uxqgaE5goGA+hP+JOABs3wjeHDN2 HQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dc21ygyek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 22:08:03 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 204M476A007510
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Jan 2022 22:08:03 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dc21ygyej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jan 2022 22:08:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwN5JD/UO2IadCrZCouzlGqk+2tDu1r4B2tDOOAaLJHnTn0qSpQi7Dp06X7K1xbIWsv4eBteelLAbVJppHS4zpNQ+sYjyvjtvWnoWWEn/5M42kbmtusVw/pMVBoZpKv8rPQ8VIXMVZSZgosb23zsF26EG7TdlhdP6EoU854OSbQakFFxmGNfNCbFyqslEP7bB7f4b7rfbWqMvkJwnN3pWp7PO/tnPAT6LgtqR05rRRkcbTsSPIlJeOf8hQP38ipTTkX1vsqVViXbYWE3l5od2Q8L0UJ9r4xP6OnEwa7hm2j9PkaCziqhNYIUCSvMfFMQGyg0ZqdOL1yy5QXt813jGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgkGso0/2GaqyS/2ngJO9HcgNlGpZE7XN5cG2v3l0ZM=;
 b=QqJv6yJ+p+unhvIUvbSk3Pq3/whXKjJNNKTFAArAz8GPTjSYYlslP+ltTJpIjiLGTq54sUezyAJzktxJb6ebk8GBgSR99bGIaGFYNf+Qb2Epbdd5ZReYDZfm+OepG1HBFP+jUr7Cl3gQ34AIWCOs/b4KrVYhA40TJTqMo5ZbHmENuxy9YUI4g3DtGqvtftppqrhOSYymsxGssLt2l5mOS5xj7RBUNKCNha+GUqPDzG7mPT8zsa2mMmLUO2Ig3foyCywwhZjJMl8IQSSoBnz7C+rfleAyA7h6GW4wtbLBYA0x//xhR995CaJBMJzRt/SFRBgFchRZa7o6oqi0Srp7Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 by BY5PR11MB4150.namprd11.prod.outlook.com (2603:10b6:a03:190::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 22:08:00 +0000
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::7c04:e33d:9d46:f854]) by SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::7c04:e33d:9d46:f854%3]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 22:08:00 +0000
Message-ID: <b90b0597-15e4-f19d-2431-9afe77d6c33c@windriver.com>
Date: Tue, 4 Jan 2022 14:07:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] [PATCH 2/2] package.bbclass: don't skip kernel and
 kernel modules
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
References: <20211221190809.89882-1-saul.wold@windriver.com>
 <20211221190809.89882-3-saul.wold@windriver.com>
 <0137a7550504afc03ed41d8bc7e7fe26e7dba9d5.camel@linuxfoundation.org>
From: Saul Wold <Saul.Wold@windriver.com>
In-Reply-To: 
 <0137a7550504afc03ed41d8bc7e7fe26e7dba9d5.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR21CA0036.namprd21.prod.outlook.com
 (2603:10b6:300:129::22) To SJ0PR11MB5085.namprd11.prod.outlook.com
 (2603:10b6:a03:2db::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b99b247b-b75c-4c18-6c86-08d9cfceab83
X-MS-TrafficTypeDiagnostic: BY5PR11MB4150:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB41508687D65E9BD1B8DB37BBEE4A9@BY5PR11MB4150.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NDFFlghWREFElMthSMrE7ebDuxIEe8rrCdC4QHaZaGHDfrF6GL8MnCHiOps8Qzd4LZpj5GRwNl8wiLVkAOhq5uGJYDDeI+Q5mI5WjSYcmPkzlpyfEaMLk16b/c+t7fQ10IBYAEN4W/K/DYlTsaRUBP/5VHtolVkzeJOs5SlUSj9sXutyPExatbTocpZ3XUwNBuM1YbKxlVp4JKKkF4cOWD98p/MxAJDMhfoi1bq5KZ/k5db3olSjVah79mgOqM9soHJpwxkCz1cWt485GikHclSKLlV/qPImLqQ6GjFo7AJMJiEmhu9Y1buQlDl5y4E7mutWuJX62qRNPjzXZLpZI5QbiqKOHlqhsp6bhWQ4tnUMQqPn17DkmC3CEinq8Tc/fpa8Z1J6MQAqm/0mKBlaBCyJVjMVtFhE3os4HOTEKmLVEMEjwV3V5XY53n9Saucjp+BdqVKZiFFHjprvthIznGjnukw1Uqusg4eqo3aavajMV6qS4qgBzum7wyU9s5ggP0b1cYDrVZKxsd3a/6DjbyxmohOb2vo8ROC2+J/6GmW0sV1Y8c8W991TVf8RzNLuBy+pkccn5h17qBw+DyIZb7XRC5b1cCzxy8/MY+nFRNZnIMr6NNuGhuwfS59r1bq0GD53uaaWyheT4knYTyIK+kocCNSBRz1M54ckC476DSX5EqBC3rcXKJw44fGx4ZNzQExT/7knCdJrzb6cX0a6+JWmP9ADXSW/3+NQ8aR1O87JpNkTe/L7ZoJJK+f5Jy1Adkq/jFCYjSRyjbEGgEG7G5jTolGu+ATcXLrXC5AjsSuLOgffPfMEtJUyYO2Q5dKFbGOK6PL4KcDXLwZVZdTo6FVoVzbdC/ov9l/m2XtyGaqW/+1Fcvat1nbl6lwZ0HO7uNxbpE+4AdXVj+wYCjWkSA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5085.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(186003)(2616005)(38350700002)(8936002)(508600001)(38100700002)(52116002)(110136005)(316002)(5660300002)(86362001)(31686004)(6512007)(6506007)(36756003)(6666004)(53546011)(4001150100001)(26005)(66556008)(966005)(6486002)(31696002)(2906002)(66476007)(66946007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eXNuOVpIRlFoSUUwV0p5NHJOalRPL0J4d3oyV1V6RkVtMGdjWDR1YjZIczBY?=
 =?utf-8?B?QzZJZkpxaUZqcnp1Q2dVS3M3YWNDVnREbmhCUFZqVitEcXE5RDh2MTY4YmRL?=
 =?utf-8?B?NWx3NHIyUVB5alFrYWJzVzZuT1NoZWVTL0VxeWU2SU10K0U0M2FrRkowM1p0?=
 =?utf-8?B?TnhzZHZ2MFpsWGFLRlRvWkZmeTNRb1NCS21QR2xKcDRyZ09sMHBPd09zdklT?=
 =?utf-8?B?ampiQ2dnRjQ4cTlaVmVWQXZZeXpCUCtkMzRoeTk5ZndHcjdVN29sWTh5K3p6?=
 =?utf-8?B?eUUzQWhadVFJcGxPZzRzdXE4TzR6b3ZxT1cwRmtnbk9DNHdUUTRmS0Z5cmRl?=
 =?utf-8?B?T3cwelh4eVZoNUFZeldBZFNNVVVLNUJUY1hWTkZuLzVqNU8zL1VEdDBGUzNt?=
 =?utf-8?B?WHBEb0xkZjZyYTZyZkxqOGFQSDBHS3hXYnlwU2ZuWWY0RWtzSlZxQjBPcjBS?=
 =?utf-8?B?NFE4QmIzbXB3YmUzT283VTJlbWtpb0I0U3ZWNmlhM2J6cTNUVDJ3M3pUbXFa?=
 =?utf-8?B?YWtYK2FiNWlQVlpUTkQ3Smx3dXR3T2pOZDVQaXUxVFM3R1lqamwvNVc3MmVr?=
 =?utf-8?B?WjdnNjRLK3dNMThyYzYrNlBwNi9qYVcyWERkYUY5RmZySjVtczYxQVJVQVg5?=
 =?utf-8?B?U2hmR0c0aWFhTTJ2ZzFLK3ZhMjlva1lhRVJVVk1sTjNrRjRid1dtQ2lzUlJK?=
 =?utf-8?B?cS8zWEFvbUpuN1RxUi9YLzJTMkc4czVUZ3BBR3RhdjJFTE9qRmVCY3c3bndn?=
 =?utf-8?B?OVp1RWFZV1htdkJHZVRoM09uL0JJdmVpaVVqTzRWUlhXMTVyYjJlMDB5QS9K?=
 =?utf-8?B?NEFKMWp5NmZvUy9OL3NnbTd3QTdBOVNQY3dHT2tzbXRXdTFCU2E3VGRmN1ZX?=
 =?utf-8?B?V2xtUitjMHRQTy9Wckk1Sm81czJ1TW1KWnpwMkhEc21HalpKWW5RbzIwQ3R6?=
 =?utf-8?B?T3l2QkxyMnI5UkZKVkJFUmlxVXRrSmZVS1phSW5MWW4zUXVKTUppZWhVTFU3?=
 =?utf-8?B?alhleEtuc3M1cWx0SnJLK2xXMmRURE9yYUsvMjNSSy9EV21HWG5oUWhuVmsr?=
 =?utf-8?B?K0hTNXBNSlpRaXZXeWpiUTA2TCt5UDRNSk91ZzlJTmtzdmc0ZG45THArd1pW?=
 =?utf-8?B?OVNWcXc4ZzFyRCtieURwOVBOMkJZR3M1dlBxNDNITHNhbldReVp3dXdxRVNk?=
 =?utf-8?B?b1NYUUVyY3ZyTGdUaGszNklxMENrbEYxUjlXbHZrNUJlKzZUTElDdEd2azBx?=
 =?utf-8?B?NjlobFRRN2xuakVvamRmTU5GTkppOXp6TjN1S2REMmNBMzlwREpXNXR4TytW?=
 =?utf-8?B?NkZndEQzSUFJUytBODRWc2pLd3VsOVRDaVBqRDFYcHlvdGE2NmVZcGxJR2lr?=
 =?utf-8?B?cDNtMURsRkN0REI3bktyVFQrSWNXWHMydkVsdkhUQnpNMXFEZ0VhQjhOZEJR?=
 =?utf-8?B?VlpaNlJwRGZkNktrSzVUR2U4MFVURHdvUHE5QzgrL2VybDdINDNpN0NLdE9D?=
 =?utf-8?B?NE5QMElHajdGU3MwdC9vaytxU2NKSmhKcXhkbkxPclFnS0g5U0JuU1dpMUhV?=
 =?utf-8?B?TVJSRldSajBTemVYSkdFSll6ekl6dU50WVFtaVJJRGp5N0hncWV0ZWl2UGtk?=
 =?utf-8?B?NmY4TE9ya2hHS0x3S2tsMTlhckNSZWR2Qk5UZUFGWCtpejJiUTAwTlllL2U2?=
 =?utf-8?B?anhya1hFSDkvZkVHYzFKemRHSm0xTzRESlpkaGwrR3lTeDBJQklZU3htYUc0?=
 =?utf-8?B?TkhWdzU2WXZGL1RDQ1FabHU4bWZCWmZRUDY4aUxxYkt3Z0pPUkR4QktLRW9X?=
 =?utf-8?B?YUx1SG5WeVV1bmZCVUgzVkxkTmowc0RoS2E2SWJLRFRpcWRINGVhU2d6ZHJH?=
 =?utf-8?B?OWVFRVRXT2NXeVRIOC9WWGJGQ1ZtNGQzUkM5MlBsdjl5MTBRODlIQzVCcEl1?=
 =?utf-8?B?UzZ3UFltZ29WWnU1V0hxSGEwbGFpY09DS00zTDBRMWlXNHNVbjI0SWp1KzVR?=
 =?utf-8?B?MmE3ekVqY1V1SjhMVTJUTDA5aWRJVmZISTZaYzAvaTJleTlKckFqNlpmSEhC?=
 =?utf-8?B?b2t3bXVoalMxeEo3K09xUjRlNUlqUjNFZVVsQ0FEZnFEdGQ4a2FMMEQ2VzQ5?=
 =?utf-8?B?UGlTNkdiL0s3bW40M0RhdUs1S21lRjNTeFpYOEcrZU1HVzVZN293L1p6dTl0?=
 =?utf-8?Q?ZXl2gUjiwPObtS6AVsjAbM4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b99b247b-b75c-4c18-6c86-08d9cfceab83
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5085.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 22:07:59.9854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 T8afGIlITPEOwlVQnEQViphs9AJ89ikiOOMyVFVa18oEyUJuy4fm9IXsVHKJ1rnxoIzedexwRN3/0LyXcJQnpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4150
X-Proofpoint-GUID: J0yvBtJIG4csMg1MjFVkquhY-OAx1im6
X-Proofpoint-ORIG-GUID: diV-9T028cAlJC4-7cmO2rfDz-OQBJHX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_11,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1011 malwarescore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201040142
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jan 2022 22:08:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160172



On 12/22/21 01:09, Richard Purdie wrote:
> On Tue, 2021-12-21 at 11:08 -0800, Saul Wold wrote:
>> Stop ignoring or skipping the kernel and kernel modules code in the
>> split debug and striping functions, this will allow create_spdx to
>> process the kernel and modules.
>>
>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>> ---
>>   meta/classes/package.bbclass | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index 84eafbd529..4b7fe4f1e1 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -390,10 +390,6 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
>>       dvar = d.getVar('PKGD')
>>       objcopy = d.getVar("OBJCOPY")
>>   
>> -    # We ignore kernel modules, we don't generate debug info files.
>> -    if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
>> -        return (file, sources)
>> -
>>       newmode = None
>>       if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
>>           origmode = os.stat(file)[stat.ST_MODE]
>> @@ -1147,7 +1143,7 @@ python split_and_strip_files () {
>>   
>>                   if file.endswith(".ko") and file.find("/lib/modules/") != -1:
>>                       kernmods.append(file)
>> -                    continue
>> +
>>                   if oe.package.is_static_lib(file):
>>                       staticlibs.append(file)
>>                       continue
>> @@ -1165,7 +1161,7 @@ python split_and_strip_files () {
>>                       continue
>>                   # Check its an executable
>>                   if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
>> -                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)):
>> +                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)) or (f.startswith('vmlinux') or ".ko" in f):
>>   
>>                       if cpath.islink(file):
>>                           checkelflinks[file] = ltarget
> 
> edgerouter:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/4513
> https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/2507/steps/11/logs/stdio
> 
So I have been digging into this and it seems that an option was added a 
decade ago or so to strip the kernel/vmlinux when it's too big, this was 
done for at least the routerstationpro according to bug #3515 [0], and 
persists with the edgerouter, although I am not sure if it would still 
actually be required as the edgerouter also uses the 
KERNEL_ALT_IMAGETYPE to create a smaller binary kernel image.

The change I proposed causes the all kernels to be stripped all the time 
as part of the split_and_strip_files(). As I see it there few different 
options:

1) Set KERNEL_IMAGE_EXTRA_STRIP_SECTIONS = "" in create_spdx.bbclass
   - This solves the problem with create_spdx.bbclass is in use, but not 
the general case

2) Remove the KERNEL_IMAGE_EXTRA_STRIP_SECTIONS from edgerouter.conf
   - Will solve the edgerouter case but may not solve other usages 
unknown to me.
   - Does anyone know of other machines/layers usage of this variable?

3) deprecate the kernel.bbclass:do_strip function in favor of using the 
split_and_strip_files() of package.bbclass

4) Change error to warning in packaging.bbclass for the kernel only
   - This would explain that a kernel image (vmlinux) is already 
stripped and extended package data would not be available for for SPDX 
creation.

RP, Bruce, Joshua: Thoughts?

Sau!

[0] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3515


> qemux86 musl cryptodev:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4512/steps/11/logs/stdio
> 
> qemux86-64 musl cryptodev:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/4526
> 
> qemux86 cryptodev:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/4476/steps/11/logs/stdio
>
I tried these and have not been able to reproduce the failure.



> selftest failure in linux-yocto:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2981/steps/14/logs/stdio
> (file truncated makes it sound like a race?)
> 
> stap kernel module failure:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/3395/steps/13/logs/stdio
> (race/intermittent?)
> 
> another kernel module race:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4480/steps/16/logs/stdio
> 
Might need to try this on the AB once I resolve the kernel stripping 
issue above.

Sau!

> Cheers,
> 
> Richard
> 
> 
> 

-- 
Sau!

