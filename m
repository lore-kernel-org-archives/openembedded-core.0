Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CBFE77188
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 02:41:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12387.1736908871870660076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 18:41:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3110e1429e=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F2afLu017247
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 02:41:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 445yumr742-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 02:41:10 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50F2fA05025187;
	Wed, 15 Jan 2025 02:41:10 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 445yumr741-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 02:41:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/nhKDF1ALmqaPYS4QGTnNeZM1vikWpXbcZzfmdv5dU78sVoqE/nY21MCmGLnM/NPtJDoD9eEQCEdDWAjH8Z3VyEkjtBxP+23d3FlStXzAGoGmDmtdrIXq+wijNQsb0UnSoE4CxmKZFkgofq8KtybpIoHS9PN38fC1CQFvH4NEdSQ5u5FOOkvVsJt0YROhGKJD8/smrlPtzGnjtt/wRzRq2jaSayv63EO9iyc8iK1Lysw1RyX3y3q/rLeMSP/Kqz+RHvCgXzVp1YnxMTx1NZ/kTt4n1gSaGX+Pp8C0ue579n/YKzV2PK3sXcZseGwjCsbfldD28LDobWc0x4h3kR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJjE92I1PCfmfb4Ue5EBxdTjf4DHfvv+iFp7+BIBbBM=;
 b=IX2e5OnzlQzaQ8O+Q6+/kXIIlgNTwupBF5mrCUwo6mx5DZusuCpRA1zKgZxsftOBCHCfGrPe/gPNMjnkAmIY9CuLRgZ2/OOF2EqQY0EC6jJdHWu6zPjyi5tA3Cf0ACrzaXrfNAAPP+XfCr/p3uPJgdDL4gXj/8c4vF15+RGSkWxXOA1H/SP94aQClOv3XT1uU0hh1yTnEfVT5gVLZpOM6XqCLjoY0WUdpnjnXldUiBjSUp5m057OeXMRJ467vaa+7+5xVbwMoM7pqJtW/jkK3XHUVkUZlteiPGh8ykCS9Glfkvsv6qPOTx7GuniSVOMbSshypR7FznsOANSRVUYENw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by IA1PR11MB6324.namprd11.prod.outlook.com (2603:10b6:208:388::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 02:41:07 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%2]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 02:41:07 +0000
Content-Type: multipart/alternative;
 boundary="------------vzoCtGNcw5IZWMDbM90FiuC0"
Message-ID: <8f28ca48-3092-470c-88a6-2d3e100fde34@windriver.com>
Date: Wed, 15 Jan 2025 10:40:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/3] SPDX 3.0: add CVEs from cve-ckeck results
To: Marta Rybczynska <rybczynska@gmail.com>, hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org, colinmca242@gmail.com,
        JPEWhacker@gmail.com
