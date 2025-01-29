Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC8BC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 19:28:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.21311.1738178926341722603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 11:28:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4124fd2045=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50THpIfW000865
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 11:28:46 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44enwtj1mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 11:28:45 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50TJQBg6011164
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 11:28:45 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44enwtj1mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 11:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1ym7SKn6aVEctMMkVngb2kjMHQ9cPXJhcVN9cugN/rCKp/YtrhD0/4rgCJGKRjduVDOciQkA5bHNRJzb/A7D9AQW8v53hoQd1OgKgqP+eEj8AcuX8yWLk+tSKvIhY8LqENkU/P0Z0qO+2bdRWxg4SOI7L/3bzCojRKzUFSDzHqzFE9/g8rk30VqNrR+6rPc/Gxrh+CFEyBnjU9z/iKl7h0dveDlYvM7PZvGE5b/T8BMfL0UIduK3T2F+7d3C09ZDjLFKUPR9C66/+LVlOzIOrYiLvqz5VLYQcHOQ9YQZhHXFSZvac3TFCT4EUPEk3so4x/fJBpR1tOkBl/nh2vFJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsOcBGIalSJYVce64pDMWdqA1H2ASLlRJPo4UF0FN68=;
 b=GR0pzR8hTPK3svKFeaTBTXwedOkbnwhm8c5dtSeJRhPLe5tIKH2Y4xBmh+oner05wWQrw0G7PlAnOU900U+HDBnPrUIoWWRIQ4PIcL1fGsH5sfEPDUrwA9+okxSTf88gYD+ifuMOgY8e/2GyaSTDZvOcNt1uYSAd4zNw8F6rEa5AZdt2c73m7u9yW2C+7LT/8DjDF9kUWjx+wW3+9rl+1i9PZyiXzVdKQIWYuXi5xeyTnwXmKG5G5IuJV+4X3i2egkzWFiMf1+G/GqhkPkWLMlrNuwYhjCM8/0C5V0HWGEUjBXvObP/bJjnxLZp23uRsLI51BMUwXg8WthtFlNAsBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SN7PR11MB7639.namprd11.prod.outlook.com (2603:10b6:806:32a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 19:28:39 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 19:28:39 +0000
Content-Type: multipart/alternative;
 boundary="------------0G0p4taJG2mDinJtB2LNN3Ka"
Message-ID: <9bf345df-9263-4921-95f5-ba96279a7a9c@windriver.com>
Date: Wed, 29 Jan 2025 14:28:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] qemuriscv: Enable Sv39 memory address scheme by
 default
To: Yash Shinde <Yash.Shinde@windriver.com>
Cc: openembedded-core@lists.openembedded.org,
        "Ramasamy, Rajeshkumar" <Rajeshkumar.Ramasamy@windriver.com>,
        Khem Raj <raj.khem@gmail.com>, Sundeep.Kokkonda@windriver.com,
        "Hao, Kexin" <Kexin.Hao@windriver.com>,
        "He, Zhe" <Zhe.He@windriver.com>, Trevor Woerner <twoerner@gmail.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        Alistair Francis <alistair23@gmail.com>
References: <20250128101633.3664659-1-Yash.Shinde@windriver.com>
 <96981090-c00a-40cb-802c-f709450036f1@windriver.com>
 <CAKmqyKNHc0rGAAc=3cJZN+uQ8BPhSAyb96Y1+pFGt8bk=ouY6Q@mail.gmail.com>
 <a52736b6-71d1-4301-a602-096808a60209@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <a52736b6-71d1-4301-a602-096808a60209@windriver.com>
