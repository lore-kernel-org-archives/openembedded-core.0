Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5320AD46C16
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 00:26:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4525.1769646406768155164
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 16:26:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UNjpq2GX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=64891ae679=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SB4Px43435633
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 16:26:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=n608OM5jGXmy2XLXNVzQ51
	0vHanLJ35FpPUiS6l3gXY=; b=UNjpq2GXsjmuIOI9ulxWCbySHl1Pl4cgWwGlYG
	09XW3klyEsGYaX8MqasOau23wfYGaKMhXe8+Ie7Sm5MCOfFbVz1NB3YGADgyNjeS
	eZW6cgZ/wOxVE7FFSHmVNVyySEXnc0mrFDi32pj6bK25yTgLwmmpuE6nBjIQEkLZ
	ps+HAy17OyaXtVXDl9qqYnlFbwlLbpkldC9+JHYig1THCRT7XNFHwx2ZYYwumtgm
	4bv4NRNyR+shv4a3tyLNWUCia0Nz+I9T4lFMYb0WrW/1IlKQ+Mi4AOPSws0vDgmr
	X2ZvPCo62xkwKzcBiQqukrol9Z6cd/ZnWgaMKQM8mBj+pwMQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010032.outbound.protection.outlook.com [52.101.193.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvt85drjy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Jan 2026 16:26:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxKhKc9eh33kyv50NDvFztf1vnRxmgTdcHxKFfUsYB2csRrBRTph1h6K+bhB1G9Gfxo1u7azIvN9pQRijqm9QK9uJVQBGTmkm8x1ScMbe7R2E8CTNgdaTgaO+vqbd1gNFHI4jBqVxIQxJ3m6D+cqCTGGqVXoesLk6Zv9ly150xbTd06WPHFx1/LPfDfJ1k/belDBzS4+hk6xqDFAZpKW8uiTQkP4Ci56JUYzno6xmAcUrmKM50eHdrDOb6fSAWX/phGuoxrwToYjfT4Kmv4K8ZjzHvTewKti2hsA6XhKL467/uFA4y2257z0qxJ2Y8gSN9RFwGUgcXJzDqqGJXtofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n608OM5jGXmy2XLXNVzQ510vHanLJ35FpPUiS6l3gXY=;
 b=JcHknGmEltTO3xk7IdJDlSZfHTBjY/3YM+xbt8EYsUGMc25Hk/Z7YVa4Fj2oSF9U5z18B6U3VWS7bBEebNC9d1/5lLfzKfhkWa5lJXOLFWra+G+72H1IzhIYVnhe/WLw7zsQ8Jm6JnyI+s3JAlUMQorGMcYZlp9puPRTJzqjeCpvX8vMU1VO/M8nYSzReWMu8EzpbHsLM10Yp5JKBVo4IroYsxVrHMN9nSQF1AzXaZkV+dqtjdCaqwnzjHayxQvptV5oyZzd3x3Z+q3IRof0sXGFO/FZz+bzjXGot19qSvvTM8up7o4q43j4zG65weAZNnwIb5gkMVMT0C0nKHwkjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DM4PR11MB6503.namprd11.prod.outlook.com (2603:10b6:8:8c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Thu, 29 Jan 2026 00:26:43 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 00:26:43 +0000
Content-Type: multipart/alternative;
 boundary="------------JAef3Iu9SbZJz8mtw9gnMBHW"
Message-ID: <5f426a3e-4220-4274-b38b-e2bae5188cee@windriver.com>
Date: Wed, 28 Jan 2026 19:26:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v1] libconfig: add ptest support
To: pratik.farkase@est.tech, openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
References: <20260128140635.43214-1-pratik.farkase@est.tech>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260128140635.43214-1-pratik.farkase@est.tech>
X-ClientProxiedBy: BYAPR01CA0064.prod.exchangelabs.com (2603:10b6:a03:94::41)
 To CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DM4PR11MB6503:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e94b19-ad0e-40a0-cce5-08de5ecd13c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|7053199007|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MDZhQkNrV2RveVR2Y3VEd3pZa1hkRHV3emVPM2NtRi83ckNrOXNrTW9XZmFR?=
 =?utf-8?B?OHUwUkxyU2tsN0sxenBQMURIR0dVakFqeWQvU3gwa2RRTjVqT2hZZk1UQjlQ?=
 =?utf-8?B?VDVXOWNsUVdRNlAyTlhTMFZCN3d5QWRsNy9SNmt3eHM3SkQ0empkdVY1VmxM?=
 =?utf-8?B?SVVtVGQ1TkdOMUlkdnY2SXY4emZvajk4Vm8rVzhOYWNuZzFCQlp5RWs2SW5u?=
 =?utf-8?B?ZHYxQTVqQmNtSUh2c0hMbnRHUG1kcG43RGNBV2N4VTFaazZsWHR0WW9uNUNl?=
 =?utf-8?B?YisvZkdkL1ZDRSt6MHJKQUd3RTRIVHVNaldTYVROY1F0RmUrZlVFU1dxdG1o?=
 =?utf-8?B?eVA0bzE5UGIrRnRBMkhKT3VGTWliKzVQZlVkbVdLZ3FrTi91TWFNOG9xWlEy?=
 =?utf-8?B?SWFyL0E3dXBqb05XeGVVVDhsenZXdmZHMlptczFsUmg1cnNSbXhwcjRRbCs0?=
 =?utf-8?B?MlI0K2dUSCtSVjI3N0owd01pOG1oaDZoelJUT1J1S2Q5Ym9UcVU5UU5OQks0?=
 =?utf-8?B?MGxQU0xudXpKeExXRnVPTFJkbmtQMkd1UkJDREJXcXBabnFwRmZIR0lSaVdS?=
 =?utf-8?B?M3cyemNDYkhra2w2K2lReGwzelJveWZYOFNUOEg2T29RMktwRURsZlI5MXli?=
 =?utf-8?B?Z1hUeGMwYVkrakZSWXpvSk9CNUhtRTZwRUJRc1p3bWtadHVvSmhEblRyUzRp?=
 =?utf-8?B?NUd3MHBiZjZUY3k3RkNkdllxOCtjYm9RekFRWUt4R0plaXVHbXZaL1RaVFBJ?=
 =?utf-8?B?QnZmU2VJQmVualMybXZsM0daUDJ1dkhDYk1STSsvdnV3a0NCMU1USnNaK1pi?=
 =?utf-8?B?TE0rS3pxTUZSTm0zeXJOZ3pLTFJCcnBnQlErTHV6N1BacE1GTVR1NVFXa3VN?=
 =?utf-8?B?bCt5S0F1QzJSRE9saDVUb0pkOGY5VE82eXJWNEhhd2xiZ1FyNWdPWlNzRzVu?=
 =?utf-8?B?NHpTbU5LcDQ0NXlBcXUvMUhpd0owd21aNFlNNU16NHdaRkNNQ0w3dFViNFZX?=
 =?utf-8?B?U2hKZWZUNHR2WCtiSU1zalk2NmlTZjQ3MlZvQnBWeHdyNGY0NGVRVGc0NGlU?=
 =?utf-8?B?WkJod1hDOEd5KzYweHp1YldMeS82MjVkdURqRC9RRUs3ZWh5MlJMaVFzMHdm?=
 =?utf-8?B?ZDd1bG9pajZsWEIvOHRNbXdRSG9nUHBWU3dDd1J2d3pELzVCZ0V1Zm1xZUxI?=
 =?utf-8?B?QTJsMEtNU0RLVGc3ajhYMndqc3ZYVXBqaE0xQzB6bFhqc3VBZjNpKzhyYkR5?=
 =?utf-8?B?dXB5K2Y0RjVldXB4bTV1bnNkY3BNSUF1dWlHMUNMRzJNMEdHNkxLU1VJNzJm?=
 =?utf-8?B?T2RpOTRzUmE2NlNlZGNFcGx5THhFVHNEa1V0a01SU21FME82aE8yNEVxZUcr?=
 =?utf-8?B?ZFdhbGd3Uml6dzFpWEdKNll5U2JMT0pUaXRpczlnb0F2aXdPMFV3eHhKeXUx?=
 =?utf-8?B?R3FHKytEYkQ1eCthendpZEtDUVN4cElCS0s0aDB3OW4zbzNYUE82cHZjSXh5?=
 =?utf-8?B?Z2JuUXFKc2lwUFdPZzlUdVZBNUdsVnZBelRpbUhoVURySGlmbjZ3djYrYVg2?=
 =?utf-8?B?OE0rQ3oxb0xDU2ZxQ09nclEvZGMyalVhODNNZENsREh2dTllT0J3bEJDSU91?=
 =?utf-8?B?cFZPTFUxZzM5TGpxeks3MUw3K3d1UEhKd2JrUzlvNUNCeCs4SnRBUmtxV1Y3?=
 =?utf-8?B?MHp4eFEyWm9DSzUrVzhhWFkraWtyZzN4TzVxVHVhYzhzQUduQXJsQVhXRzRy?=
 =?utf-8?B?Skh1RGNBd2hneHNES0VXWU9jMUdqdUNpMTdDZnFYVVVrMCtyN0tlMHd0dTRu?=
 =?utf-8?B?b3hJNERyaWtaRUpKcmZKOWF0M0xoWmxoN1RDWE5kMENVUjNoWjZFbndHTjRS?=
 =?utf-8?B?cWdpSkRmQTdjbzFqaEpEeEdHU0p3Y3ZEaXBVbVBmYVB1bXBLelI0T1poY2Zj?=
 =?utf-8?B?OFZlYjFneUQ3VGFtbW9Va0xTTnErNzFwL0pwdWxqdHpZQ29vc0Y2ckVrenBS?=
 =?utf-8?B?SnUrMEpEUHB1ZUlZdGNTVTJ2eEVZZGtvblZHOUY5UDlXUFduWE9uQ1BPVTZS?=
 =?utf-8?Q?79Mo+5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(7053199007)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NlVzdlJFMkpSUnFKRUloMFNPd0Q5cEtFWWJWV1h6N3k2T0NwYTFEdDJPTjZo?=
 =?utf-8?B?Nm42L2N1RVhEWlRzTmMxdVBJZ09tNFllQitwb3FMRGwwSHdoanM2UVJwWlBN?=
 =?utf-8?B?dDdoWXZjaWV2a2hLTTA1WVN1Wjd4cVBkK29LNGxMMFRzSTc0Vk1McFhQM3hT?=
 =?utf-8?B?QWxwUDc1QWNJWGVyZFMxY3I2WnV0bUJqL2dVUDJma0lja1A4TGJmd2x2OGpU?=
 =?utf-8?B?Q2lUNHI0NTdpVUpha0xPTkJBbWVOcTFQSEZjRTZLUDI2c1krVDFibDlxdzEr?=
 =?utf-8?B?bTdPQm9tWXNwWFFVQkVyQlFiWVdSRzMrNnVqWUJWZWRqUklTNGZkT0pvUFBC?=
 =?utf-8?B?MXpLZmJidDg1RUNMclZNdVJBUllkUVFvY0ZkTUZ3TTE2ODUzbTAyZEFYc3hD?=
 =?utf-8?B?bzhKMm5NY3kzbHFjTDFXT0ZOazVJSm5LeWFXZi9BNG5RQkZxNmJuVVJseGZn?=
 =?utf-8?B?UEduVDF0NUsrV1k1aVRsc3AyaksvekFEUlpPVzAxalRVdlJ4RzRUVE83WE4w?=
 =?utf-8?B?ZVlRb0FWM1YyTWZZYWhDTEtuUVFlbkRqU2hreWlxZUJ2dDRWbkNlNEVqb1M1?=
 =?utf-8?B?cW5uc2xzN1FVNDdLV2FaUWY1eVQ2ZkhteCtyL3JuWUdsTzl5eC82bXozUUov?=
 =?utf-8?B?WnFoVWx2bHl2cW1EVkZtSVN5MXd1Qy9BSW9NNWFKazJ4cXdJc09MeUZMb3NI?=
 =?utf-8?B?TS9iWXFlaDJvdzhKMGtJam9uenVrQ2orL2g0Tlo5Q0R5K2FzVFJvSG9BWjVs?=
 =?utf-8?B?UStKYWpwOVIxYVFEV1l1Myt6ZElIS1E0SjhPSzRZeS9JaEFYL043anAwa0pz?=
 =?utf-8?B?dDJqNUErU0dhL0VlMC81TnlqRUdzZnNPbFRhTm1VN0ErdFJrNWNxTDlwUXFG?=
 =?utf-8?B?T1p2cEF1ZHk3MUdORUswMEk2Zmk1Z21qOFRFWG5CTVNTUG80bnNFMzlpRDBJ?=
 =?utf-8?B?amM5RFlNV3IySyt5NkhvLzRickFxcUVRUkpUSEVCYzh2M0hVelYxdTRRbndp?=
 =?utf-8?B?aVlxc0RmeGU1UVdOVmhyZ01UM2UvTWFxRmVHdzBMZncyMnBiRUxrdzI2OWhQ?=
 =?utf-8?B?Vk1IQytZSlkyTnZyN1ovb3NvZndiUUdHbE4vS3BWdHBlWjh5YUUzRGd6Q1Na?=
 =?utf-8?B?UDZYSjFvUE03NmcwSyt6ckU2SFZzdVJBeHhabmIwOTM0UWhVT0lEaUNySVg2?=
 =?utf-8?B?QStYOXpwR2trMk40eG5DOW1lTWpLV0V2UTFJZVhJUzhSbjVRNW9ySDdNdVlY?=
 =?utf-8?B?RnBobllzV01ZQ1hYVGNEVUJFTFJnMHpEOG0rL0p4bnJHQ0s4LzArNlpMUzdE?=
 =?utf-8?B?aitaOVRVY1VyWHdNOUV4a3JlY1BYcmZjc3VadEN4dTNjYnQ0ZXdMWU1mRWI4?=
 =?utf-8?B?eVd6REFkR2EwY09ZRlgwMkpOSytRdVFiYkRpNjlIbjRlU3hFNXNDL29HS0hY?=
 =?utf-8?B?UitEM3BkY2VzY3Zlb2tsd1FRVFY1V1g2dlFHR2oweVRrUTdUWmtmbjRmNytU?=
 =?utf-8?B?aFZzRm9POWhMWDFiY0NpU1VBRlJuc0I1WXErV0U3R1NUUXFwdTErY1NtRFpW?=
 =?utf-8?B?b0I4b3FoSUpkdHdjNThzQy83UEEzQzllOVAydHBXZDRkSjJaRlBVQ2s3cFBT?=
 =?utf-8?B?c2N5SlZMSUhPakpLRUEvU3VMTlRIbVE3NTcyVERGMW0vNjkzNnFkTHAvVWdF?=
 =?utf-8?B?dC8wTVdLYm1MRWM4STIyU08rdHdYWGVGWjVUNE5TODRib2JBZi9BSjVBSWo2?=
 =?utf-8?B?UmJVU2tpRUJBVTFmOVNjUlNhT3phSlEyRkYxb0JPOHlKL0hGOTZJQ1dtMzY4?=
 =?utf-8?B?aldsRU1jOWZlSG45SmJIcm5kZzR4VXRKbVdhOTJsUVV4OU52M2lQZXM0Q3B1?=
 =?utf-8?B?MTVURXlYYjRSRlBRWlNTanMyTWZQYkplU3VSY2dUUzZaa3E4eWgvODZUZWdQ?=
 =?utf-8?B?cjdYOFVFZlNTR2xwNmhpNGhTOGxWTFJQaDNXcGVoMUgxN0Z2dnR5dDZlbXk4?=
 =?utf-8?B?NlhBYjNzeDlpYjk0OHlGc3VlZlBrNnBBSklFWDY2YWJpc2xNcG1ZU2xzckVl?=
 =?utf-8?B?SnNidjE2NlZjeEsyNGNGVm9aNUtIdUxsQlcrai9wWldZckZxMFoyQTNUc3ds?=
 =?utf-8?B?RlhJS00wbHUyMFFOcWVkQUNMQ25MeitNRytJbms3cE1CU0RBVnZiM3BlcnRk?=
 =?utf-8?B?STJhZk1TZnd6Qk9laGY2V0Exbk9jUEorU291aXdpNmNpcy9PUzBRT0RzVXlI?=
 =?utf-8?B?OTdLelRsVFlZT0Fwc211azd0R0JzZGROU1Jpc0FTb1Q2allJeEg3TU9SZFpa?=
 =?utf-8?B?QllzUWV5S2VlUXFiMGRLOEpZTDdmTGxxaC83TkZHNi9EVTQrcndZUjdJYUk3?=
 =?utf-8?Q?Mw6XFn3NJTx/l1BM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e94b19-ad0e-40a0-cce5-08de5ecd13c9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 00:26:42.9435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHRAq4UaokYPbAlLtPFwzt/z4g71PcBDqi90oWnHS/JcM+PPexO+0UW1ETRlawWOgm9q8xjyt5b0T6w9fo8mz92QzxILQ1y/MTRLr2qKCY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6503
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAwMSBTYWx0ZWRfX1sMxCuCs0r4W
 RnNPhruzwhErvV1zg5B7RqXy8fpKW+zAh0xjr0tLT2jAvVTxPXRM0Fp3uJbb7kWAtFHZV3f++eI
 m7dujLpaUrwhPZh7GOqqIHynvQ2phfh8znGOT8AHcXmzqibP6R3Z03uecGKM8wgFq4JaAE4+i8i
 3yqIO1k22rzpoa/i755QdJIpC1kywAA5NN/BkUGvdel/jJLLrhYR2ltxcPcpPewEDVslhlQKU67
 9rA8HNwjrHwQP+tLVTAJlAgL5fBhi6ekLaAFZBDXidRCmV1Yp83ebcmhTMFypXeqnjUuTD/72ki
 d0HaQQoB4CC/qg2QdePf8H1jAbSOFyzmOj7E1PF7qETtre0YGe929ZeS0YyLVcakgX1JMYz5J79
 7/SvR3NjGaz9I8CCOuKSTBqW7lA2+1IeITXRAys8cjPVGi28nxRE5ssu4XxJghgj6Rb4oafBLv0
 jw74rma7sZRxiU2seOg==
X-Proofpoint-GUID: LDqBPUuXFC9bIv8BtfoFLZ8XUiymyp_2
X-Authority-Analysis: v=2.4 cv=M6lA6iws c=1 sm=1 tr=0 ts=697aa946 cx=c_pps
 a=eJMC1fB0Wmzbl6MXJ2sZyA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=ozPUOsCc-64JgSptfX4A:9
 a=QEXdDO2ut3YA:10 a=0MH6S1u3OS19dlpsmasA:9 a=qg5tjGnNrBhjWbTa:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Nt_2ernZSm9Nvc53UfmnnxNdwjP9g8Rc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290001
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 00:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230109

--------------JAef3Iu9SbZJz8mtw9gnMBHW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pratik,

On 2026-01-28 9:06 a.m., Pratik Farkase via lists.openembedded.org wrote:
> Add ptest support to enable automated testing of libconfig
> using ptest-runner.
Nice, thanks.
>
> The implementation uses libtool --mode=install to properly
> install test binaries, avoiding issues with libtool wrapper
> scripts. Tests are built via 'make check TESTS=' to compile
> without running during the build phase.
>
> The test suite includes 16 tests covering parsing, formatting,
> binary/hex values, escaped strings, and various edge cases.
> All tests pass successfully on qemux86-64 :
> START: ptest-runner
> BEGIN: /usr/lib/libconfig/ptest
> [TEST] ParsingAndFormatting
> parsing testdata/input_0.cfg
> parsing testdata/input_1.cfg
> parsing testdata/input_2.cfg
> parsing testdata/input_3.cfg
> parsing testdata/input_4.cfg
> parsing testdata/input_5.cfg
> parsing testdata/input_6.cfg
> parsing testdata/input_7.cfg
> [ OK ] ParsingAndFormatting
>
> [TEST] ParseInvalidFiles
> [ OK ] ParseInvalidFiles
>
> [TEST] ParseInvalidStrings
> [ OK ] ParseInvalidStrings
>
> [TEST] BigInt1
> [ OK ] BigInt1
>
> [TEST] BigInt2
> [ OK ] BigInt2
>
> [TEST] BigInt3
> [ OK ] BigInt3
>
> [TEST] BigInt4
> [ OK ] BigInt4
>
> [TEST] BigInt5
> [ OK ] BigInt5
>
> [TEST] BigInt6
> [ OK ] BigInt6
>
> [TEST] BigInt7
> [ OK ] BigInt7
>
> [TEST] RemoveSetting
> [ OK ] RemoveSetting
>
> [TEST] EscapedStrings
> [ OK ] EscapedStrings
>
> [TEST] OverrideSetting
> [ OK ] OverrideSetting
>
> [TEST] SettingLookups
> [ OK ] SettingLookups
>
> [TEST] ReadStream
> [ OK ] ReadStream
>
> [TEST] BinaryAndHex
> some auto big hex: 4294967296
> some auto big bin: 8589934591
> negativehex: -1430532899
> [ OK ] BinaryAndHex
>
> 16 tests; 16 passed, 0 failed
> PASS: libconfig_tests
> DURATION: 0
> END: /usr/lib/libconfig/ptest
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Change-Id: Ibd69ccd63ce0168571d46a199c08be59ea748d69
> Signed-off-by: Pratik Farkase<pratik.farkase@est.tech>
> ---
>   .../distro/include/ptest-packagelists.inc     |  1 +
>   .../libconfig/libconfig/run-ptest             | 16 ++++++++++++++
>   .../libconfig/libconfig_1.8.2.bb              | 21 ++++++++++++++++++-
>   3 files changed, 37 insertions(+), 1 deletion(-)
>   create mode 100755 meta/recipes-extended/libconfig/libconfig/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 739995bcfe..7c5810f252 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -29,6 +29,7 @@ PTESTS_FAST = "\
>       json-c \
>       json-glib \
>       libcheck \
> +    libconfig \
>       libconvert-asn1-perl \
>       libexif \
>       libgpg-error\
> diff --git a/meta/recipes-extended/libconfig/libconfig/run-ptest b/meta/recipes-extended/libconfig/libconfig/run-ptest
> new file mode 100755
> index 0000000000..d81fcf4def
> --- /dev/null
> +++ b/meta/recipes-extended/libconfig/libconfig/run-ptest
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +
> +cd tests
> +
> +for t in libconfig_tests; do
> +    if [ -x ./$t ]; then
> +        ./$t
> +        if [ $? -eq 0 ]; then
> +            echo "PASS: $t"
> +        else
> +            echo "FAIL: $t"
> +        fi
> +    else
> +        echo "SKIP: $t"
> +    fi
> +done
> diff --git a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb b/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
> index 6e08a7b04b..9ae0ce2e6e 100644
> --- a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
> +++ b/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM ="file://COPYING.LIB;md5=17c8e32f0f72580cc2906b409d46b5ac"
>   
>   SRC_URI = " \
>       git://github.com/hyperrealm/libconfig.git;protocol=https;branch=master;tag=v${PV} \
> +file://run-ptest \
>   "
>   SRCREV = "a42cb47c1526a4f2ed025fcbb2289863375bc898"
>   
> @@ -17,7 +18,7 @@ DEPENDS += "bison-native flex-native"
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
>   
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig ptest
>   
>   PACKAGE_BEFORE_PN = "${PN}++"
>   FILES:${PN}++ = "${libdir}/${BPN}++*${SOLIBS}" @@ -27,3 +28,21 @@ do_compile:prepend() { rm -f 
> ${S}/lib/grammar.[ch] rm -f ${S}/lib/scanner.[ch] } + 
> +do_compile_ptest() { + oe_runmake -C tests check TESTS= +} + 
> +do_install_ptest() { + install -d ${D}${PTEST_PATH}/tests + + if [ -f 
> ${B}/tests/libconfig_tests ]; then + libtool --mode=install install -m 
> 0755 ${B}/tests/libconfig_tests 
> ${D}${PTEST_PATH}/tests/libconfig_tests + fi + + if [ -d 
> ${S}/tests/testdata ]; then + cp -r ${S}/tests/testdata 
> ${D}${PTEST_PATH}/tests/ + fi +} + +RDEPENDS:${PN}-ptest += "bash"
Why do you need bash rather than any posix shell?
We run the ptests in a minimal environment so if busybox shell works, 
please drop this.

If not, please either remove the bash dependency or explain it in the 
commit log.

Thanks,

../Randy


>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230097):https://lists.openembedded.org/g/openembedded-core/message/230097
> Mute This Topic:https://lists.openembedded.org/mt/117507676/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------JAef3Iu9SbZJz8mtw9gnMBHW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Pratik,<br>
      <br>
      On 2026-01-28 9:06 a.m., Pratik Farkase via lists.openembedded.org
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260128140635.43214-1-pratik.farkase@est.tech">
      <pre wrap="" class="moz-quote-pre">Add ptest support to enable automated testing of libconfig
