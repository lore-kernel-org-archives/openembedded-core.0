Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F25CCF2DE
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 15:20:12 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37457.1792423211834393529
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 08:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kH97Mr3N;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kH97Mr3N;
 spf=pass (domain: arm.com, ip: 40.107.162.1, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ft1cXn8R1xcgxl59jMxRD00dZ9Ih4GTPAq+xoRc2m1a6OihFAZ9IJ6CS5Z+8me5Xh1jq9D3mcxuhPwdiWghxOlV5BerRn87miz8sUpuSPhiR5vMNFAopg6IH4/73OghNw2QIU4drSfgHeZMBkD44AoXFagp50l7WnIkq08XenOqkw+20RPraVJh02GqzSAbJcBJwCx0mwCV9VBI2Zk/rCDVYMz+Ge4rWvGd+IgklaOD+c92azLHQt/rrXB+N2U1+BT8rFf8Hr0zB9Ph1AT9vGS8/dQ/YG3/tChgWth5VWSVlqE7pPcewwmxtTxczIEVinqIWF3xPiDq+c4sGbd4wFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D77bc+PdkQj8Ukz6k0f4vn2P4eUR1mi9yyHmGfHOJAM=;
 b=Pe8u8L+hg75K+voRWcE4XC8bhY0Bb8TAMhc+8B7Zkgzu9lpYqYyHuEqDmWPQiixbcFFjmOb8zLyTLESLNID6EQpbDm+NVCzy3c4PQ/Xtby4PLRgZQJ6gweChpWxZ4HBAwJGuFONWpySj/9imaKHNipCDCFWnUu3ue84y9+uJuTlmjn6ddQ1Vr4fzPtDECJRVU49VJwytDnUqEd2/8ieTPGaISNLXUTJys4gB29jjxHp2PRUcdQqKWoMgDArdjqB9B2c1jcCuY39N6mAc8sby3MhNrHTJqso8/Tc5cikaZAElquIY8muiDJSMLjFqGq/DGrIs0PRY61eoimERM1RauQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D77bc+PdkQj8Ukz6k0f4vn2P4eUR1mi9yyHmGfHOJAM=;
 b=kH97Mr3NLijsZHUeGDvyWwmnEngjh2K3ijqDFDGNNaTp3sXi7ElIIQicM/6WSUrSJaLq1oWZLMn1X7+vC+Ky7W2L8Zb3T9RbOaThKhnRkZ4B50C+ot0E/X4ZXJ9tpnGxo7ABN19m3ra4erITpXfAFh41WBJmuaAl/5scO8QlOnc=
Received: from DUZP191CA0035.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::27)
 by DB4PR08MB9288.eurprd08.prod.outlook.com (2603:10a6:10:3f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.13; Mon, 19 Oct
 2026 15:20:06 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::18) by DUZP191CA0035.outlook.office365.com
 (2603:10a6:10:4f8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 19
 Oct 2026 15:20:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Mon, 19 Oct 2026 15:20:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JX9qqH/1Fi9NgWoYpsce582CAMRr5rURs77625NSc0SaQ6uVJTkwkI7Cro5bFxBtVtX3SiYNBg+btYrltGyQy9M9JRi+rOfZrWlKnoYbASmzP/kav88daj+7e9HyikFI+iAZEE2slKD0aNfGV941n+4uGFRPa1z9or1jk/zwUNX1KHm5Tdwj/MqDuhk2+iJvvFx5jFkrHTuxue+f+QwSQcq3i0Vn29G8jcarBOK4V9fkX7CL7tZpwM5NxIJODy9zAyixMaqwRbL1sxC5eqpCey/D3EwInhiKK//diHZiGaisTQPKJKYAs/Qar4QcD2xYuuN++SZ96XLUGjhw+S/TeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D77bc+PdkQj8Ukz6k0f4vn2P4eUR1mi9yyHmGfHOJAM=;
 b=cUjVN+CwTg/sgHZ3aB7TR2J3ZiOeMKTJmODOm9z5yVg3cz6Mk7wB5Dxl3UYjJsBoCEMgHSTTPvnUmW4qdlNU6t0fFVTeFFU+d4e5oKGG0BjFNIL/4ds/R3P6TLLgbr+V94OQKfQFRlFi3n10NgOzvMWh9I81IXCxdw7XKxm7wo2Q8vjWC3TH7RnsgyyOka/mbd2CS4b4PhW6enwhc9MHPzNvKuSqLUt0sD680/EdbLQ7BA34C+AukPfVC1rurSX9VoDX3zk/XqFSJVXFI/33v9pbu/zr0r9Wj2o5+3ztImBqvURXuPJ1Ej/Ma+BxWZbult8RI/pJFrg70GW96JNaKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D77bc+PdkQj8Ukz6k0f4vn2P4eUR1mi9yyHmGfHOJAM=;
 b=kH97Mr3NLijsZHUeGDvyWwmnEngjh2K3ijqDFDGNNaTp3sXi7ElIIQicM/6WSUrSJaLq1oWZLMn1X7+vC+Ky7W2L8Zb3T9RbOaThKhnRkZ4B50C+ot0E/X4ZXJ9tpnGxo7ABN19m3ra4erITpXfAFh41WBJmuaAl/5scO8QlOnc=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by GVXPR08MB10916.eurprd08.prod.outlook.com (2603:10a6:150:1f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 15:19:30 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.006; Mon, 19 Oct 2026
 15:19:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libfyaml: Link with libatomic on targets
 lacking 64-bit atomics
Thread-Topic: [OE-core] [PATCH] libfyaml: Link with libatomic on targets
 lacking 64-bit atomics
Thread-Index: AQHdXo8oTypbzDv4L0a48EtV3sivlrcE/UuA
Date: Mon, 19 Oct 2026 15:19:27 +0000
Message-ID: <04ACEAD8-0C40-48FE-9561-D0988EE53D57@arm.com>
References: <20261017232743.1871823-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261017232743.1871823-1-khem.raj@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB9410:EE_|GVXPR08MB10916:EE_|DB1PEPF000509E6:EE_|DB4PR08MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: b6af524f-303c-4279-c4df-08df2df4740f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 6MNHsVrAwCqv6S+TzDVw3IY3zZRraLG0TdOdWcdNR0KZqJcL2a5BcjWxuOsFSXoMHIfxDDIOMLbePDmaZBC1gXVOC+yC0oxZdmjcDOTLHKrxF7FQWx615PQ/rFg/mDN7Zyv4+3buo63hd1/YfSjpFHHpsiOPvDkxUJUI0ga5gbYDU0yOunDed5YzBnLpA8GVy0XwI47tKB4R9pnhS0bd+Rnk3sD1tqjX86EUHBdVN3WLW2YqEaMRmcJ8FtJukEtSKv20oiu2djORxeU1KFwkto75ymxs1eOO+iNm7DCiMxi5C8CsTSbZ3mFP5vE+9bDup3s/tXavHUK1pSf86p7Bukz6wL0+IHevWhTcfvjWxGKXj+tHxPg9Ww/0eLMsbLV6ofy6zgz/35apc07Q5MkxlEZNnbwH/V2SDK6CcftfTBCpbPWA1VDQCbCQC14awDJBH1kKIcE1qiYtMFDTEE+DH8gk8l8q6e4eEtgHyNzT2qDuTvjtna0VY7C7jJHsTVmthcbZylu09q3QGnqkSdxBHs2oJZcE8Vy7W/sl3YELuUzvn8slxrsot6ZPHe6WqSQJhHtRFl3MfxH0KR07oliWaNQGdVARfpuphgnSpPl/csaYGDHMgUOyeQI5t+J5cqu6JjxlubpL72eEheNV0BLblTlIn8Fgy7bxri54cfbDig4zmFldrmYcqUx+g6cfM3hRAxXepwhdBxHwfLTOhx0dnw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <82650327F6FADB44BD08BC57A391F7EA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 lhLCXQLwKmM0b/VpDiRbwVrKAkKXQMaZgL5421cp8vSA/S/CgEpZtdQqJLtG/UY33zt5UYTc3/xCXVxUNIH8evpQsneFpTfiP3BVIcDSuar6EEVPFhqTPecpeqSr+n8EVGAEvE71R6A+b4fTM6+oMHJHFb+zVF8woCOtnz9UT77XWJDKmWA4U49qlGg7JvLCMsLYHDlfKhC9cahbC2TQyrA+qnaM/qi+5J4s0j//qI7B3s619KbkVGSwxSERgXQho27K/80VbCztjhGkKIjD6aZ4pQFdLNNOZbWcvfdg9KIQvZHpemsS9j6ZhY0XkHEo2DR7/zO6fPfzd9RxWuLe4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10916
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	48daee6c-6bf2-4414-b611-08df2df45d8d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|376014|35042699022|23010399003|36860700016|1800799024|18002099003|22082099003|10067099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	mkegQIDRLTphOnCDwHAPXig1naO5aL7MO+DlVmzAZcVFBe27Y0NRIchkGE5eWlzdwWWFQPSizz8go78sfutROL1+ZzzLp9Uqf6eegYgp0z08f2NHEpL1KQMBqPzUYy6SiRgQm36Zb9WN49xWcRtNwmmYZlOAaC9k5bg0BAsKw2pT3IMFMc/impWVXI0aVlx3qG6iBG+9sDsxjaf67+Y8HYvGQfyR3G/pHV+3dc9tvoUSb/GtavULhABN74w1D2O3/ePdzobTQw5Bw23774Bu5W9rofeb9VM7VjsVpmTpsO23Nog2fD/z2P00yGC5EVMeASNQmoVpmWcZmkO3PskilHsa9iDB/s/SDl/gjnwpFg7Tudr8bv14boNY06he3MDiITErdEb0R1M4kXJRr9UNkS5cPz9suHbgEtATeJgrpInN4fr89UQssbLIga2vwoLZ5+ZH65toGNmbQ0vZ05ZPaxHtc9z9xcOwqPsUbO2uk2dr+jcSGaYCoRRQD9s2MvpY0QU2UByuNH4c8a/G5RpI0cQBrWJfV1Lareo1IRNvPWotnOabc5nr8ToEXWDFcg1DhkxlnON8rK5a57e6+GSmEoS148CzkOi3Ej6W01TIIZO0Es6EoCZ0J6d1MG+ZgLGsD8IFeXDCHN5zBoTi40mm/f1YoKNRNayauryPMoC2CuxbcOKicOTP+VDG1t9DZKkUM8FffESIpQCfDm9rIatYKQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(376014)(35042699022)(23010399003)(36860700016)(1800799024)(18002099003)(22082099003)(10067099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XrMk5IcTindxCz2/iqwNbV2cE1AXWyUEzTTpBx1556x25yEwq+DXGWsZz1Yu7suj8WeYSfn6/8qseFeIpI9Pbf5x/qg5/l/pi4iZQZxb+Rk7egHM6g6aPNAmYJT/dWn4mJYEUD31+f8lCkE2FWmBAKHfjHX/WnR5mVLr0g4ExrGoSdj460cf10xYStsQixJHpR9ceBvvgyaXZTjkrv5CHTjlUCzfBjWj6mHFPT1scydg9YpYQ7xFZyMBIcsFWmc5eCPLHdM+f3c6s3KdjjLoo4rZxNBrNnWM5ErdgqzLoae7alT8Pe8PYdIUMhyOLki0BTzs9LfLP6gStATiNV3wRyejY9DjH5FiDA27b51OWUKMXSUp4LNnTbJGwor7soRVBxwyeQ+HeMo/d36jkKOzv2ID7WkVi4Uu6/u1Q7hpVtpVaNtTN90JMNgqFXnVyre2
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 15:20:05.1875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6af524f-303c-4279-c4df-08df2df4740f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9288
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 15:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248191

On 18 Oct 2026, at 00:27, Khem Raj via lists.openembedded.org <raj.khem=3Dg=
mail.com@lists.openembedded.org> wrote:
>=20
> libfyaml uses 64-bit atomic operations, which need libatomic on 32-bit
> targets such as riscv32, otherwise linking fails with
>=20
>  error: undefined reference: __atomic_load_8
>  error: undefined reference: __atomic_compare_exchange_8
>=20
> Match on the relevant TUNE_FEATURES (32 for riscv32, armv5, o32 for
> mips and m32 for ppc/x86) to add -latomic.

Did you report this upstream so they can detect it automatically?

Ross=

