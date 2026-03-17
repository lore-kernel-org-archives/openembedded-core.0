Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58ED2FD706A
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 10:14:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72531.1773742458851234965
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 03:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=i8J0cpbY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75360f6290=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H4nWmY494843
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 10:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=dS8RBBZNM8NzGv68wdK7LQ
	hi2uvVYDiGDn6TIAXnuPc=; b=i8J0cpbYMq0Mpa/2xmKxZMQuNhIcSon+Udzr9B
	WsGaTYkQOG9Lg4sMQUrSdi6AzphrcG8hoCb3yKG+ARqw69yzXFy2GQdFDLMCIneV
	aK8b3avwg12G9Kf7hJFgJdFAmvYbBR+AIUFK6+GZF0D1doP4e97+RAgwZcP2nBwx
	Uz/0IhepJe6R89VbQQP56bKXWuuLTXzyWSPSrCdURxIE+KyUTbX4LrQze2Lt8z80
	8GnnT7trDZHJXb6+Ez2G5EvWQbj716IOeO8zE0DeszMqb3tSIZpuj4fIauevmgL/
	gCymtMycmv3bsA/H1kWRx97J6E6ywWEpahohJmH5wzhTdfFQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvvvyk8rg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 10:14:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpMiqr60Zv9KjX8AkqNiR6vBxktqZppXCkz34aNukw7TRQ7Tgoh039Pu+Fn/fM847ZIYkvxXubwUdFs72eOTqwGoaaK8VynCij64/+ejRiXBM5SkYk//8dcCxLyNm1wUPLZ2A1phIXrtyuOkaf4PC659fjQp0G7ItXrzv6hNN/L5aJjE4GGHYs37vLNiSjo07uKw2ihI9unRbAU9g/8+JNtZ+091Rkj/KiSd6Bu/FFUeeI09yCnncf9h3XV4dohgPQbvZV3dk4gE0pmuot/GexhjqxT+rdRWabTn7fQEJtRaEGw6Lt420jnElE7sgtai9TOonCwrg5NlndwojJf10g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dS8RBBZNM8NzGv68wdK7LQhi2uvVYDiGDn6TIAXnuPc=;
 b=S41s9R+cSgdH4xZI6YSMj6XV8qhIFgGI0zVTVDzSrfoLApeC0jR8yDuXrgAWKZhAgP3bWXIgMVjksPV9iqqAY5AC6eMvG7FhCk0NNGmoYfkBKdLn0tAJfBXSN04a5GVh71PIG6i5iSrZbUDoZ8JSGg75njEoFJj7MjknL8+Dzsrsw320LSwWGFqrjmsI63vpcCqphuoiVl8J3HR36/SQ0ircVsDV+/E8xHqjGMTT9itzaToVTU/2cYNO8R7Ae9b2HgRJ0R02n7bLVwOQn1zHPfVv+UF51YCT9hQbskC4CBr4gzIsVtdvrXjwtItPKtOJjVY82uMJaJMeTIzelpavjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 SN7PR11MB6773.namprd11.prod.outlook.com (2603:10b6:806:266::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Tue, 17 Mar
 2026 10:14:13 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9723.014; Tue, 17 Mar 2026
 10:14:13 +0000
Content-Type: multipart/alternative;
 boundary="------------fRSjTU5uSVXW0IfDip7q5uJw"
Message-ID: <71345a0e-8179-4f77-84a4-291f2adc188a@windriver.com>
Date: Tue, 17 Mar 2026 15:44:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 5/6] barebox-tools: fix build failure with
 glibc 2.43
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, alex.kanavin@gmail.com,
        Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
 <20260310174403.2309825-5-Hemanth.KumarMD@windriver.com>
 <CANNYZj_JtZZ7Ftskf+W46LuradpnFv1CvyYt2G_HPJovyCq09Q@mail.gmail.com>
 <0d193cac-0f0e-4eb3-a462-ba5c459bce73@windriver.com>
 <CANNYZj-UY4DVgPbs9RtnCo3g9mxNu6Vh7WbhzXjLeN67J3qHaQ@mail.gmail.com>
 <67653695-5d20-4ef6-bd99-9a6ee5e70966@pengutronix.de>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <67653695-5d20-4ef6-bd99-9a6ee5e70966@pengutronix.de>