X-ClientProxiedBy: BYAPR02CA0036.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::49) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SN7PR11MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d3df3e4-4e34-4aa1-c9ab-08dd409b21f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WXVYc3ZiMnV6ZGR0WkVKMXNydmZING83WFFRY25Rc1dYNUJRRWlraDdBdFly?=
 =?utf-8?B?NnkxVEhpTmpJSWU0N0JEendYZ2NUbWZsdVhYYjFhUTI5bFQ4YXkrdHNwd0Zu?=
 =?utf-8?B?TU90WWpBNkM2LzRMMjVBcGNzQU92bEZpMzBaRUo5ZzZaZUV4MXBMbGlvZEpZ?=
 =?utf-8?B?ZXorRmV6R1F3ekhjS1VwaVJJUHZLcGFYRG9DUHZDQm5XQ0YvUnF3SHA3eVI2?=
 =?utf-8?B?VEpiUnBJdTNwbE5wU0NKM3QyU2FaMERsZWgwVGMyTDFsdWVvcmhaT2QzMEUv?=
 =?utf-8?B?ZGhYQkl4RWJkVDFoUktYT1F1UjZSOThtZ3k0VUt2QmRtcTd2d2VZa3ppUUZL?=
 =?utf-8?B?S1hTYTdUbHlzb0VpYThaRk9oaERKNXNERjFKTXVlVjJ4eXV2MmZjUjNGZnZ4?=
 =?utf-8?B?WWt2YmdxV08xcmFmU2l6QUJEMStBeENZTmNqK2VYT2NKMTRXUDN3TzRNVmM5?=
 =?utf-8?B?SE1qWFBicGNGQWJMb1dGakNrZklYWEVMM0plNzBMS1M3dURscXJBMnRySS9I?=
 =?utf-8?B?VThJRGV1Skw2dFN2Q253TW5oenhEUGtpKzVqemlOSTN3aGRmenpiVEhBTGRJ?=
 =?utf-8?B?RzFhcDdwRGkzbHpjckIvYTJvVXFLRVhsb09IMGdLbjdSMU81Q3lDZUNrc3dV?=
 =?utf-8?B?Vk1tbVo4WDhBMFdldmkyVlh6UjErQUNkVlVmOHphUHVldmZxWjVOUGFpNy93?=
 =?utf-8?B?U0lJZ09ZNmlmL2R0Y2hVUEhqR2c3MC8rM3N0Mi83OTJMdlNXRkJhWTMxK2ow?=
 =?utf-8?B?d0U5ZENGRzM2WE5CUTJpNm50VjZJS2NWa21yWlBhUlBhOTJXU1M0L0J0Y3lr?=
 =?utf-8?B?WTBJVVYvU0d5d3VLRTkwKzBneDFyeDhGODFNejdUMXhlRkhhKzF2RE85YXVG?=
 =?utf-8?B?MEZmNmFvbkJRNVhKTGF2b1FlMG9WbEx3R0xrSVdSWnFveXYrSGNWWXhXbEhl?=
 =?utf-8?B?UzZaSDlTY1hhNFVIL21pdzV5dmNpTlp0bVQrMzh0U1hEOS9zazZISXkwOFBT?=
 =?utf-8?B?Nkc4QldKM0JXaG0xVkZMRkcwL2VES2NveHRoQ1F3enB2Z2RIR29hci9jRHN1?=
 =?utf-8?B?OERLbjF2bjdrcUR6bGVpb0o1c2J0emtzYy9GTzJCcEZBd0t1UFIxNU1YK0xu?=
 =?utf-8?B?b2tmMGpCaDBXalpXREVNOXVHNzVNNGEwWjhVRDVsenBqa2hHM0EzUkFxdjNG?=
 =?utf-8?B?ZSt3bWdBSGpmWkxoL0VFNEFzWWxQQnMyRE5tZERyK3Vwa1hOZ3QrTy9nM1Qw?=
 =?utf-8?B?SUlaUVovbGxURWxpOEVSME14RHJBRlppOTNtcmZ3M1p2YW9wTFlyRFd3b2hN?=
 =?utf-8?B?RWQyVitYNEdBVXRUck1GQ3ZqcGJIMGh4L1NRck1MRjYySXRWK25BRXF5STBa?=
 =?utf-8?B?cEwycTgvZ0hzNlZoUEN6cVEyWDA0WStPaUdQM2lKcTR3RG5DUDFpdUFlSnY2?=
 =?utf-8?B?ZkxFWG1PQ2doNkkvcjlXbkhYVjBnM0h2bHh6bC8wNE5NY1dRQVFIU3FSL3ND?=
 =?utf-8?B?TWx2NEkvR3BzcTRZemtuVm1zWUdFSjlzbjFRejF0TTZRdUtYeHpUUTRDZlcx?=
 =?utf-8?B?WW5hYzBFQVY4ZTZmTk9YNGJ1MXZscFpCeUo5c1owaWRzNEQyZ09MN0FUQ0FL?=
 =?utf-8?B?NkJmamZlbHVaT0xWRDlnYU1GOVZOcXBncTF3R0lqbWJ5eW90dmxUY1FoUEhT?=
 =?utf-8?B?NEpSd1RjZFF6bEE0blJKWk5BSit6dDcydFpwS0JJaE11endlcVZkR2tqaUVr?=
 =?utf-8?B?a0ZnSUlISGVkeWtuaDZuV2xFZkNHc29JVFArV0h4N3RoM09UNjBMRFc4Njln?=
 =?utf-8?B?Y0xwaWtpbVRPWmVkcSsvQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SDU0TWJoajNad1E1QVlHNXJleE92V0VxTVRGQWh4ZDNiQkRFbjBQYnpleDk5?=
 =?utf-8?B?c09NODNyVXJsb0hxZ3JKQlBGZDVacS9KdEtvb2hsbkgyZEROaDg1MUVtamFD?=
 =?utf-8?B?LzVMNEhkNW9WUjZWV25rREcvK1BDUlJWOWY1T09sYnFqM3RBWTlKR3dXTEwx?=
 =?utf-8?B?UXpiU2pYUUVGZE5WYVJvZlJYd1V5VHl3WU9LNGhrbnhFakN1YTdua3FkeU5z?=
 =?utf-8?B?S21DRjA0eXlMSnVRNVRXbjArZ1cvMitqLy93VGY5NkJIeDVnc0k4UUZWYlVi?=
 =?utf-8?B?RlVkTjZkTCtIZWdMMXlhc3FGdU5jRjdmTVUwM1ZjSElnVVE1Q3JkMGpQZWF1?=
 =?utf-8?B?VVlLT0Jwc1RUM0FvSngxN0VFZ213QzB0NlpqQTJtYzQwSll6c2RiSDNucFQz?=
 =?utf-8?B?NFNYTW53eDkwSmo4a0p4TEx0eUU5aysvZWR0bStaQnFvSlpGNjRJbmZoRXRs?=
 =?utf-8?B?YWErWVpON2o1MitPM1lycE5mY1Bvb09SSFhoN1pPdjFmbTMwenRQeHRPRVhN?=
 =?utf-8?B?blNpWDkvSXZUZWczYjk2NWpkUXRhVkU0Z0RETG1mS3RwKzNZUnBDT0E3d1Ry?=
 =?utf-8?B?NGxOdDdBdkllem5YcHVoMTEvUCt5NFBSZm03QTFRYVNaTC9EcmZud2hqRzBi?=
 =?utf-8?B?QzFGMEdkalM1R1NTdXNGZHJzd3VHem9VcWVNVlpQaDBndG5OM0ZHbldTQ2FZ?=
 =?utf-8?B?MFkzalUxR0NEaENibjlicUcyc3hsMHQ5aHVacHd0dE9sbTQ4OXZOUDBWOHcw?=
 =?utf-8?B?dk9oSVlBVDJrcHFjZ3k1dndNQUs1dXJaVXcyTVlqblhGcHdTR21uWnN0LzZB?=
 =?utf-8?B?b09XcStMclVBbzZuN3RGRGpKZEY0aklXNjA4Q0RYYTNpNlFjcDBQY1ZUd25P?=
 =?utf-8?B?WElRRWVYVEx5WjRLMVp1WWJQQkp6TS90eUUzODdIZXN6cE5rK3I3eElqZ0p2?=
 =?utf-8?B?S09JNUJ3UGdxNmh1QlRLNWZKTndQTU5HRG84RmZnU1VyM2FhUDNDSFJnc2o2?=
 =?utf-8?B?RlArVWdNdk5wTG1xbHVxVjNJT3ZwT05tUXN4V2xOenNZMVRGd3VvV1lVTWU4?=
 =?utf-8?B?REFpdXQ0VkMzZE5GSVpHaGpuSXNQQTVSdFZzWnNDQ05OTXFqUFNIZXpoVDR4?=
 =?utf-8?B?TTNtdXFOSTVuNDlYZzV2WCtEMUtseWRSZWx2eGd2dW1TRWJzRk5KVy94ZUhi?=
 =?utf-8?B?am1ZT3hPVDkxZ1lUU052MWRkb0JBV2IyeU1ua2pCVWoxdGdnc3hTY2g5Q0xS?=
 =?utf-8?B?bzRNWlozU1ZTZlRFREQ5dlJ5Mlh6Zy9KZXJYSlppcUUrdzJRdk1JTUlGQ2lO?=
 =?utf-8?B?Snp6aDNRN29yUCswRW9mbjJheDI1NnNFd1JpWDRWaGI1MWRDM3ZORDlaM2JB?=
 =?utf-8?B?MjJwVThmZ3FyY1R0Y1BHTjJqeVN4bWIrZ1J6bmRCZHhDbGdzRUVvbEhSZjVT?=
 =?utf-8?B?ck0xV3hXaWVNZmcvV0RxMnN1Mm1WbGtGRjNuMjFtd1BJLzVDM1pXdXRETEVD?=
 =?utf-8?B?NzdnQTZyTGJsV2creElQUDRIY01PMnAzV0hHU01KWXJRbXJOc001S0h6aVBM?=
 =?utf-8?B?dDZ3SGd6VEs2MWhBeTMveFQyM2NPZVQ3YlltaU9NOElQR29kc1kvaVZlWXpm?=
 =?utf-8?B?SFZoQy83QnM4bjhqUXg3NVBQRkc5cXJqdnlNbnF5aGFRM2w5aGFQOTB6YVZz?=
 =?utf-8?B?Vy9XK2twOVY0RDhrdXFHU2FkaDQwNkZ5MDA0bkJjZWs5NXgyWmZMWHJTVFgy?=
 =?utf-8?B?a3BCdzNQcWFCTTZBaGZxU2xOcno4eXhRU0NLODhQbTkzNTltRHc1Q2syYXpT?=
 =?utf-8?B?VThmcUt6dGRBUitDdUVhUUloeHU4cDJPVDFNV2tCTXhKWkJsa0NxYjdCb3d0?=
 =?utf-8?B?TkdGTll6c0Uwek5PSm1RbU5rVkQ2VmZoUi9WTDFrbG51T3g5SkhlejRNcXhD?=
 =?utf-8?B?VU5VT3NtOWZuSnNwS1BRZThROVlQTWxhdmMzVlpVMEVMditmVmphTWtqOWlP?=
 =?utf-8?B?NmpiUWRRd2RYSklOWmtzSVRhSlZjb25ZQ3Y5aGY4R3ZNN0VjNU9KSkY2eng3?=
 =?utf-8?B?L2svUSsvT2tmK3RFc29iSnBMdmFZNjByTUpteEMwNWhTU2tpdjkzNlZ0Umdt?=
 =?utf-8?B?YWlRS2wydmw5bDBqN29DbTA0em1YOHhvTHJCTzlCazUvV1Y3YnpHdUt1VDI5?=
 =?utf-8?B?cUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3df3e4-4e34-4aa1-c9ab-08dd409b21f0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 19:28:39.1771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9AkmeEOo/oMn0iN1m+6d2BSxmCwmJHl4sx5bTfHxDJSOsInU8hAx76zzDh0au6foWsDTThMxgiaAqrDvRfYtIPIRGCgfOxxUWTsPY5exno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7639
