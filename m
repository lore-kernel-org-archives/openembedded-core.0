Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B23C44507
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 17:11:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.937.1783962677301001094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 10:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XrsAI/Ku;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1654972631=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF82qc4012412
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 10:11:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Zih8m28LbRENQHPBwn3Z1G
	0VK6Ds5InWVAR+tkDpli0=; b=XrsAI/KuaxGxq7AKkUyxRj61TOHNfRtkBt5lWa
	f+qBt7AVse+Cv4DPj/wGps10gnbUKRzwcI94ECCxYD1Dh3NVt+vgLC2o11Wo4XYW
	FmzP81vSRDH6l8mfj5zvandO6WMlKDhOUae56kZeEt9VgnsWwHhD8/saaFraLC4k
	gMJP+apCSHtgvn/bHrIyJ+jx39T4okdKRgp6iMNkOleKL5BD+fx5rebnEjSNQblb
	UqsCL7tW8hB21Ix2eZr/LkyCOyrqxclFfMMebnLemBjNmpMGWG6oTIQa1lERtA+a
	a6sFPPzHHoLA1dlNux/dxmP6VU0fw5aWbl16kCAwkfAJ03HA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010003.outbound.protection.outlook.com [52.101.201.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbh40tkre-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 10:11:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVMKz5QCWNPnoabe1fNIJk0gQuvjX13v63n3IRvZ7lW9j8I5s9nrRjpwdUGYdhhTBfjmBYP3/LtSgm4AxhVA/XXLAtDgK6wUTsQes/VJ8LoOdDAf2drdPdPw284LAstHTEypyqe4wAt9N8tRWZkP2HMJVfYb+zbfMORrQE6Nw0M1GspGXSNrxB6u70Tko9CGlWF6uFFXC2mAfwnd3uJJJeP0ZD5tbfoalB9dZQSmLIFkHRjJXl+buzSDcFq7v3al4EdlGTguGEIhKigCZtGj7zJERbpdl1b1aTRtEC0+N502Nn6V75GxIV/Vz31yGN5Ibsa2h0OBZ/ac3H0M4U+QRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zih8m28LbRENQHPBwn3Z1G0VK6Ds5InWVAR+tkDpli0=;
 b=BJJPmizV8k4Jh1hXnihHpjpL+t8vY1uzbPekJmv8ydRM8hFT+DG2xZLpuAR9zeoAw8TES4PIWkOX9cxYvNi+m7aEjv2QsovqmAnuTYR4DgCq/y2Z5xSvIPWlZG3oZOBenKn/Eb1Lb+TAykRtVM8ZXOVDOAYjsHTCESN6fUxr1AGdk8kwNeLFPn9wD7oYvPPmEn4pQr9ck9PZNWeDFi1+iYaAPmHqMP4OoQBLPKQUF8NP1uEFtn5wuQVgJFVzUv+lqpZP6RamBZWnMRCXnfwC+VqmlDW5CY1X90DoRSf9zxi88Kj4KjZW3XOGQXXVSJ5+9bvGRGoedXjvFQYh0QOaqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CY8PR11MB7826.namprd11.prod.outlook.com (2603:10b6:930:76::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 17:11:13 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0181.014; Mon, 13 Jul 2026
 17:11:13 +0000
Content-Type: multipart/alternative;
 boundary="------------SN2YRjVexOGGHvyUysO2vHxK"
Message-ID: <8fbd0e83-94f6-4447-808b-7ef6b33e6a95@windriver.com>
Date: Mon, 13 Jul 2026 13:11:11 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 2/4] kernel-yocto-rust: use clang toolchain
 for riscv64 when Rust is enabled
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        raj.khem@gmail.com, Ross Burton <ross.burton@arm.com>
References: <20260708185724.2183159-1-Harish.Sadineni@windriver.com>
 <20260708185724.2183159-3-Harish.Sadineni@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260708185724.2183159-3-Harish.Sadineni@windriver.com>
X-ClientProxiedBy: YT4P288CA0095.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::29) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CY8PR11MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c846bc7-f7cf-4214-5544-08dee101be15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|366016|23010399003|376014|13003099007|22082099003|18002099003|8096899003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	XchrpHyj+3z9Vch1QKW2dwAEMSGAa+jxlxM12KptXSZTCUAfB4StRoRejUqY1ry2sYUM3D2umCiox3mbVWo2/1QjeidZBZ/ZJEopkLzW+9dwk6LoCb9lHzGtcmiSB/5aD+Rlf9MsZqiBSGoyyExTzPmHq4IHPQIqQvYoAokIm1rUYtny+LnR86w00D3XqOL6gLhmNmv/Y2v7bxY9XSar7bEmV6sPsYaVJ69laVsgmaTo/R3a0DR7bypnqBMGVh3zY+h3QXyHB5GEKas0QJPtFCjDnflZPUAKuwep7skGiPVOFF0n52MbEbqRUm66DpzXU3stdXt2VF1ug19SZuPAvdV3PUb/nrViZ/M7Z1KWAjEmnldy5UTufzJK+CRtir02qHaGemzwBIn65E3p55Q+klguAWmfDwTVVErAKpnVhA6VNtGlwbmaZmmmsyQ/KzYH98kAuYhOFQ8yBDM5Qjv1bMKsKKfEKxyTXBqLqLqGcuxaqYwbOFRGE2ZGHyZCD8BS9LJrBmuAdv553XGzhSxibemms4qRH60vsU/Uf4uaFTxcu4wO5jCqcOouSghOeV2XUra1TQWryUZ9kHjLYmjSPsjUxedX5MLH1ys06EzosThNxq+zMsK1kTAdpcSSXOTO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(23010399003)(376014)(13003099007)(22082099003)(18002099003)(8096899003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UVJsV21VZXJ5OEhYNWxDU0FVbklKVVpxcUg3bG9aRWllYWVyRklYazdtZ1Ba?=
 =?utf-8?B?RlNpamtVeEdFWTVZd1ZkY1pvSmI0VFIzQTREdlpIT012dDRBZ2xFcDVzZzgr?=
 =?utf-8?B?QXBGd0JaeFpRMHpHQi9JbFA1MEY2Vm15WjA0NDU5Zy80dFRXQzV1L3R6aUtD?=
 =?utf-8?B?Ykhvc1NLVW1icDcwOHEydmIraDUrdjNwWmQzL2JieWdrU1c4M3dlb2lqaTdL?=
 =?utf-8?B?ZSt6ZGNNMlQ0cVpMbkZWajJnL1l5Nm1hMnA1dFo1WC9oaWhyVkdzSzJKdHJu?=
 =?utf-8?B?MWJFV1hWdUxCNk1DcllWNEZxVENqNFFCQUNZZHVZZmVpTGlJUW9YUkNIeUVt?=
 =?utf-8?B?RS83VU16K1RNS29SM3B4RGhOT1lQRndVVnpwTlJLekdnS1g0MUdJMjFacHBk?=
 =?utf-8?B?M2FxUGExWUVsMG12QjBKUTBySmhldkRzMXpVQ0txNUpQL2pQamlzZER1SkRu?=
 =?utf-8?B?NzBMK0VndFQ3a1RDa0FFampGa1BHNzVjQ1lwMGtMUjVPMnFyeEZ4ai84ald1?=
 =?utf-8?B?UCtjVFZ3WWRtN2poSjNmNTVUTzhDdnd3ZkJsUnlRS0JBU1ZrTWRQZnc0QVk4?=
 =?utf-8?B?VDFEZnVJaVVwMExuRzVJcEw3RUdlbFdKc0V1Y3AwTDI1ZjRpU2QrdjVhd0xh?=
 =?utf-8?B?Zm5SUnp1N0lXa1JWMmlKTFk1T0hrdnJRenlHTnRuTlMxQllKS3BpYjQxaWRJ?=
 =?utf-8?B?NGRsWDZUVmhvcTdiRnN1SzhjenMvRFFCYzVvc01rMWdjQzhucnIydVJCb2JD?=
 =?utf-8?B?dEtZNVAwVm9XQ2xTY2V6Z1V2d1lFaVJ4bEVWUFdXT1U5dXhLdzBzNXAwcUhz?=
 =?utf-8?B?clp2RUN5d2wzMkFLQkgyWWI3VmhiRDBZRkpzTGp5dVdRUEZOM3I0OEFiMkJJ?=
 =?utf-8?B?SFo5RmxUWkw3R1FaR3I1Mk8xTWhoWW5IVmhYRzloSFBPQXdBTWZuUzczR1hL?=
 =?utf-8?B?WFVQM1FnMWJvNEtueVZaR1ByT1pnL3NzSHlyR25rQUdrZHNzTHZsWmtNSEN3?=
 =?utf-8?B?MkNpQVdCR05hNDc1eFJsTTQvNnRKbTJjWkF5aFUwTUNrR2pXZ1dLZTVTSDJo?=
 =?utf-8?B?Wk9HOTc2L2dNYVdGYWNZaFFwZ092KzYyaHJZUzRQaGVkSjNuNE5DOGdWNjV4?=
 =?utf-8?B?K3R0eGYwOGJDaWtkNk42MHc4M2EyMXB1aEV5anUxZ0huL1VxSUI3VGM1UDdn?=
 =?utf-8?B?TmdKd01IOVUvTFFrYnRWSjQ1WUg3WVBpL2J2UVBYR2ZqeEtuMlZnemJNM3k4?=
 =?utf-8?B?aE1RYW0rU01USGdtc01nMFJpSGtRYlI3Y05OMmtjcnpWdlJVZktqR05ydFBF?=
 =?utf-8?B?eVZ5UUhJWHdTejgvWmNPaldwblBzYXhVSDY5ZlhVd1RLN01vMnFCNWNuL3dl?=
 =?utf-8?B?SjRHSy8yMXV6SEVkUlFhaHFEUWpnOGFNUnI1OFNhRFcxK1J1amt3ODNXRTNo?=
 =?utf-8?B?R1dMZlJtcU5DQzR4VjlZREMxMThpS3FtSHdZbkRUUzNhZ0hWT0lZZHYyZGNo?=
 =?utf-8?B?aXJMZWsrSFJnZWZrKy96Vmh2T2pNWHRHMGh0L08vK1lGK2RBWHh6eUVUWEVY?=
 =?utf-8?B?elVwK09kQmVhWGswYkk0TWVPQ2VScGJTMENOeEI4TlQ5Z0Q3TU9XL0FhTWMr?=
 =?utf-8?B?Yks5R1c3V0IwRkpGWU5BSGIwWGVLZGRWM3h5VDgzSXdrZyt3TTBjUTdvNk0z?=
 =?utf-8?B?Q3Rvb0N1emhXYVFKZ3oyNTQyUFdic203VTF6NVNFY0JHSUZOL25NRTJLT1hS?=
 =?utf-8?B?YkdYaG9RYzZlNmdvem9tVE1JN3pwQkJSZjdIL3lGaldsNDFTU1ZWWGl3TzVy?=
 =?utf-8?B?Ujc1cmt5RUtjK0pIQldieVJ2YXQxdEVtZ2wveWQxc2ZBM1pKNmpJMHNwUFdH?=
 =?utf-8?B?YktRS3VyaFgreGkyWHExd3QwNXN5T0xPN20vQ2tJWjdkWlFVbllGRlFldXBU?=
 =?utf-8?B?eUsxYlVuMEp4M0EzdFpDUnJwdU9CTS9jaDY1SjAxVGpWRjQzS1dBOEVNa2h0?=
 =?utf-8?B?ZWVwNGdQKy9DZllNZFp1YlNjODFOWDRQYW9qbkdzNllrYXp6cmtWZXFUbjlY?=
 =?utf-8?B?QmtmejNyc3VVMzY1MTNMamttYnFrNUhkL1hGcjh3OTlRdEFIeEgrTnZtcnQx?=
 =?utf-8?B?VitUQVc4ZXlEQWgycUhycFRtRzdyekNpUmNWWGhqNVNCN0tSTzZUUVppSzll?=
 =?utf-8?B?VnVWN25Wb05kMmdoYnJUWXV4TUk1dFNpbnRCVzFnWmVQNENKem5kUG9aeFlW?=
 =?utf-8?B?Sk1nT0xqQ2R2L2dUSEVoVnBIcVdzQWM2OFlZMjlIaW45N0xvc1BQMHoyNEpD?=
 =?utf-8?B?TWtSSjYzeEZmMjFFbEJNL2pjR1lUSDlBRUszazlHU29HbXZEUWFsK0pmT0xz?=
 =?utf-8?Q?ETUuBEFF16zks8X4=3D?=
X-Exchange-RoutingPolicyChecked: 
	fehqf0VxA3gDxrSDFVU1RY9aOj3DmK6KiZaeGrYi9Asp1Sr1cm+xPsGUiaV9Pnhb6TxITh5Ve9NIzXXFFeqDbK5Hg3i1BMopaiv0Ub2sHzi0+e7VzBTWPC9kk1u9YMYpXq8KoPTlNhq5VYAHp1GpvTRbUBtkS1Eo+Ml6gbNXAAf3k30UFY6iR1AZpkCFKCYe6El+5RFp+AJ4IXQ1Acnb76gjUBlKYzwKKQVZhEKD0lTAs5RnmliBQSTbX3RSfkws8iWrCF1s02Th9UxwnRcFzJ9fmrz4ziJVEGNOjnRJ7xAdCffBkm+vpgVABOenycT6FlmBVbiHSR1VQ3kCZohZSg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c846bc7-f7cf-4214-5544-08dee101be15
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 17:11:13.5647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LiHWiW8VVBvg4JtxxThZSC+qtdPcreQje+V4IWk1QRxdMz1I0lq6TIC5ZzsuZ8YJIjCwxUXKbJcn0rMBhAwLJ5jyrhZOYATX0zWvAzsL2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7826
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE3OCBTYWx0ZWRfXyapFK7vR7rtl
 OcSpJo5YPSNkhDKqcHPEZvq9J3I2wBQWCRO8O8QInXoGxoJ34Q1STj+6P8yj8rj11VMcryWHYsz
 v53IAvDLQ996zCXSETWq2Mp2ggFfPuHXaemgWHmO1d4Kt3scpAqI64ogqFu91ncMxNWnKVKcjDC
 ObZYMALA2OmwT3I5IAj/d60d6BRaR1f8FPT8kqTbx6zNgZiOLZHH4AnMgin3H4An/VSXjms4OOB
 PRDwPdpK2b1rdvy9Nj3RQXsm9IhGZJWZM3Hs7Pp9V2VicsOMX5PEXY66t5Bdt2qFFMMRNCqIIkC
 lLnH4bEssgjXfkkT0P5wBE9my0LAj1JlRVezWoEZSsfRODBgPhdMhcWhTATD6Iem//7p/NT/diB
 XAlAMSCr08wJlKPzOOACNGwV7hzy5xa/CK10BmVg3TU0O4DcUXuv5BkEvukg0rR90MR+YilebI8
 5v7Pr8gnEipoFxrcD4w==
X-Proofpoint-ORIG-GUID: pqJGzmFs1Ea0lfxzEvJa6Oa4xa394ug6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE3OCBTYWx0ZWRfXycSq9xqErtUC
 5gRTnb8ygK378gwVGLMCDK37LBpqYiAoqSPzNo2fG8qM4CK+ZTm18GHooK5r2yfXXh1tuPGXDn1
 Dz87hXFthuW59u5VOcoxBPimRGBjOOunogx1YoJ/1u/lP1Z+MV8B
X-Authority-Analysis: v=2.4 cv=JbGMa0KV c=1 sm=1 tr=0 ts=6a551c34 cx=c_pps
 a=LQDsqUhXq6x2TIKBD9Oruw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=VwQbUJbxAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=o-8qKBzwFfo6sk1CEowA:9
 a=QEXdDO2ut3YA:10 a=CYY6hzk5qNSWSWAvqzsA:9 a=lDfQuAiOgJj7kJJ8:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: NMA-O8yljeeddmSytdyrngHZVKHHtb2h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130178
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 17:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240848

--------------SN2YRjVexOGGHvyUysO2vHxK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2026-07-08 14:57, Sadineni, Harish via lists.openembedded.org wrote:
> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>
> Enable LLVM/Clang toolchain for riscv64 kernel builds when Rust support
> is enabled, as Rust is only supported with LLVM toolchains for this
> architecture.
>
> This aligns with upstream kernel Rust architecture requirements as
> documented in:
> https://docs.kernel.org/rust/arch-support.html
>
> Acked-by: Bruce Ashfield<bruce.ashfield@gmail.com>
> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 4e230d405a..5d047b5f01 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -91,3 +91,7 @@ do_devshell:prepend() {
>       d.setVar("HOSTPKG_CONFIG", "pkg-config-native")
>       d.appendVar("OE_TERMINAL_EXPORTS", " HOSTPKG_CONFIG")
>   }
> +
> +# For riscv64, Rust support in kernel only works with LLVM/Clang only.
> +#https://docs.kernel.org/rust/arch-support.html
> +TOOLCHAIN:riscv64 ="${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'clang', 'gcc', d)}"

Rather than silently switching the kernel toolchain,
check for this situation and exit with an error to force the user to 
specify the toolchain if they have enable the rust KERNEL_FEATURE .

The user should be responsible for and informed about the requirement 
rather than having them finding out some time later that
they have been silently switched from gcc to rust.

Also, if the user has already switched to using clang for the kernel for 
risvc, the no action is required.


This patch series was review in today's YP patch review meeting.
The first and last patch will be merged.

For the middle 2 commits, in addition to the change above, merge them 
together.
This ensures that the shortlog for the lld-native change also specifies 
that it's rust specific.
and it enabled the build in one commit.


../Randy


>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240512):https://lists.openembedded.org/g/openembedded-core/message/240512
> Mute This Topic:https://lists.openembedded.org/mt/120178683/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------SN2YRjVexOGGHvyUysO2vHxK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix"><br>
      On 2026-07-08 14:57, Sadineni, Harish via lists.openembedded.org
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260708185724.2183159-3-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>

