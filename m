Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3C4C02193
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 17:34:29 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.56])
 by mx.groups.io with SMTP id smtpd.web11.122346.1738690458471572062
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 09:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hde1oR1I;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hde1oR1I;
 spf=pass (domain: arm.com, ip: 40.107.20.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=m5XdRVODqn9QWSTGkcF2ICO1v/iYhnIp8oGFf54uXoHErsdcG2EpDPfLR83R56SwVUuGRbh0yVgltwIE2oZAq7Fxd8jfFH2EwpA5bH0xB491WDiF/SCuBWxLDhGZeGBVZd/UPgdvnPDaMj3FpvH3kkmwY05R3//q8F1w70bBSO6g78f/QiZL/2Z4nJtHKJfvVTXaSGmOqgaLXyUkf9fxWM0AIm1YGR8Zstt2YEBzQ3yZMK6aoxd7bazKfdLJFEHw1OYIEuLNWr+hYyuaIZRaoLqVoZa6g2qCIsXev2p0hFOtN6b0lCVRlY1b8XIpPKd5NULmKb7A6g5DRZu/Vq2V6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzxLdaaRimhlsXxbAFK6WYpkRboMT0U0/MDZdGfilBI=;
 b=VoGOil0pwphz7MoDJxbAX/rCl8cp8yZck+kZVTZdmzfnty98TFS9gBECQZJR33vA9Rm1ONc2K01UrjYd3dUQGQp3F1/cjltSOm7aNmuP6OEEF2x5NDLn8wxCjWvj14Pj6nPhJK0wEDBL/0PuR+RFdAL+CudKm2Z9tjumtfjY/KKQlVLBEZp9PtByDS8o6gPRsDIiFb/BnN4pBLlSCr3EA+hX53e14SJdcm1InFjOuW1wDIMls+E86ch/+k+Kixc1AqHlO11iqs/c+WOk8Is5lXXnksx9fIpGRDC/sQ6YI30UDEmCYQLDi4m4rR9+ojkXuYK+6j7LxHrZnGJthTkV0g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzxLdaaRimhlsXxbAFK6WYpkRboMT0U0/MDZdGfilBI=;
 b=hde1oR1In8SG0fjBGNWXSLOZw0Nl8cqZYz1pf2F8nyPk5RK6RJgMi3y0R+f/vq1jN1h79UWNK7UL3tXCMMNZ2F8Ou4jSV8aqIlBcWJaSt+VXe04HJpBQOPwMMnHey+eMagdOzXDzEr+qPuajcvTCgQgnzeIZZVPoeLXfokFqpKY=
Received: from DBBPR09CA0018.eurprd09.prod.outlook.com (2603:10a6:10:c0::30)
 by GVXPR08MB11096.eurprd08.prod.outlook.com (2603:10a6:150:1ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 17:34:14 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:c0:cafe::46) by DBBPR09CA0018.outlook.office365.com
 (2603:10a6:10:c0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.26 via Frontend Transport; Tue,
 4 Feb 2025 17:34:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Tue, 4 Feb 2025 17:34:12 +0000
Received: ("Tessian outbound cd7bee7c735c:v560"); Tue, 04 Feb 2025 17:34:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f1b5ad66dd4b244e
X-TessianGatewayMetadata: pfgVt0z64m68yp0rISGdmms/Mw5CAAXSsbLaBcPLRjOkvwiSZ3aa0+r1mLRJ5bC5z3/YeWhlGbo6qXXZMZvGgGr4fdIbK5QNvykRdD1fdeAH023S0BAhFclkMwFkUEF/t/szs4gVXUiGDll7lqb7Qt0iia1pS3bVzS094WKi9zw=
X-CR-MTA-TID: 64aa7808
Received: from L749f5d3bc8d2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 87E41FC6-B428-45BD-9548-AECA9D57E95C.1;
	Tue, 04 Feb 2025 17:34:05 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L749f5d3bc8d2.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 04 Feb 2025 17:34:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdntRGFP+bwrhcpUDzS5f3UOWR2JbvXwOnQsl9nHKzHL0tmyGrwXOKqZNychjk8Aoya0wv7t6R7VbQ1j4dAgx6bcs6xx0+DkIgG0jSBD9C2PD2PKn0zc+O3hFqbZg2UVl8X3Nxq9rrCutYa0JMnJFgA+iSmLCSzwMXprUvFDASXSdX4+KHLh2LjYouNIX9/ivgIf8KY6MbM0xvZeWoRnf3t89nybkOjrp9TTQ1nJOOdaD0o3FEUHN3Z4cDhwfvXJAWPIRdg/Qxwbpw6JaaGX/oOsQwRoCFxsGVlULaSJ5we9OQn66oJFxejSWrDiKNdSfJr3ywtSwIsbcI2woNmrKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzxLdaaRimhlsXxbAFK6WYpkRboMT0U0/MDZdGfilBI=;
 b=MMnmyj49Nhij+NEm6KwazihqCEosah0yMPFmk0nLLyUY5s6dhI7qwlPSNuLsG//pZKwzus76XgRZ2NMmUFspPA9NlX5ZRtxwMZRMTslm4ITNOGQMAuHJfpggO+ORriUniUMrIF5xYuYHDrnJQUH6ro/MIjMUDWOx9Cj0xnw4ey05zqgyL+auLe7eOSR52Vrl+3KIPvZ2jJ6qHdqdnCQyJK0vyz5zXmsWdJhDc718flVZzdPIX4Wdg4iNpF/WdrgklIFpoJqbkLbdT4523xc9j6m78O8J2vQk6qY+ff33i26neG3z+pJQEka+ykKjlLTLLvO/SZTMrg9ssu8ag5dWXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzxLdaaRimhlsXxbAFK6WYpkRboMT0U0/MDZdGfilBI=;
 b=hde1oR1In8SG0fjBGNWXSLOZw0Nl8cqZYz1pf2F8nyPk5RK6RJgMi3y0R+f/vq1jN1h79UWNK7UL3tXCMMNZ2F8Ou4jSV8aqIlBcWJaSt+VXe04HJpBQOPwMMnHey+eMagdOzXDzEr+qPuajcvTCgQgnzeIZZVPoeLXfokFqpKY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5574.eurprd08.prod.outlook.com (2603:10a6:10:1ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 17:34:03 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 17:34:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] meson.bbclass: Specify a cross binary for cmake
Thread-Topic: [OE-core] [PATCH] meson.bbclass: Specify a cross binary for
 cmake
Thread-Index: AQHbdx7E+lYOPGVflEiMF6cEQi4yBrM3UuGAgAAFDwCAAA+8AA==
Date: Tue, 4 Feb 2025 17:34:02 +0000
Message-ID: <8E4AAAAA-DC4E-4A76-BA8E-EE82FDE0722F@arm.com>
References: <20250204160609.1646883-1-pkj@axis.com>
 <15230CB2-3678-46F7-B0AD-705DBB8ADB5A@arm.com>
 <DB5PR02MB10213F946EC053FBB8266773CEFF42@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: 
 <DB5PR02MB10213F946EC053FBB8266773CEFF42@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5574:EE_|DB1PEPF00039231:EE_|GVXPR08MB11096:EE_
X-MS-Office365-Filtering-Correlation-Id: 8322a7b5-8ef0-4e46-9389-08dd45422393
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?S0x2Vys2bDlINUphTlovaGc3SVFhclNBM3grSFoxeFJUby9LVmNacjk0ekxO?=
 =?utf-8?B?d0hySmJIVGFuaDJFSzJHRi9VRFlZd2xvckJpUlhTaiszU2U3V01LOE1yV2xD?=
 =?utf-8?B?cXg2RjdodXlwMnhMaHlwcFFsbzRFT0x0ZXByQnZnRnlWeEcxMGlIS2JjUmRr?=
 =?utf-8?B?VVV1ZUd0Q0lxbzVsNXlMRTR4QTYyVnlDbm51K2trMVlibzFva21xcmhRNUJ5?=
 =?utf-8?B?QjZuZTNSRnNNOUxMb1VDRnVTMlFIZ1g1T0ZhZEh0OTFZTUtCRXFncVdRcHBG?=
 =?utf-8?B?b3lhRkFocVRFcWNjOXQwTkZPbEZJdnFrY2dQQjNHQ3hCK05UT0JCZG5PMkJk?=
 =?utf-8?B?ZjdxWGFXQm5uM1hWUzM3dloyRlp1NjhkT0t2S3FPTUFDSklZelN5NFpMNlpn?=
 =?utf-8?B?bVBoajlldmZwQjZnTWJrK05OR3NEbW1scXhQaElaNXFlUlZSb1N0TElYV3ZX?=
 =?utf-8?B?UDk4bXlmeXJhK3ZPSDRIOXFyNWJxOE4yOXVmd3JJb2V6WjRhM2JheHpPeVcx?=
 =?utf-8?B?MGFSRkx2cDhFV1pkL2dtQ2VLNS9qTUxXY3ZXMG95Y1lyNmdienBFYVZMTjcz?=
 =?utf-8?B?TTFya3hyVUJFM04xSzgxUURXMWJGZnoyd25nd3hDa0RWT2NCalloZTNnb0pH?=
 =?utf-8?B?VmxXZkNndk92cVV1SEtuUXdOdjE5NWtBOWlYOWVkMEFWSDhXRCt6QndldVh4?=
 =?utf-8?B?MnNLM1hKM1RWaytNbThqK08rRVB1R25hemI3OEJnd2lJZTl0dElnWDBuWHhX?=
 =?utf-8?B?dXRUQVJGOE1qbmJXWUo3TlJJZmJZTjhvMGY3dHZGOEgxMjIzTzRUZ1RkSjlP?=
 =?utf-8?B?RCtzbjBobi9EcTFMLzJ4TXJrOW1qdXJhNW9OTXo1NlBpRW05VFRQaTFMcFNK?=
 =?utf-8?B?YXFOckVpM0huN1A2VEhSbzNFZmJmMjREdm85bDBJeU5QSXJmQXVuU3R5dDQz?=
 =?utf-8?B?Qit5MzZlRUlTZTVLU0FrWVFnTk5pWENoMVkzRUVDbXhXNWNMa0xJMStkbENP?=
 =?utf-8?B?Y3ZHQWtJNTNXdDdXUnR4dFlDWVNVbWxoQzVadjk4Si96VmtZUnlreS9GVmJk?=
 =?utf-8?B?M0NLRGorZmtwNzNjbE1SUno5aEJjTjJDWGhOU2FOdFIwMlNUeEdGNWtNbXFu?=
 =?utf-8?B?WVhUamFQUFovVzJvVlQyWlcrWjIvQXlnbWVMWEtBKzhWcDVPODNVM2dzMStL?=
 =?utf-8?B?T2xVQVhJRVpSYzc0aWt1VFpLTm9ENk80SXhJVFZSaDdQSnFXSm1NOEp6WG5I?=
 =?utf-8?B?ME5BZXQ2RmRLZC9tQ0ZUYUhuK04vYWQ0ZkVrc28yWjlwMTBIbk1BUlhiSVNN?=
 =?utf-8?B?Z2RaTENRRVI3akU2TWZOSDJSQnhkQVZrYnlTaXoxeWgySkUvQXF5Yk9JeXU3?=
 =?utf-8?B?YkNNVmdZZHp0K1FyQ3hjbmFkVG5rR0ROWkovb2swTW8ySDdUcVVlMUlpdm5n?=
 =?utf-8?B?T0VuSjJ2eUphTnFxNFF3Vm9Qb0l1WHNBNTJSTWNRQTdKbVQ5aEI2UkNjb0M5?=
 =?utf-8?B?WjJ2anlySkVSN0d0cmxNMk90bExySWVYTXhxckkwNk9BbkNKTGZYbEI0UG9B?=
 =?utf-8?B?elNDNCtEMFRRWDZBNVhJRkI1SjNJd2VKU0pvTjRCYTlFRjJYR1BPTEkyUmdK?=
 =?utf-8?B?VWxlQXVoZFJzQlM4NWp3VE1QY0FNNzljUjBxNktCaEpiczA2T3lyejBIRlZD?=
 =?utf-8?B?M3l0Zmt6bHB5TmpZa3VPSjdEeGZsZWdFYnJrN0lXWVpRMVVITFVQVUV4ME5x?=
 =?utf-8?B?UXVLRFhyN09qaWRKQXhsdHdYSHZPM3NHQy93a0FvU210TWxXZ0J4UlZTSWVk?=
 =?utf-8?B?SnMyeUhwZ25TOXF3Y0V1cldST0laWnMwNXpaK2x0bi82aHkxWm9KZmlldVY1?=
 =?utf-8?B?R2hsQTlYRG8xNlZDajl4dmt4NTJPZXBCZkFlMTB4WVNoT3BDM2xxRkJES1JE?=
 =?utf-8?Q?OHZEade/2JQic7T0sj5tj8iivxC9UsdW?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D6D29E85DF95540A50A2D8E05E70821@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5574
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7f1b65c3-e30b-4d83-ad0e-08dd45421ddc
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|376014|35042699022|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dnBGUHRVQ0QyUHNIbjRZSnVzOVVHaHJMTkliVDFmdGMrVk1zdDNjeXdyWXhX?=
 =?utf-8?B?RXZwQ0xvMlB2ZFdOeWlIZ2dwUERhRmM4QTlhRkF0aWx6QzVrUFZxNStKN2la?=
 =?utf-8?B?RldpNWV1eExxWDJuSEFxQ1NERUtyOXdRbzRQUGJHdmxSTWVBSk0xOTNOV05n?=
 =?utf-8?B?c2VtbEIvYlRrd29xM08rSHJmaUptRHRkUWpydGloeU8vUk1NTTdJTndMbmZX?=
 =?utf-8?B?dGhRaTQwa0N4bzluUHRyVXZYSEp3SStQNGYrNzVPWTdkdGdkeWc4MzhoVXNU?=
 =?utf-8?B?dkFnUHBaNndKRVRNNUpPS2RjUmN6WlkwUW1GbWdYUVZZMStFbzl5YXZDMlRJ?=
 =?utf-8?B?SXVob3lWQXp1ZmQybDd5WXBXTG8xUGtGQVBOaVVqazg2T1N6ZEZpTldleWpN?=
 =?utf-8?B?VG90UjNxS0cyM2RzMDBxNHJzRmJZWmF1b2NkV3gvRW1xTkpXMWQ0czhVdVg3?=
 =?utf-8?B?bXAzMjJVY1BNcy8wQW5EMGRtZ0JvVGk0QU1ZbTFqTXh4QzZTSWM1TFg4R0R5?=
 =?utf-8?B?Sm1jcStVbE12a2dRc2dtT2ZNYzhnamtTTU8wZndOUzM2RC9CVTBIWFgwNFFE?=
 =?utf-8?B?NlFLSDhEWVpmRGNtZEJTblhVQlBiT0JwQ1pIemY1UE5xV2RFRDRDSXJiVmJR?=
 =?utf-8?B?TjlnenJKVTBiK2lzVzVFeWlLc0lmVUpSVU5YUlhndVJxWDEyTUMrQ1JLbkF6?=
 =?utf-8?B?NG9YNm9zRmJYaFljM3NLeGFkbmlRamNnSXVzMTJTanY3TS9VNHVrUGRsV0FW?=
 =?utf-8?B?NXUwS0JWSDdpQUlVMlFUMkU0Nm9wNnY2ZjNyZkRvYU10d2VkTXZiNGs2blFC?=
 =?utf-8?B?dWM4ZS93S2Rta01hajRiQ0RocFNlREFBeDJHbGhvaWxRNTFOOE5CVkk5cGM2?=
 =?utf-8?B?ejg3Vld2YVVYeEg0MEZ0TFBxckptdWFKRUM0MWkzWDgrNjZ1Yy92emlrclV3?=
 =?utf-8?B?VTQvSEl5SzNiamxCeGRrcHN5RkFINGp2UHdidERWdHFjeG91SWc2RHJYeEZy?=
 =?utf-8?B?UWk0THNDK2hRVUxGYnJEcjY4dFp3eTJ4MXhoTy9jcjRaNjdGOFg5QmphclVl?=
 =?utf-8?B?bDlnK0Q4NDh4SnQ4dlg5ajh5MlNTWlpCbDlhQzZNcWlnUDUwbzdtREFJQVQy?=
 =?utf-8?B?UVY2bjN5Y2MzbWIyblNzc0lOcTI1Q2k4UEo3ZUpJN2IvM3BpRHowRW01NFV3?=
 =?utf-8?B?bHhRY0FtWVF2UEZIWVgxeGRMNjY1UHNmREd1R0RlWnVmS3BpUUl3cFBXOXpN?=
 =?utf-8?B?UUFSUnZyTlJUTjFyT2ZrUktlSk9yTXRpUVl3Z21ZTnRJL3gvcm5pcndGMHJi?=
 =?utf-8?B?YmxaQVc5YnVvUW9SWWYyQUhEQ28zYWw0MVlvd2tDdzRNamt4SUVlQm8zb0JK?=
 =?utf-8?B?c1FXVEdUVXI0azNUVFhyNGJDaklIWWc0TXhDVEU3YVFSWFpOYld6N1NnRlEv?=
 =?utf-8?B?L0hjVk94QmFiMWpKY0x5akMvcjJaY3J1L3ZpTkRja0kzTVNrSUxhc0U0a2g5?=
 =?utf-8?B?NkFDMHlENG1ObnVOTm84bzE4QWpoY1FYYndkWlZEMXhWcVNYUnZ2ZkdvZW45?=
 =?utf-8?B?NXcyU3dOWnZpOXFiNmgrQVFHTU5VUkd1NEcrdlhnbFAzbnpZLzhkejFVVnNn?=
 =?utf-8?B?TVlBWXlrZS9WN1dCcDFNWkZFTGN6S08zNmthZzZ5dzNKSFhzRnA5Uk1jRWFw?=
 =?utf-8?B?UnpPcTNPaUgrMEE4Rk5VOHJTVzNuSUk4YVRMaVBNQmk4Z240bi93eHNIbVh6?=
 =?utf-8?B?MnFZRE95SW1vVFowNXVWUGVTd09ONUxXd003WnZKZ1UwRE1JcDhUMURTWGlO?=
 =?utf-8?B?YnFPOTI1QkFDMU5HVGFob0g4OTBDcmx0dWhYS0RhUlpiRjdqeUZxNUFsczBD?=
 =?utf-8?B?YVpJNUJVai91WUIrTHZtcTAwZU5OYjk2UlJzcEFydlRqOFFqZUNRSHA5VE95?=
 =?utf-8?B?V0hxY2dVRi80TURYMFoySjZTNUo5NUZPd3hGdFVJQWJLdk5saW9kT3U5S0Za?=
 =?utf-8?Q?L1BxKQfkU1GvNdAYAvwfhKTTPzZBlI=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(35042699022)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 17:34:12.3510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8322a7b5-8ef0-4e46-9389-08dd45422393
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 17:34:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210816

T24gNCBGZWIgMjAyNSwgYXQgMTY6NDUsIFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxl
cnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gRG9lcyBub3QgbG9vayBsaWtlIGl0LiBJIGd1ZXNz
IGl0IGlzIHRoZSBzYW1lIGFzIGZvciwgZS5nLiwgcGtnLWNvbmZpZywgDQo+IHdoaWNoIGlzIG9u
IHRoZSBuZXh0IGxpbmUgaW4gdGhlIG1lc29uLmNyb3NzIGZpbGUuDQoNCkp1c3QgaGFkIGl0IGNv
bmZpcm1lZCB0aGF0IGluIGNyb3NzIGJ1aWxkcyBtZXNvbiBuZWVkcyBfZXZlcnlfIGJpbmFyeSB0
byBiZSBzcGVjaWZpZWQsIHNvIHRoaXMgcGF0Y2ggaXMgZW50aXJlbHkgY29ycmVjdC4gU3VycHJp
c2VkIHdl4oCZZCBnb25lIHNvIGxvbmcgd2l0aG91dCB0aGUgY21ha2UgaW50ZWdyYXRpb24gdG8g
YmUgaG9uZXN0Lg0KDQpSb3Nz

