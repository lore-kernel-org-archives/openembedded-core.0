Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F908CD6E4A
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 13:12:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9913.1780060344469425297
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 06:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=A/gDGeoO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0609e296f0=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TAwNjl3893841
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 13:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=hq+cuYMZw+EjWm/U0nhn5fvnt4GHfUDI6MoxSeLLqZI=; b=
	A/gDGeoOonFpgoOsNe69BYN94CYGudyyAeeBuXaKxQqjw+/9vHnfgAZcpMQFlnaB
	byiKMmVInGx9h+LCpUt60TIAHGOtjtNTBvOgL4M+MK4lKd5TGVVBznnSGqezjfbW
	21gobO3J2OAmxcRwZkWLHXL65l+witoQFLatiZIGihxFI9+BuVfT0tZ2jdWgeiyJ
	AsmpTLJxyHRx0anVM44vnthA4fvFfA1OEZmSAP4LTTpXFWWOIA6J61K0P+ZLtuo0
	ewS+xF3kBlVQWRJvQeLrRGfwtmct9EuLEunhdaku8A6qS8YgkVWD2ZKco9xxog1Q
	hOVBxergNP+xV+PDQ4wtww==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010009.outbound.protection.outlook.com [52.101.61.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x8tesr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 13:12:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dRi312a28G/z1jT6WTHx9w8e3HLEGwCGbj0njdUXF5lAa66m0emMpEQt6+VVw2P+EHNQMaaw1m3F8DNBJzsu+qSyVqO4ncKD5zdOrtjSjh+qghrnj+T/m6lziOpOOtWRwulXeXrwxOtxfjY2nttaJEvKZ+AiEkeM/JR+eq/snAdqyiXVQ3WyJRB6TOz6LZfOLjtJjqF3jrsnSXQU0CpdcCF6gOuVL3JqdPIfD9hJnn0+NLMaAO5Cb9+t9rj1s86S1UKjs22/E6fLoOtTQdJ+M6LXr+XngIaOXGfiH2DE3+FgQ+F6O7Lz1qf2XUETjg6Wc8JPnuVxc/MV+6fVXm9/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hq+cuYMZw+EjWm/U0nhn5fvnt4GHfUDI6MoxSeLLqZI=;
 b=aIah0AZR8ST0MLLAsRrGtICi3YfIoJY5dCW55jdtM0CmCpXx9auOXq3sQZy4z1Gk4U1lhlyoNVif5+wXqA/4ZGU78IRorwfVAdN+STs22ELKwC/GH/vo+oRm7KnbaZgNVTWOHGDdQHm648MCtcb/QHtjcwlUeP/Uv13TfNJqJv6fPrI+LDqIrIIAiQwdyk76vFcg4DC4PB6upWXshmsO+4/9lLd5QmyPFLL9HYj3pEt/L0TwPpyqgkR2cxMJL3KGZaYyEyp5YCiQob457q72p1T951ZfF2fco8Qo0Bxs0KGlF2cFxkod2f5FeqZ5U7B/kEQEwHPihwV4UuCGDebh5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7785.namprd11.prod.outlook.com (2603:10b6:8:f1::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.13; Fri, 29 May 2026 13:12:19 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 13:12:19 +0000
Message-ID: <e5266b8c-be6e-441e-b0fd-a499e818631a@windriver.com>
Date: Fri, 29 May 2026 18:42:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] populate_sdk_base: Add Rust-in-kernel
 dependent packages for SDK
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260528172211.2652140-1-Harish.Sadineni@windriver.com>
 <20260528172211.2652140-2-Harish.Sadineni@windriver.com>
 <a7955e1e85859bf7c6a4a5f3c7a2f08f97ab5e81.camel@linuxfoundation.org>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <a7955e1e85859bf7c6a4a5f3c7a2f08f97ab5e81.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::9) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: d946d818-52a0-4ca4-f07d-08debd83e9e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|52116014|22082099003|18002099003|11063799006|56012099006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	hqbiB23J1LVfZmpUrWMC2w2KFB2hDV9YqtGSRUFO66Z/lVDdfvHwQOtRaDrO33bU20W91LvL1w82ZVFexO/9InGCOB2imWOdb5lTSMoaRoWvKfu5YYDRNQ6e1fxqoI6TBfAi7IEb8EJ7mvvmYBJbmE1b+wTTqVF/LOYRmeHBiWkTZG3inL+8gSKA/phMdaIYH/yeRSujaV1qRNTTaD4Vzvwuz6RukSy5mP5qTyTszBwT2M5Hw2wLaCasxNFAfYr7w+Yb0zpjM08E8iN07CPdEiE5xCFm4Avgntk6xhEUhSDaMiMhunNvpn1FVlT5V0E/ulLAzgd5P9Bi29g1IMQwezW13EjI7GUGVra7cBV4z4ZqIAq0wajqkJc3GnE12x2UlmMC+MEB8sVnm5b/+Pwg+YYj5AKHvLs3kIgTPzQRvtImIJioUbXoRbBmLSOidC8QV+2RAT8cvvKNf02tofu4G/VgeAPy9DUQILtzUISAFaYBrdEPHfZMuMPo14LD92ckSZ9/+kT/8OxEr4rvXUHVis8P/Pn4r2ASBherOELNYJfbleVPjEoFHbPNYqTZ7jGC8kXgsSwI79gT1gFrAG7wuz2WOfzaEh2/AF/jHg9PQPCyBa0Pjae+ZwXQjRKMiiQG13tNlG6xvzJjsWufz/m7SMj/ODicQB52NtujE8JV0xQtgKu6QYwLA22fhxoejya2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(52116014)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WUt3b2czTVllZDM1QWs2Vkk2S3JjcnJEQVUzQmE4UFI4dEp3QVJFaWNlVXpB?=
 =?utf-8?B?UGhmcGZzN2VoOTFndE5YQThseVZrZHIxMlRvTk9ESUFScmdKdXNEaXJHd0NG?=
 =?utf-8?B?QmlTVE5lSGtrSlR5ZTFTL29aWTgvU2xyV3c3NlJKYm8xNXJZMTRUVWQvSlp0?=
 =?utf-8?B?RXRHaHowbGh0MDJYUThjTEJpSkNOSEIvRFh0Zm9Ud3NyM29LWXJTUzlZOXhp?=
 =?utf-8?B?ZDIwREp1YUNGb25DUFJkRnRGSHhhWjRnWjR4UkNVb1J4MWRuQ3ZNUXFXYXpH?=
 =?utf-8?B?eUFEMnZuT3AxWHl2c3c5MURKcEZRT0Z4RmRGSHZDQ3NmVklXS3ZlQ2xlL1lQ?=
 =?utf-8?B?WWxaTXVVK1ZqTkV1aDViTVNnSFhrV0QwV2lVSnFncDN5ZlQrT0phNGp2ZVFq?=
 =?utf-8?B?eTQ2SkRnazZOTXF4YXVLMmdlQU1GdTNNalNuNy9jSEx3V1M5Y01YWG9TNjVx?=
 =?utf-8?B?Q2lDNkRHTWVEWEhucWY0U0pUejhpenlTSC8zSmluTGUwZGxvaXZ2SERHRXpQ?=
 =?utf-8?B?Y0VFZEFZcmZOWU9HbVpYd0lQdkpxU2lPVm5NbjdncUl4WFdhcjNNWGlFN2lT?=
 =?utf-8?B?VEtMTWwrKzl0SWw1ZlQrUFZhOUpWbkd3d3plZmFENm5MOE1zK3hlTnNoaEJG?=
 =?utf-8?B?UGlqNG1HWGxkWE0zOHlnbm1xYUE5Q3ZQcCtMMFlkWEtsRStKNWRzamJ6aGwr?=
 =?utf-8?B?d0Z6NjhqUk0wQlRmbjFkU0NRZGo3YmQ5WW54TkM2MFFnQkJ1eFM4RWRSNThZ?=
 =?utf-8?B?TzcvZ0Nrd1RnNlNncEJKS0ZWcXdUeTNHby9XZXFUWUNnL0J6WFBISkh5d0Vy?=
 =?utf-8?B?d0RXWDU2R0ZEL0t0L0FFWFR2UHFIUFZLcjB0eFRjZnVlVHNHdndybUdvSjRE?=
 =?utf-8?B?bUlZQ1JGSWNLcE0zelJKaWh4dUlZZFEwWGRkWmdRSXFnSGZ0OGl1U21zUHBz?=
 =?utf-8?B?dkk3M1NoOUFXN2tyM3NkT0wyTFZJWUlXWThOWSt6R1h1UFVQM2sxQ1c4dER1?=
 =?utf-8?B?akxUbUlQN3ExVjRrSWR2cXFtMmhsbUV0TXl5VlRFcURuRHAycWFlVUVHeXNx?=
 =?utf-8?B?ak5LSVVHVFlNQ0d0RHNzOW9RejUwOGRySSs1czdKbXNCUHlPMGNsR3J3SGc4?=
 =?utf-8?B?bE5kandIWVFCOEtzVkgwV2xiSGdFL3ZrNlhOZDFsWkJ6eUR6anI4WDY5a0VQ?=
 =?utf-8?B?RVRaMHFmTlA1c2YrS1ZXY1VFdjhudTlKZ2ZWS2NEODVWalZqUWtFVzlBS3RI?=
 =?utf-8?B?QjZMczVjVTNobjNXc0phTDRBNDlBSXRka1RXUWdLKzNwOXdpcUV3Y0pvVkIz?=
 =?utf-8?B?Z29XcTVoOXNuYzhkMWlhR293L1BMWk9kbjBXMVRGWTRya3Z6Tm1aUFFaQ084?=
 =?utf-8?B?eXJIbURwMk13RHA1TkdaMW1VeXJzb1dZK3d5YkIvaFBVSGlTdVVVUEUrM0kv?=
 =?utf-8?B?U1U1OE9LdlpGdVRwYjFIT0pqQUJUWkpmczNiMThVS0RwWExGOXdDUExhRWhU?=
 =?utf-8?B?S2RlemhWby9KK0IxWGxSU1JGUnJLak01djVldGQ4djFKc0FVdjh1QkRvWW1u?=
 =?utf-8?B?WW45UG9RUEI2Vkp0NWtXUWlKSm1JS2VqcjFIUWR0ZjkxUkJKYjAxTXdhY2dX?=
 =?utf-8?B?QUt6UjlqQnpNVzhiVEYzQXhudXVHWU5OUzVUZ1Z3SUtDRUljdnpZZXRLMXVq?=
 =?utf-8?B?MEMvK09UNXRRbkp3RE9XOVNGL2UySmhjaVgreDdUbmZGZENueVNNNzRpSTFY?=
 =?utf-8?B?R3BKZU9DTklYN0FLQ2JQb1RDOFJSVnladXprdHkvOXlWby9IMlo2eXVOU01U?=
 =?utf-8?B?TE8zMkdKQSsvdmlycFJ6MXlIaUE1ZGpwNFFic3F6MndTRHg3UUdiQllRQnhi?=
 =?utf-8?B?b2RJcy9wd3VpS0cwdVlWNzlMdlZ5bFlTa1FGam5ocU1ISE9IYlVCbW8rR0ZH?=
 =?utf-8?B?MURITkVQYTY3WXp5aGp6WDV6RWMwcXEvREFMbXlVV3NLNTgrbjZyaWhKL2pW?=
 =?utf-8?B?cjNITGtPOFB0NVNpaFArK3RmQ0tUVGZBY21OcjJMMVlCN2QzWlFFRGlET0Uy?=
 =?utf-8?B?cXJxQ1NTWVNJc1dsL1N3NzdzRW9oaXpRVVY1SG1aR0gxMVY0L2RMc1gxM29G?=
 =?utf-8?B?TGRoOG5vNjllOFVUbktNc0p6QWU3QzNud2xnTEo4cFBxcktUc2VwSnNjendP?=
 =?utf-8?B?cXdpOWVMOXoyYlliZzNXSXZ1K01uRTF1d2pSSXBJZjFLL2ZpVXhMME5IVy9i?=
 =?utf-8?B?ejBEeGpHQ1dLVmVSS2pWMWJxenFScmt5aTVLVG8yY0NvVTVlZ3FBdTlkWlFU?=
 =?utf-8?B?RnR5TlN2S05OMTgwWVZBRTR3SEZpNGVMemVWbzZBVzRsd05xakRaSzNGcG0r?=
 =?utf-8?Q?vU1xIxdmGdGJuOHJkTgV3WwfGKv+aoOvH9l0DhafB9GOu?=
