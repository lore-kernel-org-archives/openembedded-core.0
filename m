Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5163FD73EAF
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 01:12:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.623.1769735558374671262
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 17:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=KL/ruy6J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6490b94fbc=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U07f2P3256500
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 17:12:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=epnC0oN190w1g1+IlsdfSe
	PbCffcjjbvJS//OAS/Qzo=; b=KL/ruy6J91Ywgj1V7iHhI3RC63hFXU5DB2EeI5
	kCIJsWTvbEtuvLXiba0iNZHueRhFLoRJtxRXFRS28xM80d52Z6uP1bLLmC1GqymG
	qMLHflZyE5AlMzLOyrCbXoBR4JNwZ4OOLlMZ3W4PJvqkVVJvE0C1DlVa+kauMm0L
	WLAOmnqSb2ToPzJB3XVbR7TKPu2Sus7r17v1IcTPm7+0OCZk9FaOA5qR5CNx862V
	zT4tThqJMcb6Yr9ZWsH0IWCgqYgLrikLSVq/4mwbKeYMOQTZEdqwWZnERtdH948T
	ddqBG3YiyZ6b7iyeZEFu4U8aaxcioBtogbXCSiofjHIy4zyQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010010.outbound.protection.outlook.com [52.101.61.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bywwrhhau-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 17:12:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwbClIxHcRVFKurt6OLORVJ0Lh8cWnI0I9I5qHzIX6pvM4rjtYSbJVycTTHKVjXp41U83PzMT8P4kIp353HxT/GS9ptk775r7BDbpP9lgckpBLizG245OOKdxAjLAXtCCP15iyI/CGUF1rQ664tJT+13eNtlg1+J1sgNGxAqhQuVXKm7zz4xcDEI1WcubYPm2qs7Ak2B/STuEK18aiCA6bvt9Cp755H5iKGcTM7m0Hd02u0nZZKoIC5jbVVanTjwlNr44NIFT7HBAsfAxLVrqyFHxtUMWRQvMkeG/wFBEiiPch+I1QRsNpifaKqqjl6ww51Jqgs2MLJj8bKR6FAhzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epnC0oN190w1g1+IlsdfSePbCffcjjbvJS//OAS/Qzo=;
 b=eW2fnnHZUDA/m6aHm/JYf3WTTDuG70YqiyjugV4beT96IfVxv20+tTPdrKjXqTVJPDG6GJZVhqeY2jhxt34X05j4olDiNRDcaenuLJEiJI4qhTnQEDFDEuW7z8Wq4loevimvFYqQWN6TlU9BkRABXfHPlMnAysaVNDOyrFzYuB6HS8PPfB+8PeIlGYtGrmlSTUkwoy98Fr5Ik26/OxVv0AsT4WtoSH9ZlpFoVQlhtmhjZhmMDLDCnKP1Wi6kW7C6ORiEVlbLVdC2KjBH6GwraQegq0jtQPpuHzmcJXrVjHjDDsfew0Yjx2Vq2WvBVRriJAzHJLNM6AYP+ZVCT1RRuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by IA4PR11MB9082.namprd11.prod.outlook.com (2603:10b6:208:56a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 01:12:30 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 01:12:30 +0000
Content-Type: multipart/alternative;
 boundary="------------XYqflUkcrgfqY8qUgYZbABCV"
Message-ID: <9dddbad2-9d69-4ba4-9a8e-fdabe70e9018@windriver.com>
Date: Thu, 29 Jan 2026 20:12:23 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 21/33] python3-ply: move from meta-python
To: openembedded-core@lists.openembedded.org,
        Tim Orling <tim.orling@konsulko.com>
Cc: mrybczynska@syslinbit.com, Rob Woolley <rob.woolley@windriver.com>,
        Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>,
        Konrad Weihmann <kweihmann@outlook.com>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
 <20220314224837.834776-21-richard.purdie@linuxfoundation.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220314224837.834776-21-richard.purdie@linuxfoundation.org>
X-ClientProxiedBy: FR4P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::20) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|IA4PR11MB9082:EE_
X-MS-Office365-Filtering-Correlation-Id: e1d60bb8-7fe9-49e3-0ec2-08de5f9ca3c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QjYrcTFMTmdyMk81Vmhvck1ZN2JFcEJMSVBIZGI4ZjlsM0NZMjRGR04rUUN5?=
 =?utf-8?B?MFBtNlJHRVlqRXVLSWtzeDE4UnhURGFuenh5aUpPZHZWVDRrZGxGa0RRMyty?=
 =?utf-8?B?NUs1bEVXYW00L0tPZnpBbDdTYkh5VWFTLzlsVWQwSjNmL3dCeVNhaGdOU29H?=
 =?utf-8?B?VW8yRHN2NTV2T2toVFlnSWpubWFseUlXVDN1SGFtUCt3S1cvRkFZU1M3ZGUx?=
 =?utf-8?B?NVlIN0ZkNU5HRllPaE1JNWpzVjdkS3I5eU1yaWMrRXIvYnMwd3hQYzBOYmsr?=
 =?utf-8?B?MGNXZGRHLzJLdlJzd3NuY3BKNUJvdGRZdkNYZ0Npb0tlNnp6K282bjA2ZmFt?=
 =?utf-8?B?Smd1Vi9EeUFLbXg5REFBZG0wZGxJeEhSUTdRd0tqMDVMYlh4UmwraFFyWW9H?=
 =?utf-8?B?TUgvWVI4UldsWlltRzhjR0JXcVQzcHNFbjNmU0EwUmlhc3FYMkZYUGJKM1F3?=
 =?utf-8?B?OGplVUhBV3dqR3AyQlFSZDV1NFE3UDBBczdSTWJGQXZGdmxOT0FPb3l3SkF4?=
 =?utf-8?B?c2l3cC8vRXp6b3VLQmg5NENMKzRTUWRoQ0dIQ1ZjQWlKeUIvRURpUzFDUjFw?=
 =?utf-8?B?cTNVM0JUTEN4NFdWYXhaRTNJaTdRb3hDUkhhVFM5K0ZwWjNqVUNRL0ZzaUxM?=
 =?utf-8?B?aXI5MWtDc1pqbXVwWU1QVlRaclYvUi9NVU5heTRkYmRUNlJQMG9vSWx3Unhv?=
 =?utf-8?B?bzFuelBlcEVDNitCdHY4ZXZmOGZndlhaOUhoSVdLb1dQcldnN2JyT0J2TW9T?=
 =?utf-8?B?SzlFQlFFQWlUK2xzWXNVaVdmNzlUV2hxa29LRTlkNFIvR2VLR0x5d3VhZEZV?=
 =?utf-8?B?QVQ2eWFJUW5sT3E2L2F4QzBWdktZUDh1Rjh3dkxublBHa1JVTWxHT1Fncmwv?=
 =?utf-8?B?emx0U1d0WWFNclR0NU82Nm9NZVJSWXNwRzZleGxsQ3VRei9xQzk1dm5PSHJj?=
 =?utf-8?B?R3lKNG1aekNMa1ZLL2lFcnpYZUJhTHBrQkZ6M2V3WGlQeDJtQ0VQTVpENU9Q?=
 =?utf-8?B?bmlOVTVEditsRS9VVFM1b0Zxc01Md09PV25QdmtpV28zTURyNEkrWHNnNVZT?=
 =?utf-8?B?L1lwa0JYdng2ZkhHWXdnYlBzL1dyN2ZZNzFBWkRsK2N2WU4wRjVTSzNnTHB5?=
 =?utf-8?B?MG9TSEpRZENmWTltSVc3S09hSnhRdExBS1Yyc2U5UFpCanI3Y1QzQnE5d21R?=
 =?utf-8?B?ZEFraDYvV1h2clBkTlMzdUtBR1dJZXEzZzRUdXRhRi9DaDRhclQvb2h0Y0pI?=
 =?utf-8?B?L2RJemlCd2VBeUJDcm9PY1p6NHVxYmtFOGhQc0xPS1JBZlg3SVV3Unhld2NY?=
 =?utf-8?B?WWd4Z2NPYnRNa09RQ05yZEhSSExwL0pkbDFUVGN6bWVmMHNCTldPcmIzMm1H?=
 =?utf-8?B?YUVjeTY2ZEY0bU12THFzaFJzYUcwNWtiUDNsS0U4WklpSCtpdjNXeE9YZjRW?=
 =?utf-8?B?YVB6N3RZRlE5UGY3V2NKYXg2Slk2UW0xK0ErdWp5U3V0OFEyTXRkSXIxR21I?=
 =?utf-8?B?VTRuOEw0MVh1dHZuckl1SjFrenQzNURGTUhDNlN4cmlFNkFyRVI3QUo0d0dj?=
 =?utf-8?B?dEljRGJZMmh2eTNIRFJLSWxTSTN6Qzg4ZVNkcnFkOVVvK0hudGtmOUlMN1g5?=
 =?utf-8?B?YXdRSWdmWkFFc1lJV3hXNEZLU0Mzd2tIZlBHMG1LRTQ4Zm5jSzd2Rnd0T0s3?=
 =?utf-8?B?UnVaZ3BKZHdBU1hZUVRnY3RzMkVmVy9hWWhZcGp4cHBnYUN5MGJPcE5sZFdw?=
 =?utf-8?B?QUpIWFVLbDlLWjhkNnNNcVFET1lwMGwwZzI2eFdGamV4TWYzR1FiYm5FcmJn?=
 =?utf-8?B?cXV1d2JqSjY2bW1zZ1ExTWhZdTd6dDJiVjVlUTdoU2JRcTBPYVlVNm5nVjlV?=
 =?utf-8?B?S0VrcWVhZ1NQekVtZE5rSEJGWHVFcHpmS3FZVTVzejJmeEtScnl5c09nQ3Js?=
 =?utf-8?B?aFpIWFl1UzIrY01ISHViYktXK0kvcHBFNnorMEFZaktKTzMzR29HL0RSd20x?=
 =?utf-8?B?Mkw0c1hJaUtobU02OFFNcU1tMldGa0pJY2VreDJwYnNkOXZEc0VRNjFYeXMw?=
 =?utf-8?B?cjY3bmRJdmk5aVhqVXJIQ1dZVi81ZWNWbXl5RDk4OTUzQlhuaTJucFBMVkEw?=
 =?utf-8?Q?gSC0g1y8A6g+dIvwogcnQbbX4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N0VyUGI1WGFrZnpEbmNqbmtTZFE5aldLdHRiUkVlK2tyWTdNQWkyT3Rtc0xh?=
 =?utf-8?B?ZVJoNDl0NDFBc3ZXODA2aE45aEdJSTZLeDZ5RUpEb0lGVWs2dURYeGxZd1dS?=
 =?utf-8?B?UlBiUTBxWGk3a2I3ZngwaGE3a2JmVmxCMkVtb2xhYnplSElHczh4SDhJSGhp?=
 =?utf-8?B?WEVYUDlPaHBPb2NheE90WXBpZjQ3OFRQS2VFcnEwOVV4cmlqUXJveEdUT3pq?=
 =?utf-8?B?VXJveXZJa1NTWWVGMmNSbnNjWnRUd3FuTzlSWGR4T1JNb29kWWlKaGhCcGFh?=
 =?utf-8?B?ZUV6cG1yRW41ZXQ0RFE3TGNhY2NyVnU2aXliYUYvRENacExuSE5aV0xxdG1O?=
 =?utf-8?B?aXY0dG9EdkRNeDdGUlpNeDZJcWdad0YxenV5Z3NraFA2cjZNNDhFNi9qclVZ?=
 =?utf-8?B?UUZ0Y0ZTdVFsNkU2TE83RTR6VitVQ09vbHg3UG9WbkxaNHd6bWMrd2JQNzM5?=
 =?utf-8?B?b0RCeXI1MldEYjY2UnNnSUQ0YlpTSHZnamtwYWhjQ00rWDdmL1FFL1lieGEx?=
 =?utf-8?B?ZncwU2lkT2dvWWZtRzdLODRiN1JtQUpPdVkybzIyeGxUTm8wS1RTMjF5eUxD?=
 =?utf-8?B?dDdDakFmRGt1d3hDakFTL0xSMnZhcDNZZXBIWXRKd1plWHN3a0hjVUFCdnJJ?=
 =?utf-8?B?Yy9ncGFsL0VpRWgzVGErQ1hITjJZZWh3OVA1eldsYjFncTB4VHl1UlRMNXkv?=
 =?utf-8?B?Q0lGMEtZNE9sSC9vWUdTMU5SSUpUTDc0Ynd4S0tCOCtZRVlLT21uYmVzNnZR?=
 =?utf-8?B?ZkdTU0t1WjU0YVY5ZFE3NmVSdUdxV0JSV3oxVnh2aUFFcFlxL1QvcXcrbjJm?=
 =?utf-8?B?cENhRkVrQ08zYTlKYXdndGRrOGx6MGlublhCL3R6ME03YU5SRzkvalhyM3pq?=
 =?utf-8?B?UWFFNWU0b0xBVnJ4alpmV0IzYzdaVzJpdmhnVC90WDFvTXM5bDlxaCtRWTRB?=
 =?utf-8?B?RXRoMmhRTWFtN2dqYmVjSDU0aWt5S1lHSXlabTFGeVNkZUpkVjJaRG01VURV?=
 =?utf-8?B?aHZNZ2tGSGNVWXRRaTgwaWtFTzNYd1hxTUtKU3M4c01PYklmZUtkblBLU1lS?=
 =?utf-8?B?VnF3eHN4Mm5XM1JtYzRneEN5cU01eDZaY3lKSHBKdWtCV2Rub3QzQXZjRXhR?=
 =?utf-8?B?WjZyalU0a1VjV1FSQ2tBcmg0S1F1TklFQ0tvSUtaQzFlNWFWblkvemtic2Vq?=
 =?utf-8?B?bE9MaG5jQVlmS2d4Zk5QRHd4b21zeFNGS09BdDhyUlZreTRUa1pCYTc1YVVx?=
 =?utf-8?B?OFZOaHplVVVIQ1hCcll3RzVXRmdRclRBR1oxM1lwR3JMZ2l4WW1ESFNtRU53?=
 =?utf-8?B?OHVsSTVUNE1zdnFFTzdNQXcrcGVFVzY1aFFjeHlidTQ1Q2dNSXBieDNkTHFE?=
 =?utf-8?B?WWxMc2tPMkROVThEWkZ2eEJUY1JVTzFqL20yNEc1b0tQeWt5TkkrRnE3UGpD?=
 =?utf-8?B?aEJEUFpBM3gyZEFEL0xHVFF0SjBPYjFuandqMlFiaWhRZVM0ejdjYkp6elNT?=
 =?utf-8?B?Z21JMzIreWw0amxOU2w2b1huK2xyV2o2VkhmbnNjZDdMaE94dkdtSEdlYjZY?=
 =?utf-8?B?NHNOeERZeG1iejc5WjVmZ3hMUUE3NVdWMHVXWHlkeXcwbDVDL3ZHbWl6ZlhQ?=
 =?utf-8?B?SFN6NG9mdUluSFdHSGsrcmFkU0Y3MWpXN3JkT3k5Q3Zic0V3UllEN1ZpVENr?=
 =?utf-8?B?QWpMQ3R4alZsL1BPaGpTN3NrQWozWG5CTko0R0tGTnR0NHlEMzVTSVZHdXpa?=
 =?utf-8?B?elZhSFZ1Y3V6VmUycFZ4SVRnelNHejU1eEhwQ3ZuUFJwTGQrZGlaYklNV1Qy?=
 =?utf-8?B?Nm1FckQ2QXVDdmN4THFsTFBValJHRWU4dnlNZFZ0NGdxNUIxQ2xTcWdRWjhu?=
 =?utf-8?B?TEM1aHhxbG4yVlUrR0s1bkQxMmlvOXpCa1Y2ZCtLWDhXSzYwR3h2ZkRFQ255?=
 =?utf-8?B?bU1GaC8xYWpjRU9GTlIrM0pIWUtnWU11d0tXckR3aVRJUzBCdStkWnhDNTlI?=
 =?utf-8?B?b0REN0F1QitnZnlTQzgwa3ErZWJoQ3pDZ0JJeElLR2p4djZ0eWxTTEdOd0cv?=
 =?utf-8?B?Yks3UUs5RlRLTUdFVGV6NWRtOTRQN0c1VktYTEtaZzVoWEhHRkI1cjh2dS9S?=
 =?utf-8?B?d05EeVJJM2YwRXFyRlhXTm9GYnpmNFd5R25vVEFLSVB2dlRENWhEZXlhbTdH?=
 =?utf-8?B?YWVOMUJPbmJ5allNS0psTkt3MFh1SitKY3FvTTNsK25hRWtLQnhnbjNZSkg1?=
 =?utf-8?B?N2FXMVlMRXhjYnNydytuTDZVRm8wNmo4eDVFU3c3dXpKZlpnYTI3Y0hjRHpn?=
 =?utf-8?B?SndXdHdWMGl3M1FwbGEzVDh2djdIN08xeFNMVjFVdTBDa3M2bC9wdGlZdlVB?=
 =?utf-8?Q?m0nPA2uEIUehNlSQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d60bb8-7fe9-49e3-0ec2-08de5f9ca3c3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 01:12:30.2299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTKT8q4TO0XDkB4DCj5rnKpQ55mnQe75SCEn+Fn6NrwWFm1NQZGuM+N/xDVQv386wJWorfboju6RppyWJk+b+qXtW5RorIWSmpEBOXtpaKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9082
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: IXq_BXR0kEsaim98uysrAnhbyFM2fR94
X-Authority-Analysis: v=2.4 cv=KMVXzVFo c=1 sm=1 tr=0 ts=697c0585 cx=c_pps
 a=QZCRoNrmhm2x71JB/dW4Lw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=8AHkEIZyAAAA:8 a=k-42gJp3AAAA:8
 a=i8PUBiQ3jRtBHGnszk0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ag1SF4gXAAAA:8
 a=M9o1KOA16XSL0SnBVJEA:9 a=RH0siUWtQy9f_A2M:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=uCSXFHLys93vLW5PjgO_:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwNyBTYWx0ZWRfX7snMcb/dGSMH
 QOop1UNOQkE8nGf3pOXjzTR95ZkN3eQwWgreDtTiZytFGi0uU+8sjeDFOclWtOdMqfvKulsoFeB
 nCHTPHlJDYu1eq/juYX0uBK/RPUFak3Wna81RP4cwiPt75Dnx4kqKkHTfeGGMbQ3kRDHtYEUhVB
 Lj0U3f94Oj4MlMGJR5/IigU25Hw/iXy2SK48uE50tyE3YdCdDqFbgFieboD8SWNpA681UfXMgXr
 Gib31Vu0MXfX2gIQFSLbuxmlxuy5nvtjZWC0VTCFnBrdD5vR1mZQz+pAkY9LjoqtrFoJOxsMk2C
 SEp5FCJf/Ww4nQzh8IXmVtxcov6OIzjyKKbtYyKh4eeOLUbUmAykgRkJejBxI5kEq+22F1X+RGb
 agFX26uRycgdLl0i723mC8t0BUgLNxuXi9MC/ds198C2lAzEB0GNyui263MpP8fBfvcPuNToxb5
 bZVZCuDPWnL2g63Z06A==
