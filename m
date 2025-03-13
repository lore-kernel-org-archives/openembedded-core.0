Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C9BC282EC
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 14:29:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16207.1741876147144623764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 07:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5167dd2ec4=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DBwgQN008460
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 14:29:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45bxxp85n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 14:29:06 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52DET5Pt004546;
	Thu, 13 Mar 2025 14:29:05 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45bxxp85n6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 14:29:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9zDMavB/UDJ3Q/wQhXWepDYT5AhSADM1jmLZDHCZdkrgKWNN24opJ785kPmP4rG/A3qUpZads5xNPGrM3QLyIYyy5XFzx6q1PBIWuRUb/w7QAO1oMg09a8AvK4zH45N4ary0ruZj0EE2MLFIuxKBASeDQ6ZXyCREDgtupDQzGLwsEY7YOQ/Q9ohQTIdsRwVnn1KU3DT9vhXM+waDd9z5gQKlPZ4eG3YconEBju45syZ5if9j10i5WGKM7b5qs8dX4XzVrDT7+IboQJ0E/sz1YhHU5p4najTQRLlL0qBQa0t/9zJEM0e49ygwyTfYLd+xr1OoqVSvBCtZ2z3LZoaYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIzfhrlGBzR1eDNVQ/w1wSmddE46pri0lvyNCGZpzHk=;
 b=aFYF7U+QGfc9x4vrtiqofJytXB/SN5Ho9DUdoxtbmPrcJrMHi7rCAa4ZIF8VUDYvAURMQDYWHVDBDdS7QGfv4w880XSK27j2PIcZzZUH74jA4AjIxsQe75t+Gaym1P+5zOPmII6/S8r3s6fYjXeIDlTT8ooQ/W5+cVSpRvkOf0i0M8H61KKRuq9B5NoQVdZrXIinwX6GTDVs1lnf7kksHgIZ7dxIJfOGXq+mLFQyM4BGlMaCC0aoD1ALRudZ2mxG2VF3Y7QgEOm4TFwjDiSErQTzQP4mNhp+bsDxtxOFnBfZFqX8JKUzx+JpcX01fuPFEYa8I6U7PhZDt8G1y6Y1MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA1PR11MB5924.namprd11.prod.outlook.com (2603:10b6:806:23b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 14:29:03 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 14:29:02 +0000
Content-Type: multipart/alternative;
 boundary="------------Cd0g9IJ5zvrl7vphCreVwnXy"
Message-ID: <37938611-8f9f-435f-854d-621c9852de14@windriver.com>
Date: Thu, 13 Mar 2025 10:29:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] tcmode-default: eliminate needless binutils
 defaults
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org,
        Martin Jansa <martin.jansa@gmail.com>
Cc: raj.khem@gmail.com, mathieu.dubois-briand@bootlin.com
References: <20250311162532.1676284-1-Randy.MacLeod@windriver.com>
 <20250311162532.1676284-2-Randy.MacLeod@windriver.com>
 <80b8b5920dfaa00bee739b5df19c5314e10edc3f.camel@linuxfoundation.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <80b8b5920dfaa00bee739b5df19c5314e10edc3f.camel@linuxfoundation.org>
