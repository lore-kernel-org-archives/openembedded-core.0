Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A8FCF9C40
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:27:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36758.1763652429421923960
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 07:27:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=fuUF1PEV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=341909d004=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKAS9Ua4105198
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 07:27:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=mrn1AX1cSK5tut8vb9WUxfsTJuy9yznQ4f0DicrhY1w=; b=
	fuUF1PEVSLIp7PplRxcUvO5oawHfeG4RDNPqSWU8XxClSYakzQvY5DY+Fx3Rwpwm
	cmutow9Suf6vLY0yHEBamk/TO3cZLYuKggJgJ5lkxjP9wS+R6hfWBU5WcSafvS81
	CmtsSArz7w7TnhCdfUDQ91Tbhnsh06fyLwXK59nY6dRfVmBZQy5oh9RVQJgNhfg6
	ECLFVFAvE/32q9yefxcYkOeMC0fgc267SWZRoxWtNNKLVsgnRo34gdP/B9Gaifyt
	b4qQ2UrOqOgYynsbKijSLchfPchArEm2E79hKMKFyVZpDmIYhP7Oe2aO64fFTwho
	d0pBUQTpxQUne87v0Sv9wA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010060.outbound.protection.outlook.com [52.101.85.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswjecsw-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:27:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJqJ4jnDLgrySqi3X34XH+KN3QZByWJu1mLar8H04NYUdAqf+9GhV/NCoVma2/nPMLZkzmUY4QRcNgKSS2n1zVUWAQfEOgL+bWk3f9AnyaPypvWi5uqT0Ejsuv+oIkb0K8NN6y2hayAQ4GPYVEJbrS7oL/QuEbKD3+sHhA/prfArjseK5owkjX8r6SSeVG++ShPQuYx1RQVRL0xK5RfP+SI/DFcYpunlxg3ICl8HFZ0uYKizOPgIt6CxSxcPNsp4dves4N63YPm9N4yTEglFyC0eMP8KAf8DL1wiF09Sm68raMYQNYJEhkvcBpX7MWSD6xRNBeXkKKtrkJCum4ZDOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrn1AX1cSK5tut8vb9WUxfsTJuy9yznQ4f0DicrhY1w=;
 b=B19Mlf8rxgmd/bYjWUo62GrqcaRyJwfj4xjLDbYmNtSKrRUmnrGBzmWgXQW2EInXthkU0tZfErL8a6bwWMmjeDWMd+45/N8UVI9Ro5yechWJNuGsX7peGd4b3RUqcZpS9uBFxotYwthJ7AtLAmQ5ZmiLlWhs6aMpRt4Uv9wiPdTNDvLmrHYUM6PxRnmjQon4jIIQVRfhO+pFhj+OaOyTiPi8Jrn1wT29FLqzeLtuPh/9v07kvjZ4jWxyyEfkp0/nF4dd2zpDrJ4TILbZ8mzMn/o9Qx/UWpydVFkM8iM73uOcAv2+yVOtwfMjA5wGxPr5w3n3k2To49xGe5oRRPT3vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 15:27:06 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 15:27:06 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v4 08/11] kernel-yocto: Fix for buildpaths errors when rust is enabled for kernel