X-ClientProxiedBy: PN5PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25e::6) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|SN7PR11MB6773:EE_
X-MS-Office365-Filtering-Correlation-Id: c9739810-8b9e-4351-d2cf-08de840df009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|22082099003|18002099003|56012099003|7053199007|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	u4tlbfKTk/qBqqBAmvYiSz9fpaiaRlP3yCldA2U/vGnyfOTFTWjDmHu8EiVRFHO6gJidXCStdigRVDxxSv0Ux9z5AP0WfKXfeQ5pmHj6SMmr9Yb4TmbAd+8EIWvU8wu3DGeGQDERFsnyyH3bj93G4FyLjY2KSnFby3pB0UTYcRZWB+7282gUiMWQHbwI5AWupjBGpnwEfTwlqD7DUKxrWvHP0BkVYnoCK3U2x6OwKL5rAH6IoVyC0XZDAfdcbRxOC6BPyDN8pndMiykK4yOl3ccybROLzXGaOy27Po4YgghWcD6I46uOCbc00pWNm+2J1qcizYTdUksefRmttpEZjohsOO3AUmLlz4R5b62CHtMwr3LGlg1d066WxXI+1GY2hqdhbSyqz/L7Oc00Rf6uxeG7dwfA6lov8xgR/xJu+EH+rSt9+BGOrJ1yT5Z0cmCMj3tlOUa6+ipDhqEiNf84aU8pRBNw46SLan2G4tCX8rduF9Y6ks1myLtkidT3C91SR6xImCaikF4zOk/TWwhOKkZBYLID+LQOS6Fpuk25GkPALJI6Xih5sgEeWM0+ITrpshDXieePdt4g9c+JWwubuftd2PS2cq0nXke2vqkEIJgZ9A6yaXKzJxvvYu8HX10odSO5HyzJCw/doEg7Fb4ZnczBg4hHDCe5HxQ1z74tvCBHxPUcwGAZOqgDfcStMK3T
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(7053199007)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RmdVRXI3V0dndWFJL1JEVEE4TjkvQkdXVlNIYWRISEdSNzNNbzd6L1dEZHdn?=
 =?utf-8?B?QkJLanJUMGxERVo2ZzV6dXI4NUk1a3piaU9KVk9HUTcvK3BtREZ3VGMvMDNp?=
 =?utf-8?B?Zy9nRzh6bUEzNFJ3WktjdlBjTUJMeVpaUEx1eVVGMXRiMExuQU1OZjFyblc5?=
 =?utf-8?B?TDBZSXFSdDBHZzc0ek1VU01pUHZVaVVVVzlTSXFQNHJodjdIc1VKWTVZdWtp?=
 =?utf-8?B?cU91VW4yK1JuSmJlT3hxVlJwd2VQR05oRUtpTWFoYzV0djBaNjg3bm56TS9j?=
 =?utf-8?B?d05hc3YwdnUya0xqbThiOEJ0MFZBNExwVm50b1NvUUlNZUdkNTEyRXk2NFM0?=
 =?utf-8?B?aGN0LzlVckl2ZDZySXVNR0pVT2Z6ME9XejdKRHZuRmhFemJLWUtIcnRITnFM?=
 =?utf-8?B?K2VPblZqSUVCT1VMV1Y1bWZpYjlVeUU4QjViaWZJaTRTempjUzM2c1p2UFlw?=
 =?utf-8?B?ZVA3ZHpvRlRucmRjRjAwZnlHUVFCMEN1WU54eFQ4QWk5TWJUbUZJb3lqMHBE?=
 =?utf-8?B?Q1NFcWFMVko1MHZUK2wzRXZMZlBTRjJITGRxbTdOU2VyL3hCMnJpd2NveVRZ?=
 =?utf-8?B?S0llYWdvTnJGVVg0eHpqZVVaWDdkSENSUml6ZHNEaFZTS3p0a0pRVWl5WExs?=
 =?utf-8?B?eC9Ia0dZMFJjU0tDUDY5TUR1cnhwbEVQakZKcmdLb2h2bU85UHp3TnZqNVZV?=
 =?utf-8?B?MFBuSENsRGhiM1MwYWxHb1NYSzZkaE1RekFoYk1SUi9BYkZvNnFUakt3eFBF?=
 =?utf-8?B?MnVUa2tMVmtybVYva0ZiZkFpK0xzb29JTEI2NXhGbkRwSG9BNHRIaDVYZ1U2?=
 =?utf-8?B?cEFqM2cvei9DaXhmZnczaTRKd2RYbHYzWFRIa0paUEgrMGZzbXoyZmdXYVl5?=
 =?utf-8?B?N1lRMVpyRmtBazd6dWhwM2hEV2JEVEFQK01SWHNDeE51dEJkTngzRkJ0dE40?=
 =?utf-8?B?aXBGbkE3NzExY0g3TlNxYTVjRkdwUXI3WlJmenFGKzlId2pRQmJGdldZaU5s?=
 =?utf-8?B?dmdaY2xBWm5HVms3UWdwR2RiYzkvdXVnM09RTzF4UFlRQmNKTU03MzA1R1BL?=
 =?utf-8?B?NGVORDdUakpvTzZGbWxYN0JDdjU4MHd0U25EWHU3R2N2bnlQZjRTdk5RTXlI?=
 =?utf-8?B?Sk9qYTdYejJ5VUdtMjZTUG5ZaWVNVUNJWUFhZWFITDArcWtjNUxia3h0Wkkw?=
 =?utf-8?B?Q3FPNXVJK3RDOHhwTFR2MFlpTTZmb284aHlRRjRMUy9EOU5ydzBnUThJWG1I?=
 =?utf-8?B?ZWFxaVl3L0dpdzdUdFI2dXNnUUprUkcvb0h1ekdKbjRXaW9VQVVsNUF0VXZH?=
 =?utf-8?B?b0hxY1liNWU5TjlpM09TRkFUYUp5YllPUVlnODN0TFRKaldVK1k3eTZTdk9o?=
 =?utf-8?B?cHNIQytFakdkNzI1Vyt0ZFc5Z1kxZ0VuTk1QcDFzL1BLUUxEY3ZqMU05eTRl?=
 =?utf-8?B?T2VpL3kyckwzcjJLYXoxcWlhNTVWMm5qUWdURUtiTit0YTdPWjV5YmpmTGtj?=
 =?utf-8?B?QVZIeDZaWGJob0wzV3BadUVXQ2dvZFRZU3Zvd0swNndOQlFLVUx6Z2VWRmpJ?=
 =?utf-8?B?Y0Z4YkFqd0hYSG4ydmRPOERlYzVEeDRTTW1TZjVmK011Mm93L2hVc1NuWW9j?=
 =?utf-8?B?RjF1d3d6T1FqNjlUM0pZV0hlalE3TUVXTW45MXZoYjdKNEpsVFVmdVRuRk1l?=
 =?utf-8?B?UzR6citHM1Q1bVhqVkJKaFZhUVVHQnkzV01xemdNK3FGbWdwZURWT2ZyRzB6?=
 =?utf-8?B?ekM1T0RHRDU1VmswbnRTNVB0SHUxNmhxR3VHa1JZSjhiS0VBV1NLWk5XVXlZ?=
 =?utf-8?B?VUpRNHpqZUVVek8zeXhORDhHbE9DdkNtSUxwZnE1UDl2cFNpQXp4TGg0MHlL?=
 =?utf-8?B?aDEvN3BUZE90dzY0NXFnVlFWYWNPUktncDdXRU11MlhybVAyMDRONjJzY0VM?=
 =?utf-8?B?bmFrQTc5U0FsM1Y3d25LeWI2MUhBRFYzbStiMkRUbW5BbnppQ1ltSlRnOUNG?=
 =?utf-8?B?aFN5TU1QS29zTHk1R0NlWHdtUmdQSVAwZHRZTFoydEtzVDBNSzEwZW5SVVhT?=
 =?utf-8?B?anRlVGRKeUpYc1V5ZVFMa09IbGNqa3VUMXRRSHRIaDNsendXeCtuUlpkeVEr?=
 =?utf-8?B?WXJLNWQ1ZWhYUnRaQThEMWQvWHRmSmU5UndFVXJONFZUWDNDclBVQW12eTdp?=
 =?utf-8?B?anoxbW9HRDlBcThKdVp0cVQ1WkhUcEV2RXRKVXJFOVk2TDFMSWhJQllnRkNF?=
 =?utf-8?B?bnNjK2pTRS9GL1dHL2xEMW5EbWlobDVjMmlzeDA5ZS9XTW53WGtHSEFxaHg5?=
 =?utf-8?B?UVdYeHlvUElzdmtkeEJVd2FiOEdUTmszQ3ZsaGx5V1NYT01yd3dJaE1FU21W?=
 =?utf-8?Q?xx/aHWz+oQwlnx3w=3D?=