using ptest-runner.</pre>
    </blockquote>
    Nice, thanks.<br>
    <blockquote type="cite" cite="mid:20260128140635.43214-1-pratik.farkase@est.tech">
      <pre wrap="" class="moz-quote-pre">

The implementation uses libtool --mode=install to properly
install test binaries, avoiding issues with libtool wrapper
scripts. Tests are built via 'make check TESTS=' to compile
without running during the build phase.

The test suite includes 16 tests covering parsing, formatting,
binary/hex values, escaped strings, and various edge cases.
All tests pass successfully on qemux86-64 :
START: ptest-runner
BEGIN: /usr/lib/libconfig/ptest
[TEST] ParsingAndFormatting
parsing testdata/input_0.cfg
parsing testdata/input_1.cfg
parsing testdata/input_2.cfg
parsing testdata/input_3.cfg
parsing testdata/input_4.cfg
parsing testdata/input_5.cfg
parsing testdata/input_6.cfg
parsing testdata/input_7.cfg
[ OK ] ParsingAndFormatting

[TEST] ParseInvalidFiles
[ OK ] ParseInvalidFiles

[TEST] ParseInvalidStrings
[ OK ] ParseInvalidStrings

[TEST] BigInt1
[ OK ] BigInt1

[TEST] BigInt2
[ OK ] BigInt2