X-ClientProxiedBy: YQBPR0101CA0255.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::16) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA1PR11MB5924:EE_
X-MS-Office365-Filtering-Correlation-Id: 8803e291-07dc-4b45-de64-08dd623b66e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q2ROOURRUEdVNm5lQjZobVlKTTh4M0lSZVVsRGJSakZpbk1KMWtWZHZtNElE?=
 =?utf-8?B?SURvMVBWQWVSWW93VWhEMjA0SkNEaGZjTXdNcnVyU0U3V3dqeTVRbXFQY2pn?=
 =?utf-8?B?dXYxWlZ2RkZ1T2U1MTBoSXNIcGdqTEJLUGppMHNGVnJwalNFblhvNysySlFW?=
 =?utf-8?B?RXRpaDJRRmRXSU5XR3B3NDZ0cng3RDkzUnlQVnhXY0JXV1JuNjVRUjdpR083?=
 =?utf-8?B?OFF3UmdqZFNDVUp5TUJQcE80eU90eGhIaDhFRHAxQ1JRREs3MXRkeUl3WnN3?=
 =?utf-8?B?cVR5cEVpaWx5WjhsYXdCYzFSdmgyL2cvQkNFM2gxM05jem5wREZpZmsrQ2Jz?=
 =?utf-8?B?a0tqeWVIUzhHRU4zRGJtK2NGUXRtYjRoSHRmdCttUERaempNNnVJTTFZaWcx?=
 =?utf-8?B?WHh6ejdNZlZScEExcWpNa1AvN0xkczF2blR4UUFuMkxhVXh2RTBtYlk0UDlM?=
 =?utf-8?B?K252b0FJYjFRdnVMRUltbWYvbWUrbGJJcjFDcW9YWEhMci9nUUhNTExwaHE2?=
 =?utf-8?B?TzFMaE95SG81MkFIbm90Mk1tWWJPeHU5eTFDZHJEMFpMazhnSTJFTEtnSlB2?=
 =?utf-8?B?OUg0Z1JtVEJ0Q0I0blVlbGhvQk9GMXBCRm04UUYxaDBMdWV2K2FRNFJmN3Uy?=
 =?utf-8?B?ZnBBQlNWcVhGYjl1Tng5dUJJVkk1d1Z1UVNoNVd6WElHT2M1YzcwcXNIeTNU?=
 =?utf-8?B?Mkkranc3b2dPN2R2UzZaTXlaL3dkZENyUTdxSG90NWNrcmN0cllYWXJhc0hH?=
 =?utf-8?B?MndMeUR5aU1DUVczdHV4bzZ1TGxzNzZXWWsxOENoMXRCc0RGK2lzQ1I2Sk5P?=
 =?utf-8?B?R1hiTUdGSm1iOFh2SmFzRGhSSy85UjlLSFkvMm5aT0tLMnRkUWlZL0VrUkVq?=
 =?utf-8?B?SmwzNk1GME9GK1hoNWtMRXkwc05SLzNiNStCbG1hTGJkbTJlTmpMKzdkQmw3?=
 =?utf-8?B?cUVxekQ2SFZJRHk2Q0lQTFlYdFpJbCtncy9tTHY4Y29wRVd3SVlNZlZvR3ds?=
 =?utf-8?B?WlVqbVFnK1BIcVcxNUxFUWhhVzdhUGt3TGNwemFOa1dhb0hkYy84Tis2U0FK?=
 =?utf-8?B?cDZBVmdsazgzNnpKV1dWekt4R1IrVzlNbWR4ZkY0WXZveGd3b1IzaW5DTTdm?=
 =?utf-8?B?c3J2S1hwZlBmZVJxWkRLQmQ3TjVzeXZsMlduNlFjN3U0OEtuYnZZeXR0U2Ey?=
 =?utf-8?B?YXdDMFc0OFRKWmtRb0U4RG1EenFPMXZHTmpkV1pkNytMY0FCWndmUm5veUlO?=
 =?utf-8?B?K2ZiUkx5L3pjb2lwUDZFV0laNlRSVVJYN3BsdldZQXhzMFIxZHkreDB5czVU?=
 =?utf-8?B?V1MrSktKT1BGRHFjZTMyN3k2OU16WHNCV0RiUk1YRVJCRnBGWml2TTdFMlNp?=
 =?utf-8?B?bWFEcUUrbURBM0QrUXVpZ1pnVDlqalIvQjcxRUxNMGxGUklzcjdJblZlbEtp?=
 =?utf-8?B?VThPcGJQajRlNDI4WFF4MGFqaTZnb0M5TUU5QVRIZldiZnNRMndJQTg2UGJt?=
 =?utf-8?B?dVowTStidkM2UG1DYnJaQURzc0Z1RFRxWEJIWHdCUEI1MDV1MkVOWXF3Rm5M?=
 =?utf-8?B?WnBtV3VlOVFrVzJsclRkai94Wnc3aUZOVFFHcW1tYzVxVkx6cTZaM0ZQTzJJ?=
 =?utf-8?B?dTMvMjhZRWVZakMwQTYzRmlMUnNoYXNDOFdjWEVPcWoxZ1BtUkRTUUZLU3pw?=
 =?utf-8?B?WURXS1ROVGZvM1dVOGcveDBPSllrSVBoVm02ckkzWlE1dW1uVitIaXBKanp3?=
 =?utf-8?B?SWNhSG1ETitTdFI3Tk9tL1pvdmlJQjZqMllHV0NETUIrSTJiQkVySndmdXl6?=
 =?utf-8?B?Y0FBZ3dZZXhXNW55RnZta1RlZ0NBK085TlJzZ1lwdHBmaW1SQ3VuWW15Sks5?=
 =?utf-8?Q?EUF+344YbHoO1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QSs3VEVOVFZId2Q3Q0NSaWwzcWVDc1dyU2Z0TEQxU0NVL1lGTDVqUFFNUnVJ?=
 =?utf-8?B?S2RGR1BNeDl5MmJURHEwMkF6VTVQaHFVSFZDWGpsdURELy9zV1Q0eS9ncE53?=
 =?utf-8?B?YjR0a2hXUjNySk55d1hOU0FoajhZZy9iQ1hDWjVOaUI4Z1N2dlJKMFQyZlhC?=
 =?utf-8?B?TDZ6aWgzOXppR2h4Q1RuYTR0T2UveGVmVEsyL3hoeDJhMVRhbTI1VmU4Qlhz?=
 =?utf-8?B?WlZtSWd3Y2FIbFlLKzRwNklDOWw2UjJhZUF3UzA5Mm9MYm9oQmNsZTZBS3VF?=
 =?utf-8?B?WmlpN3RqMndiUUJyMWhOdzJWS1B4VzMxaERza3B3NzBvMmQycG1nKzREb2pN?=
 =?utf-8?B?cHVpd3JpbTI2SUNaTWZwWHMvL2dub1UyeHFObkZxVGtHcHRKNGE1VTlGbmtX?=
 =?utf-8?B?UU1GZ1loajdUQ1A1SkIzQis5SFBoNGViNjdLTTU0S0hkWlY3cnMyWnhzY0gr?=
 =?utf-8?B?MUtqeFhLU2w1amlla1lhblN6MExPZ3NnaGZLT2hGOFc3ZzVNNmRzelloOEZp?=
 =?utf-8?B?anlJa2Y3ZXVOZDVkMjcwY3JvNyt5bjRQNTFoY2ZiR0wxZU1VMmRGWUprOEd2?=
 =?utf-8?B?UGxvK1B6L3U0cmtkZTRSaDdrYUFqeVo3cURQRjcwR01qT2JnMW5wTEprZ1Nu?=
 =?utf-8?B?Ky9lTFhadC9xSFRyS09UUE9EV1VnNHArVWdDKzJrN05BUjIvdHg2OXFTdW9y?=
 =?utf-8?B?eVZJY3dkMzB5eFZoTTdqSnVrem05cmJDM0UxQTJ6SUR3Z0hXUlhXN2lqdzQ4?=
 =?utf-8?B?eWh0MU5abHQ0M3JqdUhSQXlyUDd6SFpHRUZiT09ZYVdXdS9BbmNpTjBvc2cz?=
 =?utf-8?B?aUllR3d1dW91Nno5U1gxNHBjaUx3SEdRREl3SnZXU1RIa2pNbG9IUW9CL1JV?=
 =?utf-8?B?NnVqcTFjNExpT1NyWWxjR3Q1WnVtQno1aUpFRmFqZzhSS1ZYaThyTnR4eElX?=
 =?utf-8?B?OGwyUktZa1JDYzhicnNMSnRFbFo3S3FkMFE4SDZ0bkxNYURwTnN4SUJlaTNa?=
 =?utf-8?B?VEJRMDZWNDJFcVFVK1RhY3JoTnI1ck5qREE3dFc5WlMwUzRCSjJtL3M0TlRD?=
 =?utf-8?B?NXRlLzZySHJwVDlkU0RabG1teXUzK2JRNHJjemU1Qng5a3VlbFROenlHaHZM?=
 =?utf-8?B?SjdZQWIzREIxT3grb0hYUS9LaDgyVFVjN3NSNkwvZ3ViSE0yV3ZIVWRja1JG?=
 =?utf-8?B?K1pYTkxnVElteXRKOFlLQlAyRWpwT0VqdC9mbGh3cXdrVG5OTjR1aTBCYk5z?=
 =?utf-8?B?NTRQWDVvYnR4K3VBVDZPeEtuZ21BVWlKQkpxZ1JLbjZVZHV6cThuTGFBclln?=
 =?utf-8?B?Y3RGeUp0U3pkT2xYdGU4ZEJUdC9WVCtoS1BjbnVCajM4MEwvNi8wb2tiRFh6?=
 =?utf-8?B?a1lhR1hEM3FrRHdaUFlrWEZWcVFqUjI4eFBuUURJL3k2dVBhOWJIRGtpZE1B?=
 =?utf-8?B?TERuSE4wVDM2SGUrdHBkU1Y1M1hVZ2pxZ1NLdlJoV29JemJnOCtuOFNaTVVB?=
 =?utf-8?B?M1NvOHgzRW90VFBrNS83N0k1ZlJKY05xalBsT29MbzR5NmFGcEFlVDZJNE5B?=
 =?utf-8?B?cW11N1NZR0ZsZzlub1RaUlphQzV4TE05UjZJaXZicEkxSEt6cjlDTzRGOXZ1?=
 =?utf-8?B?UzFtODd0OXRvT0JWTEFLRUcxbHE3bWkzbzIwQm5QWTRXc3N3RHZ3ejlveUdX?=
 =?utf-8?B?SjM4MHlqOVc1c21rUmdLc1hmNXVrd1NBQ1dmcHhweEFJWE5MSEM5K3IraG1B?=
 =?utf-8?B?VUN1L0VXSXEvcUVGZFJmWHlVT3oxaS9sVlJvZmQ3MGVyN01rSEN4d2dwYkJa?=
 =?utf-8?B?T3MxaHg4WXlWV2trcUpOdXFmNDJMNTJjdk9vcVVlY2ttTWdwUWQweGY2OGNP?=
 =?utf-8?B?cXdGMnlOUU1zN1hac0xsMmxnaVZYaUpTYVljZ0lzcmFTWFA5UUdZaUloa3d5?=
 =?utf-8?B?WkUvc3JMOUpxRGdNeUs1MldBZStzNU93R0twNzMydHhORGlqSEZCRU8wQ3Bm?=
 =?utf-8?B?Uno1V3RQYjcyS2M5dVZPSDBEWTZPMWZDYWhuTVI0dXNCVVFNa2UrNEw1QjMr?=
 =?utf-8?B?ZER5US9UR1NScWVabDZYUkh0MFh4UkZLOFQ1a1dzN0RrdEpJeHAzMzZldkV1?=
 =?utf-8?B?aUVDSDlmeXZGVHBEMk81UlZ6WjBxNDlKK1lieVNtYWtsZHNGV3l5c3VJWW9C?=
 =?utf-8?B?SUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8803e291-07dc-4b45-de64-08dd623b66e5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 14:29:02.7328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVj1GNxt143hYWe+XqobkF6vJ7aH0WULby1u8FdTMl6ORHrjl7rMaOjuecOlsVEnw05x0ldYs5JWllkC1bV9GkQj3WBB+iLKoaLBf3y4wFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5924
