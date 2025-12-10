Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DBFD3C934
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:36:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1746.1765388186164430491
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=gb3OdRhs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44393876b5=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA4t2a0005350
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 17:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=8Kn0/Rhu6sPLgSzyHyn7Na
	jXGA6TumR2dkGZZqXGqzY=; b=gb3OdRhs/fnJEZnsmN0JAR470b/o5dZk+2FVhP
	uiIF+z6HrFmWu0LeIPDJf5U1d9s7hPBTXSDLeoDCCGP9yDfcNHkCZeX78TeLjU3J
	gNQdq0EkAAYrkT745AStq4mTB9nLO0cV7DLFYoDYi1Ps0NS89pRCFVhbUFtqk4va
	R+Mc8KgaorYIYMga2J8rFTFDP+RLvUEkkOBdPOTbNewaKC1Z/8C9+u1FR5AhmvMp
	kUHk0qkvU/oX1v0P01K2zrRRdx4QH0tvxY1AQKia054QIF9MWi2+epJPji5Viajy
	gzVHf8zFO04MoiU8gfTlmp6Ws2bBTUbKO2n/F9acQTYJSASg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010057.outbound.protection.outlook.com [52.101.46.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay07hrwm2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 17:36:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAlplyztNye8/DbBkaq9UXeu4eA2mbe4+JOvlaq5D3tFXcEJWzwRrcUh48Y0+4nQu++cYGCjFMg0svZEBQBFXeyBnXfUKGH8fovwDMccG2Q0ho/3fAFA0943w1YfVCSQXynXp/l5KAkhV8CVDPM3hKAPHMC10kTFrwnQQKjj7V6hkmYCUAIKkjiQ4Cx7U1w+rxTUGjyhkmsiRlLbzLdnp4oOS7PL5gdlqthCVRb5Msl6guhNwPlHBKNLLtJ7QjErFWzcEtH7kHS37omgDJiYUwf11bq5oconck0ni90Nm2v5m4cvawQG63DSrj7QtSbT2sHdf/RqCzcvmKnzfwzidA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Kn0/Rhu6sPLgSzyHyn7NajXGA6TumR2dkGZZqXGqzY=;
 b=DuPlcggzZLeEnjQcrXnWR+O6MukV4Zx8A8rquj1lTdE8UlH6JDHrdUK2SrYczRynVx6qvI+bPlFZ/jUOpZt+SdT7qSe+L7AycURYNU1uHsp2cS9Cn/i/ltOtVdUx+fuxg7pjB4bV2B1e7GZwfum8cGdqaYriZsDHzzO4mCS0UeCougNRzbjmHyUqOa/jXeNcxMJqvyd0o4lhzkaZTQ1TjnzW1jhgcdDHqNcky6gLNvod7sT3Fn0RynuOczhUCmUuspd5WRkO6WKO9nrSDk8FANlKMwlfJhcIRZjUoCXo3IOqhfFgeXY9S014c/S35vK06exu5qAXClK9uYhm/fUAiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8505.namprd11.prod.outlook.com (2603:10b6:408:1b7::21)
 by IA1PR11MB7295.namprd11.prod.outlook.com (2603:10b6:208:428::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 10 Dec
 2025 17:36:21 +0000
Received: from LV3PR11MB8505.namprd11.prod.outlook.com
 ([fe80::e59d:2e70:4371:48cf]) by LV3PR11MB8505.namprd11.prod.outlook.com
 ([fe80::e59d:2e70:4371:48cf%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 17:36:21 +0000
Content-Type: multipart/alternative;
 boundary="------------SMPDW0kAf6I7THaA3CZZkChG"
Message-ID: <818e8b90-9aa1-45e4-aa1d-6a903676408e@windriver.com>
Date: Wed, 10 Dec 2025 12:36:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] rust: add missing zlib and zstd dependencies
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org,
        Khem Raj <raj.khem@gmail.com>, peter.tatrai.ext@siemens.com
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
References: <20251210101803.1120711-1-Yash.Shinde@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20251210101803.1120711-1-Yash.Shinde@windriver.com>
X-ClientProxiedBy: BYAPR07CA0073.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::14) To LV3PR11MB8505.namprd11.prod.outlook.com
 (2603:10b6:408:1b7::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8505:EE_|IA1PR11MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: ada5f776-bc9d-402e-19ff-08de3812a1b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K3ZnQjVlRktnbnVyTUtiVWVNOVdDTDRlbkk2Y3djQUs4VG8rZVZvWWxsK1Jw?=
 =?utf-8?B?STg3YitBcDl3bmZ0SDFOdWhYSHl5TXZJUktBWm40YWxrWDJSeUZ4bTBPTWZY?=
 =?utf-8?B?R0lTdVo5U3gxZEJvaTJ2K1N0UXZ3K1BhY0owMEJ4dS9zS0k4SVZwQzZ0MERW?=
 =?utf-8?B?MWRtL1MzcHdwSDRxOUI1ZFR2V29UNkhrWG51M1Bob1dFMkJYZlkwSkNHMEZz?=
 =?utf-8?B?T3RpellFOFJnbk5DTUIwMTR5Y3BDREVTVnNFVGUrYmtOaU5ET3N1Z2xWM243?=
 =?utf-8?B?VC9tV0Y4cVM5VW44Q1VBMkE2S3R0RE5DTjFIMExvOWlVQytpcXFWSEdpbitV?=
 =?utf-8?B?REgydWVIaWo2QnZZNjFYZHhldlU1N3FxMUZhSW1jUkd6aHc4YUFTOVFUb2Fh?=
 =?utf-8?B?c21HWWNjMDh4YXZpc0lsR094cHQ4YWhjY0RmRVZTdGQvSGFqdlNjNWRkK0Zk?=
 =?utf-8?B?WUhtVVV5SzJHMUVjTmxQbFFwRmZSemswb3pmV3Q3WVBDcHFwb3FwTnRpZXN5?=
 =?utf-8?B?Skgvem5CZVVNcVduYVRDYjhwRWNtLzk2Znp2K2VxNTVVaks4UDQ1NmZyZTVS?=
 =?utf-8?B?Mm50Mmt3bGNRMGZ3aEZFR2JBVE54QXVoMTdCaGRyMjhoMmNSdmpWVVpzWDBL?=
 =?utf-8?B?YTNUM0RQTlVzeFVRZHNsVFNCSUZBSjBuR0NhblpyVmh4UVBRZkw4OGRqeUpS?=
 =?utf-8?B?SklSWFRmejNqQnlITVk5N29EbGNiTUxBZ2xCcjFBaEtTS0szL09qMWdhWFhX?=
 =?utf-8?B?dlcvRjVDVGM2NC8rNEJjQXd6bWI2bzZJa1dkK3NBcVpoOTJmRnhiT2pKU1lX?=
 =?utf-8?B?Q0FCakxvNmdydWxtaXZVR0NFWUVKTFhSWFQ5WmdiSE5rVGRKTGpscVo0TUc1?=
 =?utf-8?B?QjZobkpkb0ZyaG04NXdoYVFnV25KVG9oWGpFeUVPazZYL3RySkdpTDZEOHl3?=
 =?utf-8?B?dWtnMFNNY01lS1lvS2kxQUxZUE5WaXo0QkNtRW5RYW1hL1UzR0daMVJKVDEv?=
 =?utf-8?B?RThqekxmcGdhNUx6MERaTnYvZXJaaVVqOHE1bjFLZ0lqWnI5c1RVeDBXc00x?=
 =?utf-8?B?Ni9pSXdJSzJPNkNXQXpqU1FGTVN4QzQycW04aXVyL1drZ1hGWjVZVThCQ0xV?=
 =?utf-8?B?MGkrcWxvNlFENUxlcENvWThaOHh2TU5MbUx3YUFWWU9iSVRMQml3UUU5Z05O?=
 =?utf-8?B?bVluMC9relV4MHRycEFoZUlNUDZydXRXMVhHZmxxTHFwQk5Ick10RTYxcER4?=
 =?utf-8?B?L29IM2Q0Z1U1ekVmQnJCVUhBclF5SWZ6Rk1iWnAzSmJtSzR6d3Z5c1gycVlT?=
 =?utf-8?B?bVF6K0l6SkJsemtwM3pyTmw1V3MyYnRGZkZBSmtPdUxsRng3cTVzempBbC9F?=
 =?utf-8?B?OHR5MWxqZFJvUzhocnBxVDUrUkthQWxBTTkwcU01VjljVnFrTUxDM1ViVFdi?=
 =?utf-8?B?MHBHQkg4RjlZUzQrbk9OVjRRem4ydEE0OXM2ajk1YURTdzhFNDJsMXVGYWJL?=
 =?utf-8?B?ZEFKbWJYZ0JLKzQyY2hyR0VLVXdXT2trVkhxRXdhWFVYcWMzd2lyYmhjdkhV?=
 =?utf-8?B?TkFDVkJkbm5jQzFJMW5tSGpvS0FUbHBoblcxYVJnZE9TOWIrYWVuYkQ1dUNJ?=
 =?utf-8?B?SXM4L1loanNpdDcvc04xWlBxYWYvZ29velFNYXpiMzdJSUQwNE5waWZaZkI3?=
 =?utf-8?B?TGVZSDYvVTJiMGpYbmdSWGZOZklyQlpyNVJjdkdQUzF1K3pNQTVNSUFYWllK?=
 =?utf-8?B?VW1BU2tZVW1LK2xoei8zWnBmd0ErRjFxVDcvaGJGQitwN2tFdkNTKytoTlZT?=
 =?utf-8?B?WHhUakJGUzJqOWFBRW1hQlk0bnN6QWFObVRLU3I2eXdOSzVSNkNpeW04K1B1?=
 =?utf-8?B?d0h6Z2NPUExybElUWnpUYUNWYzE5NjhZV2tBdFJ4VUdYdVZYL0NBOCsrUWxL?=
 =?utf-8?B?RlRNOFNvMDBVUDI2N09RR29tZDE2aXdTNk5FeHBDb1JodmpMcGxmYUZaMERa?=
 =?utf-8?B?RkdiZnRGcXVRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8505.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWpncVErM3JGUi9xNGg2Yi91Z0hiTno1SXZmekh6aTBiN1IyVE42alB4dmJz?=
 =?utf-8?B?Tm1VYmVnMWtVdFQzWVpzQWF6R0dkbHMzams2VldlaG80d0l3dVh3NzBsVHgz?=
 =?utf-8?B?eER5dE9hblA3NkJPWmtBRkpCbThHdkRDR0FwZ1RDVEx3R1F0ZWVnSkRNNmpn?=
 =?utf-8?B?dW12eUsrajNHcmM3Sk03YmlIc0JtbnpjTmRBb3lsekh1bTRGVjBJeFlEYXll?=
 =?utf-8?B?ZVJwRXIvQTZ5b0NaaXVoaHNhVnYrdnJSUHZJVE1TaUo5bkIvbzBKcGlIdEk5?=
 =?utf-8?B?dHdmem5NTVQ1ekRBZTdyWDRQTVNWbG1LWjdpZ3A3S3lTME9ib1hUbTZ2aUd1?=
 =?utf-8?B?YTdkc3NON244ZmhqbmhTMG5SOVRVMnNIblVHNFNpaGMzTDkzR0dia09PSUVJ?=
 =?utf-8?B?TFI1NDNYU1Vha0lRcVZ5S2tQT3FTQjQyamc0WGRFam5iOFJlaEFqN3pHUHJW?=
 =?utf-8?B?R2ZsQkloZE9XSnpya3pTY2kwR05jM0E5TjhkOWhFb1I1Zk9BQU41R25pTDAv?=
 =?utf-8?B?V1VKUG9sbEo1ckdwdHhUT05TeVF5N2NWSXliZWJjbFBoZWJIUVZHM1o1bUJo?=
 =?utf-8?B?Q21lbGpNRlUzSU9ObWxVWG5rcFlncVBUUDRBd1R2bkdYVWRXRTRkcXd2Yko0?=
 =?utf-8?B?M0hBdHNRcEUveGh3VDJ1SXNWVEhiR0xlVWR2QldNcHVTS0UyQkVET2NnSjlP?=
 =?utf-8?B?NWw1WURnOVRwcm1IL2hZS0NPd3dTZXk0SUVWVzlETVN5UFhlV1JiZEh3cm5O?=
 =?utf-8?B?Q1ViSWc0K3pVbDZuQW84by9DNEFQRFdOa2FqWm1KallCSGRyUzYzT3IyYjVY?=
 =?utf-8?B?L1RhQXJKTWhlN1BWSzlTVmluaEplWDNYbi9CeEFWZXRPS3I3eVZpdlBJU3VC?=
 =?utf-8?B?R0FudzJyKzhISEE4OXVBZi9kSVNZMDd0d0NNc2JJVEUrWE1TQlhxZVcxQ3dO?=
 =?utf-8?B?djdiQXljQXN4eXl0dUtWK21qMmNibGVXVThZK0ZDeVNmQnNrTm1UM2ZONVpn?=
 =?utf-8?B?MDcxN1UvdWhFK3o4TlIyTTZYSzZ3WklabFp5aDVoU3QzNFRoV0xQOE5rYS9w?=
 =?utf-8?B?MTBpcDJMQXQ0NmlXYUJ3WFI3S0hPbm5pYVBkWDh5ZFpNNXRMMUplVVBnMFZK?=
 =?utf-8?B?cnFVSkNYc1lQVHNOOXl1dWttWDl0Mm45TitmNUc0QXNxdGxQRWI0VWwwc0I2?=
 =?utf-8?B?eHlqMXVYMkhSTU1BdG9tVk5Lb3RNOTZCbC9yclQ5bnlwQmVZUjllSjFTdmlJ?=
 =?utf-8?B?cWlMZWdyVFBqcnBXTG50cnk1VlNvWUdnVlF3aUhiMlpLT1JhbkZ6Wkh4d1pJ?=
 =?utf-8?B?N3VxWnd6bVY1UC84TTk0eVcrcjhPYVVGMFJjNlJSd0hQeWRVTWhnTGlZSm1F?=
 =?utf-8?B?U0RZdXVrUUk5ejZhbWErWlZvWjdMVzhiZnZhb09abDBiWTdRUzBydnAxbENK?=
 =?utf-8?B?aTd4M0syTTQ3SHRUSE85ZDlydTV5YmxiRm9hcXhEbm9NN3dpUU5wV2JyS20v?=
 =?utf-8?B?WXZSRExDb3VnR3dDdlVUbk1PVXpPY0xsQWZnSWxJeGhOV1hJMFhGc1EzZFBn?=
 =?utf-8?B?RnM0eUlSWmE2OGRwUU5HRURBUTVaVDQxWk5Ib1NsQ0FlZnBJTTYyQ1NLeGdN?=
 =?utf-8?B?M1RReDJndzVUcGU0cjZVcGpJYUpsVUM4ZU5IbTZhL282UDhNQ3V2NmhmbmxG?=
 =?utf-8?B?cGtWSmFGejBHYTJRcGFaeHhWMVk3clJiNGsrR2lrcDRNOCtscFV6L0gyR21P?=
 =?utf-8?B?U1RiMGZxcTVORWduSi9SOUxtQTJLSHRCVi9Vc2FNckM3ZC9zQUZCOVluc1c2?=
 =?utf-8?B?L04yZENTRTZVRTMvaVloeE8xVElJY3dUeDN1YmU1cWlPdW1vQ0p1d3Rnd1Ju?=
 =?utf-8?B?cnlFZXhnS3FGc0RrU2F0emVHWnpUbHRRZGxKYmJoUTZaQzB4QS9DQnZyanda?=
 =?utf-8?B?aVgyUTBwYS8wSVIrVWFqNm82QnNkVlJsc0hwVWtxaTdBOUdKaUlvU2FJdE1m?=
 =?utf-8?B?eTBScG5SY1E3UksyU1QwNXN5OFcvWHdxWityTFFNT3dlb2lEWmhId0hsRWQx?=
 =?utf-8?B?bGI0YWM1dUZkYlcveTI3QkJjMnJTSVZKVlVKQllISkcrTDY4bDAvako1Vklw?=
 =?utf-8?B?OFVxWHFQa2dzWmYvT0g3N1ZibHRDOHZsK1A3MUdvZVBBZlk2UXlseHhmejlh?=
 =?utf-8?B?SEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada5f776-bc9d-402e-19ff-08de3812a1b7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8505.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 17:36:20.9613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWiav5rOzik/UJgB6ekpksDx35KRnxhZwvdCU/Y9sOpAQGKJ4eAg9ungdaGqDPPFdTfhiJkw6zIWK6J06StTReKtoGrlmNkox7Qa1daqqTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7295
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE0NCBTYWx0ZWRfX+2pgjNTSLpMz
 N6t2RaHGg+Hn2FVU33XGdcysyi7As6mxw89TooY4X9VRdQZZp4RDNbDCRcc6fy2DHGKt6f6VfAj
 W2I79dqH4vw5GpL+xzhwtugo1agRalT9G8Icy8rMmzHK/Gsqi0eePwYOcKpCBWwJz6fFXEMfN+u
 ijTS88aPqrGXKuZxtDm1QDN1m6qQJ5aiq3d0giVX84tCu1/c6oFfAnyXgeHTC6BYmMAl3F4xhBK
 o95waOfu7xHJMHkgcNufngGjjwJBeuq/cIbbbJnNd5R/OkODas06LQk5JnESEmm46tRvYAZxe7T
 bGZS5cJijLJWPzGIJKyid9Zx76Ua4ypGKRfgVRCxREmJQXLiJeyC0N9/JAAMyzSZzF7/TKZDk4u
 1B7CPkrcgjgNGbMTHgs3/sTA6Tl9Ag==
X-Proofpoint-ORIG-GUID: RfETmF2KKDlukA81G1mLvCOkHO4Xpt34
X-Proofpoint-GUID: V4UitoZ_j1qAmoXOHNNlc_KPkKLErA9N
X-Authority-Analysis: v=2.4 cv=dbyNHHXe c=1 sm=1 tr=0 ts=6939af98 cx=c_pps
 a=GxUr472PnxEa6H6od3s2nA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=danhDmx_AAAA:8 a=Twlkf-z8AAAA:8 a=t7CeM3EgAAAA:8
 a=a_U1oVfrAAAA:8 a=pGLkceISAAAA:8 a=cyVEL_P_aKI72UqLO_YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=lYya0TexGMK9POHny0MA:9 a=UqVBhrzGTNy3c7sF:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=-74SuR6ZdpOK_LpdRCUo:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 17:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227487

--------------SMPDW0kAf6I7THaA3CZZkChG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BA4t2a0005350

Add Peter since this is/was his patch and you have his SOB line.
Please do that in the future.

I have some comments and questions that could go contribute to a v2
but so far, I don't object, too strongly, to merging patch 1/5 at least!


On 2025-12-10 5:17 a.m., Yash.Shinde@windriver.com wrote:
> From: Peter Tatrai<peter.tatrai.ext@siemens.com>
>
> Rust's internal LLVM
Is this an old comment? llvm is now an oe-core=C2=A0 recipe and we don't =
use=20
rust's internal llvm
as far as I know (which isn't very far!).

> requires zlib and zstd compression libraries when
Yes, we have a patch for clang for this:
meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-det=
ect-libzstd.patch
adding in meta-clang in 2022:
https://github.com/kraj/meta-clang/commit/0f38186ae93400b870f7f92938bbf86=
43e7da958
and the llvm-project commit is (1).

Anyway, Khem,

What are your thoughts about this patch and about using cmake for llvm?

> building rustc_codegen_llvm and other compiler components.
> Without these dependencies, building Rust for target fails
> with linker errors:
>
>    error: linking with `target-rust-ccld` failed: exit status: 1
>    =3D note: undefined reference to `compress2'
>    =3D note: undefined reference to `uncompress'
>    =3D note: undefined reference to `ZSTD_decompress'
>    =3D note: undefined reference to `ZSTD_isError'
>    =3D note: undefined reference to `ZSTD_compress2'
>    =3D note: undefined reference to `crc32'
>
> This manifested in oe-selftest failure on qemuppc:
>    oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust
>
> Additionally, this was observed while testing with other targets as wel=
l.
If you have a list on hand of which targets had this problem,
that might be useful to include in the log. It might help
us understand why the problem seems to be arch-specific.
>
> Signed-off-by: Peter Tatrai<peter.tatrai.ext@siemens.com>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   meta/lib/oeqa/selftest/cases/rust.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selft=
est/cases/rust.py
> index 31222e2456..01a98339a6 100644
> --- a/meta/lib/oeqa/selftest/cases/rust.py
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -47,7 +47,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, =
OEPTestResultTestCase):
>           bitbake("{} -c test_compile".format(recipe))
>           builddir =3D get_bb_var("RUSTSRC", "rust")
>           # build core-image-minimal with required packages
> -        default_installed_packages =3D ["libgcc", "libstdc++", "libato=
mic", "libgomp"]
> +        default_installed_packages =3D ["libgcc", "libstdc++", "libato=
mic", "libgomp", "libzstd"]
>
This has been present since the original rust.py selftest was added.
It seems like a hack in that things are added to (blindly?) fix linking=20
errors
rather than getting to the root cause of the problem.

That may be acceptable in the short run but shouldn't the list should be
just what rustc/cargo from rustup depend on:
=E2=9D=AF which rustc
/home/rmacleod/.cargo/bin/rustc
=E2=9D=AF ldd `which rustc`
 =C2=A0=C2=A0=C2=A0 linux-vdso.so.1 (0x00007a636834b000)
 =C2=A0=C2=A0=C2=A0 libgcc_s.so.1 =3D> /lib/x86_64-linux-gnu/libgcc_s.so.=
1=20
(0x00007a636830b000)
 =C2=A0=C2=A0=C2=A0 librt.so.1 =3D> /lib/x86_64-linux-gnu/librt.so.1 (0x0=
0007a6368306000)
 =C2=A0=C2=A0=C2=A0 libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthread=
.so.0=20
(0x00007a6368301000)
 =C2=A0=C2=A0=C2=A0 libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so.6 (0x000=
07a636821a000)
 =C2=A0=C2=A0=C2=A0 libdl.so.2 =3D> /lib/x86_64-linux-gnu/libdl.so.2 (0x0=
0007a6368215000)
 =C2=A0=C2=A0=C2=A0 libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x000=
07a6366a00000)
 =C2=A0=C2=A0=C2=A0 /lib64/ld-linux-x86-64.so.2 (0x00007a636834d000)

=E2=9D=AF cargo --version
cargo 1.91.1 (ea2d97820 2025-10-10)
=E2=9D=AF which cargo
/home/rmacleod/.cargo/bin/cargo
=E2=9D=AF ldd `which cargo`
 =C2=A0=C2=A0=C2=A0 linux-vdso.so.1 (0x0000789ffe470000)
 =C2=A0=C2=A0=C2=A0 libgcc_s.so.1 =3D> /lib/x86_64-linux-gnu/libgcc_s.so.=
1=20
(0x0000789ffe430000)
 =C2=A0=C2=A0=C2=A0 librt.so.1 =3D> /lib/x86_64-linux-gnu/librt.so.1 (0x0=
000789ffe42b000)
 =C2=A0=C2=A0=C2=A0 libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthread=
.so.0=20
(0x0000789ffe426000)
 =C2=A0=C2=A0=C2=A0 libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so.6 (0x000=
0789ffcf19000)
 =C2=A0=C2=A0=C2=A0 libdl.so.2 =3D> /lib/x86_64-linux-gnu/libdl.so.2 (0x0=
000789ffe421000)
 =C2=A0=C2=A0=C2=A0 libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x000=
0789ffcc00000)
 =C2=A0=C2=A0=C2=A0 /lib64/ld-linux-x86-64.so.2 (0x0000789ffe472000)

perhaps with the exception of libatomic and libgomp which seem like=20
valid requirements.
I guess I'm really wondering if libzstd even libatomic and libgomp,=20
should be RDEPENDs for some recipe.

>           features =3D []
>           features.append('IMAGE_FEATURES +=3D "ssh-server-dropbear"')
>           features.append('CORE_IMAGE_EXTRA_INSTALL +=3D "{0}"'.format(=
" ".join(default_installed_packages)))
> @@ -124,7 +124,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase=
, OEPTestResultTestCase):
>               cmd =3D cmd + " export RUST_TARGET_PATH=3D%s/rust-targets=
;" % rustlibpath
>               # Strip debug symbols from test binaries to reduce size (=
300+ MB -> ~140 MB)
>               # PowerPC mac99 QEMU has 768MB RAM limit, so we need to m=
inimize test binary sizes
> -            cmd =3D cmd + " export RUSTFLAGS=3D'-C strip=3Ddebuginfo';=
"
> +            cmd =3D cmd + " export RUSTFLAGS=3D'-C strip=3Ddebuginfo -=
Clink-arg=3D-lz -Clink-arg=3D-lzstd';"
>               # Trigger testing.
>               cmd =3D cmd + " export TEST_DEVICE_ADDR=3D\"%s:12345\";" =
% qemu.ip
>               cmd =3D cmd + " cd %s; python3 src/bootstrap/bootstrap.py=
 test %s --target %s" % (builddir, testargs, targetsys)

../Randy


1)=20
https://github.com/llvm/llvm-project/commit/e939bf67e34037970192fa90ad22a=
b7628f5de33

