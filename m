Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC727C71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 15:38:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.170.1750088280820059813
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 08:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=826258ca61=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G51qO6002814
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 08:38:00 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4794c3svmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 08:38:00 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55GFbxIo010545;
	Mon, 16 Jun 2025 08:37:59 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4794c3svmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 08:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PY7RU/kpkcnrjDGeGt15HiUEL+ND4Ztc4/9L/v/4xWskj+RYD8WFuqzEN31WKDxVkpZO7nS6cZvTHne1IaV1CjdLHRdrcmi/QtIl4dxkTOnrrZIihkliXY6b9mRSNmgF2dknHe1B1enlmKbmlF0uSBSkJqEMJFY0UJlOs+3gcflO4YckakiC+Mma0DNdD1c/G122A1ogqoEKKk/BGFSsUhLI0HFu3FMjoQVUYrOAyB7iv+46eNJwGmTggPR5/l+77WoHa6I8S2//OXp8fZh5d4fgFKQbGC8mJwCViof3eVXIY6VLMnSpVlmKoU+ukIxZ98Kog2WOFggtDXDjhS8UbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0m9rUdr8s9KCAdCQY6Xiw0VB8Q4IQKT3Kn5nZLAQ0Zs=;
 b=oIKzuVwCCL0NMuzk4EddGC0gjwLAPqQ1VqPTlOboxUi61v8jHrChulF3PA1sWVLcGG94GOw2N1f+xjukbEOgaqY7XBHTyHWeQ+YbxgAZhvT/DTH5nJKmDsUMuP9Hl5UBjXmBzSlRTWvmQ4aWgMMKhC6U5K5VivZ9sgQ/XIkP7N0YeFTs/hytH8sHCLRgoLWKF4zxQ2xNie6P8Xa+H6F/uFLQb4e7HyxeJyUOQPuVPPvfFkV8udCGS2u9SYgiZQOwWobmn67eZLuAu4NUhC2qknQPpzFQS2hVYjBkmdSaPHPGb7lCtcvIDkYr9+5wrwlBDgxB8Kh1MIAh9k0gMEisYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by DS0PR11MB7970.namprd11.prod.outlook.com (2603:10b6:8:121::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 15:37:57 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 15:37:57 +0000
Message-ID: <87a6b6a1-c221-4d26-946c-d9c7deb5bac7@windriver.com>
Date: Mon, 16 Jun 2025 23:37:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/2] automake: 1.17 -> 1.18
From: Robert Yang <liezhi.yang@windriver.com>
To: ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1749554012.git.liezhi.yang@windriver.com>
 <3a20c600314b7acb3eb3015583a6cbc4ceb4970f.1749554012.git.liezhi.yang@windriver.com>
 <2420FDDE-F7F7-4A02-8696-66554E56924A@arm.com>
 <b38d42b5-c6df-4bcf-bdeb-b3cc32808e1b@windriver.com>
