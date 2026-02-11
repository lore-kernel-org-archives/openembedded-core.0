Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8A0ECD6C6
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 16:19:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22957.1770826790457919362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 08:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=UaYnxCjW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=650237d055=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B7U0QM4142839
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 16:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=KO5QZjFHwbKWquHkgGEQtjVUJN0raWrdqa9AlOeZLPg=; b=
	UaYnxCjWyvY3rCYScjOhhBzKIZwdMLTlv9OXXtSWww17GLipwL2ZrETe4rF7AWmc
	NIaRRNlZ/hi2eZ5L/gBb5Kkb6rlWU+3EAkRZ3lupt5uI4k17lrNYC9Vkx0wWz9JI
	NnY7E/ZUlVPKypYwKMTE/+Y978lyOBCdA3UEzHQyKbIrBEK/BuUOllyAyrO+mI/7
	g2fTFxaUJApSNot0LBWl/8K/5qINSQzmSZIhLDiXXvDZxInC2hI35wQfi+g0/CzS
	NAU6cmWpcTyhbzTNLqg/ynSlrV/1Rv7kp2Z37PXn2FLdtsU+KcgltCqsLLYWMFDX
	pGdsaZtdWjsf6PwCzKJF2Q==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012044.outbound.protection.outlook.com [40.107.200.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwn0f1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 16:19:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9FYUovCJq5ezgE3KmggDCXud2+ONCafOnGOliGSkeLyYsJd9OP8YXmPAUEzqaZa4xT8CzhmLsQxyu6u+K7CEgaxeKjyEcFf0/S0SK/xeZC/8mt02bwo6tqQU5+HyneukX+RBxnv4YEHDKJ5wr5VWRPmWWkyTd5k7UVKod62q50ytjeU6eZYxTB9mJ1t/iSoVm/9sH/oQVVMJp4SFfxLUfG0N3Ao7ylyZn374m1KBe+6+Hnmuc/P83U85Nj0eQOFYVnvzrRZN2wa+uYi6rpBrSxAxM4DHL5BBWJphu+KUI5G+BvgCC1rTDHmRdj8I1O0CSCCX6iGVRrohOkc8XTVig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KO5QZjFHwbKWquHkgGEQtjVUJN0raWrdqa9AlOeZLPg=;
 b=AmHOGl3/EaRc4QVeyRgeySfS4i0taGceUy2lqElkfWFPdHjnCdS0lbr64YU32uXXIFUpXX+QXngjLk23FDIKDYbvan/6ZiPxzPUHTBjEt8rlPg3p0WCgX7P4zrjjnsyA/kSWkvAY1QEyXt7y4zu4p/aoXIh87INuVT8MwlBCjeWaHq76oGENHH7SkEcXieAciIb0KEV1OdZQGv+R45EZ7HLNko8NgaMA7DEzvKXXpT9g8dVqlYBKLLd47x4Xe8Zx93OEsr5/tKcXX1kI4dnxpAWAll908rj6dWUM+VmKEhEEbHDcoTIN6TWf0V8zA6kBQgL+g+2bfIsCZ3ECLUOooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA3PR11MB9013.namprd11.prod.outlook.com (2603:10b6:208:57c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 16:19:45 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Wed, 11 Feb 2026
 16:19:45 +0000
Message-ID: <e191dda3-0c66-4cc6-93be-c09152173138@windriver.com>
Date: Wed, 11 Feb 2026 21:49:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 11/15] kernel.bbclass: Export artifacts
 needed for out-of-tree Rust compilation
To: openembedded-core@lists.openembedded.org,
        Yoann Congal <yoann.congal@smile.fr>
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        elmehdi.younes@smile.fr, richard.purdie@linuxfoundation.org
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
 <188F412032A5A3F8.3408700@lists.openembedded.org>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <188F412032A5A3F8.3408700@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::16) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA3PR11MB9013:EE_
