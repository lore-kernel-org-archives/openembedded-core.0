Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401D6C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 15:17:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10284.1657639025178461561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=tLUopcCB;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=41924d93c3=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26CBSGhU011052
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:17:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=L+dDg/UrniOacTidLmZlXLFrwqgu0gck1wcCZTlNsQ8=;
 b=tLUopcCBjf6MwKOSbS9sGDN4N8W11mTjBw6RgnQVgiU/vHuEc8m3YtSzsVyrxoP51297
 AXJX/Ao4O8I9VOlbOkFR7zKUlaQQwcWrr1zifrxb2quwkwVgwfvRo9UggLevX5g7TlyP
 /eVWHPVuKBDZZO9E07LSxDcx/q7F1HVHgH8Hntwsjvqo6/sSXgwQeBBuX8O6I98cDZop
 OHOlrmRrMdYcKdr8P1dqwawEH9uqC0k16Et2Hdmkwfo9Inhhz/LNGY2lrqM/AS5hwB36
 S0frjFp0bJTKhQTON0OLFQSQD2cHON/XOiOQ/0NrsHN/zj2HZfnyFPArYX6bU/9kCS/f cw==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h796kt96q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:17:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GX2UYbCxlkQuMEoduxNlWaPlc1CvCiIy5Y5Plf7rkCKTqevEd0a/b3YJy/AdLeWKZ58AoWnialR/lCpcpeCldqEBs4+smzINBMICf1DbHtAv6eLmnQBmj4FwM7+/B0RHGeSYzEyxbO7TOIti615ghWpecWveS42vAO6T0KWMf7KTa+e4tj240fu3GITc+EY1eBUDqJAZRiWazz9lAQCE9Scur7h2VM2YJ0R1nsqED7nvRtaShTFYBv/ifwKX0E0WP2LfAm/FCq5A8pffRolot4O6ckJRu6bkG6FsUOCvxgQL0WjkmYLM+UiAbdpeevBqaA0eGYWxk62PbqWF6dTQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+dDg/UrniOacTidLmZlXLFrwqgu0gck1wcCZTlNsQ8=;
 b=W4QTgkmD42JUy4FiWY/hS9Bziv+snCtrc0ngOfCOOub2zSyTqfsJdV4YJcKjvi0dsCoVBImRJ0PjZFc0fVJ4xQG5KNydswINb4ysCkWGFPWW5yU92DqpIB55t0dSj9AADhx4WWAkx8YI5YySSol5Zd/uMN7EeSy9Jo6W0nakRLIJtLCQiNp8NFXMM4azDYCeFHOWiPGqOjfDAxPETckqoSkMFDY+FVVMfRk1is3xrLjZAonudsb6cdSqYrcq5fVnuh3PIK4DQggCC/IxmoNHUcasprUdLW6FL1VD08xf0Vody+EV0vnrgg/b9FvLFF0I3Po+u5BbRKTR/NmtsOIu3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BL1PR11MB5413.namprd11.prod.outlook.com (2603:10b6:208:30b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 15:17:01 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053%7]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 15:17:01 +0000
Message-ID: <cb684130-1104-a599-7fcd-b5ddca53a53b@windriver.com>
Date: Tue, 12 Jul 2022 11:16:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] u-boot: upgrade 2022.04 -> 2022.07
Content-Language: en-US
To: ZHIZHIKIN Andrey <andrey.zhizhikin@leica-geosystems.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20220712023708.15346-1-sakib.sajal@windriver.com>
 <AM6PR06MB4691688E6B8611AF605EA95FA6869@AM6PR06MB4691.eurprd06.prod.outlook.com>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: 
 <AM6PR06MB4691688E6B8611AF605EA95FA6869@AM6PR06MB4691.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::40) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a5d8e5b-418b-4511-6839-08da64199223