X-Proofpoint-ORIG-GUID: ZVrhbanHlOFd0dQ1xOQ3HYl1qtMzIkXJ
X-Authority-Analysis: v=2.4 cv=C+PpyRP+ c=1 sm=1 tr=0 ts=67d2ebb2 cx=c_pps a=/1KN1z/xraQh0Fnb7pnMZA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=P6h6xgjkQpnbf1tL_m0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ag1SF4gXAAAA:8 a=YcNP6FP_DiV6ToGiOZIA:9 a=YNSo2SbVps31jszG:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: MpziE64trSP1YK9Q9sgoZNqV6H0qZrSB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503130113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 14:29:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212779

--------------Cd0g9IJ5zvrl7vphCreVwnXy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52DBwgQN008460

On 2025-03-11 6:06 p.m., Richard Purdie wrote:
> On Tue, 2025-03-11 at 12:25 -0400, Randy MacLeod via lists.openembedded=
.org wrote:
>> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>>
>> Manually setting preferred version/provider is not required so remove
>> that for binutils.
>>
>> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
>> ---
>>  =C2=A0meta/conf/distro/include/tcmode-default.inc | 10 ----------
>>  =C2=A01 file changed, 10 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/d=
istro/include/tcmode-default.inc
>> index 5cc93405f1..2a3c16e2bd 100644
>> --- a/meta/conf/distro/include/tcmode-default.inc
>> +++ b/meta/conf/distro/include/tcmode-default.inc
>> @@ -2,16 +2,11 @@
>>  =C2=A0# Default toolchain configuration
>>  =C2=A0#
>>  =20
>> -PREFERRED_PROVIDER_virtual/cross-binutils =3D "${MLPREFIX}binutils-cr=
oss-${TARGET_ARCH}"
>> -PREFERRED_PROVIDER_virtual/cross-binutils:class-nativesdk ?=3D "binut=
ils-crosssdk-${SDK_SYS}"
>> -PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?=3D "binutils-cr=
osssdk-${SDK_SYS}"
>> -
>>  =C2=A0#
> I suspect we need to keep this bit since these are not direct mappings.
> It was the version preference which I think we may be able to drop as
> there is only one version.