commit e939bf67e34037970192fa90ad22ab7628f5de33
Author: Cole Kissane <cole.kissane@gmail.com>
Date:=C2=A0=C2=A0 Tue Jul 19 13:54:35 2022

 =C2=A0=C2=A0=C2=A0 [llvm] add zstd to `llvm::compression` namespace

 =C2=A0=C2=A0=C2=A0 - add zstd to `llvm::compression` namespace
 =C2=A0=C2=A0=C2=A0 - add a CMake option `LLVM_ENABLE_ZSTD` with behavior=
 mirroring=20
that of `LLVM_ENABLE_ZLIB`
 =C2=A0=C2=A0=C2=A0 - add tests for zstd to `llvm/unittests/Support/Compr=
essionTest.cpp`
 =C2=A0=C2=A0=C2=A0 - debian users should install libzstd when using=20
`LLVM_ENABLE_ZSTD=3DFORCE_ON` from source due to this bug=20
https://bugs.launchpad.net/ubuntu/+source/libzstd/+bug/1941956

 =C2=A0=C2=A0=C2=A0 Reviewed By: leonardchan, MaskRay

 =C2=A0=C2=A0=C2=A0 Differential Revision: https://reviews.llvm.org/D1284=
65




--=20
# Randy MacLeod
# Wind River Linux

