Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA15CAC58E
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 06:10:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26044.1757916619855661024
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 23:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U1/Qcih3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13531ce467=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58F5Hplu3262473
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 23:10:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=ki3e9g5ZYf26/nYdOuKGjl
	XWsWn8b1L/nGUJkbx2J+o=; b=U1/Qcih3GpXs7Ak9KaIhVMe3RmBR6Qze6YbHO6
	5S59xt1mMEnBF03aRVOpShT/uhBT3Ox162gkQkfUAxO/Dbfe6oZxb+CUVsxLAPVD
	Zgc4tSFq0kSnrf9C5Wuu0vzJwT8T9EPoQgabMLDfN1XTCqrYinwjXCSjUIYycsEX
	ZHQZ45wX1oC0lKwpkkSEKDgJuc7kFSF60ZtpM6DLCBBkOEYLaHPDzVG0qbuoGtpm
	7qICduePIeVUV10Ve2PNkne4c5WAo7AIDHRI/tHOqptcfKB4Bt65I6+6FPaVx4XB
	yI0eyWGy6X0X5vleSBX/+4UJwWR3ACMK4wgHlFlP8uEXEgdA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49584hhc2j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 14 Sep 2025 23:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCc49/UdCULMJpREhMv6jxyET5jRjonmX/MTDs2mttXj5/Dk04pH7hZYHbTtrj/AtosLSSV22DnY1kLuF3s47g0052/i8b0elV8SOxLCWWjpVk1mY/Xrnn1K4eEJkYdNNk4mcxQCTBVgySEVrSvX5VjVCwPI3vx5XHegIuH8bS/w21hhl8ANcC5XJfvIxqbNbibdXpVZVY1pINdYBGGJ41sGIQEirRIkWa8tOigROb/dli/9zcv4u0qfVh6BK2wtLE713+dPk5JiEJUfpo8RRoi6KMdzSjUqrQvpMaDhG3StH1LdsDbMaGbq2P7/WoepuKiXgl4wAYf3hR8/Y+Fehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ki3e9g5ZYf26/nYdOuKGjlXWsWn8b1L/nGUJkbx2J+o=;
 b=u5px55NjW2Kderzqw6HhvaDGxdbsTJsjCS7ZqSFA/FQTRHzJMhDLQhAArfmImfHrPaVar4bTE8wYRSDGSCRcO3YXldfsoz/ydHVNl6p/FiInDmRCuF8yZmf3ouvkc92WDn7PlQVe+HSvG6vqzuGKRL0a7VhbIFpqmbfIF6JS39qY4VTDm6ngw34Vv7MIeURT5Mpe65jm8bQ6urc8zRZf/2LnT8GCNQMXJZa7JwOdzsDNWXmjfcJFMLMcYLELJ1iHDLtyHR+ZvGWyGQE6rgnodqPmMmLaVLkGHbmy8Wl4czbPd8LwF49ImB/GnPSviFavOgtDtMjjDeNn1zrP+lA2Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by MW4PR11MB5797.namprd11.prod.outlook.com (2603:10b6:303:184::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 06:10:15 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%5]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 06:10:15 +0000
Content-Type: multipart/alternative;
 boundary="------------qq9AEZBQH5McaiU84qQmhJTb"