References: <20250108154718.3031653-1-hongxu.jia@windriver.com>
 <20250108154718.3031653-3-hongxu.jia@windriver.com>
 <CAApg2=QwE7Mo5rqcp_UK6X0VnS7h9Tv7AsroWpa8M2GgGVg-mw@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CAApg2=QwE7Mo5rqcp_UK6X0VnS7h9Tv7AsroWpa8M2GgGVg-mw@mail.gmail.com>
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|IA1PR11MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: 9171292c-bd78-4912-70f3-08dd350e0fe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VDJiVmRka2xGblMrY2hRMEs1RnpLN3dOdDBNWVV1aGZjUzM3RXJrY2d1Ylov?=
 =?utf-8?B?RFB4dzgxM2lZMGc5YXJObytxbitUZzJoZkc1RHlOeWdtNEl2NVFWWDhZb2tx?=
 =?utf-8?B?V2V6VkpGZzI2a2xpMjhZT1ZQdmlSUlpndmNmYXdodW1LUXkrWnFRaTJyZmw3?=
 =?utf-8?B?SmNVclZURjdNcDNKVGltMnB2dDV0UHFvWWVjN0VycVQ5OXp4bzdQMlJwRjJ1?=
 =?utf-8?B?SlA1dmN6ZFVCeVJVbUZMdnhySkQ5WEhxMnNYdnhaelVhb1BqUzBxQXMrbG9O?=
 =?utf-8?B?eGEyUzlTeFFzdFJmb09wRjZ5MXdFYVA2am1TRzUvSjlGNXFUN3dJYk16VGl4?=
 =?utf-8?B?Z0p3WHFaOVdlMjA1cFFqQjVHQmRlTHB5TmZGOWo5M2NjUlptSG1tTWkyVXBL?=
 =?utf-8?B?OGErUFJXRXhVMWlZc1BxckJrRVVsd3B5KzRHUUFEN20vWnNxWUtCczJHbkNr?=
 =?utf-8?B?cW5QUUtGOWVndmU1ZTl5ODRucjVoQytCdHNZaVJ2OC92bzhVZWk3ZE0rMlg0?=
 =?utf-8?B?V1pVNWNOc2RkYjBpMWxEandNZEY3bnRSUWNlRHRPUVZVMG82ZzRGTzgzRG80?=
 =?utf-8?B?VHBSZnpUOTlGbUVFaW5LcnVZOW1icEV4UXZUTmpONjBvaURQV0kzYy9hN3Jl?=
 =?utf-8?B?cUllbmluZkdqWEsrWnBXanhxVWEwWVNNUHQyTFV1Nzh3UmErcDJvTk05azRX?=
 =?utf-8?B?VVgxTGQzclVmQWNyZWFVQTQyU1RrazJvRzYyT2NGVG9DRTZLNTY0T2owY1ha?=
 =?utf-8?B?NEkxV3FQdU9qOEtuTHduUWJFdVJvSkZsWFVoN0FrZFhUSFVwMk1CZVVTMWtX?=
 =?utf-8?B?Z0NvWjJPY01BUVJjVlBwNXpKQ212U1psa2Z1QlhPUU8yM2liUldoOWxXeWZJ?=
 =?utf-8?B?ZTVQNEsrVjlvbUhYT2FyR1lSVVgvTGQrN2RJNEVkdlpBWEM1aHZlRlJ1M2R1?=
 =?utf-8?B?RGZtVS82V09rcERveFFmMHgxMmEzKzQySUNDSUZ0SGh5dVlkOUp3OHRob3pN?=
 =?utf-8?B?di9KTk5jS0NXSjh1YXF0c0thMEx2NnBidHJzL2JmYUw0bmVWakJHK3pYK3U4?=
 =?utf-8?B?dzVZVi9VUE96VFZIZ0xQcTkvVktkeTZMWm9KdHJhSXQ1RnVDeGczVWMrL0Nz?=
 =?utf-8?B?ZTV6N3JtTUxmK1g1emhseDhpd1lWTld6NlM1cHNPWUxJRlh2YUNyMllnQzFv?=
 =?utf-8?B?MEJrTDBjMU0rNUlnV0VTN1dUVnBYVnRaQ0lXM0ZJVVBkRUpieGkxMjlaajR3?=
 =?utf-8?B?TTZEVlZyc1l5MGd4TDlYclJiNjhqUGxjN2F1QktBeTdIczhaR3FtTmRFZmpm?=
 =?utf-8?B?dkducExFcnVlZ2o4MGFBMDd3bExhMkE5cEp2VVNIWngvNVVONjRHNjM1ZmJp?=
 =?utf-8?B?aGUwSEQrMjF0UUdITDg5TGxzUmtBNi9DalRZQU5jNFQrY2htd1BUaVlQVWZz?=
 =?utf-8?B?ajdBNk9ZdXE3NVgwelNpT3R4Y0JpL3JFK2Rqbk9sNWFGdkZqY3I0OEVkVkFK?=
 =?utf-8?B?VEpYZHlUajBIa0J4NjNKTlB1eC9sRXhKdDFPZmNiekI4TmFVQUpaa3hGcTQ3?=
 =?utf-8?B?TGljYUVweXhaZ0wvVHhZcUFUZ2FsWXB5dERQZW9CR0JzazBhKy8vSzBEMGd3?=
 =?utf-8?B?VWR1cGpnQ1RxQWNaR05GV3lhd0I4TjJwM0FOS2FuVEdaWW9BakVDNXZQOTd5?=
 =?utf-8?B?L25pWnh4dFkvWWZsZlpwQ250SXNFWmFHakh4VUU3cmxuWitxK2ZTcXRKMGdy?=
 =?utf-8?B?TFhVeFlPK2ZTSG1Zb2MyWVFwTVQ0Tll1bEJORE5zZWZQbmJkTS9FQTVOQnpx?=
 =?utf-8?B?VFJWQjRGdXUzQ2dzMVVrQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ym9WOEo0dFhGZEg0M3JvQlozSHVOWE9tWHJtZjRKWXNTSllhOHlDS3NEMDFv?=
 =?utf-8?B?U0c4cWxZNnA1elBlWUlqVVJFcS8ydm9UL2pqZWpiWmdJQWlSek9oMXU1ckE5?=
 =?utf-8?B?dFcwNGZ3WmlNencrSTlJdjJ4ZmpidkNMSmFpdnZOeWQ0UVFPY202K3o5SVlt?=
 =?utf-8?B?Z2VkMkpuUGp1dEUxVi9lZ3U0S0pZbEZBNXZYTmVyckVZdUp6Und3bkxISVhE?=
 =?utf-8?B?RVN0cDJoTTd5Y21mUGpzOVlpTGZsN2s2ZExoeUNScG1HTHRaRERwaEg3T0NX?=
 =?utf-8?B?ckRkSUV2ZmFnQ0xNZEZSZXdGWXJTUkZlQm5zTVQ1UjJYNkdvUnIreUVTaWM4?=
 =?utf-8?B?V1RvcDl5cGdEdTdYdEsrWUw4SVU5cGNnbWxhOTN2cHlwdmZ1MnBQS2p3ell3?=
 =?utf-8?B?NnN3bTYzdjlIKzhWRkFXYjg1cHIzaGFHVGZuelg1SE9aL3ZaVGZRU3VmNEtF?=
 =?utf-8?B?Unc5RTdOQjMvRmlXaUVBOEllZlNUS3dqMlpPSlRPR1dESjVtT3hyUVF0U21y?=
 =?utf-8?B?OTlpU1VENmNUODRmVjBJdGE3Z2xCZU54OWJua09XNmFwTDFDK1NHQ0xZK3Vo?=
 =?utf-8?B?VjRNM3NXUHBtYUJrbE1PZFBWRUtMOEMzSXZPUS9JWGZvb1RkYjMwYzJIUGNt?=
 =?utf-8?B?VGRjcUhhV0t1RnpnTlVZYVI3Q3cyNnVHeUVqcEcvbWdkTHlQeHprM1VGd0RB?=
 =?utf-8?B?UDhJcmN4WlBKWEt2U1lydUdOZlBYdkhFNmFoNHI3YU1jbFNLNEpkTHNNTk1B?=
 =?utf-8?B?MjArY0EyWjNrbFNtV3RUblY5QmRsZjZtNmNTMG04RDRqRFdHWWk1VnNVVTg0?=
 =?utf-8?B?bUFTeHpYN2tLMUs4MVlpaDNTalVicmVGWnJMazM0RmxMVG8vSVVvZUxBdzdn?=
 =?utf-8?B?M2pOaWNIbGNiZlJBZkV6RW5BelJhYkg4UkxQS3FUWHZBem5BYXh3SGNJazhG?=
 =?utf-8?B?NXoyM2RSWmY2bi82L3lCU00yWWNyc2hvYjRMbGZaN254Y3p3YnRMOXVycFFq?=
 =?utf-8?B?N1k2Q2tDeTFKT04zWFJ1b2JMNnFCS2NqWnFxVFVjOTgyT3p1ck1hdGc2N2Vu?=
 =?utf-8?B?VXExUDZDd2lKaHZhRnhkOVJQdng2Y2xETVk4eDI3ZzF1bGJ6ZGdSQU1hbGkz?=
 =?utf-8?B?NDdrOFA4VkltMlJEQ2FDbmZZcHJuYmVvb1VhZXpkTGNlM1ZVQWl2cjVGZlJk?=
 =?utf-8?B?ZUFOOEs2VWtZQlVack5LRmFFT2lGeG9yQ1VmL0VwQjg2RXBvRmdpVlBIeWJU?=
 =?utf-8?B?b3NiU2NTSFJVVlJJWXRKTVIycExJZEkwWmZWQ04xYjhwU3RiT1pyVlJFMDEx?=
 =?utf-8?B?U2N2eFVqZ2NsZ0VTZENwK2FiYlJXMWlualBmejE2MVdMdjNHb0RDNjFTeVlm?=
 =?utf-8?B?cVBmQjYxNlZjRXI5dVN6a1pLdldRR25wamtuYkZMWWNQcG1Pc3FpMWY4NVRz?=
 =?utf-8?B?NnRMYS9YU2RTRGQxTmdlamJCakFZQmQvc2RPcDFUaFAzMllQSjYzZmhOb2tm?=
 =?utf-8?B?UlNtQy91YW0zTUNCQS9xSzZQN1ErZHEwd1B1ODBwa2RBSXFUVXVRSmlDaXJl?=
 =?utf-8?B?cDNvQy91TW5MdW85VGFJSFI4S0VFWW5xMWZaZHRNSjNLSFo5aWFZVGVvWU9F?=
 =?utf-8?B?RXFYU21BUXVrWVZRMlZheWcrcExMR1ZXeC82bDg3TEVDZ1BKdFUyQWJEVE1t?=
 =?utf-8?B?K0xxZEtoeTNsZ1pJUDFGSVlZWHFJakw0OHBhRjVlUHRXaVdSTEZHZ0thTjZO?=
 =?utf-8?B?VHFvdkdsdSs4K2lNN1VwaFIwMGdZeDA5RGFMWllWVnVOMnFmR25WQnFMNFkx?=
 =?utf-8?B?QmMzS3VIN0hQZzlXa0NUUFVQc0s5NUZCMkcwcVJRU3UwaXFvWmRKRmwzazB0?=
 =?utf-8?B?T3hTQVVpNDJObWhXQmoyYmpubUU4SjNjME5VTHR1Z09NQnJkOGNhYnJHSG5i?=
 =?utf-8?B?NGZ4dnluWFpXS0g0aDFHUUs0N2hmTzdocXRTVEJiRTZXdnBNeHhRU2VhSGIz?=
 =?utf-8?B?VkVVOWxCMmhUMU9qKzluUUdVbTh3N3R4VlFKNk1yMGh0QmJveTF1YnBuS21h?=
 =?utf-8?B?NFl1bkdmWk1MNG1EbkNsNUVxZjcxZk5hSVVUaDg4dTI2YVB1YTRuV1AydVU4?=
 =?utf-8?B?bzlzQnMvYVFDaFBGVmpxNDFoRkhiUldxcGVLUnpQYmxTYjZHNTJobWU1cUhP?=
 =?utf-8?B?TUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9171292c-bd78-4912-70f3-08dd350e0fe6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 02:41:07.1997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVdnCvdrQEvnTb5UfFevM8m80W8ByrsOqTzOygC8r04T3KqERZKd28K9SgPexV8Dd2Gf14NPgeOEkJ0VFNT3yjxyRh7JAoqk+IQ09Lj/glE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6324