--------------SMPDW0kAf6I7THaA3CZZkChG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BA4t2a0005350

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Add Peter since this is/was his patch
      and you have his SOB line. <br>
      Please do that in the future.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">I have some comments and questions tha=
t
      could go contribute to a v2<br>
      but so far, I don't object, too strongly, to merging patch 1/5 at
      least! <br>
      <br>
    </div>
    <br>
    <div class=3D"moz-cite-prefix">On 2025-12-10 5:17 a.m.,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Yash.Shinde@wi=
ndriver.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20251210101803.1120711-1-Yash.S=
hinde@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Peter Tatrai <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:peter.tatrai.ext@siemens.com">&lt;=
peter.tatrai.ext@siemens.com&gt;</a>

Rust's internal LLVM </pre>
    </blockquote>
    Is this an old comment? llvm is now an oe-core&nbsp; recipe and we do=
n't
    use rust's internal llvm <br>
    as far as I know (which isn't very far!).<br>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:20251210101803.1120711-1-Yash.S=
hinde@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">requires zlib and zstd compr=
ession libraries when</pre>
    </blockquote>
    Yes, we have a patch for clang for this:<br>
    &nbsp;&nbsp;
meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-det=
ect-libzstd.patch<br>
    adding in meta-clang in 2022:<br>
    &nbsp;&nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/kraj/meta-c=
lang/commit/0f38186ae93400b870f7f92938bbf8643e7da958">https://github.com/=
kraj/meta-clang/commit/0f38186ae93400b870f7f92938bbf8643e7da958</a><br>
    and the llvm-project commit is (1).<br>
    <p>Anyway, Khem,<br>
      <br>
      What are your thoughts about this patch and about using cmake for
      llvm?</p>
    <blockquote type=3D"cite" cite=3D"mid:20251210101803.1120711-1-Yash.S=
hinde@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
building rustc_codegen_llvm and other compiler components.
Without these dependencies, building Rust for target fails
with linker errors:

  error: linking with `target-rust-ccld` failed: exit status: 1
  =3D note: undefined reference to `compress2'
  =3D note: undefined reference to `uncompress'
  =3D note: undefined reference to `ZSTD_decompress'
  =3D note: undefined reference to `ZSTD_isError'
  =3D note: undefined reference to `ZSTD_compress2'
  =3D note: undefined reference to `crc32'

This manifested in oe-selftest failure on qemuppc:
  oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust

Additionally, this was observed while testing with other targets as well.=
</pre>
    </blockquote>
    If you have a list on hand of which targets had this problem,<br>
    that might be useful to include in the log. It might help<br>
    us understand why the problem seems to be arch-specific.<br>
    <blockquote type=3D"cite" cite=3D"mid:20251210101803.1120711-1-Yash.S=
hinde@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Signed-off-by: Peter Tatrai <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:peter.tatrai.ext@siemens.com">&lt;peter.tatrai.ext@siemens.com&gt;</=
a>
Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/lib/oeqa/selftest/cases/rust.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftes=
t/cases/rust.py
index 31222e2456..01a98339a6 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -47,7 +47,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OE=
PTestResultTestCase):
         bitbake(&quot;{} -c test_compile&quot;.format(recipe))
         builddir =3D get_bb_var(&quot;RUSTSRC&quot;, &quot;rust&quot;)
         # build core-image-minimal with required packages
