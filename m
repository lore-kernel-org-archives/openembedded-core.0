Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83630C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:52:51 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45064.1784717566664652646
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mLarol9T;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mLarol9T;
 spf=pass (domain: arm.com, ip: 40.107.130.32, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KqjI4Z1uI11hKxuL1asxX/VAGodnNFvQVglideUoSNYDUaHtpdS8MUsDLFRGGJjdSoipusZvD/NS2NixqzcWvPASN7kA/fjnflAW1sxvnqXF8uml9/zF9Xg4v1f30w1hnH9w/2KXTIK4xBJGtKaI74e+Q2zgMb6/DzmPLTMkB17skrO1CPfdQpMZkDyQOdRNvNvDxGG3hO4xiHWCmQleW/ZtcIdNl0JsKKguktSoyqJUqK/9B1TnKzPyuRpezfyp1UNA4bMaL7DPOdfIQDhVJKGjY965Zqg43aRgvHSoz2jQGzuA8NygVCL6DUx2zPZYGxUnjcBZzeUzwWCXEZ71lg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icydpdyfvJ8vaf2iN5hRHOasXd/YRGcSleXJiJT8GYs=;
 b=tsE+qAHMEKUkYutH20BJQ7dgDcxX2EJKA0SxpWUmdC2HX0yFcCbViP+UwUBENO2J9YneaaqUEKqXnxK0y2pD2bVXbs5lDDt6/v7Ihy3auK9t7rJuvBND4Hiuwg5n2sUo+twk4B2roEKRWFe2gongKC+cLLyjEx9Dh3jsWHbXE7RcRwzqHqbggZJ9ThBzjGRUwwyUrxTTbHmE4r/bzGwTOvqYoG5xRwYRUyogJ/W4M/BnxaKon7X0f4ZD/HinkVOiZR6HTuiApVzuW8VuAW46Q6R4cyTecuVKSfrXWw2h/i7feHbkcj4rLP4pZFzcmb5WFNU/YP05f9rKqvosgsRIug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icydpdyfvJ8vaf2iN5hRHOasXd/YRGcSleXJiJT8GYs=;
 b=mLarol9TaHQnVzSQRFLf3M0VNE6Tg3Pl4vSt198w+lZsDhdurTlUI3HFmwnZKUjzuH2DsHua/qVt9KQNFBLADeCQu/ANA6pyhXPuqmxO6WWO69ErQXhOPN4w2h9JTEY5eP2UXchaJH3r5rWE7qeqRXHZv/2vFo/RsThhWXTQDMM=
Received: from DU6P191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::15)
 by AS8PR08MB6423.eurprd08.prod.outlook.com (2603:10a6:20b:318::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 10:52:39 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::2d) by DU6P191CA0014.outlook.office365.com
 (2603:10a6:10:540::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 10:52:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Wed, 22 Jul 2026 10:52:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNE+S3dEAGFMQlSWnX0smFh4xplvrXcogdgTgzjR0xk9lpYJp31XC6ZLSmsZeMxpBz9EGOX68J0i3BfvfLJxQGh31awCVbKZlK7fuiGAeZNyWlsR14wXInjPq+dg4fe64rWCyUSjEJWrYG77xhKk8YNT1fu7fyfNsFKAA9wqMPaGwwjhB6Zxk+hCv5paBPrOLfIgEdV0CBG5joWWnRlGG57bP2OgBklYAuRXgkQ30LCmNtVN6zveAPwarq7W3aCmd/FALy9eknBExSmrbPZ4Hjf4Q+9R1JVAdKs3yYi8KD/8hXanXbSHs3r35W2e2ss+nddx2klWoq+cJ0VWMoLAhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icydpdyfvJ8vaf2iN5hRHOasXd/YRGcSleXJiJT8GYs=;
 b=RXCS4HPvBRp8j8p+fQQaX7wMuX8qxtdnbMAVlXFWNdlBu9drxOAER/8WCApTlEfiQkGVGPNBXcSso7yh3pM+8iNDiWMaDOKWHGNk0XP1bMwzLcdUhJD5Sm1M0kal+vo1RG8FHClNTuCi+LVlV3yq7zDrafOAqVrO7QPf3v3tcSQPJSNRz3RtRFTrQlrLIfhy1/G3c6y1DSnMIJUhloGL9k8gLOlKWtgH5KUhtCn/Qz40O6pGT2vpHDJQWJ+JIsohlYrKuS0aDYPV0LPSTSxXwAEmtSOP7nReHNdvOOBXamNGu9Jgp35ARsCmPxeCc1np02v03VITyZKbyqb1u2aHxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icydpdyfvJ8vaf2iN5hRHOasXd/YRGcSleXJiJT8GYs=;
 b=mLarol9TaHQnVzSQRFLf3M0VNE6Tg3Pl4vSt198w+lZsDhdurTlUI3HFmwnZKUjzuH2DsHua/qVt9KQNFBLADeCQu/ANA6pyhXPuqmxO6WWO69ErQXhOPN4w2h9JTEY5eP2UXchaJH3r5rWE7qeqRXHZv/2vFo/RsThhWXTQDMM=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PAWPR08MB11454.eurprd08.prod.outlook.com (2603:10a6:102:50b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 10:51:37 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 10:51:36 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Khem Raj
	<khem.raj@oss.qualcomm.com>
Subject: Re: [OE-core] [PATCH 2/2] libpsl: convert to meson build system
Thread-Topic: [OE-core] [PATCH 2/2] libpsl: convert to meson build system
Thread-Index: AQHdGAmn9zbPF/z7NUK3Xa4phrTuN7Z5YAIA
Date: Wed, 22 Jul 2026 10:51:36 +0000
Message-ID: <62CAC1EA-8756-4E01-B305-EDF0FC5EFD3E@arm.com>
References: <20260720053526.1992240-1-khem.raj@oss.qualcomm.com>
 <20260720053526.1992240-2-khem.raj@oss.qualcomm.com>
In-Reply-To: <20260720053526.1992240-2-khem.raj@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PAWPR08MB11454:EE_|DB5PEPF00014B9E:EE_|AS8PR08MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ae956ee-2ff2-47dc-62bf-08dee7df5975
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|11063799006|4143699003|38070700021|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info-Original: 
 j8LzU0+Gtt1xJMNid4UO/B2f74HzeERkULLtaRBJsYZfv3unS0Rg+QHB3nwy0xqGiFGCmmuvDTiwf8rMT8Cui5eqsXrt0QByWaCQpdF65B+QRZTf67Ou3R2SpYSFrinoAphe1r/aE5CcIc0/vTh9YUoLWPQCS9LEk7a/wB81o+QOw6/bErGU2A8E9vNB8vEveVeW5a01iUwZEnD2HUVPB47CmcTWyD09czTsxC2J77ll4tC5+QjZqb3EkbnppodDXfoZmOKX/K0NMzR1m6Q1GOG5j1E2b32ENyKAyXwtGRRj+3IaKlYPCODGhjIF4aXiZK9M/XdqBPg75u48qBXEcmHwfhsu1oC8CYpJS/MHZWwja8rUvgu5Rncbby0MsKXkKt4ddZJ4KofPgt7gi99rubdg12Hpe4UH+shYXlw1B/wLPRTYKk5698t9o8VPhVuWu8SKC8Ybn+GOFOZPSAkjDzI+E/lhuH2uTT/HhmCv+vixoRrnONoHroBwkABn2YJ4l3nKXnQaV1ShliUCgLREydnOx6lK4bwHJFyUNNMDpIL7vCawwRoNHKuFyjPIY+7zGU46FfZPwS7Etrb/PSLBf5zRLuiR7/YDVprPuNTFkja/MCtLBSgIBsgxzfn29Sk+WJLoGz3jlFm9U6j+sI/zJzawu/uYz6I+uGrGFWcvdWOxlK61Xe2aN2Hj9XaCIiV8Nd6nDs98HZrHNa6wSdro1B7rCDONTO5/Hy+HfYsXutk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(38070700021)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <50B3E9C3779FB44EB4B93FD7721DB020@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 IhGARO+XOVYl4ogVhSsCmw1BJ8mXkqlrCSogPdBH+u09tPkUAxDW/vkOnuXaiQ4cXa8lE//fF2c6w+q7Sli4c4g6nv2DjfBYlkNNZPYW48h0nRRBGlrblhRXi8Kkn65Vm//HUzozIeFvoX4tsqlVGl/D1q7nvriHJqluFYy1DF/9Ywq0UX0VYiiA2uNuCkAgDNj5MFpeOMG3MnGAN8d7cl5Mxd/Q9AgCK9PV9dR+upOn/icZuOAzBLeq1OYP6hk0ptA5XH5DgUsMIFu48Kn6w229H0plGE/HC7KNZAezXHnnmFjl3n5ny3joeJrwVV4s5BKLjxgdCc26TlfxRCFE5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11454
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c0093d4f-ca23-4d5c-3bbb-08dee7df33fa
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|14060799003|35042699022|6133799003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	MuiI2KRR8YbMrAxu5dw7dPALrjxEkyjB9iY/oPNQT+EjqJ0ZPjz0zkQha5/nha8mosHLVB4lnzBGHCBfM5V12N3iWXq2D8dmuy/0f4a+nRIlNrWczskgzI54ycwpQOM5WKULaL3dPoUrF7HzZLjmLDSskbQV+iU5vqQMaooxReSTp0Uvc5Xv9SXJm0ghG5URfgWQ58WkfAUKqHhxz3rh7ixf9rg4u3JVtIQW2hDuNeK2eyxNZzhztZQg8ZOrs7A26Ei5AjhNEmc0Hxc5/vDZZJkBB4/B6mdd7j3jV4IBtK23GEUknxen0ZH3DOpj1Ag2Fl2noLG8GRBCnpoFX8QaW1GyYs14I11b3roVqZG4qzHO8ueS71mKKZ2FkxEbgYiFNvvC9yEiIvahn5mCi9PIkWZ0nB1JrW3iQ9awjmvPmSTUEQu2kc0+TnWz0U2vaGDnNy+/nY3jJHhxzXapj3PhG91fkm1miUPeUORg2MR7tl3SE/oV1dOaKmeF0Sru6rdznz5JkYdhqA4TTw3BWRKd0clOaqRK9he4vVWtdMCnImz9MvqPrG7tDFbKl8CkyGthBTFDyyO7Dle3DOvdEDsGgX1beWl0nkRs2yMUqwLdnzHKIfULJF8TK/6Z1n3MOzYPEYobjsq5CTlIwmgj/UpYYYQjQ4vmWI1NXgg7GpY0M8Zb86mucnXDeu/aST7D+MHL9lGjEGmNgh0z4ZYo5vrj3A==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(14060799003)(35042699022)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	HQt8uwQ4evxBgEdJur5713TOwMV9cvyDTZ6ITn7B8qBb8BwgKT2C7A6NbeQV26LndFcSId3qOApj8+xTb/tqmkW4M3vRyfzIfP0xUc+pxwGWQ0V1v+Cjb7n4JUNcijDc0T7xHdWjpelfgiB3tt/OhfJUC89QAKF9CeRwKJWdMHMS8WHBPgjF95xedB3f1Aqz2PnC/e3gG8/0OhvhBcO1Gelj85+v5DE/P5a0IatMnczJv88XUQrfuJMpW2oE4CWCCENCaZYamiHbHmggLbp+9lIDV6Dxr2QDJ07n4e43H+mvHUeqXnJZPEx7lbJ9q7DdxfOTRO2Wy7whhqxgdZUon1WsIyBHao3fk9enE/us9CA6sn3RSi2mtJfjkshN7XeOx6KcZRmoMOpNxFWhxF61V55JpV7ZmS0ZPCG6rL+4IPDmIo+zBRQELltY39D5/Jtf
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:52:39.6738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae956ee-2ff2-47dc-62bf-08dee7df5975
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6423
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241659

T24gMjAgSnVsIDIwMjYsIGF0IDA2OjM1LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiAtIGluaGVyaXQgbWVzb24gaW5zdGVhZCBvZiBhdXRvdG9vbHM7IGRyb3AgZ2V0dGV4dCAodGhl
IG1lc29uIGJ1aWxkIGhhcw0KPiAgbm8gaTE4bikgYW5kIG1hbnBhZ2VzIChtZXNvbiBpbnN0YWxs
cyBwc2wuMSB1bmNvbmRpdGlvbmFsbHksIHdpdGhvdXQNCj4gIG5lZWRpbmcgbGlieHNsdC1uYXRp
dmUpLg0KDQpUaGlzIGlzIG9ubHkgdHJ1ZSB3aGVuIHRoZSBtYW5wYWdlIGRvZXNu4oCZdCBuZWVk
IHJlZ2VuZXJhdGluZywgc28gd2hpbHN0IEkgZXhwZWN0IGl0IHRvIGJlIHRydWUgbW9zdCBvZiB0
aGUgdGltZSBpdCBtaWdodCBjYXVzZSBwcm9ibGVtcyBpbiB0aGUgZnV0dXJlLg0KDQpBbHNvIHdl
IHNob3VsZCBzdGlsbCBpbmhlcml0IG1hbnBhZ2VzIGZvciB0aGUgcG9zdGluc3RzIHRoYXQgZG8g
bWFucGFnZSB3cmFuZ2xpbmcuDQoNCj4gLSBNYXAgdGhlIFBBQ0tBR0VDT05GSUcga25vYnMgdG8g
bWVzb24gb3B0aW9uczogLS1lbmFibGUtcnVudGltZT1YDQo+ICBiZWNvbWVzIC1EcnVudGltZT1Y
LCBhbmQgYnVpbHRpbiBQU0wgZGF0YSBzdGF5cyBlbmFibGVkIHZpYSBtZXNvbidzDQo+ICBkZWZh
dWx0ICgtRGJ1aWx0aW49dHJ1ZSksIG1hdGNoaW5nIHRoZSBwcmV2aW91cyAtLWVuYWJsZS1idWls
dGluLg0KDQpJIGhhZCBhIHZlcnkgc2ltaWxhciBwYXRjaCBsb2NhbGx5IHRoYXQgSSBoYWRu4oCZ
dCBzZW50IGZvciB0aGUgcHJvYmxlbXMgdGhhdCBNYXR0aGlldSBub3RpY2VkIGFuZCBhZGRlZCBh
IFBBQ0tBR0VDT05GSUcgZm9yIHRoZSBidWlsdGluIG9wdGlvbi4NCg0KUm9zcw==