[TEST] BigInt3
[ OK ] BigInt3

[TEST] BigInt4
[ OK ] BigInt4

[TEST] BigInt5
[ OK ] BigInt5

[TEST] BigInt6
[ OK ] BigInt6

[TEST] BigInt7
[ OK ] BigInt7

[TEST] RemoveSetting
[ OK ] RemoveSetting

[TEST] EscapedStrings
[ OK ] EscapedStrings

[TEST] OverrideSetting
[ OK ] OverrideSetting

[TEST] SettingLookups
[ OK ] SettingLookups

[TEST] ReadStream
[ OK ] ReadStream

[TEST] BinaryAndHex
some auto big hex: 4294967296
some auto big bin: 8589934591
negativehex: -1430532899
[ OK ] BinaryAndHex

16 tests; 16 passed, 0 failed
PASS: libconfig_tests
DURATION: 0
END: /usr/lib/libconfig/ptest
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Change-Id: Ibd69ccd63ce0168571d46a199c08be59ea748d69
Signed-off-by: Pratik Farkase <a class="moz-txt-link-rfc2396E" href="mailto:pratik.farkase@est.tech">&lt;pratik.farkase@est.tech&gt;</a>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libconfig/libconfig/run-ptest             | 16 ++++++++++++++
 .../libconfig/libconfig_1.8.2.bb              | 21 ++++++++++++++++++-
 3 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-extended/libconfig/libconfig/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 739995bcfe..7c5810f252 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -29,6 +29,7 @@ PTESTS_FAST = &quot;\
     json-c \
     json-glib \
     libcheck \
