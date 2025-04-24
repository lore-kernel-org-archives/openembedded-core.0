Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45D5C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 10:48:23 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.69])
 by mx.groups.io with SMTP id smtpd.web10.12097.1745491692657140540
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 03:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GxlKy1Um;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GxlKy1Um;
 spf=pass (domain: arm.com, ip: 52.101.70.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=P0z9vJnB9LPGmc+Czo3Moyg1At0oOSQuJjH++qqpM9rckRYNXuYS6uPbDPXFTuRyECNzSCNVca+F4qpUrOUENnK4G5FCp0P/Y+itsmTpBlO838B83K6w86nncC0fLUBmGZhw9YLkKNAUT+4JIXiXvKRU9UOuYFX5fRzbcU3Znpk8CLexOpr1DWC0HSEpypeIG8lqdcVysw7zQZy5QoXxRJvzuCmuRHVwztldf/WszV7UdkdgkJ6xPTBXENXOTazUBbhjOUPmkwbfgaqDRcndL0GMnxSzSTkhkIxW+fN8DLDvKn3BctIN4Oht4gNmhqlq8uaVBNGZmKfDgvcoEPNa0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXmg/lPNlT/odukgr0mz7LeKPCHvD+9oYrPGPWaI7IU=;
 b=uXYLuEEsUEwWMCkZJhqzG7ZH6y9b2W9pZCEOy7K/6dQxudWbkAZEPNQFL3YGUITIZwRMJ2lQCx7QQa3Jb5DAdIWNiK56LHU/RfuyYkE69qMxEwWxR3Nssqsfm2yJRwrsWjJ5cQJQPxZ9bjx3tIvQABSe7Iw7q7JN32Xd3SFHiMQlGjpdmpjxARRakvriZq+MRSW1baN7ciTT7KZaWjin/b1lsAg6aSKaZBTzYW0YSEbWvxjX0bhKw8ZBHFnYfewHKBS5Ef1FsTp4WdbW+5eYkHV3cK6qyLnYZ/Oizcn5MtMkR5aF743B5iLcnciRA4m1P//x1IpVla90CPQNhX20vA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=phytec.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXmg/lPNlT/odukgr0mz7LeKPCHvD+9oYrPGPWaI7IU=;
 b=GxlKy1Um9LKgzD5crp1EdSzi2BO403EjvB3Xa9kkQeKN10PDVrPr3Arnt5jWwhkOClEADeumGE81LUtLpzhRApn3XISg+fOam6n3DSARvn3p7jVMCNG16vkVxYHZWrS2P4caUq6oEqWrKcri+ZuJAtD2rvRP1GklOFxBlRU6txo=
Received: from DU7P189CA0015.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::14)
 by DB9PR08MB9827.eurprd08.prod.outlook.com (2603:10a6:10:460::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 10:48:06 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::a6) by DU7P189CA0015.outlook.office365.com
 (2603:10a6:10:552::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 10:48:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12 via
 Frontend Transport; Thu, 24 Apr 2025 10:48:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8e6PTg+ftXnMObTRu7H36EFBG62lyFiDmmPXUWCwSVoSuA38D7E2+rHNH/97PuHLCJlCm3oMdHsILJzacq/QAmJUFupefxyRnSmT0pfpLnu/x8VnijDBg1vx5xgpbX3NPHq+hOa22W9AaDJ01PC2UI3ld/IQAqusU2yufoA7+y2ALAxWH3axv8ItwUoG+g839IHczwqqR3SEASPl0gST4+aVSEhNJxQnlMUkpsmh+I/X9XYHIDOFdwvHMD8ov79ZYeTYYk+VqoztNvvJKeby7t8s1aQ1vP/pAqApL1jhf2/vRgp+yMghTlicVLF9Qtrpuq58nlPTokmmpANb5frVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXmg/lPNlT/odukgr0mz7LeKPCHvD+9oYrPGPWaI7IU=;
 b=PK4ZBIkosra9CoVh3fWcbK/eAsKg6Yepg389uNxVgp8DqQBOy8NDMVd7NE5h80n5cJV3G1pLCEMnH2ztqHG9bAQlsD7iyjZzHVXfTKG0GBAUHEKmNYXIV6qFvZtmQIM8lgDdxSsCKGpd5NaYJjKKMVGIlbwx9n1sNvY0shcCdAPgyhxA5iU3h2na+FF+2A8mthDyptDA56Cyrbk742W17mpyE1PmXt3zvNwR2WOPbHmo1BHVGmvWdDiZcU4MUzN2fKtBaBlKVwyM/+To6xIymj9JVIuJzuxq5UgSGPtPhgKKgyIETCLhLtlmjbyP5qslS4ncdGR46MEW3iDLEDigVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXmg/lPNlT/odukgr0mz7LeKPCHvD+9oYrPGPWaI7IU=;
 b=GxlKy1Um9LKgzD5crp1EdSzi2BO403EjvB3Xa9kkQeKN10PDVrPr3Arnt5jWwhkOClEADeumGE81LUtLpzhRApn3XISg+fOam6n3DSARvn3p7jVMCNG16vkVxYHZWrS2P4caUq6oEqWrKcri+ZuJAtD2rvRP1GklOFxBlRU6txo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB5988.eurprd08.prod.outlook.com (2603:10a6:20b:283::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 10:47:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 10:47:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "w.egorov@phytec.de" <w.egorov@phytec.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [OE-core] [PATCH] meta: u-boot: Provide option to install &
 deploy EFI capsules
Thread-Topic: [OE-core] [PATCH] meta: u-boot: Provide option to install &
 deploy EFI capsules
Thread-Index: AQHbsHZwAnOhyDBx60qN4+zJOfVBcbOyq5cA
Date: Thu, 24 Apr 2025 10:47:33 +0000
Message-ID: <6E3809F8-E1AD-4243-8738-22E4179DBC25@arm.com>
References: <20250418152706.447180-1-w.egorov@phytec.de>
In-Reply-To: <20250418152706.447180-1-w.egorov@phytec.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB5988:EE_|DU2PEPF0001E9C6:EE_|DB9PR08MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 27cf0a71-1146-4bfd-e47f-08dd831d7ee9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?b3Fma3RQNzBTSWVIRWdDK20wYU9vSzFYMXVKeTVMWjlvVk40S3hOaEM2T3B4?=
 =?utf-8?B?NzNjK2h4N2xwa2RHSGdKNUd5Ynlkb2xUcWVUYTgrSjUrbTZUOWQwbHQvV3Nu?=
 =?utf-8?B?UjVOWlYwbko4b0VkY2xXbE5aWjJhVVZHdXNWVmluL3BxZ2dpeGxobGlpbFpu?=
 =?utf-8?B?Y2RwUGRucnRlK2RWSmJvRnBkRXZ0RHZPa3lZL1I3MjhIeG9TOGlwVUdUODVo?=
 =?utf-8?B?RGZFTXpUV2NTUDYwNmNGRG5Yd0RJcnkzb01USWxZVkhweHdSRDFEYk1uSGhl?=
 =?utf-8?B?RGtyZ3VzT05sbW1IMVU1YlRBMXpSUzBSK3JyUG5nZ05PbTV4UHkzZVlTaGNj?=
 =?utf-8?B?am9ybThRMHZBZkdmNEZQdUt6akppc3BtYTE5M24vb1FBTTBseDY3dWRDNlBm?=
 =?utf-8?B?NzZpTFBHTjBTOWo0WlBhMzIyMGFxa2NKMUVPcC9HUVZrdEhQZnZSc1ZIZHZL?=
 =?utf-8?B?THZnTGVFYlF1dWx0MjA5dXVrZkl3TmF5Y2tHcW5TWndVdHJHMWNCRkpNL0d3?=
 =?utf-8?B?SE5mT1U2cnBiTU9WUDVnNG1YbUhHQTl0KzNrbmtmdVpLdkthUWtxaEl0aFhH?=
 =?utf-8?B?UG40TjlERm9qODZJbHB3U29RZHNPU0ZJQm82N0x1U1JQa2YreklqOU82SndD?=
 =?utf-8?B?eGo5TU5ZeEJ5aUJjNHYxM3IzN2dFcFNBMnVHUU1ubE9kQ0Uyd3JvQ2tlQlFG?=
 =?utf-8?B?Mjg0blc3NzFrMDZzcDZTVk9KaW9IMkNmS0R0eXFLYlYrMXVGcXI4Wm9WTi94?=
 =?utf-8?B?RnRZOFZReVJMV0pvKzloOUhTbkxKb2pUYTA1TnMrbnlLQUs5am4vbXpWTUxk?=
 =?utf-8?B?REU3dDl0NU9JQlBveTlrN2FHcFdQUlV1U2hpOE14eHFuZStMdzU5S3dXcml5?=
 =?utf-8?B?N0xzUE9Fd1orNHhnVDFlUWFOK2VzRCtwVGxjdU5Pb2hBNXRYNnhoMHoyNmgw?=
 =?utf-8?B?L3NVYVpVdUFUdmhIMWVRelBKQ0FsMm52eDdJdGVBTkgxYmRhSmVITjVmUVpU?=
 =?utf-8?B?OGFWNzU5MDBQUUZhbGNTdkhKS0ErZkVxSC9GQml2N1Y1ZG1ITGtmUzdldm1T?=
 =?utf-8?B?WlRuZXFlV3RaV0U2Z3pwaFkrQkhib2xvTTYrN3hOM3oxYVZjZExBOW5SenI2?=
 =?utf-8?B?WXNqQm9oNG11U2U1UkxHRExkK1dvVEFEWlRUR2pvYW9WV1NrZHZraUtjWHhT?=
 =?utf-8?B?LzdnTVJMVG1FTFdrVXc1cGw5T3NWcDlGS3loV0tqcGgrcEJuZjVLNjJmK0xK?=
 =?utf-8?B?WTBtcC9STUJ0Tm5NZGprMDhNdE5IZ1lGSzVsUXJrTmFWWjVNakZBbzNTbSsz?=
 =?utf-8?B?RXh3TmRmWHlxeURyNUZSSmZvRWhMRVo5Y1Z3bFIvWUU5YndRb3JKUjc3STNo?=
 =?utf-8?B?aWhCUVZHSjE2R2tXRWQ5emc4KzZZa2JGZzBSa2lWZzNkUi91RkFsRG1nV2Rv?=
 =?utf-8?B?NjIrdXVkdXJGZTRuajNITlg1dWZNYUdsUHhZMG1MUWhZVlF6bXA2T2JmeC9y?=
 =?utf-8?B?a3RIVzUvQUtoMGk0NmhqMm5FVmRQSEV4UmdLanYyMkc0NlFzZFB1c2taOGFV?=
 =?utf-8?B?ak96aVA3YVFXcE5tSTNFZmprL0lTUE41czdUOW5ITTNucFZlQnhXZkRTMWkz?=
 =?utf-8?B?WFJpNGhVMGtiWHBGeDBxK0l3MzgrOUZ3dnhoNmJNNGFlV0RrbVFrdFRHTnRP?=
 =?utf-8?B?bzMwM2FHNExTTll0UGpXeUtwTWp6MWo2MjdxVFJaYWlYTWQyTGt5ajZ6M2Jw?=
 =?utf-8?B?YmRvTmNndllTankvNGZORDlLNmd5R3RIK0NCdzdRaUloTjNVRmFvd2xPajZQ?=
 =?utf-8?B?UWdUKzVBQW9BSWdham0wc1owWjMvZitab1JLSmxUR0cvb1plRmxYcCtmMzRW?=
 =?utf-8?B?dUVIR0sxRkFRcUtKaVpmazEwWHVXVlVMV0tKUXVZZjNzOVkrZk1jZ1ZvdnVn?=
 =?utf-8?B?UDEwUnpQd0loNEJYbjRoMTZrUUJvTGhkZVVrbG91dkRIemtZU21kVzRoc2RR?=
 =?utf-8?Q?tDdTLMTIEtPPr+ybvmr69xE1eIMbbQ=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BE1A41FBC97674E89C1D20A3085DEB5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5988
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b36e77dc-f361-4cd7-fd46-08dd831d6b33
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|376014|82310400026|36860700013|35042699022|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MDcwd2doZEJycW1xb2labDVwV1ZpQWFycXVIaS9PMzF2UTVONHBrcSs0MkhW?=
 =?utf-8?B?KzM0V1BaeWQvOExDMWRDaW8ybnhldDdlSXJvcExVRUVES0ZzNFB0aGgvU3pM?=
 =?utf-8?B?cjZDMEJ3NEwzSnl4WmkyTE1tVVNVeFpkUVRUdzkvNlk2dEVTTmNMK3ErVWxp?=
 =?utf-8?B?anpmajAvLzgra2txRDhFamlaeFpaTXZKVWptK0M1K1hkVWpyWlpWb3NnVE16?=
 =?utf-8?B?OUhxQmFTVE5VSC8vdkJCSUtFNHMwYmxkaExqNGRVaWlMbDU0WVFBeTdzejk0?=
 =?utf-8?B?T1EvR3JQVVJlR0dUMjk1aXVxSVpFWkF6T0x5YUEvRndNb1lYVDY2SUZVZ083?=
 =?utf-8?B?NElHWWpkbWRLaFAxb1QzUy9aaVZ2UFp4Z2F5T003YVFjd2VEWE9RUmxFZDJC?=
 =?utf-8?B?blZ2K0FtSUJxZW8rU3hIN0htT3ExeTQ5ell4ZkdmVWFkcG1XeU02cDNUcjFD?=
 =?utf-8?B?ZkpEUFVOS08zZ3Y4TzJXemx0MlFGSGFHbkl5aFNRZXozc1c2VHJDNTlaOVdW?=
 =?utf-8?B?dGk1OEZWTEtXajVYM1FncnNELzNsSlI2WVo4bkhCZmVreGRycXlpSmtyaHZr?=
 =?utf-8?B?TjZ1eFJWM2J6UWZ2WVY4ZDZhZTBZZW9BOHJQWEtlU0Q1UXNIL3RKbjdwVlJ2?=
 =?utf-8?B?ZVYwZVZzQkUyR3RjelEvQ1pHc25LOGxoSURGeDA1eHdERmpWVXhqU3c5Y1Zn?=
 =?utf-8?B?S0V5Wm9mZFR1UE9tSnl4cmI2OXFvMlByVFJpWmVyalFJejJKcnM5TW90WFRn?=
 =?utf-8?B?OGRQTDZxVmErNDJyeE9YYTROYWJMV3JPRStYdW1aK0hDRUd2ZTFCQ1drSmt6?=
 =?utf-8?B?WFpyR2NuaFE0YTdFSVc2SjZoUzUyZnBacXV6eEU1b1lIdUVuaC80TUF0L1hR?=
 =?utf-8?B?bkFCajlBT3hKZXVwWnhSTlJreWxwblhNdDZjMktnMUxwQ0hzdzI2Z0dhRFJ4?=
 =?utf-8?B?WXJZWWR0Mis5dWkzSm5oSFIwa29iL3RrMDB6YUR2Z3FSMmF6eHhnUURIblB4?=
 =?utf-8?B?SG5PZVFSeE1OekJGTFBXeUxBZ3dlWCtxWlRhZEk2KzZJV2ZxalJKdmpUVUNw?=
 =?utf-8?B?WUZiYzQ5UlI1cTRlOGw4bVZDNGpPWWhjR0tEZHVFb0dkeHZweDM0VWFFdTd5?=
 =?utf-8?B?dStCRzcxU1RyeHc4bEVZaU05ZW8wa2tsMmNFQTBlWndJQ293d2lubmJzeXBH?=
 =?utf-8?B?SHdaa0xJU3dnNzViZDI4bzhMaWlwUkhkUmRkSUcyMFlybmFUZnY2MGpMOWF5?=
 =?utf-8?B?KzBIT1lzVTB4RFFzMHM3R1pEdHFYNndwUFY0a0hSckMwNS9ZbEIwcEJBSTV5?=
 =?utf-8?B?S21LbDhQRzBnY1F5bnJnekhCeDFkOFdkR0ozUm1BeU5wU3FuQ2E4YUozcnVZ?=
 =?utf-8?B?L2M5anFkZklSQWpTRjQ2SkZHSEFVdjhxQ0JCOHFvVXMvaW9WR3lFWU9uU0FB?=
 =?utf-8?B?dTZ3eUpzUmtEMk9oQzM1UUJFV2xhZkQxb2ErT2lNZ01DdnJJVWtFeitkMWkx?=
 =?utf-8?B?Uzlha1Bob0ZUOVNzeERrWU1YYlBvWW01RTJqTk5LSXgvUjFIcEY4QVNMa25K?=
 =?utf-8?B?bTd6d1VwK29SdzIxNXhKKy9uTmxIQzlSc1pwa1FkbkFjY2l0RmFyZ2RwY2Ny?=
 =?utf-8?B?R1dCcDlteUF2M1B1UUZaT2xzQTRFb1NjeEhUZFEza3lKbU9nQ3lSODFoVWJv?=
 =?utf-8?B?TEdBN1dBQmZjdEUreUZoaXNCTnA4cGRUZTlIazN5SUo3TEZlY3ZiL2dUSDFn?=
 =?utf-8?B?WGpYVVcvNzRLTE5pRnJlOGtYSklRSFExYnR5QkgxMThOZEFycmtQb2krZU8w?=
 =?utf-8?B?QzJuWlNZQy9SdmY1MkxWTE1iVWt1YVEzcVUzdGh3WmltQkIxY2ROcVBWdmRp?=
 =?utf-8?B?QmtRT1FsMUlKbHVSU0YxVXBSWGozZ04vMHhMd1ZnT2FyS2pTTUVhOU0vVHdN?=
 =?utf-8?B?ajg5UmdtUGJmTkVKdHRwUDl1MkNsU3V2TGZDNUdZSE1URzR0M2Q4SW5raE55?=
 =?utf-8?B?QVN2d1dHbUswaWZCN2IySDdZWCtheUczdHBQVnV0cXR5T09ocUpJaDRWNS9q?=
 =?utf-8?B?YWhKMHYvaHlRWVFQdFZITjFuaUZIYlFkYXRBUT09?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(376014)(82310400026)(36860700013)(35042699022)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 10:48:06.2088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cf0a71-1146-4bfd-e47f-08dd831d7ee9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9827
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215357

T24gMTggQXByIDIwMjUsIGF0IDE2OjI3LCBXYWRpbSBFZ29yb3YgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPHcuZWdvcm92PXBoeXRlYy5kZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gQWRkIHN1cHBvcnQgZm9yIGluc3RhbGxpbmcgYW5kIGRlcGxveWluZyBFRkkgY2Fwc3Vs
ZSB1cGRhdGUgYXJjaGl2ZXMsDQo+IHdoaWNoIHByb3ZpZGUgYSBzdGFuZGFyZGl6ZWQgY29udGFp
bmVyIGZvciBmaXJtd2FyZSB1cGRhdGUgZGF0YS4NCj4gDQo+IEJ5IGRlZmF1bHQsIHRoZSBmZWF0
dXJlIGlzIGRpc2FibGVkLiBUbyBlbmFibGUgaXQsIHNldCBVQk9PVF9DQVBTVUxFIG9yDQo+IFNQ
TF9DQVBTVUxFIHRvIHRoZSBhcHByb3ByaWF0ZSBjYXBzdWxlIGZpbGUgKGUuZy4sIHVib290LWNh
cHN1bGUuYmluIG9yDQo+IHRpYm9vdDMtY2Fwc3VsZS5iaW4pLg0KPiANCj4gVGhpcyBvcHRpb24g
aXMgZXNwZWNpYWxseSB1c2VmdWwgd2hlbiBhIFUtQm9vdCBidWlsZCBhbHNvIGdlbmVyYXRlcw0K
PiBjYXBzdWxlIGJpbmFyaWVzIGFsb25nc2lkZSB0aGUgcmVndWxhciBVLUJvb3QgYmluYXJpZXMu
DQoNCm1ldGEtYXJtIGhhcyBhIHVlZmlfY2Fwc3VsZSBjbGFzc1sxXSB3aGljaCBpcyBzaW1pbGFy
IGJ1dCBtb3JlIGdlbmVyaWM6IGl04oCZcyBhbiBJTUFHRV9UWVBFIHNvIHlvdSBjYW4gZ2l2ZSBp
dCBhcmJpdHJhcnkgY29udGVudC4gIExldOKAmXMgbm90IGhhdmUgdHdvIGltcGxlbWVudGF0aW9u
czogY2FuIHlvdSBjb21wYXJlIHlvdXIgaW1wbGVtZW50YXRpb24gd2l0aCB0aGUgdWVmaV9jYXBz
dWxlIGNsYXNzPyBBcmUgdGhleSBjb21wbGVtZW50YXJ5IG9yIGNhbiB3ZSBtb3ZlIHVlZmlfY2Fw
c3VsZSB0byBjb3JlIGFuZCBleHRlbmQgaXQgYXMgbmVlZGVkPw0KDQpUaGFua3MsDQpSb3NzDQoN
ClsxXSBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL21ldGEtYXJtL3RyZWUvbWV0YS1hcm0v
Y2xhc3Nlcy91ZWZpX2NhcHN1bGUuYmJjbGFzcw==