X-MS-Office365-Filtering-Correlation-Id: 807c1285-a8bc-42af-6d3b-08de69895e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YTdtRVM4NitHV3hSUUI2SStnVitLSUpsOG1WUXlHRVMvR3c5NGZ1M0ZMSDVX?=
 =?utf-8?B?N2pSQXZxNGZ4RVVVVmp2TnJPN1d3OTlhRWNIVHNLTFdyQm1QU04yTko5MHNG?=
 =?utf-8?B?ejFGcVhTUjN3WDlyL2dzY2R6QWZ0VHJFK2hZYytnQjlDVkJZSjA4c0UweTZW?=
 =?utf-8?B?eDNPbm94TDRuNkZIdkprbzV2R3ZXcE5uSDNidTljVU02Z1JzcGtZSzhqaTM2?=
 =?utf-8?B?ZnhTQnBqZTRhY0ZmVjdxZlBCNktwN2JWNHh6bjZTVS91WHFURWlxZTJiQWlY?=
 =?utf-8?B?S1VVV3BYbHVxOERWRUVZMXVCZncxYVlOVmFZdFdXQnBYWmMxNHR4Q2w1QzBJ?=
 =?utf-8?B?d21NS05IMXkySkdqRDRyMDBxMDVIeGNQYlZadzQrR2lSVWE2OVJiYStlY0h5?=
 =?utf-8?B?VnA5U1FyZEthbkhkV2liOHdUUXBFS2taZlJxWG9qTVZtTW9lSm1Ob3V6MG5R?=
 =?utf-8?B?Z0g0dVVjMHFtWEZCek5aUExJekhIaU55YmozN003UUFLdXgwYm1MYzNHR3ZV?=
 =?utf-8?B?RHhUL0ZTSmVmODRvdGpHa3pEZTZrdENlYW5DTjBGbU1VZitGeHRzL0NCZmpZ?=
 =?utf-8?B?WU1uM2YvM0Z0WHdZd0Vib0toVno3ejFRb05HdXFGM1NnUnJLaXlqdm4vUFB6?=
 =?utf-8?B?cDB1ZUxqL1p0V2RiNjZEd2FTSFRFTVBaL0hBV1RzUjZ0R2cyOVovdzU4RDFn?=
 =?utf-8?B?TE4wVW51WEN1WnFVZXVLZjlqZEk4eUN1YnArdmVLU01tT2hHU0lRVTI4UlpC?=
 =?utf-8?B?cmZRMnMwS01GUXd6SXZUYkVLWlA2NHVFRjB3ajkwWnZyNWFMZC9oS09hQkdk?=
 =?utf-8?B?eE5Wd3FRVGMvNzNFWCswMkR4OHA5ZWIzMlFWOUFHSG5uSjlUMFlLbVBvUXBQ?=
 =?utf-8?B?NXVmZTA1VlpqZTZuMElwNkZUdytvMGhwdjZncldzcnBYK2ZvcHRobGx4ekNz?=
 =?utf-8?B?N2ZPYUJTWnkySU0wYnVCQ1VXS1JzKzlQMnI0T0h2NU9tMWcybENNL1dRL2ZC?=
 =?utf-8?B?aGU3ZDRCYmYrckFseTVGeDlGejNBdGFlQnB1Vmtoa1lEeE8xQWZBU0tLNWxi?=
 =?utf-8?B?TittNXgzN1ByZmlleFE1SThJNnAwOEpZMnIySSsrQW5oU1FuRy83V0FXN2dU?=
 =?utf-8?B?SExjU0NXUFYrUU5HMm9kNHVGN0VkK3Vjd3lPNnJmU3FldkJDQlhvZGFkdldM?=
 =?utf-8?B?VVF4c0luU2xXSmFBSnZPWVJGelNiYjhXTkszS1FrSXdyM1VtVzBKV1JMMFlI?=
 =?utf-8?B?ZitETUZtRXFrSHBUU2x3blp5MzdoWDdmTzVXaFo1QWZObzBvVk9iVG41WjFa?=
 =?utf-8?B?STVSbmVSZXVVVHF0bktxL2tsOVJia3RuREd3b05TLzM2ZG5sUWZiUGpTaUNO?=
 =?utf-8?B?SGdZRU5LQ205VDlUbm5XQnQ4MEU4Yk1yV1BEU3ppNkRyaUtXYTV0WGxVeXRi?=
 =?utf-8?B?eE5Ec0NhRDlJRmxnU2VRZXF4R3UzVjQ5NnIzLzVPR0d1QXJ4bFdNOHR0L2N2?=
 =?utf-8?B?TWtRTjQ3TzhPd0M3cC9pN0ZPUmFndmVOcVpKM1NHREJlVGIxcGJBRSswUDdQ?=
 =?utf-8?B?L2xjR0U0Q2F2TDNRYk9Ba3RHUzRTdTJBMkVPZGxzVGtDc2VUdm05RDlOMmtZ?=
 =?utf-8?B?OCsxeXp2Yk04cDRLN0c5ZmI0MmVrdk1wUDlnRGxGQmQwQit3QnQvWk1SMHRv?=
 =?utf-8?B?QVdtTW9IbTJQWEFxT3NoZnZ2L0U1NmdMbjdNeXNhVFkzZW42U1JBaE9VMkRZ?=
 =?utf-8?B?VVF0dU1RT1d1YlB5VVpGZUFzRWpzdU9oQUYzNlJFaHZvYlRNZmVCTjFmZlRk?=
 =?utf-8?B?MWZBQW9FMFUxRlN0L0VGeDNPSnBZNmRCc2cyNmxFdnVMeTUvbWlzdmZSa2dw?=
 =?utf-8?B?b0gwU0kwcWV1MjY4ZlREd1ovYi9pSVY5YmpTd2tRNWttSEZ5SVJzSlhobFE2?=
 =?utf-8?B?L1ZkVkEzTHptSXY1OUIzbnV1bkF1L3ZldkRUNzAyQ2IrSDVLUWJIdm13bzlu?=
 =?utf-8?B?L3ZZUEtTR2xKQVFYNnFBVnM1K0VPTVFRRjg3Q0hYeXFac0tPQjB5VmxxdzVI?=
 =?utf-8?B?MzhFM2t4TEkzZElCT2QrZWZNTmJXM3k4QkZVMlJYdjBCNTkyNGhLTlltYVJG?=
 =?utf-8?B?Y3hOL2Fvak5KSFMrY2ZsN3lJbHJidFh5alkwMVErWUlLOHFWS2g5Zk4zNzlT?=
 =?utf-8?Q?HiS1vkTnuG3DcO7SmrmAhNgQVWwim7WbiX6Q5EY6pGoc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bnhtMCtJOUxUVnoyWmhoSlA5Q3RBdE8raU5OdXhsZ2ZXWTI3Q0lJQkROYlk5?=
 =?utf-8?B?Zkx1SU04dHYySVZ0YklhbzUyV1A3RFZWTTU2ZC9XcW1ZRUNrRXg1aW9sQTZt?=
 =?utf-8?B?WXpwUEYzTEZqT1MyUkt1eTl2UDVMb29nY3kwVDJVOGQ1dlk3MEd3dlBacXVQ?=
 =?utf-8?B?MGVGYVMxRjFydVd2WDZ5UUxBUWE0ZWJUOFc0d2dMYnU5emM2M244NHlHSXBs?=
 =?utf-8?B?elNub2M0aXo5VHgvUER5VFVVclZZZ2drejZSdkcyVnJMOTlpWjdJSmhyYjBV?=
 =?utf-8?B?aklKbWJ2YlQ1NEZJL0hTK3lNb0NsSzdhS3NWa096MkhDZ0p6TEpzU1hYTjJn?=
 =?utf-8?B?ZFNSNkQ3bXBzRXVDN3crTEVHYjNYRkY1NHVNUmwxOTV0Z25MTU9lV0ZDbUow?=
 =?utf-8?B?Z3pyS3hUeWFPRWVMR0ZiTmw0UjNCUExWdkpBNjhvN3JYR0ZtbGVncDQ3L3Y3?=
 =?utf-8?B?SHl3RU4wOTIycVIwSFNpaTFqS0lRMXgxNXp3T2RCNVFoRk91ZzJCTFRydDFm?=
 =?utf-8?B?ZTVYeW1qM3dLQmdiWG5LajBFUS8rWEttUlFBdDN4VG1mUXpoRlRrUkprZjVn?=
 =?utf-8?B?Z0lTMWxBN1ArZ3AvWG1NdENCVnpSTXZaMGc0eGxId2VzWWw0M04yd1dwZjk5?=
 =?utf-8?B?clFuN3dsRk11Qkp3d0Q3Z1pHQlk1ZGc5Q1Z5VFhwc0h6d3JCT01hTU82WGQz?=
 =?utf-8?B?QWc3dHRyYyt3a2lsYXRjV3ZhMUZWWncvU1hJMEhmNjJVQW1PTTFreDE2bDVW?=
 =?utf-8?B?bGtKUndtd3RlYm9sc2hMTzBjN29VQUNIWGF3MGxWdWVieHhPU2twUXpLTk5r?=
 =?utf-8?B?NHMzMUIyY1cwMnkxMDFzaDhrOFFSTXBJanB6emcyVWhmVkdhWnV1Y1UwWHFk?=
 =?utf-8?B?ZmRIby9CNW9SRERUekxmTHQ4ekVRa2hUWWVDdjgrR0M2UzI3alBHdVVjVWZV?=
 =?utf-8?B?T0NBcUZDbU5IQlB5Q3NWaXFhalZkbXhHd0RjSW5HZDBhck1lREJidW83M1Zj?=
 =?utf-8?B?YS9pMm5yT0dnRktVOFJvVDdRR0wxK3JBdkxKamczR2ZQZnZkTmJLVlhnei9j?=
 =?utf-8?B?SURMR21wQVZhVlVmbFVTQ09VU05xUjMxeGdNUWRMQW01bXI5bVBsdmNRb2Uv?=
 =?utf-8?B?blVsN1dMeUdKV2RObTdOdlJwRkozaWxLMXhLY1ByOGMzdzRBSS9iVjhtcFRq?=
 =?utf-8?B?ZkhXRDNnemQ4Z0liMjZVamp3bTVDdzNMcnRBejc1aklISWVGWnV3ckM0UEJy?=
 =?utf-8?B?QVZTZUtUeWNlQmpDQlJTS0lpQnlJeUZWdDAwT2hSdG9RMDdIQWNQeTVjaEVQ?=
 =?utf-8?B?MTRZbkMrdm9zak95N1RDcnEyYUduK3N6cGxlMTVZWlZRL3I3cXJ5SldtL1lw?=
 =?utf-8?B?VE4xNXFEb3hSQlF0TWlhTXgzWjFpYUlxL3Y3ZmtTZzVYa3JHdU9CcG5IS3R1?=
 =?utf-8?B?Y2krTUZBYlMrN2hzUnd2aWVkeTgzNFBYMklIaExHdjd2NkVVZmZpK3Y3WTE4?=
 =?utf-8?B?aUVJQSt3ZWsvcHAzNWd1clFiYnhHYjNOcE1lVERMb3FFUGlDanYzQ0g1bEZk?=
 =?utf-8?B?ZkR5Tmh5dmp2SUFqNUY2L0h0NEdwenVjb3MrZ3hxeXZuTU05U3FydHpacUZF?=
 =?utf-8?B?b0pwRm0rbW5zYnpmQW9KNlJNd2Ric3E3TnZPYUw2dS9aeXFDV1ZmZjZncFBN?=
 =?utf-8?B?YjRzNXpWT28rS0pzM3d5clJhd2YvUVNUZ2p0cThpK3dKRnp2QzRJTTB1RDFj?=
 =?utf-8?B?QW5ZUitXTVg1Y2JKTmNzWWk3TDhud1h2N1o5ZFBocVgzSG9ZbnB4OTJ1M2xI?=
 =?utf-8?B?RnRPUDM3bUNYUEFDcEZSbHptTzUzcHI2WWNPdDdyU3hHNUdNVEwzMHE5T3BI?=
 =?utf-8?B?bEFhcmtDNHBnYTFkWS96Ti9aZjJVelZKdG5OZFdjSnQ5T3k0dXFWOHdRNWRY?=
 =?utf-8?B?ZERJV3o2c3hvNUxKclJqS2ZLOW9LZXNEd0toamZFVUtLWlJGdHdGQTM1VURu?=
 =?utf-8?B?QVZHcmh5OUdMdzlGbEplbjB3cWZyUG95OWlGVXhVRE84Wkh6Y0hOcGIrUjh3?=
 =?utf-8?B?czh6YjBHdmNVdmx1UEN0Zjd2U0lXNGthQi96QWFTNXFObVNscmNEZGVvbkVX?=
 =?utf-8?B?Z3d5MkRPd0RNNW90UDFna3ptNGJQWUxDR0pEWUt0MlNjcFNiajh1bHp0MDNP?=
 =?utf-8?B?UXc1WGk3clBUL0JMTjhEaFQzWUpEaUR3Y3Jua3NzOXV3NFVvVi93QzRUeHNI?=
 =?utf-8?B?a2R2MGNoTHY1MUhZT2lZZDJRNVdSZ2tkQ0M4Q3l0MjFXdEUyenpOUEh1d1dM?=
 =?utf-8?B?ajZjNWxjQk9WL09aVlg0WTVEcEIrZTdrMGY4V2tjQkdocDBIL28zbkRlK1Rl?=
 =?utf-8?Q?I2g1z5sbOJAELiB4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807c1285-a8bc-42af-6d3b-08de69895e91
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 16:19:45.6460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWf/Tj5zMFVBPqiLaRp6vo8N4wJBa2nJO6oMx5hPBoO4U2CW6Q+kcD4do37CCtkzCh7gF2Q3pds7lqIO+XKmwxZ9bRTCE0QXFy8h5Anc3ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9013
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698cac25 cx=c_pps
 a=DLgJpnoc0/49jVUGH+L3OQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=Wcl3cqFRKMgcsmWL4BQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DD94xrzlTr3w-RaB1KBHx9YZlvw4wgoD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEyNiBTYWx0ZWRfX0UIS8/ErrrH5
 7PyieCAJiDATQaXYnqFxFUZtr9sOhiQHN1Cee5BpRpHKDSx5/bs0C3izJTj1xpeMCfu65BEE4Ko
 8AlAvj3dyoEyD6dQlerFK4qmF+xUZVFpGrNw5XMFjvd/wNacupxtFiLm/fnbkMA/63ZoVfWGUmx
 ECrKlYyUG43WHdzi/RFafEQZij1yr08eIlvl0Ar8zbDhRzkO8JHH3rhYu6CcpAKOA4noRzSit8c
 A/OyizvF3nP7XeDBx4jLrAcjfG2+nZbC1a4u3G886JH2S4H/ljjvx7Iiq3leJkSnHaZMg1RiwoW
 a0kyIAEfCukRo78WqR7g1MweBICYxaSUytJXBeHSZ9R7DxOP3WY38i1FGbrkgizIX/87H4+0RTs
 /DIjwQeQHPo28uOihD854F9bCW44HZEFZAZX9VjsU22wAbdGPIGbHZFPEe3Jxw2lpAVWmws52Rz
 kcoNmpixC9vOtVTCdIQ==