-        default_installed_packages =3D [&quot;libgcc&quot;, &quot;libstd=
c++&quot;, &quot;libatomic&quot;, &quot;libgomp&quot;]
+        default_installed_packages =3D [&quot;libgcc&quot;, &quot;libstd=
c++&quot;, &quot;libatomic&quot;, &quot;libgomp&quot;, &quot;libzstd&quot=
;]

</pre>
    </blockquote>
    This has been present since the original rust.py selftest was added.<=
br>
    It seems like a hack in that things are added to (blindly?) fix
    linking errors<br>
    rather than getting to the root cause of the problem.<br>
    <br>
    That may be acceptable in the short run but shouldn't the list
    should be<br>
    just what rustc/cargo from rustup depend on:<br>
    =E2=9D=AF which rustc<br>
    /home/rmacleod/.cargo/bin/rustc<br>
    =E2=9D=AF ldd `which rustc`<br>
    &nbsp;&nbsp;&nbsp; linux-vdso.so.1 (0x00007a636834b000)<br>
    &nbsp;&nbsp;&nbsp; libgcc_s.so.1 =3D&gt; /lib/x86_64-linux-gnu/libgcc=
_s.so.1
    (0x00007a636830b000)<br>
    &nbsp;&nbsp;&nbsp; librt.so.1 =3D&gt; /lib/x86_64-linux-gnu/librt.so.=
