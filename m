Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C76ACA1013
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 10:52:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18667.1757069524787155674
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 03:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=kaInCRg7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1343256814=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5856t1ja446400
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Sep 2025 03:52:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=I7Onu/9yblHUA2kSCkhGLZgYVQ75kP2/RhxQoJlxhEs=; b=
	kaInCRg7D20W23gXqmEqVIvTO3ohR5Q74DP+lyBjyIIHlpNszUu0p310silXVSNg
	7NaNKUaFwZqP31e7RSPHKMLnJNuq4o15SsbprgytTx8zVMDMmn8f3qEfqyZbKeLO
	ImLtMsgSKATSqmXTqvgBe5pmUrPWvgLsYOYrQQODuMxh2aJ5/Ox3h8heCT24XgCe
	mWLCgQPCBdX1bQ2WmBTO1RTS2fbSBEa6LHSG/Oq8AMe6e8NeE3fmLMnHviXYFr9y
	Fb1dIG1ArYl7OkVjvhmDI/GujqeQDeudfyT5vkSf16vQJZT+wSSegfZbFipvCIit
	UN2GJCYiFd/H4cEN+V19qQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y7sb1tc7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 03:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMg7TvXg/W1inp5d27sKMYA+g310rfhYBCO3EsAIQFbyQhfWxRZ7+r8ZHoL6qZU1b4gQSz+MpoZkzubY703rmuMd9DbDxku9kpXky4YLUS0V6ozAVbc3PEYXOtCBwafnQN+wAYyPNu94VOoQSzphEMwYGkAoz5indbVN6qP/rLLPTIEd3rCef/skJgUmf5Ziq+1yrzwlP5TRwP22K2Sf4bIllyObddsr2r3jDRkeSqfzbsCkrMsa00QwWFby3dKTJZ27uJ2X8MXHulxPA9m5Ta63B+ASffhLjthSwAA/L40hfICEWrd1jbvqvbeUtgpzGXvfftCS7W+mjb5t3tKPCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7Onu/9yblHUA2kSCkhGLZgYVQ75kP2/RhxQoJlxhEs=;
 b=Qu7RmuARANUpNIulh+gpnc25w0ug7N21ij2rlI+ZY5JqxqEYM1tJ8I9uXhcwzfRbCgRQevlY6mTNe6xdN2w2IIbesZuC1SqQcTgU5KZYPJv/0F7kXow2or6MQPEO+pBX4MPO3DTKCWz0s7f+Xv26vXfO9odpglzS4MbsD+h1SRABJiEa4kYEW0Jawu7eLt0cmlNW/zd071ZFhk497LHKxyf3w4tK5yQ7ljk6UXbVzmljGfDfk239v42R4ijKExK/LTNfpRY3oHauvR/JzJKJu1pQIdWjIsMdwpCSxW8KjwqUPT7MTN+x1kOvBro3aiu/oxi7KW7QsqMy0Q/4aWoSNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by CH2PR11MB8834.namprd11.prod.outlook.com (2603:10b6:610:284::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 10:52:01 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 10:52:01 +0000
Message-ID: <cb3845f3-1865-43ac-8574-2e0eb59451ee@windriver.com>
Date: Fri, 5 Sep 2025 18:51:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH 1/1] environment.d-openssl.sh: fix unbound
 variable with 'set -u'
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250903081113.3182850-1-haixiao.yan.cn@windriver.com>
 <CANNYZj9Qr7uy-bZGGEt23MWXHkX-fU3TYQc3WYoX3KEtTC9NtA@mail.gmail.com>
 <108f0edd-3a59-4b2f-86a0-7afc439c884f@windriver.com>
 <CANNYZj_z3UwqgYqmvUYBG+c2iANjib9=6CZYapi1zCjycN_4cA@mail.gmail.com>
 <e038f529-1c06-408a-8d28-b2ec6bc6d17f@windriver.com>
 <CANNYZj-5sNQq04T5fBj92TSUDdcLT3+_u+uvDveO1g-ZJNL+wQ@mail.gmail.com>
 <485684fb-3efd-4563-b9f7-395002c85d58@windriver.com>
 <CANNYZj-qwsXYwkThcwytee7v44wtZdEJ58Wj1QDWzR__k4rLXg@mail.gmail.com>