X-Proofpoint-ORIG-GUID: e-l8GrUvKIPntEiImiCmEAUKPKeVgwvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110126
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61B7U0QM4142839
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 16:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230994


On 1/29/2026 10:09 PM, Sadineni, Harish via lists.openembedded.org wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
>
> Publish artifacts from kernel compilation to allow out-of-tree Rust
> compilation:
> * scripts/target.json: target definition: architecture, ABI, compiler
>    options, ...
> * rust/: the crates compiled by the kernel available to
>    out-of-tree-modules
Hi Yoann,

I am dropping this patch =E2=80=9Ckernel.bbclass: Export artifacts needed=
 for=20
out-of-tree Rust compilation=E2=80=9D from my v6 patch series.

Without this patch, target.json and the rust/ directory were already=20
getting published for x86_64. On arm64, target.json will not be created,=20
yet the module is still generated and works fine.

When building rust-out-f-tree-module for arm64 with this patch applied,=20
it emits a warning that Out-of-tree rust modules build will fail due to=20
a missing target.json in kernel. However, in practice, the build=20
completes successfully.

I have tested without this patch on both arm64 and x86_64, both tests=20
were successful.

So, this patch does not appear to be necessary. Are you OK with dropping=20
this patch?

I have pushed the updated changes to the below oe-contrib branch:
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Ddeepesh/r=
ust-in-kernel-v6