Message-ID: <c63be999-b52a-4979-aca3-82b434819f70@windriver.com>
Date: Mon, 15 Sep 2025 14:10:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/5] distro/include: Add debug_build_tune.inc,
 collect debug tuning configuration
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "randy.macleod@windriver.com" <randy.macleod@windriver.com>
References: <20250912160741.346809-1-hongxu.jia@windriver.com>
 <20250912160741.346809-2-hongxu.jia@windriver.com>
 <DB5PR02MB1021376671BF618279846C78DEF0BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <DB5PR02MB1021376671BF618279846C78DEF0BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|MW4PR11MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b7b880-f811-4a6b-1bc9-08ddf41e896f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aTZLTjRJZG9zWmpjeTVEd01sSmpKd1EvN25rN2lhSk1NajJrK3dNakVtWWIw?=
 =?utf-8?B?OHdLR1VIUkdadWp3NzZEQnU3bzFYTkU0aVBYWTdwL2tROVRIS0xlZzcyTFQ0?=
 =?utf-8?B?RWQ0TlVJYUlZcTN0dGFyYU14M1ZDcllNSzg2djY0dnVncXd6VFE0ZFlicTVs?=
 =?utf-8?B?bzJzbTJUNmhRQno1RVpRVjEzdEdjaE5RYUZGMWFZOU4vN3BLb2VqT0d4Y1BG?=
 =?utf-8?B?Wm1FUUpwckZ4RGsvTVRsOUtWTXhqdFBTY29kMHFKNHQ1eWZkQzBoeWJic0Vr?=
 =?utf-8?B?cjdHZzYxeWg2MGxCTndyYklxdjNyMWgxSHpnMExJdzJaRmt1MGk0R29yMFRP?=
 =?utf-8?B?WXlLejRBZHlYV3JROFVVZ1EyL1pUdHdBMXpETFVPZmw4ZGJmS3V5cnU2d2tX?=
 =?utf-8?B?S2ZENUlib2t1Ui9EU1AvVnBVNm10S0d0WlFnTW1lZEV6bGRza3B1TWRqTHIr?=
 =?utf-8?B?WWx4NHBCUHhCMEtLVHhneGhKTi9FdTd2VmV3dEJHUTQzNHBZSTRONktnRS82?=
 =?utf-8?B?ZlVoam5jWFdXMEd1QjdiSHFrdkRrQXk5NkgzdkhqUEpPWnBpR1J1SWxzbmlk?=
 =?utf-8?B?YnVBWHNiK1NnSjlPamt0QUpTd0dNSWtIM3poU3p1VllsL08vREo5OTJXbVlV?=
 =?utf-8?B?T1QreEVBVWtEZHg1Q1QrbjVYY1p5VnphK3dUcXk5eVdOV21RZk5Xa1ZveHY0?=
 =?utf-8?B?NFJMK01EN1h2Kzc5TjdXRkc2dGZxaFpzRE94a3phUmR2Y2h4V3djZkR0QndI?=
 =?utf-8?B?RzVueXBZb0swSWJQeisrclM3VzZ6cjlFRmZsYk4vOGJZOXpPWlJweGRSZnFa?=
 =?utf-8?B?U3Y2dUdDMVVvUGNvL2duakdKVDA5OXpjcnYrSi9CYkdjVW43V3AwR2ZEMmVL?=
 =?utf-8?B?bGExeDRZNVVQdjFtMndwVGNPSFppSlR3eGM4Tk9ia2xpNENIVGowMHNFQUo4?=
 =?utf-8?B?b0JIVFRER3BJYmRsZURGZURocTA2VnFiby8vSVFBY1ZQWHNmeHZab0lMWVVw?=
 =?utf-8?B?TURnTEkxRVpIa0Q4YWdrK3N4ZU0zWHA4YWxweG5OVDJRRDFNZFc3WENTdENQ?=
 =?utf-8?B?Ny9xQjBSMUx4cEt5SmZxckY4TmswMDMwSysvYndFVHdtN3NvTzZtZDZVUGo1?=
 =?utf-8?B?S1NmZ0U5VlFRNjNKVytOVWQzcW53ZXFrRDBqUmpaVFJjNnE3UkZSK3Z1RE01?=
 =?utf-8?B?ZnpBUUZ4dXZNbGJXMkRibjUvSkMzNFQ0aittTEJxYmZ1ZGlhMTF2QnZ2N1Qr?=
 =?utf-8?B?aHExd3FMVnZNcExsN0dzZHRJbWFyTTl0bm1OMzRtWDI2T1Z2QVV4VVBZcGF0?=
 =?utf-8?B?Z1JFUXk1VlgxVWsxVS84NHJjMm95SWpqdkVuWU1hZTN5NDFnZzFNTmJpTkFt?=
 =?utf-8?B?Z21HdFRoYUkxWHVyZkRhdUpENTEyemlFMlhuejk2MmdrZGFKdERoTjVFUURp?=
 =?utf-8?B?N3N5WmVQVVh2YjZwYnhYOG55Nyt3UStDU21iMHVVa2ZMZUl5TFU3NDd3REhV?=
 =?utf-8?B?aTlkTU5CamVsRXE5OThrSDBUeEZaOGl0SkMxY1hFRlFaNGpsUmZZQ05BNGZT?=
 =?utf-8?B?Q3ZhK3B3SS8yeFBzbzBSWGxnMEkvVWY3NjB5djRMQk9mZGxielI5aXR6Tkxp?=
 =?utf-8?B?NWhXM1FVVG5kMUVCQ21xYlBtK1VSa0lRc2wxTE9KOGkzYk5FNHdTdzgzMEZw?=
 =?utf-8?B?Q05mVG9iaXo4THQ3ZmZLL2tPNEVTSWg1TVltRzIrM1ZCd3Q2OGd2WWI1QnVr?=
 =?utf-8?B?b3VkUTQ5RGlDSlFtNk1EU2hSTDZuR1RXaWFqRlc5UWx5bk1td1k4aW90YXdL?=
 =?utf-8?Q?feC5SxNS9IVaIMitgikSBkzUJhUvVSIMexXzg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NUdKSnhLczl1d25zWm4zYTY5bTFMa2pubjlCZjkxeUFJR3dSSTl4TDc5V05o?=
 =?utf-8?B?SXpNN0t5SU1ySTVWUjZKMG5PNjZXVVV3L0xiVVY3ckN1cWVyOWZadXZ5WUwz?=
 =?utf-8?B?ZUxDZkp0dTVWQTdmbXIrQnF2MnlTakpaSXc1L2xtOS9uVjhWeE91WldvclZz?=
 =?utf-8?B?d2xhRXBsYTBGZVhtMHRTT3N6Q0lSY0VnckVXeHlwUzVKY2FyaTdQSndwZVlF?=
 =?utf-8?B?MlM5a3U0VE9qMmltNWt4NFpvc3Z6TE9vR2dxYjF2QWsrdUxZa1psV0h1NDRl?=
 =?utf-8?B?N3FiSFYvK05oc2x3SkNXR3ExK3lnbHhnWk5vaUdMV2ZrTjd4a3VQTlVtR0Q0?=
 =?utf-8?B?QlVHS09TMWJ2dmViL3MzU1ZtNktkQ3N1U2Nnd01WTG9VVGIrRDYxb014NjMz?=
 =?utf-8?B?Wm93MDhlODIrem1ZNldINFdQSTdiblAvMGNxYlpueC9OV1NjYVI4YTUzNjFR?=
 =?utf-8?B?cWlPVHJURm5TbktXcTUySklnT2xxbENRVU90K3RsTTlIQWQ1Yk5DczBFZlJs?=
 =?utf-8?B?MHlhMTc1ZXQ2TW0xc2xDcHVOMnY5RlZVQWlhZHI1MlcxM3NkNE1yT2VSNWV1?=
 =?utf-8?B?QS9VT1VkTXRIRDRieUNXY0NsNVlLOGRFK0tReWJ3MUdTOTVzb2NmMXFBTGY2?=
 =?utf-8?B?SUhRSXBYUTZKMVIrUW9KdGZNdGVlUm0yd2hrK0JrcmgzQXdQU2VhOHRQUTZU?=
 =?utf-8?B?U3pCWHZLaEF2RnRoU3R2ak5sN0t3dm40b3hkTHFtLzA5LzRERUxnYTJKRjlU?=
 =?utf-8?B?VHgrNEFEYlJhZzkwYW1vMkdYNUM5V1QyOUlJMzlDUFBjbmdOWWZoYkxHK1k3?=
 =?utf-8?B?T0JDUFdnYWZRZ0tLdFZBSElFR2Q5VVVEQzFpZW1UMnVoK3ovbUkxZUdFdEY2?=
 =?utf-8?B?MWc0UWxNc21mK2VkMUw3a0krKzVCWEtucmtOR2EwZlNETVFaMjhpNDRlNFBT?=
 =?utf-8?B?QXJIeFRweTJFbktHYVh6NDRMTW9BRDQvWFhjNE9RdXovVWNMRFl1TVcxd1M3?=
 =?utf-8?B?RVFnRTIzMUFTSHU2RW5NZSszdE1MV2lPSXpxY0llVUxyNWc1RTJBTERIdHpJ?=
 =?utf-8?B?UndxaXdNMWhKWWx4NW1GL25uWTZ5WDVBYTRoRCt3NEsyYVA3NWx1eDJDVW1o?=
 =?utf-8?B?SjV4RXlnNmVMOWtIMFNkOWt3enhndFAzMWR4dmRINFpFNVh0NXdMbVBPT0NS?=
 =?utf-8?B?LzlWWU45YVI1WER0alQ3SHI0MHJwWXcyYWo3N0RCMHVmN3FLY2hhVTUzQktK?=
 =?utf-8?B?b3JYRVFCaDdOZzQrU0w4N3Zha2ZBdmtzb3pRbmZlU3RtRXpYREhSYWlEdXht?=
 =?utf-8?B?SXBHUm5jSFhzdUYwMmwwSHpwSWp6TFNvNmx2ZFJVRjBNQURMYUg1Z0ljNUc2?=
 =?utf-8?B?alprdmZGRnlna01TbEhNR3JmbHFjd1ByTVlROGJJZ29vQmZzdHR2WkpTWExP?=
 =?utf-8?B?d2s1WW01UWVsam5Nek14REpzcHdERGpZc0Z3RHNEV0RBN0xKcS9LMWgraDZ5?=
 =?utf-8?B?TTloYUZ3YlV5cnlYdDg3SU90OFBHSWxxc3dSbFgvdy95QTRBeFd4U3IzWGFj?=
 =?utf-8?B?T2E5cVkxRzBWdUdxNVJqZTdLZXI2YXFqNkpLWUcrUVI4VUwzNHNQYktWZTdY?=
 =?utf-8?B?SnIxS0tCSFA1T3ViUG9XWXpVSWtNeFJWK3Y1QS9TUm0xb2cvM2lnaTlMT2xj?=
 =?utf-8?B?YW5vSjBRaHUxL3piT3ZZSWg3VGRkV3VlRml3dlRuRWJFdXZLTlJFZ2pVcWVF?=
 =?utf-8?B?ZEg2WlhqeG5nQ0hwcUEwY2NPRXZVWVR4MWtLaGltTjZDd3pVd3VaczdFd1No?=
 =?utf-8?B?TUNKVVR1Y3pmUHRVZldIdmo5M0UvSC9Lc0wvTTFwaWxCQ3JmbGxlZjUrYm1K?=
 =?utf-8?B?VEdHQTR0Q0pHNGhVRkp4eGI3blowNHp6T1U0cXE1blZGdUtiOWhqUWY4a3dM?=
 =?utf-8?B?WGNtUGJwV1RSSTdLSTVML0VUR00zR1J1WUZJMFowbjlHNm9oeVhFY0RUYWdW?=
 =?utf-8?B?c1hGN1l5Qk5MY3Z2dThYSVpwVitJc1ZKZHJ1ODZ1ekNKVkZDQXFvT3QrTlpS?=
 =?utf-8?B?cHpWVUFWVDBaOEtLVU8zbWN3RzRrOU1ueWpNMkVQempWUjRNNUZuTmt1THBx?=
 =?utf-8?B?S0JVMUE3WmFsSDlnZVAzeUZaNHordEhueUdPcS9DYkc4WWpLSGVnRkJKS1JX?=
 =?utf-8?B?VXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b7b880-f811-4a6b-1bc9-08ddf41e896f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 06:10:15.1484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaI4U2R8Mfq6u0NNn8TO6/5gbZyVkw6szlBAOzAwqPhOpqNm8Lewx6hJGXnI+Rgu5Bz6wEBHAm3MTg6VTj/1RlVWFXcjfiB8OODrqOPaR1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5797
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Pbj/hjhd c=1 sm=1 tr=0 ts=68c7adcb cx=c_pps
 a=cuGhpuBU/Rulez8h1ZIujw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=DDfGSgfdZwEI7hEb6hMA:9 a=erNOxfUQL8SZZ4XR:21
 a=QEXdDO2ut3YA:10 a=UqCG9HQmAAAA:8 a=j9Gkw3vXnVuGLMuZa8UA:9
 a=aN9D1qhm3Hht4q-0:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NSBTYWx0ZWRfX7ZzCNPQsU57r
 19KhKkNCrFYFaEuAmbssF/itVVDd3x+NAlQMn4DUgdTRUtSkrD1ZppDhDU/G+/vGsfJfR4YZfg2
 t0thIunuXXucJHsR64P95YqQe62/h+crxB3W4sAVgo5Wy57jfRAnFkaeK+9fmGM08EQH6w+QjTs
 74fNaW6Jxv3HsGBTsmylHkikGAQb2BNGMUDcBB+eh24QUVsXkpbHUZnCJHscrx2JETVlqu+vZTM
 9q4eUxa30/W+doUmWy90pklFgNnj7wtFenORFPli2cytajFrtyJjLWmv9KzKRED/VHfjOtm1mL3
 pLeRHIkbHYcMSsyqJZvKdeGhG7NVJmYRC4qFvzzmiKot9gVdy6IyXjMTFrZcm4=