Content-Language: en-US
In-Reply-To: <b38d42b5-c6df-4bcf-bdeb-b3cc32808e1b@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|DS0PR11MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e580482-1f88-40e2-499a-08ddacebc406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RmR5Q3phQTg0dUpGbFVMYWFMUU8wZnd4VklodmZUQ1JXTUhyck5MWjFCc2Zn?=
 =?utf-8?B?MytYenNKQWFsQ3FFeW9Ta3IrcXFKRDI0MCtsTS9jRDd5ejJTSU4vY2U1WHdQ?=
 =?utf-8?B?V3lZdmtiN1VkaDNMZndpSFAyK2tPSXc2R1U4WmNPMTd1ZTNRZzJPaVlna1Ew?=
 =?utf-8?B?dWJLMm9Ram1lUWplTzc3b1V6QVc5S0FyVWFiUDY1NHNWZzdUQXNHeERDdlMz?=
 =?utf-8?B?OGI0TEp3dUxxTFM5M3RuNHpCSW9IRFQyQm0vdFNOdGRFYUV2STBSMWJaSE5B?=
 =?utf-8?B?OTVNM1dnaEluSEZRWjg3U28vbTdnWFNTdlRqQmlYZzltd3pGeW5TRnlERnpU?=
 =?utf-8?B?ajJzTS95Kyt0VkxPVzZnWHloOUdCUkVaQ05wcDdTcjdXOWljS1BkTEYycE9a?=
 =?utf-8?B?YVZhZ2tMb0NkUnp1aXZaU3c3NVpLM3BPSTIzdldCMFNvY21DUXQxWHZHSXBV?=
 =?utf-8?B?cldOWFV0aG9pK3Y5U0FhTnlRc2tWYjY4c25TdVVUa3JTM1NiT1VybWJML2kw?=
 =?utf-8?B?WFRVSUlScjBRSUFDaWEzdTJzQWRsSlRjbmJzSlp0VGMrLzlBb25DclJTY2Q5?=
 =?utf-8?B?T1FxYzRCZVM3dWx5bVlPQUhpQWorS1Y3M0NRZlYzZnZuRDJxTWQyV1gxaE1a?=
 =?utf-8?B?SDZON1pRcUFySndmSlR1NUtPbkY2R0xPamtqYTB0Mk9BYW1CeHV1OUZMc2t4?=
 =?utf-8?B?aHNXaGxxTHNuTW1ia2pTUU1udWg5NXk1KytnbTlSNXRnVXNjanBVYU5JK2VS?=
 =?utf-8?B?ZjRIcWVtZzlmbHdCM0c2eWhualhQK1RzTWxvby8zZGlKc2ZaQW9VK0hpckl4?=
 =?utf-8?B?U2lxdzdlLzU0aFA5eWFjVGt6TlNYbnhnbEczK2FldFNmcTJLR05wWEJ3U0x6?=
 =?utf-8?B?c3NQdlE5RXNoUXRxaE40MzVvdzRGZnBXR01oY25EdFdNaVRhYWUwT2RMb3Ur?=
 =?utf-8?B?aUsvWTRVRy8wV2pVN3h6QVlrSTY5QzBhL0JBOS81allqQXRTOVgvN1g2Y0wv?=
 =?utf-8?B?WDNURDZmWVA4b2IrckVHV20yQXJKdi9jVVV4NDVxcjQrKzNwVlU3WDgvbDlz?=
 =?utf-8?B?L3R2eUtiSnNSbCt5RzMzNXRodkJjVGd3WHI4bFlFQUYycWJlYnFqZUNxc3FP?=
 =?utf-8?B?WHR6bzNMRUFpZUpaVlI3c0FnbWVxWUZ0K3VERXVETkFsbEVCQVJYeWdxQk1p?=
 =?utf-8?B?YWEreDgvWW8vRGNjdUZ0NlFnRFF1Q0NqQ1h0d0J3emxtRC9sQjdIQ3duT1RP?=
 =?utf-8?B?d01hL1NRRHEyWHpZWi9rT2RPSFlMUTIzV3RZNmc2dnhlUmVnT0xoMEdFa0hE?=
 =?utf-8?B?Q3hPN3diYWJZNzM5RUdIMm9kQVJGbkw0YWVXckhNMlN1NUVzOU1DblRBWmR6?=
 =?utf-8?B?Y0prdGtQZWViTkxzcTJyZHNWbWhvVVhCUTRvajlXVm1ZeU50bGxoVnlnaDhU?=
 =?utf-8?B?QnpCeWxDZmxybHhpWm8vYzJ0Nnl0dFdUaVZ6ZTR2MVUrWkFMZlNXdExUOHdG?=
 =?utf-8?B?a3lGZnZTNmxvSkE0VUFkeVlwOXJlTzZtVkd1M2Z5d1JRdk53L3lmOUd2anEr?=
 =?utf-8?B?czUzQ2hXR0NvUHNqdFlxWUJvWUhQaXlYcmRxNVVHdXBKWDRnT0lwcDMxMzBP?=
 =?utf-8?B?RVgybGpsUWZrcTFNcXlITldwTkRBSlJTTFpBV0x6Z1hBZHlrWThYSFVRSDFi?=
 =?utf-8?B?RElKeFRYOHhpRFlPY2pTRVMwb3FDN1JnVEV4V3I0cHNyUXlZMW5PeFZiZi9m?=
 =?utf-8?B?N3QreU9pQU4wUTMxUTdiR0tyS2JPZVdzNTMzN2dIamVyVVpGem1LbjhMN1VW?=
 =?utf-8?B?Uk9VdTJsVkZVbk0rMG1UbHNSeXNRUW5UR0VmWGxqK3V2bVpoaHRURjhuaG42?=
 =?utf-8?B?ZVM3UzNpQS9OM21mU21paDJPUzZrQjNmNlloSW5pOXByV0d1RGVFYWhkejlR?=
 =?utf-8?Q?N5Q79jwzuIs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MlJFbmpST0lieCtMbWNOaFJpRGVwQXMzM2RXbE5GMFQwVjg0VHJWWDZsNVI0?=
 =?utf-8?B?WXBmRFdJcnBrQzM4eGp5d1MwR2oyVjZnVGJVaFBmMnA1VGJOVUlVL0thanhG?=
 =?utf-8?B?dVh6YlhhMWZzdmtDdU1vcHVCZHdna1M4ZDN2YjdEcnR0U3hIVTl2b2xLbzZw?=
 =?utf-8?B?SllubEZmTUl0ZVJrbXVtUitKMzhVVUR3dHExeEdCVUFZenhoWmlHakE1Z0tQ?=
 =?utf-8?B?M2xvR21QU0VQOWhJYnJpRm9oYUxhQjFzeWN0OW5temNXZlFodGtsOXJtcHJo?=
 =?utf-8?B?VDZQTDU1QTROWEFJRUMwSFJkaHRFVkl3MlcwQVBXUHc3TjRZUkZnUnRTSmZB?=
 =?utf-8?B?bWdmSFYyelJGS2hhTmNON2dkbDNNeGZPNFpEKzJQUkhoZENSd1A0elFxTEtZ?=
 =?utf-8?B?ZXVhQUVrbFhBYUdxOGFBN0pQNUpXUGlDa1BER203K3IyT0pzSUlTRXhpeUtT?=
 =?utf-8?B?bEczOTh2ZW5Td0JpNytDOTVtcVp4ajJ5dXFUUEhIM2dIMGpYbTd3Umd5c1lq?=
 =?utf-8?B?amZlOWU4TjNFVGt3WUV6MjFXeWRSMnlGUUhsejh1ZjY5bG9rRms1Ny9RUGpj?=
 =?utf-8?B?YytaaWYraGY3NmI1MS9ZYzl3N3I0S3dtTGpHR1Eza0o0MGpWUFN6REN3bzlx?=
 =?utf-8?B?ajBKZGFybHgrT0h3eHZJWlR1RkRsK0UwU2xBSmtJYlNCSTEzcEpodnZMQmZq?=
 =?utf-8?B?cWN3cHAzVkpKRHQ4bTlNd2VRMDNPK1RBYUpJZ0JzeElWcFRGS0xkRzFWNzZL?=
 =?utf-8?B?WDIxbldldzl6L01oK3RrNXUwZldyM2FMWGZ0Wks5Qk16OGJEdWovTE1UdHUw?=
 =?utf-8?B?dFJ5TG5VM05sMWptRlNwRWd5UFI2ZUpEUlFUQnNsLzMzeXFoSXZlaW11TG5B?=
 =?utf-8?B?dzR5RG8zL1JtdWEwSjQwRUtsM0Y5TS9ubUVWVzlGOVFhbThoUEpJK0ZrNjN5?=
 =?utf-8?B?eDJ2VEljR2o1QktudjdDeUNSSUJ4cER5RThQUzQvL0NpS2hrZjdGWmN0MDF0?=
 =?utf-8?B?eGFDempzb3hCUGF5QURKaWFoRDBhdEx2US9Ed2NSdkppTzRIMmxFZEg4YVpQ?=
 =?utf-8?B?OVpCUzBrUDlyQVpGQ1BaLzVZdStKWW10T09PU1lGR3JIT01hcjBjWEpVM0Jq?=
 =?utf-8?B?VG5TVVZCTTFJZFUwcGQza0R1enF6SHk2WDFta3h2RFc0R2d5TWpPbkFjY3Nm?=
 =?utf-8?B?ZVZ1eFU4TzBuRndZWnZzSndKclIrNGhiUDhwVEh6ZGw2N1kwT254QlJUbkxL?=
 =?utf-8?B?akQwMTJwdUg4Z2IzZkpKd0pVK3pYdFY4aWRaSmFRU0x5RFV2K1ZPYzduWFVi?=
 =?utf-8?B?WXlzTFdpSmE3OWUzTDNmS0JQZjBiMUVGSVNLeDhBOUhwK05ZaU9VRmZUaXoy?=
 =?utf-8?B?dG1BeDdNLzd6cy81WFVBbXcvM08wcjdjSUp1c3dyeVFlNG8xbDRHNXFZR2pN?=
 =?utf-8?B?Y1dEVWFROVprWEZ5ODVpR3duMklmUkhIOVdMeFE0UVdHNyt1S0FNRXIxRzlV?=
 =?utf-8?B?S3ZHR2ZCdnZidkNpUkZ1S0RSMXVrTWVHRGRROFkzQUdaQ0NLWEltS1RNS3JG?=
 =?utf-8?B?QUkxRjVBZGtXWDlSQmFTcUFqVk5NaGpseXZtWHhBWlN6T0gxOGxvWmpXSEV3?=
 =?utf-8?B?RHZQcTNhUXlid2N2L0xoaithMUc2Mk1DVG9SeThkTkdYQWpkWUQrRmVySzdr?=
 =?utf-8?B?bUtIL1pQOWlXdElscnNKdXU3UVViV2dHZ2huMEhRTzhGYjdXakRLMXJabnVG?=
 =?utf-8?B?UTROaFU1ajhHU08xdmF4YS9NaCtINGpOcDYzTnpZYTRuelF5cDBrK29CUytJ?=
 =?utf-8?B?S0treXdYUUVlK01ZRGwwQ3dOR3NFd1N6Y3dJYjluaEdXMGFBeDJqK1RocElY?=
 =?utf-8?B?SkVNNC9yS0w1alJFZ1MzRXV2ZmVqSHl5eUpkNW9yWUxNYmUxT3lwczZpd0Qw?=
 =?utf-8?B?bTQwUGJNZkFNL2hNazlPcS9lWEoyNy9nNUVseUJmWVlCbWdoYUlEMzRJcE9v?=
 =?utf-8?B?NHJwTTMrbVFKNk1LZ1VnRDBuclM1b3ZDVjYzYTY4MGtlTHpTR3dUbEF3VEEx?=
 =?utf-8?B?Y1FjYW0xRytoRllxOERtZGF2N3NTM2drWVpocFdyMThzN2lheDBmdFRuczZi?=
 =?utf-8?B?VjhMeVVKRG9uSjFmcHdmMlNGWXE4bzlBWUI1SWp3NStyTndwc3BWRUZyNC84?=
 =?utf-8?B?cnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e580482-1f88-40e2-499a-08ddacebc406
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 15:37:57.4025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KecGjoeiibsfJz0Am14iD4CpnSpH2bC2DIfFrXSy7UVMM36bdBohuTBRP6xtGOVabSN0JbPkhpBlVd7EjX4iS1ezmruaugHkDFvttfNMOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7970
X-Proofpoint-ORIG-GUID: XHZmgwxdGfF0uKCmhtijQzWUFzNVGda5
X-Authority-Analysis: v=2.4 cv=b9Gy4sGx c=1 sm=1 tr=0 ts=68503a58 cx=c_pps a=tI7H87ngqbXf/HBJ/Vc2+Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=AJu5Q4vYAAAA:8 a=jXPHZSV1772BSHGvzDgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1OHxEZ4uPFp8rhvYjniX:22
X-Proofpoint-GUID: DQZdS0KfrKJoT_aOmUerifCB5_3yHUUT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwMCBTYWx0ZWRfXzdQcr7kk2RLK HYucZRe67BzmtqzZ/WjTey6b91pM7o3/RbOQuV3M5Tf3fZSV3S3ATEvehbTSFiXcz0ROD3NKtFS p4IywSFOZWQ3pRzecqUq47zR7/5sxO37/AtbBcCN0NB+EN4r323tsFEqq8KO79NgHk81VUuPCnx
 adEytU2xVsjZA8j2ZvuEK4V8gYYGceJsgb2GjSN9mCXTFly5Y0Helsl3w20uesWhgOJNIyDP1iv 5BLY77MEtk4/1Et7BwSck/A5MDqc5eeqcw42rcXH/0+WC26DK1lIvYbsGdSefFbwXM6XcTf/yFS EGy4D6Z6z3AEKCsnIb7+k9QNnnEBWrvtB/5fISpZwnmzp6sXUWnzIN0GAGGDWVvz8Eyrk6JSZgZ
 X5HcZC/JNhB4wbeh5DJSZq5DoIRcJ/S0hY73dD7rU0NqNPHSVlCZGNCWwj7y6Chqd/UKrYGu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 mlxlogscore=605 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506160100
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55G51qO6002814
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 15:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218830

