Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2161ACDB466
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 07:01:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5935.1782370882074829722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 00:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=erTOvfeq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0636a81255=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P5R1vA513575
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 07:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=OMQ1C16Dqs8HVkfac8KrmetQUM/h3YPjbJ2a27SD4Mk=; b=
	erTOvfeqAn1oD+49mpBT2gUProCxJ+d61TAeTUd8jkYR4jMUZmPU5/O4urHjfn5A
	zol+o04yZd+30KjDWg4+LFXMkFP1HldkwqS5LHabUl+jPI+h4/OxfU1wvLZ083Em
	W+dMJ6VOVnIIQVGLnN+d67kPgqUPKTs/2tQlMDx+vwZYBOY7rd5tF2NWNTVHECLB
	yGgaKxIP6eLCoeZCU6Ev/AOt3FbjWhAxcFDJVdgiv3crfkzjzXrdQ91WYtTLomSs
	KIMB6ZsU3pBnIVeu7IEI6tKmwAtgLxdS2etYh8J8px1/ySld34hdkomnmhjld3Rj
	cX3lO/Vyp7/mtTfuNmH9iw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f0t5dg943-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 07:01:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFGJmeFf/UnxKaVx+1peCSswli0IDrybeXpi/WNEmTEqa2cjyGAlhTrkTlk5+Mlp7A2vJauyc6DyRai7nCxLkyzgAa6DUtSaZaB5S91CO2rk9zsx5Nq3Rw7biz0C4bZkAO9dBGAWsH5eeMOB67vqan9RCBjlNpRafMe1UHACd1sHuZnMZ0A688hm7czu8GZjltAPYFz0iLpYuEku/gJSZIqSmBVreYPly6wjIZwP/bq6lmU5bGJF7F0g/D9pZWqdblL0vIcxxxXU72eyTwVzFhAjnYwlGAWOp7Fcv3Z+HC/0f4uFlzRyJ1IKmfI6NcsO0A/LUVwbEvwhmJ160KKMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMQ1C16Dqs8HVkfac8KrmetQUM/h3YPjbJ2a27SD4Mk=;
 b=LVeOyQEZYlf9RJVoB/qvAP2P1YqEzvPkvWEw1pZfP7nf5ui95GVxoH+RZPab0wqLBBjmBrLYQ9aMmmY2klJbqlPc5rwlYpUR25LhF/rklno6GvKcM3emICwIvEbissbfEGiD8kZRNpV3DqH3J1bwLhnM+d/byGkotqGTkEJIaSVEdZjPPJihBGKdYdd+Up7IaQ4wCIR8sFc7UvjZjp+QFBkDgoPFJ6SIP8KgVXKqytyrtVn3nZDmwpddEJjzWO5/9LwLyzkfIHQIBICNbXuHYuwwMFXKSk73YywrZp43V+JJcd0zTgxIkXFiVwYLP2OPINA7jpJ90gHYZwH9gvgakw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 SN7PR11MB7640.namprd11.prod.outlook.com (2603:10b6:806:341::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Thu, 25 Jun
 2026 07:01:18 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 07:01:17 +0000
Message-ID: <17171ab1-eafa-4303-bc3d-8a4c99ecb79c@windriver.com>
Date: Thu, 25 Jun 2026 12:31:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] sanity.bbclass: warn on .cargo/config.toml
 outside the build tree
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20260624064224.2998388-1-Hemanth.KumarMD@windriver.com>
 <f9be9a387e024dc86312a45e2a4b029e5cbf2ec2.camel@pbarker.dev>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <f9be9a387e024dc86312a45e2a4b029e5cbf2ec2.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::12) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|SN7PR11MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bc6d3de-04d8-4340-4c6b-08ded2878dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|3023799007|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	w9cg/bzSMPeYS5e893Uhrbj8rUhQKOH0B0s26M+It0tuzmxzkjUL7g3Qtt8PuexQvdxpqcKHovbup4Qu1KxttWxEYvb8ReUAdXks8i60NqT9Y85+bnSGaRRG4vc4PABsE/Eau3sJhq8iwNBDepn8IIFdGh7Eh0JaDfGlWW9wdrHmAaiqt/Hpd7YX2jGi2UUAVbWE4rbDsUJ6iZD2ez3YhLaJK4fm3/60ANRNp2dn0Xt9IOZ4HAnehkByxjv+fai6d9VlIw1OANIaNSDLcDTDKJibTbSfoATlsVgIi+imjE4tT+2dXN1ljctmvz+C/mtVRdPsMKGYbCOZjuUkX5awvn2sgupGXtqjsC8A8cF57l82HUMUrtNoVxYnQFWtRvzH2QpJ/3kGkVoAlZEqRHevyPP5dzbHtRIO69o3rjP657VBJwSE8uNJJW3h9N+TlBhlafYSORDKinOY27YaaofulTfpgFRimCMIHapIsJt3ypDjLSRNvLsRFtx5rsb66cy7XjWcqPLCS8c+X/TkR3xIgGoOL+I415yeTKbLG2bX8B5febqdML/YKseF8ph3dvFTFZyc4U654haUMoH0UeP3xEz4yd0jqCjM1DTLHbEwyBQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WVhEZDZIQlNoc3IyaU1WSFdOSHNmTVQvZmUvV2FTUG5xZnZWbm1XVENKck1R?=
 =?utf-8?B?aEJUR2J0WkFoeG5ub1dZV3g5OXlNM1ArTjFHSnlFdy9KR2MyRjlFQWxweFJG?=
 =?utf-8?B?ZFFDV240R0d4R2RnSGlYb3ZFcTdWZUl0M2w3ek1PQTBvZkpGS24vRFJGQU1J?=
 =?utf-8?B?ZHdWeTZjbHk0bit1SkJFY3o2VVZXaWZQV1MwUEJPQW52emRjVXRFMzlIK1ZU?=
 =?utf-8?B?d05wMU9nT2d1Y04rL2gvRU5YUWV1SVMxQ1BwSVJuaUJrb1N6WTZPS1pYQmIz?=
 =?utf-8?B?SHJZaU04TUtuUktmZWIzUlZUMDFTK0dvemxMK25ITTBkVVVKdzV0Nkd3QSs2?=
 =?utf-8?B?RmJZZUNhMlZPTXZNZ3Q0SGRIRnVPMGFPRm5QMGNGZk51ZU9wY2lDQm5sUU83?=
 =?utf-8?B?UlNKbVJ0T1NLQ3krSVVGa2M2K1kwSzhucmtJNmpKUWs4NGxDd01VYVdacEtl?=
 =?utf-8?B?WDhLbEM2czlzekFsMFJGOHVISitNU3lRY1ZLblpMdUJxRi9mRitQVnhlR3FP?=
 =?utf-8?B?NE9SdmxEL1g0QmNqMGFwKzk0NjZIb0Voc3VHQmpZaGQ4cGpiN29aYzhnamhv?=
 =?utf-8?B?MEtjZXdyVVVsWlVCS3d4R0tscWh5ZUp5WnpDa2ZkOEVJRnIwSk52a1lxRGpt?=
 =?utf-8?B?U0oxbythRHRVSEpLRWJTcXJEVmorZDFnNmhYc3lTZEM4bUlmRnRJeVN5S2VE?=
 =?utf-8?B?UFBRUG1MRWV3QUx3dTVmYjhjMkxMZWc5REEwYjR2MWtJTGNVbkdGU2ZBaita?=
 =?utf-8?B?akE5VHdoTkhyWWNTRExPS3hEMzNrU1FKeVhxakxzRDhtZHFVMVF1dzArZnU2?=
 =?utf-8?B?b0p0QWlhTDduckY5WkFMbW0zVkF4SnM1eXlTL3BxcGlZblZLSEFhdWdTVXF4?=
 =?utf-8?B?aVBRS3BGMHpoWjF2YUtXTzZIRUVhdzRqNFBYMWpES1hDYm1RYjIvb3h2Rmgy?=
 =?utf-8?B?VjJFdFkwODlFMUROYkkvUTA0Tys3N1pKTE1oTUxNcmpnRUlXYWJtNVJhL3FN?=
 =?utf-8?B?c0RDdVdPcXlpM0FkQmFnd29KZ0JZeWVMSHNnUExMWnhwclVSdjJSaGJYL2Fx?=
 =?utf-8?B?TStnRHNPcHNubjdqT2p4cjY0eHhNYmFpS2FJbEtqWHpVM05JVDQ3dnBDdXdi?=
 =?utf-8?B?QXZSMy9zbnJXYlZ1ejFRZS9WQm1nOVJoQzNXQitIQVAwQkxsYzlMeUhaMjJv?=
 =?utf-8?B?cXQ0ci8wLytGNnovQWo4VWVIUlFXdFZRNE5UUkE4MStpTDcvN082cTFaaXlo?=
 =?utf-8?B?VElZcDhlcmM1RFY4TXYxMlA3WVUrdTNCU1BZM3hIcmMwZlpzT3Jwck1xdlpi?=
 =?utf-8?B?SXNhQWlQSzVvMnNPdXZwSFhxdUlnM2g0dHB2YzVzREdTdDRpcmZyS2xwb0gx?=
 =?utf-8?B?SUkwdUh6cGwweXZnMXIxL1hZTDJmcFN1UHNQS3ZmaUo2dW1PSU9nZHBWRit5?=
 =?utf-8?B?dEh4UG9lcTRHbG5CNXhtZGczZm5heTBBZXVLckFDQWV0OTNZcGhESFBRWHpR?=
 =?utf-8?B?YTBNdWJockdWTDJNRTh2Sk11dEpESy9QQTNGZXhzelpyNzlDOWk3K05PRXRE?=
 =?utf-8?B?dTF3akw1M0pqT0QvSDF6V01QOXQ3c0NhVFh2RGZlWXRkOTFJZEFjV3hrQ2wv?=
 =?utf-8?B?V2ZVTW5odTQ5dlZRdk1GZVlaem52VzdoaEZlRkk3NTdQNWtUQmVKcDl0bG5l?=
 =?utf-8?B?M3FBZ0RmNlJDRkVRUFBWNmJkWk91V1VrZUdnQW9OK05BZzFJTUt2VUhTRlZM?=
 =?utf-8?B?c2c3N2JvVnJYQklISDY4U1Bid3duSUZpbTNSbUx1L0VZdWJYQlBYRFBidGpH?=
 =?utf-8?B?N214VXloRTRzZW8ydnRvcWFyYkN3SjBWM0d3TXJlVDN1OHk3WVMzN2FrMGxl?=
 =?utf-8?B?Qmp1Y29wY1VTeUl3V01pUVdiM1lraHcrekhEUklMNWYyQkJkSTZpd3B1QTdw?=
 =?utf-8?B?a1RmeDJhbUZ1dy9qMTVIT2FWTU4rakxNZ1loTTlQajUzTnM2aWpnV2NxcThm?=
 =?utf-8?B?NnVaMUJFYnBlWDh2eFVqWEVLd1ZOaDh1WFpMTExnblNsVkJIVi9sQStZWDNv?=
 =?utf-8?B?NFFPNWhNU1ZadXZ1aXBwRVQzUVc2YnRxL09SRlp1blYzbk5zTlhSS2NPYlNw?=
 =?utf-8?B?TENsend3VElSMmF4cjM2L25IYUVJS1VjbFZ5QXF5MFlta1JneGI1aXRzMnFB?=
 =?utf-8?B?NzMwanVseWZpbGxWRFp6NjJyVEI4MVU3TlByc2tCMjQvaTN5Z041RmVFbVd0?=
 =?utf-8?B?cUc1ZmM3S0ZmUHlicmpHbTdTMUNtRUo4bFJNd0ZnMVErK1R3K0VVWHNlaDNx?=
 =?utf-8?B?NDBzUi9QL2VVS2I1c1VUa2dyL0lvNzJFalljTmxrMndySWF3Q2FWMmpROEhZ?=
 =?utf-8?Q?ob3NFBOPUn19A8qI=3D?=