X-Proofpoint-GUID: kwpEjrgELqnKZ_vZBX9BfCYFLs0KZvrH
X-Proofpoint-ORIG-GUID: ZKyJ8zUP0B_ZM3hxVKd97AMvaNrngJiX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 06:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223376

--------------qq9AEZBQH5McaiU84qQmhJTb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/25 18:06, Peter Kjellerstedt wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>> -----Original Message-----
>> From:openembedded-core@lists.openembedded.org  <openembedded-core@lists.openembedded.org>  On Behalf Of hongxu via lists.openembedded.org
>> Sent: den 12 september 2025 18:08
>> To:openembedded-core@lists.openembedded.org
>> Cc:randy.macleod@windriver.com
>> Subject: [OE-core] [PATCH 2/5] distro/include: Add debug_build_tune.inc, collect debug tuning configuration
>>
>> The modern compilers and code seem to require extra steps to avoid DEBUG errors,
>> Move debug tuning configuration from recipes, add an include file to collect them
>> to address these errors. Require the include file when DEBUG_BUILD is enabled.
>>
>> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>> ---
>>   meta/conf/bitbake.conf                        |  2 +
>>   meta/conf/distro/include/debug_build_tune.inc | 45 +++++++++++++++++++
>>   meta/recipes-connectivity/kea/kea_3.0.1.bb    | 10 -----
>>   .../debugedit/debugedit_5.2.bb                |  2 -
>>   meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  3 --
>>   .../python/python3-lxml_6.0.1.bb              | 12 -----
>>   meta/recipes-extended/bash/bash_5.3.bb        |  3 --
>>   meta/recipes-extended/mdadm/mdadm_4.4.bb      |  2 -
>>   .../jpeg/libjpeg-turbo_3.1.2.bb               |  3 --
>>   .../vulkan-validation-layers_1.4.321.0.bb     |  2 -
>>   meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb |  1 -
>>   meta/recipes-kernel/perf/perf.bb              |  2 -
>>   meta/recipes-sato/webkit/webkitgtk_2.48.5.bb  |  2 +-
>>   meta/recipes-support/vim/vim_9.1.bb           |  2 +-
>>   14 files changed, 49 insertions(+), 42 deletions(-)
>>   create mode 100644 meta/conf/distro/include/debug_build_tune.inc
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 8e90c7bbc85..193a8377cf2 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -831,6 +831,8 @@ include conf/licenses.conf
>>   require conf/sanity.conf
>>   include conf/bblock.conf
>>
>> +require ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_build_tune.inc', '', d)}
> Why debug_build_tune.inc, why not just debug_build.inc?
OK
> I suggest using include_all instead of require to allow other layers
> to add their own debug configurations in a similar way.

Use include_all here will cause bitbake parsing error, because it is 
include the inc file conditionally.

I will use other way to allow other layers to add their own debug 
configurations.

