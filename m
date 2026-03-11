Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE03FD88E0
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 02:28:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12089.1773196085830395836
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 19:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=boPG6VIZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7530e974aa=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B1skj2220610
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 02:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=/kizOAhkkbyQggP1OCv+3W
	q/ZJTNWHzLvKKJxyDbAH4=; b=boPG6VIZfvK5jdVrktPe1WOtj3QCgGs1scwX4X
	i8flwr36hrE5unmaj75zlDtSKhg5iAs3RW68p/JrS0AdltD0oyPRuwoMzvrin9Up
	fSDVvfSfkb4AGf0Dezisc5RSRFKEjV1STq5xWlA30ANQKXf/cu1lHBkcDfuJ4wiW
	IPv7h6AAqvyn5ESzj0ZCr/hnEzHblWVEh9/pOlNIB0cXvp/wKjYqq9QrS/ZRIR+M
	CDA5FeLi9PEOA1AScgFcrJXDjgOvl98IFYiaH8n341iMOsvYpWgyy2sWWQsMEcnU
	FbyF6csomz3XVF18gDD7n1iQiPr50JZXDRetypTCmBUZDt1A==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012010.outbound.protection.outlook.com [52.101.53.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty5780wm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 02:28:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTeRqPUi19GfLwm5Uu3R4EHscLRhjW/w/mLBI0+qCDonAFowxzLa+dMCoCMjlKbX2qp+ED4Wo+w1U6ZlcXMjltDwLkNH1QgOkAyrlbrI6+NwMG9TXLNrCUBbPwkG6RdEGCufCaGwsgMIpsRb/AMNb+3KDtwvtYjRB1HxcguMxPxhQlwcZskqVsDue8HgxV6tBmtQGlVh9VLH5EbJMKJYh85W/TGhup13u2FgkCsZBtFlqdkJ1LcW+8wjVGCsHmEd9YDID13Jo11p8fLMa4WAlBJeGQeARP9skvPt7Mk0sd4awTN8qwVMVKzzN9uBjtHBTUABEs3BlNu73r7/VMFT1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kizOAhkkbyQggP1OCv+3Wq/ZJTNWHzLvKKJxyDbAH4=;
 b=F2Unh43xgm4kodHmt5a2pBA5zwvT/kpPs8SpJ+n/nnxVa7pJ5vgkrpykLnF/cmguqBGdqB2bMgE/IItjDEDvmix7robQYxI6+om9ggbWx9jao40K4hb+mazyC8balknVcwm1TOv29WSbkP4kTkBmONdZXZj9QsihtbcNw+m84KubA172fBM6+lE7fAnV7hM0+0kW04KqPbCyhZLaov+P5xtBkwGbhgz9y21rt2RIm9MpNINfvWsqyRu+PP4GE1IwJFk68FsXs8uSc5syO5vYtb5cMG/wPR60c6ZEhrpDjIIgwtLRPec/Hv/QDa3LoTBJ2+1XMPbMpfU6KuigEU6xCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA1PR11MB6895.namprd11.prod.outlook.com (2603:10b6:806:2b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 02:28:01 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 02:28:01 +0000
Content-Type: multipart/alternative;
 boundary="------------co6khozGEz6Dx5GP46HozVmS"
Message-ID: <6c27908f-8f66-42df-980b-1bb4e20bb5f2@windriver.com>
Date: Wed, 11 Mar 2026 10:27:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2] appstream: upgrade from 1.0.6 to 1.1.2
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <DB5PR02MB102138725558AB810833F8DFCEF74A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <20260225034013.1510432-1-changqing.li@windriver.com>
 <C0CE5EB9-AB4B-40D5-B625-3C34119E3099@arm.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <C0CE5EB9-AB4B-40D5-B625-3C34119E3099@arm.com>
X-ClientProxiedBy: TY4P286CA0110.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::19) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA1PR11MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: 6685cb37-8131-4e7f-0616-08de7f15d0ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|14052099004|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	KVCUuNZPB1Gn0mI12v54PRzex1HD9tkAh5L5sGJW3n169Eqg9Vr4FeeAxcU4TnL7AODAq16Ero/vdBxZ0CY1vuab2rNkIdEJp+rQaJ+j6ezxYPPRHyqJDUwHH/GPyhId3KDxfCOqSDXM+BOR5cmrsQaPe+N2SYFwtIljMTqgDFMbZjx7bo9SpjFbMPzEAzkHJAX//WzXpKf/a0GmWW2sjKcuXbcny2J4A6iBRl1BOOP2IRNQVKG+OyAd73v0LI2y3d7JmF3BFJQqAHTNOYUmC/sFbwRxHRIT5rWlBYTN9zucSowrMqLdo1YN5V55djZkQr0Y+tVKeZHqzoyyGBPpamQfTek7CWIljExHzt/qTgNcNLRY0CEtEpq7qQM8VB0/4h1J+/ifEFrIk1YCc0oMKVtSb/Ipbq+LfiwGJAy6ehtU49reuYKPqFSpjc4R+Ga1zlm3i3otG74U8T54c9YK0MAXvY9pND11IST4UUi0LWm9csuLp97NI38qsPu4+WcKPPhx7b6VNBklfVLMYylKROEwPgiVG/ul0r5w2ub15hGfspYE3MJyhIvYEcP9j+csBRs4ixZ/KJ5kk3zVnOoey9v0UdqwMB2qUIxAXRdbJ7SKmiurg+vHLQqG0J7N4UXfvv4juenD2YuhvHesUHCoXw/gzfry3eLLX16mnkVBH+FmFiZiWYzEkDlDDfMYGXnBWRdA5vUwxjv+cOmQgzIGtBxVCHJT8SeTPcebS9Nn8ew=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(14052099004)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eEpieGp5VEhWM0lINkFXYUlkazNZYWRJUTNPMlk1dEIxM3pMelZQblFJMUNB?=
 =?utf-8?B?WTIxWFdpZ1FxenJ3VkFFUVQrOEhKUW12SEZjSkxNc0Y2aXd0Y3B0bnFST1Qz?=
 =?utf-8?B?U2oyUmtWZk1SdGNoT3BJQXlISzRXTndPeE9yR1pROTFVbnE4SVpuK2NhQzFv?=
 =?utf-8?B?aUsvbGN5QUU3Y01YWnh0aEY0YUQrek1sYzQwazFSK1ZwcyszaUhzM1hLcE8z?=
 =?utf-8?B?dUtIek5KRjdlK2xvUkZQNExKa1dURlpHZ3BMVWRDb0I1STF2TlkwY2dIa3hC?=
 =?utf-8?B?eGMrc2MyYmc2R1ZXaGVkQ1doM3ByQzNqekl3czdkMFhRL3NLdWwvZUgzYllJ?=
 =?utf-8?B?WmUvVjBvSm5jamdFSG0zYSsweXAyTllJbmNiSURMVkd0QlFoblkxTFc5SWdU?=
 =?utf-8?B?eGxnQzZnOVVaalJLeSsrS0NadFJTSlgxYWhjMHRFanlwK3NMQVpldm1GZjRn?=
 =?utf-8?B?NWNpUHUxNGZ6SG5TVENqNURBQlFwc2lFanE0cDRWanBCREgxNXJVZmVDdTlw?=
 =?utf-8?B?SDJOUUZ6TFlWSGRCUXdaTkZtWlNkb1VNRGkxdGRnK0VGU0lhS0VWYWxJTklK?=
 =?utf-8?B?ajFUWWtQZjk0cmxybmhiM2dRb0J4ZjM1NkNUUEN6WDY0SWNNVDZBVWxkU3VW?=
 =?utf-8?B?SVlPenUyYm84YW1YZHVFNEhiTFFjUFRBbFJUTnRUcGFxREFEamZXMjlTKzB3?=
 =?utf-8?B?T3pQc09OQlJmNFMyWFpvSkhKZlc1T1BYZ01STXNqeGdoaTlSVlRJbU03SU9D?=
 =?utf-8?B?L24veTIvTkcyYVFtZURtalJ5bkE1dWFtYW4wcTd2OVAyMDhDbzBsamxXdG5z?=
 =?utf-8?B?N2RueHdEVTBJS0Zpa2hHWHpBY05LVGRSSlVTaitYZXRlaG1haGR0dldqUFJM?=
 =?utf-8?B?NStPNmZsRWxwRGxmcEtxclRhek4yNmE5L1lHYU9Xak1WSE16WUVQTnFTU2xk?=
 =?utf-8?B?R1RHR2dRY1YyRWMvWUZBdlh2RDUwQndBOFZvTG9BNzYwYk9HN0JoZnZFU3Zw?=
 =?utf-8?B?QzFWbVA3dkE4V3dpL1JOUWpXanpWWGMyRUhLZ1hyNUVZWjFKY1JoMHFTT1o1?=
 =?utf-8?B?NjJoNXVGVmRRY2RyZVllWTdHVWRWZndFWGxad1doRG5BSGkyS0QxVm1IL2RI?=
 =?utf-8?B?Vi8vcmpDLzVFT0IrWDJ3VHhFU0hURkh6clMvQ3hPY05hL29PTFZlOFZUd0lz?=
 =?utf-8?B?TnhMcmp0ZWhYSHJtTmFwSXZ0aXJPNERLQ2QwMmY3UitueGF5UVd6RFZjSXdy?=
 =?utf-8?B?K1hVaWhBWHQyZGVzYkh5bzhlOWRIRDc4U0pOd3FqTmlCWjR1WHYxTXBWMjFY?=
 =?utf-8?B?bzRoQXNLSU56VzZLeURUMGFmd01IT0dSbHhLNEpKeEEwb3JMWXZIQ01QcC9G?=
 =?utf-8?B?MDRydG1WYThJMkgwUGtOUTh4eTFUSU5DTFNBakpNTEt2T1UvUGRoZDJrV3J5?=
 =?utf-8?B?cHJTekVaeE95MEtydlpNNnJmYUh2RUVIL0N5VTlTcVRuZ2VSVWdXUVZOblVE?=
 =?utf-8?B?VmdNT2JMSU50N09JMTFUazNKRWh5RjNMMVJWcmVqbEx5QW9nQjlIODdTSUVQ?=
 =?utf-8?B?Qm9wWGNPV0dwTUpWejU1cHhrQ053bUVLWDJUMm9yUnFFU2ppOHFFdkpCc2VE?=
 =?utf-8?B?clZEelhXWk9mY2ZuWXM0emh5V3ZtcGJRa2kzSVFheXh0UlZZTk42VjJFSVRM?=
 =?utf-8?B?MlhBMFBQUlVqV1JhNjRTb1NZWkxFb3hhSDFjdmpOY25GdUNmMnRTaEpvQ29y?=
 =?utf-8?B?UENreitnNk5xVXU2MllSUXZWQUM0VDFjSmYvRFAzY1M4eEFkS1prcGpCbC9P?=
 =?utf-8?B?U2gwekJXbHdWeHRiN1JqTjdqQlBIWldFbURKK1Z5K3p2bHRkQTZQTkRCWit3?=
 =?utf-8?B?QW1rRHFRU3YySm5PemlTSzhtb3FabXd4c3gxM0lFY2NXcFdoanlETlZaWUhB?=
 =?utf-8?B?UVlFTG95L2hDd1JzRjVCWFR3ZGdlS1V3eXBvTUFFM0NnLzRRbEhYN2VHZEtY?=
 =?utf-8?B?cVFZUHJ4anVzSmdlT3hRQTFnTkZ2c0RpTHdrNHE1Q3Bsc0ltM081VVJrdmVQ?=
 =?utf-8?B?Q3Z6c2VuMWRVUWxPL0hEa0hLZEZpR0tVUWR4cm80M2VnNmJaZDJSYWdTQldy?=
 =?utf-8?B?ZHlRRkFYalhiMTcyMi9NVDJQYmJiTTdaV0pRQk5xcVpMcnNwUmN5UjRJWWpI?=
 =?utf-8?B?RURGcmJiUjJoa1ErM204S3Bpb050U1pwd1NQSktXdDJrUWpWbXNxS050RUpB?=
 =?utf-8?B?V1F1OE1LMVdXaUN5OUFSZ3ZXMG9zVDBlcEZaUDZFc1VUcHlLTlJEZjMrRXk5?=
 =?utf-8?B?OHV0cXV6YjYyeHEwMTFiMUQyUUxDdW5tOVNkL1BvMjRBRG1tRDNCaEpWSjJ2?=
 =?utf-8?Q?iyDg7MF+y/TF8NcE=3D?=
