Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691B8C79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:41:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14397.1789047682177074265
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 06:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=knyUwjQ3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3713bde6ae=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC8A3o2870111
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Vzqy+Auk3QGUyu+fx+EK93aHe7LLkbZvuRsVkB/71Ek=; b=knyUwjQ3cc+5
	d89RpHNg3APad4zHqntC+ofAJ2E6ph+xupzU2vy2CwU8lkZdAJ3e4mAyzjiUvw8j
	KzQfa7loUqX7i8tUFlBrNEeKW6v9FnYzo3CEXGtceZrOB96JtT22bFptw/HJQjQu
	dO+38WPLL9GJZmNpRgUeiapUBH+RepJTr7L07LzKA1r4jFCHjIpuz7PnM+kOzTZL
	DanLvjNLu/8kRTiLXNJ01MP+UzUyPJzuWw89/zVBaVRyHlfjw7jlW0qDs1qbRAMa
	2g4n/SSDexEu5JWlWKA9EEZ1NnYj3nzKONaA1JJptburMgYbiZRaXh1iKkxOJ79I
	0lQ9GQ6RYQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022120.outbound.protection.outlook.com [52.101.53.120])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gkcyr9g2p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 13:41:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuVq1FvQFO7/coYvG0KNEn/l10PXFNTFd1QQvf0pSgy/qmXNMR3ewre92Wp5uR7uDGUv40Bi94kxevzP6+znK4p6AVsVYefqGclUDKcMO48JF/Bp6T4ja0up5lE4GVSz3QT2xzcCW+VDIVqSLAUWRzGR3gwUsFRY1kfrnp6knZCnhiJIswpLhthNBeMCTYXi8p7kBbUBClBjZEbi9D1g4OYGScQr4wrAzUUdA1V4LmKiB5TaZsnep6KY+eIiJGG7TVuOMkcVjSjoIdFdnDO4Zr77Qv3O3RjpBvNWqdRhFZhSuq6g/tOfWRBbQLQt8+PiGOLeMbdhYnaM5u76Mcv9Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vzqy+Auk3QGUyu+fx+EK93aHe7LLkbZvuRsVkB/71Ek=;
 b=j3TwFSfBt3Kdl4V1R0d+fyoehBzd5xfMOXQWOcROUqE/n9fCz24Swk6yHiMHNuSKM7vEulcbvPlqvMxKtQXTOY2KAUzlCWyaW/qL33iPS7pV5t+RYan9CirYjqAhzDVwWra87ZkA5dvrchLqq/D8tIPeZtiMsR1g/1vXKfP72JvPKzasDAJH0MbF7Z+AqowMHqPKFGHd+QteoGoPiawhqFz2JTpHGeVllhdr7Ik2JAZ6E52pTSToH+jGJjB2NJfxeKCIBooK/LIHvzicC4ZJH5+KYH/EMdvXs3Y1gDG8wpIzkDRoR8oiyWLxqz2yrJHNNoN0P7RgQS3JXZQIwU8kVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 SA1PR11MB6759.namprd11.prod.outlook.com (2603:10b6:806:25e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 13:41:17 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%3]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 13:41:11 +0000
Message-ID: <fc45d97b-e885-4262-abfb-f4961f86fa3b@windriver.com>
Date: Thu, 10 Sep 2026 08:41:07 -0500
User-Agent: Mozilla Thunderbird
From: kris.gavvala@windriver.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Kris.Gavvala@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] maintainers.inc: Update owner for strace pigz
 libcap-ng popt
References: <20260902001329.31484-1-kris.gavvala@windriver.com>
 <50f193055b9887a99bab6d90ce6a499ac7fab1ff.camel@linuxfoundation.org>
