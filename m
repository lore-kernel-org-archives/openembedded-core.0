Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47AFE7544B
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 12:39:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.119423.1766579974671355713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 04:39:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WokJFM89;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4453c26170=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOAQtBU3059608
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 12:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ahadTEWSAfuHUCh6VFDnOQgJTZ/Oug4zGa23sGlMxq4=; b=
	WokJFM89amUg1kfpHL7ja8jwZgySl5hymqpAD7JOaJYOuvfO4BrlzLlOnrO9PSyD
	YP1Vn5cjg5y7qEuGrBPfVQCbw03im9570AKaBzfGCpTFXSyVijwEYv+2+qy9mAFW
	kcFDAX9vrQHQhFApW3viEMaon9yPTn+EdIOlQ+JIsTZsgIdnqsn+RrjCW9oRHfbP
	gQRnCvIFQQexC3aTZbtvRybGpt5QpJlbEmnJgScXY7hY7abbLLDrRb+SVi3wxuJ0
	WFMVhpyhamwSeRa49HHVS6RUlNEMYjgRtHGJas3oVZvFVFdJPzv+7nuUNPuU9FDY
	G09gAOGJJ5bqfBrSS0xX/w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010033.outbound.protection.outlook.com [52.101.46.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5js745eg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 12:39:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIqTDELblx86YYpl+bzGpR4XH2ofbb1OYLd6iKLcuoWBJ0CESxgHZVo5m/qZH5xjAlaOsSSQGkgxyYSYqoM+gRhy4NvnS5DzhjxuyYCjtQ1kfb32ZCWJzbzAxfgJF1Nic4yTLfJ/O61xToyWrME5kEoeKCU7tLOWix57j0cwAWnIyiYpmj1C9wHe0ibWnd/qLltep6+jk47H71cA/O6T75/xhRtfET0CQMmnHOt6Do8qmK79v5Zmx5LMyGL4Aws8ZAGf0o+Px4KmJUYvHwsXmqgpJIGBkGWDRNqcmO4jOzw8leQIvEftwzVB2LNSx+cc4SAzf2c99VMn5ZxaGwEZ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahadTEWSAfuHUCh6VFDnOQgJTZ/Oug4zGa23sGlMxq4=;
 b=RPMtGY7xQC4DGGsqcvplzuivHiFE7MfFw5PeHZ3MYwJvmTEsOTcTDrg3S4H0BGV7p+20r8Gbe/mSPVESzi9ud4xQ6wleLPPi2IeThMS6LZ8hrQe9uTBC3RsxDrTJKjz8El2Q22YQw7W1fewNJFtzkNTWCV/X47RdYWwxa6mV2keFolyjvpUzTKSLLGfpJfHCL/hoyG1bLATMutGAvcWGACY7mX0bot3Kv9pghZpfdV1nX5LNIwxwedPsPJ4TTXqmEjp5E540CI7xWgLt+2ez0kA11fsoR5CSphqJYElSuFQhDI4wa3b7cvRtNfo2aRoAyYvORjXFqsEl0EDnmpwcIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by MN0PR11MB6112.namprd11.prod.outlook.com (2603:10b6:208:3cc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 12:39:30 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 12:39:30 +0000
Message-ID: <8da2cc05-7587-4264-843d-aa2e57cbc161@windriver.com>
Date: Wed, 24 Dec 2025 20:39:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] strace: 6.17 -> 6.18
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
References: <cover.1765878985.git.liezhi.yang@windriver.com>
 <1fc8161d254e37709e63cf9d07ebd32a2f1023cc.1765878985.git.liezhi.yang@windriver.com>
 <CANNYZj8=3egJPC3dT1bc-9n=38-OAyAKfwb81mJjuiSiqVcaQw@mail.gmail.com>
 <b127705e-0b9a-4a5b-9fcc-c3014e4c680c@windriver.com>
 <CANNYZj8c1DRLJfxZMVVT3fx2Db8fnUc8A73_pE3AasKRMQ6U1A@mail.gmail.com>
 <473904dd-5f19-4331-91a3-4ccdab694c1c@windriver.com>
 <CANNYZj9sUP6xxkOLauwXuGAZH17HM3zkmAzQHSp5vx7b5Gy2VA@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CANNYZj9sUP6xxkOLauwXuGAZH17HM3zkmAzQHSp5vx7b5Gy2VA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0362.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::16) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|MN0PR11MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f7f066-4f09-4272-6c95-08de42e97b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TkJ5Z3hRd1UxVkFpbU42UU8wM0R1R0g3bi9YV1FNR2YvRExkK3pmalUvVFh2?=
 =?utf-8?B?a1FVZWQzaWQ0Z1l5a3QwMU5HWm5aZFJVVXFRUGIrUG5RTCtwL3BDbGdhQkZ4?=
 =?utf-8?B?bFJQSDllK1VaUS9ZNmN1d3B0cnM2b1l2MHFRcmZxNk5wMHhDVjV3L0o1R2tY?=
 =?utf-8?B?MTlDU3FDRkttUEc1YXp5NmlwRGlLcytTMmp3cXB0czMxRUFCMVlubUNQdjRC?=
 =?utf-8?B?ZGJRSndtSDUzcll6UGxMRXFNVnZvTWZpOWpLOUwvVkNWWkxva2k5akRPNEVT?=
 =?utf-8?B?bVphc0VkbEd0S1VPOGNrNEtEeHM1WlBVa2RVamt6LzAydFpyMEdyNmlJblVw?=
 =?utf-8?B?aXkrNUx1NjRVM3FiblIvVjJ1S2xUZFB2aTZHNG5jUnovY3VJdERxeEpSdHpU?=
 =?utf-8?B?YXJKN2tOcnJWd0JiYXJlQmU2bTNjc0ZwTkF1UWU4YnVkTGYxa2ZYUGJWVzFH?=
 =?utf-8?B?ejR1cC8wQUxPWGlhKzloNTNqcWRoYXA5TDBDd2c0Zjh2NmhUWEZjN2xTTjZL?=
 =?utf-8?B?MGsrSmg4dmRSRzU0NWN2V0FwMVlsZHFuakZFN2ErZWhIM1ZzVWJaaG1KRVY1?=
 =?utf-8?B?NFBRN1FoRmxDM0xBMHZnT2ZrODR1WjRaZzBacHB2QWtqd2xGV1BOWmxNdERV?=
 =?utf-8?B?RFdHRUFDSXJxWDRUelA0KzZEWHNBWE9OY29PcUprYVRtREtOQlU1elpveXNi?=
 =?utf-8?B?OVZwTDgrSGQvY01nLzlpNjN4YkhGSXZqUlljLzR2TGtENncvMDRjLy9zRWVK?=
 =?utf-8?B?ay9PL3hTMk1oNDVHT1FEdDQxSFNBbG5uVHFUY0hUOE12bi90QnJ5Mis5NGls?=
 =?utf-8?B?czUyNmJPbzhvdFVObWlVUXdlQ3Znc1NoM2dxbWVEck1lc1J1WnRBR01SQlBy?=
 =?utf-8?B?WW8wMk52RlZwWnh3YXU4TExhOWQ4MWhxOWtNM2J2TklVdlNTNFhsQkh3MXhD?=
 =?utf-8?B?SHQ5NUhPbEVPV0RZalN1bk5tQ1hQb0duQmdiY2Y3clJYcW9OYVFZNnFzMWRY?=
 =?utf-8?B?Y1IvdXhFeFA4TzltUDZJbWJYNUJNSjQySVlrcitLZEhPc3dFdkxPMUZmRXVp?=
 =?utf-8?B?QzFqUmhZUjk2Tmo3eTFML0c3VFBPSVVkeitMbUlGVzhxZ2NZeUh4eng4UUxB?=
 =?utf-8?B?elRXMGxueGl5RUVhZnY2YkhscnNtTmEzeXBFUUpZMU5MZi9SZXlRVUdOWTNy?=
 =?utf-8?B?cDBVZDUrMTA4ZG5BbXNDcjhrVjh5NU84dC90SEh4QjNTQzNjWldOL1ZWejRP?=
 =?utf-8?B?NHBmZjAvd2doYTE0YWFNR1dqZ0QvMlJQY3hJcC8wdTA3dGtmMmJjMENZYzRi?=
 =?utf-8?B?TlpXYXR2eHk4czRXb0dvRHJUNDdnK0w2YkJUdThmczM4WHA3bUJRY0lSTlRr?=
 =?utf-8?B?M3FvNktueUNkTDU1STdIRHdTeXlvNC95bGZtYTNBeThVZE12c3ZoazZ3VFhl?=
 =?utf-8?B?VjZYSnJpYitoWFZyM2xBUFhSY3M1cFpNTXA1NnFkQVhqNGZUMkNIRk9WMUJR?=
 =?utf-8?B?Z2xSNXVZVWh0SzZvVXc5WWRsUE5MTVNWaFo1RkZ6Wng1dUFVTVNHMTMwV3Np?=
 =?utf-8?B?c1dnUHg2YWJHU3V3dkJpb0xlWUpUUkwxQVhsTjJYYmZIK2FrUHdKK0IrSHVO?=
 =?utf-8?B?MXE2YnRzdERsYzdVYm8wb1krVndmSG16N0tpd21TQjFlenVUYjdEVnB0clZn?=
 =?utf-8?B?WXpTeDNudTJSTFFUZ3hzL2E4NnE0bUFKSGdiMjNhdXc4UEZFdzMycVFqUFJT?=
 =?utf-8?B?Y2RzRkhDL2FyZWNSM1k3TVFpTzdBSnkyRHZTM3gvQjNCREZOTkdacWttZnpU?=
 =?utf-8?B?eklhMUt5Q3hZNmc4YjZ6cmxSYitPOUlHeCtmcFlNMm9ZNzUveVFaaDdtellZ?=
 =?utf-8?B?WDU2UzFEUDJqMlk2VCtaekZLYTZkcXE0MWFPZ2FXS1hHUXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K1c0TTdINmVmS0lDQXRjTU5IaGdzVjNkNnVtdE1KNGYrdzZyNkhlS3dFVjh2?=
 =?utf-8?B?ejlrUkZ6ajh6OWlWZmQ2Uyt0ZHB4dXREKzNWbzBNNlE0YWtRejNqNWpTQVgv?=
 =?utf-8?B?Rkl6STExRDBmS2xhT042akQxdEFuM1oxM2JOQWR4Y1dwY1F6eGpJQTdTVDV0?=
 =?utf-8?B?aVFlRnFreEJDTjZ1anpkRE1SNFZKaUc0cS9RanorL0JjNVBHSGlFOHJZSTcx?=
 =?utf-8?B?MlZMUVoyck53R3E2cGw3QXhIR28rWGoxTVlNRjVMclM1aW44NVhPNVZUN1ZS?=
 =?utf-8?B?eTk4ZVhiUTY4M0doeGVjeVQyb3ZyMzdMQjJXRkRLYVhTdHJmdHpqMHVxVklO?=
 =?utf-8?B?TksxZExPL1o2SVdMeE5yZDd4NldDV2JTS0JKV3pTZ1ppdDBKaTdKODU0NG9x?=
 =?utf-8?B?S0pmaGM3TVcxNVFMYmlZQzR5MzVSMk5hQWpZNXpValJtL21ZWVBnbDVWS0lr?=
 =?utf-8?B?dnNJNUZRNUNrellnOVhYVVkzQ0lqSGI2VDdDUVVhWWY1ajlEVG13YWEzZ0Y5?=
 =?utf-8?B?WGhCQ1ZpN0RhWEJqZ3ZZWkFmQSsrR28zYXBHNXlPcUtVdUg0UmNaWWlxMWtw?=
 =?utf-8?B?bzhNNHlVWXFPUXgydkNnOUdmNC9kS0E4MVpmZVQvYjNiVVlsR2Jtd2tkT3Na?=
 =?utf-8?B?bndrd1Y1MnRubjRGWVhnV042UDF1cHd6QmVlZTlGbkU0bmFScTJvdS8wbWcw?=
 =?utf-8?B?T1E3Y2tOODM1Zll1MkZ4bjRTUkNEQmxINHIvcEwydElkZHgzaXJWL1FIK0F6?=
 =?utf-8?B?ZzVSRGNobWppSkQ4bTdyNW9WcFFmbWNDWWJSNzFCNUJCRkVXMmpOcFJuMk9R?=
 =?utf-8?B?NTFJSHg2ZW01ek5uTG4yQnFzVEZBK2c4US84em0xZVhJWlVlY3FPdGw1dGhQ?=
 =?utf-8?B?RzhWR3g5YVcrSWxwTEN6SkN5K1lBaGtsWUlkYVYwV3hhRlROTGVsdVRKU2F1?=
 =?utf-8?B?dW8wYVJxZVBFTWpiY0RwdnhTOHFRbkJpQ1VsYU1qS2JReW1adXYxODlRUVFo?=
 =?utf-8?B?aUMzS2xpc2s5MjBwOUI2WCszVXdOdEUwZHByYUxDelRSQ1lrZnlhcDFYRDAz?=
 =?utf-8?B?ZFRuc3gxU2xlZzRDcTAzbjM4dFFGQ2twSm5BOFI5NkYxMUpjTHU1Z1VpSTlt?=
 =?utf-8?B?em9UMHp2dEpDcDlqaHVJcEkxdnFXQjdCOTV1aDROOGI5K2NzZ2ZCUUVrb1pE?=
 =?utf-8?B?aU1neVhxdU1OcEdyS2svbEJlRW9ENDkyOS9FcHY3L1NRZ3pmVkNUWlBRemlN?=
 =?utf-8?B?RFFFR09IUVZuMmlpM01iejYxZHlZWXprRTI1SkdMcjBmeHNqdlExRTdzMGtv?=
 =?utf-8?B?eTdqWjhFVU83S1M5ODl6TVcvSXpkL2ZLNTg1MzgvRFFYbzM2RGlvUjJuMElG?=
 =?utf-8?B?SzJVdkNCcnc0REdGTDZxNkZQNDNkSTNGUDZPT2ZVZ3huRmtzcGcvMEFPT1k2?=
 =?utf-8?B?VVp3UDgzSi94blE2K2ZLU2FSUnUvVEtFUnlrc3BaeHB6czBUSFRhN1dyRmhk?=
 =?utf-8?B?QTdUSzIzWTIyc2FIZnpLcVo3bGNPV3BUa0dVV3ZIek5tMW1WSkYxK21XNXNy?=
 =?utf-8?B?aEZJZnlib2hVa2lMVXpaVXlubWxhR1dVUEx0Wk9BQWVzUkltVHlIdFg5SnZE?=
 =?utf-8?B?TnF0bmVEU2xEVVBqTDdjYjFvYzcxU0l4MGI2TUlkdUhyZDhYaW1HSlJybXN2?=
 =?utf-8?B?djhzOVgvTFpBaFd5S010V25SSlBYbjF0OUxZUTQyUVRrMkIvekMzOVhsZ3hV?=
 =?utf-8?B?eFdCbkhWNHdSSVpkUmk4MDV1c3hkR0pxdTE3MitOU1JxNHZsN3BRYnFRbVNH?=
 =?utf-8?B?czlUS2ZRYndCMnNMaVZibVZmZVllY29rNTlFbzhpVkowSlUzNVV2WldXV0ph?=
 =?utf-8?B?Nk8zVlhnYk9UT1NkVzRQMlR4cXRpVkhKR3duV1IrclV0Q1RJenRBVjBPZ1dn?=
 =?utf-8?B?aVZvNVhPUzE0dFV1ak1hTWF4bTdtUGJ6RWpjN0FUN1Z0aGdjWm51V0gzclRI?=
 =?utf-8?B?dEpIYXZOVjhyTElFQkNidXIrR1ZHMTVCYzlsaTdKTEdqV3NWYThzVHRMQ2JB?=
 =?utf-8?B?aG0rdGJJRVlpZ0pkSXlPbmo1a3gzaEJ3Z3ZmUi83K1RJLzl5NkxVb2JSUE91?=
 =?utf-8?B?SWxxVGFCY3BsYXduNEZ6Z2FzNGhtMXJZMTh5dmx2Qy9QMGduUDU3UnFYZm40?=
 =?utf-8?B?VGNDNlhEQ3V4OEFzYlZ1QXgxOEJORCtjTU90cGpTOVVGcVZ1SzM2NVhFR1hC?=
 =?utf-8?B?VytlbnBwTDJ4bEltdXhNVFYwTHJaR01DT041ODNGZk5aOFFwRmxoMVNWcWxj?=
 =?utf-8?B?T3VoaklMSFZid3hjNWwwT3M5QmFTM0ZOVEQ5MS9melE3aWlZVnVQcmdhb1VC?=
 =?utf-8?Q?KcIhf60pydDQPtss=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f7f066-4f09-4272-6c95-08de42e97b45
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 12:39:29.9555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQO1mK1HqDKq6y2xc+/cPgVjA6fn3ZbCGoJxeopnxHqYWXJnPYV1uxkVeKigxw25S4iLf7VKH34F6+UHxU+XXnPj4hn6xREjNCXqRlRL8dA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6112
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: NQzggg6y-uiRnphXNHsU70v7K201vvio
X-Authority-Analysis: v=2.4 cv=To7rRTXh c=1 sm=1 tr=0 ts=694bdf05 cx=c_pps
 a=BmqlPTxv9Tigz04FbX2T4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=LMhjWw4B9rl9VLxC9eEA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -xLNUVR19Q2vtnQShfcMurKflWXx04MS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfXyxEWlNEpepLS
 Gq3xkQYPQD6200zc79t7wI7Zeee4TMToSAzh1Kg59avqjvvzVn6B2HvdP5pcw7Jt/7iFRau58fW
 Oz+H5LmRzU0iXvguX8oeK7hXciqel1IIu4pz3jmqrafoME2429h2YIThMvzasGT0ik7ZCXGIQ3g
 1jH/Q3z88aeXOSJch3IbU43iEInlKl/C+Jwsa7k9XloG5pSyLo9MAXNCCFAslf0TnOPyycrk4oE
 AzY9uTFk4eBrFHtJyFUAs5dlaDs24MJXkHE9DF0oiU+PZVqYP1J4C1Y6yvayDmVxaCXcEqHhdQ1
 NUe4e85GuKDVtyUR0cfj9XpGsmzMgLGkJg+6m8BcJ7ULWS0THgBKg4x4qIjsjl9W4y9oC0iE0Lq
 RbeRTz+srqMoIDnNzFoieb+PVuQ3XyEFM3PJtD68q9889phsBEuo4QitYEdSVAmFS64Ui2EEH55
 R9fVgIJBIgI1H5i+wWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 12:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228530



