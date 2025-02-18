Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C450C021AD
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 12:37:11 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.40])
 by mx.groups.io with SMTP id smtpd.web10.18395.1739882226513951409
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 04:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=natCYZx5;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=natCYZx5;
 spf=pass (domain: arm.com, ip: 52.101.70.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=O0XF/anVFmK30cNUAPPQWYi1guqFkaQumpjFBma71Tc42qS74LsdVqtMgm0TygZ2QtFF/lRCBAi2SG1DfCj279ZpV6M4f+wT4b8uYTtsdCycQ3keRLoD02gyNE53gVPlpd8N6RSbEbVOnoE5nmjqBrkOKVCCi/UF6BAkEr3Vi1CUtvZIYrgQr3SNeEkn+4rCqFg+hl17YAARhZVZrZDGWyhj27c8G8mrOw6YVwi+vBnvez77ODIYxwKa93SvU4j3FhbtV9abKWEjiWyBv61sAM6KFOufjfw1KfH7BNpyNKPhvWHDWCbd/2E0i4ZSv4DdkblBaV8cPA3Vj1AFL0oO7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDwluMY0EyfGWarLRhQOazJ0Wxq4C5E0QCGGJEfrAow=;
 b=L0cuijelXhORq9DQ9cyduI8YE+5SNZQoB3ISyyVxpkcJulzS0dndwzMJ1LzCXquukkaEwLv1XOXApn6WJ1xha5TwJ8yIOoJO5TdtdL1lITjl5KDDdL0kkFAoCr3HMPvqdr5YGLoU2LXRV8ERTncGSNz3oQfK2atEhFjd+dlzDcPL1udkmlLFSKMjiJuFQe9oXbvBLk5GkTAGcVpmX5avvAMJwsPmVfpqSWM3Fyo5RHR+y15rWLqrL+aei2HAcV84TO8Zta2wWxFi5r6tpSMHd9U1Y6hvSnElaiqQ9oVx+KX0AsInkaHJ2C8BdVKEZ1AwRlLJnU6F6cjxqmghJLB7Ww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDwluMY0EyfGWarLRhQOazJ0Wxq4C5E0QCGGJEfrAow=;
 b=natCYZx5xaIlHGUp7UeyTfu+vLc4D++yky8Hk/AFP5pf5DgTSfW9Ws3Cl2HWWDDFx3Fa41dboFWnvTOsyMx0N0xfXK1IG7xoahDSzJEzrPztgJH5EV2gqTVvJ8NpNzXasJr0a5vAlJ6HUtBnve7ZWF1OijDFFEQ6y2pkegC8rGE=
Received: from DU7P189CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::7) by
 AS4PR08MB7507.eurprd08.prod.outlook.com (2603:10a6:20b:4fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Tue, 18 Feb
 2025 12:37:02 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:552:cafe::df) by DU7P189CA0002.outlook.office365.com
 (2603:10a6:10:552::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.14 via Frontend Transport; Tue,
 18 Feb 2025 12:37:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11 via
 Frontend Transport; Tue, 18 Feb 2025 12:37:02 +0000
Received: ("Tessian outbound 31e949b9df6b:v567"); Tue, 18 Feb 2025 12:37:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6556248aae496ba8
X-TessianGatewayMetadata: SI8FEBeIhGdQNn7udFR0nXTN6pJqP0AZoGjtgv8IckLbyD6KcX3kM1Tk1N3CSNgIg5DS8//jgm76EYcV2QFcjHGBjmE1vvLDgSrTryHPhrcg/UkNU3NqlOBfuqK+DLeDl/UWn8szE9cN3X+kWCN4g2t1GeTR7W3H2UlcvZvnLfo=
X-CR-MTA-TID: 64aa7808
Received: from La1702b6c8542.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 593EA6BE-4001-4DEE-A4A8-021AD3A0EB90.1;
	Tue, 18 Feb 2025 12:36:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id La1702b6c8542.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 18 Feb 2025 12:36:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sluiVGndhKXYYOS6is6WGTjeMRIaLp+hUgnf9EbNy0FUgu788M1JYK190RX07cPERjUJDSY2P4P72gMo/MAUPkNm1DnOhSQMr+PE9S1j9aaHzdL6ij3rjDRpMOYr1aWATMkYzTUu1/FPaGUcspOhKYE8z9PzvbgNcIop9Xfh7Y8yPd2GXUbrJ+5O/Pwc6Plkbxel1WQXVGsvA70mTRmZbgC2wZi8N3612tloBhUoc5XMKbZ7ply0rSEfaFwfhy01Yc/KpUZ56uuiVxQLkrS+q/JxFaaT5/voiFh2ni6uEqf76KENqiBHHbCVA784UKwqyH8A1ys+aMHRMTbxp7voKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDwluMY0EyfGWarLRhQOazJ0Wxq4C5E0QCGGJEfrAow=;
 b=O8ZklW6tRs5fg3rHS8CFhO6LvAyihdBiJDvNKvjiQpOMyV228zqGljzH+X4tSlWKEnXb7eCbWLEuZwm1pBBQnZ2o5+7aRqLo5F64cEGy8t7HH1IjzMNkfcBHt9Gk+7frNlGuXR8CygxbJSfG4yoKBmTbQLMfhMOw8UCh1B+DXIN/CHD6keIn7vc4bcMUIeqikTCpawxZ0D22Asmb2nJOpaxTVT0ZBhkiIz0u1Dbyc8Fk28SSWzyeApktqPVS8m86oTw25gUAzcUYFN/1lHXNia8i+1KzKP4IoBbiDXJp47Vdg73skZVBrSIb5YJL1miYaLlQ7vY8g71wVKwcKe1/EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDwluMY0EyfGWarLRhQOazJ0Wxq4C5E0QCGGJEfrAow=;
 b=natCYZx5xaIlHGUp7UeyTfu+vLc4D++yky8Hk/AFP5pf5DgTSfW9Ws3Cl2HWWDDFx3Fa41dboFWnvTOsyMx0N0xfXK1IG7xoahDSzJEzrPztgJH5EV2gqTVvJ8NpNzXasJr0a5vAlJ6HUtBnve7ZWF1OijDFFEQ6y2pkegC8rGE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB11019.eurprd08.prod.outlook.com (2603:10a6:800:255::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Tue, 18 Feb
 2025 12:36:53 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.8445.015; Tue, 18 Feb 2025
 12:36:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "simone.p.weiss@posteo.com" <simone.p.weiss@posteo.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] libadwaita: upgrade 1.6.2 -> 1.6.4
Thread-Topic: [OE-core] [PATCH 2/2] libadwaita: upgrade 1.6.2 -> 1.6.4
Thread-Index: AQHbdpMJM7DWEjqQvUuY7+WzHOKTnrNM+gQAgAAcWgA=
Date: Tue, 18 Feb 2025 12:36:51 +0000
Message-ID: <FC7FCC57-2CDB-4326-AA2A-6CA9D1F759AC@arm.com>
References: <20250203232543.830904-1-simone.p.weiss@posteo.com>
 <20250203232543.830904-2-simone.p.weiss@posteo.com>
 <58620CB3-87CE-4DE8-94F2-13BB9B759D04@arm.com>
In-Reply-To: <58620CB3-87CE-4DE8-94F2-13BB9B759D04@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB11019:EE_|DU6PEPF00009529:EE_|AS4PR08MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5c3543-cb9f-4c92-263d-08dd5018f1ec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VWxBRDlQS0NpOFAzMm54OS9rVnpSMXFFNTBrNGlPWXZNTHNCOWJ5RUVWYkFI?=
 =?utf-8?B?Y1d2VTdQemJlcjJtdFgvZkpnbURaeGU3c2x1UHFKQlhqVUVnd3R2VVY2ekg0?=
 =?utf-8?B?NzFEYm1YcmNFTzdJNU8xc1V5NXc1MUtmWjcrY3Y5OWg0VnZIVjJ4QXZrRkNx?=
 =?utf-8?B?WUJsanNKM1lQdTdnMXpTK3BIdDB5cnRmY2oxQUZkNGlqa1pUV2MxSU51cEdm?=
 =?utf-8?B?VFRjRmdZMHNjZkZOTU9GYU1BVjU3UE1IbkpWVmFaWXAvT0JWN3RwMU8xY2Rq?=
 =?utf-8?B?Z2x5L2pKTmJHZDJEeXRuSUx2S2JHdjVqOGg0NnpTSWNTb1RSUXZlc3BsMzBu?=
 =?utf-8?B?SzJSc005VUZXaFZXTGlYT0w5RUk2aENsTVpqbHdiT2JzY1pOSWZ2U1h4Vi9j?=
 =?utf-8?B?NVY0TUVVRk9mTFFyYmhMclBEa2dKT2JTSnVIQVhzY0Z0bGErYStzNGlCQ0RH?=
 =?utf-8?B?RCswOGhZYm1MTmJDOUpuYm0wdFBOd0tTVnpVZ2hmb1JUZWpsNVNoS0wyV3l4?=
 =?utf-8?B?WXVMSW9PS0Fqd05id3ovNFdvS2srWFVKb1hWOWtSU2UxTVg2Y1Qrb3JoUTBj?=
 =?utf-8?B?UmFCL0VTejZqbTZaSHM0cHhBTktpVnh0Ulk5bFFRK1E2dVZab3czanRITE5N?=
 =?utf-8?B?UUloZVZQeHA5R3BNZDFwc0tOZng2Sm1YRUt1K3FycmZxaUFyN2trVGxoQVhw?=
 =?utf-8?B?NDBTL3d5WlNZeVNQZ0w4dFplRm12M20rdGdwOURDekxaa2ExVjVnLzM5MlRM?=
 =?utf-8?B?VnVuLzdVemN3TFpXZkNWUjJ0alVOMlk2cTZ4eUV4L1Z1QTZRTnI3ZlhnT2ww?=
 =?utf-8?B?bWxhcVIxQW9LUlJDZDYrTlJ0YTVNbG9nKzVSRkl0UFMwVmlDZFJLUlQwTml6?=
 =?utf-8?B?SmREYjhXczN0dU9tTVEydTN2N2NjOXZKbXNhaDBCU1FEQmhzU2Y1SDBYbWla?=
 =?utf-8?B?bzRwK044M2FBczU2dEJPakxzTkh5OSs2YUliSUZCeW54bERJTk44VnhJQkVK?=
 =?utf-8?B?TVVlZ3BtTXFYOHh3WUgraGQ3WGZIcytTb2UwRE1KaWNhZ2kvdHVPTXFEQktS?=
 =?utf-8?B?RUQ4aHZKTm1YcHFjL09UejAwU3ppVE1KeGZ1U1ZLTzZRQXVsUXVuQVYyTGY2?=
 =?utf-8?B?NURZWkcvYU5iL1VWcHgyNmtxemtBT3NHWWRBOHYwS1hJRmNZM21qc0xpRXVD?=
 =?utf-8?B?bStMUTZjam5CR2pHbm5SZ0dmN085SDdrSHg5RWx0Mk1TaDdKN3ZrYmdlL01N?=
 =?utf-8?B?UG9Td0hIL0hzSCtBRWVkcFVPU3NBb2oxOTlyOHRpR29rRE0wNFZ2VkF1a1I1?=
 =?utf-8?B?OXo1RjAzOUxKN3drKytxRTFtbUZoeXRmYjNnTnhpOUdGN2RzVzc2VFdFVUJm?=
 =?utf-8?B?TUxEV09zSkVwckhSeTFRYmpGMzA4UlpCMVZGNTNrY2oycHlkV3pFdlRYV1Fv?=
 =?utf-8?B?ZmZ6Q1lhdUtwM3hkMXk3bG1yZDdMMWdGWDh2NzYxOGlMellRNmxsR0VmK1Mr?=
 =?utf-8?B?eFlVTjdEb2YySGo4bXFmSEdUcXNyZnpaS0MwbXUvWERuR3psajlobnRzUTAy?=
 =?utf-8?B?Z0NZU2xDRDNnOEdISEdDLzc5d2N1eUcvOU1SRGE2ZlBQY3dkSnRVR0laYStV?=
 =?utf-8?B?VjlqekxRNkdsM00zRkJ4M1QzdWFPVmRkekdGQTRBbHNvOHJjcUJIVGtmMUR3?=
 =?utf-8?B?Zi9OTEZ2aUNCUGJ3ejhiaGZsNUlTU3g2Y2pvamVkdFkrU3F1SlF6b0dTNlpY?=
 =?utf-8?B?am9sMlJpUmtiVTRKQzhMekpMVFQrMEl1R3hHdFNGRGtaVTNvNkttMlEwb2xz?=
 =?utf-8?B?aWZ2MWQzMVJpZ0RwYm43Rnp1S04wNHE4bVNYN2NUbGtQVklkaXpham54eXZ0?=
 =?utf-8?B?SHhDWWRDOThXTEJKSUcrdHZLeUZZcWJPUklFbzZDVkF0QytkY3d1MVBVMnFj?=
 =?utf-8?Q?qSV8Xm2fgNgYJYphFyQPjYAhjOEP9rsK?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3530099687823B44B788C5AAA82857B7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11019
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4b3f7510-26a7-4c25-d44e-08dd5018eb5f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|1800799024|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TjlITHlFS2VTeGxZUGt5c3VMRWZKT3V1azhsNmhneHJiZ3RZNEorSFA2NDdC?=
 =?utf-8?B?ZEhudERqZlpxei9rdFIrUHdiZmRDaUpqalNySG9Pc2ZoUEp4azVRT2N0dnJG?=
 =?utf-8?B?MmdPRWdhOXgxU2VJODZhVlN1bmNqUzFQL0Z6VzJQbHVlUDBsKy9DbXRFRGpL?=
 =?utf-8?B?aWlCQmF2VVBTYTJSUnA5SzlyUGRnVnFBWjBrWWZ4dEhRN3hlQk95NHlyeWtD?=
 =?utf-8?B?OVJMRXBIU2N1dWxMRDlWekxUNXJtd3pZRW5lUFVla1UyaEsxWmtPNm9KOGk2?=
 =?utf-8?B?ZnRXSEJrdEFiTkVDTEJzVHJWZGhOVE13YndBalpBTkQrc2x4YytqWVZJbEtp?=
 =?utf-8?B?K1B1RU16dS9wQlJrSkNtVE5Teno2RGI0N2RzZzY3bGJ6WDJqY3orcWZRZCtD?=
 =?utf-8?B?VVVqUVVNQVUvM0o2ZW1CbU9XQUR4OUZkcnhzR1plTnFFdzVFRW1QSGNPZlRy?=
 =?utf-8?B?ODVmYWF6SDljQWZ3czdKWStPWFp5cGgxN2psTi9PU1VQVjlRaGdKRFUrK24w?=
 =?utf-8?B?MVJqYkt0YWNtRVYxREFnV1hMSkx3NU1xVGJSc290bVR0eTg3UWtxRmQ2cHA5?=
 =?utf-8?B?Ris2ZStqc2Y3K3kxK3JiaWU2Q1Z0ZDVleWZabkQrN0lUd25iYUVCU2VQdGFl?=
 =?utf-8?B?a0JSSUxjY1d6S09rL0RqUlZvb0hLbjJVdXlYNis2K1ZxRm4yVDRRRlduNnB3?=
 =?utf-8?B?TUpMMkRzUm1ocmJEeHNyMVNRbkl3dEhsL1BTSzdubGY1cGNDWkFSTm1MOVQr?=
 =?utf-8?B?RmgzWHlCVGcxZHV6dmEwVHR4T2pWb3R3UmxFR0d4RWhOaWRkTDhXTnNhSHdM?=
 =?utf-8?B?b2ZJM3hXb3VSMmhYdmRQNG9VcitUazlRY2JLN3NiQ2h1R1JlWFBVQy95VEU3?=
 =?utf-8?B?QmpFQTVXRisxaHNVaUJFTjFZaEN2R25Icy9IK0hGU3hQYnhhd2RlUVc1bUtI?=
 =?utf-8?B?dEIrRjNhUFM2QkE4S04vcGRuWG9TU0Y3N1VMOGZ2andWanlNNnQ2eWJiK1Yy?=
 =?utf-8?B?bjlJczNvVUVEbnBOZ1VvZklQWTJNNnZDYjBod1ZuRzNyMVIwTUJEQlRhNFB1?=
 =?utf-8?B?amxTODFyY0JkalFIZ1pUZWFGRUhWeGQ1MFQrSlg5cjZBL1d0eFcrNGI1RmY1?=
 =?utf-8?B?YUNJTGZaYkZwdXV2djVKRzd3bWxaTXJaSU1DcmRsTU5jWFJENDdNcnJvdk9Q?=
 =?utf-8?B?bFl3UkdHWWk3ei9UUUtzdUxEbHltTllWb2YzcVc5RnpoajFyM3RDdjJEWXFG?=
 =?utf-8?B?VGdhZzYyZVJhc1MrNmpzVXhiUEUwb2pBVlZkWTVsekU0YXpQeWdUVXZoOW1i?=
 =?utf-8?B?MStUVXJQclhYTG1LY1dPL29hZUZEV0hVajhJb0lSWnF4VGFFZHJRVkN5QzZn?=
 =?utf-8?B?elpuS0RsbnAwMXVsUkNtU0l3VEZlM0ZRVWZmcjdITVgyOFdJQXNjWXBEbHRm?=
 =?utf-8?B?ZnVoa1ZkR0MxOXZMcXNXZTVqc000a0VpSWg5eFRKYUErZE96Wmt1d2ltd0RH?=
 =?utf-8?B?WlBQVUhEQTlNT1Y2bGYrcG42QnllTWhjaWtuLzIxbGdVMjRvOWQ4S2xNSkZm?=
 =?utf-8?B?VHhiYXlqWThmL1lKaTd4ZWlvSHhFUEt3K0pFemJRa21XU2huSFdKYzl6VHNx?=
 =?utf-8?B?eW01SFBJY3Z1K1pnbTA5YzRGTjU5UkVSOTR0d1ROUzZGOHp6QTJUZUNZTlZL?=
 =?utf-8?B?OTM1YWRncTNhYUZkZEpaalpnRzhQaCs4alQxakttamZtWmtzVXlhcVB6Z1NN?=
 =?utf-8?B?L3MzTVZ1TG8rNDhuN0Q5ZDV6N2hCVzlXM1N0T1M2RzdiMHRrbkh3ZDJYUmt3?=
 =?utf-8?B?eGdqSXhYZUpTMEV0bm9PTDZlaHFyamNHVXJzci9YUnozLzJSOHJrVjNEVDBs?=
 =?utf-8?B?T01mZFhSbTEzMUYrVm9UNEdMbmpGUExacnZqYk90SFJQamVXbGlmZHcxMERP?=
 =?utf-8?B?b2NwT3hMOWZZTW1xWGp3QzJHdkVKbWtLM3c1c2c3cHRXVmZZQnlILzRFTk5C?=
 =?utf-8?Q?6hvXs9JBpvkOLjCkmAiH8GBIwbB91s=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 12:37:02.4700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5c3543-cb9f-4c92-263d-08dd5018f1ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7507
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 12:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211610

T24gMTggRmViIDIwMjUsIGF0IDEwOjU1LCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gDQo+IE9uIDMgRmViIDIwMjUsIGF0IDIzOjI1LCBTaW1vbmUgV2Vpw58gdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPHNpbW9uZS5wLndlaXNzPXBvc3Rlby5jb21AbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gd3JvdGU6DQo+PiANCj4+IEZyb206IFNpbW9uZSBXZWnDnyA8c2ltb25lLnAu
d2Vpc3NAcG9zdGVvLmNvbT4NCj4+IA0KPj4gQWRkIHNhc3NjLW5hdGl2ZSBhcyBpbiBsaWJhZHdh
aXRhIHRoZSBoYW5kbGluZyB3cnQgdG8gcHJlIGJ1aWxkIGFydGlmYWN0cw0KPj4gY2hhbmdlZCBh
bmQgc2Fzc2MgaXMgbm93IG5lZWRlZC4NCj4gDQo+IFRoaXMgc2VlbWVkIG9kZCB0byBtZSwgYW5k
IEkganVzdCBzdWNjZXNzZnVsbHkgZGlkIGEgYnVpbGQgb2YgMS42LjQgd2l0aG91dCBzYXNzYyBw
cmVzZW50LiAgICBXaGF0IHdhcyBjYXVzaW5nIGl0IHRvIGJlIG5lZWRlZCBmb3IgeW91Pw0KDQpJ
Z25vcmUgdGhpcywgbXkgdGVzdCB3YXMgZmxhd2VkLg0KDQpSb3Nz

