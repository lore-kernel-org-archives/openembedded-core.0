Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E555F531EB
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 03:24:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10613.1776137061326109055
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 20:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=tJ6xxeIK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85647f3f2e=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E2cUrn3838083
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 20:24:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=W5kYOpGEqH4kd3wP2Q099L
	GmLAAzn7WXh/GKa6KeCs0=; b=tJ6xxeIK1KF21xtXO3RRLZVjXr99mfEIdYU95X
	HTa1rydm6NvcHG5ls6e3Hwq645jFnyNLg2hlL+3OAt+IvLwrvfatVG8btELPWLiP
	b8TFJ8PqZuuMvE1qV7CVisUfl4B3iZjQE0H4SLWcFIouNHVzzo8sHVlP4nLLc88j
	+DXhKKRA6XZ9sZed2h3LLkXyAwd1ph4EDaTHgN4ihxnmZty+Mgkd+Bfbt67kilnt
	dTDJaIs/EXYeBXr3EwHAMwspSPTx3VRVYM2AwBtsXRA7BoVCJ2kcu9UDb6xJI54f
	ggZmhlUPBUVyce/aU7V3Jczaz0a0dciVc5ALsmxYOivKK2EA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh86m87xt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 20:24:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4wSSdTsiqhBWBhfkvL+2kQwglJd7BOCjBDDitIoj4jgtQhemIDZA37Oa2091IrJJaj2eUHgdwEJZySJa/wYLYiISk9XP2rwsUrFEclzaHMlli3UHuz1kE5gCa85ZNO+azWrRbPzATODzHCcN2smUha5NM2EV6xPsYQvvJwPX9QK4KWMNh+PpF98pBP8pCRWOM52tt2ufiBUKh1SUQck0Kp0ibWv+sGjjLqQ7JNYs0N+JnM4d4GJGGCaD7Hpij+6dkJ/vQxPMKb11Lk5LQirsCeAKgth2avGSeQx+mDkvY4Rf7vifzZ7lOufyzhwIOvTN5HaO3/iB7c2PmguyC04yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5kYOpGEqH4kd3wP2Q099LGmLAAzn7WXh/GKa6KeCs0=;
 b=ExdkspnBJdElHk18feWdazJIxlzZrtDXnNn60g6bpgjNbG+VBzZCueVKW8N/4fTaa5m3eiRLQpByI/90qEljz/pkGO/nxTq1vEuzmbepY0wcPRVT9QRIdZGTujiq797M7SWLiFo211CG54MnV+/hi7i0k8vLZQFVtUbX9PGItwYqw/sz89zB1QWD5jVfgwvE5eRIhch5KLy8dxzwDtIVIcwiAt1OKbiwOCzPVMx7KN3hU01ilQ9sNHv2NLJEPq0sEoZlHRekN5z+JUNiTO1Rg9vhr5ZgMinBqtQNgaD0LY9XC+7H3BPXb9sSwtLEUDgfzABKz97ufsuGyN9aEoxIEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS4PPF6CF7B12C6.namprd11.prod.outlook.com (2603:10b6:f:fc02::2c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.41; Tue, 14 Apr
 2026 03:24:16 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 03:24:16 +0000
Content-Type: multipart/alternative;
 boundary="------------D3fMA1l0VMWQ06UYevXryDuK"
Message-ID: <979ca88a-b3d6-491e-8344-044e9bf5e8d7@windriver.com>
Date: Tue, 14 Apr 2026 11:24:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-bad: add
 ANY_OF_DISTRO_FEATURES
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260319015431.821325-1-changqing.li@windriver.com>
 <DHS549F2NTOV.O6QC1JNNT3O2@bootlin.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <DHS549F2NTOV.O6QC1JNNT3O2@bootlin.com>
X-ClientProxiedBy: TYCP286CA0060.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::15) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS4PPF6CF7B12C6:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eea1d3b-3fe0-4388-283d-08de99d54eac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|22082099003|18002099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	jHVLPHwHbQE/zP9OkxYq3ckyzLqFPTs+51jA5hs+HOB72epDTglkIZ896FVm9aNxp3pn8WRvb7rXX9ATEDEs86tT38K946e5H8eAHB4Z92qD/5zN6lKJvJjLCrMGbR7TYHu1x8LCT/cRnC9+4xXnmEzvmm4PcErF6llsQGtc784Q95qNtyeQmDVn30lKgQDFLvUObLB6euga98hFaVeJhq7UEas6wHbnmdxU/2CMuY0+Riv6CYpb6uVdILO/w+GycgTQXSWDqr01zxYY+0Ihc4UucyOnY7bHsIyygQOB2EaIiQercjx2aBucqx9U66sEwIg7UayChpIE+ZQ7O3lUBjOsNa+gcoazifIq3bEXvqkL8mDU0x3wcxkC5+QgEoHzViHgUqYzM9ecj2dSWB65TUuXWJGIEmYOWwu5krHXHDjqee+4YRobCVrP735pDOBSSuQ39LHle2Q7RW3yQK05vOTa28J5GILWKmZdlJJVgin6wfk+fflQ5kfb7h3XfAib9qSD+wKt7YplgIeI6LcmjTjyCKIZWx0kcGgHcWhDkEneO3OLn1rxM7odoUuA3KusMzwBIcWz41adcoblYc3UvzLlBOWFyIfrIPPR1SRKVZJk5/ImNJ7WAQKjs384TZW0x1dTXJHts+csbxQ60vwiePwb+eGw6nNU5QGFCeOrRd6TDmmJjHI8Il/bonuwnDch
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(22082099003)(18002099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eENGdXNmUnVySW1YS1l6VndKMTQ3bjVGNVRxSzd3QkNnaWtxUEtvT0p5VDN1?=
 =?utf-8?B?OTdqMXFsZ3JJV0J0eHArZUNpMlNVeHNJbDA0ZkxLMVlFWlZUVUZBdnlyRUxi?=
 =?utf-8?B?a0VmUnJNTXdlT2locDI5REc1aTcxYklGc1A3MktVSWUxaDBlcU1lVG1xQnp2?=
 =?utf-8?B?VjZGVS9VV0ozK1ZoaGRDV1JyNnlBOGpjSmt5aDZ3UmdlYXZhYzg4NHNIMC9a?=
 =?utf-8?B?UnZKVmhCWUY0cDhNTThyQ1doSXVYSXJvT3ZJaWN0WEJoU1F2Nklld29TV1JD?=
 =?utf-8?B?UE5ZME5vY2NIRUwvQmdydnNaSXlvN3lWNUhzNUZZNUMzZ3NtT2cxei9KU2VE?=
 =?utf-8?B?TmRqc25TMEZZSVZJUDBreFo2cExZSHpXVGdYbHcrK0lHd1pkYjFoODVEVnRT?=
 =?utf-8?B?bjFpd3lZWjJ5aHlscERScm1oT2VncHdCbVBtZUhCQzQyOG5vVFhkZWpNYVdH?=
 =?utf-8?B?RGNuRWpsaktGQ3VtckYvMlFHMmFBUHFoTHZRdUlVS0FTZlpEL0lQMFlFWkt4?=
 =?utf-8?B?RmNXY2hDTllZSko3VHNrNS9HVWdqRXBIUGhQNWl0TlNjaWlVall0MUtLUzlm?=
 =?utf-8?B?VDVHQ00zNEFNenBYZHoxbTFiOWRjSHo1c3Zoa0gweUVldjZmWWdyeGVqdEtG?=
 =?utf-8?B?OVNuVGJuM1FPTjhPS0s4ZUYxRW9tTERKUi9XVitqRUNLZGVPem1GZTVJUVl3?=
 =?utf-8?B?NS80UHRHWnBYMHRUQ21oWjdiRmV2N1dWaFJBSHJXUG5rR3lkK254b3RQV1B3?=
 =?utf-8?B?TjZxY0pBMGxDQ0htckE3RjgxLzBEZlJaYmVXRXBkQTRxUm5LTVZzZUp4cklr?=
 =?utf-8?B?Sm0rTEs0MGwxUWpNajQrRHhScHh3WktjdlkvWVJ4WG1MdHp5NHdMT1N2Q1c5?=
 =?utf-8?B?bGVYcExTM2tWYXdkemZUeFc1Sm9vK1BXQXVBWVpyY1R1WVNxaWZ2MkJEYW9L?=
 =?utf-8?B?OG5YQTA3SDZUazREV0RMT0pmS0NIUFpYRXZpSHdkeXJOUnlmdUwxR1k4aEVU?=
 =?utf-8?B?TDlFOHZPTERxN1lPLzVUT3U4Y3lUVkMvd0pQcndGZEpNVE5CTTQzM2wwczdC?=
 =?utf-8?B?RHFjMjMwOUVVZ2Z1V0hYQWxGcDhqd1gwMnFMV1RGdmkrdEFMcW5aOG5Nakw1?=
 =?utf-8?B?ay9udlI4YzRaeDFuRnFvdEJLQmY4V25McG82aHlnNnlRSElyRlVYclJvMWFp?=
 =?utf-8?B?cGJBTzk4T3pjVlhKUW9JcnVQR1c1TWpXMmhnV1VNaWp0RmwrNEVGZjJyNTdv?=
 =?utf-8?B?ZVVnWFd5TEoxbEtZSi9vaEhpWlMrL0F0STFsc0VBMFAzOW1COTZSUUxKdTU2?=
 =?utf-8?B?S2ozUlJTRit5WFk1TE02ZUhibk1hdWczSXBLY0gyaEVNaVFFWnFhR0oreDhy?=
 =?utf-8?B?UEErNXFvNVRYNGFqV0VUODE3SmU1NzlzMnhjd1M4NzdIZnl0ZUhRdGZzUDlQ?=
 =?utf-8?B?clZNM0NuWU5vUzhBd3FDbFJqOEt5MmFLbFU5N0MzWjVrT0FueGt6S2RmcnR6?=
 =?utf-8?B?ejI1UFgxZE1hRjJTRWdRcjE1SjRuWUJpbzA5c1g0NExlOHNDcVBNcXhJang0?=
 =?utf-8?B?bnFmMDh4STBZTDU4bjdtUW9IUDkvaTVuQXBPOURRYWUrWDBCNU83akNFZmFL?=
 =?utf-8?B?UlVhRVdDZE8rdWswVVdoNUFXeSt0K3hlM1FSYWRjcklCd0FSRE1iOEwvdEk2?=
 =?utf-8?B?T1ZCSExacVFGRUZVVmRydW1lNjZDYzNhVXYrd3Ava2s4V3FlQjNCT2FJNjFH?=
 =?utf-8?B?U1JyT0pzVmhXRElpeGFYS3loR0k2dGRsTTlrNjNzRnU2OFV6ZUNobUlNOUxB?=
 =?utf-8?B?YlRxQ3JJOWhoRng1ZkNKTlRud3JtRHRGUkJ3cng5V2t3YzZ5cnpFTEFjT3g4?=
 =?utf-8?B?YXA0ZzVNSVJxUUN1MG1LQTFiUndiNk0yTXBmWlJxeVFKNktzRmVMSGdwL2dH?=
 =?utf-8?B?a2hnSGxVUkJGbUx1SFY3alVRK2ZBZmE1aXBETVIwbDZEUE92ek9pYXNtSGZL?=
 =?utf-8?B?UzNYMGJob3VEVHB1SWRyT2ZQQlJIb1VrYzJERWc5WVFCbC9pYzNZRVVXSzFU?=
 =?utf-8?B?V0ZCT1FrNVlWVEVNenNxeUczR083U2RIWXU0Z3psRm51TC9tVTkxcEZwTHZu?=
 =?utf-8?B?UUdHYXJiWjRHeGk4UTRzOEVlb3FsaldJYUZ6Q1FpcUpHcDJBMjdzOElZZFN5?=
 =?utf-8?B?ZDdqeEd6aDQ3L1hWUlNDTkJnYk91bzQzSjZnZkRqMC85M1lBYWxSMFJxS0Fy?=
 =?utf-8?B?TC80V1Npa1BNUGFISXc1alAzMi8yWWtIVWF5cndJUFlHTHljWnNQZTFOdEhZ?=
 =?utf-8?B?eXhDZE15SUpDaGhoL1ovYVRPRWx5S2h2cHJXbEF2bGFVZGRiZUZ6R1NwbkdP?=
 =?utf-8?Q?y5bTDJqfbIFaUi7E=3D?=
X-Exchange-RoutingPolicyChecked: 
	pRCqhhw0eTF9wrjrwgdMcKB05jQXNodP9h65o612W6jCNRPGy4dyXj5rCR4kkr7nNpwl5FFIWx+YqrXxb6MbAuLW01atYdtKiC7bL2Ej/KmhOT+VNqGb+oo9ryOavT3yt7LJtSACe3hQfLEQ4XCKni5LiA3b4i9HO50r9iyyIAPRwCQD3DaBF/ofFRLYG/yM/R2BIpIiLCLhYFy7sTXrcpJwf+8j3tdhRlt2jEZ4NJjMBh3QOkTZ029eQXtzr1m5+Bo6X64H3FfKj5PiZHrBpI5w2HntHfXSKYvQGIRrHalQHZ/0vva6Nx+Ut704t2OS714MjGvFKN3YzeetWxDRIQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eea1d3b-3fe0-4388-283d-08de99d54eac
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 03:24:16.2730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJjuBJqmjOrh+3kchbiT3fNwIFrFgIFD6cOy80ZDuQFR1rU0lWzAl+68zvngyvV0I2jNCZnHFZXDnw+ShCHDLUxuMcvAB+jL0q8bKAoHqqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6CF7B12C6
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Q5riJY2a c=1 sm=1 tr=0 ts=69ddb364 cx=c_pps
 a=6Zlfg0iwFc/B+5Yb0ubQ1w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=P-IC7800AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=GMgLOikWS8AB_qJ3Wh4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=yj-aMKAYKbz0kkd27lYA:9 a=e4r2EOMgtL7jSrSX:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: c2CPyJap0sHGBRhZ4tE3-4NgbApbwhNT
X-Proofpoint-ORIG-GUID: TjXYyOYA91_7BfFErkxo7aIXdPjDEr1c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzMCBTYWx0ZWRfXyPzpXMUaZ8Ev
 1FICqAt/dFpgb2voisKmhcSGufhukhh4xnnlHLLLODTABHw9bGpkwfl/IvHeQeBBp3L0nQ9uzv3
 kDtGRQqioNxoQLgVPMSPVDZ+sxiY3enDjNAELE62YtA3iTXJJzeV3w9o+9o2n3cOMwqOrJJURnP
 DHjZP4aahL3mzN95P/eoT59oHVAq8etyjGKxeHVT8s+eKvd/DyGkyadedEH3fWuwpPkKemc3NWu
 dvrgEaoYKSavmt1FFN7zuKRbsLz+KNqZXaGbYQtXBZmKZ729sO7aSi/NHhhAmpG7gVrV4onlQfC
 wuPzYU5bUQWbBzImj7EcdpxeeJAFjSWiE5mjv2Y4IL+/EKYVMO5r8uFmEGKv4jyx+0I4sYuOUBv
 pPoK7TmvQCfukP6Yvu7LCgY1w5Bokd0boaRQdozrfdbNDQCpwg0JNewehs/BWvHsIRTq0YDut+P
 riUPAWcSiZpBWLdpcZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 03:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235133

--------------D3fMA1l0VMWQ06UYevXryDuK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63E2cUrn3838083


On 4/13/26 23:42, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu Mar 19, 2026 at 2:54 AM CET, Changqing Li via lists.openembedded=
.org wrote:
>> When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
>> do_configure will failed with error:
>> gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No =
Windowing system found. vulkansink will not work
>>
>> set ANY_OF_DISTRO_FEATURES to make gstreamer1.0-plugins-bad build only
>> when x11 or wayland is enabled.
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
> Hi Changqing,
>
> Thanks for your patch.
>
>>   .../gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb              | 4 ++=
+-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ba=
d_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_=
1.26.9.bb
>> index 4a9cb37dd8..2cb00f180f 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.=
9.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.=
9.bb
>> @@ -19,7 +19,9 @@ LIC_FILES_CHKSUM =3D"file://COPYING;md5=3D4fbd65380c=
dd255951079008b364516c"
>>
>>   DEPENDS +=3D "gstreamer1.0-plugins-base"
>>
>> -inherit gobject-introspection
>> +inherit gobject-introspection features_check
>> +
>> +ANY_OF_DISTRO_FEATURES =3D"${@bb.utils.contains('DISTRO_FEATURES', 'v=
ulkan', 'x11 wayland', '',=20
>> d)}"
> So the error we get if we try to build with "vulkan" in DISTRO_FEATURES
> but not "x11" not "wayland" is the following:
>
> ERROR: Nothing PROVIDES 'gstreamer1.0-plugins-bad'
> gstreamer1.0-plugins-bad was skipped: one of 'wayland x11' needs to be =
in DISTRO_FEATURES

