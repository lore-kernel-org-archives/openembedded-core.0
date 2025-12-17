Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F599D6406E
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 02:58:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5401.1765940320394191646
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 18:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U2+hX4s3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44466e3d05=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH1omnI764736
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 18:58:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=8MNuPg34k4KDx8zwe8yo/sfnJT0S52IDwtV1RCd0Z/8=; b=
	U2+hX4s3x0pkMZFWO0/3l2dfXIWj4edJjB97lp83UlZTJBSl0MzDDrNOLA70lSdH
	b4cT/8FfpUJZWXrhd8HLX0Cbel9aa/T0ZR3fAqm3WOtgb9DZ+/HU6VlU+3XkYzy+
	C8FxtrQEpRR0w4/PmTL7GvWTqUDIlbRFVn+SP9VQCiLUsUesdmQaoz3gg1BrKSxM
	UIXJ72Zrc+5hE9fP3QiEYzRe+jRnJ9A413m3nO/8HgxeV9gLJLbuVbD7VaY2FZq0
	xpPmgPs5J2HRlC79orRX1MPbvitLyUkNwc8lepEX5YRVdESE7GGSZ0hzYkVjwb7+
	W7oJgSFufha/uuzedk0LOw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013039.outbound.protection.outlook.com [40.107.201.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k6j01r8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 18:58:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmCmDRAR7BPTauYgrhbcbY0Qccq3u7JO0kUyL23kZqTPcm/0kzqSMcYqT7Kw5cTYGPcwFjfamU/UfpvjE8z2kz48xhYidS1k4rlhY5p2O9Qd+mH3nkBVdCYwSboi4PxFUSdpsBTRjC/AsJt0wb2d3JstBlobzNfPEOZ5RlNqtRVlkmCQlIN57csUVMSlm6UhrlKLj8cJfvMt4g4dnfHgbv7iiw28ZJamb8mSrlMasP+td1WvGHMkGBiw+KjY43iFbc9UJQwDjGxzV1wxelKdLz/3di806xADWEVtp08ElROJM304pOXnn4aWbuzMXqrGtDUYaJc33lbpppdSX9SeDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MNuPg34k4KDx8zwe8yo/sfnJT0S52IDwtV1RCd0Z/8=;
 b=YYtqrIXuLjwMM8FuGakTd/Lu7cxQadekhZvYb9ZmaxDFaJDw9/U960F3Yi3Xz+2ORufjMAqTARR7sX62uYrBZjZdLRCVpClaMs9sIq1WSTvbg83IfINstEQkhisNsd4mXY68+6CwSVUZ3K1b3x7QbGzQFlKG2bs97mQ9i83GoOiCiKWiarbuOczdRqFseG6yEKrgE5dXRvKZIuFivkpg5cGD9ZEgQ8cTSeDj8p+n4Xjx6+FR/AfVtakfQJi4jgJLR4gpzJFwE+yL0kwVvUmU5ijuvM4DRV9tGglt1G8kbSqcYQiT0JCvdIVqEmfawC46SrxVhkkxQ8IO2d1oCkt/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by CO1PR11MB4786.namprd11.prod.outlook.com (2603:10b6:303:94::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 02:58:36 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 02:58:35 +0000
Message-ID: <b127705e-0b9a-4a5b-9fcc-c3014e4c680c@windriver.com>
Date: Wed, 17 Dec 2025 10:58:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] strace: 6.17 -> 6.18
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
References: <cover.1765878985.git.liezhi.yang@windriver.com>
 <1fc8161d254e37709e63cf9d07ebd32a2f1023cc.1765878985.git.liezhi.yang@windriver.com>
 <CANNYZj8=3egJPC3dT1bc-9n=38-OAyAKfwb81mJjuiSiqVcaQw@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CANNYZj8=3egJPC3dT1bc-9n=38-OAyAKfwb81mJjuiSiqVcaQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0079.apcprd02.prod.outlook.com
 (2603:1096:4:90::19) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|CO1PR11MB4786:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef1d39e-6d97-4505-3c1c-08de3d182be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N1lReTZhT3ZuUWk3WDFCeXMzaDV2VmxNcDlkTGd4cW04U3FOc2t4MUphVVdu?=
 =?utf-8?B?aWF5NFNiQWdjNEdwdnhBekQ2ZHNqY3FHVkI3RWR3QXFqRGlPblBxWEUxL09P?=
 =?utf-8?B?YlB5NDg1MFJKc3daQnV6K1kwYldEcDJwVW5DSmFhbkZzaUdheGY2ZXdjd1Ny?=
 =?utf-8?B?TU9UVFRJZFNIdWp2Tmhzdkx6NG53YUdsYjYrQ3UzLzBEeXI0WnlVanBPT0Ns?=
 =?utf-8?B?a3h1TEovZkE2emNpclRHOG8zbE0wZm11d1AyTGx6M2srUUZrb0IrWTVzalJv?=
 =?utf-8?B?KytzaHZkL0Iva2xqcTRpM1JOdExnRGFWaEV0YmhnUW9mZkZONXZ6V2I0OTdm?=
 =?utf-8?B?am52T2c3R2tSanByb1J0MWxlMDFLR2VBdnJGM1d5UU9MM1RkU1Rob0EyMFNG?=
 =?utf-8?B?QVk1Qmo1ekVTMnVRS3dDQ3A5SVZSQlM3ZEQrM2d4VVJ2VDFhVUJuNE83MlUw?=
 =?utf-8?B?SDZYQWI0STFCakNzckFBcitqQzg1OHBHWVNKZStENk5yTWhuVmh5b2Y0YXdw?=
 =?utf-8?B?WkY5ekN3VXBSc1lLZnh3cXZxdzFFc2Fha0xkUDFTZjkrSVFGTmV1ZG8xaW1M?=
 =?utf-8?B?R0dFbVRQTElFbWp4SC9mVFBzWHRNTzI3VXhXSG13aUwvWDF2VHZ2cEhaU1lh?=
 =?utf-8?B?R3Ivb2V4OU8yN3g5WWxjZFJWbk1SSHViWGFxTkVZd2gyV3ZndEVpMVRWTkFz?=
 =?utf-8?B?VUd5aGREckFpbktEUFQ1SGdjQmRZL1YrTnc4N2lXYjdVNXR0NElWTVJlZjlJ?=
 =?utf-8?B?OXNPcjR2S1pVMjFVY05QVXFNWnZrUXJrSmhQSWhoZUNDRWxYd2dtWmgrRSs2?=
 =?utf-8?B?SWNpTlB2UlNTWWVMNzF1Kzd3T1pwVEduTHo2ZGNkK2h4Q0VnWGJIdGlETXNR?=
 =?utf-8?B?NlBEMVhaWVBnNlorUXUvaWlpUXBhT01OVmlGaHcxNFJoTStJYnNMN0RpTEhF?=
 =?utf-8?B?OHBwZHlTNnI5WUVoT0xxTE5kOVlkdjJ6UWJRVVlWb2NISkJ3NnpoSXMwd2Vm?=
 =?utf-8?B?RzkzeEFOSWcyK2dwbXB5SFg1QmN1MCtBNDRibFN4a1doclgwSzlBbGowMDk1?=
 =?utf-8?B?Y09lbnE5amcwZVlxaG5wak40QytFcXVzeHJyNmtRME1RMTk1WTRyRzFIbytP?=
 =?utf-8?B?dEI0VmNpTGZ4aE9tWVhBVEZmc0NlMWtZVlVaUXBWN1FVYXpJQ3FMbGVBZkR3?=
 =?utf-8?B?NEZ3aU5wVzJPV2VkWmlUSUx0VWxkZVo0MSttRzdoSVBnYjhwNTdDK3BmNGVp?=
 =?utf-8?B?YnpXVXpiSzl0L3d6a01wanBvWGh4bTI5TDdGTU16d09VQmRWbnJWMHFEdEg3?=
 =?utf-8?B?QllPVGdPdStubmFVeDRaQmJaUmFMaWQyeWd5VWdjYjE4YU15NFNpTmlsZEp3?=
 =?utf-8?B?RmpQU2tWTEtXUHBSSEVBK09sYVVWMDN6M1ZLQlRlRlc0ZWJ4dlNJZVhpNUY5?=
 =?utf-8?B?djlDQ2g0UWxtWThKWm5DSERnRnRZUHZiaFlRRjBKeFBNZElxam9KZ29KaVJ0?=
 =?utf-8?B?VDBDVk5RM0lhZnhNYjYvNWFPNUpielJRWlNTZmowMUljaWZIVE9HdWI3bmpX?=
 =?utf-8?B?dEpCUm1aU1dyamZEZ1pZamlKOGxDdjFYdG1WVnRVN2hQdXpST1o1NFM1aVh1?=
 =?utf-8?B?em1hMHFOQ3pWbi9zMHB4M1YrTWlzY0J5Ui92eG9MNUpIbjNXUERqN05RQ2d2?=
 =?utf-8?B?TllsWVRMc1IzQmQ1M3hzSG5EellIVUNLTWo4UVlrMDdkaDQvRFQ0NFAzUlBQ?=
 =?utf-8?B?ckdmUWN1RVRoeUVGcWpYWGdVSXFjMUpWTUYrS0VzQmE1Rm9GYmVHZmZ5anlv?=
 =?utf-8?B?NTdXc2V1OG9DZjlBaTNYT2FuNnYyZW5Xa2ovbXhRMFRqSGdobmZrMUlpVGl0?=
 =?utf-8?B?WFlrV29kUE93andzY3RZUmxOM3V3SDk2RFdkVDhDUGgwdU50c2JJaytEaGo5?=
 =?utf-8?Q?lY3UB9d3Ry1w9yRWrUYCVz03xdx5TFUU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MHpIVUJraHEvbXRZM2wwMGl3cVJGeUEzU2J2cGtveUNsR2I5bXIrWGl4QlZT?=
 =?utf-8?B?R1lIS2o1VkhWVUpJUlZFUEF0MHgrK1VEUnBHRkxRUmdUSkpZK1J1V1ROQUdu?=
 =?utf-8?B?R045TnNHVHd1d1RKTmpEM2FCYmZLdGluMUQrajNFOXQ0a0Uwcm02cGpMaHNT?=
 =?utf-8?B?TVFOZ0g2QzQ4amw2dzJaci9sdS93VThZODNsRjl2TXQ2RTZ0VmpEZ0NlcEV6?=
 =?utf-8?B?N1ZRbnI2T1ZUSzJYN3ZHREhqaGFWN1BCM1o4bnhnYnFWdUVpSlBSRmlISmZB?=
 =?utf-8?B?bUxnc2h0VFREczVmSWt1dWI3cTdkd3phWXNOSG00eWl1SC9BTXhablVYb1Fy?=
 =?utf-8?B?Q1dBbjl5Sm5pd25kTlJwSHBHNkJ1VlBGckdhVy96citZOGxKVTNXS2RYa0J5?=
 =?utf-8?B?VStwVS84VDJJaWxJckJTeGdVL1dqMVBXaVdmdjB5eHZKbHZQaklpM0FtdDJy?=
 =?utf-8?B?VmlMaldXV3pobGFIL1NjeTFIR3BJZmloZ0Y3MjBqM2VpS0MzSDVsc0FSL0xi?=
 =?utf-8?B?QlRhQmFURlBRVk5rOXpZWW5jSjFSSjJlRzdPMVhuQzgrWFEyS2hpNVFQMzhJ?=
 =?utf-8?B?UXYrWVdmWDl2dkVhdTYwT3RybHFoT1hXN3JWa3pJWTBpci9jc2pQeFJaWlFL?=
 =?utf-8?B?RzFOVjg0SXR5ak1FNDNFSWY2cHBBMzlmN0NIaHlvcWRMTEFSR0oxY0FJQ0d6?=
 =?utf-8?B?ZEVIb1RqWWVBZ01VMTNhQXFaQ3VoSElTQ1h2L3o1bVppa2s1SEQxNnovbTl4?=
 =?utf-8?B?d2Q1NUJPMkg5blVNYWRCd3hucTRKV1JrbFBJYXF4ZFZScHRrTTNxVEJqVUZH?=
 =?utf-8?B?N2dTM04vVmRVZm13dFJYeFdOdVVLaW1Xemp2NklKRDA2UUY1VTVFMkt0NmpV?=
 =?utf-8?B?N2h2VjFIZzBkM1lsdVJSU25weXFvaU1nWElOMFZZNGtxcTEyQmtvSVdMVUlF?=
 =?utf-8?B?aWRQSk92b0g1UHhHVm43Z1ZhL2JmUTV5Q1hTNHVXN3VQTm1DT0lsZ3dWVDd3?=
 =?utf-8?B?SDhJb2tUSmFZMlAwdStiL1NFV3Y4eWJDUnlZbzJDMVpvNHZkK2FOS2Q4RFRt?=
 =?utf-8?B?cFcwVk8rK0ovNWdhUDQ0MjNWa0VvZTFGZ2dEZktqNjBaLy8wV2RiSVA1WVVY?=
 =?utf-8?B?VzlGNm1ieG1VYzFwRDZXRkUxS0pWQjN4d2VONXR1d29wMmw5UFpaNHE5eG1l?=
 =?utf-8?B?MU5DMmNEd3pzOWwvR2RJVUFqUlZIUnFjVCsxTlZ1NlQwbGtmVFd4Y2hFa1Ba?=
 =?utf-8?B?Wmw3aVJ6aFpkeEVOQVBuWmFDTEZCekcwQTBYVUFBUU1ncTVoeHlOdklVQzQz?=
 =?utf-8?B?ZGQyOUxBRWNpcmJHTU9zZGlsTHB0NC9sb3lXWThKM3B0c1RLWVhUeVRzblN6?=
 =?utf-8?B?QzJhZ2VhU1Y2K2w3ZjNhRnFGTFpkMEdUZlJ6OGc4VERubWd0ektMTy82aDVu?=
 =?utf-8?B?cjVtWE5UenhQV1V3N3B3TW4zd2pLQUxwOE1qQXY5dVJsUmZ3SnZHQmdyUE14?=
 =?utf-8?B?cWZmT0VRcUNlaXEydHhMTGhOU3pDZk1nRXBia3hRTldwbUdVclozTDlPV1h6?=
 =?utf-8?B?OHd0RlBvSm1HYnVIbHNQQldYenNLQkRjcUtWTkZicWl6cmNXOFJFang5d3ZE?=
 =?utf-8?B?bVJtNS9walE4ZkQ5V043QTBXL1ZuMytxVnpaWkdPYyt3QzQ1b2tvQ1BvRWVp?=
 =?utf-8?B?WXU3MUlXSkxtdGhkdWt2cjhYVStEM0sxN0VJK1gyMnI3dHl2ZnZPczY0UC9l?=
 =?utf-8?B?TG9uQUxIb29UdFdCV21pV0ZrS0xjTXVSOE80Si9sNE1pM1JVUmhFWUcvcjlB?=
 =?utf-8?B?cVQrRkd2RTlhVG4xKzNhZ1pDdEs0dnppeTdITWpuc0JSa1l3NW1MeVU1RXJE?=
 =?utf-8?B?RHhjWVNjaStuUlY1WUdHTVFsMUlRMFJHMzNXZzNNMlI5b21GY2tqVDBNRnFG?=
 =?utf-8?B?ZnE1SnM1VlZKL1ArbHdndmV2OGpBc0sxUEtCNDA4RjdaK1BEcnIwdkVGVy8v?=
 =?utf-8?B?NGNVQ25IOE5lemliTnBIT3BaNVU4MjI0QU1udXNRWnRBVzhucnJqNUhsSFdG?=
 =?utf-8?B?Umt4dUQ5cStIUU1GTEV0R0o4a0U0aHFtU0lhektTNkZFY2ZIbUxHNDY3K29B?=
 =?utf-8?B?SDk1U2t1Mnhmc3FMS0VCTW9QTjc2eGlpa0ttakp4a21VL1JMRVVEQkxFSVU0?=
 =?utf-8?B?V3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef1d39e-6d97-4505-3c1c-08de3d182be1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 02:58:35.9122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTpNZx1ITYkdvS0wXo5nNewayt3T4AF8Dt0x6mRBgcVDIYaMMCRPZ6zBjedq+bVt5QC9onnUR9KWpxDGZlBkqAQzRbpMxobNcX/ESmaR8fQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4786
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ErvfbCcA c=1 sm=1 tr=0 ts=69421c5f cx=c_pps
 a=U/rLDH1MEKAiLKQqfACAEw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=vgUT5-1RYXulRjF8UJgA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 7xG5dJTpFhNitNVBZTLWjB0-J81G_35P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDAyMiBTYWx0ZWRfX0mv1QWTEXqLV
 NWpYV3MmQTftIVHiZNyCHt6UXXWu93juUJfEadNttlks04ag8Forjm03aBi/E2HPoEMpHeCX/3y
 yTr4rTQRXi5sp9peztXn+vqN3a290dV28NoMbz1NyKv9JP1GL8nG4qInfqEIExIlT8M8V1okmHO
 PgP+jJA2Yeqff3ZhUlyLs6HaL1ipnq6BQA0HN2fvXGQ9P7Of/CSq0n8BwTyIJLf+V+891xOr11D
 Jxp5Hkh12OFZ+J715LS0xQh6JzBIRUqv3wy16aJCrVoNzx+FJ7pc7SEgINs3n7sMgSXaxfOiMVv
 TGTOKSBwl9izdZLOqZVV53YP86gaYndmjhjc9yFFD3uMlFMb+tHXuSUEIq14M8wbos6pizPtnNJ
 6kXToTj6RvEoW8udhc4QR8CBnRnXcw==
X-Proofpoint-ORIG-GUID: 7TP94UVOBEc1uomjFr9gfhBVVAd6MOcV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 02:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227993

Hi Alexander,

On 12/16/25 19:29, Alexander Kanavin wrote:
> On Tue, 16 Dec 2025 at 10:57, Robert Yang via lists.openembedded.org
> <liezhi.yang=windriver.com@lists.openembedded.org> wrote:
>> The 6.17 has 27 failed test cases, and 6.18 only has 2 failed ones:
>> FAIL: bpf.gen.test
>> FAIL: bpf-v.gen.test
> 
> This needs a bit more context. If the old version had failures, and
> the new version still has failures, why aren't they seen in testing?

They are ptest failures, and there is no specific test for it, so we don't see
the failures. I did look into the failures, but didn't know how to fix that, the
newer version has less failures than the older one, so I sent the upgrade patch.

// Robert

> Where and how do they happen? Should they be fixed rather?
 > > Alex


