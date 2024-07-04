Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149B9C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 16:47:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14683.1720111630704332169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 09:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=79154f57d5=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4645e2Bw023252
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jul 2024 16:47:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jqy0p3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 16:47:09 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 464Gl9Nd021118;
	Thu, 4 Jul 2024 16:47:09 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jqy0p3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 16:47:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJJ/fd7dUeOQmPnEjMnc6qMLTcCX9v+TiAaPabmeljcYvEB5uOrPWvx0vfcmUYgt4su4U1SLdpqwf6KdzWvNroiRURVCkVmi+QHKYdBP3Cpz1htM6XM4YwCbIvOTcdmsOdCYHA7Nm5tjw/TS5TrRuQxYuxR8E8zeTmwTjoi5yc6T7Iy9Tq8dL1vFxIhQlZESuIHfJAPqIYBLfXml+F5kWKINJCR1eh5gskxT/RwC/qr2Gb/KT3iwU+JpwmcnAjEb+R4DmIMCqy+ecPO6IXS605dp1j1x5YZo/keL7yBxp4o+G3Ii3BvQBZKnay9SrkpXAk3JZwRKJ//AhxLtxHe3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vqPFyA6ZOoCQac3NeS816BoRGHuQgV1gWvkz7COzBQ=;
 b=WYLeGI6h7y8TSyr6tDjP/2GFfjQPMRZBuHOvhIiyNNU0d4XYy2yz5X418wEgsPM0nmPkui8Zp7hORilL5Xdm7Y83PctAp6almdloyH5JPMbIH2dtAr1qUq3waPUqJOCK79QBccnMM2D5Be+jSihKJ2T3XUKxvhOA6+/giXvGqIzjiKqpty+hiNMPIXL5m5yd55r20pPLo1RkKIUKp6WedE8GMRladB9Qyvna/hadf8dkoRQKBI0OVcd3+t+piTa/XRxSAqfLEmkfuRHMvIcNURjykXFazic136NrNGOG0kOPZOCGe4J3gNNwZdfmGt9BInkCC+i9bVGyaqp0zQUiKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8505.namprd11.prod.outlook.com (2603:10b6:408:1b7::21)
 by SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 16:47:06 +0000
Received: from LV3PR11MB8505.namprd11.prod.outlook.com
 ([fe80::e59d:2e70:4371:48cf]) by LV3PR11MB8505.namprd11.prod.outlook.com
 ([fe80::e59d:2e70:4371:48cf%5]) with mapi id 15.20.7741.025; Thu, 4 Jul 2024
 16:47:06 +0000
Content-Type: multipart/alternative;
 boundary="------------JIVLvXsApjoGDXrCKqi8E1GC"
Message-ID: <5c10b742-459f-4912-8260-aeb7699e2f29@windriver.com>
Date: Thu, 4 Jul 2024 12:47:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Rust reproducibility issue summary
To: alex.kanavin@gmail.com, sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org
References: <CANNYZj-m-m+B3iaNLHeEq5C9w5Rfg28fGY+U8ezaZS6N33P4Ag@mail.gmail.com>
 <31491.1720105991184445170@lists.openembedded.org>
 <CANNYZj9vSOdetOTfghRN4r9iOpai1zwSPkUU7_pJRoaYoEZL2g@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj9vSOdetOTfghRN4r9iOpai1zwSPkUU7_pJRoaYoEZL2g@mail.gmail.com>