X-MS-TrafficTypeDiagnostic: BL1PR11MB5413:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	48axfstbAiNe8UtvWpH2cXva2sluEzofgLUWLc3TMWHrcY2ssmPYuMkYMms2v3QsEwra7lk38u7PgHrnv0ASV70RLn9LTh1vzI/NTuPsWcFtgpa5/yDPy/oVaDEQ9/Yfcl0KXbJ44MIR3iLQAon0isbRnXuqLewzlb5KQ11vZXYIgWvhkxn9PwiwgmkhohqWKq716I7vwWRmlRZD9R2Upe8J9GDjikqYXK7bVRwculIJuh0XDnQ6fAC2YgnKUFaCzzzQq0gbesmo9fCGw+X6n6YdiI4965bmgR9Spky5CAGDuBwIVCvRJ5MepBN8Ix0Yn65dXswALXi1zIjtlMJzkhb5NtPoiHauIjyIkkWa08fRNOjaFC7E0CrOtE5ART4V5S4IpupXRbHn2Oyt+3HR6ZEQ8uOZMmpX5GwyIOpKzcOc6oDYL3C/EICv/45SBMsBr1PXKd78dfDpg6nqnWKyZ8O3jL6KUHvzXu6r25Sp3VpcbJpNedreP6No4CQF/GAcyiWl+NnLUlmvynean6ruYS7XJudeuONCboHfSefHNLIyBbiKAom/B2FgSMyf/qglvqwgD2APTKPGXJqJanaKFLuiyy/B2DRj4RN4kfED/TsyTv/PcwWJ2meacpMXz7N2iigiPQvr4krmqot4MdwcuC9bU25l6wuyi8YMkYZbcBQ+Dy7LXeztqyDWWgw8fNb4xPlAeGJwS4ouiVCCHjx1xb4zWP71tEfSsrLIKlTHJ5hNaRxRmh6Zg8NFW4vhvQh7MEgtgiY7tPzeeSoUGEE6Zp8ct/qTh5PpQxANpwfWg0CyQfcDPwTjfKuEuQTg+Rg4GuILbNA31jU1Xsl171yLn1upVLb7OOc2sm4miPqjTQacCFryahltQDDOeiWK1Xh9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(366004)(376002)(396003)(39850400004)(8676002)(66946007)(66476007)(66556008)(110136005)(6486002)(186003)(2616005)(478600001)(316002)(83380400001)(26005)(41300700001)(38350700002)(38100700002)(6512007)(6506007)(2906002)(8936002)(31686004)(53546011)(31696002)(44832011)(86362001)(36756003)(52116002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RzcvUEt6WjZXMDhMVzZodTI2aWFEY2NFWkkwbklJcjE3ZkhCcHpTd1RiemE5?=
 =?utf-8?B?czBuTVNPZzZ2U3BGSGsrZmYyRXFBd0JKMGFPbE91VTNONjZPZ2xvTVljaS90?=
 =?utf-8?B?YnA0QzhIM0FaNmpWUlg2MHVISGtPREgwNDNtd3ptc015U3BpV0JvMXFXQzJk?=
 =?utf-8?B?bnMvY1g5cWhhTjluZkZGUHloTXplNzFtSWx2M1N5cUhKWFNjN0RTME1hQ0M3?=
 =?utf-8?B?V0hSaldUeVhsc3U0Mkw1VUd1ZGgwSE5uZDcrYUJvWUJzd1Q0TTlOeTFGK2or?=
 =?utf-8?B?NGxqTFViUEg2dVZqWEI4MDROQ2JwNTFGSXNHNlVCZlJqWkg2cGxldmtCaG50?=
 =?utf-8?B?QTlJeWVXUTBwV1JIclpZSDkvTkNLUHN2dHNiTjd2Z0Z4NlpqbHRjTGRmSEdv?=
 =?utf-8?B?WHV2VDNaTENiRGEvU1RLSGNXeVBFUHV0a1dWL0VsUDZGd0FXeDdTd2lrR3hI?=
 =?utf-8?B?cHNiTjlDR1FhRUVJek9YUGdPb3EyUXVOWlluOW5vZHNYaWk3ZnZRZzdZMWJK?=
 =?utf-8?B?dlpOSXRLazhoMmh4KzM1bUoxMXpONko5RDNRalZRdTVSRC9mam5iUlhvaEhQ?=
 =?utf-8?B?M2ZiRmdwTHJOcDJkdUY5K0hsZ3pLTVhUSFBQNDU4S2hvdTZqeE1ubGJUMGdk?=
 =?utf-8?B?eFc4Nnd5c0pGV0lucUJVYThLUy9kK0Zqa3lodWR4bkhBL04yYmFyQ012NWFB?=
 =?utf-8?B?ZnJMQzlwSzYzMHExREk5TUdwajB2bUVRZksvSklURWtsdGVpc0sxRzlua0Nm?=
 =?utf-8?B?UytrbS9qSDA5akJjditOZmluSUYveXozc3ZLY3hEM1NXODNVeHZSQURIUW02?=
 =?utf-8?B?Y3RxOW01MzFpT21iLzg2Y3F4MGt5VHhQbkgzRjVmY3RBZzFGYWRDbWN6c3ha?=
 =?utf-8?B?d0FsM3c2RG1ZcTBZbUNTSHBSeWNGUElHczdtdEtxSlFpK05GTmFHbTJoWThm?=
 =?utf-8?B?R0c4Vld4ZGNBRzlvVVo5OGdURzlTS2llU0VvQzB3ZklNNG1kMXdTbUx5SXAz?=
 =?utf-8?B?bHk5a2RrS0FmeGtGRnd5SldYQnp3b3RtbWwvOGhhSjIyVFIySndvdzlXSjZG?=
 =?utf-8?B?UFFvcjkvL0RLcEVJN1A3bjByaVdjVElGWTJCRnQvTkVUMFBiWVJPSjBzRGQr?=
 =?utf-8?B?VjNqMnBhV3VPdGM2ejZsMVk0M0syTkN6RjZpdXRlM216RkpDUTNZaGlYSHF4?=
 =?utf-8?B?MnhrRFBUUDJYSzd3cW92WVZNekZEZVJteXlzZno2aU5wb0F0SHlad0RSdnVk?=
 =?utf-8?B?d2dsU2VvS0FuUGZRcnFsR2liUmx6SEZKSzdaR1RUaWEvU3RVcTl0Zm1yUlJR?=
 =?utf-8?B?V0V0MHdla1l0eGR0TzdiK1RGSzE1dGhSbzZTekxLUUZ2T3dXN0RLK3JtYll4?=
 =?utf-8?B?VTN5eUV5ZjZqems4aU1MU2tLVlNNcGxuNC9iQmpsS1l3WmNtZWh1WVNKS0Ir?=
 =?utf-8?B?K1lzVFE5dG5CdkZWdU9pWFUwNWdjVlhYcXoxcE5UeEtCYWRRSndaTU05VWNL?=
 =?utf-8?B?ZW5nY2dZNEg5U2R3b2NwcFNpNG5HcGRLSW9PM2c5MVhUSFJpajJISGR4RGlS?=
 =?utf-8?B?emFtYWR2RmxJNUZlb3RVcVdsS25TRTJPYTE2dHNtYURmSzdsWEVTQ1JITWFL?=
 =?utf-8?B?c2VXYmxBVDhDL1ZRWkJkUkRSNGJtN3U1bkd5anhza0xZWDB0Vkh4VURxS01K?=
 =?utf-8?B?d3NoYk0zRzA2UjhJMk5CL0pEYUZ1ZEEra2lYZVVZTitHbWY0V29na0w4VjYr?=
 =?utf-8?B?SkZPL2RNaVp3WXJQb1pyWUpycWNDZCtLdUU1V0hSNHZWR0plcEhVKy9vVDVN?=
 =?utf-8?B?dVBlS0JsUlg4VUx2SUt4YWZaWk5idzJIWmh2eFQ0b0lDaDVHMTZwNFlsSmFX?=
 =?utf-8?B?NVhTMytaMlphUHR6MENFRGM1SnVRVjNsbHQ5MlNZcE9ZZGszYWVBL3BrT0pE?=
 =?utf-8?B?TXNDVDFMWjE3cnVBb2hCMFNGNXNHTldndDllQThBN294Kzk5RzZpOTFiSFpz?=
 =?utf-8?B?SDJkUmpsTTExQjBMYzhrL0hCMkJFNmNaUjdYQ3FVb0hTaTBISTB1UE52dVlt?=
 =?utf-8?B?bHQzT0F0ZHppUVJyd01HT3E4NFFsQVY4SDBEMkRPYkhCNTlEenJZWWhuNDNv?=
 =?utf-8?B?akhIOEFFL0FoT2F3QlZNRTE3TFlZSXZXdmFDQnllZEdIVERYeU9BVmJpSUFr?=
 =?utf-8?B?L3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7a5d8e5b-418b-4511-6839-08da64199223
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 15:17:01.7912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RgATbROhDE50WHhpCMJD696b6wAgg38J6ZefNsS39Jdac7tSS4wGuxNobbsqiladIbgk7r8dmQv/ilYHtQuOlKIkySXZ5Am354gvTz8iByI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5413
X-Proofpoint-GUID: ax4sD6Q6uadBkGcAHH_Eb7ZiNs_xvsx_
X-Proofpoint-ORIG-GUID: ax4sD6Q6uadBkGcAHH_Eb7ZiNs_xvsx_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_08,2022-07-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207120060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 15:17:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167934


On 2022-07-12 04:41, ZHIZHIKIN Andrey wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Hello Sakib,
>
> Alex just chased me up, but nevertheless...
>
>> -----Original Message-----
>> From: Sakib Sajal <sakib.sajal@windriver.com>
>> Sent: Tuesday, July 12, 2022 4:37 AM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [PATCH] u-boot: upgrade 2022.04 -> 2022.07
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>   meta/recipes-bsp/u-boot/u-boot-common.inc                     | 4 ++--
>>   .../{u-boot-tools_2022.04.bb => u-boot-tools_2022.07.bb}      | 0
>>   .../u-boot/{u-boot_2022.04.bb => u-boot_2022.07.bb}           | 0
>>   3 files changed, 2 insertions(+), 2 deletions(-)
>>   rename meta/recipes-bsp/u-boot/{u-boot-tools_2022.04.bb => u-boot-
>> tools_2022.07.bb} (100%)
>>   rename meta/recipes-bsp/u-boot/{u-boot_2022.04.bb => u-boot_2022.07.bb} (100%)
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-
>> boot/u-boot-common.inc
>> index 8fc33608d0..d7fd3c7227 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
>> @@ -7,12 +7,12 @@ SECTION = "bootloaders"
>>   DEPENDS += "flex-native bison-native"
>>
>>   LICENSE = "GPL-2.0-or-later"
>> -LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
> Please explain in the commit message that License change came due
> to U-Boot commit fba0882bcdfd ("Add valgrind headers to U-Boot").
Thanks for pointing that out, v2 sent!
>
>>   PE = "1"
>>
>>   # We use the revision in order to avoid having to fetch it from the
>>   # repo during parse
>> -SRCREV = "e4b6ebd3de982ae7185dbf689a030e73fd06e0d2"
>> +SRCREV = "e092e3250270a1016c877da7bdd9384f14b1321e"
>>
>>   SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2022.04.bb b/meta/recipes-
>> bsp/u-boot/u-boot-tools_2022.07.bb
>> similarity index 100%
>> rename from meta/recipes-bsp/u-boot/u-boot-tools_2022.04.bb
>> rename to meta/recipes-bsp/u-boot/u-boot-tools_2022.07.bb
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.04.bb b/meta/recipes-bsp/u-
>> boot/u-boot_2022.07.bb
>> similarity index 100%
>> rename from meta/recipes-bsp/u-boot/u-boot_2022.04.bb
>> rename to meta/recipes-bsp/u-boot/u-boot_2022.07.bb
>> --
>> 2.33.0
>>
> -- andrey