Hi Ross,

On 6/10/25 19:32, Robert Yang wrote:
> Hi Ross,
>=20
> On 6/10/25 19:21, Ross Burton via lists.openembedded.org wrote:
>> On 10 Jun 2025, at 12:17, liezhi.yang@windriver.com wrote:
>>>
>>> From: Robert Yang <liezhi.yang@windriver.com>
>>>
>>> * Drop 0001-configure-don-t-report-error-when-the-path-of-Perl-c.patc=
h, it is a
>>> =C2=A0 warning not an error any more, so just drop it.
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>
>> I still request holding off this until the rebuild problem that I=E2=80=
=99ve seen has=20
>> been investigated properly.
>=20
> I've replied in V1, did that address your problem? Or how can I reprodu=
ce the=20
> problem, please?
>=20
> The automake before 1.17's mdate-sh couldn't update libcheck's
> doc/version.texi, so the doc/check.info wasn't re-generated, then we co=
uldn't
> see the build error before.
>=20
> I think this can also address Ross' question about rebuild libcheck fai=
led
> with automake 1.18, it is because doc/check.info wasn't re-generated
> with automake 1.17, then we couldn't see the error.
>=20
> And for other recipes' rebuild, I've done the testing with:
> $ bitbake world
> Edit autotools.bbclass to triger rebuild
> $ bitbake world
>=20
> All of them worked well.

Ping.

// Robert

>=20
> // Robert
>=20
>=20
>>
>> Ross
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#218345):=20
>> https://lists.openembedded.org/g/openembedded-core/message/218345
>> Mute This Topic: https://lists.openembedded.org/mt/113567518/7304958
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [liezhi.yang@eng.windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