In-Reply-To: <50f193055b9887a99bab6d90ce6a499ac7fab1ff.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::9) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|SA1PR11MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: b6d97070-26de-4eea-e813-08df0f412cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|10067099003|22082099003|18002099003|56012099006|4143699003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	tkgTmC3dRmkZS6hVR1XAuc3FOiGrgntsiFlLVVuE7oNeczAQVIFIrUSexnNpiaNzgrcZ3I6dEyBkz93neAavLmPAYnAlXE3hDRtR7VXaomK3H6ViwmBf36dwR6bl6YHNdDMA8STgElrOHKA9CE2EyPZBQPOC9vwrJy8H+pTTYWoKE9pzQh65gj4i0bEAcl/dKFYo6uUO3Sox4njM41N+Xwt90rYt/QCiLOCixJ8zsjkpG8LQ7xHePYhtn5atW9kIqynlcuq7Pg5ZbcpYdUj1qsrhXYV5zez9193nwLDGu/cW6A/l0nqFZTtZj1BEeYhC9SASvHxlL99wFmNtchECJ3M6Qslk9EjExK8QsMDo3fVAvrJ51Mnwq7CNWLPx5avjlyBYrihvhNLguup5VlSCdmpbWwZpfApxCrIBSGXtwnoOWWlKklaERltheVqO5dh4HMjixKjdvRPGQtGuSsOR2CW30nE+1tjLPyXC1i4aYnlyGFi30szG0veEZajCwR6YZSqWHxRu0f5gg6mmArXeNEphXARdfR/a27FtLacwIFNWhnInw4fae32pS9Wrc2WWWyrP/w6jJwNQsDND3cAYopWlOXF7si6m39x3ERI61oESJqR9fXYQ7290y1O71SCZ01R6o9If4hV3mR2P4/GthtAZIcacXOiwcMgWXVsmpiHhhVM5B6i8Ouqd3hFi84Bwd5qJRfEpJioeBRV2eizVy8TE4I2UOg8RCLl9xVLJauM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?akxzN2xWSDhMbHgzdDhBT0dqOUd1WGVVM3R6ck1Nem5kVGRGRFIyS0paenFF?=
 =?utf-8?B?cW9jRnViMjZKZDU1N3p5UGpjRlFBVkxKaFlVTlNpRUlMQ0hucEhTYW1lbDFm?=
 =?utf-8?B?YTRiWXAwVThtQ1B2VlJZSkVHQnhqT0s0Rk0zWGt1U3RXZDUwWHlOMW5tWGhR?=
 =?utf-8?B?OTFob2FOb2VHTDh6ZFRWQ0FHVmswWlgxSkZCWG1RSC8rcWFiUTdtcHFyUDEz?=
 =?utf-8?B?VWd6SDlXMlQ5VDBDK29ta1FLUjRKV2paQTlzbWtMVzhtejBqUk5pZmJrZUsz?=
 =?utf-8?B?YlR1SWkzWWQ2K011RnF2cTJKdGorb3phMDl6Q0VJaDEzSkR4TWt6d29MQTlD?=
 =?utf-8?B?MjhUbjJmUWpIb3A5S05tSEpTdXZTSnNOdExLd242UkREU3p5djYvcjlmdTI3?=
 =?utf-8?B?OUJ2WWtRZEgyMTFPVTlHWEpEL2wzYUZqR25sYUVNdnVubkx0eks1SjRXWUI2?=
 =?utf-8?B?aytIdmxWR250MXpvaStZTzVYSE9maEgySjMwZ1I3dm80MklyelAvOVBiSnlJ?=
 =?utf-8?B?NnlmTUZIWTQ3WUk2Y1FXR1lESXBUN0EzSVJEbmdVU0JwVjQ2NTZSRXMwTlJS?=
 =?utf-8?B?YTZIWHNwb0EvLzY0NEtQNk1mK09WejczVWRZSmVaS3B1YmtLblYyOFpPbFZJ?=
 =?utf-8?B?alI3ZjFqTkZMMG5ySWV6ZnNSQkhsZWU0aGh1RVdVQm5xM3gzVzNWZXFLU3FX?=
 =?utf-8?B?azdsdjJIS0cxRUc1VUhJZ2l4WUdXR1g3WTgzUWcya3RXU3UrWitxWXkzQlk2?=
 =?utf-8?B?NWlFd01BcGJJS3B0WG54L1diVzIrMWx2aFl5ZEc3d2w4ck95eTBsZVIrT1hD?=
 =?utf-8?B?MmhZUEx3RmdOVGQ0UGMrY2kyZWh5NXFYRWR3dFptT0pPbm1vWm9YYUJJamd5?=
 =?utf-8?B?VVpHVFZYKzgvZ3F2VU8vTit4bjhid01veG90ZFhvbWVKNVo5RWYvN3M0dHNj?=
 =?utf-8?B?UC9HRDNabFhoV2xJeEFhMDVkSmpqQnBaOGVWUExBQS9xSFNyeFBNZi9OeHFF?=
 =?utf-8?B?RGRjNGdWaDdKdDRHSmJHcjljKzVFR2N5c2hPRzkrN1JmQk5yaE5kY2NZZURR?=
 =?utf-8?B?VVBpcnBuR0l4MytFRC8rM2txZFhvRWxCUW52dVZET1Nwek5CSVZqV3RhVVdE?=
 =?utf-8?B?bEh0R3pPMTFBT3BkcnVzUUJ1d0gvcFBYR0hZREpMdWZqZmVHdk1lb0VNc1pR?=
 =?utf-8?B?bnduYVRRQnRad3k2WlBLN2RxblBHaVJKZHRoWkhGMmlvSmlOeTNkMHdtbmUz?=
 =?utf-8?B?VTArV0VyN2RtTGFKcno0RGtJTVpKaC9SdDl5bGNtb09CNUpvNFdXa0NLeXFX?=
 =?utf-8?B?dGwreTR2ZWR1RHVZemlCTngvN2J4cncrVEJtSWJzYnp5dk1Qcms5S3ptelg3?=
 =?utf-8?B?NVJVOWpWN2VnQjQ0aVY3VVNZZDRwMXkybGRMdjhhMGNvQTlPSk9aNnJQLyt1?=
 =?utf-8?B?WHpYZnlaTkQ0S3RoZDlYWGk3QTNrNDhFY3JmT0ludkFvT2NhYXdMVDJnZFVP?=
 =?utf-8?B?WkJ2VDYxaTdDQUpOY09XOVVKeStBSnN3S0NwY290U29sLzdYQXlvdGpqQjRy?=
 =?utf-8?B?c1ZhZ21yQThSemlDQVV0SzlwQi9aMlVIWm13d2FmaGVSVEprZDFZR2VnbVJj?=
 =?utf-8?B?ckFyVGw4NkQwaTczK1A3ajFHQ20vM2FDZ0FuT2RWd1pJbzFUN1pqNVhtdWRG?=
 =?utf-8?B?N3JVb0YzdDhWakpKazdlNWdwZnVYcjU3dFNtQXZHMW1wakNSU1JEM2E1ZzNj?=
 =?utf-8?B?TFhmVzNQVmJscWY3M29BOXJSNDJ4K0lTNkpTZVhUNnpVaUtWVTVVWk5tMThU?=
 =?utf-8?B?UFlqc3ZRc2JJTDdFbEQ0TWVpYWlXNWY0TFpIZk5BVlY0ZlorUjh5ZE4vRHhz?=
 =?utf-8?B?S1BqaFpJVzZpcTVoNERkY29SdnJzRXBrNWRYUUJPT05vNTh6QVhnVTNZcURq?=
 =?utf-8?B?YmZNWFNtV3lZbTVLckFUaFJrU0tyWUttM2krVm5XT1M0dEFQaWxwOTZ1bkFy?=
 =?utf-8?B?STVCaVVEREFIN1FvWlNMSEdpRldhYS9DTUlUeHlUMk42amh3a0dGSXAyancw?=
 =?utf-8?B?cHFSc0hSTHE4bWxKUHNzWkdDU2k5blJNYWh5NnJST1IyeFVNT1JIL3VnMlI5?=
 =?utf-8?B?UjdQQUsxOHVnTjd0bjZ3cDlsVEdhUGdVUjk0VkNwVmpGSm5mMjBJM1JUTEY4?=
 =?utf-8?B?K2d1TUtpSVRVNnBzY2JXT3RRc3RqcVA2Zm81S2E0M1R3VGRsQm00RFdkTkdy?=
 =?utf-8?B?Y3kzM0Jkd1NVK2MwblRDdW5pQ25aZUpFK2FRc1NvUVBzU3pLeGhlVThGbTBE?=
 =?utf-8?B?ZFBpTlp4Yk5wUWVOS3RUUmZrSGhpd0ViZFNUSWN2eElabWNoeWY0VXRjaU5L?=
 =?utf-8?Q?H7+/iiqJ+sEUzkFc=3D?=
