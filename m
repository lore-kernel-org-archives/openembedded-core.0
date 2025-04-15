Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD746C369BA
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 15:58:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.23915.1744732694215457518
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 08:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6200f38ec5=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8gcpo007451
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 08:58:14 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ykf3kg34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 08:58:13 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53FFwD8N015025;
	Tue, 15 Apr 2025 08:58:13 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ykf3kg33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 08:58:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRIl25Y2IM0c9TE/I5B5yjx4IqekP4fj58BmzD3zyKKsOoMDTixs6BWY4pb2xc7zWLA9POAkKd2dCaC0XmzdrO7uThO4i8X35l1H8Vly2UZ+dEIma9tqQUohjouUOwMVEURfzKn8BEwQhd9yyUESRSrsMbKn3EM/apZPdGzHH/wjzfSYAmanqFRN+fL0+wApfjfotJgL6KWRwuXoFjNxSba7fUMajMW0dZMzHVSxYyv+1C+mAav6RAqBO8MKtzyYpClSLPFEkLslgtXdOsU5ORmeGZ8QdW5hkGh1GliM9bOE6EIdYiCVZv6x6fcQ69LEmsyc1CVmjqekVlvg/TbtYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1EVKhTJEfRjpNEIM1j4m3mWH17IN0BxdinEAgRWG0k=;
 b=xoLrkeoVioFVjU2fnNmEaal7lXueHkn9yYjWH3YxIizJjYcWYcdTz+rlJAXv5Bvu8hrqLXQJRVjKmo6GN+tqBHW2FRjGrbCK25q9UALoz/I0FfxNNElWhJEnLxGB4SWg+YbldE4xOUGPhYFb2U8aO+yp3oPVQBa6we8NMvKEmreV3N+ZfGO7us8DIfv0NYmG3QFNqUtcwnJ0+UK/qCNKXnxaKwmocZKu0LPUpEbsR6Zm/e/bHzDdicnDvB/PQXNA7A0kUxPQBebF/EkHzQHqOd3qG+FEDRkGqa3WZxN7EPEyLCUmQeYMwtW5uad3CJWSqHwjqiqB4JQYP9R/FFuT3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Tue, 15 Apr
 2025 15:58:08 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 15:58:08 +0000