Content-Language: en-US
From: "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>
In-Reply-To: <CANNYZj-qwsXYwkThcwytee7v44wtZdEJ58Wj1QDWzR__k4rLXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0206.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::17) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|CH2PR11MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f3d0ba-d0a8-4ccf-e267-08ddec6a3e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WnZTRExUaVJCcDJLVzJEZzZPK3BwdnlFZzVseUpOMDZSR250aWtBUmlZeWZN?=
 =?utf-8?B?a2paUEMwTndCRU9hV3hMOTJXM1pKVy9Ba1RwQUl3bDJqaU1rVE1zMTZJcUs5?=
 =?utf-8?B?SlZnQzI0dGloUFdkdHlxN1hPbmdScU1iOWdhWWR4SThTZFRxZ3Z6bkFxNWNy?=
 =?utf-8?B?Z2U4bm1PNlBnUmltVkNUNk5Ib1d3N2V5d0NxOWttYkVyUkRFUS9CS2wxTFlR?=
 =?utf-8?B?OFFLZFdYZ2NkTS8vdUd6Ykk2NzVESGQ3Uk1RRE5Cb2xjb3kwSjc2dVBGS0d0?=
 =?utf-8?B?SjRCTkNkL1JHWmpFbG9KcGltcjAzRmtzalRDV1Z1aVhvYlNmazI5RTQ0S0g2?=
 =?utf-8?B?VjUwa2RCZ0N3Z2gvdWZmb3h4cm1mL0pJZ2d3VXJWcWhycnR2RnVJM1RuZS9n?=
 =?utf-8?B?S0RoM1ZndzI2UStIWWpwYVRNQVIwU0JxN0VaZTAzZENibit6bFhrMzBERFc1?=
 =?utf-8?B?aVB4Wmk4aWQ3S0d5YVdTTjN1L3BaSHdPcFBjSzJJbC9hT2l3ejdKWnRrdkI3?=
 =?utf-8?B?YUVTekNBbDBpQ2Z0OFppUEtwYW45NFY2K1o1UFFYRUlxYTMzK1Z5U3RnaThR?=
 =?utf-8?B?SUFsdDA4ZExxY2JqQUZtUUZVNm9GbjQ5Vy9hUkh0MkZsdVo1aWVrZ21ydUxy?=
 =?utf-8?B?b01RNnZsMUFjMkZXMEZnWm5Za0d5eVdubXNianhqRnFYWVJhUk9iVUVyaXht?=
 =?utf-8?B?ai9aNXV5TWJ5RlJQMWhFdlRaL0dDZVo2TGZjZHNOam83bUhxYWJ3YzRRb2Nv?=
 =?utf-8?B?YVo5WllEaEp6NUd4MHBURG5lSGUxeExYMWNaVWxQQklqMk4xMGxrYm9GVDdN?=
 =?utf-8?B?K2l6dFhCQUlyZHZVc3RCMmt5bUxGWE5IVHdSbUpFcVkvaG40T1JWZGEzVmhn?=
 =?utf-8?B?OU9QMEpvNlg4eHJFa1VuQTZCSU9HWkViZW00Q1NiSWs5L2hadEIxT0Z0c1Nq?=
 =?utf-8?B?V09mVHBVNnROS2NMVFJONEZYMjhvVS9UaXJGU21iRmlVZGxnUmdnYzRPcVcx?=
 =?utf-8?B?Vm5ra25NNGhpSXRkZkx4alVlVXl6U3Zza2JMam9kNXhEbDdCNEFKY2JEMmFF?=
 =?utf-8?B?VXRlZGwrVzBSRldvYWRsN2pPR3FtTjFzNmFVcm9jbko3bVc4OE1RMVhWOW9v?=
 =?utf-8?B?TjZNbWZEZVhoMWpnYjVlTXdYb09TeGRHTnBuZWZ3VzY4dWwwQ2p5K2ZTZFV6?=
 =?utf-8?B?Y1hqVGJaVG92WUpaTndJbnJzaEkrdmh3SUhHdnc5Qk0zNEo5RStQVkUxKzR1?=
 =?utf-8?B?ZjhESjdEa0pyTmRyR2RzTERkZW5ZanpYMXE4ZDZCZTVDUXF5VTVPdHhuSm8x?=
 =?utf-8?B?YjFxTEVCZ004Ty95TzJ1RDhvbHdFUUpWUXBJSHJCL090SWxOUFd0ejF5a3A4?=
 =?utf-8?B?SGFzckNSMnJ5Z1NjZ3FvRFF3WWUxQXdpVVNkd1Nxam90bmR0S1BDZE5Zanpl?=
 =?utf-8?B?cEc4TWpYeE1wdmZzdk15YncxUTV5aDc5NTZidkRCZVlXSW1WaHdRaE5lVGVt?=
 =?utf-8?B?Y21FcVdqVm1zaE1TTzdscktjVm10YXJoOUFGbE8zbUZNS3k3Q2hkZkw2MlBM?=
 =?utf-8?B?cHh2ekwyTXJWZ3BmMTFiQWZkSHdKT0RNZVB1bUgvQUZEMnJiRmdaVFhteVJs?=
 =?utf-8?B?cUdhd29nSTA0TEhubXcxYVpNZ21UNnVBQVZhOFh3Z01vVjVxbmptdzZxaVdH?=
 =?utf-8?B?U3o1WnNzNUkyQUpSTTY1cjBqaUgxR0d4V2k4NDhEWCs0YXRJZ2xLK21vK1RS?=
 =?utf-8?B?VWJwamZnNXVCYnFGN2kxbVBpbnpnd0MzNzAydTVpOFVhcng1VkdxTS9BM1lO?=
 =?utf-8?Q?Xkcrq3nNnvZFvX3Wqjxh2JgXdfaMKjoHdan1M=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1ZUZDZEdHVSMGpteGM5RHVkOWJDVmJTMU1WTkMzV0VVQk0xMGZhWkZ5czQ5?=
 =?utf-8?B?Vm1jeTFSSi82bzFmSGQxZFdacEd5dVlMVzFocVRpSWpJZEZhcmVMemRPY09o?=
 =?utf-8?B?eWVCWEdFRkNRZXdNMjNkZjZ0MzdyTjVDSDdBWGlzRG9sQVZZWmpQMjl3VjhJ?=
 =?utf-8?B?K0V6a2FOMWRUbDhpRFRMeXlIbWE0M001OFFSZDN1bkxkSFlyamVhcG9sRzdQ?=
 =?utf-8?B?ZGRUTncwSWowZy8vd0JoR2M4ck9ZTy9uMWVZaVgxdFlMTjJ2dURXcjBmSFVS?=
 =?utf-8?B?VUFqTW5sTUdVa2F5cHJzV0RVSnlSR0g3OHIvdGRhMGlLQk1mcWdxQllrZjdL?=
 =?utf-8?B?aHdjTnh4bkNiNWp3YnRFZk1keWUzSnFTTTVwa1JiWU5NM3JXRkV0YUdVN25C?=
 =?utf-8?B?U29HZU94MWlJOG14b2lSZ2pNa0FJYXE5czcxZnh0Qnc3QnI4VEdsU2pzaDFz?=
 =?utf-8?B?NHdxTkVoOWZCTzBRUkpkMTVNM1M0T09PdktlR20rMWo1ci9OSW9TbzY1bzgx?=
 =?utf-8?B?alhHemkzenorZlVXSVBWODJCMFJsM1k0ZWRENDZuUWpYL2Rtc0tvdXFONkZh?=
 =?utf-8?B?TzRtNy82NzAvcGMvTTNXcWVBRWJhSC9DOVpPT2FzaHowRXBzam5SRnQ5Tkty?=
 =?utf-8?B?aWtrS3R1VHh0RXczWlJnSVIxa043am9la0ZwclBhbGFzaEpQOEJUeWNyMmpF?=
 =?utf-8?B?V2hwd2xiQmtSdmxQcmMyekNDRjRNY05oV296RDNqdDJ6b2hzL1Rnc0tEL2RE?=
 =?utf-8?B?Z0lPR20zRVB3QWM1WlozM3pJcFF4SlExY3p4dzRXUitpM3Z1TU44VmE5SXQy?=
 =?utf-8?B?VnN4Z1I3UXR2aUZCUnh5VGlpOUNyVTgxV3dBQkVsZkpob3FOUmhsSlVKeDRW?=
 =?utf-8?B?V3ZuNDlkQ3FXb1BsV0pxcENBQjB3ZjNpT2x2djF5Rk5zWDA2d0tNSEk1MUxx?=
 =?utf-8?B?LzVRamorM3M0T3BWMnZISjBzY1JGL2s0TDROUXZLUGlOMUVmWnhXRWk0NUQx?=
 =?utf-8?B?N1hlWjBaQ0FHOTdkYU1kNVBNSlZZajkwS05ZRDJWNk1hWEgzNVJpTXJ1dVpl?=
 =?utf-8?B?OUh6d1NIM2YwUWVLZGgvdW84VXZGUlYxUGZFcWJ2ZUlyajFuckgyS3VQcVhX?=
 =?utf-8?B?N0loYnRGQlo2MlVQUitoVHl4N25PVWJkb2Vkb3F5QlkyeEx6STNtZlJFbk8y?=
 =?utf-8?B?TnlzQlRpamZQTGwra2Rad2Raa0JBQVhmTFVnbERZSm4zUDJJdDZzMDdCNFh6?=
 =?utf-8?B?T1F3VkI3U3E3SlFvZnRZZUY1bGtBSFFaRWt2eG5LMmFMWkJNM1lyVnJvUTlC?=
 =?utf-8?B?aVpRVksrVnd0c1d1N3NYeVgzcTQzLzN4ZUdYMWpxNWpaR3NFV2krTnVNMEs1?=
 =?utf-8?B?NkxuY0pqc1B6czJBZlBvUU5uMHdzSW5CN1JDVENMdE84aEVDSzV2eDM3Nldk?=
 =?utf-8?B?dWZjY3h5NHlXZ0dIVDNwdjNBak9IclEzTFJ1VE4yTG00d3lza1dzSUVLZjNH?=
 =?utf-8?B?TDNMNnUwMWlBUnAxYlNLZHQvenhsMGJUM2xRUjJvSWxCYldid3ZkQm8xcnV4?=
 =?utf-8?B?U0xTNVR1ZGJML1BJYVRyNU1FR2NTK2IwMkdXR2NUNHhqdzUyZiswUEk1byto?=
 =?utf-8?B?STBmREpNN2tYb3lvaUw4V2VablV1NUw5djJKUTBYSkNEdDJmNVVTN1V3SVhz?=
 =?utf-8?B?Tm4wcU9hWVZJekdDZDJ4V0VCUU9HQVRNczl0YmxldWZZcVkyNXpwenZESnJP?=
 =?utf-8?B?SDN6QTdLYUNucFo4M2EvTUNNKyt1Uy9NV3Ftd3lOanJyb1pLam8xNG16TUFr?=
 =?utf-8?B?NXFQdGQ4OGVZNTZMWDdVTHFKcm5PZTdYTEhPejRLdmNncmxrcHAzR3BzaVk1?=
 =?utf-8?B?emRoS1V1TnRxUS9HNEY3d3ZlR2Z3ZjAzb2ptVXc5MkZmUjVVV01LQWxVcU5H?=
 =?utf-8?B?L3lRNXZoenJQZzVtOG1JVi93OUtxYnlVWnNSSEpUN2RKODVaQ2hCd1hmalcw?=
 =?utf-8?B?eDZCcE9PSDJBbFR6d1ZNQkhhM0dZVk1abmtlSUEzWEI4TGtTNjNiaFg0RGVw?=
 =?utf-8?B?cnVENWtLRVE3Z3N2NXdDbHhwVmhTOXFSUzRVS2NMbHBpK3hSYWZjSWw4ajgx?=
 =?utf-8?B?MlJqQmRvNUNOemYySjVCSjVHRVlMd1d6UzMrM3FMK2VNOFZqd0VmODhlZDl4?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f3d0ba-d0a8-4ccf-e267-08ddec6a3e1f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 10:52:01.1706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQ7BgFZ2QvpAXxhC75AJycT+p+chMWcgQLIHk3tl3oDcIIQ/Hhh1zqgI5/gbupvpZLdhKzFuNK0NSIMeLrexIFic7NO/I1LiHaJD3zvPei0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8834
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDEwNiBTYWx0ZWRfX2JgfwMlKGB3m
 dlsXFBeqrWmVxYdvjkJV2hQZFDGG3XgTeWHspDvAzSri6cXIpgu5za76qfQgJVuboHqimA2T3LN
 UGjyZA27+HIpfUJ8uWfzx3Sx8PLkxrLC/3LPZBLelasbfnVxE8BzExQtRklQNwUrrmD3/jMih0C
 w0d+uUIKrkstFVpICnvnLA3AZc6lAXKrnIFqEG9AORLm69TLF0PVACABA87RLKPtu8Ul1gl//zb
 H1kJFr2fNVaQj2DcDk5kNHj4SQfQQqvNMS3xh8KEop8HhxhD33WnfTgm5uSjbTnxOw3a9k0+Tvg
 U5SRqFrwGKGLhG+pxIj+ckaLU3fBT7gPj95AoylQdHTJWvX/Y1uFMaYxMtXIAg=