X-Exchange-RoutingPolicyChecked: 
	DWSoGDrROsjetVt80F4jidyAmJiB2dVzpmITeT3iSA8u0xQkJzKyDueI01FeIq1crZSEIxVX8EawLEECGXQdbQAcPb7/yjDVJ6kTmoFcyTfxCKp9FivX1o+MuMdnBxaSPADAW1t4iHHTSP8WxAvFCBrdDVWQ8r8nZD7nmo3++mi5whWx0pivhCg4qkPi3cTdUiC5nsKFEj2kBZMWrY1dovjB8Jn4TvE3jBL1cUpADtmMKD/76h+vNUklha6LEoUy79LUsmkF/Y9o8LZD+xsz3CIJiVmfE9rtlKlpzXmwp+HUFFUiCMlf2zhziUc/PF9aW0yrj2PtBFCQdxM+GT2qXw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc6d3de-04d8-4340-4c6b-08ded2878dcc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 07:01:17.9371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHoE4kTR/l0OqDenbF0nA4yiaQlXhcZcFyCc39rV7pXLgPqREa7XIcHi+6K3QVtwDWYAroD/SXW3sv3D6P4QaqDw2PiMJ15CBJ4911RKi4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7640
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA1OSBTYWx0ZWRfX7uh9DhVxjWwD
 a06egOrOuGBOT2RfaqznvUkSkNDilGi+iR5gDEMTcjTax76uO/1/EbWckl6uL1eDcoBixLUo8By
 Z0PBa+EH55S3GbNGxoIw/5R1dnz8X1Q4DHyl5ZSP94uIU3dE0O2I
