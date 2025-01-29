Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133C2C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 05:25:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6751.1738128319215328704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 21:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4124a9b9f6=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T4tG2b024891
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 21:25:18 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44enyks8jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 21:25:18 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50T5PIbC003599;
	Tue, 28 Jan 2025 21:25:18 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44enyks8jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 21:25:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dhgc7mO9BNmdKUrxlnOs9dceEKQNc/akKVPmu4tqKpoybB6UyGzDzUtktLvjDtdD9fgTPzH/dHvmLMNd92TNVpbtV0pj2Zzj1LvKBglvqJjXa/Y9Rw1gxM/ZjWnJoAbJxhJKSYPVcL96/aP4SqydNre89fGTnJkHVcuOpPynxaEJXwQgnhTgMZLrggN7rC3hgKQUBlzzBon+YjbhmJ3ewUHICSsQs8U6QU5LqNoUrONbqL0jxD2nai+KOm0XRbWQOxf39gGl2gyltKG5+uQpB/z+L8KX5hU4lAiQoYsQpH1yZemVow+4NVtfd/Am7ggDgaqJGjDQf5/fze2B+P+d4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F81XkoWrr890Y+le2jVgWo2lUEjPnn7BFM/WCkXH6WY=;
 b=Xa0krhmrA6dSzfIeGdwtjRqy0Ng3q5j0JcVnXoxhGruyIrwptnARgl0N3W+iqkTfg9UIqNACq8Mnfkm57637TI92SWecZRX9HPJrhLtofbL95YXt/ghz/zuKFq0qKi1rv1HmiOukN8j/acPHOmbNFuwd/PRD1x2uXr0R8PhE/m9PHSo5AN2DvFxy+A4+0e2Xzins8spzZQ7hp1lqNBlxN6m7yQGSrlcjU3pQUfPW4FsJ9chxo3nN0w1cE8HP3vZtcsQOsYJhxbElhYfWerYH+W1jqteNgsC+fyKOAfN7WL8u8P8IuSu1uP0LD7pFNMktMm/YBuzlPaBTpte0BC47Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by DS7PR11MB6224.namprd11.prod.outlook.com (2603:10b6:8:97::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.17; Wed, 29 Jan 2025 05:25:11 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 05:25:10 +0000
Content-Type: multipart/alternative;
 boundary="------------bLrzrCI4W4ckuEPl6GSapc0h"
Message-ID: <74363653-308f-4465-8bf5-4f8aab01379e@windriver.com>
Date: Wed, 29 Jan 2025 10:55:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: rustdoc reproducibility issue fix
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com,
        naveen.gowda@windriver.com, shivaprasad.moodalappa@windriver.com,
        yash.shinde@windriver.com, deepthi.hemraj@windriver.com,
        harish.sadineni@windriver.com,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20240726133559.1124668-1-sundeep.kokkonda@windriver.com>
 <CANNYZj9V8K5upKxUdA8U4OXsdvt_+TTen=MogiVjJfqkV7jOOw@mail.gmail.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <CANNYZj9V8K5upKxUdA8U4OXsdvt_+TTen=MogiVjJfqkV7jOOw@mail.gmail.com>
X-ClientProxiedBy: BL1PR13CA0072.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::17) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|DS7PR11MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fc94f5d-5c16-46b5-5265-08dd40254cf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y0V5UEhzdDFhaXpWQ3cwWk5yNjNYYi9kb2I1eHRXNzhjUmF2TmxjaFIwMjQ1?=
 =?utf-8?B?RXU3Ky9vVm16MWpUOUE3VVZ4V01sVVRMWVg4ZmpKMlFNTFgyaXpySFdmN2I0?=
 =?utf-8?B?L1Yrck5PRkRFSDNCR0xmZjJXditUL0pYSUtuNjlDQysxWHJlQ0w5ZHpNVmN4?=
 =?utf-8?B?YnMvb3Q4dnEvZ3g5aHVIajFYTmF1VzdORngvcHR4RWpVQjEya29Vcy9MNm0z?=
 =?utf-8?B?cEVVY2N2MytQaVBqQ0E1RWttQ3hDdDNNbk5qdkVsZnA4c0orN01yVTdyYWdQ?=
 =?utf-8?B?QXdXNGs3bVM1dk5SOW1FQ01zTHM4NTcrbTRLWGhOc2tJMjJFRFVWT1JyZlB0?=
 =?utf-8?B?SHIzd1N6ZXkyN1E2UWlmVHQxbERqdTl0d1A2cGhPcFlVWnZBVFQyNEhlUnlv?=
 =?utf-8?B?azlxdHQxckV6b29UZllTMjMveG54aUsxZWhrYmFXbElkeEpJWExVVmxQYklv?=
 =?utf-8?B?S1UxN0NwTyt6cEFrZ0pWWUxwOU9LeU94NWsyM05iMm5qbFVKWElVdWdHL28z?=
 =?utf-8?B?clRMN1oxOGt5ckdVODVjanI3REUwUU1SR1dlVUtUUjR6NEFmOWhZbGhTQUlt?=
 =?utf-8?B?N3VKMEYyWFpxTXV4S2V4dDI2K3VDaWZVNHluNVNyNWVpMm5zS3lYKzZSR1ZU?=
 =?utf-8?B?eW5Jd1RsL3ZjUFRiMEQrZFFybEJqNzBKUzZSK3hta0RacXZVdkVPRVV1eTVq?=
 =?utf-8?B?UGUyYUpZQ2ZGQWxaYXNoZ0syeTN6NURiYTM0UTVOaFJUUS8walFOQ1FlRi9E?=
 =?utf-8?B?dmFVdWtsRzVFTldyZlorTGV6MzgxTlNXaWxjWGIrUjdBNVlxNFhBd3Q3enpX?=
 =?utf-8?B?TEVuUm5iQWwvcHhzUUMxN1JhZUJqcTJFQThIQ0lDZWVWdDRRSDgyVmcxRkJO?=
 =?utf-8?B?SEZWT1lrY2JOQWpyMFFBRTFsaVpWdnh1anZ0anNxTmxveE4vNEF2eFZWckxH?=
 =?utf-8?B?RWtTUEh5RzNuaXorUExqYmxsQUljemJXMC9qa0Fuc2k3ZThCKzlsdDZ6emww?=
 =?utf-8?B?S01iYWgwZk5ObWYxczNlblJJanlvemc3ckt6QjVuZHdFRSszTnBiTjhEV1ps?=
 =?utf-8?B?S1lVRk5USnZTajNZeTNwSy9pdnFjQW0ydGxSY3UxbVc5T1F3U05MS3RXMjlC?=
 =?utf-8?B?VDUyU3lpVkFjSlppU3BmVUNxWThMOG5nRUJrdDFWTW5KRUtpbU5lRXJuTklV?=
 =?utf-8?B?NGJLWlhuTmxwaXNBSUZpS2U5UEtFUjFyemNHOGZaVXlEaHhEaUVYTjYwTmdP?=
 =?utf-8?B?QzVKRTJnbG85ZGtNd2xQZFlhWklKS3ZMYXVHbEUrTExyUlUrZ1hNK05RTHZO?=
 =?utf-8?B?cFJya053M3pGK3Fta0I4b3lYcWg2ZnFWQkFpaEk0MDJKYjhPM0p2eU82VGlY?=
 =?utf-8?B?bkhiZWE3NzRpdFJBNVFlM0k5NnVCVTZUZ2VyMkZIamRQVHQ0R3BPdThDcTNZ?=
 =?utf-8?B?WmhOMlNTUmVwNE1wUzdnbXJrUm0vSTQ5TVhBMFN6NFhlWVJCN2UvUlNzeEt2?=
 =?utf-8?B?eklzZUtTSXJVUXBDT0x0Y09lRklraFRWd3N2b0NLNVo3M25ORG1wZDIyUGFq?=
 =?utf-8?B?RFljNXdEVVIrVlh2VzJya2F3TDBhTzdQdmw0bEN1cG1ib3BTUUZUNTN3bmNn?=
 =?utf-8?B?MEhvVHBPV0ZLSmp0R2swdE80R3FoU3NCd0JzV3lWS0tBaUI1aERCUlRUcU1j?=
 =?utf-8?B?dnMzK3B2aGpsN1UvQXd6dGw5c0ZEVEM4R2dzdWFIVllFVFBDMDBlaDBiTjdj?=
 =?utf-8?B?ODZhNGlwRmpxWEZQUUgyYkd2eXR6cm5mc2ZHTzJYaXR6VWVSUHF5VzQ4Ui9V?=
 =?utf-8?B?ZzdIWW1kam9YSmdlNEx2U1lSRE1Fb2lzdlU1d1VTb2oyWFpVNXJuWUhKdmlh?=
 =?utf-8?B?OXlRL0xlam4weUxnRndPbERCR2ZONzZ3eUVjYU93dk1aYTVuWkpoeDhuZC9D?=
 =?utf-8?Q?xikvAwQQq9Q8TsE62upsYonoE5yDATQp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WngycWV1QVVPbElxUDhvR2xBeTdFeWRTNXVRek9na05vekhWZ1QzVkFrNkpl?=
 =?utf-8?B?bzlTN1YxVjJqa001bHF0cGZ3WlNab2wrQWtCTGRqSFpFMXVMWFFpa1gvYXBk?=
 =?utf-8?B?UXRHd1d4b1dFWm9RaTYrbUVROVlhTTl6bHNXTmh6SWc0S0krWXJQSXJOb0tq?=
 =?utf-8?B?WCtHaWFmdTFVSVhkNXBaUjYyZGNtV09VR3h1V1h0MkNHVVVXYjlYWnlGclN4?=
 =?utf-8?B?U2JGcGtmZHpMTllvRTVVNk1nMnBqZVZkc2NJaFJ0N3NiVzByQVdKaEVTdEox?=
 =?utf-8?B?YlAyNFd6YUNOT3hVZjlHbXhKa3dZTURHVUMzZEo1cWNNR24ycU5NUnI3c05z?=
 =?utf-8?B?UTUxV3RqS1JML2RpYVd3MlBlZEVGUHh1NGxjcGR2dTZmS2FLS29Zb1dTcXFi?=
 =?utf-8?B?elJicmQzc1BrQzYzUnZZTW8raTBQZ05MU0d2clJ1QWRLaVRmWjNzVHlxZDFJ?=
 =?utf-8?B?VEFjMWpVRHJCOGp5STZIUGgzNWZkVXlRK2FJaFg4ZXdWelpPQ0d4bTY4Q3lB?=
 =?utf-8?B?YVZPZEJJaVhkbDdUWngrSTRMNDVMT3ZmdnVJbyttSWNiSE5WcHRuNUxBZU5D?=
 =?utf-8?B?YnpRTklwT3ZySDBUU2pxbU1VcGc2RS9mTXF6a3p5SHBPbFYzRndJckozbHgr?=
 =?utf-8?B?R2pqdGJKbWtRS29USHVyQ2prMVBTUlBYYk1GZE5hK0pGT29HSGk5TkgvWXpF?=
 =?utf-8?B?NG1CaEdmbE9xaWVqUEJGM0MvUXhwUTVrQ3gyM05mMUtzRzFhMUQ1aVRuYzFI?=
 =?utf-8?B?MlpaTTAzc09Pa1RxcjMyczhwMzltM0RjT21xNmMzcU9rVk16Z3BxQkpOQ29s?=
 =?utf-8?B?QWxqNElnaUg2Y3YyVGZvMnk0MFdiZFYvSEVOTzZRWWMzNHZTdnppbU9tQVdW?=
 =?utf-8?B?S096SER0K2RWK21LTVVTT1lCSExCWDd0V0l0VWQya2dHTytmejlRaEJBUEMz?=
 =?utf-8?B?d21LdDlZM1NUSlp1cjlyV2tGR2hBc0FML1V4VUswbE81UEN6R2crVGFyaUg2?=
 =?utf-8?B?ZGtzc1ptUlUzeXpGRVgzejV1SFRqUmxja212NUJFalFsQVRsa2grQUNpVFc3?=
 =?utf-8?B?QXhJb2tXeVNpVXpud1dYUzhxRTJwck1HTzcyMUVoWkFxbFBUQXNKUzVSUkVa?=
 =?utf-8?B?YkFlNEZwM2d0S0FKZThsYXBRdE9oQklOV3UwMVZ5TjZST2thUTRYSHJEVDhq?=
 =?utf-8?B?M2tFdWRDVlIvbkFHSFZEZjhiZFV3c1lVUENmN3lJaENERDR2Rmt1SGVnTkVL?=
 =?utf-8?B?N1hpVEhXQ3hUL2V2eEFBaFh3TnhwRnZhclFaRGh5STh6VUVYcW0yaDhCeHpr?=
 =?utf-8?B?dDBrSkRGa0I4YWhxVWtRT1dPYzAwS3VDTjFlNDY5Zk1vc0ZZbHJZVktjOE5p?=
 =?utf-8?B?cURyaHBYWGFIVHp6a2Vqby9naVhSY3duMGFqNERkQ0hSNkNkTFUrbVV0elFj?=
 =?utf-8?B?TkNkQ3ZYanVuUmloODF6aVNISmRNV29YSVNoNkNLZjFhSFJpTTlzdDBUQkpm?=
 =?utf-8?B?ZkVaS09mU203elVUQklmWWk4Sm5nNHA1OWFSaGRXbTkrdEVmUU0zckdjOE51?=
 =?utf-8?B?OG5MdEtLSUFFQW5oQ2wyTWdxekJiQkVaZEtYayt2aXdBSXU4WWdNUkp3ZGs4?=
 =?utf-8?B?NGFETElQZUlPMElZM0VtdEg3OG5oZGNjUVhndGorZjhQNGhTZjQxQjc1Szlo?=
 =?utf-8?B?WnNKLzNiYkpJMjJNK1lnTHFaUU1Dd1Jxb0wxNGFzeWViL1dWZFl2UVV1VFlk?=
 =?utf-8?B?MnFtUm1zUW9EZHBzbXJWdUtibVpSWjFyZkpuK2JkclVTdkozcUJUcGFtbW1u?=
 =?utf-8?B?MmN0VFpzamlLSTlDVU5TKy9RVEZ1QjhNc0R3T2ptV2xHQytySXlORUQ3OFFz?=
 =?utf-8?B?ZkVycVdibmxRL0dPWUJwRnp1V2dlMTU5VTVwbWJZMGc1SXd6Yy9aSGNWcG51?=
 =?utf-8?B?ejFNUGRaY3AzZ0VVQldNdC9BMks0d1R2UWFJb1dZc1F5Q1NDZW52cWJjUHFD?=
 =?utf-8?B?eHNmenoyNlRPQlc3SjE2UlQ0RGd3QkMrYy9jdElVOEZFeUY1SGdDaWxHOTJR?=
 =?utf-8?B?SGpiVDBJbFlPQmRMRURVLzhFbW94ektiS3F2SkxXK0hocVJndFVHMmNYVGpj?=
 =?utf-8?B?cVZ0cG9FVnV1SkZJalFTa0QrYk9Na1JGbXNHWE9TV1hUMk02ZGpGa2JYdlZY?=
 =?utf-8?Q?Q3wunr6GSAq6tqvQlO7rsTk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc94f5d-5c16-46b5-5265-08dd40254cf4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 05:25:10.7597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4i1nJ3EBieiL22XtZHbm7B0KHI8Ljyk0ldaINmQsLrBKN+3nRyDtRypUZrGl+p0a4SVGUFWRTCGDUwNygFcOrSJLpAFbCSP58MKLwrThwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6224