Additionally, I have extended the ccache disabling to make-mod-scripts=20
(as part of "kernel: Disable ccache when kernel rust support is enabled"=20
patch) and updated "meta-skeleton: Add rust-out-of-tree-module recipe"=20
to align with the new changes.

Thanks,
Harish
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>   meta/classes-recipe/kernel.bbclass | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/k=
ernel.bbclass
> index 30a10b0801..dfb8604a68 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -632,6 +632,24 @@ do_shared_workdir () {
>   		cp -r scripts/gcc-plugins ${kerneldir}/scripts
>   	fi
>  =20
> +	if ${@bb.utils.contains("DISTRO_FEATURES", "rust-kernel", "true", "fa=
lse", d)}; then
> +		# Copy target.json file needed for out-of-tree rust modules
> +		if [ -e scripts/target.json ]; then
> +			bbnote "Copying scripts/target.json"
> +			mkdir -p ${kerneldir}/scripts
> +			cp scripts/target.json ${kerneldir}/scripts
> +		else
> +			bbwarn "scripts/target.json not found in compiled kernel. Out-of-tr=
ee rust modules will fail to build."
> +		fi
> +
> +		# Copy rust/ needed by out-of-tree module (firstly for the core rust=
 crate)
> +		if [ -e rust/ ]; then
> +			bbnote "Copying rust/"
> +			cp -r rust ${kerneldir}/
> +		else
> +			bbwarn "rust/ not found in compiled kernel. Out-of-tree rust module=
s will fail to build."
> +		fi
> +	fi
>   }
>  =20
>   # We don't need to stage anything, not the modules/firmware since tho=
se would clash with linux-firmware
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230151): https://lists.openembedded.org/g/openembed=
ded-core/message/230151
> Mute This Topic: https://lists.openembedded.org/mt/117528980/8054390
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Harish.Sadineni@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

