Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE92C44503
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 10:52:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9002.1768992716950166257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 02:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GmLQa1VY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548136b405=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L3eqfF1996296
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 02:51:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=75TdMgCJ+Pg00TW5HeyShP2h9EEF5BUKXdXqPfSXbIg=; b=
	GmLQa1VYONQ9zz/xT28ttoFPWCkfYThI8NlxyEPkmgxHHphfIbc4nVTlEPM0v2uX
	MUxCMuHk27H5bqgK8HfEr0jd/TUmId8oKyd0p9WXGq7FDbB/rBkfusL++EQmO6pA
	Gf3RXx4VQTPwSiDfXbPKXRCzGilLbpyP0kW8Qp9HGoOY6hM5SpZ76GmlgNlflISj
	NW8MIKJWd0GXNDPWuF9uUYIP07m1bVXytY8iQTdGvdzOzojmO0GK0K/P9Jl4otTf
	6JzODB9i0oLcMVWLUcJ2TeIlVAMeLSRxRm0o7//8TCRTC+UQdp2W2HNnuUtacjUF
	OOXg6lB5bjboYVLSVn0XcQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011062.outbound.protection.outlook.com [52.101.62.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btn75rdhb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 02:51:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6y32MSRapFct4wabHpvGr1WwuuostNOhtVAkYOewR5+GY5UMd5XpRTemFKQMae7eTBkiUbgYgrHna8oFJQb4rxEkTpHXn/XNSxNLFiw0Ailm8yKqIo4ZjOnTVMOGl2TMVCdByT5F5fycBPA2fyGeerZOxjU4bcfEmNtpsz10jZEa36HG5oFuTO+m7jLjnX6YJldEHmxMihcqh2o+S8oZi0u9LUSYupAEXJ0gumpCWmYRZXEuzqFYPSitFsREHkewL9nMN1es+vVBiNeRCmNZ7USGOddqUGU1GslAzZYfx60cmdvuIhQ6UnrDrCvtDaxa3fksshQTuclKmIo+GiMRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75TdMgCJ+Pg00TW5HeyShP2h9EEF5BUKXdXqPfSXbIg=;
 b=AkfDc4GIs2TrmW2DEV+E4laRYsTJz2XHzpR7rporsk+fRul99k38H4sCYRj2x0ZamtsXqnFFzQmeg9soVVzCnwX9vrDSgvriHc7WIbgtMKqEo3kXbXqg9LHsJNO6+peMIgKX1O9rPrS3ZE97vf1yTd202of3EoX9l3vKCGpUL4x/c1yQrESBbavZOM8n+x6vwz668mn5nSG0EEqMu5EFn2TVnewc8yAIXeY+IkExNpVy6Yb7GHjuNnsxkBkfjX976qNc3Z5C8HLtLpYfKLAaTW8ijJ8I6o/OQzf11DJWL5TD8f2SQbJWpC5ReBcLDwX85Wyq7lWiiTJQjYCbxqdB2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB7132.namprd11.prod.outlook.com (2603:10b6:806:29e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 10:51:52 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 10:51:52 +0000
Message-ID: <219a5e65-1619-4f0e-96b5-890556e131f1@windriver.com>
Date: Wed, 21 Jan 2026 16:21:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: Drop
 oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
To: "Marko, Peter" <Peter.Marko@siemens.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>,
        "Tatrai, Peter" <peter.tatrai.ext@siemens.com>
References: <20260121075430.436353-1-Deepesh.Varatharajan@windriver.com>
 <AS1PR10MB56975E18D333A47C8DA8AC39FD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <AS1PR10MB56975E18D333A47C8DA8AC39FD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::17) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: a70fc69d-dc22-47f2-4ab2-08de58db1590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SGFBeEo3MWduRmg2dmw0blV6emdENVVWZmRlUyt0U0ZwZ2dKTEd0UmZmTmJt?=
 =?utf-8?B?M1BGcDgxaHBuR2FKaEVrQ29ETklTc0s1bUU2ZjZrS1pNc1d2QWl1ckRqVkQy?=
 =?utf-8?B?NGtXWEtVM0YrUkxpSndGcGFlbHJyWFJRR3pOZ1JGc0UrZkFPRG1aUy9nNzVJ?=
 =?utf-8?B?S0ZZV1VCRUQ2RGlhenpoU2syOVVuWjJrSjNlUnUzWmhtR3NnQ0JGY29rVUF5?=
 =?utf-8?B?bEducnA4WHg1SjY2RUlvT0l4TjZGR0kySGE1N1cyTFFCL1hmcnpGVXMxemJa?=
 =?utf-8?B?WFdMTnRabVJnSVhzOHhCeEQvMEp2cG84WFVoSXNuajdSQVJ4YmVta1hzdERm?=
 =?utf-8?B?eUhtNHdPellwR09IUGRHNUo0V2hjbXQ4dUdrWVJaNEtGSmZ2RE4yeG1KVG9O?=
 =?utf-8?B?bFN5bWY1dm1qMFlaSFhIWGh3VUJZZ3JOM2V1R2JPZFV4YmEyUU9Ic1NPREwv?=
 =?utf-8?B?UkJhNTBuSWNGcEc0WUdGdC9ObWNQN2xPUzJmYXlrd2pqRWpBaDFvUGFjRTNk?=
 =?utf-8?B?YVEzMGtNdDZpYWxPWEEwNENlaHp5K3JtcjV6SHdMdUhHOHpRUUI0NUFnTkxs?=
 =?utf-8?B?MWViekNIbkJNUWVkZ1VPS3BSZ2JId3VXTzVKSmhJYVh4WkJRSTNiei9tUFVx?=
 =?utf-8?B?MFNKc1pTeldicmNEYU9XcmhEdGVwWG5HUXpsZjBuemUwT1U4RW8ydHl0dmIv?=
 =?utf-8?B?bFlZYnlLUjJBd01yVkVQdmgxWnIvS3NnYWQ2NGxuUU9UMVdRdW5VeWtiRTlT?=
 =?utf-8?B?bFU5STRua05DdFlDS2RuL3BNYTJDYUVvTFpwZVRra2NQUXJqRkhIblhHZTBP?=
 =?utf-8?B?OUlLcWtIQnNoQ0xiSCtiV1ZNT2VBTUZIWUwzUktIb25EQzFxMEsxbExBOCtj?=
 =?utf-8?B?VXhpRzhNek4za0F5NFVYYStucUFpbC9OTG5nRzZjMnRENm9BemZGbHB2TjZ2?=
 =?utf-8?B?Nko2cVpieGdxNDdsZUI3MUJLTDc5cUs0K1lMdXJUeUxqWVhnaUVOZnRXbkE2?=
 =?utf-8?B?TTFVS005NkMvcHlYTzV1OVJTWXhIWDJSOXlnVDY5Z09IMy9OaE5BNHhpTVYw?=
 =?utf-8?B?VUI1VHAyWnZVdE9jdUd1SWwzb1ZabDZIT3RzYktaL0RYUyt3bGdWcFhmSUIy?=
 =?utf-8?B?bitEU0VzWUpzNzBXNFNRdG5ZcyszL0pLQzdaSlIxd0xpR0p0V2MyMEg1V25t?=
 =?utf-8?B?N0I2WW1vY1JVaSsyWWQvZFI0OGhBSmZTNUlrN0I5NC9mcDEwK01qVTZKeGZj?=
 =?utf-8?B?RGJSbFk1dzlzZ2V4cjFSalVCV1NudTZ2bVAxSzRlNkRuWGNSSHplcHhhcTY4?=
 =?utf-8?B?VTFCTmthNTVybjdYV1d2UDlWc3UvZCtxUU5ONXhIU2Q5VVJmSVV1STNFMVUw?=
 =?utf-8?B?ektlSmdxUFhTSS9nR3o4MW10OGJlb0hhRElpdGRmNjY5bnhZUFUwVHBTcGRs?=
 =?utf-8?B?MkVMU1FqQ21vN3l0akxNbStINW0zY1dqMXdWU0ZuLzlFaW12eFRJM3hhR2Rh?=
 =?utf-8?B?RU92Rm1qZURHdjREaEQ3d1RERzFmdmUxNXpRN2xoYWhvUjdxdE0rRE1zcWdn?=
 =?utf-8?B?WEZZV3huWHBGL0hmRFJkWXFhWlNRZzBYRysrWE51QkU4UjlIaFo2NTRVS0hC?=
 =?utf-8?B?WnpXamVrYzRCVlpaQlpEeXdWb2JHbVBEMGFENis3eSt3ZTNDYUJvT0xJeVFv?=
 =?utf-8?B?RFhiTDRUNENETWdVYnFHZFdRMVk1NWl0ZGZJMWMrY1BMZWwzeTRrRnVPQzBj?=
 =?utf-8?B?ZmFDbm8rdW05azBTSVVNSThDVGZJNzA2OXFKemt6UDlmVzMrajA4UXJKa3Zy?=
 =?utf-8?B?M2hNK0E5RmdKV0hQYzhhODBxbjNBNU5JbjlLZVo4dXRNenA0WmdoV29GUG9M?=
 =?utf-8?B?dzF3V3hoMHgxb2xpSm5BUTNDNXBFcjJNa0I3UUtyZ1JqTGpuZFNSMVdtRk5x?=
 =?utf-8?B?RjBpZDJ3UGc2UGlTTmZHZzNlUWw0OGxTV1RQM3Zwd0VtWkVvUW9lbXNjemN0?=
 =?utf-8?B?QU9PL2VRZGlsVzh3ZWJBc2VpYkZiUmpJMWlIeDF1bHgxL1ZOSWtuYkxGRmpT?=
 =?utf-8?Q?Cp0Ncv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MFRwNlNYSmtySEZ0N3ZGTXV0VnhNdDd4QjVxQVUwZjlLbDQzRWhncFZ4dWx5?=
 =?utf-8?B?eGc3ZStNT3hUM2pKanRlMVJtZHpPckFHN2NseU4veEs3RjJFYWxIc0lNRGsr?=
 =?utf-8?B?eDVST1NPVmFoRDdkNGlMLzdSVXZ3cFhZTzhYTW54ZXNOWFp0bmJ5Z0JveUFI?=
 =?utf-8?B?VHlSazJzaURYTjREVHpzNk5XR0lISmUwSHBFTXFCYi9NcGxGVGc4WGRpRHI0?=
 =?utf-8?B?VzVMUi9xbTF3MmI5RnVZUUdXWWxFWkFlSnlzSXlrQzVwbGtHT0VIZU15Z0ds?=
 =?utf-8?B?Wk1jbzdjTmcvQi8xNEJTUTJ6dUdOSEZqRlliNWt3d1NSZHNmTkpwdllRZkZz?=
 =?utf-8?B?ZzJyVDEvM0ROdEt2ekQwUTZMa0dNdUQxcFNqS1J0RU1BNTQ3eHpaR2VlL3VV?=
 =?utf-8?B?Tkk5YnU0WjZKekljRk1ieGpnL2JVdkNNbFFQUy9rcU9SQWpBUDdpN2RzQmVJ?=
 =?utf-8?B?MGVaRjJxNnpvT1F4b09PVVNEejlkbmxsa1pTUXRXYTEyNy9ab2d2STN3bXJw?=
 =?utf-8?B?eEZaNzh5OC9leU5Qb2IwS3lYSjcxRjh3Y1l4SnFSMkxlWTVzT1pNN3BLbzdH?=
 =?utf-8?B?c3RkaHVtck83R0g2Vkt3anBDeWxnMnd3Y3U2MDdsbFltdGNueVBZSWlBeVJs?=
 =?utf-8?B?SERiTlgvN210NVM5LzFIRlVJaDltdEFvSUkzVEZ3aTNpZTd6QXN4b1dXR1VJ?=
 =?utf-8?B?amlNYmtyQ2V4aS9PMmt3WU4yUWpLTTFPS0ZLZlNaWjl2RmFRcWZua1hVZENQ?=
 =?utf-8?B?dXljNWYrSnV3aXltYUpJNnBUcktpOFFPcUl5LzJHVTVCdm9LWmxUSVhMbFFi?=
 =?utf-8?B?ODVXQy9lbHdCTHoya1FhZExLU3NmTmJvUW9rL21pWHpuTG9mUWlIS204bTVx?=
 =?utf-8?B?aFFiSkVmekFVbjFKYTRnWmRITlErMUhHbnVoS0NTeC9GdGIzSGtjclZLSFVt?=
 =?utf-8?B?WGswdyt0N0ViOWJ6QTllU2JqOXhscUlmcDdCb1BRaDVaZTNGYVBESUhlMUk5?=
 =?utf-8?B?R2FXQVF3YkphdklteVZXT0phd3d2VkZmQVFteXN3UzdzNkcyRU0xb2NlbjBX?=
 =?utf-8?B?bEdqMCtiZ1dXMk8vbnVRUTlzTnUrSEhnd04vT2RyZjhyUGM2ZHZrQnZnc1Vj?=
 =?utf-8?B?UUlhankxNjdhL0dQeVJCdDVTYTEyckJ0Z0kwZGJtT051QUdHQ1hGSnN0RVo0?=
 =?utf-8?B?UWt4R3hZekM0MjcxMnJLM0ZBZWxiUUtqVzZld0hEbG9jVUZKQml1WUZWUmF1?=
 =?utf-8?B?d3FRNGJiVEdWV0VYajVWeFJYaGE3MHY3TjNzemRQVmJQT1E5M2xnUzQ5MjND?=
 =?utf-8?B?Vk5CaG9vM2hRTk1FQms0K29SOXI2WEJnd09ZZkEzOXB2VWMyYVdsSFd3dk5i?=
 =?utf-8?B?RjNpNno2MGcySmxNWC80emR4WHBURld2ZVptL0NoQmxwSW5WTVpzMjZBS1Nk?=
 =?utf-8?B?ZEhHOHNVUEV3TGR0QUgraS9BbnpJQTBGR2VLTTRYb1AvY2RleVdYcCsvRjNF?=
 =?utf-8?B?a1RrQVEwSDdYeGx2WjlwSUQxcVliSjVXSUJKbzRRQTJRZWZlcEZrNXJ3MGR4?=
 =?utf-8?B?OWVsVmxFQUJEOHVXNC9DLzBpcmRoL1NlUEdzeVlnM0VCMERoa3lDNUVidnJs?=
 =?utf-8?B?WHljbVVvaTM4MUVCRTA1cExsOVZtZlY4dlM1RFBUVStkTmozb2gwdVpDWjE2?=
 =?utf-8?B?bmR2a05ZV3lxVUg1M0MzRWxqQTRPaG9COUxIUThQZW9oUEc4d0pubWlmWkhm?=
 =?utf-8?B?RGdtV2syQUJhMEZFa210eEVmdFRiWmV1ajIwbVplOE9hOEE0dW5JLzZtSU9v?=
 =?utf-8?B?R3k2c1pLclVvSkgrdmlpY3N3NzZxbGlMQ09pVzNkZ2hHekZreGJzYTlRUm9F?=
 =?utf-8?B?MVVhaU96cUJLaXl3a0ZndzFXUnhEb0lFNjIyOHBTYmNSVFlRdXV6Qlk5ci90?=
 =?utf-8?B?VjBCSlNPam56d0w3MjNtdzZZQ2FoeFlKSElDbzMxVTBMZTJJSXZKakV4ZjZw?=
 =?utf-8?B?MkJCSkd1NUJkUkQ4cXh6b2VyS2l5TElzNS9HbXRDSlRsNkoydVRmQ3JxQWVo?=
 =?utf-8?B?RDRKaVoyT1hOaDZWMlVpc3dHMzQxWmMxN3RZMVVKSytuWG5jRW14VmxML25r?=
 =?utf-8?B?QWh4U3RzQkZ5K0JBZXBhNjFrZHhYWmtPRjZzWnhwenlxdXRwcEFjT1MzMmZr?=
 =?utf-8?B?VmREQ3lzeU1qR1JlMEExTVFkeVNIY20waDJyTDlkaHV2NUw0MW13eXVkK1pP?=
 =?utf-8?B?VFN3dEZOTHRhRnYxMmZhelhCYVRKUHhsbTNRei9yMk9xbmgraUdRbjFtMWdU?=
 =?utf-8?B?a2VqS1hHQUVxV3NGT25ta2c5cytBMjQvb2RvaWNHWWdObU5OZG9JYzBhdk5k?=
 =?utf-8?Q?NeG1WuMHWFY1bJGFmsyWyrxFgIxr9raqnlhUq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a70fc69d-dc22-47f2-4ab2-08de58db1590
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:51:52.3367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FrAPFw1ucRmHKveZkjhExXAFeezFmiVX6lhzjmsDT0akKSzkTgk/ynFCthBNbsKBafzYCXYO1BVvd8oyrqW9ck28IDy8tapBpNnTUj+z/2ULv34bZpCu38qEi/Lbj2O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7132
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: rYDGIFrKcrB5xh6F32gaZdyY5wduUSwv
X-Proofpoint-GUID: XZbXl8w1Jlg-VrqHOS1rEy6edrzBxjiN
X-Authority-Analysis: v=2.4 cv=fpzRpV4f c=1 sm=1 tr=0 ts=6970afcc cx=c_pps
 a=z/e76aUa2pYXdP5U8KLfNg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ei4SEBeUAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=a_U1oVfrAAAA:8 a=MIJw7qO2ZysrsoQphdgA:9 a=QEXdDO2ut3YA:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA5MCBTYWx0ZWRfXy68hBUhMta7o
 Z5K+T1HAWQm3LQAJib8vZzgK9XRCarVoS5To6VdjCaOHkwtNSDYXpXrFVrh3O9/7LtYKI3OHAkS
 0TGuy5TEv0ApP0xOkGR+B6EdxZt7ttzJmNVG3eX+YFML8pV8gIDpyWhuKbYWby14/LXDR85rtH5
 YsZvtIjoTpYty1HXD6dz0KnTSoqDplT6AESw+I/wQ77J41o9jx/XgasA0+Y1IJgytf3P91BZE/X
 dHrqFbcOtm8YvZF2vKq49XXE3mvVXEZD1fixRJscM+VJxiecZ4QrERTrveLwJLzFob9MOhIBs7n
 9xHIQpus39FoQPe7wzI9n1WI1a+9v+wHu0qrPEsCyVlWicVPn6iEm3QSltBzxe0fuWyuQp7eM5D
 H4ujWZ6AYLSMyfC1cl+b8PhJdbHvqcmuoKZXIkkkewga5e8BV9VKu9E0AYRb2+HLjD+evpuz1nX
 3McYB+1bqL4Eu7UkBvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 10:52:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229805


On 21-01-2026 14:44, Marko, Peter wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Varatharajan, Deepesh via
>> lists.openembedded.org
>> Sent: Wednesday, January 21, 2026 8:55
>> To: openembedded-core@lists.openembedded.org
>> Cc: Sundeep.Kokkonda@windriver.com; Deepesh.Varatharajan@windriver.com
>> Subject: [OE-core] [PATCH] rust: Drop oeqa-selftest-Increase-timeout-in-process-
>> sigpipe-ru.patch
>>
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> This patch was originally added to address a rare failure on the PPC
>> target observed in AB. Currently, we are no longer testing the PPC
>> target in OE-Core. Therefore, we can remove this local patch. We have
>> also verified PPC testing locally several times without this patch,
>> and the issue has not reoccurred.
> Was this tested for 32-bit ppc on a build machine which was under some load?
Yes we did the testing for 32-bit ppc on our local machines and the 
issue was not seen.
(In normal load conditions in a shared machine).
> I wouldn't like to play a remove/re-add game, flaky timing tests have tendency to return.
> It's rather trivial patch which should not be causing any maintenance effort.
Agreed. But after the discussion with rust upstream folks in the past, 
they have concern about our local
patches. We are working on cleaning up the patches. So, please create an 
issue upstream or submit the
patch upstream and backport it.

Regards,
Deepesh
>
> Note that this architecture is not being tested on AB, so the commit message is bit misleading (as it was not observed on Yocto AB).
> Also not being tested in AB is not a good reason to remove something as users are still using it (as a tier-2 feature).
> Note that we're discussing some form of return of Yocto AB testing for 32-bit PPC.
>
> Peter
>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>> ---
>>   ...crease-timeout-in-process-sigpipe-ru.patch | 31 -------------------
>>   meta/recipes-devtools/rust/rust-source.inc    |  1 -
>>   2 files changed, 32 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/rust/files/oeqa-selftest-Increase-
>> timeout-in-process-sigpipe-ru.patch
>>
>> diff --git a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-
>> process-sigpipe-ru.patch b/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-
>> timeout-in-process-sigpipe-ru.patch
>> deleted file mode 100644
>> index 5bd1abffb4..0000000000
>> --- a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-
>> sigpipe-ru.patch
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -From b4524278985f517b0785b6f64a21380dcf1ff096 Mon Sep 17 00:00:00 2001
>> -From: Peter Tatrai <peter.tatrai.ext@siemens.com>
>> -Date: Mon, 4 Nov 2024 13:58:16 +0100
>> -Subject: [PATCH] oeqa/selftest: Increase timeout in process-sigpipe rust test
>> -
>> -This patch increases the timeout for the process-sigpipe rust test, which
>> -occasionally fails when the server is under heavy load. Increasing the timeout
>> -reduces the likelihood of false negatives under load.
>> -
>> -Fixes [YOCTO #15625]
>> -
>> -Upstream-Status: Inappropriate [OE testing specific]
>> -
>> -Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
>> ----
>> - tests/ui/process/process-sigpipe.rs | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/tests/ui/process/process-sigpipe.rs b/tests/ui/process/process-
>> sigpipe.rs
>> -index 11f363d62..c12d66016 100644
>> ---- a/tests/ui/process/process-sigpipe.rs
>> -+++ b/tests/ui/process/process-sigpipe.rs
>> -@@ -23,7 +23,7 @@ use std::thread;
>> - fn main() {
>> -     // Just in case `yes` or `while-echo` doesn't check for EPIPE...
>> -     thread::spawn(|| {
>> --        thread::sleep_ms(5000);
>> -+        thread::sleep_ms(50000);
>> -         process::exit(1);
>> -     });
>> -     // QNX Neutrino does not have `yes`. Therefore, use `while-echo` for `nto`
>> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-
>> devtools/rust/rust-source.inc
>> index d7d44510e4..3edf0899ab 100644
>> --- a/meta/recipes-devtools/rust/rust-source.inc
>> +++ b/meta/recipes-devtools/rust/rust-source.inc
>> @@ -4,7 +4,6 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-
>> ${RUST_VERSION}-src.tar.xz;n
>>               file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-
>> g.patch;patchdir=${RUSTSRC} \
>>               file://rust-oe-selftest.patch;patchdir=${RUSTSRC} \
>>               file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=${RUSTSRC} \
>> -            file://oeqa-selftest-Increase-timeout-in-process-sigpipe-
>> ru.patch;patchdir=${RUSTSRC} \
>>               file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-
>> rust.patch;patchdir=${RUSTSRC} \
>>               file://revert-link-std-statically-in-rustc_driver-
>> feature.patch;patchdir=${RUSTSRC} \
>>               file://0001-riscv32-Define-plain-syscalls-as-their-time64-
>> varian.patch;patchdir=${RUSTSRC} \
>> --
>> 2.49.0