+    libconfig \
     libconvert-asn1-perl \
     libexif \
     libgpg-error\
diff --git a/meta/recipes-extended/libconfig/libconfig/run-ptest b/meta/recipes-extended/libconfig/libconfig/run-ptest
new file mode 100755
index 0000000000..d81fcf4def
--- /dev/null
+++ b/meta/recipes-extended/libconfig/libconfig/run-ptest
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+cd tests
+
+for t in libconfig_tests; do
+    if [ -x ./$t ]; then
+        ./$t
+        if [ $? -eq 0 ]; then
+            echo &quot;PASS: $t&quot;
+        else
+            echo &quot;FAIL: $t&quot;
+        fi
+    else
+        echo &quot;SKIP: $t&quot;
+    fi
+done
diff --git a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb b/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
index 6e08a7b04b..9ae0ce2e6e 100644
--- a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
+++ b/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING.LIB;md5=17c8e32f0f72580cc2906b409d46b5ac">&quot;file://COPYING.LIB;md5=17c8e32f0f72580cc2906b409d46b5ac&quot;</a>
 
 SRC_URI = &quot; \
     git://github.com/hyperrealm/libconfig.git;protocol=https;branch=master;tag=v${PV} \
+    <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
 &quot;
 SRCREV = &quot;a42cb47c1526a4f2ed025fcbb2289863375bc898&quot;
 