1
    (0x00007a6368306000)<br>
    &nbsp;&nbsp;&nbsp; libpthread.so.0 =3D&gt; /lib/x86_64-linux-gnu/libp=
thread.so.0
    (0x00007a6368301000)<br>
    &nbsp;&nbsp;&nbsp; libm.so.6 =3D&gt; /lib/x86_64-linux-gnu/libm.so.6
    (0x00007a636821a000)<br>
    &nbsp;&nbsp;&nbsp; libdl.so.2 =3D&gt; /lib/x86_64-linux-gnu/libdl.so.=
2
    (0x00007a6368215000)<br>
    &nbsp;&nbsp;&nbsp; libc.so.6 =3D&gt; /lib/x86_64-linux-gnu/libc.so.6
    (0x00007a6366a00000)<br>
    &nbsp;&nbsp;&nbsp; /lib64/ld-linux-x86-64.so.2 (0x00007a636834d000)<b=
r>
    <br>
    =E2=9D=AF cargo --version<br>
    cargo 1.91.1 (ea2d97820 2025-10-10)<br>
    =E2=9D=AF which cargo<br>
    /home/rmacleod/.cargo/bin/cargo<br>
    =E2=9D=AF ldd `which cargo`<br>
    &nbsp;&nbsp;&nbsp; linux-vdso.so.1 (0x0000789ffe470000)<br>
    &nbsp;&nbsp;&nbsp; libgcc_s.so.1 =3D&gt; /lib/x86_64-linux-gnu/libgcc=