X-Exchange-RoutingPolicyChecked: 
	GU8t38GQhaEAH1c7PdW4uLe1ZBgJpUlJutyC4F5lZ348zJ31QznkA9BIHapSuMlZX0jBtDnET0QtHzEPcLJvHHw6zyzREDsYdTAu5d4VYJf+rYXv8FqGtLRaTOrQeD2fey1SK750E6zqjP6bUZsc4jjAY3lsqzJLTGgRDpirqRuiY+zYVg5nh3Npk6GwFgrVS8mBgwx1u15gSS8pIp3HzZtEj6oFrBZHlCvscY2iySFxuDdJ3F/nwKh3HRKKTZKqseHQzC4hnNybrjg4Dw4rXPjZHywUyKwBBSnC1H9tTULiW+DrmaaSxyH6Fec7pr+DRf4VINOvPOBcCtdgRd6xow==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6685cb37-8131-4e7f-0616-08de7f15d0ed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 02:28:01.1807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2taawAsWpKvnbNJMnsXynws6pGv2NrocKFfHjy+p8VbgcOTLADrtQJXqsfpj5O8mjSGLVrLsZ/RyiDSTmfOsk4bHbJhEsrjYk5EG6vTAig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6895
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: dNHpneBI9Lm9adwAMr2Oi4bbprO0w0t2
X-Authority-Analysis: v=2.4 cv=fpnRpV4f c=1 sm=1 tr=0 ts=69b0d334 cx=c_pps
 a=bwjaHK0hsJlcehRpTf+kTg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=cOY0BLcRJ9TnE1crb7wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=7CQSdrXTAAAA:8
 a=wvPkM9v7g1_ikmSEda4A:9 a=J8ixLFC6Jlx1xp3M:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: V9p2fbDyTXb4plY9VfqwN-Vmv4LaFKCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxOSBTYWx0ZWRfXxMkviyRZ7HNQ
 FeodAiEOMnJXODbKhL+vcgpiDMKPurDDoAyJs6sqAQ/+fgHAn2yVRyEubNRajxJ7dlpN4oftuye
 47XnND9f6WjrXeHcYPlGG9R6zhs8Hsndliw1zcbRnwVFXamEcn1zIzLUsjntGfHofEUng/E4o64
 ROAVIqpMK7V9yNXQNoT2ZSf83d4QsKRsta8MuwccjIoLRK3Dd2GMqb5uTsLLKfNSnnN3p+UCC7n
 7LVp6vY3iOXqYkCH9gIfWgg3l0x1+P/1xBBo0yKCjRxMttQCifAUCngT4uNJJfYUz979hYLYJv1
 o7kzO4laoHw8NuoME+GU+gZpCJnlTM7xCirP0Jnz6SMA8EY3LZZUPQD7RmzVUiXkdvrZACDm4FZ
 +ia17P5qsflfA2FKxnz6nyjBunMfjG5Sz02uMZLKHZQ1R3c+BWJKPLRSKru5mvZgamDktjjjQ3u
 VVxrq57XsKMZiX7C9dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 02:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232832