Date: Thu, 20 Nov 2025 07:26:46 -0800
Message-ID: <20251120152649.1128685-9-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
References: <20251120152649.1128685-1-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e2c9b3-aa95-41fa-1d48-08de284943b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aEJFOHFtbVN6R0N3anUxV25lazNTejByVVhQVGVsRU1OK2M3Vzd5UlB0TGh1?=
 =?utf-8?B?bWxyZkhmZTJMZml0anRwYkdqK0RLNGdMVXdaY0pKcmJjbXNpVWNxcTRlQkFX?=
 =?utf-8?B?eWtsU1VmaVhXRy9EQmNuUWR3bHUybVF1UjNsbUJOeXlocTNIVWdCTThYTFpJ?=
 =?utf-8?B?SXJURlpjOWE5UzJWaStNYkIvY2xOZkl3aVVtYVk4dHBham1vMXlsdThoQkNI?=
 =?utf-8?B?UnhGenU0Nm9uZXRuUXVzTHZ0RDAwaHd3dmxhUlpYL1lwQTNKelUyR2dzMGJi?=
 =?utf-8?B?NXU5dUJJelFnQW05OWpHaC9vUHZVbE5qcUpUNmIvUVRYdjY3MnpwbkZwTnhU?=
 =?utf-8?B?L3N5bWh2YkQ4amlQZStvS21zcWJJVUdlZmF0TVdOUUxJNXhVRVRJYWZjaml5?=
 =?utf-8?B?UEdVM1o2aFV2Y3pYem44dHUwTVh2clV4R29xQXJzNEUvbW1JZWEzWlpidSs4?=
 =?utf-8?B?QlROU2pmTTVDN2NrMkVmb052OEdlUDgyUmVPRjVTRkxEdWJKRnAwSlhraVNh?=
 =?utf-8?B?Ky9vcWswejg3NGUxekdJc3hOWGJhM0g1ejQzUi92NXFaS2twNXh4Y3JXcHZJ?=
 =?utf-8?B?d1hEN0pqeE5IVG9NUG02NkozRDg3Q1l0bWx5cmhGTkkwZk5hajdKL081ZnlR?=
 =?utf-8?B?L0NRbmtvVlhWbXBlMmhvc0FzcVZpbERWZ0R3WFAzZnJEd0RjN2E5Qm1wUGFZ?=
 =?utf-8?B?ZkQvOG5mRWtaK2lQSHZxV05WSjIrdWZVbnBPeE5UOE1Ib1ExcXdmbVVJVEFG?=
 =?utf-8?B?TnJFMEJMeHRVYU0rNURNS3dySzhvWjZXU2ZZaUNuQkVoRjVLVi9kMTFWdkJP?=
 =?utf-8?B?WktHU25SS1RlbXJrQUZTRFVoajdQZk92bDNtQjJOSHd3Q2ozQ2owKzNKa3NI?=
 =?utf-8?B?MStuN0FCaGdaczNrRVVpSkNZNWo5bE1CVDVDUWcvMGxiWWMxcEVXeXVxcm91?=
 =?utf-8?B?cFNMSUF2ZzJMY09pakVQM3VHbGU1ZlRvWTJVcHRrYzlxMXFvcmVJMmNHNmpk?=
 =?utf-8?B?cE5PK3J3Wk9CUDhEYW0xSFpSZmFHOEVDalpHVllyQjZaQm5SZEp1Mi9EeEs2?=
 =?utf-8?B?WG5ocXhIY3RtTkttR1VzUzVmTk80L21xMTJveWErc1JSY09GMTlpQnpQVEtG?=
 =?utf-8?B?U1lIQVVrblpCWG02bmgzUjd3WXR3Y0lTWjZkeUF1ZG5QWFBxQmsza2pSUG5K?=
 =?utf-8?B?aVBZWEM2UzBYZm9rdTUvNEd5dkFSNjM3aURxZEZwYWdTa0RGYWNGS1ZLNlFY?=
 =?utf-8?B?ZVR0YlBtdEx0NWxpa04vaVRWVlVGN3c0U1psVlluNjlweUFFMExqWjBORVJt?=
 =?utf-8?B?ZXp1cDZEcDlhN0d0WHhLSklycW9CbE5iMnViVXhQMHRaYzFlWTA3K3pBV3ha?=
 =?utf-8?B?d3R0MnVCb3U2aHdKV09qOVBIUThBaUJXRXZwK01DSzhrVGEzblpSQ2xMa3p1?=
 =?utf-8?B?dS9JQll0cjl2TktTL2ZIVm5TWEFjV0pNSXNsRDFwOUdVQVdzazR2eWFhazlD?=
 =?utf-8?B?ODhQeG9aQ2EwSExvczA2ekpGRlQ3RFBITjFUTVZUcXExVkFJbGk2N0JxNkE4?=
 =?utf-8?B?c1B4MGs4RlFuOTlHRzQ3cFMvakoreE5tVXhOZ3ljRVdad2M1S0x5T0xDaFZq?=
 =?utf-8?B?MTUwZXVjbGtiNk9Kd2M0VXg0T2htKzZ2Y3RySlpieFl2aGM2NFBaa2psMlZt?=
 =?utf-8?B?ZytrYlNjczJlN3RKMkNBNlpDTUJZUGNkUk5SQkNiV1F4QTA3MVJUTE42c0Fo?=
 =?utf-8?B?UU9ONm9oMThTTDdzL0U0dmR3T1BMblFXSXlXdWFpZ2hKemoxd1RtZlRsVURD?=
 =?utf-8?B?d2xITk0yU0o4Mnl2dnc4MGp3Rnh5U0FGKzVqUVNlZVpFYWRUWXNMbWFBM2VR?=
 =?utf-8?B?czBrRkQ1NFl1SjVweXc2Ry9tSk91TWRVaVRUaGZoaGJ0d3h3YTdLRXdFemdX?=
 =?utf-8?B?WHp3N2JNQ3lad0Q4KzYraDFQU2FHbmFOdTdpb2pkbUt2NXhTQUN2Q0x0b1Jx?=
 =?utf-8?B?aFRGOFcrWTN4QTUrbUZ5UUJwU0ZXajNFR09jNm9yZzZKK0lzbVl6akVzaVlp?=
 =?utf-8?Q?C4aSzA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ckQ4U1c3OXpzeGtBcjdKVDRNeU1DdFdTeVl1Snp4YWdxWkJiZkszL0crVDAr?=
 =?utf-8?B?cEx3WWp1eklPWkVEOVVEV0QrQmMraXR4bklYaHcwNVpUMkZTdTNMaWlqMFNn?=
 =?utf-8?B?aHRBaXZoREJRYU5BOENCQWJEUmJkSUJqYUZkOW8wdk4rcHNiWFpSSGY0bjhB?=
 =?utf-8?B?Yis0U2Q4eFhWWm5zN0hzdHBnVkhyUTV2Y2ZSbWJ5Z2xXZ3J6N3FNaVNLaURS?=
 =?utf-8?B?KzRuckE4WDY0VHlNL1gvd3J0cStKTE9xREZoQjFlOVJ3c3hWWTQ1Z2JJK0Ir?=
 =?utf-8?B?VjUzajNacTV4SnVJdXZyVXVVK3B5cmw0SHdsZ1k2dms5MmNrVFYxdWtURmVz?=
 =?utf-8?B?TzJJT1dCV2lON3ZXdGdUdVpRUDRYUmZaZWJLSDJEWGowbXRndFBTaEh3MmZq?=
 =?utf-8?B?Smx2b3E4UTZWbVlKOEp0b1o1VFA4RE90b0NqMHNQbmIvZjNUb0k2ZXByRzdC?=
 =?utf-8?B?NjFuUmZ4a2xHMUYvdzdCcFFkd2NueEttYlBrTDUxUS95MXhMQlJESTNDMGUx?=
 =?utf-8?B?dVI1RUdXVDRndlNiM0xJZU1GTWRtMWZ4NTN4Q3AxVFdDa1U4eVoxaVppNWN5?=
 =?utf-8?B?WVFObUVBWWxMMnU0bnNDYXgvNXdzSFZybEtoWFhsMVE4cHpVZVhDQ2syK1FV?=
 =?utf-8?B?WmhRcWNqeVJ2bTVjZVd4TmNwMit5K3E1Sk85SFUzb2FUZjNjWXNPaEpxeTFG?=
 =?utf-8?B?RU96MlpDWUV2L3Y0am9lWnp3KzZhUTM0REYwczNhbXVLR3VMODlYclM4ak4w?=
 =?utf-8?B?WE4yYldjeFlCSWhwR1hjL0k0dEhseVB6eFNIeUI5dXEvd3NEQ1NhVkZUd25p?=
 =?utf-8?B?Zy9zTUx1RDNEUWN0ZjJTOTdwVE5tcFRWTUpFNmFyNEJBanVwUUpUdy9qdGwv?=
 =?utf-8?B?WTd4ZVBjV2pTNlh4WTNjSUFEZjlHSHhxVE9sS2tnUHRHazlXazFTU2NNTWJt?=
 =?utf-8?B?ZVhUeGVQS2UrV3NuaFJnU3VRRDNwUHl2YVJzVmQ4S1A1NTRxQ1Y3MjFSbUN4?=
 =?utf-8?B?bUNHLzhJalpuQmFJWWJyTVR3UTlNa2svU2cycWI5SExmcVJrWVBmWVcxL2hB?=
 =?utf-8?B?YVlCNnpOYnVxT203eHl4MTBUWTdzb0JjUlBnRTFEQXI1UXRNYXpZbzlZTXp4?=
 =?utf-8?B?TGFVdlpkbHdpeUpqYzJ1SUVhL0RrWVpDeXYxVkVYWnczaytQbzJuUzY0VGxO?=
 =?utf-8?B?Z1piR0FTOHB6N0F0WDdXNEordnV4SEJuOWJDdWhiQjVwWmxjT2ZZT3hoUEMr?=
 =?utf-8?B?WmcwZEFDSUpqb3hibjdzeCtzOWZGNGVmWENWZjBSTHFwRHkzUTZPUjhkOGdE?=
 =?utf-8?B?N25vRExVREh3S2srN00vaWhQc2N6VUVjWThaaUFzVzNvaWtpa1cwRzFRTk1p?=
 =?utf-8?B?OU5uTm9OTXpJamxjeDhxMGFXcFN0K1BiV0hhYklXZHNZT0daNVhXa3pIeUxD?=
 =?utf-8?B?OS9yaEI2OUJEVE9BRTFIQnVaeGVkWkxiQUFDbUowNFlGZThIUnhjUFVIZWhh?=
 =?utf-8?B?WWtRZEh5cVVWS25FN1dMOFNrTURDcWpXODNXbHc4d3RZdmdvamViVFphTXRq?=
 =?utf-8?B?NVhJVm1tL3VaT0tqeExjWVJpMzMyVjBzV2tLRC9jK1RzNzYweXJBMzFyQ2Rj?=
 =?utf-8?B?U2hWWGE2K2xMdks1N1RPZTZ1M2pJZlRqWHRDSkdQNFgwb2U0OW53RVE3Yzly?=
 =?utf-8?B?QjdYN1NvTG9DekFLSFdTMDRvYlBYQnFlWnFUYTNWYVFBbFBESE9RZTNKd3VM?=
 =?utf-8?B?ZjFTaDlnalZPdFZKVDFpanZXVmRPMWhVcU1ZQWRVWTNtV2J4UXgwYUg4aUJZ?=
 =?utf-8?B?YnV5WlduKzdVdVBabXVFWi8wanhnUG5TZDM3T0QxSVpIdDlKWk0xWks3UHhq?=
 =?utf-8?B?dUt2MHF6bERSSElsSW5JM0UwYUdKQTlmUkgxbGpFY3lpTmxNa1VlUlhZbFQ4?=
 =?utf-8?B?RGJteVNDRHRJNjUyNHhhTzJITzBCeDRTTk0wMnVCbURwVms3NnJuU2RESFAx?=
 =?utf-8?B?L09FUFdJWUVic1EwNDFocVV2TWFhcStxSDVmU0FacFlmRFhzMnNJdGNMUytk?=
 =?utf-8?B?c1Rhb1ZOQnZOc2E0bERQMnBZbThuTk56alUzWW40ZmVrTmREZ05PNHFkU1di?=
 =?utf-8?B?WkI4S2tIMUdDUVpFWkhTSXorR1M5T3pqcTVlV0pML2pxWFgxWW5ES2FGSVhH?=
 =?utf-8?Q?ynibnk0BbJu6xDpj/oKkKBg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e2c9b3-aa95-41fa-1d48-08de284943b8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:27:06.8382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSk8ufTjeuNTnnttqT5V3vrW0e8h42sOZKJeKLrDbRX/zntNIs3Y5Nba3Wco1aZo9FOk6w0JsqCKdo4+qgQ31xWavY/p1ACCSdOEUCN1XLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691f334c cx=c_pps
 a=tP1g6Cq6k527JP85+VkTLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=TNbuoZVE6ZuB8b9Wv6kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6enCplXFSUkYKpDwjnXi3d9jiSP8RzE2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMSBTYWx0ZWRfXxhflryEjpZYD
 HzQurVnOTwa8AuZN5dig1SXg1yz9SDXUz22zpyU9T7dHIDr77FWY+6OyAxb0cmcvXkcbFgrL/at
 P9hTkOPFRL9F/ImBKAWNnG7/yp5jpP8VGkrFft4DAUae3ECLGhNJlbutDMOY3+jnj9WCo6JwrWf
 8lBJl4yebV/cPxyp0TmSlzmH4vqYkmcYGUdt7xHT97+PcRFynI2i1hI3h9H3d927ZG6nRsFqg9E
 IAz/+QjqE1rDMptCHQIgpN/mhTBFeeU706zcfaMpq7ptgoYVtHtlzTWwA75TOydiSfQ6kVTu4Hw
 izfiLeOfvFYS3Uw400WePS+ou3ak0dlyR1EUHKbYd9BYi8CgRJb6lbJLNxCudgOHzLAOaUyAEBq
 sTGqv77riBa3GsM/VYJU3NIDoXBxBA==
