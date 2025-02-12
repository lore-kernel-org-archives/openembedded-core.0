Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98CBC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 15:23:37 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.110])
 by mx.groups.io with SMTP id smtpd.web10.18432.1739373809780119212
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 07:23:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=eQpF+SUW;
 spf=pass (domain: weidmueller.com, ip: 40.107.159.110, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zM29k/yL6CLqhLIOhyyVL7uVgFH8E/NE0aN87ofzNsogcbfJsCD5wAEQNk/Do5pyo1wjMcwxzhTAF3fvklw81THrL1A+kHpVu9x/57bVHPV5cTZyiLzLdvSpJBm09UeBW9QdMJjVeI2JpSe3VAD78fPu6kZQyu0yIOjVgSn1/CwR3dpDLfhYt0WTfiD/L5F0wGapjU4p4Se4mK93S0U8tqk6jHmPDf8oeZpsZ5Hx+BG6unh3uu4/33XYtj0Vv/f5ZVdIwRPf3+rQuWf1m0dXTPmy80MlhBRgI/ivaIOVB778TqNFRLhJpBuYJOimZbwdEsUZ7Pi/66FFfXd6xXz+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5egxjtm5gsfCFF0d+/D9C8YMRD0Bc+vvCgAcsr1BKZc=;
 b=dVXmA4f22DTNeRVZ4K3jaCYN1X/6ouU1v5rwTmHby0q1aFjxXvfDaDM0M+GwtOyTcN4+2zggG+0vw0wqNJ3pDMakp7f2iScVPB5rZ3N2WQxALJ+LHpTXkPL42+wOYxKfLeqPSQds4wn20sEpgyhSYEasev4Q0CBVEr5xhXvSYJaKe4k+2zQAgDfnO/NbCmgVRM32SvHRBX+g5VyFr7/zAjzvuPVffz/UGF2aQHJgUIbDa4HWoNo/t3SMxlV84g4iOQqS7Vn6kVUhZH80wL6yKSeG5S3dWzijJeNtfgitb6bj7ZPu+It3wkQ+gqXlB05hVMvUsSecJf6FqrMC3dEvfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5egxjtm5gsfCFF0d+/D9C8YMRD0Bc+vvCgAcsr1BKZc=;
 b=eQpF+SUWoiDcihme21zx+FEUiKcl7kyBX69hJAukOtLkp9BlGN/dtvukXtPgo7N5uG7gONfMh5DSfL/oZlXjOokGEzXLpKySfg86xY4g8vPNPdYRdHqzIH1P/Yp1Uu9cNOaDvRD5uC6T9ADEtPE6YrrhjPTnt/qA4gpJG9gWfPk0WL0T3yEELrS+dM8xBg/y1U3ZH8ZAzaSVS3KbYmwezet7UOvzFAvgCLkSvqg1f+RwQIVZegEoY98RY5ykh0SApqrOlgSz5Chpc1bj/Pw3JOUGJTxEr9L30lvdQI/V7Ft8Dk7P1dcilzKTdaltNDywC9Sesyfn5nw/6fDH78npkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DB5PR08MB10287.eurprd08.prod.outlook.com (2603:10a6:10:4a5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 15:23:24 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 15:23:24 +0000
Content-Type: multipart/alternative;
 boundary="------------9HKz2YzLGkxsCz9DPqxyQGMC"
Message-ID: <45e5a215-e630-447f-b7b3-37bedce6f2fe@weidmueller.com>
Date: Wed, 12 Feb 2025 16:23:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 18/30] classes: add vendor class for go
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-18-stefan.herbrechtsmeier-oss@weidmueller.com>
 <Z6vWayPuHfEIrzEF@gmail.com>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <Z6vWayPuHfEIrzEF@gmail.com>
X-ClientProxiedBy: FR3P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::11) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DB5PR08MB10287:EE_
X-MS-Office365-Filtering-Correlation-Id: 20247666-f48d-4d68-fedd-08dd4b7930af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aVROOGhUWTYrUnd3SW95NFBDcUxmVFhSeXJKTnllRStob1ZWVXVQbEk5OXpB?=
 =?utf-8?B?UVhiblFacVJYWU1Bb0JkNkEzQUlLalloSE5JcXBmMzdJSGxNNExKVGpvUytI?=
 =?utf-8?B?MVFkNlprV1E5MTViWXh0ZE95Q25neUlLb1dGeUgvUmE0all2bnF3allvSFJN?=
 =?utf-8?B?SS9SeXdjM2ZIV25COWF5UEtkUHZIME10UnREQmpIQUdPclZ5cWMvaXJhT2cz?=
 =?utf-8?B?VlpmNnRpZFYzTTlmVkJvNU0yandxeTE4dW5pbmlra28rKzQ2Tll5MHBvdjE1?=
 =?utf-8?B?S3JPLzBBbVJkSDVUN0VacVl6QjZtZDJWRHpCUWlPZGpndmtmZzFrWlRqRkp4?=
 =?utf-8?B?Y05FMS9Lc1c5b2QvaWJzRlB3MHg5SEU4aWI5K01iQnZtNnRqbDhrNE1UTmU1?=
 =?utf-8?B?SmJ5YVBDN2kraGRtWUJCaDU5RGJHMWJjUVZNcng4SDd4L2tqUjUrbThuakoy?=
 =?utf-8?B?VjFGVGMyMlA1UG1QVFBJZGtrOERRY3JDYVBMSFlxdks1Ykltd3owSC8rYVZq?=
 =?utf-8?B?cm1zVDFpUTdiQXRQbmMvS3hwYWcrTHQ0aXVjd3FXZjVzOUVuMTBPUnd5Tkov?=
 =?utf-8?B?NEhvNmlXVnNSc0dqeEgyVnZkL1YrRVpGR1B5dGtaL0dQV3Y1TTdDdFhHL3c2?=
 =?utf-8?B?Um15KzJNTURXODN5ZlNoWkwrVVJuaU8zYkJHRkdTNmtvZHNsaTdGRitNT2dQ?=
 =?utf-8?B?Y1ZiNVEzWExzaExXQ1lFTSt3NkFjakNCSDMrRDdvd2xHdmx2UWNOUHFyZmpj?=
 =?utf-8?B?Y0M1QnFCTzQyQ1BmalRRN1RrOHJ3YWNLVm9HMG95SEZEY1g3T0M0MHRBNnU3?=
 =?utf-8?B?RWxXbE9WSHFyNzZLWUlTZUJqSlorVXBFQ0VSWGUxV2pxck5DMmVuOUZZRVZS?=
 =?utf-8?B?b1pIV1J5cWRMYjdDbFJFZzd2eTBWVDJ6MEtmOE9NQ2xsaHQrQTVIOTFGbm81?=
 =?utf-8?B?MUh3Tmg4SzdlRklrZGJNMTNJR3BOQWVHQ2FObit2SkV1RVp0QnhyTXpFa3Zp?=
 =?utf-8?B?NitTSVhJdGVNNVZVcitMOHozL2UySzRYVWZXOUVSMmJPWXhHbFZCUkpnd05N?=
 =?utf-8?B?d0J1WE5SQ3VQMEJKZVEyOTFjMmtLVFZTZWdqTG53T1UxTWZ2NjBxNEVqMkhr?=
 =?utf-8?B?b1I4REQrVndiVXhSdzZjN1VSZ1ZCMGdGUkR3Y2hYLzZzTERwUGFRNjNxenNM?=
 =?utf-8?B?V0xIRDlaSG4wMGttZVdQTEVmdkI2cldKbEZ0KzVuZTJBTHY2eTBZeDl6LzNa?=
 =?utf-8?B?Q1FxNlJmVWFlOHBJTGg1dFJkZTlHTThXWVlYcEV4ZHlEV3pqYmNlRk9IVjEv?=
 =?utf-8?B?TG53NXE5MlpiemhtQWZWUWtqQTUzblIrN3FGcWdZZEFLVWRrMng0bTNqU3VI?=
 =?utf-8?B?alZvcG1uWlZSblA4VGRWbm1DWlgyeVM1V2RVZ2FTSEZhSmxRczluc1poTmti?=
 =?utf-8?B?VCsvQWl2NHRwU2VoRmt5NlIrelRRbUZJY1RrYlZYUUg3Z0tpbTZxbCt2N09D?=
 =?utf-8?B?K25kRyt3NVByQ1YzS0JHUmJXSElpY2N0SGVLcFdOVkV0M2pMWkpxQmFqemFR?=
 =?utf-8?B?cFBudUpyVDROVlJyRWdzKzJsam0vb0hucTU5cmp2dG1VYzNNT0hMRUhWMHB3?=
 =?utf-8?B?cmcwTE9TTU1lZnNCcHY5SGRtcGtYdm9TUzJxQ3NxWFhmOU9KWG5PMy9ZSkJU?=
 =?utf-8?B?WS81TzRYOTA4UzN3L2EybWM5VjYwYjN5Vi9SN1VTUzBRcHRYNjFZV244aUhh?=
 =?utf-8?Q?/xnWNkTe5SmTkxXzswBrnBjCYqy1ojtHffx/HyP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bllOdlZRUm1Tc1hNOGFwU2pkZEJ3UzhDd0o3dkUzOFZMRUhRdzM5R2Y2ZW1M?=
 =?utf-8?B?RGk3VUZqcExzOHYxN1VWdjlETWJ3aG1FZlkzRnhmSnNJN1Y5M3Q1UUJMMWls?=
 =?utf-8?B?dUxGM1U2Y1pnSWVKN3ZaOEw2akRmd0o0WG9vemtyTkxQa1drWDZpUkZVc0M0?=
 =?utf-8?B?SjhDWmZhdDFJYmcyWkZXR0FPeUlQa3Z4Zkc4Z29ZYmlkZExtb1IyMVRlbGd4?=
 =?utf-8?B?dE9FSEVRcG01SGw0YUZDY0xQZzdtb2hWWDE4RCt3OU40QzJJT1ZNVGRQam14?=
 =?utf-8?B?aFNGaVltVnVaK2FENEFZdDZWZEpjdnJ2UDlWcE5iV2xRUjVxRU4zTnU5L3Fw?=
 =?utf-8?B?WFllNXQ5U0xCenVib0VTU3QvM29VT2MzZGxUSVpyZlBvQ2wzYk9IQ0dZeTlk?=
 =?utf-8?B?eFBMWU0yVk1qNzJuTW4wclB6T0lEeUhKM2ovOUVZd0FqUUtKWEZlcnNsZGZG?=
 =?utf-8?B?VUJ5K250QnRGekRtQlZhRVVZcUpNc1BMNGJ4SzhTclNEL2x4a2lvQlNjZlpN?=
 =?utf-8?B?a3hRWTFSL1UrVERDSDBhWUE4eXQzNCtFWVhVOENON29ITzVUMmhVN1VRallp?=
 =?utf-8?B?a3RPOGNVa2VQeDFwRUg1NkdZbmR0MmM5eGZYZ2czQXpyQ3dyZVZURzdjMzVn?=
 =?utf-8?B?c29meG1yMVI4dDlqbXFubTY1eG1IRHlLYUpuNEVEKzNnQ01Fak5PU1hzeHJw?=
 =?utf-8?B?ak1pVC94czcwc2ZJbzRPdEpxWDh2T3R6QTRxcDhUZ1ZURnFUQ2hGaitVUFhm?=
 =?utf-8?B?WFpCS05SRGp6OURQcjlncmdMUU5Ca2NDcGYvTWp1aTBFK2gxTEZYUWd2dmdv?=
 =?utf-8?B?RWFYa3pxL0ljOWhXRjdxQVNnM0pSZWxwRm1XTFhBVWc5TmRWRkpreTkwbnkz?=
 =?utf-8?B?dXdHQ1NsY1lKY0VnamtYZDlPYlBnMU94TlFwYzd6eE1za1RrU3J0dlpPK1da?=
 =?utf-8?B?YWZzZHY2UHdmSW5LRithZlRrbVBzaEZlY2tmQy81T3AvNFlENHhqZERqSHZD?=
 =?utf-8?B?d3JiN1BxNkQyenNYV2E4Q2FqRGhocmFTTWxxb0VWVWpjWTdpSEYrdEEvN1lD?=
 =?utf-8?B?YTFRRTBTcEZ1ZThHRHVKRW9wTUt4SlEzOER2OWpwOFMweTdkUXNXTDdqNXpW?=
 =?utf-8?B?VGw2RGZSMWFIbE1oNVBOeXBpNTFCOWlkU3pQWTBwL0p3cHIxdXlKY2l1Zjhx?=
 =?utf-8?B?bUpUSm51YzNLN3VaWkVxVDF0WmFPUmZ2NERKUSs0UjVyY09pYTR2WVAyUkFN?=
 =?utf-8?B?QWhFQ3d2Tms5aldpNFkyaDNZMSt5bDlVMWFqVTRHd292QWxJMlB5eERXcFhx?=
 =?utf-8?B?MHFINjF2Slh3cmJUN21uWFhOc1VIajVTeHlYRE9LSnlzZy9iRmhVNXhWdm5r?=
 =?utf-8?B?N1BXTTI2Sk5mYjd6UDNVVEN2OThLN2JBL2pHTmxMZFUxRThHaGhYcW42di9Z?=
 =?utf-8?B?SWNoNGVFSGdnckt2b1lVdlFWdkxFdVZBVGlnYmxVZHdITThQdkdPaHkrbkw4?=
 =?utf-8?B?RGdqT08zSFlCeStqUDZsQXhrNTVQUFJ0aWNRejFKV3h5U29PTzdjbThJWUNk?=
 =?utf-8?B?WHB1Si9jeUFEWVRxekViR2lqSUZkQnkrZ1FDSHJhOHpGUUtKQ3hVZDVrY2ps?=
 =?utf-8?B?SWN1eFRFQUhzZXlmV3gyb25MeE5NWXV5Nkpha2NLWUJtWWN3ODZuNGQ5SlIy?=
 =?utf-8?B?dldRY2RGY1FXM3ZOUWdCZE43UEEzdlo5NnZBb3ZWZG93VlFJanZManZKWGVS?=
 =?utf-8?B?N1dRS01sTEwreHR5dktNZ3ZRMlo3cThWdzhaQWJDTU95RVFzZHlDbTFhN1FD?=
 =?utf-8?B?M2xOOWxES0RQNVROc3gwZkNGNTRWWWUzdTFRVCtGY0Z3SDI1SldoUjZ3YWcw?=
 =?utf-8?B?VGs0LzRBdDRBZ1VLVmFQeFU0S1czeXB4SDJZaFYrU1piUkpCT3pCMytVd2tT?=
 =?utf-8?B?NFZwWEYwRzF1cTYvZi9EK0lKS1lQaHhMN1pWM2YxRFoycThMZWljZnZCUjZl?=
 =?utf-8?B?a2VLZGlncWp6dnpkSTN3VmNWSXF3K0hJRDBIVE9IL1JIS05Jb2NWSmpucTgr?=
 =?utf-8?B?MmhhWWg0bDVUL09IeEFyR2JRSmRMaDN1dG1KVjJ3b1NWWUtDOFZJRkorRHho?=
 =?utf-8?B?ZGFKTUVvaHFrUlBIQ1dheUtTczRNcFB3NFFtaDV1KzBjV1NMajZKVmdsdTUx?=
 =?utf-8?B?aWc9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20247666-f48d-4d68-fedd-08dd4b7930af
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 15:23:23.9748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJc1KzfGAaHwfdu72VvtosM3Gu+F0FyPtO8HMDSxHBaVePHBVABlcwJpvLrgbUfOeQSzSfIPk8tLgCERccV9Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10287
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 15:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211251