--------------co6khozGEz6Dx5GP46HozVmS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62B1skj2220610


On 3/10/26 19:44, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 25 Feb 2026, at 03:40, Changqing Li via lists.openembedded.org<chang=
qing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>> PACKAGECONFIG ?=3D"${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
>> +PACKAGECONFIG:append:class-target =3D " bash-completion"
>>
>> PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd=
"
>> PACKAGECONFIG[stemming] =3D "-Dstemming=3Dtrue,-Dstemming=3Dfalse,libs=
temmer"
>> PACKAGECONFIG[qt6] =3D "-Dqt=3Dtrue,-Dqt=3Dfalse,qtbase"
>> +PACKAGECONFIG[bash-completion] =3D "-Dbash-completion=3Dtrue,-Dbash-c=
ompletion=3Dfalse=E2=80=9D
> I can=E2=80=99t see any other recipes that have a PACKAGECONFIG for bas=
h completion.  Personally I=E2=80=99d just inherit the class and EXTRA_OE=
MESON:append:class-native =3D =E2=80=9C -Dbash-completion=3Dfalse=E2=80=9D=
 as the special case is native.

Hi, Ross

Indeed, very few packages offer this PACKAGECONFIG=EF=BC=8Cbut both oe-co=
re and=20
meta-networking have one.