X-Proofpoint-GUID: 347AugB--xz1-a_TKOJQpZUBQG-bnafD
X-Authority-Analysis: v=2.4 cv=EeoyQOmC c=1 sm=1 tr=0 ts=67872046 cx=c_pps a=6L7f6dt9FWfToKUQdDsCmg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=24AZYWMyAAAA:8 a=sMBj6sIwAAAA:8 a=8r2qhXULAAAA:8 a=Ea6hJB62AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=ikPnzmiJd7c7xIBqOikA:9 a=PRpDppDLrCsA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=o-QTNZl3LULt7tsZaMwA:9 a=C9CnJm6xB-XnoZGa:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=bG88sKzkDEFeXWNnvthB:22 a=8gvLZcY7Nlvl4CGD_6nf:22 a=XsUzo9oalnhfXISYWTNb:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: RJ-DIZpUTPBHSWoYNzhTfdWA7QRTdwwA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_09,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501150017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 02:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209815

--------------vzoCtGNcw5IZWMDbM90FiuC0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50F2afLu017247

On 1/14/25 00:51, Marta Rybczynska wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> Hello,
> Thank you for this work. Could you explain your use case, why do you=20
> include all the entries in the image's SPDX?
>
The use case is `SPDX_INCLUDE_VEX =3D "all"` + cve-check, according to=20
SPDX_INCLUDE_VEX[doc]

 =C2=A0=C2=A0=C2=A0 Set=C2=A0 to 'all' to get *all known historical vulne=
rabilities*,=20
including those already fixed upstream, if cve_check is inherited, set=20
to 'all'=C2=A0 to get all known historical vulnerabilities from *cve chec=
k=20
result* (warning: This can be large and slow)."

Currently cve-check is the only way that I find to get all known=20
vulnerabilities from remote database

> I'm asking, because that SPDX file will be out of date quite rapidly,=20
> probably in 24h. Without updating it with the new data, it can be even=20
> misleading. How do you address this issue?
>
The feature is not enable by default, it requires to explicitly set=20
SPDX_INCLUDE_VEX =3D "all" and INHERIT +=3D "cve-check",

If user decides to use this feature, he/she will know the timeliness of=20
data from cve-check

> I also notice that this patch adds a dependency of SPDX on cve-check.=20
> We have been trying to avoid this for a long time. This may be a=20
> discussion to have.
>
The dependency of SPDX on cve-check is also controlled by=20
`SPDX_INCLUDE_VEX =3D "all"` + cve-check

which means it does not affect normal build

//Hongxu