Enable LLVM/Clang toolchain for riscv64 kernel builds when Rust support
is enabled, as Rust is only supported with LLVM toolchains for this
architecture.

This aligns with upstream kernel Rust architecture requirements as
documented in:
<a class="moz-txt-link-freetext" href="https://docs.kernel.org/rust/arch-support.html">https://docs.kernel.org/rust/arch-support.html</a>

Acked-by: Bruce Ashfield <a class="moz-txt-link-rfc2396E" href="mailto:bruce.ashfield@gmail.com">&lt;bruce.ashfield@gmail.com&gt;</a>
Signed-off-by: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4e230d405a..5d047b5f01 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -91,3 +91,7 @@ do_devshell:prepend() {
     d.setVar(&quot;HOSTPKG_CONFIG&quot;, &quot;pkg-config-native&quot;)
     d.appendVar(&quot;OE_TERMINAL_EXPORTS&quot;, &quot; HOSTPKG_CONFIG&quot;)
 }
+
+# For riscv64, Rust support in kernel only works with LLVM/Clang only.
+# <a class="moz-txt-link-freetext" href="https://docs.kernel.org/rust/arch-support.html">https://docs.kernel.org/rust/arch-support.html</a>
+TOOLCHAIN:riscv64 = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('KERNEL_FEATURES','rust','clang','gcc',d)}">&quot;${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'clang', 'gcc', d)}&quot;</a>
</pre>
    </blockquote>
    <br>
    Rather than silently switching the kernel toolchain,&nbsp;<br>
    check for this situation and exit with an error to force the user to
    specify the toolchain if they have enable the rust KERNEL_FEATURE .<br>
    <br>
    The user should be responsible for and informed about the
    requirement rather than having them finding out some time later that<br>
    they have been silently switched from gcc to rust.
    <p>Also, if the user has already switched to using clang for the
      kernel for risvc, the no action is required.</p>
    <p><br>
    </p>
    <p>This patch series was review in today's YP patch review meeting.<br>
      The first and last patch will be merged.<br>
      <br>
      For the middle 2 commits, in addition to the change above, merge
      them together.<br>
      This ensures that the shortlog for the lld-native change also
      specifies that it's rust specific.<br>
      and it enabled the build in one commit.<br>
      <br>
    </p>
    <br>
    ../Randy<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:20260708185724.2183159-3-Harish.Sadineni@windriver.com"><br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#240512): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/240512">https://lists.openembedded.org/g/openembedded-core/message/240512</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/120178683/3616765">https://lists.openembedded.org/mt/120178683/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------SN2YRjVexOGGHvyUysO2vHxK--