> Further, to avoid the :remove operations below, I suggest
> introducing separate variables for the optimization level. And,
> since you are moving everything else related to DEBUG_BUILD == 1
> to debug_build_tune.inc, why not move parts of the definitions
> of the *_OPTIMIZATION variables there as well? That would simplify
> their definitions.
>
> You would then get this in bitbake.conf:
>
> FULL_OPTLEVEL = "-O2"
> FULL_OPTIMIZATION = "${FULL_OPTLEVEL} ${DEBUG_LEVELFLAG}"
> SELECTED_OPTIMIZATION = "${FULL_OPTIMIZATION}"
> # compiler flags for native/nativesdk
> BUILD_OPTLEVEL = "-O2"
> BUILD_OPTIMIZATION = "${BUILD_OPTLEVEL}"
>
> And this in debug_build_tune.inc:
>
> DEBUG_OPTLEVEL = "-Og"
> DEBUG_OPTIMIZATION = "${DEBUG_OPTLEVEL} ${DEBUG_LEVELFLAG}"
> SELECTED_OPTIMIZATION = "${DEBUG_OPTIMIZATION}"
> # compiler flags for native/nativesdk
> BUILD_OPTLEVEL = "-Og"
> BUILD_OPTIMIZATION = "${BUILD_OPTLEVEL} -g"
>
> *_OPTLEVEL need to be documented, and the documentation for
> FULL_OPTIMIZATION and DEBUG_OPTIMIZATION probably needs to be
> updated.
>
> And poky-tiny.conf and harfbuzz need to set FULL_OPTLEVEL instead of
> FULL_OPTIMIZATION.
>
OK, I will do it in v2, but for poky-tiny.conf, I need to send the patch 
to a separate mailing list

>> +
>>   ##################################################################
>>   # Weak variables (usually to retain backwards compatibility)
>>   ##################################################################
>> diff --git a/meta/conf/distro/include/debug_build_tune.inc b/meta/conf/distro/include/debug_build_tune.inc
>> new file mode 100644
>> index 00000000000..ca43d2b955c
>> --- /dev/null
>> +++ b/meta/conf/distro/include/debug_build_tune.inc
>> @@ -0,0 +1,45 @@
>> +# The modern compilers and code seem to require extra steps to avoid DEBUG errors,
>> +# this file collects debug tuning configuration to address DEBUG errors.
>> +
>> +DEBUG_OPTIMIZATION:append:pn-perf = " -Wno-error=maybe-uninitialized"
>> +DEBUG_OPTIMIZATION:append:armv4:pn-libjpeg-turbo = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
>> +DEBUG_OPTIMIZATION:append:armv5:pn-libjpeg-turbo = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
>> +DEBUG_OPTIMIZATION:append:armv4:pn-bash = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
>> +DEBUG_OPTIMIZATION:append:armv5:pn-bash = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
>> +DEBUG_OPTIMIZATION:append:pn-mdadm = " -Wno-error"
>> +DEBUG_OPTIMIZATION:remove:mips:pn-kea = " -Og"
>> +DEBUG_OPTIMIZATION:append:mips:pn-kea = " -O"
>> +DEBUG_OPTIMIZATION:remove:mipsel:pn-kea = " -Og"
>> +DEBUG_OPTIMIZATION:append:mipsel:pn-kea = " -O"
>> +# {standard input}: Assembler messages:
>> +# {standard input}:1488805: Error: branch out of range
>> +DEBUG_OPTIMIZATION:remove:mips:pn-python3-lxml = " -Og"
>> +DEBUG_OPTIMIZATION:append:mips:pn-python3-lxml = " -O"
>> +DEBUG_OPTIMIZATION:remove:mipsel:pn-python3-lxml = " -Og"
>> +DEBUG_OPTIMIZATION:append:mipsel:pn-python3-lxml = " -O"
>> +# used to fix ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>> +DEBUG_OPTIMIZATION:append:pn-gcc-sanitizers = " -Wno-error"
>> +
>> +BUILD_OPTIMIZATION:remove:mips:pn-kea = " -Og"
>> +BUILD_OPTIMIZATION:append:mips:pn-kea = " -O"
>> +BUILD_OPTIMIZATION:remove:mipsel:pn-kea = " -Og"
>> +BUILD_OPTIMIZATION:append:mipsel:pn-kea = " -O"
>> +# {standard input}: Assembler messages:
>> +# {standard input}:1488805: Error: branch out of range
>> +BUILD_OPTIMIZATION:remove:mips:pn-python3-lxml = " -Og"
>> +BUILD_OPTIMIZATION:append:mips:pn-python3-lxml = " -O"
>> +BUILD_OPTIMIZATION:remove:mipsel:pn-python3-lxml = " -Og"
>> +BUILD_OPTIMIZATION:append:mipsel:pn-python3-lxml = " -O"
>> +
>> +CPPFLAGS:append:arm::pn-lttng-ust = " -DUATOMIC_NO_LINK_ERROR"
> Change :: to :
Copy
>> +
>> +EXTRA_OECMAKE:remove:pn-webkitgtk = "-DWEBKIT_NO_INLINE_HINTS=OFF"
>> +EXTRA_OECMAKE:append:pn-webkitgtk = " -DWEBKIT_NO_INLINE_HINTS=ON"
>> +
>> +EXTRA_OECONF:pn-debugedit = "--disable-inlined-xxhash"
>> +EXTRA_OECONF:pn-debugedit-native = "--disable-inlined-xxhash"
>> +EXTRA_OECONF:pn-nativesdk-debugedit = "--disable-inlined-xxhash"
> These need to use :append.

Copy

V2 incoming

//Hongxu