X-Authority-Analysis: v=2.4 cv=HOvz0Itv c=1 sm=1 tr=0 ts=6a3cd240 cx=c_pps
 a=eQn4vQZDn50HuGbH8T6KOA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8
 a=OqpWfB6_mZ2_LRL5LrgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: MQlspJTLoLkFci4_-9xUSRdzj3dS7Tdw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA1OSBTYWx0ZWRfX3f29EUnnxHRW
 LmaWy/64Hgaa/VTFsG/tBPOSFH7Y55zMat0NLx/j20H2m3B+tTIBeBV/QQvF8qxs0YM/UbTkxLf
 Ny5qkowPY3abVj+IZk3vodLcWAKSyVhTcgNS0EoucZXR0EUbPVDUxM+GlLRA+RPHTGeeJH9FrV+
 BEmP6jgBdlAxXc7K5gsWJNaRSyoX8wumXF50SwaTjC7Ip9kpa07a7E5z5mlMLAycUds6dsF5JCJ
 MTWHdjw1FKYe4hwR2o0H1iF5ndh95WlPSSXQN7iLaUAexBXQFrWPVVBvm/+kSUwR3on4jbmPCvY
 AmkLsKnt+J9fYL/n6HIHKRsRJ3Cb8yNhVTEUyy7PZZgGL7l/L85GJG+GoPYhqTEARnz2OX7kssr
 6bz2piisXHEjdnlb/AEcx/3jsbyzoQVt96eV+nqOiVlAH74/P2zA5f6BfHoJOU44kwVpSDYkBRI
 CeI4wP0bmyFLUMyZx/Q==