yes, if user bitbake gstreamer1.0-plugins-bad, this will be reported.

And this fix will unblock "bitbake world" since gstreamer1.0-plugins-bad=20
is skipped

>
> To be honest, I believe this is a bit misleading, as we are not
> mentioning the vulkan DISTRO_FEATURES, while this is the main issue:
> gstreamer1.0-plugins-bad can be built without wayland or x11, just not
> with vulkan.
user only can get why by checking recipe settings
>
> I would really prefer a better error message, but otherwise we should a=
t
> least add some comment in the recipe explaining why we have this
> ANY_OF_DISTRO_FEATURES line.

I send a V2 to add a comment,=C2=A0 user need to check the comments and=20
commit message

to know why ANY_OF_DISTRO_FEATURES is added.

Regards

//changqing

>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
--------------D3fMA1l0VMWQ06UYevXryDuK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/13/26 23:42, Mathieu Dubois-Briand
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DHS549F2NTOV.O6QC1JNNT3O2@bootlin.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Thu Mar 19, 2026 at 2:54 AM CET, Changqing Li via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
do_configure will failed with error:
gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No Windowing system found. vulkansink will not work

set ANY_OF_DISTRO_FEATURES to make gstreamer1.0-plugins-bad build only
when x11 or wayland is enabled.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hi Changqing,

