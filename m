Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0E3EED632
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 17:44:24 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.66])
 by mx.groups.io with SMTP id smtpd.web10.54252.1726163058260542430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 10:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UwcYp16m;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UwcYp16m;
 spf=pass (domain: arm.com, ip: 40.107.241.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mPnBkqevs9j9eZNmZVw0FgNu/iSoO0mq9NNPHTLppHA5F0XqHNna/2AGNtvDaTqx0oQqyKCFuqu8w3q5ljgrbMAsud5+ISks4X5XI8lpwiizw0GtNzNQtLzGasUo+DNKX4pYbJxiolnQDBEvJf2HiLjz9gZb+w21DowulWkJCVQhHq3EKKejLSNS/ykteiu4PUfrJHFgkTRFEgZPvNZM1C+PLrAJ1WykB8tmwW45qvVoe+0WQs8syKUMQIRd0wz6wHWnw8xBaTXFxXmrn4+rNCZ2eh1I4H8Ta1tKTAqN4MOZ05LfwW2X+O2rt9MddKAv/BbQ/8ysp9Lfwm9JEAqPSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGitJE9K/8E+nZ9TyTt+rQaq4xh+5hjk8tIDJDtkdu0=;
 b=bYI1YjwCWnJDjBLtETcVNJYAvVnRwh1MvnUw18TihlzLKGwqggHAxSDAO+m81oeZyGg6iPzQB6wr+S00L9J7sBVQz7PnQ+7cG24ywNvHn618sVZrtXoBUH7NG7qtlTY5Bl0Y8eWmcsRWXr8Vj70NzMasIAPk8E9r9go6tFlT4kOcDcor7K8HuPI5K24HGDuKNwAqB/QGqC7qcNeo8Ux6YPGspOcJthhahnM7CuxXF46oRa91zPs/ANG8QRUSoi2UBxNPp5JK1sRIMFLgWOzU5u5zSzxouvfdzB6j5XKfYEcatDaQIubAvDk6VRUAtbtMAvUmCzKw2ghwz3OI1ixQwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGitJE9K/8E+nZ9TyTt+rQaq4xh+5hjk8tIDJDtkdu0=;
 b=UwcYp16mronC/sLTBqAWG9auqMm0e8TkQNvVi0eCYjShiS9CumsgG7GPysyjo26i/Cwbbe1lieKTZfGDxtkt+GctVUS3AH6YweI9xjUepZga7zgXgR0WoM8AFN4h/a4DALYQJMo6bZr8CJTzLGLLZXQqiWZ2EErS1ilSDBt4P+Q=
Received: from AS9PR06CA0290.eurprd06.prod.outlook.com (2603:10a6:20b:45a::8)
 by GV1PR08MB7780.eurprd08.prod.outlook.com (2603:10a6:150:58::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 17:44:09 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:20b:45a:cafe::3a) by AS9PR06CA0290.outlook.office365.com
 (2603:10a6:20b:45a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Thu, 12 Sep 2024 17:44:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 12 Sep 2024 17:44:07 +0000
Received: ("Tessian outbound b109797c3965:v441"); Thu, 12 Sep 2024 17:44:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1af9ca2d89593b0e
X-CR-MTA-TID: 64aa7808
Received: from Le464bf9aa91f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4FC67919-0CBD-436E-A79F-98EF9DCF2887.1;
	Thu, 12 Sep 2024 17:44:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Le464bf9aa91f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 12 Sep 2024 17:44:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rm1QC4fovWDkIXsvOjAIr0tlFcrJlG/m1N4QBrLngiMCw7eveSN4EJRJ/4NcQBU2Rt1Lp+ClALftBXbqLkEVEdarIvtIMaB4MeMVfk0uJj+ASsaueNjEC1nfrGROeB5+UMj/PpxkAcslcZINFbkDlQJY7ZWBnLPOxkqtcNFDR9sPZFsM1Mktye0u1QqQ/k2hk08Tmq7t2QbALMG89T8ZlYacLrFrX96NVdP60Ula1W/5iPrjqkAwOy1WrExRvKfhIv04kcBFvxehsS+jMbMwFYc0KiWao8f5Ljboafh8TPJCYfxxzf5NobGdGfIlgKYCvxx65MShjTZ7kdO1ICtnMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGitJE9K/8E+nZ9TyTt+rQaq4xh+5hjk8tIDJDtkdu0=;
 b=Vccjz6FbRlPuYPBObJNEOSdkwqNosTLC4O5SzPT/xQWDW4onxBRdhCxU+0wgt9uJudiCjScEDIUZdpQb4j129DrxIDZw8dmmmo0HMAFcdRq5/dvQbhc+uXvAQ3tAbHjpQJLL2OL01Gy3GvuRLCYMLunR9aI3adx+hrReH1R8G7FMdmM4hkRIIqM6DaY2hczjMBqCyPDDh8imfHHfRWUtqdq/AYNyPUCorkS2YB7/3SChIL2ctixJCcnveXfbLOl3TwjvacPvBrHVf87PUBP1JoOR693+lUubqCYEuM4K+ka4g2QPYUsN5otXReVGHabaMLg3lVx1leGjrNYP8j9/Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGitJE9K/8E+nZ9TyTt+rQaq4xh+5hjk8tIDJDtkdu0=;
 b=UwcYp16mronC/sLTBqAWG9auqMm0e8TkQNvVi0eCYjShiS9CumsgG7GPysyjo26i/Cwbbe1lieKTZfGDxtkt+GctVUS3AH6YweI9xjUepZga7zgXgR0WoM8AFN4h/a4DALYQJMo6bZr8CJTzLGLLZXQqiWZ2EErS1ilSDBt4P+Q=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5789.eurprd08.prod.outlook.com (2603:10a6:800:1b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 17:43:59 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.7962.014; Thu, 12 Sep 2024
 17:43:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Divya.Chellam@windriver.com" <Divya.Chellam@windriver.com>
CC: ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3: Upgrade 3.12.5 -> 3.12.6
Thread-Topic: [OE-core] [PATCH] python3: Upgrade 3.12.5 -> 3.12.6
Thread-Index: AQHbBN9Rhk448XyLpkqGH8OYRtqwFLJURU2AgAAnmQA=
Date: Thu, 12 Sep 2024 17:43:59 +0000
Message-ID: <8940EC00-1BE1-429E-AFE7-D250C9196351@arm.com>
References: <20240912064407.2503089-1-divya.chellam@windriver.com>
 <be3c1eed539e0568b5272bb9f0e88b49f7cb886a.camel@linuxfoundation.org>
In-Reply-To: 
 <be3c1eed539e0568b5272bb9f0e88b49f7cb886a.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VE1PR08MB5789:EE_|AM2PEPF0001C711:EE_|GV1PR08MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: 56f6ff8e-894e-4da2-636e-08dcd35280ab
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cFlqU0wwSHQvWkY1WHhCZ1pPMGt2bXkvNFd3ckNvM0hrNWMyMjBpRExxcFBa?=
 =?utf-8?B?ZGs1cFNlL1FSK0xzK3B2ZGFUa055RnNibXZ3eWhKTGNickQzQTNWSGxxK0dY?=
 =?utf-8?B?bVdYRzhUS0dVYlllRDcvNnY1Q29OZTBpMzI1bEtkNk0rdUN4dFVLdFlzUmJy?=
 =?utf-8?B?SGVXOHdrVTU2WC9TL0lkZ2xQQjI4bnBydllsRTF3TGllNktaelNNY0tLSzJu?=
 =?utf-8?B?MmE1SWMvMS9zaDc3TGs5bFk4Qk82SXVIeEFqeEdSVk9hZFlZbC9ibXVLUnFQ?=
 =?utf-8?B?UWJMMnMzL1ZDYkIyVGJ6cmZnYzU2dnRoUWlvRkFRek1XT3J2TDBOWGJQbnRo?=
 =?utf-8?B?dGY2VE5ibEZsRHl5K2ZSNFVBaXorSjVYM1JBemNuS3Z4UjRDM2NQaDdmRW9B?=
 =?utf-8?B?RTZvRkkzbTBjUk1rVVY0TjdvVVZwSnpURjF5MHl1YlE2NzBzNjZzWjBNRzdK?=
 =?utf-8?B?anVtN2Fjc1c5akVrSG1NS0RpdENyZDJ4M0dRcDhCVm9UbTViUDg1YnFBQmxN?=
 =?utf-8?B?VHV6TjlDSE10TEd3N0FqWWpwbFRGOWxNaGVhd3BEdUpHRVZQQmdOSFd0a1or?=
 =?utf-8?B?QUVVNWhlVDZVNVlaVitpM3BBTjlCekFqa1hjM0ZWZCtJcjVLQW5pSG9ncDdN?=
 =?utf-8?B?U3BsY0JQbm5CL3FUVEx3MnRBZDlrc3RuaUlKdG1qSVZvSm9JbmJoOFlQWEhH?=
 =?utf-8?B?SGQrMDV5SWNNVENydkNJSmUzeFUvdklpNVA3enZzMUNIZGRKWGZyZW51L3hN?=
 =?utf-8?B?TXpWY2lKdWdpa1NvTFBsUXk0UVZNOTVYUEZvV3BKQ2poU1hOZ0JZRkNNSG4z?=
 =?utf-8?B?WmI0S3pUbGpFOWppY2RkY25Rc1pITWlacW1ldE16K3RoWWNkN1c0eUdmN3I5?=
 =?utf-8?B?ZDNZeU9GVFFldlVlMDVtaDNZOHBVbEljdjFaWFNhS29najFUbzdvVk5SWEhm?=
 =?utf-8?B?amxOd0lGSWF1eUdpVnhRUU5ZbFhXRXpvNld5WlJZMThCL2l0QVRmTFkyYit0?=
 =?utf-8?B?ZlJnSzZyZ3IwN3hhRzRFWFk2SmZBTXYxUnhhcmpOdElaYm1pcTNBYy8reC91?=
 =?utf-8?B?TnFsTDhxNVM4cWZwbEQ5UUQvUGxqT2RPNWZXOURjQWRrZUlOMElPTnByNjJp?=
 =?utf-8?B?TTRuaXpyeGdMRTFpZjlOcEJZSEJMWS9kaGdycHlXNmxnTnNhWll2b0hRU09Q?=
 =?utf-8?B?YXZRd1hQd09zajRCOElTQ0xneXJzQS8rNFNXZFlhT1dSN0hTeHdtZnkyMGY4?=
 =?utf-8?B?UHh0R05WQlVSa0R0eWQrTUd0bE9IeHI2cWQ0K3NJSjh5RHFZb3d5UTdrcWpO?=
 =?utf-8?B?SzVUZVAxc1E5RWpIblVKRjNiSWc1Q3A5eXFreS9ibzdSVkxxVEltUnRnMDBE?=
 =?utf-8?B?RVQ5ZWVYMUxMSE8wa2hEVjJ5ZnRYMzZ1UEl5NE5oM2hzcUFZSGJIT0VUNnpC?=
 =?utf-8?B?SmpUYk00M0NnSW1CcUtheGFqS0V6cXhNZ29UR245YUtMOHhGbGwvZnpPM3p4?=
 =?utf-8?B?a3pmaGlQK2FyaFpycW5KR1poV09uaDlIQTJ0OVlhT0lBc1RISHRLR1FaYUZ0?=
 =?utf-8?B?OWNXK2hFNEpJT1NiOEVVQTR5L29FU2NBT21sd20xMlZRWXVGaFdXdDJJNkFh?=
 =?utf-8?B?Vk5UU3pxU3pDQWJRazZ0SlM1VXc1cElhQTF4VHJtdkFVdGJUUHFEUmtDWlNG?=
 =?utf-8?B?elJYSWtjcEJFVkdpRm1ycDhSWHdWRm5nSWNMUDB1eTU0NTJaRXd4eG05UGMr?=
 =?utf-8?B?R2pvRHI3ZmhUOFEvRk5ZRVZzVHpnT1NJQlRVc3ZmWnpQa214WE1wdVUwTGJo?=
 =?utf-8?Q?PaIExSSF/7oXxlYDuUmbUCgZ5tVsCpffuyl2s=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA91488A276A5049A51C1C3BB4C00E62@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5789
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0ca06118-6f13-4832-e42d-08dcd3527b70
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|35042699022|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eUJ3Q0lqM09RcGZXWWl6enRkUGRBbWh0NEZ4NU1rdkJxM3FSSG9SNlJPNnBo?=
 =?utf-8?B?Wk9GTnBRU3VSQkR3VkVHb0tWNTNYV1hGelFYeGcwNFdWMFpWQnV1alFWbG5y?=
 =?utf-8?B?aW9PWmJ6NUJkdzhieGhUZzdvbEl0QVBHWjl1TWMwTXFzeHNkMDdwejkwZGFF?=
 =?utf-8?B?Qko3d3dNWSttRzFyWkZvSlhrdDVZdFplL3lLQzdoYmRDWldzakpNYUltL0M0?=
 =?utf-8?B?ZGdtcTlVNGx1aDFqUTdVVkRwOXJKT1RYRlpFN1FaZHgxWTRzV3hWWEI4dVR5?=
 =?utf-8?B?bDZ0aXBaTDcxSEthRDJyL3o0WWNBdEZMTG44ZTNGTmQwZUxWNTVVTlBHcTZ6?=
 =?utf-8?B?bkhOM2hmZG9RT25YaU1rQktWb293STBrakNzSHo3OStoWlE2SzllTHltdWU1?=
 =?utf-8?B?cjAzOGpmbm4ra0FXRDB4RTF3ZldENlB5cHhNZHFsdnJ2dVluRWFaTVEwVzV0?=
 =?utf-8?B?cjUrRlRLSjM3azlocHBXK0VuUzYzdHF3YmJGNlJjYUNVdFNWanlScmhmUWpT?=
 =?utf-8?B?bFRYQ1h1Ykd5NEpEb0NqaEpLUVhxaS9VZGUvbVg1SjlURmc4TlQzbGtsRm41?=
 =?utf-8?B?cFFoVU5jTTF4NHJvN1UrYkhtOVVtdVlTUFZySTdXaHdwczdncWNRTmdCbS8z?=
 =?utf-8?B?U204QjZiQk53VmhzbXVvTmVpTE5INzU1OXlpY2JjdVlOL1lEcWQvNkNQeXNn?=
 =?utf-8?B?QXBndGhTWTFLUW43WkJkZk9pRTkxcGdlUUg0akhHL0ttbVNFdDg3alR4SmEw?=
 =?utf-8?B?dmgraHV1K245RC9vRmNxUG8yeDZiS3ZuUlpmNk4vS1FRbUk0MFlYTE9GWjdQ?=
 =?utf-8?B?S2RkckpQclFwUFBzeGwreVpSZUJmN2JKRS82L0tUR01qS0ZNNTlkY3FLNzFO?=
 =?utf-8?B?ay9mTWVSNnBvQXRMWWJBNlZWZW5jL0xPUkR4Ykg4M0c1ZkhlK2x2WmM2MGM3?=
 =?utf-8?B?YkI4RVN0YUg4SDVDd3E1YzV0dzE2ckh2eXVKbEZWcFc0U3hkbXhMa29SM2VG?=
 =?utf-8?B?b21nRVVoL3dwaVlYdGtvaGo0YmFZbHNQRWlvN2RUUEhjRTJETVVtYW44Z1RL?=
 =?utf-8?B?R2dqWUZxc3dKTllTUi9xWGUxZmZ3RU0xNUY4LzdEbE9lTlFIa25ZL0Vrc0Uy?=
 =?utf-8?B?TDVvelRvQ3NsYTh1YkhoNEVqY1VrU3RoOHlTdWluRTAzMDNQTVE2QVBua0dM?=
 =?utf-8?B?d0ZBL3FjSVAzZ3huWDVWbk5LWFcxNUpDYnN2ZGZjcmI4OFVBdDdrSzk4aVJE?=
 =?utf-8?B?Rm1OTW1tSGRSYUo4ODFsdVcvdXNSOGVDSVQvTitrSDR6KzhwUEMwai9xdWxB?=
 =?utf-8?B?K3ZMSm5zS0FsTWdPSTVQTmhFcjNWcHc1eW5hZGxVVENGcFQ5MXJXWURCeWxv?=
 =?utf-8?B?UWdKbmFRTk5OeUdGZXc5a1RRTCtYQklSRnh5REx3MEZxZ1ppcnFocGM3VmV0?=
 =?utf-8?B?REpjVzhQZXoySjJnRUd3a3FpZ2pGNkgwREhFd0loQnN0TmFENjVyTzhWUHdU?=
 =?utf-8?B?a2hQYXc1RWp5UktEMlBaZ0l1M3VSVVJFaFhGVUIyR2FycHYzOGJHVXkrbFlK?=
 =?utf-8?B?TnJoRHc2dko4TWRBMWhldDVlL2lSZUJYOHhnYkFPNWZCd3U4SENkT0w1Wkd2?=
 =?utf-8?B?RFhyWWcwZ280UHN3SWNtWGF6a2NNRjJRSDRWcWRKVlV0a0FRd1VaTm5mam1j?=
 =?utf-8?B?U0lyMytBY285SjRCL2hYclE4SUtXbWo3OW9QSUpwVWxmQVQrZzZCMVlGUW04?=
 =?utf-8?B?aThQWHpSWXplT3VxK2Y2VWprbXMxZDYvWXg0SDNzZyt2dERDUjZNYVZZaHd1?=
 =?utf-8?B?MEd2bWF1ZGpZK2N3bEZEQXJwcTNwVlVNbFIxK2ovb3RXWkRXYTF6TkM3TGxD?=
 =?utf-8?Q?MS2en3jyt0WRw?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 17:44:07.8637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f6ff8e-894e-4da2-636e-08dcd35280ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7780
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 17:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204459

SGkgRGl2eWEsDQoNCj4gT24gMTIgU2VwIDIwMjQsIGF0IDE2OjIyLCBSaWNoYXJkIFB1cmRpZSB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8cmljaGFyZC5wdXJkaWU9bGludXhmb3VuZGF0aW9u
Lm9yZ0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gVW5mb3J0dW5hdGVseSAiMDAw
MS10ZXN0X3JlYWRsaW5lLXNraXAtbGltaXRlZC1oaXN0b3J5LXRlc3QucGF0Y2giIGlzIHN0aWxs
IG5lZWRlZCBhcyBpdCBmYWlsZWQgaW4gdGVzdGluZzoNCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxk
ZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvODEvYnVpbGRzLzY5ODUvc3Rl
cHMvMTIvbG9ncy9zdGRpbw0KPiANCj4gQ291bGQgeW91IHJlYmFzZSB0aGF0IHBhdGNoIGFuZCBy
ZXNlbmQgd2l0aCBpdCBpbmNsdWRlZCBwbGVhc2U/DQoNCldl4oCZZCByZWFsbHkgbGlrZSB0aGlz
IHRvIGJlIHBhcnQgb2YgdGhlIG5leHQgcmVsZWFzZSB3aGljaCBpcyBzY2hlZHVsZWQgdG8gYmUg
YnVpbHQgYXNhcCAobGlrZSwgTW9uZGF5KSwgc28gc2VuZGluZyB0aGlzIHJldmlzZWQgcGF0Y2gg
cHJvbXB0bHkgd291bGQgYmUgX211Y2hfIGFwcHJlY2lhdGVkLg0KDQpDaGVlcnMsDQpSb3Nz

