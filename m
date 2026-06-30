Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74407C43327
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:18:29 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17148.1782811102536137654
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nn5laGR0;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nn5laGR0;
 spf=pass (domain: arm.com, ip: 52.101.66.32, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=f0fTdRZtk+6+W5ZZ3VyQ79WYXQkBl6uZdaC8yb3+l4AuO6Ux+Mo8V936QBwFMAoE8adN+rDyxtJBbBank1cOop8tWr/jDc03/TB1PQUATqLoMoL98p5YXmc4QerCUDAKJ6ItPH0f9J3326QnlLg9yicTiKc5G1gDe8j72XRqYLnqkdh4/bW831uDrfSNMsl96cdRiE+HsFtAiLeOeNaA1/YtixCkvbTKyTMC7MRUv4iY4H0xNbgQZBqj8DpesaU0q1chA2FzGw6lWXc6VVq+6N0IfVHenZzU9z/nPWF9BWhWdr+1sS2dG4HZ5ebp+ac43XwI7bKWlW4uLJxf3ZDbyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDB8VQMnLn9BheaxbUKGGJ8oL+qpMVgfmbpthGSWGAk=;
 b=w9/hzeNBz4yrI9EHBPYzldSrj43JKkMruXvcg3FS1VlIE+r2ARvLm4VSkjqNyPSPPn2CndpjPrmyPv/onhKhliJ0Jhji0W7OWcN9552GVsey/DflM+1/LX67vrkxRqTJDT0RZ7Y+83mHLWUnqxXFIKMTY1R6ZCh0cXS5Jaz3lRiDIi+QtXIQ2Z0fHrQHfHkXP7DUhBQA87hdNEh4CtS/KAWFfpXS1QP3y5NSR91G1KhJWnaOr7SsTQT2Wy72WKrV3vhdLhb0oHlQchRh5YZGpcTwj0sArfG/QdyMCD85jyuTKuRkgRrrU+VO8NmGVD2Peno9H6B+Dr8u3Dullr4qfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ericsson.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDB8VQMnLn9BheaxbUKGGJ8oL+qpMVgfmbpthGSWGAk=;
 b=nn5laGR0PznyBGe0CV+EJOX2nccs0G4Wwh9ZPoYKrFoYZru4goepwIYwyXjDx9YVSNKnSGSJLVh4chUeWq4ke7E2EzBgoS0Zqqok7n2iOaDUzqcehfPOpg6TN3dYwWkFv6EXzcyJTFkTPVC/swg444ZQJpBCkR3AHaAoy824QPQ=
Received: from DU2PR04CA0232.eurprd04.prod.outlook.com (2603:10a6:10:2b1::27)
 by AS8PR08MB8037.eurprd08.prod.outlook.com (2603:10a6:20b:573::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Tue, 30 Jun
 2026 09:18:13 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::3f) by DU2PR04CA0232.outlook.office365.com
 (2603:10a6:10:2b1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 09:18:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Tue, 30 Jun 2026 09:18:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsPzSXQGqrx9onAGpZRbSMj6YqRxcEZM/MIC6tIVXNoKgLxY73dh9mwkinFxuTkzpo5OVlslk3CTe42kazrhjvAyEZ7eIhKE5ZC4CoQ55TwRoYL7jegfPdsclfuWyvYvUmJCwuW4Uw3pxwrfiR+8DZHIYJ+k1hQnzZL5ZH+hUuYiTwFJPG472WBqXrFli5QOK3Mbu37iZgh6XVwljitB7DSZ+tBAjUDn8suMPdGC6r9zjXKZLqp6EDh/pz1qp0O9tjipIDBecfnpK9ziNSF/JjCt2IhE+Hly3QUaDxblc5OfYxfiORTl0CJ7PCCn43JCDewsyCfYdp7I45KtDvsTFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDB8VQMnLn9BheaxbUKGGJ8oL+qpMVgfmbpthGSWGAk=;
 b=JKEMceFTXzXeAhkvNfT8/4nJObFXnagi4elBiA4wQN7DcFqB9U1azOxlb9KOGnsuAw7o34ADvlF214QM+nFMWvufviUifPo8LxLMNMZZrlnNpNfIv675R6y0kGjO6S5aPQQBi5EirDx7efhPtIMIyaQCJPVgb3Kaog5zF5brWQMPRKGktIF88QZZM8VbZEtBniCf7a0BFu9Z24/9ZxEQrtqJIar47xDrqOAVpUYnwpVEQWZ9WSGcgUTZzOQMZt9+F5V89cBEY2ABE3skoHeghek5U9ieRD3vG+nkG5/Cs1p/uC1z32ls0rFXWKt+3MpX8xn8kJYyTHPBwZTjzLwpiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDB8VQMnLn9BheaxbUKGGJ8oL+qpMVgfmbpthGSWGAk=;
 b=nn5laGR0PznyBGe0CV+EJOX2nccs0G4Wwh9ZPoYKrFoYZru4goepwIYwyXjDx9YVSNKnSGSJLVh4chUeWq4ke7E2EzBgoS0Zqqok7n2iOaDUzqcehfPOpg6TN3dYwWkFv6EXzcyJTFkTPVC/swg444ZQJpBCkR3AHaAoy824QPQ=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PAWPR08MB9496.eurprd08.prod.outlook.com (2603:10a6:102:2ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 09:17:01 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 09:17:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Daniel Turull <daniel.turull@ericsson.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/3] classes/meson: use ninja explicitly when
 compiling
Thread-Topic: [OE-core] [PATCH 1/3] classes/meson: use ninja explicitly when
 compiling
Thread-Index: AQHdB9HatQvDJH9KxkGde9TjEmuiMLZWwRYAgAACAACAAA+igA==
Date: Tue, 30 Jun 2026 09:17:01 +0000
Message-ID: <DA367819-E672-4344-B7C7-5A7D2089A0A1@arm.com>
References: <20260629141559.1305873-1-ross.burton@arm.com>
 <DJM8EZJFQZCJ.2860UZRX5PB0Q@bootlin.com>
 <ed70423e6ae6dfa9da7e739fd3c59a8f041a8773.camel@ericsson.com>
In-Reply-To: <ed70423e6ae6dfa9da7e739fd3c59a8f041a8773.camel@ericsson.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PAWPR08MB9496:EE_|DB5PEPF00014B9D:EE_|AS8PR08MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dfed2b9-493a-474d-c33d-08ded6888270
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|23010399003|22082099003|11063799006|18002099003|4143699003|56012099006|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 n1ZIg9nSOivszjFpWk6+d5gDH1Uxs9XMr0DqQENugLnjHq2P26dJODm3oT3Xxm4SRUeAEYdE2vnMxTTGEuycOngrkXbciC69kvDVaYjIh3bd8ESacE+mGUgCiITB1mBeNbCpgKjY4XtSUpQ4fDrDktreJMbQ047mcxgiPQYoXNQIQ8RnI5V8ZlDwQSDbebZ1F1EzRZ56iNiNsQyg0xt6HSYz4fJ9DZHg+y9lYP4p6GWCNPscCbt3sV0NOUD9QbQhUW5ETCW+I7kQ621lJ/Hl4OaHFmvtUs76kCZ06fj7vdYDbsVOQvrCSoF6/BNjSUF/dJbviSHWetOGp3pd0/ts33wD+jeDLXouKhO2/BEiwVr/PCBtOTN4PZfiCrUh5cKF/IQEFoerFPqQfq8MxrvxqTVd4xWBTE4HWdZn2PKj10N8TtIDz3MF+mj5IqH9UCVcjoydSuPwQT5Fwfvo6tIxT4JRcyzB4LnyFg1KGYgylq0eQjcv+pwIIQKzRPmhT+pqHIgBaQfOQCjLjyfu+5KlrVdyVWVsiAt+CgYc0HnisxW+lRjUdJNBx8X1wyOcpjjJwM6ppi2UhOr92fw31J5F9I2n9H/hTxGvUANTmgPWNJnlu0NfxftqIdUxHugjXRme/uFhqKIlG2IaeK/KdGwe71ugtfx9SueAhDRmroJOGi0X9g0KkNmIj0jSxMDd/dWHWZo1aPXvGeMEUDx3Q6EMfvQr3dLiCvjaggjhBIAXcXA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(23010399003)(22082099003)(11063799006)(18002099003)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5585B33ABA68FF43A63B36594967BE72@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 AmX2guLuFEWugGHXhdWhZMUvGahZFOZsXZ5XUVOn1c5pAohoGJm1Jo68T2edcDmGMNg6izMNAQD7MiwUbfVhhbUikA7MLspACiELa7E1c3Vm3InlA3jhC3OIg7n2HThLuIjKoBvvYqN/tbdAAIAZ77zVLryBnQORcMSvQ+J6L36B9r0m8JqGoIhUKzRa01NDxEJfj5D6ZSby+UnJdKJW0w/n1BXE6yIJ0c2XRIZB7JawA5c95P5ZUxm/ysZ2EzctD2uT47E7KWtesBOnEYFSOJd96cXNpP3NQ5gWrSlWHnZdG0i9kZ9LnsQ4TycNvke0PUAXl9mJVCCOchEvVDdrzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9496
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	989d2f1d-d50c-42a6-530f-08ded68857fe
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|14060799003|35042699022|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	PiLCUs/NNl0LKFHzsDb+pYlIANnlIqEECJYBPmK0rGyrMP4Ki0R8VWP2L5EDB1+XO9LS/OegSkfrGhz/Fhm1OZnD9iiSB/131pjPfo3kEWzjWAZ3/jB51xllvsZNXQWl3zgjzSHZf0iSGiCVrWA5//yTF5vJA5bzUXP55MVkrYFrTevRxg8+jA5OySK59JFFNGw48Svqw22cyJ/CEToQBzEncVVBG7NZ8ldFRpt9bgI6MFi9JjLs3O3aQvufOptEPY9Zc95SJiJHPjfxkzdtkNK4BhPbLrZYNal9HY/66KOyTknfP4+Ims0Hku30qn/Dreu3abDUZ/94Db9njqMHsbvOff7H9TXNR+7c8VIOQpTFT6yV73E68Sn79h6mXgqAQxfsheJsDZ2N6ErOKohZyEQ1BtS8IluDjG0mshYJb7OQo0ylyUdkKf98OsUScZC4JiAIA+U412sSp+tjTvDHiFESkyRwsD48yA3j1dgLvhd58E8FQu3QhgH/KVqm2s9RskEVeyiE63v4HysFdXeSgUtzVLECaFpVb961tTrmKcwclDTk66Lt/Y2y35KrBV1Yi3OM/2IyDBb3RI5SP8OGtfOoHEzbbWt12/BpNvukP20K/D6uB0Und4j41eWflwh4Nxxw+lhiA3umU5Zx1jTlG3SkyQOV2juIUhqF0MjhplRNWEPCp7HQxYoXYaZSDQLZ0LWUMg9WXwJ7NzN8c58vxQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(14060799003)(35042699022)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/dbD6yokt9q95LMNND5FqxPtxunoLuSOg3fCBjKkeKh2Dj9F4wDxN1XTbKYDYSe7Rz0fsMannF3iY6yFBhWRiyEexX5RZ1wzGiLMsF0Jj3Z1GoQV5384AkMz00gFnT4e44vgGd/KKBcm/c+ySapIW5zxthf9ggELmYdxeIfmSL08FDkrv9c5gPcu2Va57utRBM5+4+NmM5zqjzgHWFqfKDP2VUC8jMfuo/+b/Huv+GV8D2zVH3kFEK98E0DqlP5JhS4a6S5Lai80U3UF+P92NUIzBJipadIpW0PoYP7rj6goYijMVF29MVDk6uClDl091/eytRHh1TGJ077/66iXS6Jf9w+yWHX0XXEhZhrqX/SXCyru8AvtCmpmDau51YaLtdL787CTREpEIMtu01nKDeqq8MBhWXZ4SZn3rITFerQbF39XW4LCyW8eKizooN0S
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 09:18:12.4542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfed2b9-493a-474d-c33d-08ded6888270
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 09:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239871

T24gMzAgSnVuIDIwMjYsIGF0IDA5OjIwLCBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVy
aWNzc29uLmNvbT4gd3JvdGU6DQo+IERvIHlvdSBrbm93IHdoeSBpcyBjb25mbGljdGluZz8gdGhl
IHN5c3RlbWQgcGF0Y2ggZG9lc24ndCB0b3VjaA0KPiBtZXNvbi5iYmNsYXNzDQo+IA0KPiBJcyBp
cyBhIGRpZmZlcmVudCBmb3JtYXQgZXhwZWN0ZWQgZm9yIE1FU09OX1RBUkdFVCBjb250ZW50Pw0K
DQpZZXMsIHRoZSA6ZXhlY3V0YWJsZSBzdWZmaXggaXMgYSBtZXNvbi1zcGVjaWZpYyB0YWcgKGZv
ciBkaXNhbWJpZ3VhdGlvbikgdGhhdCBpc27igJl0IG5lZWRlZCB3aGVuIGludm9raW5nIG5pbmph
IHRhcmdldHMgZGlyZWN0bHkuDQoNClJvc3M=

