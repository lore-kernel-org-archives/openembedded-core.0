Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5075DCAC5A7
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 06:45:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.45584.1758523549208912564
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Sep 2025 23:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hseTl2dx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13607bc8d8=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58M5cLLR3514256
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 06:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=MeFmlcVkEygmZniKKNSnX081qSfwt48xZyzemi3n7II=; b=hseTl2dxxTbs
	+BTDWFPdm/ptZMEn77kdITmGWYNTEtfYzT6eJAn/p4BQ25m3G7PpE8dPmEoxyK7a
	XskGIe23DZFzWe+P7io+I+54DpnwKilReQipgJvFLCKuNQUTYEqXL+htmcg6NPrQ
	y1baANd/Bgzzda06pT6eojPFCWmhBl4xL1Cv11CaUxbu6cgxK8HQ6Bfm2NZNUN2Y
	T9dgQwvkP+X2oopqHskmaVAOEJKE0bzCCrfEE5unHe6UFUdwJBx8wGPsdjw3+gLZ
	vqkebsYo7/eibWUVTMzuF6HTuQ0oLv1NpxoLk7/7sVW+1F0RaXVID2Hh3bN6Btnp
	8Zeob+DpVg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012038.outbound.protection.outlook.com [40.107.200.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499k899eks-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 06:45:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9I17BjoppNLnRcvb5xS2Z/dKzSF5ATN5DfWt9PMkVKLZzqSKPEXUDYWe5TCz2KsxY6S0/S1I5juA5rjqx4/BcmPP3UL5TUXtTJXugq3PSeXncbDbURy8TRQ8EcOlyjzG1oGuHbfv3QCKiyaGGFwiKyUTfJCLqM3EWy9Uojks3XXdEvyY4SIHwIOLW+qXon2MSWAiffBGEwInd5ZXiTyP7PT+GTjoMRH0fEkChKXb833o/UXz8qvbTQHmYovjUUjuCSRrlmmPnqfFiGWz8Ius93v3j1JAs7lnKpWPmHEM4hF3R+RXjjmtLgxXvXx8AJKG+XEgaabt3yAuviHHaPicg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeFmlcVkEygmZniKKNSnX081qSfwt48xZyzemi3n7II=;
 b=ZxECyroAzWCp2wO2rMCepojjwm3RVnSB0GzS5SMPmZFfv5GJnTN+HJ3aCDMEBM7nWOCCE2GpVrcBloQRQbc49jI5wf04eorA7gNey/QZKcZgYHT4s5DKgnTviFvju34SBT6KBlRj93uFNtJCICh9s/26k4LzSDLHYVBeqq0J583HzVZrQf0RtmGRz5u9kVe8wTM/b2Usebqxzav0PbCsf3HNSScgaYrRvuf5HBQC9BwGhiJK6YIWXDja9kogsmVeyroNbbPmJ+wvbCoolLYRT4g8zK7bwJN6T/skXMRNGDNmmBbyHMzBktG5kNDq56whztEgc72kdJVDHZyHvRUKeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by PH0PR11MB5093.namprd11.prod.outlook.com (2603:10b6:510:3e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 06:45:45 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 06:45:45 +0000
Message-ID: <bc51756c-a32f-432b-abae-024439e8b0fc@windriver.com>
Date: Mon, 22 Sep 2025 14:45:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 9/9] debug_build.inc: support disable debug
 build for specific recipe when DEBUG_BUILD is enabled globally
To: peter.kjellerstedt@axis.com,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <1865A7D84B34509F.11775@lists.openembedded.org>
 <20250919075536.1744673-1-hongxu.jia@windriver.com>
 <DB5PR02MB1021356EDD3D66E0803B0A4C6EF11A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <DB5PR02MB1021356EDD3D66E0803B0A4C6EF11A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0223.apcprd06.prod.outlook.com
 (2603:1096:4:68::31) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|PH0PR11MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e9abb5-92b6-4c10-0c26-08ddf9a3a7f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aUhHbEI5NWtHUStiZVZaLzVVTkJKS3BhdHhRK05Qa3VVR2J3dXJwam1wVVlQ?=
 =?utf-8?B?UmxoUjhza1FTc3QvdmphdW05SmRXeEpXNVJKd2RJVzlTN0dDMEVIUTJrT1k2?=
 =?utf-8?B?TnE5aTJKYWJ4dklkTTlVT3AzbXpFQkdCOHhHbExEejFLUlRGeG1ZandmNTBK?=
 =?utf-8?B?UldoOWgwa1haNjJYRnJOb3FKdTBEQzJNZzl0ZHJTc0xHRGFHejhSSWdSWFFw?=
 =?utf-8?B?cVVERFFZQnAzRFhTeWp4L1p1UWZFa0RseUJvMVdtbERWdnhROG5zc2VyTEUz?=
 =?utf-8?B?MmxuY0xPUnRCYlE4WVBJNFkyWWIvbVlOeDd5ckZkZmxWRkZlTmo1OG92a1R6?=
 =?utf-8?B?Wm1RdTFiaFZwdWJNd25YRDI3STZXYVpFSWR4KzYyZW9qNzA2Ky83c2tXc0F6?=
 =?utf-8?B?dVdjbVJWMUxhNFpuTHZuQ2F6cXpNRkJ2L3MxNjJsaS9YQW5ndWF1aXl5QTE3?=
 =?utf-8?B?SFhXblhxcVl0eUR6NVhCcXBBSXhJaXhKZGV0NVQ3NXFiclFxUmg0a1FEUXo5?=
 =?utf-8?B?ZjVEcFlYVkVYeklYRzRjQ2p4T3YxLzJuSWpsVjZ5YzIzSHBPOXhjaElHZ21O?=
 =?utf-8?B?NnRoVnVCOFR0KzRxb0VqZmdMdE4zTjVMU0VTckpWNDZ5RTZSeXJIbmd5aVFD?=
 =?utf-8?B?VzBOMDJDZzluOTNBbGtndTVwUDZrMjlIT3Ryb2RYL1cyYVQ5UFhLV0hUdTFB?=
 =?utf-8?B?eEV3T2ptMmY4bXQyS01wditodzM1Um5EWWtlQW9SQmdDSUg2eWFXblNMUGs0?=
 =?utf-8?B?MGpZOUdhWjdZMzhRTkxMWHFXY3ZkN1JjVUMwUnNYcmZuTVNIYS9BWVk4T0hw?=
 =?utf-8?B?cHRVUXpBN1d3SEQwd2FRNXlST2VqVFJwbHZDcE1mdTRxT2NQNDNCcjVxY0xa?=
 =?utf-8?B?dkRlR3c1aHJ6MDJEbHJpZEEwNXdNVWh2dkZzN3RFL2hvVXUxUmlOZUhtK2x4?=
 =?utf-8?B?MjFiS0JHbzJZNEJ0SWE2S1VyRThrMWJuWjRDVkRFd1dIMkg2NitieWdNeE5K?=
 =?utf-8?B?b3o0Z2R2N3RwUHFTeDJrSjY1U0wwbjI4MFc5d3NZMWtUeFVjVHhvZFcyNGRs?=
 =?utf-8?B?eU1LVFZGYnM5dzQvaHVSYVlLczFRRExpMGFNYk90YWxiQVZWdzMwaFdFN09x?=
 =?utf-8?B?L2lkcTdqaXk1NE5hdlBDRTVqUk9UZVNSdmtVVWRjL05pMjczbzJzZzErWVVL?=
 =?utf-8?B?a0tEUnpXN2RoWE55SFZudDdWOEp6NDFDUmV4UEZwOVUvZ241cDB1b3h3WTdT?=
 =?utf-8?B?ckxWUW5HelJtRTg5L2pKRlF4Zlo3T2dUdlFBeGdwUGd0T29nbDR1ZDIvYnFK?=
 =?utf-8?B?TTkzdncyL2RvaUFqa29PVmM0M044TXVYZnRSZWRncW14Z1diTEQ5bVdFbmdt?=
 =?utf-8?B?aUFVdDE3a3A5K3J2cDMvSkdhSGNYOGtXVlhYalZoMFNZSFZuTGRXMld4dEZn?=
 =?utf-8?B?Tm9ia3NyZXJ0QjBXY0V1WVRLQ3pwdUtDR1NpYWRzY3VOUm41TlN5MGlVL2No?=
 =?utf-8?B?QXdGd1QwdjlORjdPblFZU2krbFg5d0tOZzhkK3hLNERHNWxXV2ljWkxRRzdK?=
 =?utf-8?B?cCtoWkh0QnA5OTNJWnJPa2N4MS9wMHl6YXN4RytRdXk0MUlJZ09nUkxOSlc0?=
 =?utf-8?B?TkVqYU8raldHblQ5Mi9FM1ZhV0dheE14WEw2bVkrdkdVcnBCYUpaY01WNGhO?=
 =?utf-8?B?T2M0dDV6U3RpRVBKSnFvalFtUTBQZGNGREpPdFBxK2ErQVVwSHNpZzdRc21p?=
 =?utf-8?B?dENPWFFUemNhMitmQTVSN2lXTWgzU1NaNUsvajlJVTVKOS8xb0Rja2hxWkpm?=
 =?utf-8?B?eTRGNmY4aDRVb2hodlR3eVY2Y3RQSm1Hc1JQVjhzaDhLdHNLRStZWCtScW1p?=
 =?utf-8?Q?R3+x2t4xAV5zr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R1c4VGk4cDd5SVFBanlhZ0tKM1RIajVaZzMvZXYxOTNuU2JMZm9JZFViamxR?=
 =?utf-8?B?NmlISGcrb09uOGVlcXg0dUE1ZVp1eThJQmN4R2JDUHZjNFREbXdWbGNoVHUx?=
 =?utf-8?B?S3RBejljeHIzZGM3dmdMcko4VGY2WnBWQ09Yb3JoYUFyak1XemQvWS85Qlds?=
 =?utf-8?B?dGVrY1grWnNtYnhPdGIwN1VldjZsNzFFUm93WVk4VGRIUHdxWENhcGFGZnVr?=
 =?utf-8?B?aHFRb2xqMGhxaGFVa2tyTlNuTFIzdk9TMWtObGtzWEM2US82Y1JGUW9NejB1?=
 =?utf-8?B?N29ZSFZrbE5NVUI3Q1FXaVhUWEdRblc5MUxCWTEwTkhZdTVkZ1lEeTVPWTRv?=
 =?utf-8?B?eGd3SFpNQURPRGYwUlN0VDNmamdXYVJGL0lnQUN6U3FzWlNvVy8yTVhoQ1Fm?=
 =?utf-8?B?dlE3YUdiT2dsZkdmTm5UWjFjaXVLd2M3LzB0ZC9iU0ZXZEgvMzlqemdrVm5B?=
 =?utf-8?B?ZThJb0pPMHhFRFFnMlRqRHd4d0R4c3BqdUlJbWZvVlJVTDcramRaVW5hZlVS?=
 =?utf-8?B?YlMzdmRvU2doUTRZejg1eHYzNnNaWXNQV0RoSzR5cDgwRHQyT2tVelBydDNV?=
 =?utf-8?B?cjdFQXo2RmVTeGY4Z0twbHpvZ0RpMkE1RWREWVlBb1NySjV2UVgwNWZDY3F3?=
 =?utf-8?B?VjhUbDlWWDlDd0dORnY1ak5YbjNqVUhxbXRJYTNvTXZ4QzBGd2ZMTm03Y29T?=
 =?utf-8?B?czFjbGRGakVpbUtINnVESnlxZHNZbTFyVFNjaFlxUENjTWtWRDRvaVg2YXIx?=
 =?utf-8?B?OStBL1NtL0o1T3F4RVU4Y2ZoenFUN0E2aWhFTmhvanVZWlA1WjcwazhkM05q?=
 =?utf-8?B?cDdJN3d3bmYvZnQyNlpNeURYOW5OZWJqR0t5eHF2QWdacHVrbGpZMXVERWs0?=
 =?utf-8?B?UlpwZ3d4OWpIY2Vac21HbUNwc05tdkNWQjR6WE93U0pJR1V6V0VPaVJMNks2?=
 =?utf-8?B?aDk4WEQray9JNDRFb2tEbTllQUd3OHlPS2E4QXRJVllYNVpmeDBTK0xmZW54?=
 =?utf-8?B?SmxBS0MxTm1uOEF2c0k4ZGNObHJ5STdaMnVxaGhFcWxMZFlBc3V2WUpaT2hi?=
 =?utf-8?B?Ulp2aW1oWHYvSnJkcjFPZ1ZJM2Q0ZTVsRGxhY2dtSlBWOHhVSi9wYjhZNk5a?=
 =?utf-8?B?ZG5qcTNyT2VYQVpHR3B2VGVoRUhLdzFEWUhrK2h2bUwxTzcvK2E3OUd1MXNC?=
 =?utf-8?B?Mjk4UmlmcXFtdzZSU1hvRmRZNTNvRGR6bVhFTXE1Ym5XZDY0SCtHYW5zUWNu?=
 =?utf-8?B?aDAyb3dCbnA4ZUt3MG5JWGg4eldkQzVERjZabzdadGxqemV3dDNkaWRqSm5M?=
 =?utf-8?B?UDRZbVZBdlhLM25BWHUrUDNaaHNTMEo4a1VYUFNtM0pOeHVRcE9lUHo3VDhE?=
 =?utf-8?B?cFdKeEp3am5GNmFJN1BvckNndEVvN0t6TVFwd2RMQzE0M2RtQXoycmtPVlVX?=
 =?utf-8?B?azB2Zm1FaFFsN2ZBVythZkpLeTNoN2ZnbUZGSjUxancrakVFM0dBSHVYV3JC?=
 =?utf-8?B?U2k3c05SakVYaVM2Z3AzSTFvWDcwT3cxR0FkQ0RhVEVJVzh2RnpxTEdiWWZv?=
 =?utf-8?B?UzRHQzJZRWFZM0oxS1BNMkkzSkErK0FVTm9iUXVZejkyMlZxaUZFQkx3dEdB?=
 =?utf-8?B?bkM5K0VpV29ZUy9NcWpsS3hNdWJjeHpFaTdPU3ZPZjM3VUdDU1I1d1BlSHZE?=
 =?utf-8?B?eG9ZOERhUDJQcUk4RGFyZ2ZOWGpvdi9hT2w3WWE1Ykgxd05ScU1VRjFkYW52?=
 =?utf-8?B?SUNVV0R6Q2E0MVVNdnZZUWRjSzgwMTN3aERMVXpSeThQbm50SkZueEEySXdQ?=
 =?utf-8?B?VURtS2lyc1hZU2gwTDh0QTFGZm5GbVBDOFNqVHFEbTVrb2R6eUJpWHZ0UStR?=
 =?utf-8?B?bHNsSjdROVNrWXJ1blNOeVloVG9ZNGRPallGUmh5K1lZR0xKSmdJRE5ZalNm?=
 =?utf-8?B?WVpLd0dpOWVYcFR6SnpLem9BQ1NraXRSSDFkcndyK1Y2T0hlOXhWSjFWdDF6?=
 =?utf-8?B?TExqUGF0K2VCQlhVcE9ybkV2WjhkQ2NvR21qM3VicytBWjJ3cVpCZkV2cEtm?=
 =?utf-8?B?MUFxSVdHRGtiM1duVlJ0NDM5Y0VNNG94aFVaQkc0S0JsME1iV0Q2b1FJRDlF?=
 =?utf-8?B?eVpsZitDVXl2UWVudWRMN08zSXBqa3pmcjIzbnVqWkF5K1J3UGVXZ1l2SEJx?=
 =?utf-8?B?VlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e9abb5-92b6-4c10-0c26-08ddf9a3a7f4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 06:45:45.1429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idXOZOFSIdFQlC1VLq7cVVVH0H6gI6RtJv22FVYWX92qYqr9E8GF1yLm2WHGqH9WZgyUpvJm6my+dgJv8kUHE+fVEw/xqrnjzphpFleWfeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5093
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA2NCBTYWx0ZWRfX/dmxwtfd5Pht
 Fai1Bm5sQpHukvguMYD24sIjssqdxYEDDqXsCVkaAu2HPidAwh8BjWuahzCSjZaizdEKCOtyMuW
 yPuPw3lmdArRxxzdqjhxz3hN0s/Zy8bw47nj9mbYH3VOt3OgDR9XxaJ626M70JirZz9qyv0A+II
 yMB82veuMfvGrshp18aoacfGvib/hmRfYQT9L5XF1VotfIttcpbiH67jhWIQIbWVuPw7MUtmwIE
 Jc/ckC93h3zcbNR/cXsKFq0jp1PNNcjeyHHo8bQfLL+353dzqbHBxc1dLpTRwJbEZR10XZxmiJG
 l1tHQWitP7zA2Dz/4hbmGoDUM/qABWum9/hLJuMB9yuiaP7I5bCnq2V4mS5OaI=
X-Authority-Analysis: v=2.4 cv=YZS95xRf c=1 sm=1 tr=0 ts=68d0f09b cx=c_pps
 a=xHz2x/H0+t1Z4EfVAX8SiQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=69wJf7TsAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=3-RhneuVAAAA:8 a=UiSxljtFFnXE4GbfDooA:9
 a=QEXdDO2ut3YA:10 a=STXwoKBC1RUA:10 a=Fg1AiH1G6rFz08G2ETeA:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: jc4_69JYgA29_uO8UsRjkp6qZDblNJOs
X-Proofpoint-ORIG-GUID: ckGEPf6hDsvFbHPKeX_NNBeKED2m1mNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 06:45:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223805

On 9/20/25 06:49, Peter Kjellerstedt via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>> -----Original Message-----
>> From: Hongxu Jia <hongxu.jia@windriver.com>
>> Sent: den 19 september 2025 09:56
>> To: openembedded-core@lists.openembedded.org; Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> Subject: [PATCH 9/9] debug_build.inc: support disable debug build for specific recipe when DEBUG_BUILD is enabled globally
>>
>> While setting DEBUG_BUILD = "1" in local.conf, the debug build is
>> enabled globally. For the recipe (such as qemu) which doesn't work
>> without optimization, we have to set DEBUG_BUILD = "0" in the recipe.
>> In this situation, conf/distro/include/debug_build.inc is included,
>> although set DEBUG_BUILD = "0" in qemu recipe, the debug build is still
>> enabled for qemu and break qemu build.
>>
>> This commit sets SELECTED_OPTIMIZATION, BUILD_OPTLEVE and
>> BUILD_OPTIMIZATION conditionally according to the value of
>> DEBUG_BUILD, then disable debug build for specific recipe
>> could work
>>
>> Also move DEBUG_BUILD setting from qemu.inc to debug_build.inc
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> Unfortunately, I think this defeats the purpose of this whole
> change. :( I.e., when parsing debug_build.inc you should know
> that DEBUG_BUILD is set to 1. If that is not the case, then
> what's the point of moving everything to that file? You would
> still have to check DEBUG_BUILD for every variable you modify.
>
> Here is a solution I came up with that would maintain the
> property that debug_build.inc is only included if DEBUG_BUILD
> is set to 1 for a given recipe. Add this to bitbake.conf:
>
> INHERIT += "debug_build"
>
> Then create meta/classes-global/debug_build.bbclass with
> this line:
>
> inherit_defer debug_build_deferred
>
> and create meta/classes-recipe/debug_build_deferred.bbclass
> with this line:
>
> include_all ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_build.inc', '', d)}
>
> Having to have the two bbclasses to defer the include_all
> so that debug_build.inc is only included if DEBUG_BUILD is
> actually set for a given recipe is a bit awkward, but it
> seems to work. At least with my quick test I could modify
> DEBUG_BUILD in a recipe and debug_build.inc would only be
> included when it was set to 1.

Many thanks for your suggestion, I will follow it with slightly 
simplified, v2 incoming

//Hongxu

> //Peter
>
>> ---
>>   meta/conf/distro/include/debug_build.inc | 18 +++++++++++++++---
>>   meta/recipes-devtools/qemu/qemu.inc      |  4 ----
>>   2 files changed, 15 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/include/debug_build.inc
>> index 81b6a5f234..c3f19666e6 100644
>> --- a/meta/conf/distro/include/debug_build.inc
>> +++ b/meta/conf/distro/include/debug_build.inc
>> @@ -1,10 +1,14 @@
>>   # Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when DEBUG_BUILD is enabled.
>>   DEBUG_OPTLEVEL ?= "-Og"
>>   DEBUG_OPTIMIZATION = "${DEBUG_OPTLEVEL} ${DEBUG_LEVELFLAG}"
>> -SELECTED_OPTIMIZATION = "${DEBUG_OPTIMIZATION}"
>> +SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
>> +SELECTED_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
>> +
>>   # compiler flags for native/nativesdk
>> -BUILD_OPTLEVEL = "-Og"
>> -BUILD_OPTIMIZATION = "${BUILD_OPTLEVEL} -g"
>> +BUILD_OPTLEVEL = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og', '-O2', d)}"
>> +BUILD_OPTLEVEL[vardeps] += "DEBUG_BUILD"
>> +BUILD_OPTIMIZATION += "${@oe.utils.vartrue('DEBUG_BUILD', '-g', '', d)}"
>> +BUILD_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
>>
>>   # The modern compilers and code seem to require extra steps to avoid DEBUG errors,
>>   # this file collects debug tuning configuration to address DEBUG errors.
>> @@ -53,3 +57,11 @@ MESON_BUILDTYPE ?= "debug"
>>   # For cargo.bbclass
>>   BUILD_MODE ?= ""
>>   BUILD_DIR ?= "debug"
>> +
>> +# Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html
>> +# upstream states qemu doesn't work without optimization
>> +DEBUG_BUILD:pn-qemu = "0"
>> +DEBUG_BUILD:pn-qemu-native = "0"
>> +DEBUG_BUILD:pn-qemu-system-native = "0"
>> +DEBUG_BUILD:pn-nativesdk-qemu = "0"
>> +
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
>> devtools/qemu/qemu.inc
>> index 2ee76e9a7c..7bd28dbbb5 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -58,10 +58,6 @@ COMPATIBLE_HOST:mipsarchn32 = "null"
>>   COMPATIBLE_HOST:mipsarchn64 = "null"
>>   COMPATIBLE_HOST:riscv32 = "null"
>>
>> -# Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html
>> -# upstream states qemu doesn't work without optimization
>> -DEBUG_BUILD = "0"
>> -
>>   do_install:append() {
>>       # Prevent QA warnings about installed ${localstatedir}/run
>>       if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
>> --
>> 2.34.1
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223775): https://lists.openembedded.org/g/openembedded-core/message/223775
> Mute This Topic: https://lists.openembedded.org/mt/115324540/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [hongxu.jia@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