I checked several recipes that inherit the class but not provide the=20
PACKAGECONFIG,

all the recipes don't provide option to disable bash-completion. I think=20
this is why they don't provide PACKAGECONFIG.

upstream appstream provides the option to disable bash-completion, I=20
think we should keep the upstream option.

Regards

Changqing

>
> Ross
--------------co6khozGEz6Dx5GP46HozVmS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62B1skj2220610

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 3/10/26 19:44, Ross Burton wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:C0CE5EB9-AB4B-40D5-B625-3C34119=
E3099@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On 25 Feb 2026, at 03:40, Changqing Li via lists.openembedded.org <a clas=
s=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindriver.com@l=
ists.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.openembedde=
d.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">PACKAGECONFIG ?=3D <a clas=
s=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@bb.utils.filter('DISTRO_FEA=
TURES','systemd',d)}">&quot;${@bb.utils.filter('DISTRO_FEATURES', 'system=
d', d)}&quot;</a>
+PACKAGECONFIG:append:class-target =3D &quot; bash-completion&quot;

PACKAGECONFIG[systemd] =3D &quot;-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,syste=
md&quot;
PACKAGECONFIG[stemming] =3D &quot;-Dstemming=3Dtrue,-Dstemming=3Dfalse,li=
bstemmer&quot;
PACKAGECONFIG[qt6] =3D &quot;-Dqt=3Dtrue,-Dqt=3Dfalse,qtbase&quot;
+PACKAGECONFIG[bash-completion] =3D &quot;-Dbash-completion=3Dtrue,-Dbash=
-completion=3Dfalse=E2=80=9D
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
I can=E2=80=99t see any other recipes that have a PACKAGECONFIG for bash =
completion.  Personally I=E2=80=99d just inherit the class and EXTRA_OEME=
SON:append:class-native =3D =E2=80=9C -Dbash-completion=3Dfalse=E2=80=9D =
as the special case is native.</pre>
    </blockquote>
    <p>Hi, Ross</p>
    <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><sp=
an class=3D"ryNqvb">Indeed, very few packages offer this&nbsp;</span></sp=
an></span><span style=3D"white-space: pre-wrap">PACKAGECONFIG=EF=BC=8Cbut=
 both oe-core and meta-networking have one.  </span></p>
    <p><span style=3D"white-space: pre-wrap">I checked several recipes th=
at inherit  the class but not provide the </span><span style=3D"white-spa=
ce: pre-wrap">PACKAGECONFIG,  </span></p>
    <p>all the recipes don't provide option to disable&nbsp;<span style=3D=
"white-space: pre-wrap">bash-completion. I think this is why they don't p=
rovide </span><span style=3D"white-space: pre-wrap">PACKAGECONFIG.  </spa=
n></p>
    <p><span style=3D"white-space: pre-wrap">upstream appstream provides =
the option to disable </span><span style=3D"white-space: pre-wrap">bash-c=
ompletion, I think we should keep the upstream option.</span></p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <p><span style=3D"white-space: pre-wrap">Regards</span></p>
    <p>Changqing</p>
    <blockquote type=3D"cite" cite=3D"mid:C0CE5EB9-AB4B-40D5-B625-3C34119=
E3099@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Ross
</pre>
    </blockquote>
  </body>
</html>

--------------co6khozGEz6Dx5GP46HozVmS--