On 12/23/25 18:21, Alexander Kanavin wrote:
> On Tue, 23 Dec 2025 at 08:36, Robert Yang <liezhi.yang@windriver.com> wrote:
> 
>>> But we do run strace ptests, and they do not fail, e.g. with latest
>>> nightly master:
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2761/steps/14/logs/stdio
>>>
>>> Does bitbake -c testimage core-image-ptest-strace fail for you? How
>>> did you set up and ran the tests to see them fail?
>>
>> You didn't see the failure is because core-image-ptest has PTEST_EXPECT_FAILURE
>> as reported by Qi:
>>
>> https://lists.openembedded.org/g/openembedded-core/message/227411
>>
>> I can see the failure after applied Qi's patches. Or we can manually see the
>> failures via:
>> # pest-runner strace
> 
> Even without Qi's patches, if a ptest failure happens, autobuilder
> will report it as a warning, and for 6.17 those were not happening
> either in autobuilder or for me locally. But 6.18 did indeed start to
> fail in the two bpf tests, so we had to patch them out:
> 
> https://git.openembedded.org/openembedded-core/log/?h=master-next
> 
> So there's probably something in your configuration that triggers
> those fails in 6.17 that doesn't happen in standard poky.

You're right! All test cases are passed in 6.17:

# TOTAL: 1450
# PASS:  1121
# SKIP:  329
# XFAIL: 0
# FAIL:  0
# XPASS: 0
# ERROR: 0

So we should hold on this upgrading.

I didn't use core-image-ptest-strace in previous testing, but test it manually
with core-image-sato, so I got the failures on 6.17.


// Robert

> 
> Alex


