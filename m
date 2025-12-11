Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC47D3E78B
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 03:28:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.269.1765423733632278391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 19:28:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ppJ3li0O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44405d02ed=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB3SaS04052626
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 19:28:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=p+XHU9xYqsE52HoZpzH2/V5uUedmwH7Lk2kW6gbFmVg=; b=
	ppJ3li0Obyja/ucW8nWCABpUJ01BEqsbuDqbwvR1uBQ2Xm7qSTQx2VlnvMkwC6fM
	4WoY0RK+ZfPxsnei9+QWG5KvGyf+v65v5ux25bURRC6TNaInddE3CF2zcottgDwc
	cqv0Dx2ILiS4qEcHHT9csstudH3Gwo/TkiaeZ+sqo9WeMqF4DHR/R0jhwR/ewKVl
	auTtK4i6ViQQT9Ttc36xKViA2RnV2ykWHlPBvah/XwPLm26yLlSDg2PbWTyNDae/
	OVOko5Z3DbxYnEDiwKcOUnsFDM+/5cmswsuPHQrKZh4s1Heqs3cr53kWwhLrDhvV
	3C3Hss+oJoYOvyAXknXPHQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010064.outbound.protection.outlook.com [52.101.193.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay022sjyf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 19:28:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3PQCkkZJ1ssOWu4eIYJKaX9uMo417xgjtTpKNgDBzoMcGCHFWCxtIN4Ceewk3LvJoHsA+NULlEbjVO/IIiMsff/nGE6qg6kIGWkgUQaKH23vDD0kK4G3UTe+RJUsh/2jrkJanfVkeB0E87uUxvknAilAaLZWqQXGah5y2gqW7B55HxdR78qqi8rCV6p9yogqH8BDI2B+WLaTopFa2dNSQxVjeuhjyjaoLVCOA98yctLFw4+Q0UXsj4jhliKJAC1IgjCerav2O0at9T2kDIgIftosCxj4+n//lSC3Me0nN1WEIv/OdNDC8cmrvz0Do/FhBYvn3IRMrha2lLJWgm6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+XHU9xYqsE52HoZpzH2/V5uUedmwH7Lk2kW6gbFmVg=;
 b=Dd4Ge8I57NjX7udcFAcjVvrJxAQcwpNlyUXqDL4E/SQas4wlPZnINqcLp735J4rZSJpoIqdX1K/CK1pRZVin/g/NQV8Ek7lencKt655avBgLAIoGtbaqdxM1VnU0m6dhnNc5suFGZsNaRVwRj0aXnaG56F2EHtW25R5S9UbyA75Kwb3AujkwuRpoya92ah0GxDSqguZArEEbErArMZuceEOHwxfcrgfF4n4r0k9juc75CYZJAodBLFl7mHQhcRWkWgVez4OkVAaf+FUd7q2n3GgRbxxq7QK98PBZNRbCgU+Tnt8kM1o2q2+32N9vzXkOQgoGx+OAs0l98f1DnSjFxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SA1PR11MB8795.namprd11.prod.outlook.com (2603:10b6:806:468::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 03:28:49 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 03:28:49 +0000
Message-ID: <2cf2ac09-0c3e-499d-9566-d102c0c4e158@windriver.com>
Date: Thu, 11 Dec 2025 11:28:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] gstreamer1.0: add mulitlib scripts Gst-1.0.gir
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20251210080209.2158502-1-hongxu.jia@windriver.com>
 <CANNYZj9FY8v9s3OeFX1YLe-UbaxMBA-rupyDzNTiCeTzaY6PWw@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CANNYZj9FY8v9s3OeFX1YLe-UbaxMBA-rupyDzNTiCeTzaY6PWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0179.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::35) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SA1PR11MB8795:EE_
