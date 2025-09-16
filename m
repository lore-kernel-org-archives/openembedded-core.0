Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD180CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 10:47:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16066.1758019620674373354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 03:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=HA66SpMd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1354a00400=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G4e2Yd1800105
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 10:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=RG3z4dj29dKeXMR7o6z3QkUp10Ehzo+xo5QHHYQE+yk=; b=
	HA66SpMdgscj/G59JSiAJrpzdW6ZEKPlXFfP+HyIdPwWwnrJHRzx0yTvVdSPIO1d
	PY2J1C4lVwhsGAD8KIdYBL72vjzENQRE33piERmqYvzwT2ITivdN9Ew6fCD5W30g
	u0nKsHwqBpONQkV4OEYrEORiQ8W/F78ShuU9LtR5rnnR2YxHjnXfmmz0czgmntw7
	siyel4mTSIv/cL4uuG65jHRW8Z2C7J41p3s8RCR9B8uqL/xU9VYZikKwhG799pIm
	fdEng8vwleNNUvr26L/CQYkdl72tlEgOA8201D9pnSartjR8RVgbMid9cVR90qlM
	OSH/x5aW/RaoYYcBWITRdg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012002.outbound.protection.outlook.com [52.101.48.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494wu13bks-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 10:46:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwxXRahyvqt5v8xsxLTo5078UBYLaGv9ASrhRnMszqk+tt2HozBzTxAh0FE4H4XwlRdLsvWVTpEAoqgrV+Z24Usq4lXYGNHLMNllD8pNHRPHCSomlHg8fXxrm4Pd7G+HA9i9/GX7m0Bl1y4BoMBP2Hcnm/nw8c2puo3NR8Bg+BPzl2befU61KiY4lR85m9ncHAXK5GUq0Phti8hNhfgFxzapE3nPT48urCughl5msrenu0VdzSFiSBKuSiPcZvE5l3bAJRHB9JCWJ9Il5rvZ5fjaY9S5mLV2bbSshGwmsycn/EMDbclCp4MVuEc+YReeUIO2mRPrGTKiqNc91g1/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RG3z4dj29dKeXMR7o6z3QkUp10Ehzo+xo5QHHYQE+yk=;
 b=I8UYLU+yAalTiufSumCXpmsAsc9nbCreM15fIE5BM+c5b2BhY+FRsx/U3TdlF2+hH8M1Ny4FbdxDciXlBqR1uZloMtIY3T+uKh1co0QZUSrCNB8DfvHf7SwinG/gr3NQf9k7icLVpaQONCnNW5UcAMJV67nfJ5lV9NhYS5Xgjv8vXViWlw2urRpZLcf/U6xPmMfyXS7JdmkzPQDf+WLZ5uPXCkge4XhFcOlOdqSkRDYUcZOe5J692YKh4p/ogy683kmTQ+359AzV1egyz84EkccTQ8qH8ti0L7YxSYFTNqjyQfHlPf3nOP/wEut8hvIqgGiwjqCP+e2G+HzYnPdD5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB5176.namprd11.prod.outlook.com (2603:10b6:510:3f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 10:46:51 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 10:46:51 +0000
Message-ID: <7edb1a64-aeb9-49bf-b465-68e2f6493129@windriver.com>
Date: Tue, 16 Sep 2025 16:16:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] nativesdk-packagegroup-sdk-host: add
 nativesdk-gprofng package to RDEPENDS
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20250911120855.2268283-1-Harish.Sadineni@windriver.com>
 <CAMKF1srWBq3io0+s1WAap2n4ER7-40386kOjp6B1TmucEVSmXg@mail.gmail.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <CAMKF1srWBq3io0+s1WAap2n4ER7-40386kOjp6B1TmucEVSmXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA0PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::7) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH0PR11MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: f3085064-5649-4402-468e-08ddf50e5819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|52116014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OFJ5UUZCRm1xMFlOMjlHSGpvRm0veXVVbmpVK3BJZFZpSllLdXlGbldPSWY5?=
 =?utf-8?B?RlRRdkxZTmpmQnM4RlZQU3JPZ0w3TjE2cnpoNWFqaVBjYitvNFdSOXFxUFJH?=
 =?utf-8?B?dENwV3pBVGt4UFRnaWg4ZDE1N0xRTFBLaXBmMXI2RjhvYmV6cmk0cG9xYjNt?=
 =?utf-8?B?WXQ0bk1uN2Y5M0RMSDVDU254akFTdHA2Z0paWFB6TVRZOHdNVXdNSUplYkkz?=
 =?utf-8?B?LzdNci8zY3Q2cFA1cE42amVnaTZyRit2UHAzQmxvMjNGNnRrQUxGNXdrT3JB?=
 =?utf-8?B?eTB6Y3pWWTh4M1RoMnVRVEdPTEwwT01YWTcrTHJrWEdURnd2TFFsZEJoeXRY?=
 =?utf-8?B?cTlsVUs5ejloeGRja2JuelUwZGdTazEvZVB5dGcxTkxHMG14NHl2MEhWK3Vm?=
 =?utf-8?B?Q0NmZlVEQjR1dGFhYWZHUllxZi9hMVBMZXczcmpWeHRBc2tzamFObXQzYzJV?=
 =?utf-8?B?VUJQR0JrNHBuZFI1VE01Q3Y4MTQvN0NycHZxRk5maEF0MlNPMFNHdGpPMWNW?=
 =?utf-8?B?U3JmblkrQitwQUVVU1cwTUJhVi8rTXRjNEd3QlY2YjEybTRuL1NyNzBEN1p3?=
 =?utf-8?B?NmtxOWFJbWZaNHVZTktGSHV6QlQ3cVoxRGlwNHF3UUVtNng0cmxZYlgweFMy?=
 =?utf-8?B?dWRnUktWYmJvQm9uMUNyaUw3U0JMWlpZQXVHOFdSSFZDU0hXdGptK1F1OWR1?=
 =?utf-8?B?Wkt2NTAxRS9OM3VSRGJtczRZcUZlTEJjUkZmQzAyeEFCeHJZUFovMlZWNkZw?=
 =?utf-8?B?bnZjN3BkQzVXNEgxenVnanZOSjlwM3YrZEJwMEh4NGo4OU84UU9OL2pWdDlh?=
 =?utf-8?B?S0V3MlZ5VE9XN21RbUx0dmVxbEYyOTQySUFXdHQwWnZLVzBuSXhKS0Y5cHRH?=
 =?utf-8?B?ZHhrcEVLME9oT0NobkxFc2EvR3U5RXh3bVJ5OHRIaVFJNjlJWkR2TFN5WGVS?=
 =?utf-8?B?Z3NCd1JnbTI1b2lQMVlzMk1GM2cydjQ2YmYxVUVONUZqZkd3Q3J5UHh3WUww?=
 =?utf-8?B?aEk0dUdCZ2V2Q2tLQnlLUTVDM1dxUTBrWkJiR2RJcjR5RU0yeEdQYnljOXZk?=
 =?utf-8?B?cUNiZGhsMjZQMDJYc1ExVWQ2b3hIVnVGVm92bnQ4dGdidGcrOERTVFJJWXdI?=
 =?utf-8?B?Uk5DLzNDenpwanUrWTBKbEg2UU0rTitXeXdsNzZzL0hMeGhoV0NMejhHVE5P?=
 =?utf-8?B?Z0NVTkN6VjBvL2lYdXlOMmwrVlBsZ0hwSThoRGJXVzZvV053ZUxuRU9KMk1L?=
 =?utf-8?B?WTZzWGVhZXRBblFCVUNIK3NnV0tvdzlYMmtQNldzNlJFSUFkRzR2ZDl1TVBt?=
 =?utf-8?B?cngzcUQ5cnB1ajNPaUtBZWZ0NldUM3BKbS9aTWgyYXdieWZJZlBYTms5bVln?=
 =?utf-8?B?ZUN6ZVF3OGswM1licnVsLzM1bnJOK0llL1V0L1I2WjhCMjk5azY5NG5QODRB?=
 =?utf-8?B?Q1lKQTh6cWlsUE1wT082b1IxbTBIOWVqUnlndGQ1emZwUWYydVVDUWR0ei9p?=
 =?utf-8?B?cTcxWmVLTnBiK0VQV0ZsVnBkaHJyTGF0amJOcXpWaDdIK1ZNVzZKNE9OdTRK?=
 =?utf-8?B?MVQveW5sUVlLUFlZRDd5SFRVbzVWVkpLRmVEanZFWStVRVVwaHE0SURnc2RK?=
 =?utf-8?B?SGllQ1cxOFR3VDJiU2o2bXBQTzNJTnFPbDhyMEN6L1Y2Q095ZXJvT0tFSGhE?=
 =?utf-8?B?NWd4ejBnOHdhZFh5VCsyMU01bm15T2Q2eW82RlNWNys0ajI0K1FranM4a2Qz?=
 =?utf-8?B?cG5TbUduakgyUlEyayttTElqdE9NNUpwUkRBZTMvSEI2d3FZdENzN2UyVjVE?=
 =?utf-8?B?SWtxS3BFYk9BYVBVS0QrZHoxdkVLSGgwbEpPZ3pyVG5oWUg5QUNYT3VnaXVN?=
 =?utf-8?B?K0NIZ1A0a0NEd2w4bjAyZTdiSGNLeUlpUmpCTVhUK1hKQWxzdzdYVnBrRjBq?=
 =?utf-8?Q?vxhUmqbyZtGgZAaU8CuLn+xw3rzOhCBh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(52116014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?STUrSVptMkgxdENSZUE0ekZFUmUrK2tHTDRZL0ZYS094VkpmQVYrYldrRXZU?=
 =?utf-8?B?T3JGNWVIMTJSU1JtbWNzdWZuNlA3OGp6OXllUTl3M2VuNXc2S2hUbmtrQ0dM?=
 =?utf-8?B?cE15Q3JkUHlaWVNlcVlSbkdGZzlSNDVmUUs2M2hMVnM1T2ZYUmh2L005Vm4v?=
 =?utf-8?B?bmRxVC91N2V4b2c0R1Jyb1JMcXJUTlBnSmFyRm45cE54L1RrWjFuL3Fyb0JW?=
 =?utf-8?B?eTRtb2JyVFgwaFNnWU9peGxOOHdTOHlTbGl5WWtkbk1QV3hUVTNuMDRBYVRJ?=
 =?utf-8?B?QmZMVGNsRWZuSTZmMzQ1d2ZydGJkTlcwdnNFOGtpZlRNbkZYSFdmaEVuOFBS?=
 =?utf-8?B?QXdKZmhjY1NyOVZ1ekpDNUUzZzBvenBRTWd2UE1iYzUwdlJ1TXppeEdHbFB2?=
 =?utf-8?B?dVVjeXd6MUdjSFRaTndmeWlYV2dJQnl5ZFJGZFduN2VFMWxmUHNrMHg5ZzEr?=
 =?utf-8?B?eTM5RkM4VWxvc3dKNUZ5MHFHYXBGb0hxMDlTdDU4VWV3eWg5N2M0dzRaVlR3?=
 =?utf-8?B?b29sRFA4RGZqUTNtVDhOdUk5VGxrVXkxei9LYzRTNjRzODgxK2JzRHlJTDBl?=
 =?utf-8?B?RXkxbW53eDVydnQ1TTRNL3FzMFBIRlBuejZFN3daNEJQR2tQamM2KzFpZ3Jw?=
 =?utf-8?B?RG1BQW5teHpQd3BKaElTc1ZaU2p3WUN0cHpmU1RRcndrMzl4b1JpSytKRkhS?=
 =?utf-8?B?UlNPR0tPb1pyNmdTZkt4dXBjUUZaVVlvTmo0UUdaRUI3WXh4cXdLTmtpUTRU?=
 =?utf-8?B?Wlo0Z3BtdXM0NGNCdXNGZStaRFdUQ3dabllvZUtTZUxrK2l1ZG9HcitEQ2RX?=
 =?utf-8?B?UHc1UzdRWkk5aityN21JTyt6cXpKYllGZ1A3ZGlRYWVtR0JFR3d6USszMFEx?=
 =?utf-8?B?WWMyQ1BCekJTRG16SXYxeXZJTnlqR3RyMXRLN2xlUUVSTHlHOVNmY0hmQ0Nt?=
 =?utf-8?B?eGZwalhvdmJwaHplRXVxYUNybmZ6R2xkVnBhTkp2VzdjRm44YTdZbWExSVgr?=
 =?utf-8?B?Y0hHMVA3TU92bFpGVE9TTTFnWXUrcDhUb2Z1K2E0RldNLzQ4RXhVWFkwZm9H?=
 =?utf-8?B?OXkzOHJEMWxvWDB4U2k0bE51b3pCRndqYUNOMEp5Wnh1R1p4SUFWV3BLQ2h5?=
 =?utf-8?B?TWI2TTFHYnJQcWtjTDIxSWVPYkgreForSWVaelJ1UzVVdWFBa3V6dXJsZ08r?=
 =?utf-8?B?U3YxMFNNajJhQXZZU1ZCZHgwOFVLcVpHdGJjbldkUkxaa25yWkU2ZlV2Z2Vw?=
 =?utf-8?B?NkhNbi9hYnRYK3RUVVgvWjhWbTBlZmNCdElONU1BY2MrWGlGMDVIZ2E4SkNU?=
 =?utf-8?B?dHc3T3NISFI5VjhhZ0tmVU5MU1NKZVYweTRSVllFM25BcXFqSmtiYlIrb2Uw?=
 =?utf-8?B?SS9aT3FjM2RnRzc3bnprZ0dIV1pSZkZHZUZxa2oyKzB0ZDRVSlRaeHNIdEpW?=
 =?utf-8?B?aWhMeGZKNEhsVTVTdURSaVRIWU1YVHVaMzc1MXlrVi9MMzRFbm10dFB6STho?=
 =?utf-8?B?MCtnT0sxQVM3SmRxYmI3UlNFdCtNVlRZNTRUUUYxVUlVR3lNb0JoUEhkazFE?=
 =?utf-8?B?UUx6QVI5K2FnSzJqNU5rdVNLNE45SmVrMm01UitER2tKalZJVWFFNko2QnRl?=
 =?utf-8?B?MDU5WnlYZTV3OWo0dG1wMnNhRGtmclpTU3Q2K1YzMCtPWFRlejlDS0pDL0Vr?=
 =?utf-8?B?MWZzaVZwQlhwY0RVOTNhWHJxOGhhL0pQRE81VGd3UVovWU0vV3RLVlFiNytE?=
 =?utf-8?B?OTdtc2F1bDFwVHM4NENYdHZ5NW9nRGVLMDNmcTRwV3VNd05OVjFCcUw1cXJR?=
 =?utf-8?B?NTVvUysveHNYTU1YRmVhbDV4cHNqcW9ldEJxbGRmQ04ySmxxTGV3WVJBTFpS?=
 =?utf-8?B?RFRiUVNENStyUlBMZmZGY292U0l2eDNyYXZrM2tYNCtONldFd0lpdVBBaXdQ?=
 =?utf-8?B?Rm1kVFl1TVYwK1FnS3M4UTBkRmk2S0VLeDVSTFphTFBEWnE0azFBQmcwK3Mz?=
 =?utf-8?B?YjJQdmFxTGx5MFNMd0xPNXpXTUxacThmM2R1WnQrK3loWVZRYURwMGZSTGZj?=
 =?utf-8?B?Z0ZQYVIrdG5sb3JMNlpjSTFLaXhhdDRlclIvbUhhVEZSRkdPM1lKRnovNHVq?=
 =?utf-8?B?czE0WDhoYTQ0UWZ6Z0xsWlhUdUNBUDcrdUhJQ3JEMGx3NFhGUmI1ZGJvWkxF?=
 =?utf-8?B?Wnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3085064-5649-4402-468e-08ddf50e5819
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 10:46:51.6351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXRD3BMYUB+Aa4p9w94AHkSVjpDZPLXgt7ExBaOSlarZa6pNiQyGDb1ntM7uk7OgMiMArF2hnmfz98jCVumDd+S87ybaGXntrti7e1eQu0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5176
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: hmk9r0HRIfhpnHRaTK5RyeCGlEjJLhID
X-Authority-Analysis: v=2.4 cv=EP8G00ZC c=1 sm=1 tr=0 ts=68c94023 cx=c_pps
 a=wMiyO8M9v1WpSot1jLKY+A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=8cZNLJMR7qlcBxxXHkgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 4wrfeT_umXTEGnjKdd-iOvCHXyNLNqZp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDEwMiBTYWx0ZWRfXycy6tqhra2wx
 RDTDgK3fT8w4KRZVvRBstZoDNndbyQDsIPuYedYJB/TdiwyzKq9raGdyPWi2k5tPD71bu/5oPCl
 EAxWFltNshjFJp1qUb360Tqay4krk1FINXngXTD+GkZEgCuVD89YQwieYxDtXVYb3vtUVwrpEPt
 fD3C6K8ECI50qOlMEUp0ZMJ4Jfg72p5PxnHzPPLjQpFQsFkPw58AW5t09ywJHrjQ97YagLhXqa9
 /XYs2o6ELiSMlHQgLcTHBEjUhdQ1PvHBhswCe553cKp2wxjUHYogfo2QiZnthDOnHgrOVPwp6cL
 Wc3o3qxMK/I9MF5Tdr2ixrlCwTQ9LVhYCkomMJqe5bXfRmPaUpT16BIJoG4RsU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58G4e2Yd1800105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 10:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223541


On 9/16/2025 1:53 AM, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, Sep 11, 2025 at 5:09=E2=80=AFAM Sadineni, Harish via
> lists.openembedded.org
> <Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> In sdk while running "x86_64-poky-linux-gp-display-html --help" gives
>> following error:
>> $sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux->
>> ./x86_64-poky-linux-gp-display-html --help
>> Can't locate bigint.pm in @INC (you may need to install the bigint mod=
ule
>>
> This means we are missing a rdep on perl-module-bigint, please add that=
 instead.
Earlier, we followed a same implementation but later modified the patch=20
based on Richard's feedback in
https://lists.openembedded.org/g/openembedded-core/message/204666 and=20
updated patch as in following link
https://lists.openembedded.org/g/openembedded-core/message/204681.
This will fix the issue but only when nativesdk-gprofng is installed.

Thanks,
Harish
>
>> The patch from below link will fix this issue but only when
>> nativesdk-gprofng is installed.
>> https://lists.openembedded.org/g/openembedded-core/message/204681
>>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
>>   .../packagegroups/nativesdk-packagegroup-sdk-host.bb             | 1=
 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sd=
k-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-ho=
st.bb
>> index c1d3c25060..5374067bab 100644
>> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.=
bb
>> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.=
bb
>> @@ -30,6 +30,7 @@ RDEPENDS:${PN} =3D "\
>>       nativesdk-bison \
>>       nativesdk-flex \
>>       nativesdk-perl-module-integer \
>> +    nativesdk-gprofng \
>>       "
>>
>>   RDEPENDS:${PN}:darwin =3D "\
>> --
>> 2.49.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#223272): https://lists.openembedded.org/g/openembe=
dded-core/message/223272
>> Mute This Topic: https://lists.openembedded.org/mt/115186510/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