X-Proofpoint-GUID: xDN7190rUS7ALU3VJbzlkSQIxa9R9Qpj
X-Authority-Analysis: v=2.4 cv=M5BNKzws c=1 sm=1 tr=0 ts=68bac0d4 cx=c_pps
 a=YHWiV09CJk0981YzTF1Uqw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Fh7QZJ50AAAA:8
 a=t7CeM3EgAAAA:8 a=Ba4_qL2YFbY7kBoGDJoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=NulwQ_N7bbDsG3TyehrF:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3RyDNXGGNLkdlOEl2DwQIODCvzuDNgkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5856t1ja446400
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 10:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222988


On 9/5/2025 6:42 PM, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 5 Sept 2025 at 12:38, Yan, Haixiao (CN)
> <haixiao.yan.cn@windriver.com> wrote:
>>> Thanks. But why set -eu is used to begin with?
>> We are following the industry best practices for example
>> https://sharats.me/posts/shell-script-best-practices/ =E2=80=94 The Sh=
arat's
>> points #4 and #5.
> Right. But then why not also add 'set -eu' to the beginning of all of
> these scripts, so it's enforced, and prevents future regressions? If
> you agree, can you add a second commit and resend?

OK=EF=BC=8CI will create a new patch for this.

Thanks,

Haixiao

>
> Alex