X-MS-Exchange-AntiSpam-MessageData-1: yHQHWjQpsRrzXKjIPU9eG1UX9GfIzW0eIfU=
X-Exchange-RoutingPolicyChecked: 
	GapdEdq3RmpQrKYRq2UDxWPyTEXUgjWWji2W/IRcDB4x+qZ+WbpIrIVZTYqi0F1FBSs7x7JkV1xVMEUcIberKKsrSybwznYoEVpdiopYlVuo73fbfmYCtMwl5GnCwHWoNIXoi2IkcbgvR8qfISkuPQJjnvVr6PQxZa/gWtGLQEEq1iXSDlA/i9OGBo8ub4n8v+F9Mc0vAJcxNcSeCpw3fPYQCW7cOt5MlTeNUoONwEFH31JND0az7xr4a+ritEUGY42eYa6f3EZ/SEL7Ki4Xq9MKdAwLBJ8egcgf7AmE7vBZKJzz9KdoAOwdbNa6y4UGQU0RZ+1/Nzt+ILjb9KVC9w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d946d818-52a0-4ca4-f07d-08debd83e9e3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 13:12:19.8029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZ2fLWDUB6cIE/41ZLJ8OKAC6UaTUYWOnLFPVgLJyzNFxDm0gkIHutVymDow/lVR3OYGbo86A0UauxyZwc9ckp2Qj/P2EvPiyi6pd1L30dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7785
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: XOfrSWfQdKylhi00qTQA-euGobewoyNj
X-Proofpoint-GUID: SzTGcI6ZO6k7jT-lncZ4DhOYSHbTkizi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEzMSBTYWx0ZWRfX5JeVvvP3KCeX
 5+YrRjwX8hNtxzhf6wMrF+o2I/eKZDxlGb0TA5MImHN01Q7/by5gYqNO0w4zWue5vjGwnOGyZxC
 j2IOea2ehXjIGrWdjifxEuOdrpAGZOgS/O6orKYD7XqhfBfdGpEr6j681MaFIXiynfC+3t46Ezr
 wMCNYUfR83UA8U3JpA4FT23jMti+ZGo9AqzenmP108PINtWB1r/RFbjbj3NG/dWJqn3fp9DPhbz
 hnxAjvSxSa6J4fXSx8vpLQAvAWa/cdySdB6zE36etEPq2FZu/HwBkB9QO+Y6BdAXgpE2DML4x4s
 EJla6NJFgwk6AbD3mlcUcEfII7H2/FfVlah1YmY6DMLL2KBINwqYIDobvKJSdnXnxTbCBi8E59e
 q5aoeLWmtQ30ucoBZLp6BfTl46PFReZO1h3WG3HQtR5nT0G0ovdIS62v4PHxWakeZy7SaaIBvle
 5WyjSIBXD2nlLdE1Umg==