X-MS-Office365-Filtering-Correlation-Id: ed557499-4415-45a9-1152-08de386565ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q2NTa25RdE92NmNkcng5SFdobUJwMi81YmRjUVN6alNNSTdhWFA0SXBPWnY2?=
 =?utf-8?B?VnFkMzR2eGNoMkNGbmlqcUoyMEVjd00vRERoamgwcFF0aU5YN1VXN2xtQWhS?=
 =?utf-8?B?bGl4T1c0Wk5EZlR1eVk2dm5JY1pPZUN5aVJWelREQ1FqU1MydFc2ay9qVVNJ?=
 =?utf-8?B?Q09EZE5rZnU4MDJwYytuUStzWmxQWnFLVFJSQnZ1d0UwUlM1d2pVYkJkZGVY?=
 =?utf-8?B?TVNiK1dnQ1R2Q25SSXVwVWFsVnpjM25JUGg3aGhxRnlmTVJOUkQwMWZTaUo4?=
 =?utf-8?B?TWV0WGtrZ3htUGlFajNWOUtxRWlRTERsaHhrNUZjaDdRbmppYjJ0NUpUVmxD?=
 =?utf-8?B?ZzQ1NGU0bVhScklQdVNkQWExWG5Sc0srTFUvL0pZN0VEdnk1OGZndzM2UC9M?=
 =?utf-8?B?WnFSQy8zaDhTMStUWW1IbE11TXFjR0cvK1BOSmNvcFFCaVV1YjJMMmRCYStq?=
 =?utf-8?B?OWptU0FhWSttM1VPOWRTZjZlZU56NGorQmdOUHF1Ym16d2U5S3hQVEE0bFBu?=
 =?utf-8?B?ZElONmZUc0ZXSmdpc2RiRUt0bHR4UFJvYU1GTEE3MkxVUVNVa3FMUEh6amYw?=
 =?utf-8?B?Rm9xbmlzVHV5Q3VxOXNkZmg2b1FqSzgrL0lQVmdtOFp5RjVEbVJteFIzcFBv?=
 =?utf-8?B?V2Z2djk4LzhES21Vcm14K2ZzQytGSjVtSG9ENmdZUTFBQkloVmlFTHppZkpq?=
 =?utf-8?B?aDBkblhDODlKQ3BtODdQdFhSc3BJTHovRndVT21WOTNEM3ZJMkN1L0JDVS9k?=
 =?utf-8?B?RldZV1c2aDQrdUJYQzdXa2hBeHZqTEpVUE55K0hTdjlnMC96VHY1cndqdk9U?=
 =?utf-8?B?aTZKQVFKajZPTVQ3UzZJa0xUVXM5akpKa1RZOThqLzZPM2ZHUUJWK2Fkb0dj?=
 =?utf-8?B?NytEeU1seTVNUGJQeklUZllWcjlJS052MlRwcTBqL1daOTBpQk8va0NSZUlU?=
 =?utf-8?B?TnNVM2hyTVRlZC96Q1lQRTYwL2Zac01GejQxaEtDK0dYc290MXN6K1AwT2Er?=
 =?utf-8?B?bDhYR3g4dVJUVHBWbU5WcGQrN0RrbTJiVUNHZ00wQTJ2SVpQZjRrT2NKRHU2?=
 =?utf-8?B?Uk52NDhjYnpVM1dXdndHeGdlUmU2bzc3TVl4VUUzdDlhSUlvVkRuby8wOGdO?=
 =?utf-8?B?TThhVC90Y01wL3lXcWVTNTFRNG5Ub2NVbGVsbGxsa3pxc1A2NTh5N3NuNFhs?=
 =?utf-8?B?czRPQVNIc1h0YTZBSUpKRHhrOGF6dDZFTDhtQUZNSWszRWxDaG5scXpBU0JN?=
 =?utf-8?B?dGtZRzhVMG9BZW1hQmtXdEdPTWhXM2NZUExQeFJZT0pUTHM1bDhGR21qRkti?=
 =?utf-8?B?V2pjZHhwdmNWV1V3RHhRWEw1dEdQMHp1OUd6WmRnRWoxcnhVMnVRVnlLa212?=
 =?utf-8?B?NmRRTVlUWE1TTGRwTFl0RzZMSjBWdEY2MHE4OVNpN2dEa1EvYTlHZlBPU3Bq?=
 =?utf-8?B?V2dURVRvNkpBSngrMmtmT3ZTRFYzM3VPVlJxRnJGME1WZXN3bUxCY3NzQk9Z?=
 =?utf-8?B?ME53d1BBWGJrUXJ6dmx6S0U4bDFBblo4d2NiSE40T2NjcDV5Yy8vM0xxRDJn?=
 =?utf-8?B?eTMyTTdud1hVT3dMRWdxbjAwVE1iaHJWUk5hM1cvcEVobDluNEw5VEZJOEU0?=
 =?utf-8?B?eGpldk9HNDNSZk5RcUNScE04ZGxrSFBBTTZSZFpqNExKYndhSDBZc3g0MlRK?=
 =?utf-8?B?aW9abEpQWUxiVE42elp6dGIxcG9yZlRCL0VxR2NuYkh4SmdxOFduWVBtZ1NT?=
 =?utf-8?B?dUxDcTZCOW5SSDB2S1NxSGFyYStxVmJ3WGhNc2FvVmtuYnA1TS9MWWxGd24x?=
 =?utf-8?B?ZGxSdkR5eno0Vk5YV1VybWNHbzFRWE5ZTzF1a0ZlMlFBbGd5ekFydldJRlg2?=
 =?utf-8?B?dmg4bkVrb1pkQ1NhQTJ6N2xNdUxGRWxuRGpzaXpBK2p6bGVKd3FVY3Jodnlp?=
 =?utf-8?Q?+xdXT64PYTqUi+5SwFrK0KmlwBYFQZuy?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VzIwdDFPWllMNy9wWXFleFdsdUhXdXBldXg2OCt6OVVKV2xUa2s1bUw1WnBi?=
 =?utf-8?B?RkpoaGNWcG1tWDlFaGZMRFlEMkhFSFlGNUxNTEx3endkdWx4dVZhTlBsUjFk?=
 =?utf-8?B?SERxU05YMHBzRlVONXQ5Vk9xZXF5cktUMGhEQjVEelF4c0UwUkhaZG5Tb0FB?=
 =?utf-8?B?bnhhZDhpTkRCejNYYjQrMEg4aWJYdGtmS1NSeHZ1b1BvN0VBZXd6d3JJMmh3?=
 =?utf-8?B?KzlIcjQwcFBtdmFDd3F6dVVwMFRVZnN5VHZRZXNmdXphaXA3SjRkYkRQZG9S?=
 =?utf-8?B?Q1VScjBVS0NrcUxIbGVrN3hNUVlnc3YzdkJ1NXBDOEVnOFYzQVZwTm1uNFRZ?=
 =?utf-8?B?WGkrN0l0a2tGaUMzQ0N5NENvUHgvT3FELzZka0E5MEo0enpUeThhdFZ4b2t0?=
 =?utf-8?B?N0NqYmpDM0s1Ym1mMmtQak1jUkdmVzlUdHhSU3l5NitwTEdRdnhDckRlRC9j?=
 =?utf-8?B?MGJQZm5BWmVLU1N4OU8yRk1CSDYrWHUwN2JJYVgvWmdYTUxuUjZRRFdpWGZZ?=
 =?utf-8?B?U3VUNmtUaWVxOUtzdzR0dHRGeDIvQVJjb1NyZS91Z1JlT1dXWHFjcnQxZDhJ?=
 =?utf-8?B?Y3habi9KWnpGVnpoeUZwQVNXSGk3Wk4xUVdwdEgyYW5CQzAyZnV0WlJZQ3Bw?=
 =?utf-8?B?QzZWdnlYZjZxWXZlOFhXeEo4NnA4YVlBVUV4dEVtZmh3aG9MTXpIRUYzM0lI?=
 =?utf-8?B?dEtrcWpWZHd1NEh4aytYUXR2Yjd2aWdzZ2k4anFRenl2QnR4ckNhb0xQS205?=
 =?utf-8?B?c05seXl5dUEweWJqY0lFSmVmZDM2NG0zUXJESHZFU0twWTNEZ3AxaFpYaDhW?=
 =?utf-8?B?dG9HY0FCdzM4b3NhbCs0WnBKTkFQUmZHcFgxNHdtU3dnYzRmdkJtbUw2RmdK?=
 =?utf-8?B?SnArSThWb3R0aGg1SzR1SVBmV3V1NTFoL0w3Q0VYUVVkZDhqdFNkdjRDeHNH?=
 =?utf-8?B?aUZ6Q01NU1BwNFVNNGZFSlE3UXFQSHVJa3pLNHZNVi9WRlJyWWdtelVrd01w?=
 =?utf-8?B?RWNCZWZvcEx1eWMwcTRjSVFXMVlKb0tPMFVZUGRzR01FNXZac2ltSXFJTk0y?=
 =?utf-8?B?MVVuRFNoeTlZbHFoRE5tb3k5Z2dabVJyWWNBV2V0U3gyODRGNUxGbFNlempM?=
 =?utf-8?B?K2xIdmdORnpUaUg2YmFqVGtvM1hIWnRXRkRJYi9tZS9tVFA5VlRldE9SQ090?=
 =?utf-8?B?RW1rL09vbmhVaUNhYmcvQUJPT0pUSlRwM2o4NDA1b3A1ZzNqOHl2ek51SmEr?=
 =?utf-8?B?V1YvNjZhMGovNWJJZ3NNQlY4RnNhOGFyM3ZSTFJTdjEzZlYyUWFBRjBESXl5?=
 =?utf-8?B?dGQxQm9yVDUzcy9scTZNNkF0UCs1dTZSRnp1RE9yc2pxSkVaRzFaT0dYSDh5?=
 =?utf-8?B?d2V5cytYcVYyTzNka2kvVmQ3Nm5SaGtXTkVvMnc5MmQ0TWJIK0Z0a0k1d29y?=
 =?utf-8?B?b1NFaWhwUk5MdWc4R0U4ZHZTVmVaYmdhdWJyNGs4dXBERGhQV29ONThPLzRG?=
 =?utf-8?B?RFBFU3lISTZyNTc2WStwSU5jNjdzN0srK3pWeHUxUEVudXNQd0swWVA2Y1BF?=
 =?utf-8?B?MVhlYi9uS3F2b2xwWklFNmorTmJWekF6RnpIUmhqSEVRNDV1eWx1NEFwTFdi?=
 =?utf-8?B?a0dhNzFqV1J0ZEk3TmRucDIwSmF0RlpRUEdWL2JWSy9PQkcxVVlQZnlNMklG?=
 =?utf-8?B?cy9VNkpiRmRPWE0xRHVLU0dNNUtINmsxek1DZHNnNGNQMmUrb3FoaUFnL045?=
 =?utf-8?B?aUplQjNMQURKR3ExMklVNGMyenJQNWZrTjg1ZlA5M21idnJSTFR2T0kxdXQw?=
 =?utf-8?B?enhyNUVHWUJnWHVrS0VsTFJjMUtiN045M2pUd3MzSjFkc0hFK3ZOSXM0Smkr?=
 =?utf-8?B?QXNKMlc1T294TDdtVFpGNC9QZWl1MXlhQmhRb2RkZlZVc1MwZjBwd2NmdFd3?=
 =?utf-8?B?LzB3MVluUzJSLzM3TDVxaHI5Q1VWK3A3aC9ZSDhSNHpoV0FiSjhreEgxRWJR?=
 =?utf-8?B?SVhNcHp6d0ZrVjk2aFZwdjAzZ0N3YkNXbCsrZUJ1NDVQb0ZJQ29tNHBxZ0ZX?=
 =?utf-8?B?MFFmVHZpWWg0d3dMNTYydUJyS0FBdnhJVXRCTDRiMkl0MFdFVy9UVTZoVGht?=
 =?utf-8?B?Y3h5czhqczFYMDRVbUxnSEY3K0k3L0cvenJ0RzdGb3p5RkdjVXVaMXpLVG9i?=
 =?utf-8?B?TXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed557499-4415-45a9-1152-08de386565ff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 03:28:49.0616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zN/SRWT56aFn1VmmNRk28ebKtHfOlhdhcKDkQZ9UxlLQ37mrbpGeVg3w14FBzfBkFOLVt/0dyZZisPMS99ksoen/SfKanMDF5Aq06wHSO2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8795
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bf1mkePB c=1 sm=1 tr=0 ts=693a3a74 cx=c_pps
 a=z9epfWMNo9LgPPq3nTJR4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=xkVxHem3ZWB-Xg5nb0YA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: Ln_e1GFv1UWqMRQoxX09i7kmuPNWTbe1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAyMCBTYWx0ZWRfX0jjcligWVZj+
 G9oB4lHKrg8cOGb23E3QUxALj9xqw+fXnA428UTylc/1gfVyJ1bcJJcroEeT0ZgLbfWrU1obxXe
 xtasfpZ4zMxpc4zZlPLPgcxdCDxw+ajYw4C1lYrTcTd57M2soxZCziUMGkxnuAMH0bTiL2vdovJ
 jZfgFIKbKOoyD/TgEWX6/ek9pZ41gZ9MLdlxoCl8jGwnmEF/+kY4FgzVqJG2Bf6i6HlDp5XNFMp
 JWax/cvawSzTp/NdJdQe0qTAD9TJpXkznXNFYIh/6PouaBKoaGjC782G5WqrVClNCV2/IPjsWUr
 oKStYgAuK2pHRj21i4VjZKr/jU3fTFvywjZKHV+cadawE5k8Fbj/xSWY67iehvb7FN70UH1ruH9
 xbuOp9sNCTZTER/T44ZOx6BqK/K3UA==
X-Proofpoint-GUID: jDx5kzOk_wKRD6lF8pSkeV4ngErLuZ8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 03:28:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227511

On 12/10/25 17:19, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed, 10 Dec 2025 at 09:02, hongxu via lists.openembedded.org
> <hongxu.jia=windriver.com@lists.openembedded.org> wrote:
>
>> +MULTILIB_SCRIPTS = "${PN}-dev:${datadir}/gir-1.0/Gst-1.0.gir"
> This is not an executable script, so please do not misuse MULTILIB_SCRIPTS.
>
> In this case, the file should be installed in libdir/gir-1.0 instead
> of datadir, which probably needs a patch, that should be submitted
> upstream.

OK, I will try it

//Hongxu

> Alex



