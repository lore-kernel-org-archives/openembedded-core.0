Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D734E8FDB1
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 10:59:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41341.1767005967156441106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 02:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=asmIL1LR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5458eb3737=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAo2gw2499547
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 10:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=iHYEe8J78vZ/6DFc8mQZ6fpcXhncBg26q67c9XXdSF8=; b=
	asmIL1LRZbtsVQXV+/e44+jlIypYg92w/aJMwXfd+iqRmBlA0tXPOX0rh+N6Tlbt
	QRQZA7jFFGHv1sWAvlLpI3RilLD66oLyI4IqR+j/hcu0vWto1qnHvZ0kDmeo4OEe
	HzLrXfhghXW4s4ju5HXScwm12k9QivZsVaDFCmIn9z/L7075vLuryot2y15GkZ+K
	9qQuedTZBtMBuxHICqrtgYlVm6Ps1ehXmmYJN836tmXqcG7iD6FccTrbKIo3ucRP
	gaR0GcKY4zwwNjfmn8x1Ehwp6KvUdV+uSRenqwkHiQPAHI8AMjILxgwC64iAEshv
	P5/4l2wFAEB+Iefx/KB5Ng==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010032.outbound.protection.outlook.com [40.93.198.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4sk50-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 10:59:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMVZb4giMyIG8PhKq/BZbaXathJtbySXQsGl18BDpyDrXH3muZEI5UPOnJFcH989ae9rB2ZPfti6z6DWjtzs7GVgQAHNVTLdHvHc7V4Yqk24pV8ZxQOznf1T+KKk0NPBYiqidhVVkpPhkOHUZBGfxoPvEkM/pVx1pcA8ANgGi3bnu4vn8tJsg4/2HlML0mp/2mCAIsyI+fUQ7ktNb8AgjqL+xnTm/805TGp28rSZwmQTkn/ej0HQWP/ZPalLRmx8EC3ftU2AQPwyX+AZk3Rv/5kudN3IBd6hyRLskMMuZnXnwRxPPrCrIZgez7VNVXFXSI/huXgkOR+uCL5lyceu5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHYEe8J78vZ/6DFc8mQZ6fpcXhncBg26q67c9XXdSF8=;
 b=pe07ombr00u97QurRJnQp+Ti2IdmcSwP7tPrWWc+V7OlfT+PdT0q3OeqKJXqjZ1ihUigFyEDc+eoUOnscPW0k5uAXYCi4pZRJY1H3H56p7XtAHw1yJlziFdBo2ZJtdlaXY/Vp3lLA73reNTfXgtIve5gL5Jm/LL4sANK+4IGrwZC2Uts2OnQwPtgzLMqtIlY5K47dkNSVBemo0pUh/uRD+qM+7D2rRqT9PSjxoR794zKEnxMCLONCf0PKW71p3V6/GVGfPus0RzQ1CiYjwTOZi5HTcu9R3vnqewfrikd5/FrEo4DUjeLwh5rTEuacjdWaSSjc4DXWeyzvvGo0KGO3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB7588.namprd11.prod.outlook.com (2603:10b6:510:28b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 10:59:23 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 10:59:23 +0000
Message-ID: <cb129cdc-5082-411c-8676-8a733a91d8d0@windriver.com>
Date: Mon, 29 Dec 2025 16:29:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] kernel-yocto: add rust support via "make
 rustavailable" in do_kernel_configme
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
 <20251227113251.773795-7-Harish.Sadineni@windriver.com>
 <CADkTA4PX8XgjzzN9WOzrXiXR3fvExGS40gVw8KiXoaCX8TCwbw@mail.gmail.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <CADkTA4PX8XgjzzN9WOzrXiXR3fvExGS40gVw8KiXoaCX8TCwbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0329.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH0PR11MB7588:EE_
X-MS-Office365-Filtering-Correlation-Id: 5446c3bc-5f95-4086-167a-08de46c95329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z3BGM3U3V2tqcEI3a2ZFVGF5VWovSDQrNzlEdUxsQzdMNUZoR1pnWHVXamRr?=
 =?utf-8?B?VU0zci9LenZNZU5DbDZTN21EMzFTemNiY3NwKytQQjA4VUlvbzV4N0FNTUFV?=
 =?utf-8?B?b0M4aVBGVW55UU1iQy9pVkRidE1SdHFrRHU0b2EvRHdFSDBJUnpJdXk1ejIw?=
 =?utf-8?B?aHB0VUE4STNJMWEzWC9BZHRTOWd0NHV5d3dOYmFmMitIOStLVlNKVE5oWGlL?=
 =?utf-8?B?aExpaFVBRXlLdkFDVEdMbzRzQjFpSjNrYUVzNE5TMFkwb045dFY2M1dhK3lx?=
 =?utf-8?B?ZnRpSC9PeS9QSWJJYnlpNUxKaTY4RGxnc3NYelpxQTNUejM4UzJrS3F3ZGVp?=
 =?utf-8?B?SjEvazFhbmhqa1hlMVA0VHN5OEJkTTZ4elgxRER5cHJra1JER0dOTnFldC8v?=
 =?utf-8?B?MC9jbnhPd3J3ajJ4ZGRZUEVSWHFnYVlVRU9ReGRmT2N0TUNLK0FCeVBlNjli?=
 =?utf-8?B?SnZldERxWm9LWlNMSjRnTHFoNkFmN1E3SWdjQ2JEa3pxMGNLaFZPY3p0RGpD?=
 =?utf-8?B?MHpMc3cvd0ZqOG9ZeU9kVkNQbml1NUxjOFJCWEQxRUxZU3h2MzdvSHRQbURL?=
 =?utf-8?B?bk84NXNsaXdDV2lOS2JXa1djOENtK2VPWXVrNE81OWZjOWs1Rm95eDdyZ0ZQ?=
 =?utf-8?B?WmJlMDdEc2tST1lTSEp1bXNhTFNCM2dJMEFWSU9rQzNDRmpHWjVPU0orSEJz?=
 =?utf-8?B?MitJbitvSjJJQ1pYaStwOTJqOStFMnRBclF4d0k5aTMyM2ptMU9FMmZhQTdC?=
 =?utf-8?B?RW1hNVppdjVvTGlnRmdFYWZtNEpuQjRFSVBzZjZqVi95NHdCa3FqVUJ1b2NX?=
 =?utf-8?B?K0xqejRuTVFqNjQxMUFkRE4zN1Ezc1llZDdFWnovb1hUblpDdjgwdFhjNzBR?=
 =?utf-8?B?c1k4a21jTUl5elMzMFkzczdxKzFJRjNyMDhmQ1BMQktCanNVNGE3ZlphNGNL?=
 =?utf-8?B?RGpYWEw3Mm1YanVaaWN5RzUwK216Y0pMWmhXaUM3TTJOUzVMNHJWWXVYVE1v?=
 =?utf-8?B?cmY1ZXdtak1qdlFISUNBV01oV2czMzVETW1YR1RoRmd0SVZzclRyeTd3UERq?=
 =?utf-8?B?ZmV5WERUOGZqWlJ4UFpGNjhrMUJiRkM4a2tiK1R6Q3NHZmJvZWVuYkUwNCtu?=
 =?utf-8?B?UGNRa1VDWm5GTEhUZ1FDenRCaHJ0eC9NdFVnSUdLU004UGhBTFVoK1pXT1BV?=
 =?utf-8?B?Nkl4UXdxNXdObnhRVDVPeEd5MWdMb1l1Z2FXeGUvODBJeTR0bVF0aFZ2aGV2?=
 =?utf-8?B?aUYxTVArNXFwU29rQ3lxQnlwdGZGUWVhcFR4TlBpZE0waUkxL2JPQXJJM3J1?=
 =?utf-8?B?NHFMdzVaK1o2VjNSYjJZa20rejRMaTZUSlNXTU9jN2dGQ2p4akdzY3JCWjh5?=
 =?utf-8?B?aCtEKzhhU1lxQkplbjFxRnVKUHZqT3lIK0p5VGI4MXpMK3RFdTZxcmw1SGNV?=
 =?utf-8?B?aVRQRVFBemJqcUI2WFpZWGtPWjlSbTNFWm84QWtyeE5vc1UzNXJGbGtwYTdw?=
 =?utf-8?B?Y3A1MWh0RHlCV3R3Q1RobTdOZUlYdGZjdlhZeldNZjBUMW5JK2xnU2RUWTRu?=
 =?utf-8?B?clBsOUN1cVE2eWV3cDl5MDZPR1VEbTJnTm9EcHZrUzd2bHpwRWtaQmVZSVdJ?=
 =?utf-8?B?bzgvUjRYdG1FSHlCWDRremk0bmc0NmVkR00rMys4TU9PV2lINDdGazdnNVlB?=
 =?utf-8?B?aXhRakRYdWlRSms0b0hiVngxNHdVWSs2Ky9DQ0lSRHB2OTNPQUVKRUlzNUVU?=
 =?utf-8?B?YXZwcFJKdTl3OEovVEhvY3lNOTlydkdDMkdhM21Ocm9PcWpyNzNlb0ZGc3B6?=
 =?utf-8?B?ZUU3cGZFTHBCTWdRTnlNaGZlOTYrc2hRRHVQZk5DNTdGTTdDRWFObzdWeUF3?=
 =?utf-8?B?TmlSTWJnT0JseU5kUmFKTlIxakxDK2VPV3kvcDl5UUd6TGE5eDJadE9sNHBH?=
 =?utf-8?B?Njk3eVV3cDAvcnJESlB0TEZSU1VMd01rRnhFRVBuOVNlT2JIeFIyL1pwc0ZD?=
 =?utf-8?B?dGoxWlFoUDliTGdaYjJBZGcxdEkrUzNJZERzZDIxcHNvS3F0MmdCZWU5UFBw?=
 =?utf-8?Q?UhhMIT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bzlDRXNFRng5cTVxU0Fha01QTFFsV0JUWWxMSVpIQkY3RmZFK2RucFdxR0hq?=
 =?utf-8?B?TWkxT09TbkRBWEpWWWhWUXRmTnpST3RqRitLNWtBWExLYnI0VUtDZjlaWFow?=
 =?utf-8?B?dm45YlhiNFRsN1BGYTlhM0lwZHlkL0pLMkFIcXNPZ2ZaK2pJZCtTMzZOTi9p?=
 =?utf-8?B?enRQenZ4eTlZc0dUTFRyWmIwWWZIWFZUQ0JEbVc4c2srNWhpZjVydHlzMDFR?=
 =?utf-8?B?K21pV2I1SEZWT3pVWkduN3dGTUUxWjVnYWZvU2FVdWpYU3pRVWltY3FRVjZY?=
 =?utf-8?B?THdBOGEzOSthUEpGOWRzd052WkNkMzFNQVorWk1jNU1MUDJmUmJDNUN3T1k1?=
 =?utf-8?B?M2UzVkJ4QUUwRlYzbWRqVGl4bThHNkk0VEtHeVRxd2crUlZCd3hEUVdjYXNz?=
 =?utf-8?B?VjRNY3dSWk51V3BzMkdLZC8yVk45T01qV0pjek4vZy9iZkJzZWRmUWdaYlZR?=
 =?utf-8?B?citGdVV4YUYvSWY4OGZxMnVrZVp5Wnl2Ym9zZXdYSkcwSTVTNlc2QkZ4WHJE?=
 =?utf-8?B?THNSaXVpQ2ZjV2pDcG83NElZVmhUd2p5T1VIVDdtd2w0MzFxdlo0b2N4MXUx?=
 =?utf-8?B?c3U0MlpGNmRhWWlOU0Y3bG5ubld3ekNSdFNoV05XbjhwM2FZMmR4Qm8yblFJ?=
 =?utf-8?B?eDdta1RVYXQxajF3elhlN1B6bzk4VTJaOC93UVBYcmhBUmNwaFRtblhqQjgv?=
 =?utf-8?B?MjcrVVNkNEc1bXZXTWQ0cEwvWnpNS0FrTnRuMTRiUTM5S2ptbTBQUFJydXVV?=
 =?utf-8?B?eFRDVHQvNkJrdDBmNHhwVGt4UHlDUG56SUEwMS91eDlJNFRzZndxU1JLQVFx?=
 =?utf-8?B?ZVFrQTh5ZFUyNnRLUkNTSTBFay9CR09OUXd5VGI1UWQzdVNoZkxCTUlYckhp?=
 =?utf-8?B?L1diNE5YZzJ5VFlYZ2Z4OWtJSWRyKy96UjErd1pHZ0doVEgzK0hYNW1rdGRP?=
 =?utf-8?B?dHNoZTBWTFlSZWVGSWhuSWJIeHFGNmpnUXNnN0ZuM3BJYkRUT3VmTzhZMlN1?=
 =?utf-8?B?cFM2b1oybGhJVENEZTBQNC9oTXJSV1dVekJEQlZKcFVsblBWNlp2QzZYYmov?=
 =?utf-8?B?Rk1YblI5NmkrSHllRVlodmNqSjV3em01QUtiQlU0akZZdXdtMllpRlVoUVpM?=
 =?utf-8?B?Z3JLb0RNajZRMzNKMUNsWWJWVXd2NlRYMkxpZ2Q4bzNlNUdxUVRaMUozMkZI?=
 =?utf-8?B?MFY1cVNWc2tFbEYrdVlPRW5GdzBQTVA1a2k4ZHRmMFpjMlVrb29IQTJoN1F3?=
 =?utf-8?B?T3V1dURSREczWkdaUmNrYjEyZjIxeSs3eGVhaXpid3JxQnkxRFhLZUV2aHY1?=
 =?utf-8?B?UmhIV2o4LzNrZ0dzcXU4a3U4b1FyQ2pTY2x1b3V0S0Q4MmRmZ0tNK05lTGZ6?=
 =?utf-8?B?b3U1ZUNFbTVPZTluK2FHbXNsTDJINXlQRGRRWUl6a1JUTGxYVjVMTHFYOHNM?=
 =?utf-8?B?VllIRlpZOUpNS2FyRk1ud25yU3Y1N0dRZVRzR3YxTC84em4vRnJZWDdkTXF1?=
 =?utf-8?B?TjdFMWpxbUJGdDN6ZjlrbExWakNHcGVOL3cwOTV6OUNNZjdYZWNnYllDWXJa?=
 =?utf-8?B?ZEdRMDNETmtUYmZnWHlWSm1id1puQ1JzUWsxeWdRSU5FTWNCbzJlZXdtZUs5?=
 =?utf-8?B?emROTTFSS2VTOUxrSGl1S2pUQ0VpdVRFLzJlRGgwQURlZkM3NGs4clRvRTNC?=
 =?utf-8?B?MjZiYTlPbnI1MjlZL2VKYURIWUZUelZyaEJPZVRRbzJtNGY2SmtraGtkTzBN?=
 =?utf-8?B?ZFNBWUJ0RGUyL084dUM0ZmhFT2FsYnFTMXNwL3hBYW9jU2loWDdjUWhQNUIy?=
 =?utf-8?B?TmNGUGI0M1dXZlJtRUVSZjJnT1ltRnUrQVdBMTJBRU0xSURCYUNIaElpeU5n?=
 =?utf-8?B?THhwTnlBcmhYM2JLZEdnYklKK216UzNERGVCYWdIeHZPdmpab1p6V0k4N2lo?=
 =?utf-8?B?eitnZ1U1WEhjTzZMV3Q4aGp4ZlY3OTFjcWFDei9PZXFnZ2pZZnQvbXRvK3VN?=
 =?utf-8?B?aml0Ujg0NXJ5aitKOW9wZkFXa1RRNU55VDdDRXZyeFZvdWx1YlE2em9EZFA5?=
 =?utf-8?B?eElZT2RXQTlYOFUxSDl5STdkYmFIWEtFTkpxZy9MSFZUVWxnYkwzQXNqQytH?=
 =?utf-8?B?N0JaNzcvbzFCaU03U2d4d0sveVBoam45MFViZStTMTFFUmh6UmNZanFJYUE4?=
 =?utf-8?B?YTJNZWo3L2RrS1VXRVJkQlA5SmgrNmlIRXVVeHVQZGF6T2E5eU52MEFaNDZs?=
 =?utf-8?B?Y21QZmFNd0Flc1Vxa1dMaVdJZDJ5amcybmJPVE1maTNpMWJuT0kydENxeW5v?=
 =?utf-8?B?ZEJLdy84anl5c0dPNkhZTGZZN0NGV1FYYjJiWEhJWUtNTzFMeFY5b1VIcHFG?=
 =?utf-8?Q?/nDCjshlC+CIJqTw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5446c3bc-5f95-4086-167a-08de46c95329
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 10:59:23.2808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1se0TzAu+xaKDhrwjRp5lTeYZZ0VWVLn2El9nW9rBiByl9k/xHBjbk3Koi93QmYOWvzszHDIf+tP9gOaI9/9km42aCmZ1lE9tauZhWNcjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7588
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: mfxfGXvOOh6O47r8IqqYdW9GJyK6brwt
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=69525f0d cx=c_pps
 a=A8yAwjBYovhlCeyetBcGtw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=V9OIEDjmwp2h2st5NKQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: HUKyp_B9Gh7FnMVEJFKQb8cK8E5n-E_o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEwMiBTYWx0ZWRfX6s/Nc+QWFU5z
 nizSXMfHiY0zh69Au3jSF0d2KXDd8XWLDMDLwbIklZkcxIkg4D8btGm+33XIpObS0cFjrpKzHRY
 nK1FTclRkiwZ2ZdMJo5pKY2jRGtbaLAbw4zGFdiORMG28NZud0VF6y45z5A5zYITf9tZkcIAMGR
 fZ58WaInW+BC+/Cr8uMttDRqLgmOc3DxGfLPDZqwV3KEQ5AnCks/tlzHO4+FEvXelp1zAzokR5w
 F58jqg9fLkv5m+boNbupoEnlandfZ07Ccqj/ghzejrJBKDc9hw9qDtI5WOytdrZKLGrom2PVfOg
 gB0C/BKglkQvTvILeq8lry5/BD3MqX7bYC+S6SmtlGanOV7ZBmjHa4aMlQJSWWaehd9WAChbMJ1
 i0NsAjpUmw7FFwR8t7EwbJxFJC6z7/exzrnwrd+mlLVgUjw0KikfOggbjMRUq6UglFTIIJMdTw/
 Ra9s4QZbTLdEqdEuDmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_03,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290102
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BTAo2gw2499547
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 10:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228595


On 12/27/2025 8:35 PM, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> And here's the answer to my previous question.
>
> To me, this patch should be squashed with 05/16.
OK Bruce, I=E2=80=99ll combine this patch with 05/16 and send it as v2.

Thanks,
Harish
>
> Bruce
>
> On Sat, Dec 27, 2025 at 7:33=E2=80=AFAM <Harish.Sadineni@windriver.com>=
 wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> To enable Rust integration in the Linux kernel build, this patch:
>>
>> - Adds `rust-native`, `clang-native` and `bindgen-cli-native` to `do_k=
ernel_configme[depends]`
>>    to ensure required tools are available for Rust support.
>> - Invokes `make rustavailable` inside `do_kernel_configme()` to prepar=
e
>>    the kernel for building Rust-based modules or core components.
>>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
>>   meta/classes-recipe/kernel-yocto.bbclass | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-r=
ecipe/kernel-yocto.bbclass
>> index 2584cadf0d..dda235d4d0 100644
>> --- a/meta/classes-recipe/kernel-yocto.bbclass
>> +++ b/meta/classes-recipe/kernel-yocto.bbclass
>> @@ -463,6 +463,11 @@ do_kernel_configme[depends] +=3D "virtual/cross-b=
inutils:do_populate_sysroot"
>>   do_kernel_configme[depends] +=3D "virtual/cross-cc:do_populate_sysro=
ot"
>>   do_kernel_configme[depends] +=3D "bc-native:do_populate_sysroot biso=
n-native:do_populate_sysroot"
>>   do_kernel_configme[depends] +=3D "kern-tools-native:do_populate_sysr=
oot"
>> +RUST_KERNEL_TASK_DEPENDS ?=3D  "${@bb.utils.contains('DISTRO_FEATURES=
', 'rust-kernel', ' \
>> +                                  rust-native:do_populate_sysroot \
>> +                                  clang-native:do_populate_sysroot \
>> +                                  bindgen-cli-native:do_populate_sysr=
oot', '', d)}"
>> +do_kernel_configme[depends] +=3D "${RUST_KERNEL_TASK_DEPENDS}"
>>   do_kernel_configme[dirs] +=3D "${S} ${B}"
>>   do_kernel_configme() {
>>          if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'tr=
ue', 'false', d)}; then
>> @@ -513,6 +518,10 @@ do_kernel_configme() {
>>                  echo "# Global settings from linux recipe" >> ${B}/.c=
onfig
>>                  echo "CONFIG_LOCALVERSION=3D"\"${LINUX_VERSION_EXTENS=
ION}\" >> ${B}/.config
>>          fi
>> +
>> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'tru=
e', 'false', d)}; then
>> +               oe_runmake -C ${S} O=3D${B} rustavailable
>> +       fi
>>   }
>>
>>   addtask kernel_configme before do_configure after do_patch
>> --
>> 2.49.0
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