X-Proofpoint-GUID: uXTpmOP48-Ew8wVa5dzyFSR9luyIqp3u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 01:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230173

--------------XYqflUkcrgfqY8qUgYZbABCV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60U07f2P3256500

 From almost 4 years ago:

On 2022-03-14 6:48 p.m., Richard Purdie wrote:
> From: Tim Orling<tim.orling@konsulko.com>
>
> Dependency for python3-cryptography
>
> Signed-off-by: Tim Orling<tim.orling@konsulko.com>
> ---
>   .../python/python3-ply_3.11.bb                 | 18 +++++++++++++++++=
+


I was looking at a python3-ply CVE the other day and I noticed that
the upstream repository was archived by the owner on Dec 21, 2025. It is=20
now read-only.
https://github.com/dabeaz/ply

so we'll have to see if anyone takes over maintenance or
if the users switch to a different lex/yacc in python implementation.


On master there are only 2 current users via a layer index depends query:

https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Ddep=
ends%3Apython3-ply

but there could be some recipes that use it such as meta-sca.

I don't see where it was ever used by python3-cryptography but it is=20
still declared as a dependency=C2=A0 for spdx-tools:

=E2=9D=AF rg python3-ply
..
meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb
16:# Dependencies required for conversion to spdx3 :=20
python3-semantic-version, python3-ply
24:=C2=A0 python3-ply \