X-Authority-Analysis: v=2.4 cv=Gou4+l1C c=1 sm=1 tr=0 ts=679a816d cx=c_pps a=GDxOUaUasxmcDRSC7gC2IA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=ToJsk-INFNMKqD7NlU0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=63kk_DafbJkA:10 a=E3k6eB6KuMJFupH31GoA:9 a=sFVL1NfuAw7jpHJx:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: WtarpEJAJS24IIgz-0Xk7a_nMR40OgmU
X-Proofpoint-ORIG-GUID: xg7V0HNK4qkl6cCbAWYuDtU1MpFoQhI3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_04,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501290151
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 19:28:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210411

--------------0G0p4taJG2mDinJtB2LNN3Ka
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50THpIfW000865

On 2025-01-29 7:12 a.m., Yash Shinde wrote:
>
>
> On 29-01-2025 06:08, Alistair Francis wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>>
>> On Wed, Jan 29, 2025 at 1:51=E2=80=AFAM Randy MacLeod via
>> lists.openembedded.org
>> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>>> Add Raj, Khem, Kexin and Zhe who know more about RISC-V than I do.
>>> Kexin and Zhe are on holiday for a week or more.
>>> CC a few people who have contributed to riscv* conf.
>>>
>>> I am not all that familiar with either qemu internals or riscv specif=
ications so any input is appreciated.
>>>
>>> I have some comments and questions below.
>>>
>>> On 2025-01-28 5:16 a.m.,Yash.Shinde@windriver.com wrote:
>>>
>>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>>
>>> Currently, GCC Asan supports only Sv39 on RISC-V due to custom alloca=
tor configurations optimized for large allocations.
>>> These configurations are incompatible with larger address spaces like=
 Sv48/Sv57.