@@ -17,7 +18,7 @@ DEPENDS += &quot;bison-native flex-native&quot;
 
 UPSTREAM_CHECK_GITTAGREGEX = &quot;^v(?P&lt;pver&gt;\d+(\.\d+)+)$&quot;
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
 PACKAGE_BEFORE_PN = &quot;${PN}++&quot;
 FILES:${PN}++ = &quot;${libdir}/${BPN}++*${SOLIBS}<a class="moz-txt-link-rfc2396E" href="mailto:@@-27,3+28,21@@do_compile:prepend(){rm-f${S}/lib/grammar.[ch]rm-f${S}/lib/scanner.[ch]}++do_compile_ptest(){+oe_runmake-CtestscheckTESTS=+}++do_install_ptest(){+install-d${D}${PTEST_PATH}/tests++if[-f${B}/tests/libconfig_tests];then+libtool--mode=installinstall-m0755${B}/tests/libconfig_tests${D}${PTEST_PATH}/tests/libconfig_tests+fi++if[-d${S}/tests/testdata];then+cp-r${S}/tests/testdata${D}${PTEST_PATH}/tests/+fi+}++RDEPENDS:${PN}-ptest+=">&quot;
@@ -27,3 +28,21 @@ do_compile:prepend() {
     rm -f ${S}/lib/grammar.[ch]
     rm -f ${S}/lib/scanner.[ch]
 }
+
+do_compile_ptest() {
+    oe_runmake -C tests check TESTS=
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    if [ -f ${B}/tests/libconfig_tests ]; then
+        libtool --mode=install install -m 0755 ${B}/tests/libconfig_tests ${D}${PTEST_PATH}/tests/libconfig_tests
+    fi
+
+    if [ -d ${S}/tests/testdata ]; then
+        cp -r ${S}/tests/testdata ${D}${PTEST_PATH}/tests/
+    fi
+}
+
+RDEPENDS:${PN}-ptest += &quot;</a>bash&quot;</pre>
    </blockquote>
    Why do you need bash rather than any posix shell?<br>
    We run the ptests in a minimal environment so if busybox shell
    works, please drop this.<br>
    <p>If not, please either remove the bash dependency or explain it in
      the commit log.</p>
    <p>Thanks,<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20260128140635.43214-1-pratik.farkase@est.tech">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#230097): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/230097">https://lists.openembedded.org/g/openembedded-core/message/230097</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/117507676/3616765">https://lists.openembedded.org/mt/117507676/3616765</a>
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

--------------JAef3Iu9SbZJz8mtw9gnMBHW--