Consider this a head up for those CCed.

Since it's not maintained, it would be nice to replace it
or if not really used by spdx-tools, move it back to meta-oe.

../Randy


>   1 file changed, 18 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python3-ply_3.11.bb
>
> diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/re=
cipes-devtools/python/python3-ply_3.11.bb
> new file mode 100644
> index 00000000000..99c037bb734
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Python Lex and Yacc"
> +DESCRIPTION =3D "Python ply: PLY is yet another implementation of lex =
and yacc for Python"
> +HOMEPAGE =3D"https://pypi.python.org/pypi/ply"
> +SECTION =3D "devel/python"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D"file://README.md;beginline=3D5;endline=3D32;md5=3D=
f5ee5c355c0e6719c787a71b8f0fa96c"
> +
> +SRC_URI[md5sum] =3D "6465f602e656455affcd7c5734c638f8"
> +SRC_URI[sha256sum] =3D "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b=
095321aef446081da3"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN}:class-target +=3D "\
> +    ${PYTHON_PN}-netclient \
> +    ${PYTHON_PN}-shell \
> +"
> +
> +BBCLASSEXTEND =3D "native"
>

--=20
# Randy MacLeod
# Wind River Linux

--------------XYqflUkcrgfqY8qUgYZbABCV
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60U07f2P3256500

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">From almost 4 years ago:<br>
      <br>
    </div>
    <div class=3D"moz-cite-prefix">On 2022-03-14 6:48 p.m., Richard Purdi=