Okay. Will do.

v2 without rust and the bit above coming up...

../Randy

>
> Cheers,
>
> Richard
>

--=20
# Randy MacLeod
# Wind River Linux

--------------Cd0g9IJ5zvrl7vphCreVwnXy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-03-11 6:06 p.m., Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:80b8b5920dfaa00bee739b5df19c5314e10edc3f.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">On Tue, 2025-03-11 at 12:25 -0400, Randy MacLeod via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

Manually setting preferred version/provider is not required so remove
that for binutils.

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
&nbsp;meta/conf/distro/include/tcmode-default.inc | 10 ----------
&nbsp;1 file changed, 10 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 5cc93405f1..2a3c16e2bd 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -2,16 +2,11 @@
&nbsp;# Default toolchain configuration
&nbsp;#
&nbsp;
-PREFERRED_PROVIDER_virtual/cross-binutils = &quot;${MLPREFIX}binutils-cross-${TARGET_ARCH}&quot;
-PREFERRED_PROVIDER_virtual/cross-binutils:class-nativesdk ?= &quot;binutils-crosssdk-${SDK_SYS}&quot;
-PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?= &quot;binutils-crosssdk-${SDK_SYS}&quot;
-
&nbsp;#
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">I suspect we need to keep this bit since these are not direct mappings.
It was the version preference which I think we may be able to drop as
there is only one version.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Okay. Will do.</p>
    <p>v2 without rust and the bit above coming up...</p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:80b8b5920dfaa00bee739b5df19c5314e10edc3f.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">

Cheers,

Richard

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Cd0g9IJ5zvrl7vphCreVwnXy--