X-Authority-Analysis: v=2.4 cv=Wv/RMcfv c=1 sm=1 tr=0 ts=6799bbbe cx=c_pps a=tyvwN2z/Y66O58r8mq/nTQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=y1KZ6rlw1Z5jwtgAHq0A:9 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=PhScTEdQpWmkuRQB:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: KK5xT8BygduRq_hlOTzEXZJO8cjVdhVl
X-Proofpoint-ORIG-GUID: 0JQ9AO7-3iJB80XoIhGxsHna2S3Wob0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011 phishscore=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501290043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 05:25:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210343

--------------bLrzrCI4W4ckuEPl6GSapc0h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 28-Jan-25 17:22, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 26 Jul 2024 at 15:36, Sundeep KOKKONDA via
> lists.openembedded.org
> <sundeep.kokkonda=windriver.com@lists.openembedded.org> wrote:
>> +rust: rustdoc reproducibility issue fix
>> +
>> +rust: rustdoc reproducibility issue fix
>> +
>> +The 'codegen-units' option split the crate into multiple compilation units for parallel compilation. Currently, this split is causing the rustdoc to generate differnt binary between the builds.
>> +To fix this the codegen-units & the lto options are disabled.
> I just ran some benchmarks to see how much disabling parallel
> codegen-units affects build times (the parallelism is only at the
> crate level after this change), and unfortunately the increase has
> been significant.
>
> As of current master, rust 1.81.0:
>
> rust-native 527 seconds -> 853 seconds
> rust 1123 seconds -> 1688 seconds
>
> I presume the codegen-units parallel issue can be fixed properly by
> adding a sort somewhere for determinism, but finding that spot is
> probably very challenging. We do need to get to it though.
>
> Can you please point to the request/effort to set up reproducibility
> tests upstream?