X-Exchange-RoutingPolicyChecked: 
	D0SHSRgG3kiuiVjQfM6+vW2CJloBzR1b29m8WivON/71o6gbmOHWjSHAHg5cW8kF1HwvehF+AXJaOfqml2Hh9p1JmzIPvrLE0dRolfrjfrjmjE+M5wK45XbAOEwEpQ82IKndm0bQ5P75FUispYpg0KSgpu88Lh5KTcMfMBe4pTVg/m7wpk1/km/W7fKH9UrOVbIIiwu1vrcBIg1VBGGbiLS64mJwIciughVc2TTBdXgyqiw5+09rX1bsryvkXkle6q6gNtONIkHQx7s52gnqgz6t+ch4ELlLHiVhjSrbsqiPUcW444H4P0NuFvSUUxOd0vRXBBTWkqTpdRjq9afUeg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d97070-26de-4eea-e813-08df0f412cd0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 13:41:11.1573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uerI8fRn+KcsV/OOvOYjUUdrjRHUDHevhNqHTRx19fx3zDF70uoVGlahK77jKU7DiayuIrQ/fY/KBGGkVfvNzPeNevvy02B7029ImWj6zes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6759
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: -IeI9OGUvqKsEhZXTvObxOIqdu9dvur7
X-Proofpoint-ORIG-GUID: 1bLjjTqnpdtXCdwTz1WdvLSoUpMRxLly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2NCBTYWx0ZWRfXw9OAL6wJlj1c
 Z92Gpgmlv8XIWuKSnlvCnlbMDIjVw6eK2w0ZLn9s7Qoi8NRByBy7aWnVD/bMO09XWC6sepTA+5P
 j01D2SzJgjrnLimndDvHz02U515fmvt5G0SdKmNRt1lAN1i6XzI0oDyEPHL/DnX76pAm4TsORAH
 wl9HEak5j9jzhUI0K5H0ERhuAuHsnJllTBlD4Qg3g4dIdRloBWgcSMEGQHoowtDz9EWRlH0swY9
 dRRx2/wDKbjwLzHobiDHPRBIRdiIR9ogmvQDMcFz+F/I/Arny5WQoTzBwP9qs1tuedSEF8nyb56
 UsgXkIBiQUnMDf2XPZpqW7/+P1NqsjdeAODTHVrx/hA2N6o7XcdA0iPL6lKs/X40x3RhCSKy/Zz
 JQ3mIm1Upz4p/7xFYu6tVtmr8O3nynyrIxAdZLHGo52SMf8FEHPuko2yuEh0+2SNNUXI2Ozr2JR
 pNZPk71W6s9F1Civ/Cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2NCBTYWx0ZWRfXyQTjZxYBtdnY
 2S4W9MNeHSUdBoNdlbSMy+kDzETguD8+OCTcp0EllTFe+Qd8CXLWcglLASRUanfTZzcxFGcEX2M
 Tbm9jPb3DJPAq/YkB0BsR2UI00Wev6IE6KQTwyRezCI187DVFjJ5