Thanks for your patch.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> .../gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb              | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
index 4a9cb37dd8..2cb00f180f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
@@ -19,7 +19,9 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=4fbd65380cdd255951079008b364516c">&quot;file://COPYING;md5=4fbd65380cdd255951079008b364516c&quot;</a>

 DEPENDS += &quot;gstreamer1.0-plugins-base&quot;

-inherit gobject-introspection
+inherit gobject-introspection features_check
+
+ANY_OF_DISTRO_FEATURES = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('DISTRO_FEATURES','vulkan','x11wayland','',d)}">&quot;${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'x11 wayland', '', d)}&quot;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
So the error we get if we try to build with &quot;vulkan&quot; in DISTRO_FEATURES
but not &quot;x11&quot; not &quot;wayland&quot; is the following:

ERROR: Nothing PROVIDES 'gstreamer1.0-plugins-bad'
gstreamer1.0-plugins-bad was skipped: one of 'wayland x11' needs to be in DISTRO_FEATURES</pre>
    </blockquote>
    <p>yes, if user bitbake&nbsp;<span style="white-space: pre-wrap">gstreamer1.0-plugins-bad, this will be reported.</span></p>
    <p>And this fix will unblock &quot;bitbake world&quot; since&nbsp;<span style="white-space: pre-wrap">gstreamer1.0-plugins-bad is skipped</span></p>
    <blockquote type="cite" cite="mid:DHS549F2NTOV.O6QC1JNNT3O2@bootlin.com">
      <pre wrap="" class="moz-quote-pre">