Message-ID: <9b56919f-9c04-460c-8dde-363cadd1b25b@windriver.com>
Date: Tue, 15 Apr 2025 21:28:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/3] rust: Upgrade 1.84.1->1.85.0
To: Martin Jansa <martin.jansa@gmail.com>
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org,
        Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250331055424.1978243-1-Yash.Shinde@windriver.com>
 <20250331055424.1978243-2-Yash.Shinde@windriver.com>
 <CAMKF1sowYqhv29_Him+th4PkxvGG2FkEzeWmM3fgYzUeKpHqSQ@mail.gmail.com>
 <CA+chaQcn9EfvFMSEmBPnCu3duzwY=cNXzwXVGPBNSP7n-9SduQ@mail.gmail.com>
 <1d01500d-39e2-4578-9fc0-b8c7c231e6d9@windriver.com>
 <CA+chaQf_eWJgp9QVKQQ9iGviZU54Zc_1h-LyWW2yurWf06zCLA@mail.gmail.com>
 <16187529-d92e-4cac-b900-bafe8d603c73@windriver.com>
 <CA+chaQfvUii4KyMTgD4+RvHkQF9Tf0_jpym0UC8dkKupfhscjg@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CA+chaQfvUii4KyMTgD4+RvHkQF9Tf0_jpym0UC8dkKupfhscjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::18) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SJ0PR11MB4845:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a768d6f-701a-4c47-76ee-08dd7c3650dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QytsSVR3L3Rrd3A3NEovU3NQRm5VZkt3QndLNGNyU1lLYXQveUYxdjZkUURq?=
 =?utf-8?B?Tm9XYnE0ODFjK3NScFE0M3p5TmtERlM3d1RPUUlYM1JZeDcxeVZERWJTZFlR?=
 =?utf-8?B?RTBKbXJXV25ydTd5eHBLek45cmx2amNXVGJYd3BYZVpTQ0V5YlhERGhwbWEr?=
 =?utf-8?B?ckErWm02ZERXSG5palV0aWwweTNqMi9ESkM1d1FKZkFWTE12a3NDbkp6R2xX?=
 =?utf-8?B?MzBXeGhPZkxWeUF1bDFDNjZpVTlQV3V0R2JNN1lQQWcyNWliYWdHUDN0dHJ0?=
 =?utf-8?B?WTZUcTJzSU43ZGExWW9nZzloc1hVZXhPTnNRd3YzNWZzcU1IaUpHV08wejU1?=
 =?utf-8?B?a2VWU1g0Vy8yTlp0MUFKdEhsNkpMbWQyc1JVaW81MlpkcXRaM1BISnhaZHg5?=
 =?utf-8?B?SUw3WU1aQzB4NW5GZzZvdFZKMkoyWXlTTlUzZVBpeFhhUFVFdVdDaTBTdEc1?=
 =?utf-8?B?YWpQSng1d3R6dUVqTlBQczFvTDJIbTBsOHMyeEE2R2wvVnU2bVlWKzdobEJL?=
 =?utf-8?B?R0pYRVNJZHJLdU41cDk4aWhqK2xNWHB1MjFTaXB0ZDZTUHJFTnd6Mk9NU1BU?=
 =?utf-8?B?WE9HSk5vRVJwRGdEeWMxQXlwYlZYYWxYcnkrTnFiaVZIUHdBWXhnVmtIRVZY?=
 =?utf-8?B?NXhBc1pHN0dzaW9YcDZISkNTamhlK0ZYdHEvNmZ3QWlpeGdacC9wU1hZZnR0?=
 =?utf-8?B?MVBOVlpCV1ZEK1drZXFoMGRhbmZPRjVWZDlZK09icEV2L05CK2w3a3VwMkho?=
 =?utf-8?B?UW1CcWI3VHdrblJ1c3hRWkdsUER4MXcwSWNXL0Z1Y041TWVuR1pIVno5NFZo?=
 =?utf-8?B?NHEwR09xTFZJWE5GU3FPemx5RXQ5Y0dML3hJMjRqSWxYT3d2Qmk3UXBCaHc1?=
 =?utf-8?B?Um51YU9rUXVVMHFCZEdvYVFVSUVSdm03Y0FWTUhoOXJrMW5uWEVwVENZN2Yw?=
 =?utf-8?B?Zm9LYU9aV1ZSaFJ0MDQrVXN5VFFNTlpGekZNa2RzWnJORk50emp5NnJXRUxS?=
 =?utf-8?B?cGhMaTB0bU8yNERlU1BiMk9LSHllQy9GMklLTXdiWDlhK1ZMcWRhek50a1Y4?=
 =?utf-8?B?OFd5ejROYkRuek9yY1ZUbXlsWmlYRkFmZEtXWGlsSGNkeXZmbklZdG1nUS90?=
 =?utf-8?B?N2w4cjRQZXZhQTMyTDE5U2NqNW5OTUtOckE5SzBsZTVFZlVraERxOXhQMWxO?=
 =?utf-8?B?YzNlVTZvMHIyczlsQXg3RWs1V2F6QVZiRDJsUHN6SDJZcm5UQXE0WGtWZTNr?=
 =?utf-8?B?OFFCNXAwZlJjVFkwS3FiMHp4a3NIYmp5YllnR0U2SG9OTGo3bm1NSk5xZis4?=
 =?utf-8?B?TkgzOTV4QXJRRzlndnYva0JZRDBFc0QxQndDQ0w0YiswVU41QWcvMnVncUhY?=
 =?utf-8?B?Ujd3dTVHV0wxVSsrQ1FmTXZBRTM2MVFHU0lHZXNDODlhbFQ5TTQrbWlRM1lO?=
 =?utf-8?B?eDJQcXlHajA4K1RLajEwSlFwS2h5R2ptMHlIQkhNZDFJYVZJNjhMdC9ZalpD?=
 =?utf-8?B?Tk9vRVR6aEJGNFlWeHBmUWROVHkzMll0bkExdDBWT2tLdjRORXBQOHNnQWlp?=
 =?utf-8?B?SFFrQzhscDFuT2x3emJkWE9odWIyQjROZmNCd3BnMDJ1WmJrTFd5Z3hyUnNY?=
 =?utf-8?B?dWE4d2s5SkFCcG5UWC93VjdpVjhjWWhVR1RoKzArU2cva1RyenhRSEgzZjF2?=
 =?utf-8?B?cnJUOVlHTzFOYzVPTXEwRHczWG9ZTjhqTmZmcTJTYkFpS3RuNnVHZVpOUkJX?=
 =?utf-8?B?WlcyWXpxaG1rTS9yZHc2cXJ2MXQvenZvNnNTRkxjQVdFc2duTnRCeG55eFc5?=
 =?utf-8?B?QUJBK05kQnBOdmd3TlFYWHJyQ0x2ZVJ4TGE3VW1wL3drVHdtREdPQlU1ZGdB?=
 =?utf-8?Q?BIlaIFezbtgG8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MWM2Vi9GdHZCZ1crb3RtSWE4cU0rekJFS3IrQkFmYTR6bnl1cy9ubm5sNDhI?=
 =?utf-8?B?OExpR0ZzMDFhSS95c1gyeVpJeWlPU2FNbCtuUGZkRktRWlNUSFljT2JZUHZB?=
 =?utf-8?B?WVRudFlXbnNHaUhSaTJpeDdMMmpEa3VWMjFaTElNdjNqVnFzSWVGUHBHeW9T?=
 =?utf-8?B?TWRDRlVROFBEL0NYRURYdUs3dkZIaVhlbjFUay8vMUhuWVAzRTdQRWlFbG9V?=
 =?utf-8?B?a0NUcnpDQXI0eG5YcUxQYldidzVTK2NvWjFvTERCVUJxM21MVks3clVUQUhG?=
 =?utf-8?B?amdrcDJtaHRQUFdyQ2RoWE5qWGdHTXhTQzFrcjB2elBGQVY5ZXdQNEdqcFRy?=
 =?utf-8?B?ZTFWZzJtU21JL2lNL2xZNHRUdVo2MXcxeE9CbTdKWVU2eDNuRHZnM0w3RnVD?=
 =?utf-8?B?MUVaREFrcU9oYndEcnRxS1V3MG1ZZ2dpRGdUdmxSV0tSOXBKZmYrczBHMHVt?=
 =?utf-8?B?VERJSUxEWlVBRVN4cnRMSzR2TmV6ejVSdzByWUtsVmRuYnhaSysvTVR6WGFV?=
 =?utf-8?B?RUxpejJrdWZNcUFPVlBDLzQ2dzlRbmZEbjVYbjNHeVJDSCt0YXF1STB6TUJ0?=
 =?utf-8?B?b3hZMDJkRmFYcTQ3bE5MVzFSSnl2d2NCbmxrOEw2blQ5NUttb2tWWDBydnQ4?=
 =?utf-8?B?d2svemNyRTBscW5VdjZFYU52OG0rcnFzcXdHbFg3dFdzMVJVWlRVZW9tY01O?=
 =?utf-8?B?RnF2d3IrYUtVWXFtelU0OHJMQWhEODhhVE5wejEzZjcvUXRKZWFIeHgvTGhB?=
 =?utf-8?B?L21pQ3B5VWlPeklmL3FGS0tLeVQ0NGtaNzBvZ2tkMHJWdEhzV1M3RHFCVkQy?=
 =?utf-8?B?Y0ZHWUtDcE93TVhMU3NYOU1JdnMrL0c0cXl4TnJsM2V2bGxqd1ZtSUpuN0xW?=
 =?utf-8?B?WkZBTFdFUHlBT21LTE8rb25BRmpQRGFoYVNBUUxSNUNqOVZaZjRIdE0wd2hq?=
 =?utf-8?B?RmM2TEJuclViQnM0SDlXOGpzMHRTRUcwZmQ4YUwrVFNIWUkxc00vc3I0WE96?=
 =?utf-8?B?M2Z0L0FUK25BWkJlWWRtMVV4ZEFxcDFQRElMTXRPNitQTTRBQ25CalorQ2JK?=
 =?utf-8?B?WEZORFZHcUhCZnJ3K0htZGxXR1ZzaERMWlpMMm9yUUw1MER6YVBPMlRlWUtF?=
 =?utf-8?B?enNNcnJsWUF4NGd3a1hackovWU9ZTFZyNlZycTBvOHdJZGxMZjB6aENPY1pL?=
 =?utf-8?B?Q3ZhOTRzVGFqRTFSREtuM3FkTmczNVdzeC9QV0hJQ05mUTZkQlhKem9FdE9v?=
 =?utf-8?B?NVhLcVRjYWNuRVo4LzdLaFN1OXpmRzJOZzV2RWl4YmdjQUhtNmFjZ1pEa1Vy?=
 =?utf-8?B?WFcwblRoU0lsVzZDTjJKSUFxWDhBTGZzSGFUMCtNZ1FBMXpWMFNac0R4OXlU?=
 =?utf-8?B?V3Q0VHJJVlNybC83cU11eW1XZVFrOHZxZnR2Zm9QOEcwaTNucGFGbmJiZ0hN?=
 =?utf-8?B?Q3Q0NFZ6OGRocnJhNHNSZXl0b3p4TlM3YVc5Wk1mby83K29vQlppeFhNd0c1?=
 =?utf-8?B?S2lSK1NSejBrREpRTEQ1cC9icVJBblhkVmFjTVg3QnFKbEExYUhTbWM1UUJL?=
 =?utf-8?B?T092TXF3Y2RKYUphK3ZUMmZmdm5qUnBSVjBjWW95bUx6aHpxZ00vMEJmcjJJ?=
 =?utf-8?B?RkpoM0JETWs1NHA3Vy9jSEh6N1pQb3dtMFI2ZVVOVHRPK3BWc2NneUFXUXhV?=
 =?utf-8?B?REY3VlQ2SWxwa2IwQmxxRlBnUnBGR1R1V1VnU0p1cE5OMlNaTFMrZEpMdDlj?=
 =?utf-8?B?T0hlTEgrK041anl5MGttMmErUlZmYzZHUzdET0czdldtMGVFYitZamNLRHNO?=
 =?utf-8?B?YnlYU0Y4bjFIYXdia1B5eUo5eC9NRU1BNlZBakdNZ3NFV3dVUWc4ZzkyZmpJ?=
 =?utf-8?B?bkJ2Rk5RODIzaXQ5QU54eHVKd3M4bURSbW5GNEw1VHhtMUR4TC8zaDJMdzdu?=
 =?utf-8?B?VDFaOWtWSDAzRllrcytPeXc1b21RUFB1WkF0Y2l4aHlZYy94SkJYMFhIT3lO?=
 =?utf-8?B?OFpWTk02UFJYZTZVN0tueDJzV29kODZIOWcyWGMxeFBNenE1YURObDdUdGxj?=
 =?utf-8?B?V0d2SEZEMTZrZDkzdHV0RkVrR2RseEJQbmxka05rVUV5RWlDcTlRanZwanFt?=
 =?utf-8?B?NnlabDNCdHJqRkhKZUlaS0pxVEVOYWg4em4wUnh6YW1sWnhCSzFHbitWYXYv?=
 =?utf-8?B?aVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a768d6f-701a-4c47-76ee-08dd7c3650dd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 15:58:08.4863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csUwcu+Eq5vPN6u/1cqQpzO7LJsnXya61uq4M7kS3GA3SqBMHatwM8DCtCDzwyF94l9gGNbDh1107NZtCFUFlmhk9a61dGM6eDeDB1wqCCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
