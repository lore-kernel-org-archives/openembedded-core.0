Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3581C02193
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 16:31:58 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.48])
 by mx.groups.io with SMTP id smtpd.web10.120945.1738686714446359305
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 08:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VGZLLQ8y;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VGZLLQ8y;
 spf=pass (domain: arm.com, ip: 52.101.69.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SCgkFPx8TrP2W3PZSHRC45UV7xAb2WtUP+mCmrV8aCY7wpElSXRdkD4FvATFX1ajbKzL5jbvJiLq+xh/oXNhdm82SmvwsdLhPGcto3pneyTL+O+E0rHSYTjOuTHFkl64O/n1esZi+Xu+AnWnahB0EzNBWl05QCTdGP6nkyHAMTJYVhOGxsqj/4i+My5hhB+BiY5U6c6h/tBRCl02uJSC3dW0VyGLUt8sKdRtDSlTP5GvFgOXV02vaF0NY7Bi9oY6u5E5qisw2URvF56xrR8svRB0V//1kEszPv/kgxyF0dH1I00b961eoefdql2zAHoVrtOYYj+jROp0XjBgNFeajw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/1CjMuNFwdYH9iBDcyNqY2DQq262GlovKcLGHVeYIY=;
 b=oEuezYUTd30K/m0EmFxhlARN45nqWv2+x4geNer99+K0qKsblijRTCL2Xp/42hrWA/j+cLHz/O3oDfp1Qtp4rA1VuaZcreoi4+2cZecNp8e0KWELSnFCxfB7AvVmNR9qxP+qotoV9mlrHqLsZS2c5HCqSgePVTAMdwTS7hrclNJ9CZawCjNPj1GitrSzO6JXfbItphqEQdpRyS5X1gQmjMVA8eyt1E/Zf1Iv0Y/WpWKdmpGkh5tdIMGolQ0lrdjhBMbPyS/GND3+/k17+ZjOcf0SdR3T3+rYQq+Fpmw2Rs94dBtQ8o3M4NDIHmEeIsKL131PhWWpeFnTL+hTtAMbDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/1CjMuNFwdYH9iBDcyNqY2DQq262GlovKcLGHVeYIY=;
 b=VGZLLQ8ykW0oHnAk6OuEoPQqRWiqRXT4NSFLFkXRShITThcawV1B9J+/ojis3zunGKe1ueKOpNOIiG3MDyL56Qui+0opfC5g26Cfv22bPGwahfwYLfd0q7tFEDUJYHu9jRBIV8Ir2X3wtK5ww0U2mi8r65OiuScw6HXax2mBWSI=
Received: from DUZPR01CA0150.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::7) by DU4PR08MB11077.eurprd08.prod.outlook.com
 (2603:10a6:10:576::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 16:31:49 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::6a) by DUZPR01CA0150.outlook.office365.com
 (2603:10a6:10:4bd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.26 via Frontend Transport; Tue,
 4 Feb 2025 16:31:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Tue, 4 Feb 2025 16:31:49 +0000
Received: ("Tessian outbound 4d4d74fe3cc9:v560"); Tue, 04 Feb 2025 16:31:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ee1d2558e00734e3
X-TessianGatewayMetadata: V2hRbKNUNMdBDNfLm7PsgAem9TNQB0KGVbpjWLEWq2eVaPvHXvyUDrSl+HdCxYrk5w9Zjk3jSysFedUoyW+KiBmwczgAd+bxrJBAWwWzdd6CAooOg4uxPqhLXYk9xP8va+1jgx2FbIvZpkqWw+UC7srnKzwMq2UzMhVGLyGOufU=
X-CR-MTA-TID: 64aa7808
Received: from L0e00ae915689.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E1980580-BDB4-40E8-9B24-9B255703C998.1;
	Tue, 04 Feb 2025 16:19:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L0e00ae915689.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 04 Feb 2025 16:19:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoS7V7W3DojNfcd3uYxI53l4TFZlngLoB/cacR38qwYbdl2XQMQvKitsIwWZz+umTL8bBa/NOAIT95jcbpMFrFNt4PmgBYxdvw34Bns9zed6dyw9+/rs2BLShWC4Fi5r+IVXyzdjQC74bIXh7cUi2ouI2RzbmVkCJTTDlC6YfbxjogHorm/oL/6r15gx6MwJrZf8LenmrasKMeQfVZM/hWmvMjtiM6ke4/ue8KmKJF871sF0kBFm2i+cghO8uXi2Go2PpO42cyn+lb6IFhNR/xzzNJWe4Ptjg/iwyopFmqNoaU2AZFDg7ObjJ9rKw5z8rZG4JLn/Xqm+oThsK0fzXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/1CjMuNFwdYH9iBDcyNqY2DQq262GlovKcLGHVeYIY=;
 b=BK3GjiieF7gSDm7JRfAMWT7e6IvwznJGFQxdG2BCt/WCUmAjxNfUiglOjoIqUjIe5YGyFi8yFla7YiJ2xQ50y/g/t0XK4UEU8LX0b4uSHe9OdRqzP7wKktX42VF8Eg4YAqw9C5RqROG2k2qN2erMWaaHsaB26xPaiePoentCli1S0qeEMt6Mghm06zk0I0rblHbsoGVTkspfHZfgvF3ezVrsBhR3LMhihxv9LKmFK6eCTYRb0tP2wARuR88GN7+uZq386PcrdWAuyu1hmTwd1Q5PxMCcRjw4Hv1mBhGOopBfynWjym2rACiSc7dw90yVcn76yMPA4xiKntsz2z/01w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/1CjMuNFwdYH9iBDcyNqY2DQq262GlovKcLGHVeYIY=;
 b=VGZLLQ8ykW0oHnAk6OuEoPQqRWiqRXT4NSFLFkXRShITThcawV1B9J+/ojis3zunGKe1ueKOpNOIiG3MDyL56Qui+0opfC5g26Cfv22bPGwahfwYLfd0q7tFEDUJYHu9jRBIV8Ir2X3wtK5ww0U2mi8r65OiuScw6HXax2mBWSI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8230.eurprd08.prod.outlook.com (2603:10a6:10:3b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 16:19:37 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 16:19:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] meson.bbclass: Specify a cross binary for cmake
Thread-Topic: [OE-core] [PATCH] meson.bbclass: Specify a cross binary for
 cmake
Thread-Index: AQHbdx7E+lYOPGVflEiMF6cEQi4yBrM3UuGA
Date: Tue, 4 Feb 2025 16:19:37 +0000
Message-ID: <15230CB2-3678-46F7-B0AD-705DBB8ADB5A@arm.com>
References: <20250204160609.1646883-1-pkj@axis.com>
In-Reply-To: <20250204160609.1646883-1-pkj@axis.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8230:EE_|DB1PEPF000509E3:EE_|DU4PR08MB11077:EE_
X-MS-Office365-Filtering-Correlation-Id: dd607c90-1d70-4079-92f8-08dd45396caf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cE5raS8rY1ptT1JYdE0rT3JSaE55MVhUUDFTVDB1dktsL1pKQVU1K2ZTWHhV?=
 =?utf-8?B?ODJTcTVreW9yMDJZdEJrKzNRR3JvT3lQNWpleWU3M2t6R0VuaHlQZ3Zoazhy?=
 =?utf-8?B?RE5saURhQlBMclgvbjlUeTFDYjJORGtaYWc2WmhlMjNPS1ZrYU1hSTI3QnpR?=
 =?utf-8?B?VnlwdmV1eFZjYjNUTU9NdldCUnZOT3p4K1dIbzhjUEszd0k4ei9TSWk3bW1t?=
 =?utf-8?B?a3VLU2hCK0ErcGU1Q3VPeFVZRVp4VDZySUgzOExveFVYbnQyTGR5cEJlUnVo?=
 =?utf-8?B?TDJ0SFBhUVpveXZ0d28yb053aTR0WjVCbEdwNDZsaU83M0ZLNi9HeUtiR0hW?=
 =?utf-8?B?MVNETTg2dkl6Q200YUQxYkVWUG53TDl6MkxWVFEvQWxlOGhPMG04cHZibFhU?=
 =?utf-8?B?SEFqL2xXQ1BRcVRTNE96ZzBvcXhUQzZ2ZkZoVlBYRTNnQWpnclNuSDhVVWxN?=
 =?utf-8?B?ZkpBNUNlaWdpWmdLVWtxbUJTWEZ0dVRvSUVOdko1MUluaWRsU3ZRY0NDQVhQ?=
 =?utf-8?B?c3g1bTNieHhqUlZWdnEvRHZMOEI4QmpOUVh6VWs0eWlrTzZiRHBGRFpzcHRR?=
 =?utf-8?B?K3Zxd1MxVjJKcGFmakhUOHJ2RjdDaU5BMmh6MVYwRGZQcDBEUDZPMXNoVWtk?=
 =?utf-8?B?OC9VZ2FodldYVEZjNCszaCtTSXJ2UXJBZi81VTVRd2RGaFJwV2JRbkZqOUVJ?=
 =?utf-8?B?MHQwejFsVGgvM2FvaFJwNURrcFJLVm1uay9aRGJpRCtqb0FwaFVHQVAzeklm?=
 =?utf-8?B?cXhscWdUcnMxcWd0cjJvV29JZS9hb281TDJ5NjZ3bFRua3cxREMyWW43ZXF5?=
 =?utf-8?B?OGRFbmRteWl0N01weHB3WFFnR1dXaGdCWjRmb25CR1RzU2tIdmtuczIyOUtG?=
 =?utf-8?B?ODB3Y2ZQSlJOU2JCTkdxeUlVOFh4bUpCTzRiZHJ5aDNSQmRKdlZGZUlLS2lp?=
 =?utf-8?B?WHZQM2loczh6clFZTUNLSUNzUm5iUko2L3k4Zzhnc0ova1NmSU50Qm9kU2pw?=
 =?utf-8?B?Rzg4Y2E0a3hqd3djWFlGbEdISnZ0YXoxN0NERkIvbEhOck9zWG1PZzUyZVpu?=
 =?utf-8?B?R1pZVGpjd2V4by9QeXJwblRoNW1wWlNSQVc3alhEYjJOaUlHOTFCNUFZbDlH?=
 =?utf-8?B?TlNoOVU5MHNIMnFOTVZqRDdiTWFxcFVtdmpHSWF3VmNhQmJ2UHBIeHBqb05w?=
 =?utf-8?B?QzhLNlhPbkU1UEt5WWNZb1RTUnFHQlVYREtxbjFjWmZlbU93bzVadDVHL2pT?=
 =?utf-8?B?VzJaQnQ5WDNqNUZqQ0ZPekpuYzVxUzJSQU1ydEdPZUsvRVdXdFJSWXZreXNt?=
 =?utf-8?B?dHJxbmdGZmlraXRaU1ovMUU0OCtmUlFoTjVyUlZHMk1TTWxlWUlmcDNSODhu?=
 =?utf-8?B?SGZ3c3JhSGlwZ09hbGg5SFhVQWt4NGZ0eGpQY3FvWEFHK2hwd1M0dTU5Zkx2?=
 =?utf-8?B?SVdaQmlVU05FYXEvRktYNDlGU2tQMUhlaU4zUk90aitYVEhHbjlBQjVwU2Fq?=
 =?utf-8?B?NC9QTk9XaVNJQVdSc0VTWjZTdVJKbE01d3VNQXRvRlVHU3NvUG9yUXcvSTlV?=
 =?utf-8?B?SXlIUEwrN2Z2K1hPais3NHljUXJGYlNpQVNnUnFuT2ZXVkxIVjV2YUpLM3RU?=
 =?utf-8?B?Tzgrb010OUpYVTUzL2Z3cGRxZCtXQXQ2c3RuN0hFRGNtdzNzbDdXejZvdnQ2?=
 =?utf-8?B?bVYwZFR6d3p4WWFtQ1ZEMnYxdzdhZGhudmtDRG8xTmdUbW1kak5vZVBaeHRl?=
 =?utf-8?B?UEZoajRkYzBhdzVYalhrMjd0TGZicXREZlcrMXB2QktpNUNINHExakFrYzhx?=
 =?utf-8?B?VGNFYWFvSGRwYW9WMkJkSHhHMEpGWFNPSVJFbmZvWVpCMlhUQmlpa2FKNXBv?=
 =?utf-8?B?Q1M0a2VxVFRkUTFiK2dFSWF5YkxXZGVzemluY21JNjB0N09Zc2plL0ROODNo?=
 =?utf-8?Q?DRiqDKIs2S4gVJIah+pGE9P7p1KFeCE/?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C81763734C584F46A3DA93EECCB32CAA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8230
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	388409d5-ed67-465e-fae9-08dd4537b886
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|376014|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dXhVazVzZHgvMTBXam1ZS2ZibkhZejR6bEx6R3lNSTVKbStWQTlkd0NqK1Iw?=
 =?utf-8?B?UjRDWFVicWRhT0N3eGZNTDFjMVQ1eHVTa1ZKVFpDYjNtRnhMT0RxTmEzNSsx?=
 =?utf-8?B?bmgxWXZBMERiMWpqZ3JReEp4K3FvUFJxOW9KQW5rSFpXMlcwZm1vMlZoSStk?=
 =?utf-8?B?T0JDVWZEdzAzZVg5UDR1SURDS05uMEp4MTlvTlFzZyt0THoweWRZN0JhcktV?=
 =?utf-8?B?OGhWTFhKUnkrQXRWQ3lJSTFya3lRMTEyVVlLOHgyUDhxSGlCSXJZVTduTkU1?=
 =?utf-8?B?Qzd5WGVIT29vMUw4ZzhNQ1lZQ0R2KzJubkluT09SRTRZdnlzOTFoU2NRblZm?=
 =?utf-8?B?MjYrRDdyWDEyWTlwL0pXNExhVkhVek1oNUtZV3V1dFdvVjNMbE5UQmYyQ0Vy?=
 =?utf-8?B?QkJxSWxrZ1lyQ09xNmk3VW1sckhTclBYNTI0ZDkrOENnTHFkYnFkRTRjQ212?=
 =?utf-8?B?blNrSUhlNE8zOXdrcDJ5MXJCcWZOaW9Hb0d0RXBjSnJySnlKbjc5Yy9HL2Vy?=
 =?utf-8?B?OVViZmdIRFBLaHBUMTFmZGM5RE5TUGs4cThKbGcxaFJmdUJOVVQ2aHlWaTYz?=
 =?utf-8?B?M0plRXM2WGNrNzVHSzd1MjBCY05ZaDNqeU1rYXJCMk5tcXY0TkE2MXIyWE1l?=
 =?utf-8?B?TEtJM3VzUzA0RFJSN2ljMUNkSVVUSDRxSXF2bEU5QnEySll0aHBFWEJDMmJl?=
 =?utf-8?B?Qk9sdjR4QXp4N2UrMHNtcnNDM1JQKytCMGtNWmNZYUFYdWk4aFgyVVdzQVhQ?=
 =?utf-8?B?cm9iZTVxQUhFY1krVUgzaDRhMVJZSDY2Q25DR3hSVTFhMmJpK0xSeVZTemtz?=
 =?utf-8?B?Y09RWW1tbUE1NjV2eENqWmcwZWVlb0x3dE11MVNIQTBpT0cxQzkzUWlHeXlM?=
 =?utf-8?B?d1RFUmRwOGZRUkJPU3YzTDVvbGhwTm1rcFZJaHoyS0FBMmc3ZG96S3RHa2NB?=
 =?utf-8?B?V1d3MWVHeVQ1Ym1SdmFjM0FFQnNIdEZ6NUFrTjc1YnpVMjYyVkVZTksxK3Zp?=
 =?utf-8?B?WnRPSCt4cE5QSXROOElwTVJRcVVBdDVzU1VFZmxpUFpPamtSemdZNFFuUTFC?=
 =?utf-8?B?UlU3TVVSeGdzZ05SYThicW9GK2N1N2NWY3hWRm83Y2phdjVHR0VXRlB2UkJp?=
 =?utf-8?B?MllGTU0zcnQ4S2VSWmlNb3VQMzlDb3VYenl2eW1jRVR0WDYvQTBRbmZKOGVC?=
 =?utf-8?B?VDVEWSs5SEpTNG8wQWRxbFdWZnU1TTdPNkwxUTJPMTErUmJTYmVOZEVEREFs?=
 =?utf-8?B?bWg2U0QzZGhBcUIrUUo3RHlFV2greTF5NEdtb1pPQTVzQWFobUJPbWtsc1Ni?=
 =?utf-8?B?NkRCTEhuajd1OHlEaEgxVmZjd1c4RjlBZ1R4enVNR1AyaHQ0ZDRqTm9RT1Qy?=
 =?utf-8?B?Mlg0RTZRbWJzaXNXZVd5NXEzQUdpMkhkOElWOUFKUFkrNHd6K1h3SnVOOG54?=
 =?utf-8?B?QWJTMTZjNVl4c3VIeWNSWTNwbU1uTStWUDhEdzI4VVN1SnJzV1ZIa0x5dEVl?=
 =?utf-8?B?bXN4aFVkVXVsU3FISVR6QTh1ejFUaWdycGM4VEtqWXlkSGF0WlQxU1Y3WXRp?=
 =?utf-8?B?dGpaWU5xVk0yWm1peVlhRksveTdva1hiQVExR1JUcjVybFZNSzhvUHhCcFRw?=
 =?utf-8?B?dDJyMUZmVlZCTTQ4VGIyWVhZNzM2azRCUktRZnBrdHpiVm9ralNOUlFIakZa?=
 =?utf-8?B?N1NDL3BFOFhXblA0OTNoZm5uYmZoTmhnd2RHU1JRZWdDS1QrY0w0aFBlcFIr?=
 =?utf-8?B?RGZoVjNKODI3a3k2ZXpDUG9nQVFjWlJlZDE4ZWptdDNROU1YSGhvenJqOS9x?=
 =?utf-8?B?TENEWHZ0aVk1VlBJNGJjQzNycEo4cUFjRm1UUll3M2doR3Z1dFBXeUZBSEZG?=
 =?utf-8?B?VzBDdEdVZnFnSU1pbW1NRFc2MDZ6S1RpMVBpdFZXdTZSSWxZMWFMUHRRV05G?=
 =?utf-8?B?WmlxWWhlNXdIOUh5aDRKUGd4K1ViVFd2YUZCSmN0TEtnMloxUWxRSkhkb2Nr?=
 =?utf-8?Q?AcUXYBYFmYh9ae7gpRqlX4Mom4GIGc=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(376014)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 16:31:49.5376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd607c90-1d70-4079-92f8-08dd45396caf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 16:31:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210812

T24gNCBGZWIgMjAyNSwgYXQgMTY6MDYsIFBldGVyIEtqZWxsZXJzdGVkdCB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8cGV0ZXIua2plbGxlcnN0ZWR0PWF4aXMuY29tQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOg0KPiArY21ha2UgPSDigJhjbWFrZScNCg0KSXMgdGhhdCBub3QgdGhl
IGRlZmF1bHQ/DQoNClJvc3M=