X-Proofpoint-ORIG-GUID: 7FDdZfx-jf9qx6BEtkKyDv3SCV1atd1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200101
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AKAS9Ua4105198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 15:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226631

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes for buildpaths errors after=C2=A0 enabling rust for linux-kernel

Co-authored-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
index dda235d4d0..c3e1137200 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
=20
+INHERIT:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kerne=
l', ' rust-common', '', d)}"
+
 # remove tasks that modify the source tree in case externalsrc is inheri=
ted
 SRCTREECOVEREDTASKS +=3D "do_validate_branches do_kernel_configcheck do_=
kernel_checkout do_fetch do_unpack do_patch"
 PATCH_GIT_USER_EMAIL ?=3D "kernel-yocto@oe"
@@ -27,6 +29,11 @@ KMETA_AUDIT ?=3D "yes"
 KMETA_AUDIT_WERROR ?=3D ""
 KMETA_CONFIG_FEATURES ?=3D ""
=20
+RUST_DEBUG_REMAP =3D "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kern=
el', '--remap-path-prefix=3D${WORKDIR}=3D${TARGET_DBGSRC_DIR} \
+                      --remap-path-prefix=3D${TMPDIR}/work-shared=3D${TA=
RGET_DBGSRC_DIR}', '',d)}"
+KRUSTFLAGS:append =3D " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-=
kernel', ' KRUSTFLAGS=3D"${KRUSTFLAGS}"', '',d)}"
+
 # returns local (absolute) path names for all valid patches in the
 # src_uri
 def find_patches(d,subdir):
--=20
2.49.0