>>> This fix enables RISC-V's configuration for Sv39 by default when runn=
ing `runqemu nographic`,
>>> eliminating the need for manual configuration via command line flags =
(`qemuparams=3D"-cpu rv64, sv39=3Dtrue"`).
>>>
>>> Fixes [YOCTO #15691]
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15691
>>>
>>> Reference:https://git.openembedded.org/openembedded-core/commit/?id=3D=
4b4450ff695ef73bf7a2437e142d2e0730d6a547
>>>
>>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>>> ---
>>>   meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/con=
f/machine/include/riscv/qemuriscv.inc
>>> index d01d988eee..6170ce65f2 100644
>>> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
>>> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
>>> @@ -27,6 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D "0x80200000"
>>>   # qemuboot options
>>>   QB_SMP ?=3D "-smp 4"
>>>   QB_KERNEL_CMDLINE_APPEND =3D "earlycon=3Dsbi"
>>> +QB_CPU =3D "-cpu rv64, sv39=3Dtrue"
>>>
>>> Thanks Yash.
>>>
>>> To save everyone from doing the math, sv39 gives the system 512 GB vi=
rtual address space.
>>>
>>> Should we use the ?=3D operator here so that users can easily overrid=
e this specification
>>> just as is done for  QB_SMP two lines above?
>>>
>>> Please summarize what testing you did.
> I tested a buffer overflow case for asan by booting qemuriscv64 and=20
> using the command "runqemu nographic",
> without passing any additional qemu parameters, as mentioned in the=20
> follow-up message to the patch:
> https://lists.openembedded.org/g/openembedded-core/message/210317
>>> Did you test with TCLIBC=3Dmusl ?
> Musl builds for asan are still broken as mentioned earlier in=20
> "gcc-sanitizers.inc" :
> /
> # musl is currently broken entirely
> COMPATIBLE_HOST_libc-musl =3D 'null'/
>
> http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtool=
s/gcc/gcc-sanitizers.inc#n88
>
> When built with TCLIBC=3D"musl", following error is seen:/
> "gcc-sanitizers RPROVIDES libasan but was skipped: incompatible with=20
> host riscv64-poky-linux-musl (not in COMPATIBLE_HOST)"/
>>> Since you are changing qemuriscv.inc you and the YP AB should test qe=
muriscv32 and qemuriscv64.
>>> qemuriscv32 should, if I'm understanding how this works, be unaffecte=
d since it has to use sv32 mode.
> As mentioned in the below gcc mailing list, risc-v 32 does not=20
> officialy support GCC's ASan and some of other 32-bit targets. So,=20
> this should not affect it.
> https://gcc.gnu.org/pipermail/gcc-patches/2020-October/557406.html
>
>
> Also, there is no compatible host for riscv-32 in gcc-sanitizers.inc:
> https://git.openembedded.org/openembedded-core/commit/?id=3D7d90d2a70f0=
184ad715e9917d3e7aa096cf98f79
>
> Note: While testing this I found that the "-cpu rv64, sv39=3Dtrue" also=
=20
> passes when building for risc-v 32.
> I will send a V2 where it only applies to risc-v 64.
>

Thanks for duplicating and explaining your testing. I noticed your test=20
email after I had replied
to the main thread because you didn't CC me on the testing email. Oops=20
... on both our parts.

Anyway, this started out being about just GCC ASan but if you're=20
changing qemu's config,
you'll have to build that emulator and use it a bit before sending in=20
v2.=C2=A0 Perhaps run the full
GCC test suite and say openssl's ptests. The rest of the ptest will=20
likely be run as part of the YP AB
testing.



>>> Did you find out why sv39 isn't the default for qemu?
>> QEMU defaults to the max supported SATP mode. I'm not sure there is a
>> specific reason, that's just what we have always done since we allowed
>> a user to specify the SATP mode.
> Supporting to the above comments, here is the commit that allows users=20
> to specify the SATP mode
>
> https://github.com/qemu/qemu/commit/6f23aaeb9be13d4a26b7f863533c3161054=
81640
>
> It seems that Risc-V has multiple sizes for addressable memory and=20
> Linux probes for the machine's support at startup.
> Thus, the reason would be to give the flexibility to users to set it=20
> rather than having a fixed default SATP mode.
> The authors/reviewers of the commit can put more light on this topic.
>
>>> If not, please check the git history and it there isn't an answer the=
re, ask one of the qemu developers
>>> who work on risc-v. It would be nice to have a sentence about that in=
 the commit log.
>>>
>>> Did you consider a different RISC-V cpu sub-arch such as rva22s64 ?
>> I think defaulting to a profile (RVA22S64) would be the way to go,
>> that will also enable a known set of extensions.
>>
>> Alistair
>>
>>>     https://github.com/qemu/qemu/commit/3ba8462c4ca55720239fdc6fa30b9=
870d22a8814
>>>
>>> I'm only asking because it seems like it might be a good fit for us a=
nd I noticed it when
>>> searching the qemu commit logs looking for sv39.
> I added=C2=A0 "-cpu rv64,sv39=3Dtrue" options for risc-v by default as=20
> mentioned in the bug requirements.
>
> The support for RVA22S64 looks good to have=C2=A0 provided that it does=
n't=20
> break other risc-v builds/tests being done in Yocto.
> Following commit adds the RVA22S64 profile and corresponding=20
> extensions in qemu.
> https://github.com/qemu/qemu/commit/af651969eb23ecf018bcaa8e0761b58425d=
e550c
>
> <https://github.com/qemu/qemu/commit/af651969eb23ecf018bcaa8e0761b58425=
de550c>I=20
> also tested with passing /"QB_CPU =3D "-cpu rv64i, rva22s64=3Dtrue"" /i=
n=20
> /qemuriscv.inc/ file and asan works with that as well.


Good.



> I will send a V2 with setting "rva22s64" profile for risc-v 64 only as=20
> follows:
>
> */QB_CPU:riscv64 ?=3D "-cpu rv64, rva22s64=3Dtrue"/
> *


Using the weak operator "?=3D" to allow overrides seems like a good choic=
e=20
at least for now.

Do you really need both
 =C2=A0=C2=A0 "-cpu rv64, rva22s64=3Dtrue"
rather than just:

 =C2=A0=C2=A0 "-cpu rva22s64"

?

Remember, I don't know much about the qemu internals so maybe this is=20
obvious to you.

../Randy



> **
>
> Regards,
> Yash
>>> ../Randy
>>>
>>>
>>>
>>>
>>>   QB_MACHINE =3D "-machine virt"
>>>   QB_DEFAULT_BIOS =3D "fw_jump.elf"
>>>   QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,do=
wnscript=3Dno"
>>>
>>>
>>> --
>>> # Randy MacLeod
>>> # Wind River Linux
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#210329):https://lists.openembedded.org/g/openembe=
dded-core/message/210329
>>> Mute This Topic:https://lists.openembedded.org/mt/110856569/3619028
>>> Group Owner:openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub =
[alistair23@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

--=20
# Randy MacLeod
# Wind River Linux

--------------0G0p4taJG2mDinJtB2LNN3Ka
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50THpIfW000865

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-01-29 7:12 a.m., Yash Shinde
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:a52736b6-71d1-4301-a602-096808a=
60209@windriver.com">
     =20
      <p><br>
      </p>
      <div class=3D"moz-cite-prefix">On 29-01-2025 06:08, Alistair Franci=
s
        wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:CAKmqyKNHc0rGAAc=3D3cJZN+uQ8B=
PhSAyb96Y1+pFGt8bk=3DouY6Q@mail.gmail.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes =
from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Wed, Jan 29, 2025 at 1:51=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy.macleod=3Dwindriv=
er.com@lists.openembedded.org">&lt;randy.macleod=3Dwindriver.com@lists.op=
enembedded.org&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">Add Raj, Khem, Kexin and=
 Zhe who know more about RISC-V than I do.
Kexin and Zhe are on holiday for a week or more.
CC a few people who have contributed to riscv* conf.

I am not all that familiar with either qemu internals or riscv specificat=
ions so any input is appreciated.

I have some comments and questions below.

On 2025-01-28 5:16 a.m., <a class=3D"moz-txt-link-abbreviated" href=3D"ma=
ilto:Yash.Shinde@windriver.com">Yash.Shinde@windriver.com</a> wrote:

From: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash.=
Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

Currently, GCC Asan supports only Sv39 on RISC-V due to custom allocator =
configurations optimized for large allocations.
These configurations are incompatible with larger address spaces like Sv4=
8/Sv57.
This fix enables RISC-V's configuration for Sv39 by default when running =
`runqemu nographic`,
eliminating the need for manual configuration via command line flags (`qe=
muparams=3D&quot;-cpu rv64, sv39=3Dtrue&quot;`).

Fixes [YOCTO #15691]
<a class=3D"moz-txt-link-freetext" href=3D"https://bugzilla.yoctoproject.=
org/show_bug.cgi?id=3D15691">https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D15691</a>

Reference: <a class=3D"moz-txt-link-freetext" href=3D"https://git.openemb=
edded.org/openembedded-core/commit/?id=3D4b4450ff695ef73bf7a2437e142d2e07=
30d6a547">https://git.openembedded.org/openembedded-core/commit/?id=3D4b4=
450ff695ef73bf7a2437e142d2e0730d6a547</a>

Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/ma=
chine/include/riscv/qemuriscv.inc
index d01d988eee..6170ce65f2 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -27,6 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D &quot;0x80200000&quot;
 # qemuboot options
 QB_SMP ?=3D &quot;-smp 4&quot;
 QB_KERNEL_CMDLINE_APPEND =3D &quot;earlycon=3Dsbi&quot;
+QB_CPU =3D &quot;-cpu rv64, sv39=3Dtrue&quot;

Thanks Yash.

To save everyone from doing the math, sv39 gives the system 512 GB virtua=
l address space.

Should we use the ?=3D operator here so that users can easily override th=
is specification
just as is done for  QB_SMP two lines above?

Please summarize what testing you did.</pre>
        </blockquote>
      </blockquote>
      I tested a buffer overflow case for asan by booting qemuriscv64
      and using the command &quot;runqemu nographic&quot;, <br>
      without passing any additional qemu parameters, as mentioned in
      the follow-up message to the patch:<br>
      <a href=3D"https://lists.openembedded.org/g/openembedded-core/messa=
ge/210317" class=3D"moz-txt-link-freetext" moz-do-not-send=3D"true">https=
://lists.openembedded.org/g/openembedded-core/message/210317</a>
      <blockquote type=3D"cite" cite=3D"mid:CAKmqyKNHc0rGAAc=3D3cJZN+uQ8B=
PhSAyb96Y1+pFGt8bk=3DouY6Q@mail.gmail.com">
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">Did you test with TCLIBC=
=3Dmusl ?</pre>
        </blockquote>
      </blockquote>
      Musl builds for asan are still broken as mentioned earlier in
      &quot;gcc-sanitizers.inc&quot; :<br>
      <i><br>
        # musl is currently broken entirely <br>
        COMPATIBLE_HOST_libc-musl =3D 'null'</i><br>
      <a href=3D"https://git.openembedded.org/openembedded-core/commit/?i=
d=3D7d90d2a70f0184ad715e9917d3e7aa096cf98f79" class=3D"moz-txt-link-freet=
ext" moz-do-not-send=3D"true"><br>
http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/=
gcc/gcc-sanitizers.inc#n88<br>
      </a><br>
      When built with TCLIBC=3D&quot;musl&quot;, following error is seen:=
<i><br>
        &quot;gcc-sanitizers RPROVIDES libasan but was skipped: incompati=
ble
        with host riscv64-poky-linux-musl (not in COMPATIBLE_HOST)&quot;<=
/i>
      <blockquote type=3D"cite" cite=3D"mid:CAKmqyKNHc0rGAAc=3D3cJZN+uQ8B=
PhSAyb96Y1+pFGt8bk=3DouY6Q@mail.gmail.com">
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">Since you are changing q=
emuriscv.inc you and the YP AB should test qemuriscv32 and qemuriscv64.
qemuriscv32 should, if I'm understanding how this works, be unaffected si=
nce it has to use sv32 mode.</pre>
        </blockquote>
      </blockquote>
      As mentioned in the below gcc mailing list, risc-v 32 does not
      officialy support GCC's ASan and some of other 32-bit targets. So,
      this should not affect it.<br>
      <a href=3D"https://gcc.gnu.org/pipermail/gcc-patches/2020-October/5=
57406.html" class=3D"moz-txt-link-freetext" moz-do-not-send=3D"true">http=
s://gcc.gnu.org/pipermail/gcc-patches/2020-October/557406.html</a>
      <p><br>
        Also, there is no compatible host for riscv-32 in
        gcc-sanitizers.inc:<br>
        <a href=3D"https://git.openembedded.org/openembedded-core/commit/=
?id=3D7d90d2a70f0184ad715e9917d3e7aa096cf98f79" class=3D"moz-txt-link-fre=
etext" moz-do-not-send=3D"true">https://git.openembedded.org/openembedded=
-core/commit/?id=3D7d90d2a70f0184ad715e9917d3e7aa096cf98f79<br>
        </a><br>
        Note: While testing this I found that the &quot;-cpu rv64, sv39=3D=
true&quot;
        also passes when building for risc-v 32.<br>
        I will send a V2 where it only applies to risc-v 64.<br>
      </p>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks for duplicating and explaining your testing. I noticed
      your test email after I had replied<br>
      to the main thread because you didn't CC me on the testing email.
      Oops ... on both our parts.</p>
    <p>Anyway, this started out being about just GCC ASan but if you're
      changing qemu's config,<br>
      you'll have to build that emulator and use it a bit before sending
      in v2.&nbsp; Perhaps run the full<br>
      GCC test suite and say openssl's ptests. The rest of the ptest
      will likely be run as part of the YP AB<br>
      testing.</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:a52736b6-71d1-4301-a602-096808a=
60209@windriver.com">
      <p> </p>
      <blockquote type=3D"cite" cite=3D"mid:CAKmqyKNHc0rGAAc=3D3cJZN+uQ8B=
PhSAyb96Y1+pFGt8bk=3DouY6Q@mail.gmail.com">
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">Did you find out why sv3=
9 isn't the default for qemu?
</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">QEMU defaults to the max s=
upported SATP mode. I'm not sure there is a
specific reason, that's just what we have always done since we allowed
a user to specify the SATP mode.</pre>
      </blockquote>
      Supporting to the above comments, here is the commit that allows
      users to specify the SATP mode<br>
      <p><a href=3D"https://github.com/qemu/qemu/commit/6f23aaeb9be13d4a2=
6b7f863533c316105481640" class=3D"moz-txt-link-freetext" moz-do-not-send=3D=
"true">https://github.com/qemu/qemu/commit/6f23aaeb9be13d4a26b7f863533c31=
6105481640<br>
        </a></p>
      <p>It seems that Risc-V has multiple sizes for addressable memory
        and Linux probes for the machine's support at startup.<br>
        Thus, the reason would be to give the flexibility to users to
        set it rather than having a fixed default SATP mode.<br>
        The authors/reviewers of the commit can put more light on this
        topic.<span style=3D"white-space: pre-wrap">
</span></p>
      <blockquote type=3D"cite" cite=3D"mid:CAKmqyKNHc0rGAAc=3D3cJZN+uQ8B=
PhSAyb96Y1+pFGt8bk=3DouY6Q@mail.gmail.com">
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">If not, please check the=
 git history and it there isn't an answer there, ask one of the qemu deve=
lopers
who work on risc-v. It would be nice to have a sentence about that in the=
 commit log.

Did you consider a different RISC-V cpu sub-arch such as rva22s64 ?
</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">I think defaulting to a pr=
ofile (RVA22S64) would be the way to go,
that will also enable a known set of extensions.

Alistair

</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">   <a class=3D"moz-txt-l=
ink-freetext" href=3D"https://github.com/qemu/qemu/commit/3ba8462c4ca5572=
0239fdc6fa30b9870d22a8814">https://github.com/qemu/qemu/commit/3ba8462c4c=
a55720239fdc6fa30b9870d22a8814</a>

I'm only asking because it seems like it might be a good fit for us and I=
 noticed it when
searching the qemu commit logs looking for sv39.</pre>
        </blockquote>
      </blockquote>
      I added&nbsp; &quot;-cpu rv64,sv39=3Dtrue&quot; options for risc-v =
by default as
      mentioned in the bug requirements.<br>
      <br>
      The support for RVA22S64 looks good to have&nbsp; provided that it
      doesn't break other risc-v builds/tests being done in Yocto.<br>
      Following commit adds the RVA22S64 profile and corresponding
      extensions in qemu.<br>
      <a href=3D"https://github.com/qemu/qemu/commit/af651969eb23ecf018bc=
aa8e0761b58425de550c" moz-do-not-send=3D"true">https://github.com/qemu/qe=
mu/commit/af651969eb23ecf018bcaa8e0761b58425de550c<br>
        <br>
      </a>I also tested with passing <i>&quot;QB_CPU =3D &quot;-cpu rv64i=
,
        rva22s64=3Dtrue&quot;&quot;&nbsp; </i>in <i>qemuriscv.inc</i> fil=
e and asan
      works with that as well.<br>
    </blockquote>
    <p><br>
    </p>
    <p>Good.&nbsp;</p>
    <br>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:a52736b6-71d1-4301-a602-096808a=
60209@windriver.com">I
      will send a V2 with setting &quot;rva22s64&quot; profile for risc-v=
 64 only
      as follows:<br>
      <br>
      <b><i>QB_CPU:riscv64 ?=3D &quot;-cpu rv64, rva22s64=3Dtrue&quot;</i=
><br>
      </b></blockquote>
    <p><br>
    </p>
    <p>Using the weak operator &quot;?=3D&quot; to allow overrides seems =
like a good
      choice at least for now.<br>
    </p>
    <p>Do you really need both <br>
      &nbsp;&nbsp; &quot;-cpu rv64, rva22s64=3Dtrue&quot;<br>
      rather than just:<br>
    </p>
    <p>&nbsp;&nbsp; &quot;-cpu rva22s64&quot; <br>
    </p>
    <p>?<br>
    </p>
    <p>Remember, I don't know much about the qemu internals so maybe
      this is obvious to you.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p></p>
    <blockquote type=3D"cite" cite=3D"mid:a52736b6-71d1-4301-a602-096808a=
60209@windriver.com"><b>
      </b><br>
      <br>
      Regards,<br>
      Yash<br>
      <blockquote type=3D"cite" cite=3D"mid:CAKmqyKNHc0rGAAc=3D3cJZN+uQ8B=
PhSAyb96Y1+pFGt8bk=3DouY6Q@mail.gmail.com">
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">../Randy




 QB_MACHINE =3D &quot;-machine virt&quot;
 QB_DEFAULT_BIOS =3D &quot;fw_jump.elf&quot;
 QB_TAP_OPT =3D &quot;-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,do=
wnscript=3Dno&quot;


--
# Randy MacLeod
# Wind River Linux


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#210329): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/210329">https:/=
/lists.openembedded.org/g/openembedded-core/message/210329</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/110856569/3619028">https://lists.openembedded.org/mt=
/110856569/3619028</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:alistair23@gmail.com">alistair23@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------0G0p4taJG2mDinJtB2LNN3Ka--