X-Authority-Analysis: v=2.4 cv=E6v9Y6dl c=1 sm=1 tr=0 ts=6a1990b7 cx=c_pps
 a=28cfJ68vbCdGklxr1LbY0A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=OM6xGQejSKCV6lE5FeAA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 13:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237755


On 5/29/2026 3:51 AM, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Thu, 2026-05-28 at 10:22 -0700, Sadineni, Harish via lists.openembedded.org wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> When KERNEL_FEATURES includes 'rust', add the required host and target
>> packages to the SDK to support Rust kernel module development.
>>
>> Host side (TOOLCHAIN_HOST_TASK):
>>    - nativesdk-bindgen-cli
>>    - nativesdk-libclang
>>    - nativesdk-rust-src-lib
>>    - packagegroup-rust-cross-canadian-${MACHINE}
>>
>> Target side (TOOLCHAIN_TARGET_TASK):
>>    - kernel-devsrc
>>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
>>   meta/classes-recipe/populate_sdk_base.bbclass | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
>> index b427ff2761..b345a65db7 100644
>> --- a/meta/classes-recipe/populate_sdk_base.bbclass
>> +++ b/meta/classes-recipe/populate_sdk_base.bbclass
>> @@ -74,12 +74,14 @@ TOOLCHAIN_HOST_TASK ?= " \
>>       packagegroup-cross-canadian-${MACHINE} \
>>       ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', 'packagegroup-go-cross-canadian-${MACHINE}', '', d)} \
>>       ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', 'packagegroup-rust-cross-canadian-${MACHINE}', '', d)} \
>> +    ${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'nativesdk-bindgen-cli nativesdk-libclang nativesdk-rust-src-lib packagegroup-rust-cross-canadian-${MACHINE}', '', d)} \
>>   "
> Similarly to the other patch, I think we need to define these things in
> a packagegroup, then perhaps just include them when SDK_TOOLCHAIN_LANGS
> contains rust?

Ok, i will add these in packagegroup-rust-cross-canadian and will get 
included with SDK_TOOLCHAIN_LANGS += "rust".
All the dependencies are about 100 mb, So we are not adding any further 
conditinal checks( KERNEL_FEATURES += "rust").
>
>
>>   TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
>>   TOOLCHAIN_TARGET_TASK ?= " \
>>       ${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} \
>>       ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', multilib_pkg_extend(d, 'packagegroup-go-sdk-target'), '', d)} \
>>       ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', multilib_pkg_extend(d, 'libstd-rs'), '', d)} \
>> +    ${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'kernel-devsrc', '', d)} \
> This seems a bit odd. Just because you've enabled rust support in the
> kernel, it doesn't mean you want kernel-devsrc in the SDK?
>
> A better way of doing this might be something like "kernel" in
> SDK_TOOLCHAIN_LANGS to trigger kernel-devsrc?
As the kernel-devsrc may be needed by other dev tools also, so as you 
said we implement like below for installig kernel-devsrc.
SDK_TOOLCHAIN_LANGS += " kernel"

By doing this, the rust kernel module development support in SDK enabled 
with below config.
SDK_TOOLCHAIN_LANGS += " rust kernel"

Thanks,
Harish
>
> Cheers,
>
> Richard