X-Proofpoint-ORIG-GUID: Ymw7cx_iMOaOgl-qbI_QIl_c-FSJ28QD
X-Authority-Analysis: v=2.4 cv=Wd0Ma1hX c=1 sm=1 tr=0 ts=67fe8215 cx=c_pps a=PK5aExQQjalka8oDlC/sVA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=U7mKfydvYStWgQciAvAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: AxPSxw0qhuy87CivbX7rPZgnwl5qMqTq
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504150112
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53F8gcpo007451
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 15:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214953


On 15-04-2025 21:22, Martin Jansa wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, Apr 15, 2025 at 5:46=E2=80=AFPM Yash Shinde <Yash.Shinde@windri=
ver.com> wrote:
>>
>> On 15-04-2025 17:08, Martin Jansa wrote:
>>
>> qemuarmv5 uses tune-arm926ejs which uses armv5te, I think you would
>> need to use armv5te-vfp to reproduce this, or use qemuarm with
>> tune-cortexa15 but switch from default cortexa15thf-neon to
>> cortexa15t-neon
>>
>> I was seeing it in multilib builds e.g. with
>> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djan=
sa/master&id=3D40e9c4744a7f1eb2d91af9539d69555d36dfba30
>> which uses DEFAULTTUNE:virtclass-multilib-lib32 =3D "armv7at-neon"
>>
>> unfortunately just treating softfp as soft ends with segfaults in rust
>> as shown nere:
>> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djan=
sa/master&id=3Dc65eda95e5dd3ad0be0565477236d7902d5d625c
>>
>> Regards,
>>
>> On Tue, Apr 15, 2025 at 11:05=E2=80=AFAM Yash Shinde <Yash.Shinde@wind=
river.com> wrote:
>>
>> I checked for softfp tuning using (which gave TARGET_FPU =3D softfp):
>>
>> TUNE_FEATURES =3D "vfp armv5te"
>> DEFAULTTUNE =3D "armv5te-vfp"
>> TUNE_PKGARCH =3D "armv5te-vfp"
>>
>> But, it seems that softfp is not a valid value for llvm-floatabi in ru=
st.
>> It gives error as follows:
>>
>> |   --- stderr
>> |   error: Error loading target specification: 'softfp' is not a valid=
 value for llvm-floatabi. Use 'soft' or 'hard'.. Run `rustc --print targe=
t-list` for a list of built-in targets
>>
>> As you mentioned, using soft instead of softfp also doesn't work eithe=
r.
>> It seems that unless upstream Rust provides support for this, we won't=
 be able to build Rust with softfp on ARM targets.
> The last 2 paragraphs were rendered as white font on white background,
> but I see it now.
>
> It was building fine in this setup before the last rust upgrade.

Yes, that's because starting from Rust v1.85.0, a check for=20
llvm-floatabi was added.
https://github.com/rust-lang/rust/commit/a51fefcaab835b310e2e26005b50982d=
0049d905



