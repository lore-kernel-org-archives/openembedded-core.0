Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6542ECCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 11:53:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18053.1761220417734881438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 04:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=U/Xk0Re7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2391a0ea00=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59N5JLNA3209781
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 04:53:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MGA/RlSSvP9O9zTjYh5gWMFURMNVbY5LbUn6EBxVQN0=; b=
	U/Xk0Re7WTwQpZxa6YVN5oKUORfJC9w+uvHvh+Qi8wHLZkJzrs5kfFVv4RiFZZrE
	ncAPaMVOnBqfoHENDBixdYbEyjpgMaW4pfSoswgSCb4vZ40C+khCI+bJpJK4qYgt
	2UKhN93H7Tst+Cyxmeo2UE1ZgI51GIUf8vlhWRhoLXOyPoiF2WLk6nf6tMQbkFfe
	SjH17QdGLA0ZJR0xEkjO0eUbJKm4rbZOF21olLhaLNjMhYEyWpfBKxeGbissfGl4
	pUYD6TOaavyYsxouKcJSts+mXOJQ8QJkkQCQvWqMcIddS/xy3yW4OW0EYSFQjTwv
	2VaCaT9QRYcSMuvsmJ7YFg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013005.outbound.protection.outlook.com [40.93.201.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49vadj5n94-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 04:53:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Np6KScsR7a6WyIn8vioU6kckzApLcqDy1CoDRWUtwFjR9u6b5Pchbrdd5ErT3Dvm1+44yaVF/DSxzq4dfF8WCxPZEIVtTrPjBSXnvFYb9OBcRedR5aSKFjffdGyTIvHS1JX9dovj6BzPAmS/g9g6wHJp168RQDsheQ7+5gb7I59EkIcUpolrdjwnQ/9ZTuoS4cRb9pd8y9jyXNyhnCcWVtQjJqWNk8jw8HgK8whhod+ZN2TWIYQanNDqzaHqUJ5dyj6QHRd2W+OPKGI1/Agbv3AG2laF0lEKmFlFurGPkZGhnMnBa+6nyl22tWkFoqqOrXYLustw/a+3iCQ/uGvU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGA/RlSSvP9O9zTjYh5gWMFURMNVbY5LbUn6EBxVQN0=;
 b=hLmIDbIE1OnXCqA2IPGRG5YxaRREDmptT+26cni6skuOz2Wa+K/qJKQe8XwHo5fXwbcBLUY8jQcIek0ed1+d9zn6YSjkELxjZhkL8qi2/j28QVNY+F7EhQ8DDnJESUfYN2tVeLq8v04qumRl91GHLcop60H7zrlnVdmzGsbvU5epbMd8uRHRCxNDoehrO9QjwMZgn6E/uXW6q1eprNGISfN7WxRfuJIeVWMoYmRe+/prL65eZ/qflBy1shi3ffJAkoABt4+Tm0TnY2UvutawpcXrfbT4MqD2HRPASgSVUV5CbNXilIScehrdmhP0sKU37HD3aVxA2abWVXoCTCjE0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH7PR11MB7449.namprd11.prod.outlook.com (2603:10b6:510:27a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 11:53:34 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 11:53:34 +0000
Message-ID: <df752f42-1849-4913-ac24-ed5b3b63164e@windriver.com>
Date: Thu, 23 Oct 2025 17:23:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] conf/bitbake.conf: Remove debug flags for native and
 nativesdk builds
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20251023113444.882980-1-Deepesh.Varatharajan@windriver.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <20251023113444.882980-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PN4PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:277::9) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH7PR11MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: 280b42b1-ced6-43e5-0503-08de122acb84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cHd1dEF6d3ptMlZOckhCaUlyNlByNHRrUE5zVXZHSlVIUHBQaWg5N081K1Fq?=
 =?utf-8?B?VnVGdVZBY3dCbHB4VXhVVWpGSUxPeDZBbnR1ZE5RWXY1bllCejlsa3lzWFJH?=
 =?utf-8?B?UmU0clpBeFcySkxTUVZuNHN2UkkzL2lic29oSFJsazN3Rk9ZeHovY1VuNlNt?=
 =?utf-8?B?cUVuelJON2ExdEhNUjhjMXVicHg4TTZtRFBFc05CcEo3RVdkNkxWLytldkpY?=
 =?utf-8?B?ZFB3UWM2YmlTSFFEai9RUFQvcy9odzAvR2VEZlVFNnNBN01HTzBxNHE2UUNQ?=
 =?utf-8?B?SVRCMG5BMjhiTlF2MTBuQjlCcDJkVXovUDROS1FERnAwaHVZUkF2c2g3c2FX?=
 =?utf-8?B?U290UGRmOGoyMjBQU1RuM29URHhxaSsvbFdSMXNIMjVLQmwwT1hLQ25LYlMw?=
 =?utf-8?B?bWRRNFdRaUo1YjZtOHpnQUVrdVcyWDU1aEsvMGgwV2s3eEp4MlFLaG1hUmRm?=
 =?utf-8?B?aEFYZHFlR05LK3Y2c3RCOGVMSzA1VlhheXpwL002WEZtN1ZvR0dvMndtaVRC?=
 =?utf-8?B?THRVdzc5SVhTU0paU3VRRTF0NkQ2SHhjaElVdEZTZzdCSExoMGNrbUluRG5I?=
 =?utf-8?B?b0xTM3NZeEdzOVo3a0lVY0E0c3A4T0I2WjJMdmdla0RYbmhneXhaclIzbHJt?=
 =?utf-8?B?VlpzTzZvS0k4TU1IMm5aSExSM3ZlNWZyZ1Ryc1UvYmhkZDhhRDV6RG5kdnBs?=
 =?utf-8?B?ZnBtUTV4Q0dFTHdrTFBGdXBKRHRUR0JnVXZ1SUxwMDBGVHh5WXpPYlNQSWpS?=
 =?utf-8?B?YS96Z2tSSzg2N0lZUUZqdWEzWHErRnRxelFRb0VmWXVxanpQb0tUWDFpY0lj?=
 =?utf-8?B?UndXS0l6cUxQVElmVldiTklCVXpnWGl0bWEwRnpqVnV1TzIzajJiVVlmNmxx?=
 =?utf-8?B?MzV4VzBuWlFzUXhmVWxqcFk5bEhsV2Y3QUFkaXFXOENmcjJiYit0dUdybFQr?=
 =?utf-8?B?dlJZNjdjbVByeWZTc3lGZW5OWTV2dVJXMitlcnZHdWYzSG96bDc2UTNnUWxl?=
 =?utf-8?B?RkoxbVg5WnYzRVpqVXIvbmVHajJQS1RsVnFOSXViNjFYVkhjWldDam9xWkFQ?=
 =?utf-8?B?VTJaaDZaSGJUMEJxaDN4R2pMWnNFUDNXaDdBMWt1REdGdnNwYTVmQmdoZU5l?=
 =?utf-8?B?KzJEZmg4WXRrRWYzclNaVWdIUGJtMmZZN2djc1UxSG52a0p6dE5uMjBtTGVD?=
 =?utf-8?B?dWJqeUVFdytJOVllaHd0R1RmTGRrQ1dCSlZiSEtjREJtcEp4a3AwN0R3SkR3?=
 =?utf-8?B?LzFHeVM5aHFpL2VqZk9wUUpHVzhKd2J5OGwva2RlbVpNY0tHYjd6bEYrRGdI?=
 =?utf-8?B?M2w2UFNHNFk4bXNIU2xBNVhrd1hGanlmZUlZTElXUkVMc2hHeE8rWms4MCtt?=
 =?utf-8?B?aWN2Z2RKWlB4QVJ1OEV2Ni92K0FvSStFMTV1eUtMZ1RFU2NxMkdWMEdqRlJZ?=
 =?utf-8?B?MlIvU0FlU0pVRFpKQ0JKTU9jOE92Nm1neUpMSldKT1BJbkUxU2NHdXF3UnRm?=
 =?utf-8?B?V1NuZGZkMkRVWDZFRzF4UU9SRUFON0hoNkc4b1dmcXMvU2FFYzJLSHo3bCtX?=
 =?utf-8?B?a3BTNDFReHdOelJMRmhpYWE5aGplQWZNQkNDUlA3MDZhV2NEVlE5czhzU3gz?=
 =?utf-8?B?ZDkvY2Y2Sm96VzZLcmhjd09iZ2taYUxwdGs2RlQ3RU9UMzRIS2UzeTNSUGU4?=
 =?utf-8?B?R3BzRkY3aVNTUVJaaytuQ2d1ejc3dTB4WU83VnY4akFoOTNWY0xQTjdjR28z?=
 =?utf-8?B?OXhWSHJNdjlBYWxrc0ZVcEUySHB5K0xZZU40RHZYMUh1cFZVWG1ZZFZOMGpk?=
 =?utf-8?B?QTliR2JDM3pkZlpLYWlOR0Q1T3hoVWU2ZUZRSS9Dbi9ZUVBGSEFlczZyenpK?=
 =?utf-8?B?VFhxQUYvNFNydFJRWlZrbnlqeklEM3lpRFlyejdPbjVjZWpqZWtEUHZRYngy?=
 =?utf-8?Q?oxOTPJWINGX1L/NLaMcXIfSGc+6aRR+S?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dXdPR1VRcmhGd3dRZFpabGhoY0Mxc1hpV1ZNRDFJdmg1L0YyMHUvSVVXZnR1?=
 =?utf-8?B?ajhTLzlWQUkxNjJPdG8reWpLUDRZM3EzL25XaTlpVmRHbWl4d1Zuc2lPWnhZ?=
 =?utf-8?B?ZGRyY2g5eGRGTUFidWRyQjJrNFRKV1ZEb0t2aEtOa0xCRlhHTGhDUzUyQVJ5?=
 =?utf-8?B?aG01SjUvNGwzTWtyU0FUNk0zT1dybUhWd3VDRDNKei9DcEhrb2xUeWdidGhl?=
 =?utf-8?B?czZTb3FGWmhnZDF1SGNsNDI2dXFsUmxzRDJRWmk3aXNMaCs3RXI1TU8vYnFW?=
 =?utf-8?B?Z0VKUWhRN3JCUXZmbkFxSEY2QjdRdmhpeWRUVGFwZlBHcmM0dW52bURTNEtU?=
 =?utf-8?B?Y0I3c1pDdUU2TXFocm9UT2E0TFBFOHZCTGJYRGxUMWRtd3pvVTdiSmNYOXd3?=
 =?utf-8?B?UXp5OW5lYlFhOVlKRzJyWm56NmhyWjErblU5eHFLOEZXZmxQcDJFbWg4Mmxr?=
 =?utf-8?B?TVFxcVZJRHA4SU81ZHpsM2pGQXI4cjVRQ1Z3VHl4M2ozVGl3VHoxQ09UbzNv?=
 =?utf-8?B?cTRiektnNXZndVFmK1BmSEVTWXk3eXkwMndHNTJZN2dRdEVyZ3BsTC9XQU1V?=
 =?utf-8?B?VThmUWJsMnhRblZuNEQ3ejJCbFFMZW9RZ3dWOHowa1BqSHNSNEl0R0pDdlRo?=
 =?utf-8?B?OXpyVURERWd4cHV5cThTUnRheW9NVmZsZklhY1c2bTZHb0oyREhJdThKS0FE?=
 =?utf-8?B?WXUxSHBJNkRDYUNyU0YxVjRyb1VnbDFEd3REK2FPMm9GTERoVkxlT0IyYUxz?=
 =?utf-8?B?WTQxUi9iemptS3JXeXE3WUdkTGwySkNMQzJrdXRyMG9IWHZKcFJoRCs0VGlL?=
 =?utf-8?B?TVdDMlgwQVRSVERKYTZ6RnJwTmhwTXZaRURYUjMyUWRBVW9VSUlXWHY0Z0Rk?=
 =?utf-8?B?TGdIclVjVmM0dHhLOFVtdUs1OVM1cGRBdi8zdFZEUmZGRXZzZlFRdmRsbC9L?=
 =?utf-8?B?emt0TldqUTFjcUpqeDNSWFJxOGdYV2dBS3lORkFBQnhndVpiODJGWmxGL0dW?=
 =?utf-8?B?MlB4VHZTNkU5Z1FvMUViQzltT1QyRGFVcVlFa3NiMndsNi9BbzIzQmFnMEZ5?=
 =?utf-8?B?SmJQd0lZYys3ZnA5bW0rMWwwVXVkOUlaTlVhOHVCSk0vbU9sYnVlc1luZUZ3?=
 =?utf-8?B?bi9yakM3WUx6T2NNdW5GeDkrZi9PZVA4VmpQak8vK3FGb3ZyYXYyeG0zWGRP?=
 =?utf-8?B?NUlJQ3hGbU9PaTFxSUxadWxqZ0VJSG9nUUF5RXQzcm8vbWpQYzYrUHRkcXJ5?=
 =?utf-8?B?alYxaTVFNCtUZjY0V3FyMUdVRUZ0cFpyOTlQLzFJZEV2NzFzV3dXbDNaYnd6?=
 =?utf-8?B?ZGJWTlRGUitOeGFQaW1GT1FIK2h0blNIOFU2TEdvM0pVS3luU0dISEJnUXhN?=
 =?utf-8?B?Rmg1Vi9EVVY5OUwvenphNGtSU1BXQkkwRDMvQVF6TmJZUFN4b0RWVFp6MENF?=
 =?utf-8?B?b2dlR0xHektHTHRYcUNqdDVzaWFNVUYzYTlGQjg4dnlRcXRMQy8wVlB2VTQ0?=
 =?utf-8?B?Z2ppWHc0dzBzeUhzWVpqK1FXS2pUMlVsaVBBRXJBUTBucUk5TjZ3L0VPVUZE?=
 =?utf-8?B?TzFRaGp3MlB0bk11c2E1RXBiNU9YSFFYL1ZTUUcrU1NKV2szVHhVMVhPbVg1?=
 =?utf-8?B?VnhFWlNhbDRla2Vmb29xMVlWTU03ZExkVURUdStRQy9SYzNrc0FZbm93MXk5?=
 =?utf-8?B?RURPSkJwblUwYXJ1eE9pcEdrVWRTcU15WThhREdxTWRzeEhwTDBCem1ibjRV?=
 =?utf-8?B?dU9kV0grV3BoS1F4N0JEVnpKaFFaK2tIMk53ME0rSjR6Ri9ubWVGMHdBNVAr?=
 =?utf-8?B?REo2NnluNzhmRzBNMmtiQzRQNGoxbnRpWkZmaDljNVMyS0dTVmVqQ294amNO?=
 =?utf-8?B?eVdUV1ZBUWFQeVdtcFdYempXNWc5aHc4NW9zc1BHQ1VMdnFxQlVZTEFNeUEw?=
 =?utf-8?B?cmw0U1VJQkJlR2xMbjV1SE92UzRIVWkyb3V2QXNjRFJxK3BBZE9nUDcwOGIz?=
 =?utf-8?B?VDc1aVcxa3BIdTM2dzBLRForWXd3aWcxOVFCdFNwM0NNczE1Q3dUajNTdEU5?=
 =?utf-8?B?YVJhSkh6bnNNYzNGQW5WV2dvY3dTc05xT1NqT29FVTRaQnQ4a1VRM3NwbVgy?=
 =?utf-8?B?TFd0akRMaE4wSU1TT1lsRWpRWmhMTmFraHZRclZMZWo1VUxLNUZTeTNtaGdL?=
 =?utf-8?Q?BuicXr/5/0YdMLQlkolYViE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 280b42b1-ced6-43e5-0503-08de122acb84
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 11:53:34.6701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIMP+kp/BGo8jIyuemzMMDivgoHvrH6wY7PXeK0bOneO3klG/a+I+n0PvwYtItPYjYA9S/4rN2dICo+uJkXJicIfZlxojeyfr1ktfe1fK4Rhbgzp7OvwO/2MqIzV9IG8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7449
X-Proofpoint-ORIG-GUID: K54FHuzVwKxn2ZHEKHBQgiupxOHBSf4J
X-Authority-Analysis: v=2.4 cv=K+4v3iWI c=1 sm=1 tr=0 ts=68fa1741 cx=c_pps
 a=l4G2nZJL/liaK5VsxlxrQQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=UFa8D3YnNuVdzDa_1G4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEwOCBTYWx0ZWRfX0Js6EpoDdtbi
 XXCZzC5qIHAdgxLwMiuKoFcKYHQHbMtZ7uPLuxgx84wuWthwOL8jcFGwo0o9QGMzv8C78Z+0eGW
 qoY3QZRVMLrv/GEMyB3eOffEDdQ3Sboa6rX+Dg1QnZ9ODInk9Vj0S76UpFaW8CyDMuKMV+GQmcS
 S67M7MTknG9tmVltpGsn0Sdcmpfsgk2Ut4TogLja15OjmOZH0KsA9cjfncuW2Xb4FdDdjlE4Gzs
 Wl729SROXnOC8w8e8SimPAnFDCm52WnmDhcE2Jj4ejUvKMzLkwvxv+9calMwN+1WXzOdwWIrYIV
 /BlsB3TAprLHPJtzBxdAGXlwLQOWDo4mT5uOJnddSLhPRirXV0Od+9aEcgpUP0TEDlAWbjuyuOd
 GusZsF+ltF/mruTcDfZwgXudBhKgMA==
