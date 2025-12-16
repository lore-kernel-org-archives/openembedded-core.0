Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6123CD5B161
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 07:54:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17068.1765871688607396120
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 23:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=R4LPJp7B;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=444573d0be=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG401q91503340
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 07:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=11NwtUL8tC9LsMFrbOHUAJvBxrvyQgMcahqLNSk9n4U=; b=
	R4LPJp7Biy4jq0+1kOWXPplZb2T23bVU/aZRBONRB39/OmiVoPe+kfOozLRlk9RG
	PemIybVGqi59jAB1lOKh1CZdFim/FSZv4PiLVrxKhn+r3L8cufNUE30gtp7wIpVA
	Tre9z6TgZGR/cdgisBfG25joIkFS9G7YcNFIWr0rc9ppCAnnTD8iXmDaxr00X4Fe
	acmiPxkFJVul+V4Afe4W3jd9NhMElCfiZZSaOlJeg7GkeFZEVHUeaa34rj2a48Ik
	WyXMtmli2hI7gPYoYmoikbNCXmrVunRwIIrMLubmLGku+R+uB3loqIcDn/3+5sO+
	LozqIPVBfaxGYzx/iWYpag==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0wc0jtqr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 07:54:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcyvBp1HwQBXkkTcNXdje4rKd9+Y/wvXAV93Q60nepxsLFxSpEIKI7LQZfwbcaVAKoBOhvTVifXnjd3Ssbh27nTztTIZNVmWOnsRtFaXcEiiECuc88fZ+g09vWbJI5zG8CyUmzeEHW8nti2+04x+kpPsapPx5r0jhZm3oo/i/seSovGeNIpTpc1zhoXAb60r7TpdLg2eIJSuWMy2gAD1I4bLj4FNcL2d1m8OtmiYzSz0/cGBMYIeKaUSWKF0GJMxac8C+gnSaBy6pQhv1v1WgdEH/fAySOxYXZyVjXHTqBj3scXRxhcUVfQf186APtlZMzKIMop49/Ro/YOY4eiTyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11NwtUL8tC9LsMFrbOHUAJvBxrvyQgMcahqLNSk9n4U=;
 b=F+j/qJD0lwwvrDRPwbhqxDOkZP0jjDaZCFU5rw7a+aXe3kGxRTs9Zxh8vRAZ2p43ovRsTDKZDrKT27qnhKF4+2DOzVvIAaqCQzL3CgG7M61Lxl/ZU8RpHHc4AOiHhoJ7Ppq8LweCfqNNRClZluJzjXfrelGeYD4W1VN0gA0AkEfx1Uy8u6coFCpkMPOBEqTTNtjkJjGKbwFBE+225QhOGYYLGmvc2tHh56AxwwHj+6DIrtKbS3EUqluQC3rKmwuJnh34KgICKzLhAxoiqDhYmNGxQ+nTwy4sEv+HZPDItv4n1SEOUyl3g88S5e30mS1HJhX5LF0LIORHT1SLS6/I+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by IA1PR11MB8097.namprd11.prod.outlook.com (2603:10b6:208:457::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 07:54:43 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 07:54:43 +0000
Message-ID: <23ef3fa3-7936-49e5-835d-d7ef1e5a5198@windriver.com>
Date: Tue, 16 Dec 2025 13:24:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [whinlatter][PATCH] Since x86 .eh_frame section may reference
 _GLOBAL_OFFSET_TABLE_, keep _GLOBAL_OFFSET_TABLE_ if there is dynamic section
 and the output .eh_frame section is non-empty.
To: openembedded-core@lists.openembedded.org
Cc: Sunilkumar.Dora@windriver.com
References: <20251216074835.1317924-1-Deepesh.Varatharajan@windriver.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <20251216074835.1317924-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::6) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|IA1PR11MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: c6edcdf7-a4d4-47dd-5204-08de3c785fb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dnMrQUhidGpvdFk1QWE0Y1JnUVdJbGVVbWVmVmF6aFZBVWdnZHJwdUx6cTJi?=
 =?utf-8?B?dXo4ZUowNlcvVm8vNlhkZ01uWHI4UUd5NmlZbDIxbVI5OWxCWkFQYTVBWGZn?=
 =?utf-8?B?Y0poTzUvOEsycU9Zamw1TjUwSy96cVlQVUFnUGNCYXJJNzJPNkFLUlYxRWwz?=
 =?utf-8?B?SUJKSXZ1TVJzS05jZXJZZG5vblhsWTBpNzAwMmdqU2tHYTBoOEJaa29jZndw?=
 =?utf-8?B?SkU4ZUtUY2RVdUJ1NDVOVkhjdExMOFliYmFOZm9GZW1qNm53bjhjenBhTXhh?=
 =?utf-8?B?c0ZTRFAyUUNhTFpzR0p5eUE5U21RWTJRL1NES0ZoZms4ZlEvWHd0Q04zVmRO?=
 =?utf-8?B?dnpaWjdZSXpKQUVuTnU2TDhhZTVLTzJjNlFaOEcyQkkvZ1dhYkQvRkF3cm5J?=
 =?utf-8?B?WkVmdUdGN2UyU1NTSEdiK3QrbmFZUDRvNkpSOFNoaDRsZWlxSThMZ0h0RXZi?=
 =?utf-8?B?cDBleVRqQmhjOUF1TVpkaXRKU3pGMnc3Qkw2RkFneGZGdGQxUlU0NVBiQnhv?=
 =?utf-8?B?STJNNHlUaUZPVDlPWTdSWS9KbVVRaEF5UUdCL0VqclpUdk9kMkFSUDh4bFR6?=
 =?utf-8?B?UHY4ZjNZSlZxK2ZzRWtMU3YvZlpxdHhmVXA5cVFtdFpLQnEyWTNIejlnejc1?=
 =?utf-8?B?ZDZidkU3ampmQk4zb0Q0RDd5ZS96UktpMDJSWnQvajVnWXZlKzVCQ1lQSTRJ?=
 =?utf-8?B?NmVHWDFmZytFZ1NLc0JlcUlDRldxa0pxYmtTaUpwSU0wM0JVMFFnRlhub0xo?=
 =?utf-8?B?WHhwR1dVLzRXNG81RUI3Z0hnMjExMGh4eGsrWm9UeFNuR1dBb0xQZHp0OHF1?=
 =?utf-8?B?THJmMlN4NkdtbzFYSmJ5V0s5c1ZzblljR0M2d280WTIrV21PVjVuUHp1b3Q5?=
 =?utf-8?B?eHU0T0tDVTFmenNWNEoyZlRtaFR5Uk9mRGxXQzZBaWo5TW9CUEpPaDNRS2tW?=
 =?utf-8?B?Qjl3OGVTR1EzMFZ0ZGp6YllPbm1kRDQvN0hGTmZzL0Nzam01L3JYSURXaFNh?=
 =?utf-8?B?UFVEODVIeW5lR3A5d1Rabk9KWTkwUDRXRXM1U01tUGNhMlRFZDNGOUNjbU8z?=
 =?utf-8?B?RGhLZldabVRlQWw5Tys3bEl1ZGthYkxnZG1zOThmdnBSK21LN0YzZW00ZThy?=
 =?utf-8?B?MlV0b2VFS3RmTlMxUy9QMTJxY01pRDB5aFM4TVFXalZ1QklTaUIxSTFXRldC?=
 =?utf-8?B?cjdmZW9RTG1BdzhXaStvUE02aS9GNkQxWjJIdm0veTBZYWN2bm1INW1ESWxG?=
 =?utf-8?B?NXdyTVNWTFJ5TDRuVExOVFh5UlRTcnNqZlB1MnNGdDVpK0lVZUIxMzhpZ2Jh?=
 =?utf-8?B?TjBKdmlwcVZaZ3RNMHd2NEJaZGtQd1BiQ3duYkhUbWIySVdVMnBtdWswREVY?=
 =?utf-8?B?Q1R3R0xhcWRmVGJNMWxRYjJ0MWdTd0F3RXV1RXhkL0l1OHJXbkRlUXcvendr?=
 =?utf-8?B?MGY5blZ6aVJWTmxqVEh4UkxuaGhSOGE5NWZJRERCWEw2STU4NU8zQXRVODF3?=
 =?utf-8?B?ZElhOGJ5cVYxelZyekJmd1Fmck81VmpVZkVkK2R2UFdudm5KUy90RlRwSXRz?=
 =?utf-8?B?WW9TZnlvMU1hVXl2a3gxaVBaS3JoYzNiM3VZRlFQSDNGcnQyMjhVMU5JUCtI?=
 =?utf-8?B?cjFwV2xCYjlGTjNsRXNJQmZ6b2E5OS9sQlNMZFp5OHphRDFZV2s1M0NMU0pu?=
 =?utf-8?B?cHBzYVI0eUhzZXVMRkpmM3BHYmZXWlFMaEd2MStYbTlQVUlLaElTOWtZdlF3?=
 =?utf-8?B?aGZiSERYc3dnRHFaejY2Q2lOdWJFR3o3RTlXdmxCbjE0SkpJUFJhNFZCUXBs?=
 =?utf-8?B?NzZKeWtzeU1rV2tmUnpxRUF0bWpBSC9BWnhxRGxmR0lldWFCNkx4cTMyb215?=
 =?utf-8?B?U2xkRUJnblVtdS9IclY0MHBRcDNOdFVXQS8rQm9TdkFZc2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TUFHMWxvdzZoR1oxYVZOZnh0WW5nRisvWklJMEdZK3VrNkxUNTlqQUxnV0sr?=
 =?utf-8?B?YVk4YlpXdnprSUw3TlNQZFE3UE95am4rQ3dvUU5ZWkRsL0dSMnUwV0w2VkNa?=
 =?utf-8?B?ajh5elRRc0ozZlhmbEdKblVNUDJRcWIrMU8xYmlBYTZCSWhVMVZrTEFqRVJD?=
 =?utf-8?B?Wm45dk90alZGWTRBUkowMVJaQXJjZVJqcERYaUs0Q0F6bHdIaWVDZHVySzBk?=
 =?utf-8?B?STZsSEdUSVpnYkNic05NSW8vSHZmOXhIYzRINGVLdFpkcnNFSGdkb2pZM2di?=
 =?utf-8?B?WGtvZzhDY0FNY3dHTXBiU0JpTCtNSXpubllEQmlYajhoY1M5WVpiTWVSWHBP?=
 =?utf-8?B?UkpZcm5mYkhBaXN5VDRjY3Vaa2E1RVcrMU91d0lKK09CanBMYjY5cFZGUUdj?=
 =?utf-8?B?TlJNdHJZVUgwOVpibm9xV3JMZ2UvZlBzd1pTeGw3Tjl1bjJJZ3FVSEcydXF4?=
 =?utf-8?B?QUJ5elp3eDV1bnNsTnd1V0tiVTJoNjFBd1lUcEpiUEZFUFNkWXdMZmxUbDEy?=
 =?utf-8?B?d0F1SWloOEV5cGZaWjdMeU5yeDE2dHBuTXo2NVB1V09vZVRRaFk4OStUUGJZ?=
 =?utf-8?B?cHJCRGsyMXdkUVVqUysreUFZMUhPaHNUTmhaMnhtUzVVWFM3d3dqMWl2aDNT?=
 =?utf-8?B?NFNFM05sdi8yRXI0YU4yc0ZnbTJ0d0lZVExad2pMbXAyKzJCSVpQZktOSldJ?=
 =?utf-8?B?Q3dBQmpvMWxMdXI4K0ZwZHllYjFkdHg4NEpRMUJDS3NSMHU3T3RCc3owcVZH?=
 =?utf-8?B?UGVJMklQN1d0NFdHM3pVeXFDUHltd0U0cHEvblVMbEZBM2doZTJzenBjRUVJ?=
 =?utf-8?B?SUE4NEZnckpzalozMkZUSDAyc0Z2RzFkM2xQL3A3aDVBUm1QYTd4cUN2dTl2?=
 =?utf-8?B?NkpYbWUxRlhjWDU2WDB6TnJOZ3dLbW9ucjlhUVY0cFo4bmpya1lMdHFQUGc0?=
 =?utf-8?B?YVpmdkxVVTlIYkJ4TDlMcFRzOERhaS9KTWU3ckxZTWVXR2x1aHRmd2VpNTJD?=
 =?utf-8?B?eGtQV0VBYzFtME84dDhzMHUrTTRzZEJKbHovc2JWS3p3U2trcXBiY1NYWlpW?=
 =?utf-8?B?NkhlZ2daS1NhWEpIREVtVEVFN0lzWEQ5TWIyVWNwYy9vdkUyOXB4Wk9LOFRm?=
 =?utf-8?B?MEVhSzcyME92dUlyRTZjOHd1Vm0wUnFoeHN4THNkc2FKajVwcmxrRlJxMkMy?=
 =?utf-8?B?Nm5haVVVZkVJN1NiMFExSjVvcGR6VHBsSTRydXpQbUxSYkE2RGY1MzBDRTJ4?=
 =?utf-8?B?N2dBNjdOUytTang3SHN0WStaNE5KbzhzUUNuWFdQdVc2bVFQNXNMZGVZdTJz?=
 =?utf-8?B?SXlVSmxBOVIySEZnQ3hvMXJKeHlUckc0QTRnU2xqeEcvT0haMElsMTNCK2pD?=
 =?utf-8?B?TGJLZEtUWVh5dTBPRVJRa2JRcG1xZmNFeXJXNit3YWlJeEVPRXpaVW5wMDdG?=
 =?utf-8?B?VTIrOEwwT05mM3hhcHk0dXZCaGovMnY0OThQa3pDOXVKUmR6aU42bVNRQVVR?=
 =?utf-8?B?SitnQzhhTmRURVlNZFEyU0dCSWtxZHBUaGF3ckdwQTJUOVFJbDk4c1liUTAv?=
 =?utf-8?B?U2VoYm5BODRMYWl2OHZPcTQ4RncxMFJPcm1XQXZ5UTRsQnFtQUc5V0Q0SW9F?=
 =?utf-8?B?aHJoNTJNQTJjMUpoRmlvK1grdnFIdlhtZ3EreENyZCtPRlppZ2FwZ3VmNkMr?=
 =?utf-8?B?WXpUbVpIM3huSFBNOXc3RTZNSnNkMkZRcEFCWXQwOEwvMXJsVXNTaS9sUnlD?=
 =?utf-8?B?cWFCeXEvU2IxT0VNUVFhMnBzV0pSbUJkeTlyTnVuQ045MUJoOVhmdDZyaGFG?=
 =?utf-8?B?MGR1RjlBNWwvcGd6WWw3ek13RFJrOGRRSXh0dFRRcDVZNGNvUWVEbVFFWGxl?=
 =?utf-8?B?NmNXQVlHNDArMXV3TmNpRVJpdUY1R0Rad0YrRE1tMmswVW93Q2ZNbDVPcitF?=
 =?utf-8?B?dXQvcHE3UXk3U3YrSFRKUlVMTzJkU3BZUjNldXJRU1p6QnZ5cnEyanNlTlAx?=
 =?utf-8?B?YytQeDg1Ty9vR1ZZWitZYkVzYXRuTjhNcVdSNERoRUV4eGVkQS9xdWpFMXVx?=
 =?utf-8?B?M0VBRm5WMnZrTVB3ZVJuT2M3UVpRMkhzaVROUnBTUTdCd2xFT1RGazhhTWh6?=
 =?utf-8?B?dEVNUk5LT29tSGFPc2xzNHh1QXBLUno2cnJjaERKSHo5cGN1cC9yQnZpZHZ5?=
 =?utf-8?Q?0UVzKI5MDB5pfAlIP17Nq/E=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6edcdf7-a4d4-47dd-5204-08de3c785fb1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:54:43.6523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9bRqTReKaZ3h7QNP1DX7pVHsguLs1cPmq5b3VUxMaJZ9RgCcCjYU1m53mz6WNLwaSeIs5r1I64B0eUdcebWo/ioHhucHW1Q6Rb22fNiOC+o2jha/V4ZrxBow/PngJFw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8097
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA2NCBTYWx0ZWRfX2wSD8KYOUYxF
 JDi/JaaSOf9l7Eqy7iF5vB99PxoS1R6EwbFNRPrzTOR+/qdDUZDCMnlH3sXaBvvOtkQrv9xygjT
 vIF7tu7iHpasaoF1cz8nmvF3uAM0/nSqoEnAG31qG/DNme+iCwxpdSXzyd6FUWpyhbReLnfZYx6
 AjTcgHxBnKBHfatLP3TYHYdjZAz5nsehvFO7ApiP1aD/1bHxzHdxKC8xAtrVJ8C+/tWqiGpJ+uO
 NjSpG2V+PKEaYMr45CfFpG0AOe/0MTbXSxV7fnTrAgFt4CgaLixo3878LFWkIGXbJf5TUbu9xnW
 n/s3HgF/QU3tNFAOh+SHrY6NhDg3HxAri7mdDECpP52ussrH7SUvRr4E1STybaWHDpnZwqXezqR
 iADI//OpA9uyEiAwBbQhPLOUuSXXog==