Sure Alex, I will look into it the ways to optimize it. As I remember, 
when the 'codegen-units' count is increased it is causing /rustdoc 
/binaries are not reproducible.

I've to re-test it with some higher values of 'codegen-units' on latest 
rust sources. I'll test that.

Thanks,

Sundeep K.

>
> Alex
--------------bLrzrCI4W4ckuEPl6GSapc0h
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 28-Jan-25 17:22, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj9V8K5upKxUdA8U4OXsdvt_+TTen=MogiVjJfqkV7jOOw@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Fri, 26 Jul 2024 at 15:36, Sundeep KOKKONDA via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:sundeep.kokkonda=windriver.com@lists.openembedded.org">&lt;sundeep.kokkonda=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+rust: rustdoc reproducibility issue fix
+
+rust: rustdoc reproducibility issue fix
+
+The 'codegen-units' option split the crate into multiple compilation units for parallel compilation. Currently, this split is causing the rustdoc to generate differnt binary between the builds.
+To fix this the codegen-units &amp; the lto options are disabled.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I just ran some benchmarks to see how much disabling parallel
codegen-units affects build times (the parallelism is only at the
crate level after this change), and unfortunately the increase has
been significant.

As of current master, rust 1.81.0:

rust-native 527 seconds -&gt; 853 seconds
rust 1123 seconds -&gt; 1688 seconds

I presume the codegen-units parallel issue can be fixed properly by
adding a sort somewhere for determinism, but finding that spot is
probably very challenging. We do need to get to it though.

Can you please point to the request/effort to set up reproducibility
tests upstream?</pre>
    </blockquote>
    <p>Sure Alex, I will look into it the ways to optimize it. As I
      remember, when the <span style="white-space: pre-wrap">'codegen-units' count is increased it is causing <i>rustdoc </i>binaries are not reproducible.</span></p>
    <p><span style="white-space: pre-wrap">I've to re-test it with some higher values of 'codegen-units' on latest rust sources. I'll test that.</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Thanks,</span></p>
    <p><span style="white-space: pre-wrap">Sundeep K.
</span></p>
    <blockquote type="cite" cite="mid:CANNYZj9V8K5upKxUdA8U4OXsdvt_+TTen=MogiVjJfqkV7jOOw@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">

Alex
</pre>
    </blockquote>
  </body>
</html>

--------------bLrzrCI4W4ckuEPl6GSapc0h--