> Kind regards,
> Marta
>
> On Wed, Jan 8, 2025 at 4:47=E2=80=AFPM hongxu via lists.openembedded.or=
g=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GO=
knUcJIVspDugHtuWyIErJ8$>=20
> <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
>     Originally, SPDX 3.0 added CVEs from CVE patch and CVE_STATUS
>     in recipe, this commit adds CVEs cve-ckeck results that is
>     generated from NVD CVE database
>
>     Enable it by inheriting cve_check and setting 'SPDX_INCLUDE_VEX =3D
>     "all"'
>     otherwise still added CVEs from CVE patch and CVE_STATUS as usual
>
>     $ echo 'INHERIT +=3D "cve-check"' >> conf/local.conf
>     $ echo 'SPDX_INCLUDE_VEX =3D "all"' >> conf/local.conf
>     $ bitbake glibc
>     WARNING: glibc-2.40+git-r0 do_cve_check: Found unpatched CVE
>     (CVE-2010-4756)
>
>     $ bitbake core-image-minimal
>     $ vim
>     tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.s=
pdx.json
>     ...
>     =C2=A0 =C2=A0 {
>     =C2=A0 =C2=A0 =C2=A0 "type": "security_VexAffectedVulnAssessmentRel=
ationship",
>     =C2=A0 =C2=A0 =C2=A0 "spdxId":
>     "http://spdx.org/spdxdocs/glibc-086907e2-5516-5638-9df3-b3863651f37=
4/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/vex-af=
fected/1ae2a2b94bac9bf0894b46b0c3194416
>     <https://urldefense.com/v3/__http://spdx.org/spdxdocs/glibc-086907e=
2-5516-5638-9df3-b3863651f374/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4b=
f8b05d1473ae4da277398/vex-affected/1ae2a2b94bac9bf0894b46b0c3194416__;!!A=
jveYdw8EvQ!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHV=
gC4O7GOknUcJIVspDugHtu26Ckvwk$>",
>     =C2=A0 =C2=A0 =C2=A0 "creationInfo": "_:CreationInfo161",
>     =C2=A0 =C2=A0 =C2=A0 "from":
>     "http://spdx.org/spdxdocs/glibc-086907e2-5516-5638-9df3-b3863651f37=
4/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/vulner=
ability/CVE-2010-4756
>     <https://urldefense.com/v3/__http://spdx.org/spdxdocs/glibc-086907e=
2-5516-5638-9df3-b3863651f374/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4b=
f8b05d1473ae4da277398/vulnerability/CVE-2010-4756__;!!AjveYdw8EvQ!a0TdTsi=
ZuoyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDu=
gHtudNLs_Pc$>",
>     =C2=A0 =C2=A0 =C2=A0 "relationshipType": "affects",
>     =C2=A0 =C2=A0 =C2=A0 "to": [
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0
>     "http://spdx.org/spdxdocs/glibc-086907e2-5516-5638-9df3-b3863651f37=
4/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/packag=
e/libc6
>     <https://urldefense.com/v3/__http://spdx.org/spdxdocs/glibc-086907e=
2-5516-5638-9df3-b3863651f374/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4b=
f8b05d1473ae4da277398/package/libc6__;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBBPS38=
2u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDugHtu9bfpovc$>"
>     =C2=A0 =C2=A0 =C2=A0 ],
>     =C2=A0 =C2=A0 =C2=A0 "security_vexVersion": "1.0.0"
>     =C2=A0 =C2=A0 },
>     ...
>     =C2=A0 =C2=A0 {
>     =C2=A0 =C2=A0 =C2=A0 "type": "security_Vulnerability",
>     =C2=A0 =C2=A0 =C2=A0 "spdxId":
>     "http://spdx.org/spdxdocs/glibc-086907e2-5516-5638-9df3-b3863651f37=
4/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/vulner=
ability/CVE-2010-4756
>     <https://urldefense.com/v3/__http://spdx.org/spdxdocs/glibc-086907e=
2-5516-5638-9df3-b3863651f374/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4b=
f8b05d1473ae4da277398/vulnerability/CVE-2010-4756__;!!AjveYdw8EvQ!a0TdTsi=
ZuoyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDu=
gHtudNLs_Pc$>",
>     =C2=A0 =C2=A0 =C2=A0 "creationInfo": "_:CreationInfo263",
>     =C2=A0 =C2=A0 =C2=A0 "externalIdentifier": [
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "type": "ExternalIdentifier",
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "externalIdentifierType": "cve",
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "identifier": "CVE-2010-4756",
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "identifierLocator": [
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "https://cveawg.mitre.org=
/api/cve/CVE-2010-4756
>     <https://urldefense.com/v3/__https://cveawg.mitre.org/api/cve/CVE-2=
010-4756__;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6Advoy=
PVoPGz-DNBiSHVgC4O7GOknUcJIVspDugHtu8J_rMIU$>",
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "https://www.cve.org/CVER=
ecord?id=3DCVE-2010-4756
>     <https://urldefense.com/v3/__https://www.cve.org/CVERecord?id=3DCVE=
-2010-4756__;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6Adv=
oyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDugHtuOtsvn3Y$>"
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     =C2=A0 =C2=A0 =C2=A0 ]
>     =C2=A0 =C2=A0 },
>     ...
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>     ---
>     =C2=A0meta/classes/create-spdx-3.0.bbclass |=C2=A0 7 +++++--
>     =C2=A0meta/classes/spdx-common.bbclass=C2=A0 =C2=A0 =C2=A0| 11 ++++=
+++++++
>     =C2=A0meta/lib/oe/spdx30_tasks.py
>     <https://urldefense.com/v3/__http://spdx30_tasks.py__;!!AjveYdw8EvQ=
!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknU=
cJIVspDugHtuLZ34Lv4$>=C2=A0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 29 ++++++++++++++++++++++++++--
>     =C2=A03 files changed, 43 insertions(+), 4 deletions(-)
>
>     diff --git a/meta/classes/create-spdx-3.0.bbclass
>     b/meta/classes/create-spdx-3.0.bbclass
>     index 25f3aa5f43..e3d6f95e3d 100644
>     --- a/meta/classes/create-spdx-3.0.bbclass
>     +++ b/meta/classes/create-spdx-3.0.bbclass
>     @@ -42,8 +42,9 @@ SPDX_INCLUDE_VEX[doc] =3D "Controls what VEX
>     information is in the output. Set to
>     =C2=A0 =C2=A0 =C2=A0'none' to disable all VEX data. Set to 'current=
' to only
>     include VEX data \
>     =C2=A0 =C2=A0 =C2=A0for vulnerabilities not already fixed in the up=
stream source
>     code \
>     =C2=A0 =C2=A0 =C2=A0(recommended). Set=C2=A0 to 'all' to get all kn=
own historical
>     vulnerabilities, \
>     -=C2=A0 =C2=A0 including those already fixed upstream (warning: Thi=
s can be
>     large and \
>     -=C2=A0 =C2=A0 slow)."
>     +=C2=A0 =C2=A0 including those already fixed upstream, if cve_check=
 is
>     inherited, set to 'all' \
>     +=C2=A0 =C2=A0 to get all known historical vulnerabilities from cve=
 check
>     result \
>     +=C2=A0 =C2=A0 (warning: This can be large and slow)."
>
>     =C2=A0SPDX_INCLUDE_TIMESTAMPS ?=3D "0"
>     =C2=A0SPDX_INCLUDE_TIMESTAMPS[doc] =3D "Include time stamps in SPDX
>     output. This is \
>     @@ -141,6 +142,7 @@ do_create_spdx[vardeps] +=3D "\
>     =C2=A0 =C2=A0 =C2=A0SPDX_PROFILES \
>     =C2=A0 =C2=A0 =C2=A0SPDX_NAMESPACE_PREFIX \
>     =C2=A0 =C2=A0 =C2=A0SPDX_UUID_NAMESPACE \
>     +=C2=A0 =C2=A0 SPDX_INCLUDE_VEX \
>     =C2=A0 =C2=A0 =C2=A0"
>
>     =C2=A0addtask do_create_spdx after \
>     @@ -164,6 +166,7 @@ do_create_spdx[cleandirs] =3D "${SPDXDEPLOY}
>     ${SPDXWORK}"
>     =C2=A0do_create_spdx[depends] +=3D " \
>     =C2=A0 =C2=A0 =C2=A0${PATCHDEPENDENCY} \
>     =C2=A0 =C2=A0 =C2=A0${@create_spdx_source_deps(d)} \
>     +=C2=A0 =C2=A0 ${@create_spdx_cve_check_deps(d)} \
>     =C2=A0"
>
>     =C2=A0python do_create_package_spdx() {
>     diff --git a/meta/classes/spdx-common.bbclass
>     b/meta/classes/spdx-common.bbclass
>     index 81ad4d3b7a..8918448c35 100644
>     --- a/meta/classes/spdx-common.bbclass
>     +++ b/meta/classes/spdx-common.bbclass
>     @@ -39,6 +39,17 @@ SPDX_CUSTOM_ANNOTATION_VARS ??=3D ""
>
>     =C2=A0SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
>
>     +def create_spdx_cve_check_deps(d):
>     +=C2=A0 =C2=A0 if (
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar("SPDX_INCLUDE_VEX") =3D=3D "a=
ll"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 and bb.data.inherits_class('cve-check'=
, d)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 and d.getVar("CVE_CHECK_FORMAT_JSON") =
=3D=3D "1"
>     +=C2=A0 =C2=A0 ):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =3D d.getVar('PN')
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return pn + ":do_cve_check"
>     +
>     +=C2=A0 =C2=A0 return ""
>     +
>     =C2=A0def create_spdx_source_deps(d):
>     =C2=A0 =C2=A0 =C2=A0import oe.spdx_common
>
>     diff --git a/meta/lib/oe/spdx30_tasks.py
>     <https://urldefense.com/v3/__http://spdx30_tasks.py__;!!AjveYdw8EvQ=
!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknU=
cJIVspDugHtuLZ34Lv4$>
>     b/meta/lib/oe/spdx30_tasks.py
>     <https://urldefense.com/v3/__http://spdx30_tasks.py__;!!AjveYdw8EvQ=
!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknU=
cJIVspDugHtuLZ34Lv4$>
>     index 9baa40887b..e8658e2c32 100644
>     --- a/meta/lib/oe/spdx30_tasks.py
>     <https://urldefense.com/v3/__http://spdx30_tasks.py__;!!AjveYdw8EvQ=
!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknU=
cJIVspDugHtuLZ34Lv4$>
>     +++ b/meta/lib/oe/spdx30_tasks.py
>     <https://urldefense.com/v3/__http://spdx30_tasks.py__;!!AjveYdw8EvQ=
!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknU=
cJIVspDugHtuLZ34Lv4$>
>     @@ -437,8 +437,33 @@ def set_purposes(d, element, *var_names,
>     force_purposes=3D[]):
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getattr(oe.spdx30.software_Softwa=
rePurpose, p) for p in
>     purposes[1:]
>     =C2=A0 =C2=A0 =C2=A0]
>
>     -def get_cves(d):
>     +def get_cves(d, include_vex):
>     =C2=A0 =C2=A0 =C2=A0cve_status =3D {}
>     +
>     +=C2=A0 =C2=A0 # Get CVEs from cve-check
>     +=C2=A0 =C2=A0 if (
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 include_vex =3D=3D "all"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 and bb.data.inherits_class('cve-check'=
, d)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 and d.getVar("CVE_CHECK_FORMAT_JSON") =
=3D=3D "1"
>     +=C2=A0 =C2=A0 ):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgfilepath =3D d.getVar("CVE_CHECK_RE=
CIPE_FILE_JSON")
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(pkgfilepath):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(pkgfilepath) a=
s j:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D j=
son.load(j)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 json_data =
=3D {"version":"1", "package": []}
>     + oe.cve_check.cve_check_merge_jsons(json_data, data)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for issue =
in json_data["package"][0].get("issue",
>     []):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cve =3D issue["id"]
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cve_status[cve] =3D {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 "mapping": issue["status"],
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 "detail": issue["detail"],
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 "description": issue.get("description", None)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cve_sta=
tus:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return cve_status
>     +
>     +=C2=A0 =C2=A0 # Get CVEs from recipe
>     =C2=A0 =C2=A0 =C2=A0patched_cves =3D oe.cve_check.get_patched_cves(=
d)
>     =C2=A0 =C2=A0 =C2=A0for cve, patched_cve in patched_cves.items():
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cve_status[cve] =3D {
>     @@ -498,7 +523,7 @@ def create_spdx(d):
>     =C2=A0 =C2=A0 =C2=A0# Add CVEs
>     =C2=A0 =C2=A0 =C2=A0cve_by_status =3D {}
>     =C2=A0 =C2=A0 =C2=A0if include_vex !=3D "none":
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_data =3D get_cves(d)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_data =3D get_cves(d, include_vex)
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for cve, decoded_status in cve_da=
ta.items():
>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# If this CVE is fi=
xed upstream, skip it unless all
>     CVEs are
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#209575):
>     https://lists.openembedded.org/g/openembedded-core/message/209575
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/209575__;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBBPS382u4hyJWn=
g7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDugHtuk4ftPno$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/110498417/5827677
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1104=
98417/5827677__;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6=
AdvoyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDugHtui3HwYFk$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVd=
Jf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDugHtuS3WltGM$>
>     [rybczynska@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------vzoCtGNcw5IZWMDbM90FiuC0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50F2afLu017247

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 1/14/25 00:51, Marta Rybczynska
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAApg2=3DQwE7Mo5rqcp_UK6X0VnS7h=
9Tv7AsroWpa8M2GgGVg-mw@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div>Hello,</div>
          <div>Thank you for this work. Could you explain your use case,
            why do you include all the entries in the image's SPDX?</div>
          <div><br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>The use case is `SPDX_INCLUDE_VEX =3D &quot;all&quot;` + cve-check=
, according
      to SPDX_INCLUDE_VEX[doc]</p>
    <p>&nbsp;&nbsp;&nbsp; Set&nbsp; to 'all' to get <b>all known historic=
al vulnerabilities</b>,
      including those already fixed upstream, if cve_check is inherited,
      set to 'all'&nbsp; to get all known historical vulnerabilities from=
 <b>cve
        check result</b> (warning: This can be large and slow).&quot;</p>
    <p>Currently cve-check is the only way that I find to get all known
      vulnerabilities from remote database<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAApg2=3DQwE7Mo5rqcp_UK6X0VnS7h=
9Tv7AsroWpa8M2GgGVg-mw@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div>
          </div>
          <div>I'm asking, because that SPDX file will be out of date
            quite rapidly, probably in 24h. Without updating it with the
            new data, it can be even misleading. How do you address this
            issue?<br>
          </div>
          <div><br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>The feature is not enable by default, it requires to explicitly
      set SPDX_INCLUDE_VEX =3D &quot;all&quot; and INHERIT +=3D &quot;cve=
-check&quot;,</p>
    <p>If user decides to use this feature, he/she will know the
      timeliness of data from cve-check<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAApg2=3DQwE7Mo5rqcp_UK6X0VnS7h=
9Tv7AsroWpa8M2GgGVg-mw@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div>
          </div>
          <div>I also notice that this patch adds a dependency of SPDX
            on cve-check. We have been trying to avoid this for a long
            time. This may be a discussion to have.</div>
          <div><br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>The dependency of SPDX on cve-check is also controlled by
      `SPDX_INCLUDE_VEX =3D &quot;all&quot;` + cve-check</p>
    <p>which means it does not affect normal build<br>
    </p>
    <p>//Hongxu</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAApg2=3DQwE7Mo5rqcp_UK6X0VnS7h=
9Tv7AsroWpa8M2GgGVg-mw@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div>
          </div>
          <div>Kind regards,</div>
          <div>Marta<br>
          </div>
        </div>
        <br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 8, 2025 at
            4:47=E2=80=AFPM hongxu via <a href=3D"https://urldefense.com/=
v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBBPS382=
u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDugHtuWyIErJ8$" m=
oz-do-not-send=3D"true">
              lists.openembedded.org</a> &lt;hongxu.jia=3D<a href=3D"mail=
to:eng.windriver.com@lists.openembedded.org" moz-do-not-send=3D"true" cla=
ss=3D"moz-txt-link-freetext">eng.windriver.com@lists.openembedded.org</a>=
&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            Originally, SPDX 3.0 added CVEs from CVE patch and
            CVE_STATUS<br>
            in recipe, this commit adds CVEs cve-ckeck results that is<br=
>
            generated from NVD CVE database<br>
            <br>
            Enable it by inheriting cve_check and setting
            'SPDX_INCLUDE_VEX =3D &quot;all&quot;'<br>
            otherwise still added CVEs from CVE patch and CVE_STATUS as
            usual<br>
            <br>
            $ echo 'INHERIT +=3D &quot;cve-check&quot;' &gt;&gt; conf/loc=
al.conf<br>
            $ echo 'SPDX_INCLUDE_VEX =3D &quot;all&quot;' &gt;&gt; conf/l=
ocal.conf<br>
            $ bitbake glibc<br>
            WARNING: glibc-2.40+git-r0 do_cve_check: Found unpatched CVE
            (CVE-2010-4756)<br>
            <br>
            $ bitbake core-image-minimal<br>
            $ vim
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.spdx.js=
on<br>
            ...<br>
            &nbsp; &nbsp; {<br>
            &nbsp; &nbsp; &nbsp; &quot;type&quot;:
            &quot;security_VexAffectedVulnAssessmentRelationship&quot;,<b=
r>
            &nbsp; &nbsp; &nbsp; &quot;spdxId&quot;: &quot;<a href=3D"htt=
ps://urldefense.com/v3/__http://spdx.org/spdxdocs/glibc-086907e2-5516-563=
8-9df3-b3863651f374/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473=
ae4da277398/vex-affected/1ae2a2b94bac9bf0894b46b0c3194416__;!!AjveYdw8EvQ=
!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknU=
cJIVspDugHtu26Ckvwk$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-sen=
d=3D"true">http://spdx.org/spdxdocs/glibc-086907e2-5516-5638-9df3-b386365=
1f374/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/ve=
x-affected/1ae2a2b94bac9bf0894b46b0c3194416</a>&quot;,<br>
            &nbsp; &nbsp; &nbsp; &quot;creationInfo&quot;: &quot;_:Creati=
onInfo161&quot;,<br>
            &nbsp; &nbsp; &nbsp; &quot;from&quot;: &quot;<a href=3D"https=
://urldefense.com/v3/__http://spdx.org/spdxdocs/glibc-086907e2-5516-5638-=
9df3-b3863651f374/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae=
4da277398/vulnerability/CVE-2010-4756__;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBBPS=
382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDugHtudNLs_Pc$=
" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">http://sp=
dx.org/spdxdocs/glibc-086907e2-5516-5638-9df3-b3863651f374/df3a653fe6624a=
017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/vulnerability/CVE-2010=
-4756</a>&quot;,<br>
            &nbsp; &nbsp; &nbsp; &quot;relationshipType&quot;: &quot;affe=
cts&quot;,<br>
            &nbsp; &nbsp; &nbsp; &quot;to&quot;: [<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &quot;<a href=3D"https://urldefen=
se.com/v3/__http://spdx.org/spdxdocs/glibc-086907e2-5516-5638-9df3-b38636=
51f374/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/p=
ackage/libc6__;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6A=
dvoyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDugHtu9bfpovc$" rel=3D"noreferrer" targ=
et=3D"_blank" moz-do-not-send=3D"true">http://spdx.org/spdxdocs/glibc-086=
907e2-5516-5638-9df3-b3863651f374/df3a653fe6624a017aa75a75ba8cff1c3d0c609=
3c4bf8b05d1473ae4da277398/package/libc6</a>&quot;<br>
            &nbsp; &nbsp; &nbsp; ],<br>
            &nbsp; &nbsp; &nbsp; &quot;security_vexVersion&quot;: &quot;1=
.0.0&quot;<br>
            &nbsp; &nbsp; },<br>
            ...<br>
            &nbsp; &nbsp; {<br>
            &nbsp; &nbsp; &nbsp; &quot;type&quot;: &quot;security_Vulnera=
bility&quot;,<br>
            &nbsp; &nbsp; &nbsp; &quot;spdxId&quot;: &quot;<a href=3D"htt=
ps://urldefense.com/v3/__http://spdx.org/spdxdocs/glibc-086907e2-5516-563=
8-9df3-b3863651f374/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473=
ae4da277398/vulnerability/CVE-2010-4756__;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBB=
PS382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDugHtudNLs_P=
c$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">http://=
spdx.org/spdxdocs/glibc-086907e2-5516-5638-9df3-b3863651f374/df3a653fe662=
4a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/vulnerability/CVE-20=
10-4756</a>&quot;,<br>
            &nbsp; &nbsp; &nbsp; &quot;creationInfo&quot;: &quot;_:Creati=
onInfo263&quot;,<br>
            &nbsp; &nbsp; &nbsp; &quot;externalIdentifier&quot;: [<br>
            &nbsp; &nbsp; &nbsp; &nbsp; {<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;type&quot;: &quot;Ex=
ternalIdentifier&quot;,<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;externalIdentifierTy=
pe&quot;: &quot;cve&quot;,<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;identifier&quot;: &q=
uot;CVE-2010-4756&quot;,<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;identifierLocator&qu=
ot;: [<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<a href=3D"ht=
tps://urldefense.com/v3/__https://cveawg.mitre.org/api/cve/CVE-2010-4756_=
_;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DN=
BiSHVgC4O7GOknUcJIVspDugHtu8J_rMIU$" rel=3D"noreferrer" target=3D"_blank"=
 moz-do-not-send=3D"true">https://cveawg.mitre.org/api/cve/CVE-2010-4756<=
/a>&quot;,<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<a href=3D"ht=
tps://urldefense.com/v3/__https://www.cve.org/CVERecord?id=3DCVE-2010-475=
6__;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-=
DNBiSHVgC4O7GOknUcJIVspDugHtuOtsvn3Y$" rel=3D"noreferrer" target=3D"_blan=
k" moz-do-not-send=3D"true">https://www.cve.org/CVERecord?id=3DCVE-2010-4=
756</a>&quot;<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ]<br>
            &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            &nbsp; &nbsp; &nbsp; ]<br>
            &nbsp; &nbsp; },<br>
            ...<br>
            <br>
            Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@wi=
ndriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-=
link-freetext">hongxu.jia@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;meta/classes/create-spdx-3.0.bbclass |&nbsp; 7 +++++--<=
br>
            &nbsp;meta/classes/spdx-common.bbclass&nbsp; &nbsp; &nbsp;| 1=
1 +++++++++++<br>
            &nbsp;meta/lib/oe/<a href=3D"https://urldefense.com/v3/__http=
://spdx30_tasks.py__;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVd=
Jf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDugHtuLZ34Lv4$" moz-do-not-send=3D=
"true">spdx30_tasks.py</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 29
            ++++++++++++++++++++++++++--<br>
            &nbsp;3 files changed, 43 insertions(+), 4 deletions(-)<br>
            <br>
            diff --git a/meta/classes/create-spdx-3.0.bbclass
            b/meta/classes/create-spdx-3.0.bbclass<br>
            index 25f3aa5f43..e3d6f95e3d 100644<br>
            --- a/meta/classes/create-spdx-3.0.bbclass<br>
            +++ b/meta/classes/create-spdx-3.0.bbclass<br>
            @@ -42,8 +42,9 @@ SPDX_INCLUDE_VEX[doc] =3D &quot;Controls wh=
at VEX
            information is in the output. Set to<br>
            &nbsp; &nbsp; &nbsp;'none' to disable all VEX data. Set to 'c=
urrent' to
            only include VEX data \<br>
            &nbsp; &nbsp; &nbsp;for vulnerabilities not already fixed in =
the upstream
            source code \<br>
            &nbsp; &nbsp; &nbsp;(recommended). Set&nbsp; to 'all' to get =
all known
            historical vulnerabilities, \<br>
            -&nbsp; &nbsp; including those already fixed upstream (warnin=
g: This
            can be large and \<br>
            -&nbsp; &nbsp; slow).&quot;<br>
            +&nbsp; &nbsp; including those already fixed upstream, if cve=
_check is
            inherited, set to 'all' \<br>
            +&nbsp; &nbsp; to get all known historical vulnerabilities fr=
om cve
            check result \<br>
            +&nbsp; &nbsp; (warning: This can be large and slow).&quot;<b=
r>
            <br>
            &nbsp;SPDX_INCLUDE_TIMESTAMPS ?=3D &quot;0&quot;<br>
            &nbsp;SPDX_INCLUDE_TIMESTAMPS[doc] =3D &quot;Include time sta=
mps in SPDX
            output. This is \<br>
            @@ -141,6 +142,7 @@ do_create_spdx[vardeps] +=3D &quot;\<br>
            &nbsp; &nbsp; &nbsp;SPDX_PROFILES \<br>
            &nbsp; &nbsp; &nbsp;SPDX_NAMESPACE_PREFIX \<br>
            &nbsp; &nbsp; &nbsp;SPDX_UUID_NAMESPACE \<br>
            +&nbsp; &nbsp; SPDX_INCLUDE_VEX \<br>
            &nbsp; &nbsp; &nbsp;&quot;<br>
            <br>
            &nbsp;addtask do_create_spdx after \<br>
            @@ -164,6 +166,7 @@ do_create_spdx[cleandirs] =3D
            &quot;${SPDXDEPLOY} ${SPDXWORK}&quot;<br>
            &nbsp;do_create_spdx[depends] +=3D &quot; \<br>
            &nbsp; &nbsp; &nbsp;${PATCHDEPENDENCY} \<br>
            &nbsp; &nbsp; &nbsp;${@create_spdx_source_deps(d)} \<br>
            +&nbsp; &nbsp; ${@create_spdx_cve_check_deps(d)} \<br>
            &nbsp;&quot;<br>
            <br>
            &nbsp;python do_create_package_spdx() {<br>
            diff --git a/meta/classes/spdx-common.bbclass
            b/meta/classes/spdx-common.bbclass<br>
            index 81ad4d3b7a..8918448c35 100644<br>
            --- a/meta/classes/spdx-common.bbclass<br>
            +++ b/meta/classes/spdx-common.bbclass<br>
            @@ -39,6 +39,17 @@ SPDX_CUSTOM_ANNOTATION_VARS ??=3D &quot;&q=
uot;<br>
            <br>
            &nbsp;SPDX_MULTILIB_SSTATE_ARCHS ??=3D &quot;${SSTATE_ARCHS}&=
quot;<br>
            <br>
            +def create_spdx_cve_check_deps(d):<br>
            +&nbsp; &nbsp; if (<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; d.getVar(&quot;SPDX_INCLUDE_VEX&=
quot;) =3D=3D &quot;all&quot;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; and bb.data.inherits_class('cve-=
check', d)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; and d.getVar(&quot;CVE_CHECK_FOR=
MAT_JSON&quot;) =3D=3D &quot;1&quot;<br>
            +&nbsp; &nbsp; ):<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; pn =3D d.getVar('PN')<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; return pn + &quot;:do_cve_check&=
quot;<br>
            +<br>
            +&nbsp; &nbsp; return &quot;&quot;<br>
            +<br>
            &nbsp;def create_spdx_source_deps(d):<br>
            &nbsp; &nbsp; &nbsp;import oe.spdx_common<br>
            <br>
            diff --git a/meta/lib/oe/<a href=3D"https://urldefense.com/v3=
/__http://spdx30_tasks.py__;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBBPS382u4hyJWng7=
YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDugHtuLZ34Lv4$" moz-do-not=
-send=3D"true">spdx30_tasks.py</a> b/meta/lib/oe/<a href=3D"https://urlde=
fense.com/v3/__http://spdx30_tasks.py__;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBBPS=
382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDugHtuLZ34Lv4$=
" moz-do-not-send=3D"true">spdx30_tasks.py</a><br>
            index 9baa40887b..e8658e2c32 100644<br>
            --- a/meta/lib/oe/<a href=3D"https://urldefense.com/v3/__http=
://spdx30_tasks.py__;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVd=
Jf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDugHtuLZ34Lv4$" moz-do-not-send=3D=
"true">spdx30_tasks.py</a><br>
            +++ b/meta/lib/oe/<a href=3D"https://urldefense.com/v3/__http=
://spdx30_tasks.py__;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVd=
Jf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDugHtuLZ34Lv4$" moz-do-not-send=3D=
"true">spdx30_tasks.py</a><br>
            @@ -437,8 +437,33 @@ def set_purposes(d, element,
            *var_names, force_purposes=3D[]):<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;getattr(oe.spdx30.software_=
SoftwarePurpose, p) for
            p in purposes[1:]<br>
            &nbsp; &nbsp; &nbsp;]<br>
            <br>
            -def get_cves(d):<br>
            +def get_cves(d, include_vex):<br>
            &nbsp; &nbsp; &nbsp;cve_status =3D {}<br>
            +<br>
            +&nbsp; &nbsp; # Get CVEs from cve-check<br>
            +&nbsp; &nbsp; if (<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; include_vex =3D=3D &quot;all&quo=
t;<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; and bb.data.inherits_class('cve-=
check', d)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; and d.getVar(&quot;CVE_CHECK_FOR=
MAT_JSON&quot;) =3D=3D &quot;1&quot;<br>
            +&nbsp; &nbsp; ):<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; pkgfilepath =3D
            d.getVar(&quot;CVE_CHECK_RECIPE_FILE_JSON&quot;)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; if os.path.exists(pkgfilepath):<=
br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; with open(pkgfilep=
ath) as j:<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; data=
 =3D json.load(j)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; json=
_data =3D {&quot;version&quot;:&quot;1&quot;, &quot;package&quot;: []}<br=
>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            oe.cve_check.cve_check_merge_jsons(json_data, data)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for =
issue in
            json_data[&quot;package&quot;][0].get(&quot;issue&quot;, []):=
<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; cve =3D issue[&quot;id&quot;]<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; cve_status[cve] =3D {<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &quot;mapping&quot;: issue[&quot;status&quot;],<b=
r>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &quot;detail&quot;: issue[&quot;detail&quot;],<br=
>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &quot;description&quot;:
            issue.get(&quot;description&quot;, None)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; }<br>
            +<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if c=
ve_status:<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; return cve_status<br>
            +<br>
            +&nbsp; &nbsp; # Get CVEs from recipe<br>
            &nbsp; &nbsp; &nbsp;patched_cves =3D oe.cve_check.get_patched=
_cves(d)<br>
            &nbsp; &nbsp; &nbsp;for cve, patched_cve in patched_cves.item=
s():<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cve_status[cve] =3D {<br>
            @@ -498,7 +523,7 @@ def create_spdx(d):<br>
            &nbsp; &nbsp; &nbsp;# Add CVEs<br>
            &nbsp; &nbsp; &nbsp;cve_by_status =3D {}<br>
            &nbsp; &nbsp; &nbsp;if include_vex !=3D &quot;none&quot;:<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; cve_data =3D get_cves(d)<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; cve_data =3D get_cves(d, include=
_vex)<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for cve, decoded_status in =
cve_data.items():<br>
            <br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;# If this CVE=
 is fixed upstream, skip it unless
            all CVEs are<br>
            -- <br>
            2.34.1<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#209575): <a href=3D"https://urldefense.co=
m/v3/__https://lists.openembedded.org/g/openembedded-core/message/209575_=
_;!!AjveYdw8EvQ!a0TdTsiZuoyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DN=
BiSHVgC4O7GOknUcJIVspDugHtuk4ftPno$" rel=3D"noreferrer" target=3D"_blank"=
 moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/message/209575</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/mt/110498417/5827677__;!!AjveYdw8EvQ!a0TdTsiZuo=
yIgAIBBPS382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDugHt=
ui3HwYFk$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
              https://lists.openembedded.org/mt/110498417/5827677</a><br>
            Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
              openembedded-core+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!a0TdTsiZu=
oyIgAIBBPS382u4hyJWng7YkhuLVdJf9J6AdvoyPVoPGz-DNBiSHVgC4O7GOknUcJIVspDugH=
tuS3WltGM$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>
              https://lists.openembedded.org/g/openembedded-core/unsub</a=
>
            [<a href=3D"mailto:rybczynska@gmail.com" target=3D"_blank" mo=
z-do-not-send=3D"true" class=3D"moz-txt-link-freetext">rybczynska@gmail.c=
om</a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------vzoCtGNcw5IZWMDbM90FiuC0--

