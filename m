Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDE4C4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 04:16:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6757.1784261775060230895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 21:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dAImEl4V;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=16584d870a=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H3s07L381918
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 04:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Z1Uq2rGbeAUbJoY37gK9LQ/NgJqhdfri9gwldl/rt2M=; b=
	dAImEl4VP+Jtwzd2EK2/iIHkF5QDYo70aKc7cpdSdh6lxkvrs+KKX1FewGkuhFY+
	weOTNskWrLGdZwtKd8gt3iVDnqQCEqmqCCtHcXJdtqc9ocR8gHAoB5Y9m1AaHb4l
	GZT7N21bdcgLxKPIJstAcSox3EPP+XrRDGsgsk8e1nmuDHFlvVRLBoNvnJg63FEY
	U6MIahf/KDkoEALmQupCn8zRt4ibOd3cOQf1fOsVQAjNdKXE30dEvj1yKmUDU91A
	R/xoyZlrg5kPdQaEha04SZl0UomyVEB0IpGlz46wuYrd7dI+yRCanvp06pSrsX21
	ZIlZafP/PG1wOGRxTxzwzA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012055.outbound.protection.outlook.com [40.93.195.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbcpn9ecc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 04:16:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBnRfsN22b0CPWa/Yt0FPmarjQx3v5xSPb2MAYFGRkKVkwMycacKrEog8gif6yinioay6KWtcilRBmfsZkB8fJVDVAiVBcjVJ1xMHXw8Fd/t8TsZ6bBZWbcoedmCGSOX6CQzfP15uQejsNddkGoy3RkMut5hPVxYMF8DYaejTtrI3kfGMxVijbRDuYLZEitWUCV7pMKPRqggmd7Y4VFXKaoU8K5kKVJ8yOQiyXBBjQ+Slzh6e0q6G+RZZs46d3+MTat/JAF+exGSFU/l4/UIOSqF1L5yCK5BjEAUgTfYBxfJ4rUM0Ou3xB4jfwI67//4FC5wdIOhUO+ZC7AgARV7Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1Uq2rGbeAUbJoY37gK9LQ/NgJqhdfri9gwldl/rt2M=;
 b=LoAJzwScZAQZW0TgNr/rlXz2EMH+Ohqk0TwKWuzXgUQ0vFJrrWQOZgQn3TIjwsLHFq4Zo2Q6mXR+5gJ/wzK+eHBik89uvMwMWtt4RSO/DRrXnr7VqyzBQzq+aXaufpiZn/TiCZLFyBH7zuC0JrnMaDlRh7gZjtmEUTtILH7ql4cTkvs3RBa0TLhpwEiPaLlDmAEN/8V9APjfV7cFg6pm0ZUAXexQhSH6zMeKqNWFbgFdguEvIvCZmF+/pq1/TMIIwGA6nDrC2FXK+AWiICaZtybmfsAX+QJeWZu5BrhBGyTu5C01bl/9DcZdpCUpcjp5VEiRZQGjLmbHAwuT5D6Xpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 04:16:10 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 04:16:10 +0000
Message-ID: <43b49588-ede9-4ff9-94ec-4300c204adf5@windriver.com>
Date: Fri, 17 Jul 2026 09:46:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.96.1 -> 1.97.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com
References: <20260713085833.3698049-1-sundeep.kokkonda@windriver.com>
 <CANNYZj8Lix=D0ShKrd=YDbkqKqgtn1ZWdV19L8gYVp3F9Yv9rA@mail.gmail.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <CANNYZj8Lix=D0ShKrd=YDbkqKqgtn1ZWdV19L8gYVp3F9Yv9rA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::12) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|SA2PR11MB5177:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df36d74-2f15-49a7-710b-08dee3ba2134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|23010399003|10070799003|366016|1800799024|6133799003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	F8gUaNmyUFLd5FgxFIpcjkffIW3QN8pSB4XNX5LK7f1v1hixa9IIypzELFOZFolnz/3Rd/fmm6J2vhyCekxy+ApHdFOBGOW56G5dGbJDVgepqKxvZWkryrnQepmxjVtDopCwtACssZg3qV9j2e7eq6JMzw5o5m295GVc50z6PfVyfJ/wCzLayT3u6h3o8LAqhrESvEUFrhMB7M3xSwfyy/jD3+bZemByI2YHcMLMufE38Mn+QT+aiSJXoy4wmwD9/cEmYuZeE9N5PsDvXLvWqh+zLSgD6EGs92YGUBron7tiMZWMBRA3WcER1YgzcYc8H8dgV155fjFQZY+5fGgb65TyU0l3TSd+R0ByEDkZNBd0nkhYZC2d0c6xmLGoGaplAJogGKIUy8R4SH950F80W5Y/PUjWSGaNoS3At697hwrmITlcgZnqsHWsTt+ymepeNW3Wcmlw9T8CoNwpqxZrn/XJln0e5emLCvyBoHki5bOV9sihx25Ht+kF0Eqg4iCndfgkqOzG8xXdLHJHYxW8ixdWUt0tO1Y9Yt0qX9u8UtTeHagEQXHPqJaisDpgOj7Z+gygvLg5Tx+tqQ67XzuntrogPDwtZcW1VYoizBiixYPyL4e1A/J+mvRh3XahBmQCcUFl1dsmAxSnJDeAPjXjJqlRD/KC0PtMhUHnEPhjvJY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(10070799003)(366016)(1800799024)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YmtJeVhTNnR1bFovODhYMnVIaFhSWUZrbklqbVFJemo3aW9ITVpSL2k4TWlr?=
 =?utf-8?B?T2V4YXFEUkhJdHFvM1poM1BUbGMveEtSYUdPNDRMS2N1c0lSQ1hTWkJIbHFX?=
 =?utf-8?B?NXJjS1pCWWQrVlM2eWRRSkFvbDA5ZWY5UXBGOGVkT0NPTkRMcTRTa0hHYkFt?=
 =?utf-8?B?M2JIdVd4TE9wOFYwS3RNSVo3V1FhUlROMmkzRlZCc2xRSnFSb05XUEp3ZWpV?=
 =?utf-8?B?YlhkRTJTTDl4bldzSXFkVHB4SURRRFlIYjNzQnZ2b0tZem11YSt0N1lTNm5o?=
 =?utf-8?B?QVhRaEt3Nk9jWXM3dVZjRUZBZXRxRFRrMWhWY3FzNHVJNmZrUjVFbFVHeklU?=
 =?utf-8?B?aU00NkZQWGgrY0ViNCtQYWdDUUh0emlUNCtIcnY5dldPL0VTVzMrMFNoV0M2?=
 =?utf-8?B?WU5GUmZSRHl1OGtkdXZtOXF4VTQrMUtmUENqTGFsT29uRmo4U2NXUkttbVBP?=
 =?utf-8?B?ZHBNMFE3ZmtJbmxFSmRHM2NFQ3cyaGV4UlQya1BJMVRmQU1ncmZuRUd5eXFU?=
 =?utf-8?B?VDF4TG12Ti9RVUZKZDVOaEUzVEZRdEc1Tmw5MGFmVGFoUVFmZno2d0lJTW1M?=
 =?utf-8?B?emo5NGoyTy9UVGovMEJXdFpLbithRnJBVlYvdmZVeUtjZ0FWZFRjcVB2Vkla?=
 =?utf-8?B?NHpHanp0S3lqbGZLRlpIT2RmdWJXRmgxcWlmRStVek9qRjREKzhqeGFsWnRL?=
 =?utf-8?B?c2lZMWk0YUZldFppdjhuWWVjbUVwTmFWSDZjYko3cVhKUXlGVmova0lGVnZj?=
 =?utf-8?B?WjNhbitvbnhTU1RRdit3VndSZW1PdFlWTGFWZ0xWMkw1WEZBeE1rTkJ2MzBp?=
 =?utf-8?B?RkN0aWU4S1JYWXlXOHZkZGtqdlFLVklTSXVBdFBkcTd3VDBtaDRITmRyNlNX?=
 =?utf-8?B?WFIyWVNIRTlab2dHTW9JMjJlWjh6OFhsRkxYMkdybU1wYURkVnM2OUxSL1Z5?=
 =?utf-8?B?b1BtTXdGOTBJYkhJajlXZ05zR3FqNVliZUdiTXBQRlFaLzNDVUFLcHJpUllw?=
 =?utf-8?B?b0lHaEdVUDNwcXB0VDdmMUtJVGYrNmVwV3hZeWh2MlJndmV0eHk5emxKeTNI?=
 =?utf-8?B?K0lnN1loUlVZdWpVekUwbkZxTGVTbE5NbTlyQTNyQWJ2QzJ2S3lPT1p5ZWU0?=
 =?utf-8?B?TVJkeDVjWTlxZ3N1THZ2dVc4akhybHRNVXV0UGI4Y3NmK0Evb2wwWVJjcnNL?=
 =?utf-8?B?T2FCaEhWaEx6bHFIMzRJeXVqbTR6UXZIbVpwSGtBUisyVW81OG9HaWpDazhk?=
 =?utf-8?B?NENjbmhVNm1vWlE5QXFnR1NQcXEwRTZNTE1NQkI3WEI0SWtIaVJ1b1djYytn?=
 =?utf-8?B?WUs4eFNISHhqUUx5czExN25rNHplLzhOWkJwK0VhZHJHN21kbC9URVN0eGJP?=
 =?utf-8?B?blhjdngrSnJWS2ZEM1R2SlpheHVkTGVuNlEvNzYwQ05ZWktxTEpJZG9WVVFY?=
 =?utf-8?B?MXZucTNOMml4K3NNeXM2RzBFV0prS1ZvR3FhcEFtYnEyMDcwWWJ1ZUhtT2pu?=
 =?utf-8?B?QTRRWUdJK0JZZlpuUE9GNm9UVW5WL0hXOXhkYTBCcUY1M2dxUkdWS3dwQlh5?=
 =?utf-8?B?d0JKOU9TVWpZVGhsUWlCejlpVnRaNEhhY2NaYzRBNi9qTlVsdnNVeDdQZXpH?=
 =?utf-8?B?aEVkdk94Wk9uUlEzYkViTFBiSUVOL3UvL3RUaTdSTmR6UU5xWmcycUpWRHRu?=
 =?utf-8?B?Z0tiQ1RiNlRsU3g1NCtEWEpJQUlHSW1aQmhXRXJ2a3RjN0lIWFBvNS9qcDA0?=
 =?utf-8?B?aXgrdzJXZXhnM3NjV0ltT1Z6K29lQmQ1YnRxODhZMmI2Vnh6dFlzR1QzaDBW?=
 =?utf-8?B?UWhQNjNRVkkvNHdEZWV5VlR3V0xkZzVuTERBK05mZFM0RVBmOUJWN2JJcVhZ?=
 =?utf-8?B?VUY1Y3k5N002WDMwMmQyNzFNbHU1ZDhqS2NLSTQ5UUdCSFYwUkM1d2tSWFZD?=
 =?utf-8?B?clBxK2hvWWZaUjhHUUVDU3VERlB3MERqQy9hRDJuQWhTVEoyTGYzZGZYc3No?=
 =?utf-8?B?U0FmMGVUUzg4SnBnTGxXRE4wc2JnaFppTmNZYXZRSDlIMHJNOXdSTFdpZXZy?=
 =?utf-8?B?WXlGdjVOenhPL2NRQTFrNmZGK0FYTHcwSlJNNnV0anQzNWp1c2gzeEp2RXBz?=
 =?utf-8?B?TTFOcmlPSE10aXNRQVl1T3ZoR2FWc1Z5eU9NZERyNitmWVk1bVRYNzJrb20r?=
 =?utf-8?B?Z3pWYXRMUVVmTE9YRG51Z3NyQXpjald5dEVPbDk3dm9BSHJ2Um0wV1VVbTBO?=
 =?utf-8?B?WmpJV3hpZGhDT3ZLdDhjZVpwdXMrMUVjbzJXV3dmenpQdzBwMmhQR0RQUEpj?=
 =?utf-8?B?Wkx4RXpBbjlSQmZRcEhxenlmMERzSWg1cGp4SEpPRXNrMW8yM2dnVDZsdklI?=
 =?utf-8?Q?8OtUbLQkv125KSm45sKAGtvYPOS5/pNnRroYYwY8t+9jq?=