X-ClientProxiedBy: YQBPR0101CA0282.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::18) To LV3PR11MB8505.namprd11.prod.outlook.com
 (2603:10b6:408:1b7::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8505:EE_|SA0PR11MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: 851368d8-a0d0-4c61-b560-08dc9c48f009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Sis2aVl2VkVqNHJqV2J6SVdjbi81NUFhZnRtL2VoRjNVSTFObURtOWY2MUR3?=
 =?utf-8?B?UEIyQ3Z4VHg5cmFWWE1zNEF0WDhIRkZYMlhjTitUbnpIZGp5WTdkUjJjNUNZ?=
 =?utf-8?B?dk9iMFJTWi9ld2VENllQcnVVcnhTRFpndnpldUN2enBiNkhDUEVxRTdNbnlF?=
 =?utf-8?B?UVZ5R1VQV0MrS3dLZ3ZzOGMrOWRoOFRFNFBNcDgxOC9BRXlTZW9KbFc1Tk8z?=
 =?utf-8?B?Tk1JdkpXa1hxYmVoY1ZLOUlyYXAycWFIczM5MUxITDNJbXA1NXpteElGUFhN?=
 =?utf-8?B?V1VWczdoc3NSTzFRTmxSN3lBWkowc01LMmxlcnlScjJkWFoweWpTYnEzaHp3?=
 =?utf-8?B?ZHB4N1oyeWx6dHlibXZGV2VPd0w3amNnRjMyQ2RldmdhY2E5T0RHWEhjTzlG?=
 =?utf-8?B?cGN6MVNuY2NpOVgzN1MyeklobzZlS2ozRzVXN0JqUVdYMTU4L3hlNlg5d2FB?=
 =?utf-8?B?OTF2SXBWM0xOYk1OK3czUkNnbURvZzlkbUV5NlhDRldBMGN1U0xNaFplYVo5?=
 =?utf-8?B?NXpvbWhIczBkakMvaTcyRW1ZOU1vYVpvTnlYdVZ4QlVtSi9nUUZVbmx1RURN?=
 =?utf-8?B?WjhsN0Q5WTRZejZxOUVYdVoyVzd1bHFobGJESDh4M3hzbWxmRjNkV0FkcWVy?=
 =?utf-8?B?YnZmWUFZbWlveHE3NVp0OXpXTEh4bUVkRkNRSUc4VjdvL29LUmp4YVE3eTRP?=
 =?utf-8?B?Tm1haDJtTStMVlVoU2VQTmhwL3lrbTkvY0pNR1lheC91ZTQyNUdTSm4wYTlU?=
 =?utf-8?B?R2E3QlFKck9uSU1SYlN3WDh3U0RZTWs5K0dYMWwwQS93b0didmFvRGFiNEdx?=
 =?utf-8?B?SDlTWDRtOUVXalFqSkRaQVlwL2tEUGNtdDNKdlpTMEdYNU9GdTRvcFF4UXcw?=
 =?utf-8?B?MndIQ3JvcHNSeUxDZmVydDJvczU2eHBmazNxM05QbGl5WFhsS3F4Z1BrYzFp?=
 =?utf-8?B?YmcwSHFaYzJFcmJza2pTYWdtUEFZb2VmL3duNUxJUkVIa3cyWDgxUm9mbVU3?=
 =?utf-8?B?K2pqTXVZQTAxbVUybFBZL1g4Q05nbXBqQno3YW1nU0tyYnpqSVpFYnc5bWRx?=
 =?utf-8?B?Vmo0MlFGSnhTSVZXVXc0ODdSVnhmRWZqUGN1M0Z6NXV5b3dGYjRHa1JuSkhK?=
 =?utf-8?B?M2doOHg0WlVNQTh4V243Sk5jZlUxZy9BWERNcTg4UkxaUDNMZ3pwQzdUYW9x?=
 =?utf-8?B?eTc2YkVQR3VzbHpXV2xPWWV6WFc4dFpuSU01YWlyT2pRb2dUbVpWWHhWMy92?=
 =?utf-8?B?REZBcFpZMXR4NEE0c2FUSHEwVE5Sam9BMTZPenF4STlQVWhBUm5TMVFZSkpt?=
 =?utf-8?B?RXVDM3hmYW5KYW1EZE5kQ2c2OHhMenlFeWpjWFQyem9rM1lNUVRmY0J6dy9R?=
 =?utf-8?B?OEJSVFhrYnJRVjBUYW9qcnNGUUhnNHVHaFZTSzlCdHMxS3JlOUdaQ1JoeXNB?=
 =?utf-8?B?dXovWjd1dkJqOG9ZcUdXSDgwOVlvUys1S3lIMWZhS2N1b0l2d0d6OEVwWk1j?=
 =?utf-8?B?NXpXd3BZNk10bzdLQXVMam9SbDJGTGpWbnpjbzFOTVN4V0hoa1Bsa1M4Sm0r?=
 =?utf-8?B?dWtTbGR0aU5hRCtPa09TZ295cHNFeVR6M2lvMHJGL25lRmY1Nm1SVldxbUoy?=
 =?utf-8?B?bmQwbW4rZGFQMUpSMFNIOWFoa214amN4SGhyVnZLSTlKdmJhOGkwd3pXdlhp?=
 =?utf-8?B?WW9SZjdUUWNSckw4T3l3aXlURFIrTStCZ1NhWHFHdmE4enFTVkdaR0RaNGN1?=
 =?utf-8?Q?fPNPwuwiWxRRIQfTAJ4Q+mmGRgCpxdxZF3Gb0SS?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8505.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bGR1RDlwR3BhZXMyWG5RNW0zdVNxRFQ5azFXeThLYlRvTzY1K3B4d09CQUVw?=
 =?utf-8?B?d1hwbHBna0wzbk1qeExlVmk2VHdrMTVhQnMxRE1XYm0xU3oxcUovb2NDSEw2?=
 =?utf-8?B?aXFrd3BPWXJiYXdTR0puZWVTSTl5b0RwUFZKRVRYWUxXYlJpemFFUXNtc2Vr?=
 =?utf-8?B?bTdGTFU2enZDK2NTSStGQkRKazBEM1FiUTIwaVN1Zi9yOVE1YktUc1A0ZTJz?=
 =?utf-8?B?aDl2T04zWDFUdWh1SzEzSmVKM1QyY3BXUHJPTW04MFlON3NyTFlvSHFYZkMz?=
 =?utf-8?B?cCs3dm5OeE8xYjJ0cmgyU1ZiQXlwYW1DWnNFVWJ2WFpMQTNEWjNiRnpibXps?=
 =?utf-8?B?ZXIzb3lNS2MrREM1SkVjYnhaY1MrM2JtczF4ejNmemVDUXBaMmFGTEttRGo3?=
 =?utf-8?B?OFVTWlFzMTdxTEJvbytPM3E4eDNCTjAzSVhhejJVYjFPWHdVc0M0NWtxT0dO?=
 =?utf-8?B?MU9GQ0w5bVZValFCdXpMQm9sTTh6Z1Qyc2o1WVJqdUw5RU1jU05uaUlNZ0pK?=
 =?utf-8?B?L0ZlVk51MzRXVklaTkZCMzNNVFRoeEtmajN2a0k3Rnd5NGdSdjZJQkZWMzFX?=
 =?utf-8?B?TkZveDBiUDdIanFZbHhtR0xobEEveWdqSHFTSS9pK1pnOGtjN3VkWjI0MnhN?=
 =?utf-8?B?MXBKaHF4eFB3ayt4OG5CcTdSbDhBRFRXMVRkNFhGdFB1R1ZsUjIwYTlKZEpQ?=
 =?utf-8?B?am9mWHNCd1VJazIxS05TUCtWMFYrUzBvZzdYNUt5UDZLV1c5Rm5ZZUloaWFG?=
 =?utf-8?B?VURGd2JydTUxZGxFQXpxWnM1TVNzRDVoVjRzUjU4bmVGVU1PbHZ6WnlRZStF?=
 =?utf-8?B?QkJVclMxSGdhVkhsdEw2TjhDN0ljNWlYQkJlaEh1MXVzWDFUcExBd2pxOUJ1?=
 =?utf-8?B?TDExd0lmYkplb0JJNlRHNXhSMWNIK3FNSFFmWkZIUWZPejdRTWpwM2ZVSmJw?=
 =?utf-8?B?ekUybno2SmNiWnJyV3hjalcwdmU2YkVvcEkxL29ucEdQUSsyMWVrZGIwV0Fw?=
 =?utf-8?B?S010cXFWYnM1M1c1Z3N3Q0pENm9vU3Q0d3JlVUJhczFsRnR6YSt4YngrSkVx?=
 =?utf-8?B?ZmpNOS9qM29VMWlCMmNSTWErcHR4aU9RU1Rja0swbHV1eVoveEs2ZjgwUU1O?=
 =?utf-8?B?OHpQYlZNazl0WTRKbUxiVXZJNHoyUDduVVQvM25CYys1NGhJcXNWN0RzYTZa?=
 =?utf-8?B?d053MmpkN045TCt4bDQwdkcxQm1qemIwMGg1bllMd2JKNENyalFOOU9DMVVK?=
 =?utf-8?B?Rno4bU1rOHozSUxsZHpSTW9tdHNvYWVYOWZ5VHlYdG5vaEdFNEpPUmQxUXAx?=
 =?utf-8?B?OHQwTkQ5THBuR3hMTTdpNzV2MG96a2gzMTNkRnRoU2paK0k3ZFY0Z3Exc2VH?=
 =?utf-8?B?TjMreDlDMjRWQk41bTd2T29wNGNxYmR3aGJ3T3ZNcEhtSGZVK3dOd0krR1lY?=
 =?utf-8?B?N05jQTRvazQwR3pkVU5ERHRLcDhUTFIybE9WUWIzbkRBcXgrKzVWYVJ2MG93?=
 =?utf-8?B?Nzd6Q213OTlLMS8xZktZdmRuR0JZVGNqQ1dTemxvM3lUUE5GVmw2T3F1clQz?=
 =?utf-8?B?L0lBdVM4ZktzV1J1VVlDcW93T1pGTmY4VzV0WHRqY3lRWk4rbVhLSVNIMllQ?=
 =?utf-8?B?alFmWG5FbDRGenBqWkRoZXV3T3YwemQ3SzZTOFAxTnU0cFNkUi9nZzFXd1NB?=
 =?utf-8?B?Wnd4Q0lFYjlUWmZaYmplaytvTFBlaFRPQ1liT1ppanE5NEtQblRXTXZrRlhP?=
 =?utf-8?B?MDZHSytTamp3Zksvc2c4Yll0K2FaT0twQktoTVYwc0gwYjhIR2RsVUx0andI?=
 =?utf-8?B?UjVDVmZDekp1Ny9ZejZaN1llQXJ1ejN1NEhVOHRza1BRNXVkVVRUSnVqNW1H?=
 =?utf-8?B?R21mcmw5aWw1N1U3T0VsS2V3NXorQjRUREtTaWR2TmdYZm9aUm1xSHYxdnlv?=
 =?utf-8?B?MkFpdkxEVFdOZlJETUZqV1ZERXhxM21rNHFUR2JPUC94VWxPZnBZUkxLSDc2?=
 =?utf-8?B?MVhDNEdmdkU0RnVlNDZZWEk3TVBrM1V3ZmxKUUsybXgxVHdrcHA1dlBPZnRW?=
 =?utf-8?B?bWhIeDhDYjBYemhRYlhXTklna09yS0lqaUxzNXZROFlEWUx1dENMSFNpWlFk?=
 =?utf-8?B?bUh1ZG5EN3JiTEF5UUhzYkFTbW9iTjkrSGZhZjBNYlBMMjhCRStzazdqWnhV?=
 =?utf-8?B?Tmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851368d8-a0d0-4c61-b560-08dc9c48f009
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8505.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 16:47:05.9385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+8JgV+QZmuNC8yMTgZ9/aAPfWI7tdmtHK8zp6qW9Pqv+Yd6fprRfpdNFWrbeOoA25eYQEhTbiQ13WWIcdg1d8uCMfej2Sr6NCRfwlb4B6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
X-Proofpoint-GUID: G0YMO3PMIb3_uZ_ire5omip_xbNGwY9h
X-Proofpoint-ORIG-GUID: EqZoSNatt0orhrIXN5pDC-Pg8F5cz7Ji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_13,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=908
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407040121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 16:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201582

--------------JIVLvXsApjoGDXrCKqi8E1GC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4645e2Bw023252

On 2024-07-04 11:21 a.m., Alexander Kanavin via lists.openembedded.org=20
wrote:
> Hello,
>
> I simply ran two independent builds, each with their own sstate. The
> host distro is not relevant, as it's been observed on yocto
> autobuilder across many different distros.
>
> I'm not sure why you insist on being able to reproduce the issue, as
> you're simply going to get the same build trees as in the tarballs I
> provided.

Hi Alex,

That's true, but it's always nicer to be able to reproduce a problem=20
locally so one can tests fixes properly.
Richard and I suggested that we at least get the distro and list of=20
packages identified so that Sundeep
could see if he can reproduce the problem independently.

You're right that it's not essential but we're also trying to avoid=20
putting too much extra
load on the autobuilders and the people who run builds there.

It's a long-standing problem that the Rust updates are done=C2=A0 and pas=
s=20
all local tests only
to fail on one or more of the YP AB systems. We'd like to understand why=20
that happens
so if you could share the info that Sundeep requested, that may help for=20
this bug and for
future Rust work as well.

Thanks,

../Randy


>
> Alex
>
> On Thu, 4 Jul 2024 at 17:13, Sundeep KOKKONDA via
> lists.openembedded.org
> <sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org>  wrote:
>> Hi Alex,
>>
>> What distro you used to reproduce the issue & what pkgs were installed=
. You used any shared sstate of Yocto?
>> With this info I will retry to reproduce the issue on my local machine.
>>
>>
>> Thanks,
>> Sundeep K.
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#201580):https://lists.openembedded.org/g/openembed=
ded-core/message/201580
>> Mute This Topic:https://lists.openembedded.org/mt/106407787/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------JIVLvXsApjoGDXrCKqi8E1GC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-07-04 11:21 a.m., Alexander
      Kanavin via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj9vSOdetOTfghRN4r9iOpai1zwSPkUU7_pJRoaYoEZL2g@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Hello,

I simply ran two independent builds, each with their own sstate. The
host distro is not relevant, as it's been observed on yocto
autobuilder across many different distros.

I'm not sure why you insist on being able to reproduce the issue, as
you're simply going to get the same build trees as in the tarballs I
provided.</pre>
    </blockquote>
    <p>Hi Alex,<br>
    </p>
    <p>That's true, but it's always nicer to be able to reproduce a
      problem locally so one can tests fixes properly.<br>
      Richard and I suggested that we at least get the distro and list
      of packages identified so that Sundeep <br>
      could see if he can reproduce the problem independently.<br>
      <br>
    </p>
    <p>You're right that it's not essential but we're also trying to
      avoid putting too much extra<br>
      load on the autobuilders and the people who run builds there.<br>
      <br>
      It's a long-standing problem that the Rust updates are done&nbsp; and&nbsp;
      pass all local tests only<br>
      to fail on one or more of the YP AB systems. We'd like to
      understand why that happens<br>
      so if you could share the info that Sundeep requested, that may
      help for this bug and for<br>
      future Rust work as well.</p>
    <p>Thanks,<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj9vSOdetOTfghRN4r9iOpai1zwSPkUU7_pJRoaYoEZL2g@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Alex

On Thu, 4 Jul 2024 at 17:13, Sundeep KOKKONDA via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:sundeep.kokkonda=windriver.com@lists.openembedded.org">&lt;sundeep.kokkonda=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi Alex,

What distro you used to reproduce the issue &amp; what pkgs were installed. You used any shared sstate of Yocto?
With this info I will retry to reproduce the issue on my local machine.


Thanks,
Sundeep K.


</pre>
        <br>
        <fieldset class="moz-mime-attachment-header"></fieldset>
        <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#201580): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/201580">https://lists.openembedded.org/g/openembedded-core/message/201580</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/106407787/3616765">https://lists.openembedded.org/mt/106407787/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------JIVLvXsApjoGDXrCKqi8E1GC--