X-Exchange-RoutingPolicyChecked: 
	oBmEfk+1uPqoVqdNl1M6Bmnlp+qNg7Am1Iuco+nGtikjhFpb8dpC1z83Hd9medPr/hEOIY3Y63JWUUujTjk2gcNwaEv1wqs7XY2OJwPT5VMg8qSU2svU+/yOeHH9Jkd20BAbadKW233RXYSr+gEWd23FjVTanY5WhoVLOCHRDhWsIAUa+alkIjEbzTk5uLff2qU9hyGI+q6gnmqYOQVr1zSa91O0UKx9PHRJUUqnm8/3KUd+1mM7iLqJFybBAo5QdU9/SvjVZaiYy36wCazSqQyfzghAQdaKtR83z0bc2TXE+/YK4v8nl68X/RenshdCVBdQ4qg0jaq5NyCdDDSF8g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9739810-8b9e-4351-d2cf-08de840df009
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 10:14:13.3188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWsb80QVrcETOBXxvr1hnXKrs5kXSG5YdouNngSOtZVF+27ZlS1YigJAPiS2JozQh0/VmePLDfsXpJSZK3ohLhSWL2BQ73ShyLu9JUO5fH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6773
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=E4XAZKdl c=1 sm=1 tr=0 ts=69b92978 cx=c_pps
 a=qHW1pi9L+1RZ0SKNcL3CYw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=Q4-j1AaZAAAA:8 a=bGNZPXyTAAAA:8 a=t7CeM3EgAAAA:8
 a=jZth-gyJDXovKhO_SLUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=yj-aMKAYKbz0kkd27lYA:9 a=Vmbg3YxQRtdyI2ld:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=yL4RfsBhuEsimFDS2qtJ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA5MCBTYWx0ZWRfXywC2WQCG4InX
 3Ba+oCqCgOchDG6dBIGsb4n46QVi6eMMnZGsRZAt+RCD+n4WN0ml+G84FfOt1f1WdJFJRIMlb1m
 49bg2A4lPGy4MGwNQ0uXScvhRjvRoGhMeW46bGWnfjEvmwf9MxaJ5jhoiaSOnRerM05R9nIf5Fe
 4imV2XfpRT5OtP5G5uWjAIURI2EH9iUdoWfGD/CH9vj2/w9ugBd8rFzMGuJLqrSdMyG6rxGxoxi
 GwnUKhsOsj+gTyup3lq7eBdP2aEx0hUyAnIdIFZahg4ZPzoPJRrreQ/DXnzitQZv2/2WRvO59fB
 26wEFXD17BRlET8JKdhN/wx1mnHKzoUCyHF74mLF1WtCCGOzxQWT+wIdKEXOKNcg7epTA/93nL0
 SYa38R2OkJNoUtjFlyG5VcI8Iw2meR9994nnCU4X5VlYI3Vp+m0D5acWMbJMuA2b6U0a5Z7VH+F
 WUUqB6bVezKreonec5A==
