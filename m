Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD65E1125825
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 13:57:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22108.1773237450423460302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 06:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=LvqHaAoh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7530b9b5aa=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B5kVhr616543
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=VxSg0EOYwmUMXMSMEC2IpJKik3d13q2UTHLKuZX5TI4=; b=LvqHaAohE6fV
	CKrmlOmL4Ww4LPgnnv9iBfKg+pqm5L386o2zlC8+J1+6jQN9wi9o2s+ucY8NtwIv
	XyAFISvpUVHzAEOs9D1fs2fZQ0kPG4yaGxZ9Z8r2xbzSf9HOOXv8sTk76KKca5OX
	g2AnQButjX989C4cHj8HlAxuoS7g3DPg/5HpEZHpqWMblwuHY89fasU2ajPza1zN
	WZjkLU0Eo5Q1RI+HaeNAyWNsnH86KriEVH6uPKd+2qwMzHmT4Wlem5R4/1Dx/ws/
	TvVFESCckFh9QOzIIdcymp+wkQOOsT0rlCYVDUx3DfZE2Up1t9gUooBXT389/Xhb
	5h4NaIW7Cg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010025.outbound.protection.outlook.com [52.101.46.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty578pt4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 13:57:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=demrfZ2dcPWgliRFWvVf9Z0ArnvE5WMqQdaMzY5fg1ZZzkw4SEgrf7YnWKi41AsNpzNKA2wF1YHjSWSrUPXADxjIXRmJgBGSM13WWXhxnE4vBw5KypTKLzhqtmzrLKo9JxR0KtTJUm7Q7OAR7LPi8VtWe11x4u/z0ME4BYwIad7rP/DC53NtpqXLooXtJ24PpbR73aI2Rxy9tPHQM7qtxXDT++TOnmxmETVAvhE5IBZQlS0lf0+lgB1U9TPx04IAndwvXTf/8caDU867NeHd997qyzkpDFF6kmiasaFsEXfagTbfS7YD1QJ2dvwKFLuBjsBwKV/7lwwkTbfkSBWQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxSg0EOYwmUMXMSMEC2IpJKik3d13q2UTHLKuZX5TI4=;
 b=YCgfF63sfzRhI/0FLOmluumkaa58/XQlrbnvf9h/ueyzUDeHjf7M5uZkfQ+cbhAuzTrkGaVZhq1uHSKtPIWBy0o/glbU+yZWx8nc2EgkZqIe6ZHpfufXPjAu2WCm4ll6SrKhwn3/Mi4iml1uKM4eESP61bWFsnYImYEhs3Kqsk8Wh9oU74HgOoDgDTN0A96wjuxEJKwz6qxLw80jb4BqJpxNpDfkmM1UESkS8Xw7wlINhKWnlvB/mUSRVvg9JCiqNFVnlZmb/QsJZpc3QLCM0A1CMFPYFGcjAzZvsnnpPci6eSjXzWIGo1FKTLIVdCOJZSzSC+a7shlfxqlw7Fw5+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SA1PR11MB6688.namprd11.prod.outlook.com (2603:10b6:806:25b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 13:57:23 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 13:57:21 +0000
Message-ID: <6745abda-97f9-4963-b671-6c2722bbae0b@windriver.com>
Date: Wed, 11 Mar 2026 21:57:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][master][PATCH v2] groff: upgrade 1.23.0 -> 1.24.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260309150842.3379241-1-peng.zhang1.cn@windriver.com>
 <DGZQ4TTU05M0.3UH0ADSIVMSTT@bootlin.com>
From: Zhang Peng <peng.zhang1.cn@windriver.com>
Content-Language: en-US
In-Reply-To: <DGZQ4TTU05M0.3UH0ADSIVMSTT@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR04CA0182.apcprd04.prod.outlook.com
 (2603:1096:4:14::20) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SA1PR11MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: 611f557a-42b4-43a6-569e-08de7f761d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	r15xeM0Y8dxMDdSNauk04C234MmlaCmYQNSug/Gc0GV+O1YIllhWOFMWO+Wh0l3+zCuc5ynlnYjz1YToziEoDxy9NpNIkN67up5vkGYcqNS/BPf4OSecQx6reD6fX89mMBTWylxfXp/2BsO3hN7d4PwCiSD0NmbjuKdj+R87xZ8RpTVrgiSSAzijo8UiMh4iEn8G2wTA2JiQUSWuFWnb0gDT03xiWudi64p3RLXzz9FP2czNMsgH81Av8220AkiNy8edHtD0aSOMktnsPplbSTlKjy5cCg2wd1WrXyGSDFa/ysvfNjo+vNl8QcW96ejL6alx0YN+FN4hFQccVwqQejOPUlXabnUt/S6QFjwUqnCAG2NFgN1Tr2P43f2btkfb5qHGYF4dfXqF7sT0T21HZkKofIM8A4Xi2JA629RiQcog2uapXbIzKgqNAYBJDLjy6UU3jPDTxDdaCv/aUbWuq2XRZowU3XX5o4UndrZZJu5gBU0T66guL+9mDkWBD0svDA3SrWatf83rK1AWuNmchCIi6RE6uqzBdb+bf3pFxonLB4VgbO3NXKqDL3QAvQP3M81IbEjpOHUkUTdvZvBLoJIhIhHXVYxL15y0JXKhgoWSxRr7X/+wcx7q14hBq7k6pLHr6pYKQ64JWFftr95zTAnVygxnYeG98veSd6cwIcnugl6BdAvV1+tMspIobsO0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?amR1S1AvbHB6THM5N0ZJWkxSOWdMZFVxNnZnYlBMNFdwRFVBMjFSakRFMEVi?=
 =?utf-8?B?MU81dFlKdGhzajJJTVB5NHhVaFdqNWdnbVJpRXVuc1JoVGt6U1RJd1ErRjd3?=
 =?utf-8?B?end6Mm92eEhGMUVJcEV5UElpeVBNKzdkUktaa0lhc1ArVmpmYytjaDFPeUxJ?=
 =?utf-8?B?WTQxT1lsZnM3NU4yTmpKODh4WnBiclBGaG5CZlBXSEdabFhTbUNkTXQ5Tzdr?=
 =?utf-8?B?OGptRjB3bTMrOE82OC9TU3p3dkowcit0c3V4c3pjUGwwamExR1VqZ245bU5K?=
 =?utf-8?B?SEtJZnh3RHhoVUhGaEZDUnBwTytWUmZyYnpHNEdHdGRlbmRaUi9qbmx1SVlo?=
 =?utf-8?B?R0lScXlZeW1OMVJiSTV5MFRXK1B4bmxYYWoxV2djUlU3UkJEeEdmeTNnLzlj?=
 =?utf-8?B?ZzVORWdWbWtxSFZwWm9lYTFSZnF4SkNiOU9QcEtwMVNCb2hUUU4rczVocGNM?=
 =?utf-8?B?OHJvRUROd1RPYXIvcm1QKzVYMzZIZUsremFrZVBxRk1GaGxocGJnc2x0Z0FS?=
 =?utf-8?B?aVBmY1NqV0l2NkpqdHF1NXJncDVtTWRkcldUcGY5QXRDMmdxVG5NTjdZYko0?=
 =?utf-8?B?Y2VWMkc4Ulk3UTBxZjBWLzVHaTQxeFNHM1ViczM4VDFsNllKb0pPak52aHY4?=
 =?utf-8?B?SjRHbkVFa05QM0lYYU91YWYrTk54ZWYybFlkRnlaSlh5OXhsbG5PWW9ZM0gr?=
 =?utf-8?B?NXAwemhOaDJRb1hSWEZnVXA1SW5hUHR1OVlROWEzaGtmWXFZK1Q5akxtUDg4?=
 =?utf-8?B?TWZVbDdjUDJjY3F1UUQ5L0JVV1ZTMnd4RkV5MytuR0t3anI4QllpYncrSTNl?=
 =?utf-8?B?OTRsS2swY1pmbUdqRkdjTzFyU3liYkVMdGlteTdnTTVYMWtHanVkeElUa1E5?=
 =?utf-8?B?QnVxUVZZdkx2U1lPUjJvL1hZVkZoVWt0MzNDQUJiZTBNZVljbVh3a0FDajV1?=
 =?utf-8?B?Q0xrRk5lU2VUYlBKUkxiVEM5Z0R6Qnh1M0RFRWZ1Ui9JY1c1cHluYmJSS2ln?=
 =?utf-8?B?TFBnU3diUDBCMWN4aDVNTFBEcjFGZjd5NmNNbnpmeUllUGZZcVlXNjI2Y0xY?=
 =?utf-8?B?eHA4cmFkVDExQzBHTnRKUTVyc2RiaW9yRU9ORzF2dFBRY1VaWkRsY1FNWXU3?=
 =?utf-8?B?K09STU5XZ2x1TzJzSm1UK2VPQzdsOXNWZ3FhZ2daYjQ1S3lOOTJEczJnOC9B?=
 =?utf-8?B?Z1dJZllpN0RLbSt3bGRGYlh1ZDJKTEl5cWZRRVVCMGlaZ0VMTHY5bkhYZFRi?=
 =?utf-8?B?RnBHazR1Q0pobDEvNm84VGJwNTZSVkVnYUpGc1RZdll3YjRFdTNNN0R5OCtp?=
 =?utf-8?B?cE9jcURaaThpUDBSdTh5THZTT0FDcmhBa0p5bktXVmk1OFV0NzlvUUEzSGw4?=
 =?utf-8?B?Zm1URCtrY0JvQUEwclJLalgvNVQrUXJqMFRhcUlmQ1hRc3VJY3dzMkRjM3hT?=
 =?utf-8?B?U3dqOUZMY2VKclg1RkZ0bElNYWlMVG5TLzc4THZyeVJKRmx5M0VQN01HUFhD?=
 =?utf-8?B?YmtGbkZpOE1ZbUxMSjZRbjNwY2RUZ0hCQ2srbVJaNGZJdXVBM2JhdmhSeDR2?=
 =?utf-8?B?S2t2Q215dnVxSHBGRjJJcWhpRXhZajVoZGFhSkZISzVuTDQybDVSWGdSa1Jv?=
 =?utf-8?B?RlA1enZhdWFmaVZ1dVgrdXdOdk9FQVl0U25ZbTVwZnYxOFg1YlJ6alIxZzJP?=
 =?utf-8?B?SUJmNWluTVlZclgzMXo4V3AwYWNqMU94aldLYmNrNDJEaklDNGNaNkZkSzRq?=
 =?utf-8?B?YWZZcFVJdDRCb3JCZGpiNzdieEY2Uk5JdFpueVgwOGlubm9DZUlPZ0J2RENZ?=
 =?utf-8?B?ZEY5cmsxSXAyalhaVy9oR0VTeStkZHVldDM3bndHbk5zakdoa2ZycFNjVXA3?=
 =?utf-8?B?YXRtWk5MeWpRTmttekkrdklXNENRUTk0Ry8xZnRzYVFzS05nVjVFOEptM0l2?=
 =?utf-8?B?R3d6RDlDVjRscDRTRXE1NE95SWlwbkdDdXNvUUJJcXhzeWdGVzVFVUhLUlc1?=
 =?utf-8?B?RUk3N2JXWDF1Z3BnK0x0cjN2S2EwUUdZYzZ3bGVtbnNEL2oxcVByemlZUFpL?=
 =?utf-8?B?OGQvRkg5emFNN3BpeWVRamY5SXp5NHJLRDlsdFpZd01vMTIyWW1RZjU3bVB2?=
 =?utf-8?B?REVaVXh5NVl0V1BpQkpWUmFFbHdFTk5pOEdpVDNQSzEybTBqcmNLbUJaN3Zo?=
 =?utf-8?B?Q0orQU42QXRGZ2pvYkxRYTNDL2hxMFhFeDhDRkhnWnJYQkJqS2ZrVFdoVmR3?=
 =?utf-8?B?aThickd4c1Z4RU9md0NpeE9maG5kOGh1WXMwWEQzS2dXb3VCQ2NpaHF1dWNa?=
 =?utf-8?B?R1hObk8zYzVQcVJYcmNuTnhWb2F3cXZqb2ZaY1NaekdMeU9rVkRHdXB0RFN3?=
 =?utf-8?Q?4tCWZk5GlOyzulwjZ72N46hU57vciLJc/VonSn52RGpxD?=
X-MS-Exchange-AntiSpam-MessageData-1: oaD5fOT4zK766KdbLnpMQnU3sINT1ZI/zp4=
X-Exchange-RoutingPolicyChecked: 
	NDQ5CLgDiEZ1dMmacjcai3o1w61xeX2zxdFuaNeXH0feiXE/EKIm32gHTb4pKqzZgaE9IS+BA4dHcKuFRE3a7TIWD8dRq7FseKCi3B9xDWYAa8xaQyPhpqAtyfH0CXnuwaELXf2O3f0ubllyYQ/d01gX/PN6NM4NeJIASz1kL3aQPLEhkb7AkWVotzIcQ8UMFktgxAjlHQc+5H8bB7fOj4e9KRz7+uG2+831Z6cbQTnYyz9HhE0iRck5c9VWt2WCB+vxUy8O8BY3RO0jp5vvCa6WZqe4muEJ6YKVtEsMYieI1d/O8ggA5OZVv5jvO9fTowWJ4W/gvPusRp1WwyVnDQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 611f557a-42b4-43a6-569e-08de7f761d7f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 13:57:21.2366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /c45pVC4HuaDbNHZr0a0QDGH45zrNy0m7uNBSGiwvEiINVHYS0NK+tRHJzw+Ti/0/7JhgQaIVxJeCBAg+zdID/qrqNoZunCrDIaUAeqGU8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6688
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ziVZS_8BxM6-HnJizpZA1kXuEGn3OuGA
X-Authority-Analysis: v=2.4 cv=fpnRpV4f c=1 sm=1 tr=0 ts=69b174c9 cx=c_pps
 a=1s4lD5itHyb3CJ4oxNoLhg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=mDV3o1hIAAAA:8 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=zfIeW79sMZfyTpl5hNwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DSslT1mQ0uAyBnVW7bo8OPRO8VFOT1UN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExOCBTYWx0ZWRfX6NMYb0qk9Ys1
 9j92JkcFk839nMpLa7i3SDrEVwVdBDbFGLBa53IFd18a33e1lX5/6/wyos2jHAZWIlBkYPyGPke
 dyhSyYC+3zYXWoqVouwkVKGV/YNlh/8V1vL28sGvCB3KPj1Z5HJvUQpbtgGYBwrkDtlQZQIdLf6
 vaopPy/xu38BMmVU0oOStyITIc/fy1UY6EoOaMraTZr1Phm08CHizu9REE7oUkOiG7KVrQHRhQc
 TbUumAYNhVNBG9rVK7tRsdeXNHVQGpmWq/IHh7oSVxUKeiHYMu8aTVzQ3fN/MQUkdgjTOhD7N+b
 idADYUl77TXF5UF7+xdkc6WnHsxZoDADcpS2B61HQ7yqx4NwqKUvKRzPHU5nX/PVBFPjkIxhTwm
 T3ym8+NDzuTvlf9cMPEb3J7E8AxBAxpVB+5jKwrcgzO2P02zdd5dtyUZKRtgt17kLLxLnrSxtqI
 gz1Guq9nDxprMKZMnvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110118
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62B5kVhr616543
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232887


On 3/11/26 14:03, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon Mar 9, 2026 at 4:08 PM CET, Peng (Paul) (CN) via lists.openembed=
ded.org Zhang wrote:
>> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>>
>> Upgrade to latest revision of 1.24.0.
>> - Drop patches included in this release.
>> - Add patch to fix test-groff not found in cross-compilation.
>> - Add patch to use SOURCE_DATE_EPOCH in gropdf for reproducible PDF ge=
neration.
>> - COPYING, LICENSES: Refresh GPLv3 text.
>>
>> Release Note:[https://lists.gnu.org/r/groff/2026-02/msg00149.html]
>>
>> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> Hi,
>
> Thanks for the new version. It looks a bit better, reproducibility test
> passed at least once, but we still have failures in some builds. It
> seems to be a similar one:
>
> AssertionError: The following deb packages are different and not in exc=
lusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-e=
xtended/tmp/deploy/deb/./x86-64-v3/groff-doc_1.24.0-r0_amd64.deb
> The following rpm packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-e=
xtended/tmp/deploy/rpm/./x86_64_v3/groff-doc-1.24.0-r0.x86_64_v3.rpm
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3554
>
> Diffoscope output:
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260310-jxtz4=
3x1/packages/diff-html/

HI, Mathieu

It's very strange - I cannot reproduce this issue on my local Ubuntu=20
22.04 system. From the Yocto autobuilder system logs, I can't find any=20
useful hints to analyze the failure.
My suspicion is related to the host environment. The autobuilder uses=20
Fedora 40 while I'm testing on Ubuntu, but I don't think this difference=20
should cause the failure.
Any help or insights on this would be greatly appreciated.


Logs from my site:

2026-03-11 20:48:01,918 - oe-selftest - INFO - Adding: "include=20
selftest.inc" in=20
/buildarea2/project/poky-latest/groff-repo/bitbake-builds/poky-master/bui=
ld-st/conf/local.conf
2026-03-11 20:48:01,918 - oe-selftest - INFO - Adding: "include=20
bblayers.inc" in bblayers.conf
2026-03-11 20:48:01,918 - oe-selftest - INFO - test_reproducible_builds=20
(reproducible.ReproducibleTests)
2026-03-11 21:03:11,734 - oe-selftest - INFO - Building reproducibleA=20
(sstate allowed)...
2026-03-11 21:17:05,330 - oe-selftest - INFO - Building prebuild for=20
reproducibleB-extended (sstate allowed)...
2026-03-11 21:29:33,140 - oe-selftest - INFO - Building=20
reproducibleB-extended (sstate NOT allowed)...
2026-03-11 21:33:26,758 - oe-selftest - INFO - Checking deb packages for=20
differences...
2026-03-11 21:33:26,897 - oe-selftest - INFO - Reproducibility summary=20
for deb: same=3D866 different=3D0 different_excluded=3D0 missing=3D153 to=
tal=3D1019
unused_exclusions=3D[]
2026-03-11 21:33:26,898 - oe-selftest - INFO - Checking ipk packages for=20
differences...
2026-03-11 21:33:27,024 - oe-selftest - INFO - Reproducibility summary=20
for ipk: same=3D866 different=3D0 different_excluded=3D0 missing=3D153 to=
tal=3D1019
unused_exclusions=3D[]
2026-03-11 21:33:27,025 - oe-selftest - INFO - Checking rpm packages for=20
differences...
2026-03-11 21:33:27,158 - oe-selftest - INFO - Reproducibility summary=20
for rpm: same=3D866 different=3D0 different_excluded=3D0 missing=3D153 to=
tal=3D1019
unused_exclusions=3D[]
2026-03-11 21:33:27,159 - oe-selftest - INFO -=C2=A0 ... ok
2026-03-11 21:34:10,657 - oe-selftest - INFO -=20
----------------------------------------------------------------------
2026-03-11 21:34:10,657 - oe-selftest - INFO - Ran 1 test in 2768.831s
2026-03-11 21:34:10,657 - oe-selftest - INFO - OK
2026-03-11 21:34:15,023 - oe-selftest - INFO - RESULTS:
2026-03-11 21:34:15,023 - oe-selftest - INFO - RESULTS -=20
reproducible.ReproducibleTests.test_reproducible_builds: PASSED (2725.24s=
)
2026-03-11 21:34:15,025 - oe-selftest - INFO - SUMMARY:
2026-03-11 21:34:15,025 - oe-selftest - INFO - oe-selftest () - Ran 1=20
test in 2768.831s
2026-03-11 21:34:15,025 - oe-selftest - INFO - oe-selftest - OK - All=20
required tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D=
0)

 > rg -C2 groff ./tmp/log/oeqa/testresults.json
205-=C2=A0 =C2=A0 =C2=A0 ],
206-=C2=A0 =C2=A0 =C2=A0 "same": [
207:=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86-64-v3/groff-dbg_1.24.0-r0_amd64.deb",
208:=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86-64-v3/groff-dev_1.24.0-r0_amd64.deb",
209:=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86-64-v3/groff-doc_1.24.0-r0_amd64.deb",
210:=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86-64-v3/groff-src_1.24.0-r0_amd64.deb",
211:=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86-64-v3/groff_1.24.0-r0_amd64.deb",
212-=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86-64-v3/perl-dbg_5.42.0-r0_amd64.deb",
213-=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86-64-v3/perl-dev_5.42.0-r0_amd64.deb",
--
1232-=C2=A0 =C2=A0 =C2=A0 ],
1233-=C2=A0 =C2=A0 =C2=A0 "same": [
1234:=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86-64-v3/groff-dbg_1.24.0-r0_x86-64-v3.=
ipk",
1235:=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86-64-v3/groff-dev_1.24.0-r0_x86-64-v3.=
ipk",
1236:=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86-64-v3/groff-doc_1.24.0-r0_x86-64-v3.=
ipk",
1237:=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86-64-v3/groff-src_1.24.0-r0_x86-64-v3.=
ipk",
1238:=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86-64-v3/groff_1.24.0-r0_x86-64-v3.ipk"=
,
1239-=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86-64-v3/perl-dbg_5.42.0-r0_x86-64-v3.i=
pk",
1240-=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86-64-v3/perl-dev_5.42.0-r0_x86-64-v3.i=
pk",
--
2259-=C2=A0 =C2=A0 =C2=A0 ],
2260-=C2=A0 =C2=A0 =C2=A0 "same": [
2261:=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86_64_v3/groff-1.24.0-r0.x86_64_v3.rpm"=
,
2262:=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86_64_v3/groff-dbg-1.24.0-r0.x86_64_v3.=
rpm",
2263:=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86_64_v3/groff-dev-1.24.0-r0.x86_64_v3.=
rpm",
2264:=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86_64_v3/groff-doc-1.24.0-r0.x86_64_v3.=
rpm",
2265:=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86_64_v3/groff-src-1.24.0-r0.x86_64_v3.=
rpm",
2266-=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86_64_v3/perl-5.42.0-r0.x86_64_v3.rpm",
2267-=C2=A0 =C2=A0 =C2=A0 =C2=A0"x86_64_v3/perl-dbg-5.42.0-r0.x86_64_v3.r=
pm",

//Peng

>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

