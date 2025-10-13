Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3B4CCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 13:11:19 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.46])
 by mx.groups.io with SMTP id smtpd.web10.43095.1760361073867321081
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 06:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ObY/umsv;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ObY/umsv;
 spf=pass (domain: arm.com, ip: 52.101.66.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UAZH/KACsYlaggvmFM5oaWf2EOl+1bYdIBUfUNcS9TNCojWUg6gPTsgaYyy3fIIjLJVpeIJCGjvSPbe8SKSlNb0kg3ZfmA9a94pJ0X2IE40rAupgKasuy+6h1LeqJgc2zJqgiAh5TjJDJEAuwVnm4GhZt7ot2hhZftdCpENpiax8Q1XjwX0jcGbarNi8t3nxpECddZ9qLZOy/u25sGj/G4W1lWmOLcD3XlFz7auy3VQseUifk85i1ENtNG5OEr7xrakO6UuJACxB/dytHYu62gFchW8rlzOYRkIO6NKWl0LqzUt+xNLZjUWlCmFvcaR2bjcR/oW2S5tNbv8+EhDuXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt+FeN23D4wIvRLPKYnUcsoru5aMhyoVEXC4ADB9S/M=;
 b=Yc+IwIum/ZMHirYySpkYBsHysCSv5DxsC8KcC4j+fCSWXnoFos2fTgY7CKdte88tdXOEv/FgfCTGq8RNxk/O14EVWBfmjacgqhInm4ArGAc04K+HjKdobsxE/vVkOVZ7s3a5DqrLfGhzJS9mnExS7P+PI/TNDlwkHVak85R30UrBn5sGJ2pvsOf95DQwVHe0eMmTlDflNV/oG07e8VEs7tgaTqIUCvG1V9p3f4w7oDTYljFCF+PRWuFkrC3RzeFWL8beRJ1kZUnTueatvtLb04W/ECF1p+AxKz+AUOJOkZazHr6bQobjfGd1slyduhYgMmmBqEFEeOKpQzw01Hyd+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt+FeN23D4wIvRLPKYnUcsoru5aMhyoVEXC4ADB9S/M=;
 b=ObY/umsv8tJ4MtLYwiXghVznTg93MCm9tNmo8HYgSROiN0tuR/93gFo1ICmTNOZC2t4FqToWZWKwrUGEUDvqHr6eoLkfllGr4pjah3KzBh3TsOZu+0gMNyz/5lX9b4boMom+Zl/CxnD2C2I6Gif3cBz+RKycYctXNdq7MLKOY0c=
Received: from DUZPR01CA0283.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::17) by PAVPR08MB9555.eurprd08.prod.outlook.com
 (2603:10a6:102:312::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 13:11:09 +0000
Received: from DU2PEPF0001E9C3.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::2e) by DUZPR01CA0283.outlook.office365.com
 (2603:10a6:10:4b7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Mon,
 13 Oct 2025 13:11:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C3.mail.protection.outlook.com (10.167.8.72) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7 via
 Frontend Transport; Mon, 13 Oct 2025 13:11:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaeqXCfRpvRBNkjqDVQo/No9r6KT9KQxWKFC7LWE7LPApAf1ORWgw+M5HtL6FmYafdJeQpM8BsKuXeEA5YY0Wm4R3z6lrAfcbLdwSg/RO+W+gJYdvNJbunLDDDrJjorjXLKkAjzcKs8Bx6+TcIhXJSn4vIcp2xU/RH+QJHRuSM9Ai0Cb8i9BfhfCgBcyQg/evg3vWRC3sdBU84eFn66UoBil2blSOB/fQo8GyLSfeHkWhwf0R/QTNaCXOKa4HOFAkHShSre2zDjmdXh4RAOujTVZxMS/C7rKakuC6IC/YHffAanTTwWZg57UP9hZZFygmkEmMvrWdBNr6Zd7yvZOpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt+FeN23D4wIvRLPKYnUcsoru5aMhyoVEXC4ADB9S/M=;
 b=BJMjr+FfrXUQXZuf/fNiPp+kvuzfwiGPbDzBBiYArmbnf82wLP8Fv51T029xmw0aapCSIwxmlvcLXt8Y3ekLa8PlKvlC4zYDrx/LtmvEbJkKn+6OuetUGelfi+BZsmE2OIS2KrQoRodz8i7rSjSMzPTXHs96cnKpXx7crAZutCDdMtNKPMFY31ogkGEiudZfUPBpRHfYFoeOucR/e0aZKj5Gtdt3tpMViCg37/bO8jZIP0WHVeHAsEx9TKuFuDr1c925qgS0cmRztQ06g+GJzt0zs/vs5M3jhOjQ24G9HRbZ5lwFO++JSFAqEZG29AEd/imT5f2r6OayoYujnOqIYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt+FeN23D4wIvRLPKYnUcsoru5aMhyoVEXC4ADB9S/M=;
 b=ObY/umsv8tJ4MtLYwiXghVznTg93MCm9tNmo8HYgSROiN0tuR/93gFo1ICmTNOZC2t4FqToWZWKwrUGEUDvqHr6eoLkfllGr4pjah3KzBh3TsOZu+0gMNyz/5lX9b4boMom+Zl/CxnD2C2I6Gif3cBz+RKycYctXNdq7MLKOY0c=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB11211.eurprd08.prod.outlook.com (2603:10a6:150:1fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 13:10:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 13:10:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [PATCH V4 1/2] rust: Use llvm instead of rust-llvm
Thread-Topic: [OE-core] [PATCH V4 1/2] rust: Use llvm instead of rust-llvm
Thread-Index: AQHcOfTlkOOT91woKUOUPr1reefB77TAEYuA
Date: Mon, 13 Oct 2025 13:10:32 +0000
Message-ID: <512B27D3-F57A-40D3-84D9-30E529FE631D@arm.com>
References: <20251010144735.862149-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20251010144735.862149-1-Deepesh.Varatharajan@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB11211:EE_|DU2PEPF0001E9C3:EE_|PAVPR08MB9555:EE_
X-MS-Office365-Filtering-Correlation-Id: f8677460-2a21-445e-a92e-08de0a59f8cc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?aWNoOTVXNktiRzBrMThoSERNejVaOStCUGtKWDdUK1lNeVZLcllJTmVoMFZX?=
 =?utf-8?B?RTBNVDIzZTNCci8xZGF2a0RKL043ZHk5azFUaUZjVWw5cXl1L3ZUcWh2bkV5?=
 =?utf-8?B?Ly8xQTltQWt6NFZLTnAwbE02WHZEVU10OE9OcW1sM25UVnNGV0NmeTEvZkZG?=
 =?utf-8?B?ZUl0ZWY2ZzJZTDdRSDUyNU02TGhvdnR3RnpwbFdnTXkzSDhkaXkvUmxqTXlS?=
 =?utf-8?B?eHBNSGxpOHdUenBsUlp6YUVvNTM2Ni9XSXQzZkxvWFdoU3RHTlhnaXAwSDFB?=
 =?utf-8?B?ZnVDR0pUdlZpTFRSL3pSMDVjcVlzUHpvanJ2cmFWMUdtWjJNN3gvYnppQWsr?=
 =?utf-8?B?STRNVzJYZHVmMEdEM0dRM3hyVGYwVWdMb015S2tTUWZ6N2ZoTXJYTVg2Ums3?=
 =?utf-8?B?RkQyUFJ6N1FlMnhtM3ExQnR1cjFRZnpLaTEya2VEcUNueTFMTjVDKzdtSDZr?=
 =?utf-8?B?d3NaUVc1Z3hzSXVEazR1Yk81NDJuK25zSlE0cklmZE14bnEydXY0Q3dHUmwv?=
 =?utf-8?B?M3dRNTQ5SEs3eUtDMnJtbGlPWmtiY3ZjZ3cyaG1mUEtSVnlUU0NyNkJNUm9E?=
 =?utf-8?B?dHd2cm9uZ3NaaEtsWE42QWxRWTRTbkNJekR3ZTBiKzduTXRXS3pzQmNveGt3?=
 =?utf-8?B?Q3oyTWY2bmdrdnZsamd3ZTJUMWtlSVpzOTlqREk5YnpxN2wvaEU5NEg3aTQz?=
 =?utf-8?B?SWgra0VtcU5DY0tVakpieHk0eGloZyt6NG5qK2FUVVF4OTRmc2VCVS91Yytu?=
 =?utf-8?B?dUlEL2JFV3NvU0sxMVdCVEozUWZpRXFETzA5VGlYeDZaL0ZtZUlLWEtTbm9j?=
 =?utf-8?B?bTYybjIza01BM3ZqaXJCYXFXWlhWMDB3cFllRkZTN3Z1WlJyR0xkYkErTTA4?=
 =?utf-8?B?MEhQSkFJek1GNm9IVVlHZ3k4ejRxM3FSMFZkSWYzUWpxaEphTm5zbWl0Vnha?=
 =?utf-8?B?QytSc1J6T1lXY1NJd3ZaVitaU2l2bDErT1BtL3p5ek1tRzNFT1pXY3V4RXBP?=
 =?utf-8?B?c0pLWVBlaERhUXFOTmphNjhZbCtYZzJ1bmt1d0I2d1h1SmxqUnRIT3A2WjJX?=
 =?utf-8?B?Q2lEN3ZuaVByMGlsOFlyWk1UcVJFTGp5NEUvSXB4RW02clcxMVYxMno5UnMz?=
 =?utf-8?B?ejJBQ2Rmc25NaUpqcFpDaWhkem1hOENxaUY3eTMvMnJsSDRFN3o3OGdWUlh6?=
 =?utf-8?B?VlZ5dWcwWWg2bVV5NEgrYytwY3NmZmg4UG5XS1JueWFKUHdtdUtKcFhjNGU0?=
 =?utf-8?B?cVR4bTBjUHNNVjZYb2lVVTFXRytYd3NhRUxwTzNNU2JkMzEyOFZ6bmVuWWda?=
 =?utf-8?B?WS9BTVAzNEsxOXlnL0xkcXo3N05DcEx2VWNpbEtzZWpUSmFrWEpQWVlQa0t0?=
 =?utf-8?B?bXNKUjc4b0svY1V0TEJFaHN2RWpHdG9sQXJESWE5Y0NQbmlKbzQ0N0EwNjZO?=
 =?utf-8?B?WGkxOUhFMmVZWHdXTWtwVllPeGtKRjYvaDhuVGIrRmJwNW9yUTFkMVk5aEdz?=
 =?utf-8?B?R3dXd2toZmhZa09ZK3lMZnNCTmxKRGlhWmdVRWRRTmI4VE5CdDBTL21zT290?=
 =?utf-8?B?cTZYdEtGY1g0c2d0QkFaa0tWdXc2VHVtWFJRS2w4dlYzdUdyNlVuQW4wVldz?=
 =?utf-8?B?TFZPTU5Qcml0RGQ4Wk9iaVpvYkpNSUY1bmlmM0pNc2NBdlRPT08yWS9iNU5h?=
 =?utf-8?B?bWxhQXQwYk9FcUVtTUhHWld5eUNpMzRhL1Y3d2FqMTErUDJJWWtXdUdLOUFi?=
 =?utf-8?B?S3ZMaldSd0tDbXVaMFZDaWU1aUFMLzZwNzVBdXdEQW5ORXBtTVc0c2tGd05p?=
 =?utf-8?B?YWZackUyRUJkTW9iVVlzbXdIVU9LN3hoaG43NWpERkdMbEROaE5Jczc2ZnFP?=
 =?utf-8?B?YnpNUVc2SlI2eVNmZ2haZWlvdzVMbUtQY2FuOVFGaU5zbXdIN2FybUV0T1Ji?=
 =?utf-8?B?VHBGcFNCMjRGSGdWRlZYNmlpMXlrS1J3by81VzdkNmVKYmh2OE16YXhzQzdr?=
 =?utf-8?B?amhUNzRaMk1GUHl2Yi9UYVZVNkdrSHJ6K2RYcnppdUx1STRnTVZUZVUrYzFk?=
 =?utf-8?Q?QDT/2P?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A477A99B0C5B4B4BA7E4870C30B5E5CD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11211
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b9d8b27f-4d4f-4aea-e54e-08de0a59e3bf
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Mkx5VFBRT1FKZ012ZjgzSDRPTjVqR0pjTmJIUzI4ajRHYU5SYVF5OUNpOXUw?=
 =?utf-8?B?M0h6RGl6YjYrS2tiOHpKdi90cm12MjJ5TXFxZHpJM3FKUHFPWk1tSXh5U0RQ?=
 =?utf-8?B?bGFWb1ZXayt6djhjVU05VzUrcUNOc1ZLdXZZTnVzTno5aDFqZDZaRWlzTHN1?=
 =?utf-8?B?bVZvdStPL09yRmRZbEpyZzZ2Q1JCT016NDQ2UXBNV3c0cnBlK1BYWE5JQ1JP?=
 =?utf-8?B?SEFuTDAvZU1YQzBHeSs3emtkYk0yU3dmYk1JMGZzWnBnenhLQUR3cjZML1Uw?=
 =?utf-8?B?b3hWTkxhSGg3b2Flb2M1ZFNlUUE2U2xtTTc1RVozS2ZmdVQ3dmNUTVJEWEhD?=
 =?utf-8?B?Q3ZSVTd4dVVqQ2Q1QnVhV1FuOFZYSndINWRLNkhmNUtyeHBDQ3VCSmpNcE55?=
 =?utf-8?B?QUw5LysxZmt4MWpWUWRjNnc2VjMwVmpheGh4WDV5SC81YU1tNTMxSzlhL2F0?=
 =?utf-8?B?M3gwZW9nZU9NSVpUUWtWWmEwclNFMmkzd2dUc3hsNUFLaVdrNVl2cnpnK2tJ?=
 =?utf-8?B?VkdRbjUvTHNqMFBGcnp1c2MzaXFYZlRSWXdRMG0vUjFDZ2dzN0lJZ0w2Mk13?=
 =?utf-8?B?bkozdEd1bzFTaHljLzIvNmRJNElsd1ZDMXZuZEJBaHlNVTN3eEVJL3ptSUwx?=
 =?utf-8?B?anhlUzNETjNUZkp2bStCZ0Rqa3FPd2JWTmdCU0dPdWdGVkJJU2Z3TlBUMklO?=
 =?utf-8?B?cFRvSnhBeHFXZHpBVG9wZzdaTDA0L0VISkRLZzdUcUxkZ3Vrek9ocnRWZStO?=
 =?utf-8?B?aGQvTTJoNG0yOGVHelVEa2xYNmRTbm42N3lRb2dOZjhEWWlXblFPNE1zcFF4?=
 =?utf-8?B?YTRuUE9EbmdHcGJSWkdObTVhT3hFRWZKL080S3pGaW1zQ2k4WTdsSnJlc2hW?=
 =?utf-8?B?L2xEZjN5RnVybkwxMFBQU3d5UTdOL21GbU1PZHdTbnp5LzZ4R1luTDRiY2Uv?=
 =?utf-8?B?STRoVHZtbk5NbDBNbWdjMmsxVzRwZXc4L0FDOXVLaHRrVW9KbVh2bnptMm9E?=
 =?utf-8?B?US8yUGNHU0xRWnlTZTZVQnRPUVFZRVpnTDNrUjVjMzRYS1gzaFp1ajcweDN6?=
 =?utf-8?B?NG9DaE9XamM3dUdMU01Zb3FWdStMSnFaa3EyenloV09LczJtWWU2bG1Ic2hC?=
 =?utf-8?B?VjdZRkpNZUxmS04zWVdtWTF2eHQyZmtHWmkxYTQyL0ZvQTlQVEZ2WHhQL0ZY?=
 =?utf-8?B?YUl5M2pUeGVucnhHQ1ZXcGpKWmlUTUtHMG91bkZlYWhwTWhGQjFCejlPN09I?=
 =?utf-8?B?Z0JIVzhzMExYRkpkejh6OHZjN205d0VINDRUc1BVS2NjelFTbnNxNGwrYnVT?=
 =?utf-8?B?K2JYMWowWUwwdzdhWkx3c2pGUXJrM1h2b2ZEZm5ZaTRvcjNXbnUvbmNZcW9R?=
 =?utf-8?B?aVU0V2lxcHQrZE80dE54UmljS2NVUnZOQmFmV3dsSyttWnc2b3ArUkFaeUVy?=
 =?utf-8?B?c2VUeFY0azk5T2FMcklYbVZxNXVwMzRrT0craWwrSTJLZU1qOFdtRDRZRFBX?=
 =?utf-8?B?dVJGUVNkaDBoaUsxSDJpUTkyaWRxNmQyTHp4cGloei85a0JnMjBCRnk3UW9S?=
 =?utf-8?B?elZEc1J6UU4vOHBVZVJ4WmtGV1h2MEovZFdDeU9tWHBxK1ZRK0NzeXlEYWNG?=
 =?utf-8?B?TVFLaGlCWm1Qa1VyMkdTQkNvMUk1QjdFRlZ1MmJIaDdNZ01SM1hJbTljaVdl?=
 =?utf-8?B?cVAvd0l2Qmp3N1c0cnVLZFJXejlwdHVRejJPSERwVHU1UGNEL2FOaEJiNmxI?=
 =?utf-8?B?YlZiTCtwS0VXaFVNeWlWV3R1L093Si9tNTZOc1dKWUFKYkpZUDZHMGxiU3Zs?=
 =?utf-8?B?VXIwMFozZ1JNYnVta0R0ckx1ZXhIaS9iZ3BtcVB6OWtEbXEwajh4bzJ5Y2Rn?=
 =?utf-8?B?Smp2WktCOE0vVkU5RCtCd2ZBQlZUaHI2UklhYmhIeDZGU1lac21qbVdMNVV2?=
 =?utf-8?B?ekFMbDVwWlhpbkU0TWNMcnU3UCszMUlaU28wUFh4STNuTjZPQUpnRkNKbi9U?=
 =?utf-8?B?L1QzRmx6cW56YnFEdVkxQVMrMTZsUDZKTWh3MUdrbWcrMDRLUlRtYzViajEw?=
 =?utf-8?B?dmtHVDZEaXdWN201MkhSL2E5bVNKQlZPMFd0TU1TWVAzbnY1ZkFZbmlVMnVo?=
 =?utf-8?Q?6zHs=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 13:11:07.4635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8677460-2a21-445e-a92e-08de0a59f8cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9555
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 13:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224783

SGkgRGVlcGVzaCwNCg0KT24gMTAgT2N0IDIwMjUsIGF0IDE1OjQ3LCBWYXJhdGhhcmFqYW4sIERl
ZXBlc2ggdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGRlZXBlc2gudmFyYXRoYXJhamFuPXdp
bmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiArICAgICAg
ICAgICAgICAgICAgLURMTFZNX0lOU1RBTExfVVRJTFM9T04gXA0KDQpDYW4geW91IGRvY3VtZW50
IHdoYXQgdXRpbGl0eSBpcyBuZWVkZWQgaGVyZT8NCg0KQWxzbyBJ4oCZdmUgYXNrZWQgb3VyIExM
Vk0gdGVhbSBpZiB0aGV5IGhhdmUgYW55IGZlZWRiYWNrIG9uIGhvdyB3ZeKAmXJlIHVzaW5nIGxs
dm0tY29uZmlnLg0KDQpDaGVlcnMsDQpSb3Nz