X-MS-Exchange-AntiSpam-MessageData-1: NN91q2jd9QMgjcnGI7IMVIaXm8a/TBqNsFg=
X-Exchange-RoutingPolicyChecked: 
	swFC3DA0GDobpkKa1rhPLdCZ7YhyKxhFJ/y/3LE0Wd7lFbZ32QWpd5pbnJ3krKXNNEwzoi3BRFxAvFDOP4Aq8rjheEtUHYSivg8DZHZWGxPR8GhQ9p+OJbFzW7uK0E1knyctLXaBzTA9DtIWAWk96nxkPuWU1wLbjhgRv7WTBxat8z2iXCqbwqY0OX6CIryXm7grpwrtMG7uX7u6L+oyPYnBt6sc8DCpLt3pXzA+b/Dfp15zXsC3+QgG0nj+CTJXFWiZmZfOLVxhciYU0M9+dqx4Xzpe7qiv/EmbUWwRCaHplVqqIIOJnz5da8BV0wawKoC+g12gw4Ny5wKfVJBmFw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df36d74-2f15-49a7-710b-08dee3ba2134
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 04:16:09.9374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLGhsNiEKYGzM6jKpr9e/AiFhBelaI4ZTw74Tlcjwrlf3jUutvpTw9AtAX0/58J6cqwUZ8l027JO+3z7pb7Xi04RuqXq9USGoRGfbtUYUmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzNyBTYWx0ZWRfX+sAiMYSOeA2v
 9GkdkdGJoSHdXArBHlDjWmAcC9PCHiDGOZnisuKdWr4TMfLYzgOnzh78nbvDT3M7KNXClY06h/7
 wtisSRbu2J5FD/EcwBRkn/Q5+/0/7uwVmVmw+Foy5IPreAoB9UG6lH4zlauG7udTDFKC61QfV8q
 XFU8JgUuJfCPTgVdsF4ziMVJiL71uzFPdyFVC62d5OSxGBS7NporklWff/s6rmLIpcGu5fZQTif
 E+0LXVsspFcmOoI4OIBf/uKwAAL089pQdYCCYswl6Hha0q7C+Dy0xA+wfjGsA4wqeCudlQQG0jb
 RBRxp2AjX+aI3qwsP/OU/qNiWsSqsuWq4WwKzuO+oYnJhW2/dp3DHsv1WicCmXAG3eq5bfYFzxU
 2opMrGVXxWzNkbAzn9YSccON1wusa4ClRlKJzWPhg4QDiKK1LN+myLoo2xAzRzvm2015FoYTDlf
 inyVhF8KZk4yQ24NLYw==