X-Authority-Analysis: v=2.4 cv=NtRE4MdJ c=1 sm=1 tr=0 ts=6aa2b380 cx=c_pps
 a=bP4hnMQMufiFUZl4LljldQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=ag1SF4gXAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8
 a=pq4Z77T2S5yyfJbRDI8A:9 a=QEXdDO2ut3YA:10 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245582

Hi Richard,

Understood, I will send another patch to take that recipe.

Thanks,
Kris Gavvala

On 9/10/26 5:38 AM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> Hi,
> 
> On Tue, 2026-09-01 at 19:13 -0500, Gavvala, Kris via lists.openembedded.org wrote:
> > I offer to take ownership for the following recipes:
> >
> > - strace
> > - pigz
> > - libcap-ng
> > - popt
> >
> > Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
> > ---
> >   meta/conf/distro/include/maintainers.inc | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> > index 2966cddc05..7532f6173a 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -323,7 +323,7 @@ RECIPE_MAINTAINER:pn-libatomic-ops = "Unassigned <unassigned@yoctoproject.org>"
> >   RECIPE_MAINTAINER:pn-libbsd = "Yi Zhao <yi.zhao@windriver.com>"
> >   RECIPE_MAINTAINER:pn-libc-test = "Unassigned <unassigned@yoctoproject.org>"
> >   RECIPE_MAINTAINER:pn-libcap = "Yi Zhao <yi.zhao@windriver.com>"
> > -RECIPE_MAINTAINER:pn-libcap-ng = "Yi Zhao <yi.zhao@windriver.com>"
> > +RECIPE_MAINTAINER:pn-libcap-ng = "Kris Gavvala <kris.gavvala@windriver.com>"
> >   RECIPE_MAINTAINER:pn-libcap-ng-python = "Yi Zhao <yi.zhao@windriver.com>"
> 
> I just realised you should take libcap-ng-python as well as they're
> paired to the same source tarball.
> 
> Cheers,
> 
> Richard
> 