e
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20220314224837.834776-21-richar=
d.purdie@linuxfoundation.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Tim Orling <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:tim.orling@konsulko.com">&lt;tim.o=
rling@konsulko.com&gt;</a>

Dependency for python3-cryptography

Signed-off-by: Tim Orling <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:tim.orling@konsulko.com">&lt;tim.orling@konsulko.com&gt;</a>
---
 .../python/python3-ply_3.11.bb                 | 18 ++++++++++++++++++</=
pre>
    </blockquote>
    <p><br>
      I was looking at a python3-ply CVE the other day and I noticed
      that<br>
      the upstream repository was archived by the owner on Dec 21, 2025.
      It is now read-only.<br>
      &nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://git=
hub.com/dabeaz/ply">https://github.com/dabeaz/ply</a><br>
      <br>
      so we'll have to see if anyone takes over maintenance or <br>
      if the users switch to a different lex/yacc in python
      implementation.</p>
    <p><br>
    </p>
    <p>On master there are only 2 current users via a layer index
      depends query:<br>
      <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://layers.openembedded.or=
g/layerindex/branch/master/recipes/?q=3Ddepends%3Apython3-ply">https://la=
yers.openembedded.org/layerindex/branch/master/recipes/?q=3Ddepends%3Apyt=
hon3-ply</a><br>
      <br>
      but there could be some recipes that use it such as meta-sca.<br>
      <br>
      I don't see where it was ever used by python3-cryptography but it
      is still declared as a dependency&nbsp; for spdx-tools:<br>
      <br>
      =E2=9D=AF rg python3-ply<br>
      ..<br>
      meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb<br>
      16:# Dependencies required for conversion to spdx3 :
      python3-semantic-version, python3-ply<br>
      24:&nbsp; python3-ply \<br>
    </p>
    <p><br>
      Consider this a head up for those CCed.<br>
      <br>
      Since it's not maintained, it would be nice to replace it<br>
      or if not really used by spdx-tools, move it back to meta-oe.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20220314224837.834776-21-richar=