_s.so.1
    (0x0000789ffe430000)<br>
    &nbsp;&nbsp;&nbsp; librt.so.1 =3D&gt; /lib/x86_64-linux-gnu/librt.so.=
1
    (0x0000789ffe42b000)<br>
    &nbsp;&nbsp;&nbsp; libpthread.so.0 =3D&gt; /lib/x86_64-linux-gnu/libp=
thread.so.0
    (0x0000789ffe426000)<br>
    &nbsp;&nbsp;&nbsp; libm.so.6 =3D&gt; /lib/x86_64-linux-gnu/libm.so.6
    (0x0000789ffcf19000)<br>
    &nbsp;&nbsp;&nbsp; libdl.so.2 =3D&gt; /lib/x86_64-linux-gnu/libdl.so.=
2
    (0x0000789ffe421000)<br>
    &nbsp;&nbsp;&nbsp; libc.so.6 =3D&gt; /lib/x86_64-linux-gnu/libc.so.6
    (0x0000789ffcc00000)<br>
    &nbsp;&nbsp;&nbsp; /lib64/ld-linux-x86-64.so.2 (0x0000789ffe472000)<b=
r>
    <br>
    perhaps with the exception of <span style=3D"white-space: pre-wrap">l=
ibatomic and libgomp</span>
    which seem like valid requirements.<br>
    I guess I'm really wondering if libzstd even libatomic and libgomp,
    should be RDEPENDs for some recipe.<br>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:20251210101803.1120711-1-Yash.S=