>> +
>> +lcl_maybe_fortify:pn-vim = ""
>> +
>> +CXXFLAGS:append:pn-vulkan-validation-layers = " -DXXH_NO_INLINE_HINTS=1"
>> diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
>> index cc34c05093a..ead4e98e708 100644
>> --- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
>> +++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
>> @@ -34,16 +34,6 @@ INITSCRIPT_PARAMS = "defaults 30"
>>   SYSTEMD_SERVICE:${PN} = "kea-dhcp4.service kea-dhcp6.service kea-dhcp-ddns.service"
>>   SYSTEMD_AUTO_ENABLE = "disable"
>>
>> -DEBUG_OPTIMIZATION:remove:mips = " -Og"
>> -DEBUG_OPTIMIZATION:append:mips = " -O"
>> -BUILD_OPTIMIZATION:remove:mips = " -Og"
>> -BUILD_OPTIMIZATION:append:mips = " -O"
>> -
>> -DEBUG_OPTIMIZATION:remove:mipsel = " -Og"
>> -DEBUG_OPTIMIZATION:append:mipsel = " -O"
>> -BUILD_OPTIMIZATION:remove:mipsel = " -Og"
>> -BUILD_OPTIMIZATION:append:mipsel = " -O"
>> -
>>   CXXFLAGS:remove = "-fvisibility-inlines-hidden"
>>
>>   do_configure:prepend() {
>> diff --git a/meta/recipes-devtools/debugedit/debugedit_5.2.bb b/meta/recipes-devtools/debugedit/debugedit_5.2.bb
>> index 76c54ba63d4..4ac6cab559e 100644
>> --- a/meta/recipes-devtools/debugedit/debugedit_5.2.bb
>> +++ b/meta/recipes-devtools/debugedit/debugedit_5.2.bb
>> @@ -22,8 +22,6 @@ inherit pkgconfig autotools multilib_script
>>
>>   RDEPENDS:${PN} += "bash elfutils-binutils"
>>
>> -EXTRA_OECONF ="${@oe.utils.vartrue('DEBUG_BUILD', '--disable-inlined-xxhash', '', d)}"
>> -
>>   BBCLASSEXTEND = "native nativesdk"
>>
>>   MULTILIB_SCRIPTS = "${PN}:${bindir}/find-debuginfo"
>> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> index 6c81d302438..f4727ee6dba 100644
>> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> @@ -54,9 +54,6 @@ INHIBIT_DEFAULT_DEPS = "1"
>>   ALLOW_EMPTY:${PN} = "1"
>>   DEPENDS = "virtual/crypt gcc-runtime virtual/cross-cc"
>>
>> -# used to fix ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>> -DEBUG_OPTIMIZATION:append = " -Wno-error"
>> -
>>   BBCLASSEXTEND = "nativesdk"
>>
>>   PACKAGES = "${PN} ${PN}-dbg"
>> diff --git a/meta/recipes-devtools/python/python3-lxml_6.0.1.bb b/meta/recipes-devtools/python/python3-lxml_6.0.1.bb
>> index 5d76641675c..6bcd399da54 100644
>> --- a/meta/recipes-devtools/python/python3-lxml_6.0.1.bb
>> +++ b/meta/recipes-devtools/python/python3-lxml_6.0.1.bb
>> @@ -23,18 +23,6 @@ SRC_URI[sha256sum] = "2b3a882ebf27dd026df3801a87cf49ff791336e0f94b0fad195db77e01
>>   SRC_URI += "${PYPI_SRC_URI}"
>>   inherit pkgconfig pypi setuptools3
>>
>> -# {standard input}: Assembler messages:
>> -# {standard input}:1488805: Error: branch out of range
>> -DEBUG_OPTIMIZATION:remove:mips = " -Og"
>> -DEBUG_OPTIMIZATION:append:mips = " -O"
>> -BUILD_OPTIMIZATION:remove:mips = " -Og"
>> -BUILD_OPTIMIZATION:append:mips = " -O"
>> -
>> -DEBUG_OPTIMIZATION:remove:mipsel = " -Og"
>> -DEBUG_OPTIMIZATION:append:mipsel = " -O"
>> -BUILD_OPTIMIZATION:remove:mipsel = " -Og"
>> -BUILD_OPTIMIZATION:append:mipsel = " -O"
>> -
>>   BBCLASSEXTEND = "native nativesdk"
>>
>>   RDEPENDS:${PN} += "libxml2 libxslt python3-compression"
>> diff --git a/meta/recipes-extended/bash/bash_5.3.bb b/meta/recipes-extended/bash/bash_5.3.bb
>> index b50a48d28c9..74671f5a563 100644
>> --- a/meta/recipes-extended/bash/bash_5.3.bb
>> +++ b/meta/recipes-extended/bash/bash_5.3.bb
>> @@ -15,9 +15,6 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
>>
>>   SRC_URI[tarball.sha256sum] = "0d5cd86965f869a26cf64f4b71be7b96f90a3ba8b3d74e27e8e9d9d5550f31ba"
>>
>> -DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
>> -DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
>> -
>>   CFLAGS += "-std=gnu17"
>>   # mkbuiltins.c is built with native toolchain and needs gnu17 as well:
>>   #http://errors.yoctoproject.org/Errors/Details/853016/
>> diff --git a/meta/recipes-extended/mdadm/mdadm_4.4.bb b/meta/recipes-extended/mdadm/mdadm_4.4.bb
>> index 26a60e4c1a3..e81b8fdf3cb 100644
>> --- a/meta/recipes-extended/mdadm/mdadm_4.4.bb
>> +++ b/meta/recipes-extended/mdadm/mdadm_4.4.bb
>> @@ -39,8 +39,6 @@ EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CWFLAGS="" CXFLAGS="${CFLAGS}" SYSTEMD_DIR=${sys
>>                   BINDIR="${base_sbindir}" UDEVDIR="${nonarch_base_libdir}/udev" LDFLAGS="${LDFLAGS}" \
>>                   SYSROOT="${STAGING_DIR_TARGET}" STRIP='
>>
>> -DEBUG_OPTIMIZATION:append = " -Wno-error"
>> -
>>   do_install() {
>>           oe_runmake 'DESTDIR=${D}' install install-systemd
>>           install -d ${D}/${sysconfdir}/
>> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
>> index d4877bb92b5..bc9d803f6b9 100644
>> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
>> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
>> @@ -44,9 +44,6 @@ EXTRA_OECMAKE:append:class-target:powerpc = " ${@bb.utils.contains("TUNE_FEATURE
>>   EXTRA_OECMAKE:append:class-target:powerpc64 = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
>>   EXTRA_OECMAKE:append:class-target:powerpc64le = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
>>
>> -DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
>> -DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
>> -
>>   # libjpeg-turbo-2.0.2/simd/mips/jsimd_dspr2.S
>>   # <instantiation>:13:5: error: invalid token in expression
>>   # .if $17 != 0
>> diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
>> index 466e757a908..fa7873b62d3 100644
>> --- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
>> +++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
>> @@ -26,8 +26,6 @@ EXTRA_OECMAKE = "\
>>       -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
>>       "
>>
>> -CXXFLAGS:append = " ${@oe.utils.vartrue('DEBUG_BUILD', '-DXXH_NO_INLINE_HINTS=1', '', d)}"
>> -
>>   PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
>>   PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland" diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb 
>> b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb index 
>> 1a15c5b4201..0d4c67f0fa7 100644 --- 
>> a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb +++ 
>> b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb @@ -16,7 +16,6 @@ 
>> inherit autotools lib_package manpages python3native pkgconfig 
>> include lttng-platforms.inc EXTRA_OECONF = "--disable-numa"
>> -CPPFLAGS:append:arm ="${@oe.utils.vartrue('DEBUG_BUILD', '-DUATOMIC_NO_LINK_ERROR', '', d)}"
>>
>>   DEPENDS = "liburcu util-linux"
>>   RDEPENDS:${PN}-bin = "python3-core"
>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
>> index e1915207eed..98dffd1cc99 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -415,8 +415,6 @@ FILES:${PN}-python = " \
>>                          "
>>   FILES:${PN}-perl = "${libexecdir}/perf-core/scripts/perl"
>>
>> -DEBUG_OPTIMIZATION:append = " -Wno-error=maybe-uninitialized"
>> -
>>   PACKAGESPLITFUNCS =+ "perf_fix_sources"
>>
>>   perf_fix_sources () {
>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb b/meta/recipes-
>> sato/webkit/webkitgtk_2.48.5.bb
>> index 46031322b92..616cd353337 100644
>> --- a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
>> @@ -90,7 +90,7 @@ EXTRA_OECMAKE = " \
>>                    -DPORT=GTK \
>>                    ${@oe.utils.vartrue('GI_DATA_ENABLED', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
>>                    ${@oe.utils.vartrue('GIDOCGEN_ENABLED', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
>> -                 ${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFF', d)} \
>> +                 -DWEBKIT_NO_INLINE_HINTS=OFF \
>>                    -DENABLE_MINIBROWSER=ON \
>>                    -DENABLE_BUBBLEWRAP_SANDBOX=OFF \
>>                    -DUSE_GTK4=ON \
>> diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/vim/vim_9.1.bb
>> index fee9f055e9a..a24a863ba5c 100644
>> --- a/meta/recipes-support/vim/vim_9.1.bb
>> +++ b/meta/recipes-support/vim/vim_9.1.bb
>> @@ -20,4 +20,4 @@ ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
>>   # We override the default in security_flags.inc because vim (not vim-tiny!) will abort
>>   # in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
>>   #
>> -lcl_maybe_fortify ="${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}"
>> +lcl_maybe_fortify = "-D_FORTIFY_SOURCE=1"
>> --
>> 2.34.1
> //Peter


--------------qq9AEZBQH5McaiU84qQmhJTb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 9/13/25 18:06, Peter Kjellerstedt
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DB5PR02MB1021376671BF618279846C78DEF0BA@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a> <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a> On Behalf Of hongxu via lists.openembedded.org
Sent: den 12 september 2025 18:08
To: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>
Subject: [OE-core] [PATCH 2/5] distro/include: Add debug_build_tune.inc, collect debug tuning configuration

The modern compilers and code seem to require extra steps to avoid DEBUG errors,
Move debug tuning configuration from recipes, add an include file to collect them
to address these errors. Require the include file when DEBUG_BUILD is enabled.

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 meta/conf/bitbake.conf                        |  2 +
 meta/conf/distro/include/debug_build_tune.inc | 45 +++++++++++++++++++
 meta/recipes-connectivity/kea/kea_3.0.1.bb    | 10 -----
 .../debugedit/debugedit_5.2.bb                |  2 -
 meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  3 --
 .../python/python3-lxml_6.0.1.bb              | 12 -----
 meta/recipes-extended/bash/bash_5.3.bb        |  3 --
 meta/recipes-extended/mdadm/mdadm_4.4.bb      |  2 -
 .../jpeg/libjpeg-turbo_3.1.2.bb               |  3 --
 .../vulkan-validation-layers_1.4.321.0.bb     |  2 -
 meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb |  1 -
 meta/recipes-kernel/perf/perf.bb              |  2 -
 meta/recipes-sato/webkit/webkitgtk_2.48.5.bb  |  2 +-
 meta/recipes-support/vim/vim_9.1.bb           |  2 +-
 14 files changed, 49 insertions(+), 42 deletions(-)
 create mode 100644 meta/conf/distro/include/debug_build_tune.inc

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8e90c7bbc85..193a8377cf2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -831,6 +831,8 @@ include conf/licenses.conf
 require conf/sanity.conf
 include conf/bblock.conf

+require ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_build_tune.inc', '', d)}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why debug_build_tune.inc, why not just debug_build.inc?
</pre>
    </blockquote>
    OK<br>
    <blockquote type="cite" cite="mid:DB5PR02MB1021376671BF618279846C78DEF0BA@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">
I suggest using include_all instead of require to allow other layers
to add their own debug configurations in a similar way.
</pre>
    </blockquote>
    <p>Use include_all here will cause bitbake parsing error, because it
      is include the inc file conditionally.</p>
    <p>I will use other way to <span style="white-space: pre-wrap"> allow other layers </span><span style="white-space: pre-wrap">to add their own debug configurations.</span></p>
    <blockquote type="cite" cite="mid:DB5PR02MB1021376671BF618279846C78DEF0BA@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">
Further, to avoid the :remove operations below, I suggest
introducing separate variables for the optimization level. And,
since you are moving everything else related to DEBUG_BUILD == 1
to debug_build_tune.inc, why not move parts of the definitions
of the *_OPTIMIZATION variables there as well? That would simplify
their definitions.

You would then get this in bitbake.conf:

FULL_OPTLEVEL = &quot;-O2&quot;
FULL_OPTIMIZATION = &quot;${FULL_OPTLEVEL} ${DEBUG_LEVELFLAG}&quot;
SELECTED_OPTIMIZATION = &quot;${FULL_OPTIMIZATION}&quot;
# compiler flags for native/nativesdk
BUILD_OPTLEVEL = &quot;-O2&quot;
BUILD_OPTIMIZATION = &quot;${BUILD_OPTLEVEL}&quot;

And this in debug_build_tune.inc:

DEBUG_OPTLEVEL = &quot;-Og&quot;
DEBUG_OPTIMIZATION = &quot;${DEBUG_OPTLEVEL} ${DEBUG_LEVELFLAG}&quot;
SELECTED_OPTIMIZATION = &quot;${DEBUG_OPTIMIZATION}&quot;
# compiler flags for native/nativesdk
BUILD_OPTLEVEL = &quot;-Og&quot;
BUILD_OPTIMIZATION = &quot;${BUILD_OPTLEVEL} -g&quot;

*_OPTLEVEL need to be documented, and the documentation for
FULL_OPTIMIZATION and DEBUG_OPTIMIZATION probably needs to be
updated.

And poky-tiny.conf and harfbuzz need to set FULL_OPTLEVEL instead of
FULL_OPTIMIZATION.

</pre>
    </blockquote>
    <p>OK, I will do it in v2, but for <span style="white-space: pre-wrap">poky-tiny.conf, I need to send the patch to a separate mailing list</span></p>
    <blockquote type="cite" cite="mid:DB5PR02MB1021376671BF618279846C78DEF0BA@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
 ##################################################################
diff --git a/meta/conf/distro/include/debug_build_tune.inc b/meta/conf/distro/include/debug_build_tune.inc
new file mode 100644
index 00000000000..ca43d2b955c
--- /dev/null
+++ b/meta/conf/distro/include/debug_build_tune.inc
@@ -0,0 +1,45 @@
+# The modern compilers and code seem to require extra steps to avoid DEBUG errors,
+# this file collects debug tuning configuration to address DEBUG errors.
+
+DEBUG_OPTIMIZATION:append:pn-perf = &quot; -Wno-error=maybe-uninitialized&quot;
+DEBUG_OPTIMIZATION:append:armv4:pn-libjpeg-turbo = &quot; ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}&quot;
+DEBUG_OPTIMIZATION:append:armv5:pn-libjpeg-turbo = &quot; ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}&quot;
+DEBUG_OPTIMIZATION:append:armv4:pn-bash = &quot; ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}&quot;
+DEBUG_OPTIMIZATION:append:armv5:pn-bash = &quot; ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}&quot;
+DEBUG_OPTIMIZATION:append:pn-mdadm = &quot; -Wno-error&quot;
+DEBUG_OPTIMIZATION:remove:mips:pn-kea = &quot; -Og&quot;
+DEBUG_OPTIMIZATION:append:mips:pn-kea = &quot; -O&quot;
+DEBUG_OPTIMIZATION:remove:mipsel:pn-kea = &quot; -Og&quot;
+DEBUG_OPTIMIZATION:append:mipsel:pn-kea = &quot; -O&quot;
+# {standard input}: Assembler messages:
+# {standard input}:1488805: Error: branch out of range
+DEBUG_OPTIMIZATION:remove:mips:pn-python3-lxml = &quot; -Og&quot;
+DEBUG_OPTIMIZATION:append:mips:pn-python3-lxml = &quot; -O&quot;
+DEBUG_OPTIMIZATION:remove:mipsel:pn-python3-lxml = &quot; -Og&quot;
+DEBUG_OPTIMIZATION:append:mipsel:pn-python3-lxml = &quot; -O&quot;
+# used to fix ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+DEBUG_OPTIMIZATION:append:pn-gcc-sanitizers = &quot; -Wno-error&quot;
+
+BUILD_OPTIMIZATION:remove:mips:pn-kea = &quot; -Og&quot;
+BUILD_OPTIMIZATION:append:mips:pn-kea = &quot; -O&quot;
+BUILD_OPTIMIZATION:remove:mipsel:pn-kea = &quot; -Og&quot;
+BUILD_OPTIMIZATION:append:mipsel:pn-kea = &quot; -O&quot;
+# {standard input}: Assembler messages:
+# {standard input}:1488805: Error: branch out of range
+BUILD_OPTIMIZATION:remove:mips:pn-python3-lxml = &quot; -Og&quot;
+BUILD_OPTIMIZATION:append:mips:pn-python3-lxml = &quot; -O&quot;
+BUILD_OPTIMIZATION:remove:mipsel:pn-python3-lxml = &quot; -Og&quot;
+BUILD_OPTIMIZATION:append:mipsel:pn-python3-lxml = &quot; -O&quot;
+
+CPPFLAGS:append:arm::pn-lttng-ust = &quot; -DUATOMIC_NO_LINK_ERROR&quot;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Change :: to :
</pre>
    </blockquote>
    Copy<br>
    <blockquote type="cite" cite="mid:DB5PR02MB1021376671BF618279846C78DEF0BA@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+EXTRA_OECMAKE:remove:pn-webkitgtk = &quot;-DWEBKIT_NO_INLINE_HINTS=OFF&quot;
+EXTRA_OECMAKE:append:pn-webkitgtk = &quot; -DWEBKIT_NO_INLINE_HINTS=ON&quot;
+
+EXTRA_OECONF:pn-debugedit = &quot;--disable-inlined-xxhash&quot;
+EXTRA_OECONF:pn-debugedit-native = &quot;--disable-inlined-xxhash&quot;
+EXTRA_OECONF:pn-nativesdk-debugedit = &quot;--disable-inlined-xxhash&quot;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
These need to use :append.
</pre>
    </blockquote>
    <p>Copy</p>
    <p>V2 incoming<br>
    </p>
    <p>//Hongxu<br>
    </p>
    <blockquote type="cite" cite="mid:DB5PR02MB1021376671BF618279846C78DEF0BA@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+lcl_maybe_fortify:pn-vim = &quot;&quot;
+
+CXXFLAGS:append:pn-vulkan-validation-layers = &quot; -DXXH_NO_INLINE_HINTS=1&quot;
diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
index cc34c05093a..ead4e98e708 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
@@ -34,16 +34,6 @@ INITSCRIPT_PARAMS = &quot;defaults 30&quot;
 SYSTEMD_SERVICE:${PN} = &quot;kea-dhcp4.service kea-dhcp6.service kea-dhcp-ddns.service&quot;
 SYSTEMD_AUTO_ENABLE = &quot;disable&quot;

-DEBUG_OPTIMIZATION:remove:mips = &quot; -Og&quot;
-DEBUG_OPTIMIZATION:append:mips = &quot; -O&quot;
-BUILD_OPTIMIZATION:remove:mips = &quot; -Og&quot;
-BUILD_OPTIMIZATION:append:mips = &quot; -O&quot;
-
-DEBUG_OPTIMIZATION:remove:mipsel = &quot; -Og&quot;
-DEBUG_OPTIMIZATION:append:mipsel = &quot; -O&quot;
-BUILD_OPTIMIZATION:remove:mipsel = &quot; -Og&quot;
-BUILD_OPTIMIZATION:append:mipsel = &quot; -O&quot;
-
 CXXFLAGS:remove = &quot;-fvisibility-inlines-hidden&quot;

 do_configure:prepend() {
diff --git a/meta/recipes-devtools/debugedit/debugedit_5.2.bb b/meta/recipes-devtools/debugedit/debugedit_5.2.bb
index 76c54ba63d4..4ac6cab559e 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.2.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.2.bb
@@ -22,8 +22,6 @@ inherit pkgconfig autotools multilib_script

 RDEPENDS:${PN} += &quot;bash elfutils-binutils&quot;

-EXTRA_OECONF = <a class="moz-txt-link-rfc2396E" href="mailto:${@oe.utils.vartrue('DEBUG_BUILD','--disable-inlined-xxhash','',d)}">&quot;${@oe.utils.vartrue('DEBUG_BUILD', '--disable-inlined-xxhash', '', d)}&quot;</a>
-
 BBCLASSEXTEND = &quot;native nativesdk&quot;

 MULTILIB_SCRIPTS = &quot;${PN}:${bindir}/find-debuginfo&quot;
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 6c81d302438..f4727ee6dba 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -54,9 +54,6 @@ INHIBIT_DEFAULT_DEPS = &quot;1&quot;
 ALLOW_EMPTY:${PN} = &quot;1&quot;
 DEPENDS = &quot;virtual/crypt gcc-runtime virtual/cross-cc&quot;

-# used to fix ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-DEBUG_OPTIMIZATION:append = &quot; -Wno-error&quot;
-
 BBCLASSEXTEND = &quot;nativesdk&quot;

 PACKAGES = &quot;${PN} ${PN}-dbg&quot;
diff --git a/meta/recipes-devtools/python/python3-lxml_6.0.1.bb b/meta/recipes-devtools/python/python3-lxml_6.0.1.bb
index 5d76641675c..6bcd399da54 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.0.1.bb
@@ -23,18 +23,6 @@ SRC_URI[sha256sum] = &quot;2b3a882ebf27dd026df3801a87cf49ff791336e0f94b0fad195db77e01
 SRC_URI += &quot;${PYPI_SRC_URI}&quot;
 inherit pkgconfig pypi setuptools3

-# {standard input}: Assembler messages:
-# {standard input}:1488805: Error: branch out of range
-DEBUG_OPTIMIZATION:remove:mips = &quot; -Og&quot;
-DEBUG_OPTIMIZATION:append:mips = &quot; -O&quot;
-BUILD_OPTIMIZATION:remove:mips = &quot; -Og&quot;
-BUILD_OPTIMIZATION:append:mips = &quot; -O&quot;
-
-DEBUG_OPTIMIZATION:remove:mipsel = &quot; -Og&quot;
-DEBUG_OPTIMIZATION:append:mipsel = &quot; -O&quot;
-BUILD_OPTIMIZATION:remove:mipsel = &quot; -Og&quot;
-BUILD_OPTIMIZATION:append:mipsel = &quot; -O&quot;
-
 BBCLASSEXTEND = &quot;native nativesdk&quot;

 RDEPENDS:${PN} += &quot;libxml2 libxslt python3-compression&quot;
diff --git a/meta/recipes-extended/bash/bash_5.3.bb b/meta/recipes-extended/bash/bash_5.3.bb
index b50a48d28c9..74671f5a563 100644
--- a/meta/recipes-extended/bash/bash_5.3.bb
+++ b/meta/recipes-extended/bash/bash_5.3.bb
@@ -15,9 +15,6 @@ SRC_URI = &quot;${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \

 SRC_URI[tarball.sha256sum] = &quot;0d5cd86965f869a26cf64f4b71be7b96f90a3ba8b3d74e27e8e9d9d5550f31ba&quot;

-DEBUG_OPTIMIZATION:append:armv4 = &quot; ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}&quot;
-DEBUG_OPTIMIZATION:append:armv5 = &quot; ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}&quot;
-
 CFLAGS += &quot;-std=gnu17&quot;
 # mkbuiltins.c is built with native toolchain and needs gnu17 as well:
 # <a class="moz-txt-link-freetext" href="http://errors.yoctoproject.org/Errors/Details/853016/">http://errors.yoctoproject.org/Errors/Details/853016/</a>
diff --git a/meta/recipes-extended/mdadm/mdadm_4.4.bb b/meta/recipes-extended/mdadm/mdadm_4.4.bb
index 26a60e4c1a3..e81b8fdf3cb 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.4.bb
@@ -39,8 +39,6 @@ EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CWFLAGS=&quot;&quot; CXFLAGS=&quot;${CFLAGS}&quot; SYSTEMD_DIR=${sys
                 BINDIR=&quot;${base_sbindir}&quot; UDEVDIR=&quot;${nonarch_base_libdir}/udev&quot; LDFLAGS=&quot;${LDFLAGS}&quot; \
                 SYSROOT=&quot;${STAGING_DIR_TARGET}&quot; STRIP='

-DEBUG_OPTIMIZATION:append = &quot; -Wno-error&quot;
-
 do_install() {
         oe_runmake 'DESTDIR=${D}' install install-systemd
         install -d ${D}/${sysconfdir}/
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
index d4877bb92b5..bc9d803f6b9 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
@@ -44,9 +44,6 @@ EXTRA_OECMAKE:append:class-target:powerpc = &quot; ${@bb.utils.contains(&quot;TUNE_FEATURE
 EXTRA_OECMAKE:append:class-target:powerpc64 = &quot; ${@bb.utils.contains(&quot;TUNE_FEATURES&quot;, &quot;altivec&quot;, &quot;&quot;, &quot;-DWITH_SIMD=False&quot;, d)}&quot;
 EXTRA_OECMAKE:append:class-target:powerpc64le = &quot; ${@bb.utils.contains(&quot;TUNE_FEATURES&quot;, &quot;altivec&quot;, &quot;&quot;, &quot;-DWITH_SIMD=False&quot;, d)}&quot;

-DEBUG_OPTIMIZATION:append:armv4 = &quot; ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}&quot;
-DEBUG_OPTIMIZATION:append:armv5 = &quot; ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}&quot;
-
 # libjpeg-turbo-2.0.2/simd/mips/jsimd_dspr2.S
 # &lt;instantiation&gt;:13:5: error: invalid token in expression
 # .if $17 != 0
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
index 466e757a908..fa7873b62d3 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
@@ -26,8 +26,6 @@ EXTRA_OECMAKE = &quot;\
     -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
     &quot;

-CXXFLAGS:append = &quot; ${@oe.utils.vartrue('DEBUG_BUILD', '-DXXH_NO_INLINE_HINTS=1', '', d)}&quot;
-
 PACKAGECONFIG[x11] = &quot;-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr&quot;
 PACKAGECONFIG[wayland] = &quot;-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bbb/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bbindex1a15c5b4201..0d4c67f0fa7100644---a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb+++b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb@@-16,7+16,6@@inheritautotoolslib_packagemanpagespython3nativepkgconfigincludelttng-platforms.incEXTRA_OECONF=">&quot;

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
index 1a15c5b4201..0d4c67f0fa7 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
@@ -16,7 +16,6 @@ inherit autotools lib_package manpages python3native pkgconfig
 include lttng-platforms.inc

 EXTRA_OECONF = &quot;</a>--disable-numa&quot;
-CPPFLAGS:append:arm = <a class="moz-txt-link-rfc2396E" href="mailto:${@oe.utils.vartrue('DEBUG_BUILD','-DUATOMIC_NO_LINK_ERROR','',d)}">&quot;${@oe.utils.vartrue('DEBUG_BUILD', '-DUATOMIC_NO_LINK_ERROR', '', d)}&quot;</a>

 DEPENDS = &quot;liburcu util-linux&quot;
 RDEPENDS:${PN}-bin = &quot;python3-core&quot;
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index e1915207eed..98dffd1cc99 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -415,8 +415,6 @@ FILES:${PN}-python = &quot; \
                        &quot;
 FILES:${PN}-perl = &quot;${libexecdir}/perf-core/scripts/perl&quot;

-DEBUG_OPTIMIZATION:append = &quot; -Wno-error=maybe-uninitialized&quot;
-
 PACKAGESPLITFUNCS =+ &quot;perf_fix_sources&quot;

 perf_fix_sources () {
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb b/meta/recipes-
sato/webkit/webkitgtk_2.48.5.bb
index 46031322b92..616cd353337 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
@@ -90,7 +90,7 @@ EXTRA_OECMAKE = &quot; \
                  -DPORT=GTK \
                  ${@oe.utils.vartrue('GI_DATA_ENABLED', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
                  ${@oe.utils.vartrue('GIDOCGEN_ENABLED', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
-                 ${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFF', d)} \
+                 -DWEBKIT_NO_INLINE_HINTS=OFF \
                  -DENABLE_MINIBROWSER=ON \
                  -DENABLE_BUBBLEWRAP_SANDBOX=OFF \
                  -DUSE_GTK4=ON \
diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/vim/vim_9.1.bb
index fee9f055e9a..a24a863ba5c 100644
--- a/meta/recipes-support/vim/vim_9.1.bb
+++ b/meta/recipes-support/vim/vim_9.1.bb
@@ -20,4 +20,4 @@ ALTERNATIVE_LINK_NAME[xxd] = &quot;${bindir}/xxd&quot;
 # We override the default in security_flags.inc because vim (not vim-tiny!) will abort
 # in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
 #
-lcl_maybe_fortify = <a class="moz-txt-link-rfc2396E" href="mailto:${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}">&quot;${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}&quot;</a>
+lcl_maybe_fortify = &quot;-D_FORTIFY_SOURCE=1&quot;
--
2.34.1
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
//Peter
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------qq9AEZBQH5McaiU84qQmhJTb--