X-Proofpoint-ORIG-GUID: KccolDUDE_h4jx4fQD9DN5DOh1-FVPEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250059
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65P5R1vA513575
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 07:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239545


On 24-06-2026 01:11 pm, Paul Barker wrote:
> On Tue, 2026-06-23 at 23:42 -0700, Hemanth Kumar M D via
> lists.openembedded.org wrote:
>> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>>
>> Cargo walks from CWD up to the filesystem root merging every
>> .cargo/config.toml it finds. Any such file above TOPDIR is silently
>> picked up and can override Yocto's linker, registry or compiler
>> settings, leading to build failures.
>>
>> Until cargo provides a proper fix upstream, add a warning so users
>> get a clear diagnostic instead of a build error.
>>
>> Upstream meta-issue: https://github.com/rust-lang/cargo/issues/9769
>>
>> [YOCTO #15637]
>>
>> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>> ---
>>   meta/classes-global/sanity.bbclass | 33 ++++++++++++++++++++++++++++=
++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/=
sanity.bbclass
>> index bdfa7f059d..c67c7b8f03 100644
>> --- a/meta/classes-global/sanity.bbclass
>> +++ b/meta/classes-global/sanity.bbclass
>> @@ -854,6 +854,38 @@ def sanity_check_locale(d):
>>       except locale.Error:
>>           raise_sanity_error("Your system needs to support the en_US.U=
TF-8 locale.", d)
>>  =20
>> +def check_cargo_config(d):
>> +    # Cargo merges .cargo/config.toml from every directory between CW=
D and
>> +    # the filesystem root. Warn for anything found in ancestor direct=
ories
>> +    # above TOPDIR that Cargo would pick up silently.
>> +    import os
>> +
>> +    topdir =3D d.getVar('TOPDIR')

Hi Paul,

Thanks for the review!

please find the v2 -=20
https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_sanity_=
bbclass/119970000=20

> TMPDIR and each package's WORKDIR are under TOPDIR by default, but this
> can be overridden. Perhaps we should be checking ancestors of
> BASE_WORKDIR instead.
Agreed, updated to use BASE_WORKDIR in v2.
>> +    ancestor =3D os.path.dirname(topdir)
>> +    found =3D []
>> +    last_ancestor =3D None
>> +    while True:
>> +        for name in ('config.toml', 'config'):
>> +            cfg =3D os.path.join(ancestor, '.cargo', name)
>> +            if os.path.exists(cfg):
>> +                found.append(cfg)
>> +                last_ancestor =3D ancestor
>> +                break
> This `break` should be dropped so that we tell the user about all
> offending Cargo config files.
Keeping the `break` ,
 =C2=A0 Cargo docs say if both 'config' and 'config.toml'
 =C2=A0 exist in the same directory, only 'config' is read. So only one f=
ile per
 =C2=A0 directory is ever active. I've also fixed the probe order to chec=
k=20
'config'
 =C2=A0 before 'config.toml' to match this.
 =C2=A0 Ref: https://doc.rust-lang.org/cargo/reference/config.html
> The rest of this patch LGTM, thanks!
>
> Best regards,
>
--=20
Regards,
Hemanth Kumar M D