hinde@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
         features =3D []
         features.append('IMAGE_FEATURES +=3D &quot;ssh-server-dropbear&q=
uot;')
         features.append('CORE_IMAGE_EXTRA_INSTALL +=3D &quot;{0}&quot;'.=
format(&quot; &quot;.join(default_installed_packages)))
@@ -124,7 +124,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, =
OEPTestResultTestCase):
             cmd =3D cmd + &quot; export RUST_TARGET_PATH=3D%s/rust-targe=
ts;&quot; % rustlibpath
             # Strip debug symbols from test binaries to reduce size (300=
+ MB -&gt; ~140 MB)
             # PowerPC mac99 QEMU has 768MB RAM limit, so we need to mini=
mize test binary sizes
-            cmd =3D cmd + &quot; export RUSTFLAGS=3D'-C strip=3Ddebuginf=
o';&quot;
+            cmd =3D cmd + &quot; export RUSTFLAGS=3D'-C strip=3Ddebuginf=
o -Clink-arg=3D-lz -Clink-arg=3D-lzstd';&quot;
             # Trigger testing.
             cmd =3D cmd + &quot; export TEST_DEVICE_ADDR=3D\&quot;%s:123=
45\&quot;;&quot; % qemu.ip
             cmd =3D cmd + &quot; cd %s; python3 src/bootstrap/bootstrap.=
