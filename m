Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B46C88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 11:02:46 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36383.1789642963896049769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 04:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Oo/Xw2vq;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Oo/Xw2vq;
 spf=pass (domain: arm.com, ip: 52.101.83.10, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BikkhlLLXKIxWmBLGE695HVX4IZOZqqMw3DTDLTpa/+bjRak79m8dBfpZGTCwQ+ZhqP8ElK68Ria70lBep5EyFkwSTbasftvLKcIngbSdtxkhLmg/DioSQMoel/FDIFLraBHWAie83JETarPb88dDMv4i8wduSy87tsF1toyXfIHpE7SPKa6u7HkdgkAFGIks2npvk76IDZ6dnS20ZQz7UZPPuhBjgPt4URSk0XAVDlKFseMXl9HWnMC7Un/nAsLvN3ADHP850+B/4R8c+WKjF6M9qREj+VUC5SoPPeoyGrlRLd53sHsn0SYK/peJueZyaCmhetp/sRcnvX0RMvjkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9l9gxw1l4uJYonSDjYOLmGeSsmQd1U/qcgTAWQxac0=;
 b=GaoqofF7OAiDGoGJy1ZSVu0Ufv+Gcgi9QuHgyuRAwLIQI6Id1io61OqoOCcTTjG6JR3t55X+q+PK1C1nccUIgE8DUdroOT6qICLqUtyHOpIqigJlKPz1Mo/dhq5phgteF3SiRqgtJZeMIDZzjxlHzX5u70U3OWkD/i46hPQoxJ++abBTYRg7d/IKg42JtFM+NgYJz1tNjepeY6COHqXYfEH1b3e3KBt8CGt3NwNQ+XUVjB0SwJoYEEBdE1HSaNjnYkqjNO44H/FE+/pucv8KHytSD4YE4lIfEH4KtFlv8+kZYyBlUedOZHKI4X/RvjZxovDzHNmK2XKA1Af1+1lnnw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9l9gxw1l4uJYonSDjYOLmGeSsmQd1U/qcgTAWQxac0=;
 b=Oo/Xw2vqvtvgaKHePRljZcXnMdTpatcZyGFzXZkV2ypbvMZKu7OLugL7uwy+V68Fxd53V9zlbFvrxC0M6O5rstulYRyTXEqvigY9jZHdt18h6XqZA37LeMgxBAugQRR/iZSCS3V4oOyi6rpmaK4bixXxVvtC0y8buC2qYCTqYZ0=
Received: from PAZP264CA0251.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:239::12)
 by AS2PR08MB9522.eurprd08.prod.outlook.com (2603:10a6:20b:60e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Thu, 17 Sep
 2026 11:02:36 +0000
Received: from MI3PEPF00008489.eurprd02.prod.outlook.com
 (2603:10a6:102:239:cafe::27) by PAZP264CA0251.outlook.office365.com
 (2603:10a6:102:239::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 11:02:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008489.mail.protection.outlook.com (10.167.240.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 17 Sep 2026 11:02:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyLxad+Wf9WZNQ33JCpDSjcybHuqs4ph5uFTrwMj3xzZEF0g4teiUf3YFUeBYMpX8duZz2NOhWfk70LWWEGH4EWt9lBRIxPtSaKqI1nidOzaHZngDYtdqS4IVvSY9NiThwHrDJes5jqKk4QOARQnEafeoGU/4TfOwHXTmXRwGo5NlVAOn0lVxQ55stPekux0V9YVenLN+EqubLjwokCmPzE+ysm5VdfzU4oQZQUbKKbwe3RogwZaC0VVvmEjN0UUAAyOayDb/2Y7WwobVzJm9myrywCbz5T0ds+pIkoQr4Ug0yN1EYA5uXQ0zkImA4n/iEN09dGZtZ5vwnsy625lzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9l9gxw1l4uJYonSDjYOLmGeSsmQd1U/qcgTAWQxac0=;
 b=qPKKV7ybf62zovDzqEh9oCA9y7yVLXOBJ5fK1GNRAUuw9URf9EtksyZ9EccfKB4MdxUOj28DetqpMcAONXjy3TgCUG+91LHi2aZYZLO1pgvGv6dHtTDX2R5egJojsRajX32eRiKMXXESnyEsh1PP5KqKSZN3oNo9xE76F/Z8Aa6sRuOF5TLwhE98L4LtOty2FA1RkiNSelnNETkwCRN4DDvBF3sH1uUa8izRWjLzEhX4hcm3hRRJgitLOcmAvBA8Sjld1c1O7E2nCU6sEvSUPGVdo9cM25qbqado5h7a6DeiqWLMGR6cG2nD0XFkit/4hu9tscZTcgSnE1662UcgCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9l9gxw1l4uJYonSDjYOLmGeSsmQd1U/qcgTAWQxac0=;
 b=Oo/Xw2vqvtvgaKHePRljZcXnMdTpatcZyGFzXZkV2ypbvMZKu7OLugL7uwy+V68Fxd53V9zlbFvrxC0M6O5rstulYRyTXEqvigY9jZHdt18h6XqZA37LeMgxBAugQRR/iZSCS3V4oOyi6rpmaK4bixXxVvtC0y8buC2qYCTqYZ0=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DBBPR08MB6028.eurprd08.prod.outlook.com (2603:10a6:10:208::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Thu, 17 Sep
 2026 11:01:59 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0451.004; Thu, 17 Sep 2026
 11:01:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/4] libfyaml: correct upstream version check
Thread-Topic: [OE-core] [PATCH 4/4] libfyaml: correct upstream version check
Thread-Index: AQHdREIHLsSpTovqYkalBk8Wi7U73rbSn1uA
Date: Thu, 17 Sep 2026 11:01:59 +0000
Message-ID: <3594263F-7B54-4C7D-A145-A98E23B6567B@arm.com>
References: <20260914120925.1153614-1-alex.kanavin@gmail.com>
 <20260914120925.1153614-4-alex.kanavin@gmail.com>
In-Reply-To: <20260914120925.1153614-4-alex.kanavin@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DBBPR08MB6028:EE_|MI3PEPF00008489:EE_|AS2PR08MB9522:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e9287cc-f662-4522-6682-08df14ab2cde
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 ViMEBHZcqBpA1adAkKG1gbnURBQ7MZjKSjk5bOAWsNyFlO+W0Z8sSC8yfATlEJ1g09vUTaLg8yUs8hLU2ny6UkF28SHdd7m+rFwqx6C84Znxm3aeKqUQ+SHi5U6LZZDUWDJ8/pV8LtQxTT+cUkm5UTbZnXz8asjfLBci18i3BmDH2ACr8K/T0bk7xXiy4q3vjrlU0mAF68mNVEg5bGI/ujtcmjF0BhbUpiso3UwXqBHwAzznmZwt0azxWsZReeFoFXwchGSZxxWYN9Dv31hRxL13wwImp1eZO2lS8mpZwGUfLXBNxUieIhTz5AnzRTCffBhQQ8RYM8JDx+wMXaJWSBpnT52C0AXYDT8hl5LTi77QlA1PhSjK48VSxrz5Ytx6qx/RqQy4ZiCxygkVMfeCBwUOBbugmfYKvzjFIRsS7EJbc35OFQrkf4i9q62NClRtebxBTiyX5hYZiYBA7bNAdAi4KGMoBn8s3hNnwDrKph/MnY2ZLKKv3lt8Q9JniTgloga3k34ndicSxo2qHP9RUtzFIakSPhUtqGKd33p7/uECFzxCOuhwoebe8b7b3LN55CNBIPq6LfnPZxa8bNlqodQsVcIsHk5kA3mohhPPmODTscnHU0LYxcp6c6yMRBu9MTDPBq3Pk5aAViLH5voPFRpMxBrJ7nG7mU2k6Nk+kFvMOCPfT/sbCdk1cHgGZjkueFHc2S9s1i58/0F61mnSXuchZuhKcp7Bm75fEao5aHs=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7106DC1E6084E642B400BF2CF756548C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 R1audp3kx5RIZo8t3kanWZAlzeqetwDKyTlVnSwdztqjMRxQxNtuimwv7awft/SbaLINYfGP0ypb6WcW7Z3akjTNWUVq5Eoj8NLQEOcKyCWjh9+A15mHuS5zPqIUavNvsxrE+UJFYflLOvpTYNuqmnv9wKdnmlWkfIV9M+sydB3GOKIeyAf4vC52zxjCb0+gXavU/ulTh+v7paU7KRSwQCIoTC6AsT7vDNQxuTEqdn8N9MHJF55VApdGlhmMs7qP74DLtj0YcKTd5mseT2UkRPRpK7CosiW9sUzkvRm3lIH92enO7uy1udubxf8KkrJsv8AOzFox7GyHiN+45YOaHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6028
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 MI3PEPF00008489.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0b013c40-6f5b-46f5-5c27-08df14ab18c5
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|36860700016|23010399003|1800799024|376014|35042699022|4143699003|10067099003|56012099006|11063799006|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	QhAdfPuRSKy+xbxIzgHCDBgu8UHSHiZJMxN4hajA+CDVXFuxmp4Aik46VmVUt3gcTPuc4ui6fQlQ/UVYyPMiYtD4uhw6g3F2g+sZbGL1JcUH5lllriPP1j4NyrkysOeOOi4U81Ev+g3gUEKL+STfm7TMU+/qUIKgSJWZx66UmRcUKSZCqM6LAOj00exrGQLvK5roCouL/oeGse40d3oYnfzZPnzfK9CLSsOZo4rVujCQcU/Qb+kyihprtrxPd4NNGwNfixWduyVAfY3tnimEkD9htJNBxHUyVqwKgDvSQqpixnHA3HcqeDoMmbwScVwLQ/yOSgjdtw3H0punHWYhy/BI43BIRWn7OgMliBSPRVS7dyxH0lu5Nydg+DMz7bcCBuyGV0E+BWAg4NZSwiza3eYdivOdzx35O3fSFU9MOXmr+4+k5QelEGkzKXHBTz42g4fszN9iyQsix0FQ/9VukUKOgLcKuZhbZ713Uflfc/VcLN2bd+lc0wnAy69C/CK0QsuC4b2K1OByL2QPCcm6chkACR70WDEs2kGLpxFYQs4fdAGME/bcymCWfi3fn9asuF0ZHWWFYL9G75vd6+NSTiuWaLSJ07965Kf447k3OHxxRKNA1DrTN8VfOqgqpnETu2a+9A4V8qRrK71p+/IA1CRGzZIquz8jEygdm5pwsejhpZ5HrHeiiOk/awgXZfHZvdwdkNMjc7ShE9uRIbauEQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(35042699022)(4143699003)(10067099003)(56012099006)(11063799006)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	v+UiPOk/29wwXmQTeI0+RWjdFuObavXm5WTc1miXfpoNjC7eySSapQXazGjHXo/E18U6o2ayrpVal5wY5JRDvQIfMX9udbfoh4PR3ffQ4K/x/n3ryjb7C8CyNuevj1VEO2Yhsm46Fk5q1NlNXSBBkZ+im2ZEj4HL6udBG4dwJTOFa6hZ0qoAqMR2Ud0y5rbLryVShAEx4RII1Dz96h9PJ8UMtjKz8Hf3/+je4XyP7EffSFMsmwe8t9DuIrz/Vm6Ns0V+axPzE9H3gP4EsNhesWngQWBhJu06W99pidwLvjSbRk0ut49K41Hx0RYxuOleSXNXaJr4YaL6j4P00vO9jsgWWDBUR6a0NJg/LFuo1z9V6oAZmRFjwy5WBDPEjCD9ubooAdQgxATp+AIXhoVzW6xLBSVdhIL7AkRQ1Np1BCCvA1I1e8He+3rOvEKs0lPq
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 11:02:33.3698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9287cc-f662-4522-6682-08df14ab2cde
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MI3PEPF00008489.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9522
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 11:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246054

T24gMTQgU2VwIDIwMjYsIGF0IDEzOjA5LCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gLUdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vcGFu
dG9uaW91L2xpYmZ5YW1sIg0KPiAtU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vcmVsZWFz
ZXMvZG93bmxvYWQvdiR7UFZ9L2xpYmZ5YW1sLSR7UFZ9LnRhci5neiBcDQo+ICtHSVRIVUJfQkFT
RV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3BhbnRvbmlvdS9saWJmeWFtbC9yZWxlYXNlcyIN
Cj4gK1VQU1RSRUFNX0NIRUNLX1JFR0VYID89ICJyZWxlYXNlcy90YWcvdj8oP1A8cHZlcj5cZCso
XC5cZCspKykkIg0KPiArU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7
UFZ9L2xpYmZ5YW1sLSR7UFZ9LnRhci5neiBcDQoNCklzbuKAmXQgdGhhdCBVUFNUUkVBTV9DSEVD
S19SRUdFWCB0aGUgc2FtZSBhcyB0aGUgdmFsdWUgaW4gZ2l0aHViLXJlbGVhc2VzLmJiY2xhc3M/
DQoNClJvc3M=