X-Proofpoint-GUID: K54FHuzVwKxn2ZHEKHBQgiupxOHBSf4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510230108
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by mx0a-0064b401.pphosted.com id 59N5JLNA3209781
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225246

SGkgQWxsLA0KDQpUZXN0aW5nIHJlc3VsdHMgOg0KDQpxZW11eDg2LTY0DQoNCnRpbWUgdGFr
ZW4gZm9yIGJpdGJha2UgY2xhbmcgJiBiaXRiYWtlIGdjYyBmb3IgZGVidWcgYnVpbGRzDQoN
CndpdGggKC1nIC1PZynCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB3aXRo
KC1PMikgwqAgwqAgwqAgwqAgwqAgwqBEaWZmDQogwqByZWFswqAgwqAgNDZtNDMuMzI5c8Kg
IMKgIMKgIMKgIMKgIMKgIMKgcmVhbMKgIMKgIDQxbTI4Ljc3OHPCoCDCoCDCoCDCoCDCoCDC
oCDCoC01bSAxNC41NTFzDQogwqB1c2VywqAgwqAgMG0yMi4xMzZzwqAgwqAgwqAgwqAgwqAg
wqAgwqAgdXNlcsKgIMKgIDBtMjIuMTM0cyAtMC4wMDJzDQogwqBzeXPCoCDCoCDCoDBtMy4w
NDhzwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3lzwqAgwqAgwqAwbTMuMDIwcyDCoC0w
LjAyOHMNCg0KdG1wIERpcg0Kc2l6ZSA4NiBHQsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHNpemUgMzggR0IgwqAgwqAgwqAgwqAgwqAgLTQ4IEdCDQoNCg0K
cWVtdWFybTY0DQoNCnRpbWUgdGFrZW4gZm9yIGJpdGJha2UgY2xhbmcgJiBiaXRiYWtlIGdj
Y8KgIGZvciBkZWJ1ZyBidWlsZHMNCg0KIMKgd2l0aCAoLWcgLU9nKcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgd2l0aCgtTzIpIMKgIMKgIMKgIMKgIMKgRGlmZg0KIMKg
cmVhbMKgIMKgIDQ4bTI2Ljc4OHPCoCDCoCDCoCDCoCDCoCDCoCByZWFswqAgwqAgNDFtNDYu
ODE0c8KgIMKgIMKgIMKgIMKgIMKgIC02bSAzOS45NzRzDQogwqB1c2VywqAgwqAgMG0zMC45
MzBzwqAgwqAgwqAgwqAgwqAgwqAgwqB1c2VywqAgwqAgMG0yMS44NTRzIMKgLTkuMDc2cw0K
IMKgc3lzwqAgwqAgwqAwbTQuMDY4c8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3lzwqAg
wqAgwqAwbTMuMDg1cyAtMC45ODNzDQoNCnRtcCBEaXINCnNpemUgOTIgR0LCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzaXplIDQxIEdCIMKgIMKgIMKgIMKg
LTUxIEdCDQoNClJlZ2FyZHMsDQpEZWVwZXNoDQoNCk9uIDIzLTEwLTIwMjUgMTc6MDQsIERl
ZXBlc2guVmFyYXRoYXJhamFuQHdpbmRyaXZlci5jb20gd3JvdGU6DQo+IEZyb206IERlZXBl
c2ggVmFyYXRoYXJhamFuIDxEZWVwZXNoLlZhcmF0aGFyYWphbkB3aW5kcml2ZXIuY29tPg0K
Pg0KPiBUaGUgbmF0aXZlIGFuZCBuYXRpdmVzZGsgYnVpbGRzIHdlcmUgcHJldmlvdXNseSB1
c2luZyB0aGUgJy1PZyAtZycgZmxhZ3MNCj4gZHVyaW5nIGRlYnVnIGJ1aWxkcy4gVGhpcyBy
ZXN1bHRlZCBpbiBpbmNyZWFzZWQgZGlzayB1c2FnZSBhbmQgZmV3IGxpbmtlcg0KPiBtZW1v
cnkgaXNzdWVzIGR1ZSB0byB0aGUgbGFyZ2UgZGVidWcgaW5mb3JtYXRpb24gZ2VuZXJhdGVk
Lg0KPg0KPiBTaW5jZSBuYXRpdmUgYW5kIG5hdGl2ZXNkayBjb21wb25lbnRzIGRvIG5vdCBy
ZXF1aXJlIGRlYnVnIHN5bWJvbHMsDQo+IHVwZGF0ZSB0aGUgYnVpbGQgZmxhZ3MgdG8gdXNl
ICctTzInIGluc3RlYWQgb2YgJy1PZyAtZycgZm9yIHRoZXNlIGJ1aWxkcy4NCj4gVGhpcyBy
ZWR1Y2VzIGJ1aWxkIHNpemUgYW5kIGF2b2lkcyBtZW1vcnktcmVsYXRlZCBpc3N1ZXMgZHVy
aW5nIGxpbmtpbmcuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IERlZXBlc2ggVmFyYXRoYXJhamFu
IDxEZWVwZXNoLlZhcmF0aGFyYWphbkB3aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gICBtZXRh
L2NvbmYvYml0YmFrZS5jb25mIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9jb25mL2Jp
dGJha2UuY29uZiBiL21ldGEvY29uZi9iaXRiYWtlLmNvbmYNCj4gaW5kZXggNTQwNmU1NDJk
Yi4uZDhmOWY2YzMxMiAxMDA2NDQNCj4gLS0tIGEvbWV0YS9jb25mL2JpdGJha2UuY29uZg0K
PiArKysgYi9tZXRhL2NvbmYvYml0YmFrZS5jb25mDQo+IEBAIC02NjMsNyArNjYzLDcgQEAg
REVCVUdfT1BUSU1JWkFUSU9OID0gIi1PZyAke0RFQlVHX0xFVkVMRkxBR30iDQo+ICAgU0VM
RUNURURfT1BUSU1JWkFUSU9OID0gIiR7QGQuZ2V0VmFyKG9lLnV0aWxzLnZhcnRydWUoJ0RF
QlVHX0JVSUxEJywgJ0RFQlVHX09QVElNSVpBVElPTicsICdGVUxMX09QVElNSVpBVElPTics
IGQpKX0iDQo+ICAgU0VMRUNURURfT1BUSU1JWkFUSU9OW3ZhcmRlcHNdICs9ICJGVUxMX09Q
VElNSVpBVElPTiBERUJVR19PUFRJTUlaQVRJT04gREVCVUdfQlVJTEQiDQo+ICAgIyBjb21w
aWxlciBmbGFncyBmb3IgbmF0aXZlL25hdGl2ZXNkaw0KPiAtQlVJTERfT1BUSU1JWkFUSU9O
ID0gIiR7QG9lLnV0aWxzLnZhcnRydWUoJ0RFQlVHX0JVSUxEJywgJy1PZyAtZycsICctTzIn
LCBkKX0iDQo+ICtCVUlMRF9PUFRJTUlaQVRJT04gPSAnLU8yJw0KPiAgIEJVSUxEX09QVElN
SVpBVElPTlt2YXJkZXBzXSArPSAiREVCVUdfQlVJTEQiDQo+ICAgDQo+ICAgIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjDQo=