py test %s --target %s&quot; % (builddir, testargs, targetsys)
</pre>
    </blockquote>
    <p>../Randy</p>
    <p><br>
    </p>
    <p>1)
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/llvm/llvm-p=
roject/commit/e939bf67e34037970192fa90ad22ab7628f5de33">https://github.co=
m/llvm/llvm-project/commit/e939bf67e34037970192fa90ad22ab7628f5de33</a><b=
r>
    </p>
    <p>commit e939bf67e34037970192fa90ad22ab7628f5de33<br>
      Author: Cole Kissane <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:cole.kissane@gmail.com">&lt;cole.kissane@gmail.com&gt;</a><br>
      Date:&nbsp;&nbsp; Tue Jul 19 13:54:35 2022<br>
      <br>
      &nbsp;&nbsp;&nbsp; [llvm] add zstd to `llvm::compression` namespace=
<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; - add zstd to `llvm::compression` namespace<br>
      &nbsp;&nbsp;&nbsp; - add a CMake option `LLVM_ENABLE_ZSTD` with beh=
avior
      mirroring that of `LLVM_ENABLE_ZLIB`<br>
      &nbsp;&nbsp;&nbsp; - add tests for zstd to
      `llvm/unittests/Support/CompressionTest.cpp`<br>
      &nbsp;&nbsp;&nbsp; - debian users should install libzstd when using
      `LLVM_ENABLE_ZSTD=3DFORCE_ON` from source due to this bug
      <a class=3D"moz-txt-link-freetext" href=3D"https://bugs.launchpad.n=
et/ubuntu/+source/libzstd/+bug/1941956">https://bugs.launchpad.net/ubuntu=
/+source/libzstd/+bug/1941956</a><br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Reviewed By: leonardchan, MaskRay<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Differential Revision: <a class=3D"moz-txt-link-=
freetext" href=3D"https://reviews.llvm.org/D128465">https://reviews.llvm.=
org/D128465</a><br>
      <br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------SMPDW0kAf6I7THaA3CZZkChG--