d.purdie@linuxfoundation.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-ply_3.11.bb

diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/reci=
pes-devtools/python/python3-ply_3.11.bb
new file mode 100644
index 00000000000..99c037bb734
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D &quot;Python Lex and Yacc&quot;
+DESCRIPTION =3D &quot;Python ply: PLY is yet another implementation of l=
ex and yacc for Python&quot;
+HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://pypi.pyt=
hon.org/pypi/ply">&quot;https://pypi.python.org/pypi/ply&quot;</a>
+SECTION =3D &quot;devel/python&quot;
+LICENSE =3D &quot;BSD-3-Clause&quot;
+LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://R=
EADME.md;beginline=3D5;endline=3D32;md5=3Df5ee5c355c0e6719c787a71b8f0fa96=
c">&quot;file://README.md;beginline=3D5;endline=3D32;md5=3Df5ee5c355c0e67=
19c787a71b8f0fa96c&quot;</a>
+
+SRC_URI[md5sum] =3D &quot;6465f602e656455affcd7c5734c638f8&quot;
+SRC_URI[sha256sum] =3D &quot;00c7c1aaa88358b9c765b6d3000c6eec0ba42abca53=
51b095321aef446081da3&quot;
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN}:class-target +=3D &quot;\
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-shell \
+&quot;
+
+BBCLASSEXTEND =3D &quot;native&quot;
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------XYqflUkcrgfqY8qUgYZbABCV--