X-Proofpoint-GUID: Y9TwFwkpZpt5MpTgXY6x8CQCJGRVsIL0
X-Proofpoint-ORIG-GUID: 87Em4hAHsF3jP0aN9OmvMloq1Wda_diU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 10:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233312

--------------fRSjTU5uSVXW0IfDip7q5uJw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62H4nWmY494843


On 13-03-2026 10:45 pm, Ahmad Fatoum wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Hi,
>
> On 3/12/26 8:17 PM, Alexander Kanavin via lists.openembedded.org wrote:
>> On Thu, 12 Mar 2026 at 20:07, Randy MacLeod<randy.macleod@windriver.co=
m> wrote:
>>
>>> Hemanth meant to reply saying:
>>>
>>> Hi Alex,
>>>
>>> Sure, I'll do that but since we're in a hurry to get the glibc-2.43 m=
erged,
>>> I'll keep the existing status and follow-up with a status change next=
 week,
>>> once I've had time to submit a patch to upstream barebox:
>>>    https://github.com/barebox/barebox?tab=3Dreadme-ov-file#contributi=
ng
>>>
>>> Right Hemanth ?   :-)
>> No problem :) Note that v4 also does not address a Pending patch in
>> ltp. I made a comment to v3.
> Thank you Hemanth for your patch. I took the liberty of resending[1]
> your patch to the barebox mailing list, so it could make it into today'=
s
> v2026.03.0 in time.
>
> The barebox recipe in OE-core should thus become patch free once the
> recipe is updated.
>
> [1]:
> https://lore.kernel.org/barebox/177340033069.206252.6842304138227246713=
.b4-ty@pengutronix.de
>
> Cheers,
> Ahmad
Hi Ahmad,