--------------9HKz2YzLGkxsCz9DPqxyQGMC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 11.02.2025 um 23:59 schrieb Bruce Ashfield:
> In message: [OE-core] [RFC PATCH 18/30] classes: add vendor class for go
> on 11/02/2025 Stefan Herbrechtsmeier via lists.openembedded.org wrote:
>
>> From: Stefan Herbrechtsmeier<stefan.herbrechtsmeier@weidmueller.com>
>>
>> Add a vendor class for go to resolve the dependency SRC_URIs from a
>> go.sum file and run populate the go mod vendor folder.
>>
>> Signed-off-by: Stefan Herbrechtsmeier<stefan.herbrechtsmeier@weidmueller.com>
>> ---
>>
>>   meta/classes-recipe/vendor_go.bbclass | 59 +++++++++++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>   create mode 100644 meta/classes-recipe/vendor_go.bbclass
>>
>> diff --git a/meta/classes-recipe/vendor_go.bbclass b/meta/classes-recipe/vendor_go.bbclass
>> new file mode 100644
>> index 0000000000..dc5f8d1d8d
>> --- /dev/null
>> +++ b/meta/classes-recipe/vendor_go.bbclass
>> @@ -0,0 +1,59 @@
>> +# Copyright (C) 2025 Weidmueller Interface GmbH & Co. KG
>> +# Stefan Herbrechtsmeier<stefan.herbrechtsmeier@weidmueller.com>
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +# The directory of the go.mod file relative to the root directory, per default
>> +# assume there's a file directly in the root directory
>> +GO_SRC_DIR ?= ""
>> +
>> +# The path to the go.mod file
>> +GO_MANIFEST_DIR ?= "${GO_SRC_PATH}/go.mod"
>> +
>> +# The path to go.sum file
>> +GO_LOCK_DIR ?="${@os.path.join(os.path.dirname(d.getVar('GO_MANIFEST_DIR')), 
>> 'go.sum')}"
>> +
>> +# The URL of the go proxy
>> +GO_PROXY ?="https://proxy.golang.org"
>> +
>> +GO_SRC_PATH = "${S}/${GO_SRC_DIR}"
>> +GO_SRC_SUBDIR ="${@os.path.relpath(d.getVar('CARGO_SRC_PATH'), d.getVar('WORKDIR'))}"
>> +GO_SRC_URI_FILE = "${VENDOR_DIR}/go-source-uris.txt"
>> +SRC_URI_FILES:append = " ${GO_SRC_URI_FILE}"
>> +
>> +inherit go-mod vendor
>> +
>> +GO_INSTALL_PREFIX = "."
>> +GO_SRC_PATH = "${S}"
>> +GO_SRCURI_DESTSUFFIX = ""
>> +
>> +GOMODCACHE = "invalid"
>> +GO_MOD_CACHE_DIR = "go/pkg/mod"
>> +GO_WORKPATH = "${GO_SRC_PATH}"
>> +GO_MOD_RECRDEPTASK = ""
>> +
>> +GOBUILDFLAGS:append = " -mod=vendor"
>> +
>> +python vendor_go_do_vendor_resolve() {
>> +    import oe.vendor
>> +    import oe.vendor.go
>> +
>> +    lock_file_dir = d.getVar("GO_LOCK_DIR")
>> +    lock_file_subdir = get_early_source_dir(d, lock_file_dir)
>> +    proxy = d.getVar("GO_PROXY")
>> +    cache_subdir = d.getVar("GO_MOD_CACHE_DIR")
>> +    src_uris = oe.vendor.go.resolve_src_uris(lock_file_subdir, proxy, cache_subdir)
>> +    with open(d.getVar("GO_SRC_URI_FILE"), "w") as f:
>> +        oe.vendor.dump(f, src_uris)
>> +}
>> +
>> +run_go_mod_vendor() {
>> +    cd ${GO_SRC_PATH}
>> +    export GOMODCACHE="${UNPACKDIR}/${GO_MOD_CACHE_DIR}"
>> +    ${GO} mod vendor
> What happens if a module isn't in the unpackdir ? I assume it goes
> to the go infrastructure and fetches the module ? Or is it
> impossible for one to not be in the cache (i.e. is it
> always fully pre-poulated via the vendor_go_do_vendor_resolve ?)
A missing packages leads to an build error because the network is 
disabled. But this shouldn't happen because the resolve task add all 
modules to the dynamic SRC_URI.

> It is unclear to me how the vendor'd modules get into an archive
> that can be saved for future reproducible builds (can you point
> me at that glue?).

The do_vendor_resolve task add all modules from the go.sum to the 
dynamic SRC_URI. The fetch and unpack task fetch the modules and unpack 
it to the cache. The go mod vendor command create a vendor directory 
from the populated cache. Depending on the archiver class function the 
archive contains the created vendor directory in S or the recipe and 
dynamic SRC_URI archives.

--------------9HKz2YzLGkxsCz9DPqxyQGMC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 11.02.2025 um 23:59 schrieb Bruce
      Ashfield:<br>
    </div>
    <blockquote type="cite" cite="mid:Z6vWayPuHfEIrzEF@gmail.com">
      <pre wrap="" class="moz-quote-pre">In message: [OE-core] [RFC PATCH 18/30] classes: add vendor class for go
on 11/02/2025 Stefan Herbrechtsmeier via lists.openembedded.org wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Stefan Herbrechtsmeier <a class="moz-txt-link-rfc2396E" href="mailto:stefan.herbrechtsmeier@weidmueller.com">&lt;stefan.herbrechtsmeier@weidmueller.com&gt;</a>

Add a vendor class for go to resolve the dependency SRC_URIs from a
go.sum file and run populate the go mod vendor folder.

Signed-off-by: Stefan Herbrechtsmeier <a class="moz-txt-link-rfc2396E" href="mailto:stefan.herbrechtsmeier@weidmueller.com">&lt;stefan.herbrechtsmeier@weidmueller.com&gt;</a>
---

 meta/classes-recipe/vendor_go.bbclass | 59 +++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 meta/classes-recipe/vendor_go.bbclass

diff --git a/meta/classes-recipe/vendor_go.bbclass b/meta/classes-recipe/vendor_go.bbclass
new file mode 100644
index 0000000000..dc5f8d1d8d
--- /dev/null
+++ b/meta/classes-recipe/vendor_go.bbclass
@@ -0,0 +1,59 @@
+# Copyright (C) 2025 Weidmueller Interface GmbH &amp; Co. KG
+# Stefan Herbrechtsmeier <a class="moz-txt-link-rfc2396E" href="mailto:stefan.herbrechtsmeier@weidmueller.com">&lt;stefan.herbrechtsmeier@weidmueller.com&gt;</a>
+#
+# SPDX-License-Identifier: MIT
+#
+
+# The directory of the go.mod file relative to the root directory, per default
+# assume there's a file directly in the root directory
+GO_SRC_DIR ?= &quot;&quot;
+
+# The path to the go.mod file
+GO_MANIFEST_DIR ?= &quot;${GO_SRC_PATH}/go.mod&quot;
+
+# The path to go.sum file
+GO_LOCK_DIR ?= <a class="moz-txt-link-rfc2396E" href="mailto:${@os.path.join(os.path.dirname(d.getVar('GO_MANIFEST_DIR')),'go.sum')}">&quot;${@os.path.join(os.path.dirname(d.getVar('GO_MANIFEST_DIR')), 'go.sum')}&quot;</a>
+
+# The URL of the go proxy
+GO_PROXY ?= <a class="moz-txt-link-rfc2396E" href="https://proxy.golang.org">&quot;https://proxy.golang.org&quot;</a>
+
+GO_SRC_PATH = &quot;${S}/${GO_SRC_DIR}&quot;
+GO_SRC_SUBDIR = <a class="moz-txt-link-rfc2396E" href="mailto:${@os.path.relpath(d.getVar('CARGO_SRC_PATH'),d.getVar('WORKDIR'))}">&quot;${@os.path.relpath(d.getVar('CARGO_SRC_PATH'), d.getVar('WORKDIR'))}&quot;</a>
+GO_SRC_URI_FILE = &quot;${VENDOR_DIR}/go-source-uris.txt&quot;
+SRC_URI_FILES:append = &quot; ${GO_SRC_URI_FILE}&quot;
+
+inherit go-mod vendor
+
+GO_INSTALL_PREFIX = &quot;.&quot;
+GO_SRC_PATH = &quot;${S}&quot;
+GO_SRCURI_DESTSUFFIX = &quot;&quot;
+
+GOMODCACHE = &quot;invalid&quot;
+GO_MOD_CACHE_DIR = &quot;go/pkg/mod&quot;
+GO_WORKPATH = &quot;${GO_SRC_PATH}&quot;
+GO_MOD_RECRDEPTASK = &quot;&quot;
+
+GOBUILDFLAGS:append = &quot; -mod=vendor&quot;
+
+python vendor_go_do_vendor_resolve() {
+    import oe.vendor
+    import oe.vendor.go
+
+    lock_file_dir = d.getVar(&quot;GO_LOCK_DIR&quot;)
+    lock_file_subdir = get_early_source_dir(d, lock_file_dir)
+    proxy = d.getVar(&quot;GO_PROXY&quot;)
+    cache_subdir = d.getVar(&quot;GO_MOD_CACHE_DIR&quot;)
+    src_uris = oe.vendor.go.resolve_src_uris(lock_file_subdir, proxy, cache_subdir)
+    with open(d.getVar(&quot;GO_SRC_URI_FILE&quot;), &quot;w&quot;) as f:
+        oe.vendor.dump(f, src_uris)
+}
+
+run_go_mod_vendor() {
+    cd ${GO_SRC_PATH}
+    export GOMODCACHE=&quot;${UNPACKDIR}/${GO_MOD_CACHE_DIR}&quot;
+    ${GO} mod vendor
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What happens if a module isn't in the unpackdir ? I assume it goes
to the go infrastructure and fetches the module ? Or is it
impossible for one to not be in the cache (i.e. is it
always fully pre-poulated via the vendor_go_do_vendor_resolve ?)
</pre>
    </blockquote>
    A missing packages leads to an build error because the network is
    disabled. But this shouldn't happen because the resolve task add all
    modules to the dynamic SRC_URI.<br>
    <br>
    <blockquote type="cite" cite="mid:Z6vWayPuHfEIrzEF@gmail.com">
      <pre wrap="" class="moz-quote-pre">It is unclear to me how the vendor'd modules get into an archive
that can be saved for future reproducible builds (can you point
me at that glue?).
</pre>
    </blockquote>
    <p>The do_vendor_resolve task add all modules from the go.sum to the
      dynamic SRC_URI. The fetch and unpack task fetch the modules and
      unpack it to the cache. The go mod vendor command create a vendor
      directory from the populated cache. Depending on the archiver
      class function the archive contains the created vendor directory
      in S or the recipe and dynamic SRC_URI archives. <br>
    </p>
    <p><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------9HKz2YzLGkxsCz9DPqxyQGMC--