X-Proofpoint-GUID: pS2g5YRZcHQ99Xg5IaQbbnSaMjwcEBcD
X-Proofpoint-ORIG-GUID: pS2g5YRZcHQ99Xg5IaQbbnSaMjwcEBcD
X-Authority-Analysis: v=2.4 cv=B/60EetM c=1 sm=1 tr=0 ts=69411047 cx=c_pps
 a=Qv0FdJiMAyQkWbHkl99ofg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=T8du_Nv-FOP-edpps98A:9 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 07:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227760

Missed commit title. v2 incoming

On 16-12-2025 13:18, Deepesh.Varatharajan@windriver.com wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Backport a patch from upstream to fix CVE-2025-11494
> Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>   .../binutils/binutils-2.45.inc                |  1 +
>   .../binutils/0018-CVE-2025-11494.patch        | 43 +++++++++++++++++++
>   2 files changed, 44 insertions(+)
>   create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
> index 288475ac39..58964a6cfb 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.45.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
> @@ -43,4 +43,5 @@ SRC_URI = "\
>        file://CVE-2025-11412.patch \
>        file://CVE-2025-11413.patch \
>        file://CVE-2025-11495.patch \
> +     file://0018-CVE-2025-11494.patch \
>   "
> diff --git a/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch
> new file mode 100644
> index 0000000000..dc4b413658
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-11494.patch
> @@ -0,0 +1,43 @@
> +From: "H.J. Lu" <hjl.tools@gmail.com>
> +Date: Tue, 30 Sep 2025 08:13:56 +0800
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]
> +CVE: CVE-2025-11494
> +
> +Since x86 .eh_frame section may reference _GLOBAL_OFFSET_TABLE_, keep
> +_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the output
> +.eh_frame section is non-empty.
> +
> +	PR ld/33499
> +	* elfxx-x86.c (_bfd_x86_elf_late_size_sections): Keep
> +	_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the
> +	output .eh_frame section is non-empty.
> +
> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> +
> +diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
> +index c054f7cd..ddc15945 100644
> +--- a/bfd/elfxx-x86.c
> ++++ b/bfd/elfxx-x86.c
> +@@ -2447,6 +2447,8 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
> +
> +   if (htab->elf.sgotplt)
> +     {
> ++      asection *eh_frame;
> ++
> +       /* Don't allocate .got.plt section if there are no GOT nor PLT
> + 	 entries and there is no reference to _GLOBAL_OFFSET_TABLE_.  */
> +       if ((htab->elf.hgot == NULL
> +@@ -2459,7 +2461,11 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
> + 	  && (htab->elf.iplt == NULL
> + 	      || htab->elf.iplt->size == 0)
> + 	  && (htab->elf.igotplt == NULL
> +-	      || htab->elf.igotplt->size == 0))
> ++             || htab->elf.igotplt->size == 0)
> ++         && (!htab->elf.dynamic_sections_created
> ++             || (eh_frame = bfd_get_section_by_name (output_bfd,
> ++                                                     ".eh_frame")) == NULL
> ++             || eh_frame->rawsize == 0))
> + 	{
> + 	  htab->elf.sgotplt->size = 0;
> + 	  /* Solaris requires to keep _GLOBAL_OFFSET_TABLE_ even if it