X-Proofpoint-GUID: wW2A7hMORiaxURhvwEhkcYGahA92V1j9
X-Proofpoint-ORIG-GUID: 7BYqPvQEPneoJO3tjvwDSEyNYb0EfjZT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzNyBTYWx0ZWRfX19TgoI3jFCCN
 0TDByV/v1+ktFCNjEww4PU34q/bD/5JdQ0yQEkG21az+rKjm7sL1tTunfmtX/2746JiaNwwpRSQ
 fdhaCP3rshn2HIFit4pviSKvifPotPZUJO0Ja14TvBG1JMwdC1pQ
X-Authority-Analysis: v=2.4 cv=JNsLdcKb c=1 sm=1 tr=0 ts=6a59ac8d cx=c_pps
 a=QXY2dPTpL+Q+r2h5MCHSUA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=Q4-j1AaZAAAA:8 a=YQXIVJHrjVntocc1rmwA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 04:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241114


On 7/16/2026 3:41 PM, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon, 13 Jul 2026 at 10:59, Sundeep KOKKONDA via
> lists.openembedded.org
> <sundeep.kokkonda=windriver.com@lists.openembedded.org> wrote:
>> 0003-tests-assembly-llvm-issue-141649-fix-expected-stack.patch
>>    Fix expected stack allocation size for aarch64 with LLVM 22.1.8.
>>    LLVM 22.1.8 optimizes non-overlapping scope stack reuse more
>>    aggressively (32 bytes instead of 48). This test is new in 1.97.0
>>    and was validated against bundled LLVM 22.1.6.
>> +++ b/meta/recipes-devtools/rust/files/0003-tests-assembly-llvm-issue-141649-fix-expected-stack.patch
>> @@ -0,0 +1,28 @@
>> +tests/assembly-llvm/issue-141649: fix expected stack size for
>> + aarch64 with LLVM 22.1.8
>> +
>> +LLVM 22.1.8 optimizes stack allocation more aggressively for
>> +non-overlapping scopes on aarch64. For scoped_two_small_structs,
>> +it produces 'sub sp, sp, #32' instead of #48, because 2 non-overlapping
>> +16-byte structs can share a 32-byte allocation. The three-struct version
>> +still requires #48.
>> +
>> +Upstream-Status: Inappropriate [OE-specific, LLVM version difference]
> Hello Sundeep,
>
> the update is okay, except this patch's commit message: it should have
> an explanation of if/when the patch can be removed, and/or an upstream
> ticket that notifies upstream of the issue. These things are generally
> expected of 'Inappropriate' patches.

Hello Alex,

There a bugfix release 1.97.1. We will be sending that upgrade and this 
will be fixed there.


Thanks,

Sundeep K.

>
> Alex

