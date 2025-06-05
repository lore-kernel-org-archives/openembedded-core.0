Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E80C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 13:06:59 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.41])
 by mx.groups.io with SMTP id smtpd.web10.7072.1749128813669295305
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 06:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fHG5t2zi;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fHG5t2zi;
 spf=pass (domain: arm.com, ip: 40.107.162.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sMmbIrQVZHybdmY+ZOq9qq5b8Oh47qbnHojnmkx9xOGkdA0wfPcYWKj8zKiotMRSutUwdbWY4p5e/PEsCNIiQhyeRyCTb5c2pv+eVR2oti88hR+Kw0woV73ZKEwQQJWeMKx7ake3+MnVD7owAF0SlakTEhOvGgDC9XPX9C9E8n9O7mScinyG9BpGjffR0Bx3V+hVlkyyE3e/b0FBD8CPxFfX0212MuM+/qjPPV6mO4tbzFPpRcWo49k09eQMdldYVq8pn87xcMEpbZH3dvBZP4V/U4Kr+6HnslOBkey3HrOkipVGp98H1h2Oe0cPgJetXDCrPMa27ULM73Iwan+aBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3ZI9CF4kp49TlSuLGGmcT2qbqCqEb/Z+5RDiGlJWig=;
 b=iDzWGj6wVkaM5Ea+wgdcFRkfsEeE/mXJDY63RVPxY718fXoHLjIxyZ0KExTFBI1jW3LEZpT0OoDD70G/Gp/inJY984oMedPYM30BymrqZUVK0ep/U2bB3YJbFIUMRNeHeXWD3q3OlQi+0cTN5Mrn+8oPDhpJya+OV/ugGXoZHOviL6Nje4SCTSfg4QEq0bTwjxYJrV9YbMXNgqIAbNwWXltjn+4f/rpY8yBGHKv5FQDKTB16FZMbwsFv8R/DnWfgCo7LotAfUcunT2ApRAKOOJdFZrbOegZoYHnl++CsR21oM9kTR1yuQldHOvpcXXDbPim7I56MBPpQAls8IvuNBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ericsson.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3ZI9CF4kp49TlSuLGGmcT2qbqCqEb/Z+5RDiGlJWig=;
 b=fHG5t2zixUhTd+2sXbAIh5Y64PQA8BHSVC0u9vn/D4Byp3JtZIL5T1ueq3mvKaq6VsxQESr8Ki/qpsX0MZfNpywFwpGwNC9dvWAihWHtKZmL0VoMbUPwepNaNH35fgdyeRricp9UtysAmZV62WPX0VXk50eZBDcbFzwXxEfPH5Q=
Received: from DB3PR06CA0035.eurprd06.prod.outlook.com (2603:10a6:8:1::48) by
 GV1PR08MB7754.eurprd08.prod.outlook.com (2603:10a6:150:55::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Thu, 5 Jun 2025 13:06:49 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:8:1:cafe::ef) by DB3PR06CA0035.outlook.office365.com
 (2603:10a6:8:1::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.29 via Frontend Transport; Thu,
 5 Jun 2025 13:06:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Thu, 5 Jun 2025 13:06:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2rnjZIl3O2FPrz/cofYlBai+4r4bh47nRCY+T1ShLm1wvVW8qUv82SKXd1KmkXpd/ITXuR+zXcnTGpSifGlxK54U+ikkDJdlQcMPUZ8V1SlHCAMyNvE91m/s922pq0oGLTvVqrl0OS/ltR+mxQ15G/qoxWIjIuxjbeqVQQcDPrS3+sLpLTAUZLwa8TVRvkwF0eRR7huJJP/yYVxDG+mKUeWU3kFmQsgJtoWjbKUXxiKP6/zK9TxHoIxIT96Df2891rn8WRndXgqj9DjguJZKf3K5GnpJlEr2CpqkiEI26Y4ZddgOTRzhoUbC2oHSBhyP/wwCVXVzVerpSPvR9jdDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3ZI9CF4kp49TlSuLGGmcT2qbqCqEb/Z+5RDiGlJWig=;
 b=S4PKcnWp8Sj2K+eRdAVBbocq8cBpP3prik7WDjKbTmBNl3THOE9iyaQJBVk6tLQEqqx+DaETrN791DrlM5isGxTpVnTHSf5/PbaC51JIq1c7ozL3mC/E9iK2Jo7FjS1lsn9HAYsW0WdGXWz+LbRuNuktijw1SQEYmPTvi/yRfpQOAhrzamzFE44LDyR6xY3P1iyZ8mkvpzCZwuf55I4KtcG2dhtWWJbKHWZNOzWGhRbJ7D32jIAYjG+Fd6G7epoTZh3qYao/42vPtSnbA8MeRVPdH7mixE0+NdaThdfVOGjEt5OgUSlJuNflhG3gQvf+4ssdour2V6Y7EPG2ANqwdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3ZI9CF4kp49TlSuLGGmcT2qbqCqEb/Z+5RDiGlJWig=;
 b=fHG5t2zixUhTd+2sXbAIh5Y64PQA8BHSVC0u9vn/D4Byp3JtZIL5T1ueq3mvKaq6VsxQESr8Ki/qpsX0MZfNpywFwpGwNC9dvWAihWHtKZmL0VoMbUPwepNaNH35fgdyeRricp9UtysAmZV62WPX0VXk50eZBDcbFzwXxEfPH5Q=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8575.eurprd08.prod.outlook.com (2603:10a6:20b:55e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 13:06:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8792.033; Thu, 5 Jun 2025
 13:06:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "daniel.turull@ericsson.com" <daniel.turull@ericsson.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7] package: export debugsources in PKGDESTWORK
 as json
Thread-Topic: [OE-core] [PATCH v7] package: export debugsources in PKGDESTWORK
 as json
Thread-Index: AQHb1hHeBRsL52JRQk6iCxVe3IfpfrP0iQsA
Date: Thu, 5 Jun 2025 13:06:15 +0000
Message-ID: <F45D78A4-1E20-47BE-9A54-DAB7B86CCABD@arm.com>
References: <20250605120306.3692449-1-daniel.turull@ericsson.com>
In-Reply-To: <20250605120306.3692449-1-daniel.turull@ericsson.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8575:EE_|DB1PEPF00050A01:EE_|GV1PR08MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b663a9a-b423-47c1-198f-08dda431d4a9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?5LkxF56yZobxF+0902kzTWy0gmudrZXQ5nSwprA0qqTunfqIvvT35Eg34aUu?=
 =?us-ascii?Q?K9lOdVku6P5B3vneLvuPeGTnes0JUtBwBrqk4bNALnCX4N3KECW2htidUzK+?=
 =?us-ascii?Q?uB7lwBMfTmrBNY21N+ukwpq4z9tO95z6F1MoxD1P0QnKCisOXlQx6wsUlVLV?=
 =?us-ascii?Q?igE1eY+G4Oc2vIbaer7jtXUz+IiGelpOV7fkv/FE1N1DjfFsk9XoBAFsGe0S?=
 =?us-ascii?Q?Qf/+VTicnBYxG0Q7s6e6XCjUKsnqXV+mI9hHj7z97O9hg8ktDqpoUq3fiDha?=
 =?us-ascii?Q?ZouYtUaXY7uxs5iLiL6CAj9Ik1jyru+w76pMYGlgwNZwpr0PIzrxFgGRZ6gI?=
 =?us-ascii?Q?4GTZg8/vcsjfV63p5ea/u1nz//0NHiRpRQPgpkePnDLQ5VZJQjuu+5zjDruN?=
 =?us-ascii?Q?mZiJYfmbji2OVNj/QFNgC7Vs5J1MUEeg5t0sLY/Ywmio6MkS+Qvp2cquY5YU?=
 =?us-ascii?Q?Gn9aSmoaPRTCEXugFnov6ywNbW0RjuOhOhOJXWOW6ZlPekC8dwmSq17td/VL?=
 =?us-ascii?Q?XjRo6SpWdcYy/FJMLlbWIrcchioZGotH3vdpN6LhZl+pPdsMHb/r1w2yZq7C?=
 =?us-ascii?Q?H2VP6X1f2+kaPqlwPrPLKAorxqT0qYRpI6b2aHJPVYuoFfpQARqu01TO9haZ?=
 =?us-ascii?Q?o0jZo3lstnmp40afXpou/E9wmZjRNzEMxyOOC/lbXhIciQl69gVie3f41IsS?=
 =?us-ascii?Q?iCP/oYQCJd9YbsDRiU5JIr+Pgp4jhcj9jBmn2bk1SfP4yXJHgien3gLr1QT7?=
 =?us-ascii?Q?s34KAC2N8bUUO//k0XlSOOtl0MznMRVY6PZNHaD8J1oa3EjDpNFANuseyA5m?=
 =?us-ascii?Q?+R/5Jqm+T8m3nTgx9YyeJftIggyc1VyWWk0Jwi9zh6wgtw1PuRhCa9T7Xyqb?=
 =?us-ascii?Q?PlznSIlEhhbS9TVWTY/xI0J5Pvb8V3zIaVjrX5hwJY77T6cWzEa7M/MndOng?=
 =?us-ascii?Q?XMI2hpDL6+GAm0srbDPdUGxxj7qY39I11pkNZSNmhf6HrvzNJhdht6eDq3JH?=
 =?us-ascii?Q?eugCSd2gVjn4dkZBtZSnMNbG7KPDqdfK7VS3qJd/cRNjF6OmkwlfUTZJ4Q/7?=
 =?us-ascii?Q?5GirDV6Gy0RS+D1DxhhUB/fupVTLdYXDiCFbSepwzqZmBVgGGl7xUpiMWy0E?=
 =?us-ascii?Q?b4k5ud2hcVLQSYnjRiwD1F4OqG4PIxwCQGYoteYLA0Oaama0kAzrMfpJiAD4?=
 =?us-ascii?Q?muYpm9idAWrVxPv5E1CQ4pwIUnNxEKJgtbCmwOrORTqGRZGmfr5yG2d6QEsK?=
 =?us-ascii?Q?YNjnedf51wrxF3aExbvvzp/e1L45f4AtN7Jo/3dxnckBm0Gi/MSnrUIKtGlR?=
 =?us-ascii?Q?YgNPcxEL0Sx58W7q6Bu0Se+sAmy804m8YlQOmPzNdUzW9NMy+2U3Zdnkxab5?=
 =?us-ascii?Q?bIQgK9TY2lP53N4uvbqKedrWzTgH3Avgd+DtxQ94th9JPgzawzoMyLCHN7Ab?=
 =?us-ascii?Q?B9bBYjSUhGrTK6hMDOMIN3ZI1/stNmcOhZobmj6JrTX42YhHE4qlll0Z6T5P?=
 =?us-ascii?Q?M8MafycCKqDpsi4=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DA644766810DDE499197A277F96585FC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8575
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2d803bc6-8886-456b-6642-08dda431c0e0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2eWoj6to0xmk7mHQ+j6/9vrrmx676iriS3U1vK28ASQeeTjXSJ8t+E1XXSpN?=
 =?us-ascii?Q?TBdi3lBWMYVSUzYRB2nLH1hNTHE1IMp/UF4lkjx2gqnWu/Jt9mEx5RhTFqrx?=
 =?us-ascii?Q?nhbVe7yetD8zOPQWzTEkN1L1D4TqnYePDTtnXfcVj2dAU5if5BWEYIcSUhFr?=
 =?us-ascii?Q?qoH+LZa8yz45S9G57yeRoHzUr1Ee7I2muoFCDFVDJoNphTGgt+KbplLaj4XN?=
 =?us-ascii?Q?cqUI0/qMCCugASEYDlTzHA5+faFGxg8zYGrP/wFEKKjy6f8ObwzrMjgPBLXV?=
 =?us-ascii?Q?8vGJ0/HFDcxCr3jfhRjm/TuKKL2myQKCsHqp838fearLHdMVxSvP9UOQcEqA?=
 =?us-ascii?Q?0SVctyWC6pBbNudXm4zJujWp/7dPOK6SVYh9q1mKZanXqPlXXrLkpjf5Q/cQ?=
 =?us-ascii?Q?RpUXY7nEaD2uZqsZjK05T17EO2F8OD5+ESE6NEdQNw05HHYeDsWDlGMz9bp/?=
 =?us-ascii?Q?rRAye7s1hGnDvEiZAI3dGZB79KQ/VoeCJNQf1t04kxiHz0ET6kRKywbdpqHp?=
 =?us-ascii?Q?wi64NQdf3PRdf3KxqRkPcp1lYcnYKFJ0NFeO2C8HSEicQbSPJFBX2xqh11vR?=
 =?us-ascii?Q?oNTCDuS+gYyJTiLt92eOJXNuumEsiDIjnEPns+ppy8di06M9TP+4sOOAuiyJ?=
 =?us-ascii?Q?WVLHa/p7jxSkBKDzfxmm5DtMVd8ZztWIo/MXf0+98NvqjIZcqChDnA4p/7n3?=
 =?us-ascii?Q?Ez+rJG6a6lgw/gljwL++t81cxvEsbOv9bbCStZeQR8aUKMSeSutdrfr34T56?=
 =?us-ascii?Q?njpEfLNeB5pgaHp+wkgr3a+FE9dT1ajS+C4dX6aQSh/vffiwNFtZOWKGnNnv?=
 =?us-ascii?Q?qhQ73ZBtp9fpn0o4Wvdi1JTePAeaVp1GxihrUcdlaKT/F/UP4HcJFoQ+Frbh?=
 =?us-ascii?Q?LpqyQpBWFeDUj4i5nlb2/YiP03YJuyxr74TcTLb7laJLOabl44MFRCtaRnCp?=
 =?us-ascii?Q?sfhfgYcQXwP4LoQoUyEQSe1Vp4HUt91KAaqtdj29U3abdHL00JCmLI3Z8hL0?=
 =?us-ascii?Q?xAsxDBdjWS8PEqzhMeNivGj1HB5uknbjpelYUIPsFUMoLTSu1FyHCdNhPZQk?=
 =?us-ascii?Q?QXc5R/nDOGVp9ApLgE1cmcWDSVams3r3lBN0mG6diap8bTUAxRKH5d4dT0lD?=
 =?us-ascii?Q?avXmxE811U5dqj+TcBftgVmhOMYOTli2tuLTVkODbCOBk2Pzzml9cp+Gv8IS?=
 =?us-ascii?Q?UJR4Y773odvJExT+osTJ6ie/BtPchigOUKM+ENg4dpUnPd1YZ9FoMn70s4uM?=
 =?us-ascii?Q?17ADRh3mHUw+DUcJutsa87jT7hCS55PziubpfrZ0iZoqPA60P08+yZEP+bOt?=
 =?us-ascii?Q?Gp5ZIMumBqTy31Eqz11DzCvbAbc9ADniY7jgFX+eAOChQNhV4C1Fjmf0qAcB?=
 =?us-ascii?Q?lKEHalegPADPOpznWyDKTQmYC3tfzlBg5aJ2PFiaZCG/ksf49EYx0TJVlly9?=
 =?us-ascii?Q?szFSaD/SLy6vW3Ro3vos0n7s5eVDWfQpm9Rt2Ok9eM7PurhSZ6cMGQ9nJGKP?=
 =?us-ascii?Q?PePFAnn5uCOVMtOHcCftyVtK8/sp9s7O01ew?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 13:06:48.3743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b663a9a-b423-47c1-198f-08dda431d4a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7754
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 13:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218014

On 5 Jun 2025, at 13:03, Daniel Turull via lists.openembedded.org <daniel.t=
urull=3Dericsson.com@lists.openembedded.org> wrote:
>=20
> I checked the sstate size, and it slightly increase using core-image-full=
-cmdline:
> Before: 2454884 B
> After: 2456860 B (+1976 B or 0,08%)

2000 _bytes_ for adding all of the source information to the core-image-ful=
l-cmdline sstate?  I know zstd is good but that seems a little low?

Ross=