Thanks for forwarding the patch upstream in time.

I=E2=80=99ve just sent the barebox-tools recipe upgrade, so it should bec=
ome=20
patch-free once that lands.

Appreciate your help!

>> Alex
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#233002):https://lists.openembedded.org/g/openembed=
ded-core/message/233002
>> Mute This Topic:https://lists.openembedded.org/mt/118245373/4830399
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [=
a.fatoum@pengutronix.de]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
> --
> Pengutronix e.K.                  |                             |
> Steuerwalder Str. 21              |http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |
>
--=20
Regards,
Hemanth Kumar M D

--------------fRSjTU5uSVXW0IfDip7q5uJw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62H4nWmY494843

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 13-03-2026 10:45 pm, Ahmad Fatoum
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:67653695-5d20-4ef6-bd99-9a6ee5e=
70966@pengutronix.de">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

Hi,

On 3/12/26 8:17 PM, Alexander Kanavin via lists.openembedded.org wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">On Thu, 12 Mar 2026 at 20:=
07, Randy MacLeod <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy=
.macleod@windriver.com">&lt;randy.macleod@windriver.com&gt;</a> wrote:

</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">Hemanth meant to reply s=
aying:

Hi Alex,

Sure, I'll do that but since we're in a hurry to get the glibc-2.43 merge=
d,
I'll keep the existing status and follow-up with a status change next wee=
k,
once I've had time to submit a patch to upstream barebox:
  <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/barebox/b=
arebox?tab=3Dreadme-ov-file#contributing">https://github.com/barebox/bare=
box?tab=3Dreadme-ov-file#contributing</a>

Right Hemanth ?   :-)
</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">
No problem :) Note that v4 also does not address a Pending patch in
ltp. I made a comment to v3.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Thank you Hemanth for your patch. I took the liberty of resending[1]
your patch to the barebox mailing list, so it could make it into today's
v2026.03.0 in time.

The barebox recipe in OE-core should thus become patch free once the
recipe is updated.

[1]:
<a class=3D"moz-txt-link-freetext" href=3D"https://lore.kernel.org/barebo=
x/177340033069.206252.6842304138227246713.b4-ty@pengutronix.de">https://l=
ore.kernel.org/barebox/177340033069.206252.6842304138227246713.b4-ty@peng=
utronix.de</a>

Cheers,
Ahmad
</pre>
    </blockquote>
    <span>Hi Ahmad,</span>
    <p class=3D"isSelectedEnd"><span>Thanks for forwarding the patch
        upstream in time.</span></p>
    <p class=3D"isSelectedEnd"><span>I=E2=80=99ve just sent the barebox-t=
ools
        recipe upgrade, so it should become patch-free once that lands.</=
span></p>
    <p><span>Appreciate your help!</span></p>
    <blockquote type=3D"cite" cite=3D"mid:67653695-5d20-4ef6-bd99-9a6ee5e=
70966@pengutronix.de">
      <pre wrap=3D"" class=3D"moz-quote-pre">
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
Alex



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#233002): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/233002">https:/=
/lists.openembedded.org/g/openembedded-core/message/233002</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/118245373/4830399">https://lists.openembedded.org/mt=
/118245373/4830399</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:a.fatoum@pengutronix.de">a.fatoum@pengutronix.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
--
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | <a class=3D"moz-txt-link-freetext" hr=
ef=3D"http://www.pengutronix.de/">http://www.pengutronix.de/</a>  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

</pre>
    </blockquote>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Regards,
Hemanth Kumar M D</pre>
  </body>
</html>

--------------fRSjTU5uSVXW0IfDip7q5uJw--