To be honest, I believe this is a bit misleading, as we are not
mentioning the vulkan DISTRO_FEATURES, while this is the main issue:
gstreamer1.0-plugins-bad can be built without wayland or x11, just not
with vulkan.</pre>
    </blockquote>
    user only can get why by checking recipe settings
    <blockquote type="cite" cite="mid:DHS549F2NTOV.O6QC1JNNT3O2@bootlin.com">
      <pre wrap="" class="moz-quote-pre">

I would really prefer a better error message, but otherwise we should at
least add some comment in the recipe explaining why we have this
ANY_OF_DISTRO_FEATURES line.</pre>
    </blockquote>
    <p>I send a V2 to add a comment,&nbsp; user need to check the comments
      and commit message</p>
    <p>to know why&nbsp;<span style="white-space: pre-wrap">ANY_OF_DISTRO_FEATURES is added. </span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Regards</span></p>
    <p><span style="white-space: pre-wrap">//changqing</span></p>
    <blockquote type="cite" cite="mid:DHS549F2NTOV.O6QC1JNNT3O2@bootlin.com">
      <pre wrap="" class="moz-quote-pre">

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://bootlin.com">https://bootlin.com</a>

</pre>
    </blockquote>
  </body>
</html>

--------------D3fMA1l0VMWQ06UYevXryDuK--

