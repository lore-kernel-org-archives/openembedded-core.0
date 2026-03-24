Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856C8F54ACF
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 15:16:58 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22258.1774365411866308232
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 08:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VCKtOjxd;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VCKtOjxd;
 spf=pass (domain: arm.com, ip: 52.101.72.32, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yzKffEkTrNEir1oH9ASghrttVj6yqexvX80UCw/CPaFeHgeia6tP6z1RfZVP2ux7yEO/K/EZn3wTUe3E2YCGgf+961+pzQK/Ns7hu60KDnqCwosI+qgT+5wheHx6cEcDdj8ueuKgaXVgvfY3TL003Ct8gmtdtdtysA+P9+uDnBsdVV1pwXhUQlN+xPSQ1edbqdSSnAk+edkd8Ab8Zwvx/y/pDQbKQWm31mPmyipn31wiN6TMKPSBcNmrFR7FNqH4gkUcWRfiVjuA0xmhLVozD9qza4nAt01qvpKyLK8xdF/D8L4PTSUzK2CJ63m/Dr+KiD3dcCRDvwYDNZDUn+8whA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJ2zDrlIBWjsOtyZDdqtA81svCWDxpdkThNThkQ9MJc=;
 b=ih+x/vNh0RfMbzeuTPkAkw/VJSo+sdWXTDp4QzRbJ92C4A0T8lK0ur6saoPRfWWloMiOu465b8E74E3Dn1RI8DN4ie2m4doFMqFUeL5UoyIs/ShPVPPVSgQ19lIQM9CHw8IwNoAp4Zob4kdqqa3pzxHgqm3r1WXD02FllCaTzYb1Di61+B0JT+2ZJ77wsXH2PMoZYcpvXXrftQYkc01yp5MloX5AI0bcsiqbxqP3M426nUqPQWWoyKxxpWGcw/7nnlD8IKblmoHujB3VDMP5X4BxhR6K0e9Wg25TLVhpRCONbD5tlkoDxpJQUvqjOJAgelFhpp7LFbd0N6+Lf7cqrQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJ2zDrlIBWjsOtyZDdqtA81svCWDxpdkThNThkQ9MJc=;
 b=VCKtOjxd+jUdkljNCRJxexPD/8tsNXaa28A/1mcO1q8cYWpKuQhl+ePIh6fq4d6AchO5dfoJ7oUQNe7SCm+fJLSTUb86QTsQILql8EEQwZu4voywm7f3omhYa+4/RMNtN/PBhEqUOlVJqSOKwuWIvcHPpRDvZOYiflFEEl5tIYQ=
Received: from PA7P264CA0435.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:37d::13)
 by DB9PR08MB7794.eurprd08.prod.outlook.com (2603:10a6:10:399::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 15:16:45 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:37d:cafe::ea) by PA7P264CA0435.outlook.office365.com
 (2603:10a6:102:37d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 15:16:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.0 via
 Frontend Transport; Tue, 24 Mar 2026 15:16:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kl1o2xzMMXu0DMAPBF+elI9K4qH925y8lM7yQ7xxTN7Lk+sQWX5QARF8bCjVZPaTZcftoI+IEZI1t/nfpjuoCL8Pus5LFx85duAoin1hqZvQVHe6LTT7vu64j4/i1RTTpf1884tpbprHdudyyZAdcQFhKvmF0CwJ0kvKDy4F5QjtWqamJ5dQuiM0+Yv2ZeLlpk3jbyGfb4T8pfJcIX5K+hiqAJWsBqv4REAFM/rcf/mAE0J+T0tA66quOZ+gZIJZ+AujrgTNSyUPKkkS4UtXGIDCbdOVkjqlgyaj7zlhm2nqHwlI+ZFDP1lOWLvnCRTJgojnyT9YAAcUbVVp9cP9sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJ2zDrlIBWjsOtyZDdqtA81svCWDxpdkThNThkQ9MJc=;
 b=PvhEFTkfPzJ+sGmQjIpCR/b/kpBdPNEwnnpGkv8sEG1FHYzunBAw9NNhDFPZnj2ds52RKtsy9nmKEn9Ov0fYnKpVX7+BOTpp2PmbQCxVEP0sNCAMK8xMQMoJ9/b8oiTC/WZi44lef5aUVjivTV/bqOW09D4hnANzWDTET5Hsn2j1ziz6S/zcvEdG4dVkRCGgSEhs+gbzVFVhfFOPVmh7IxfrwtKlpr8Y6xjFOsKOJ4FgnkfzmbIzki2nbSRLxyRLwvkxd5MRA7t+Y0U44dZ5JHPyRAQfCA55PgY/yYCVEsS1q9BSzPj/UNtxNHAJC78C76EK8CLj8OtfU43AVzN5tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJ2zDrlIBWjsOtyZDdqtA81svCWDxpdkThNThkQ9MJc=;
 b=VCKtOjxd+jUdkljNCRJxexPD/8tsNXaa28A/1mcO1q8cYWpKuQhl+ePIh6fq4d6AchO5dfoJ7oUQNe7SCm+fJLSTUb86QTsQILql8EEQwZu4voywm7f3omhYa+4/RMNtN/PBhEqUOlVJqSOKwuWIvcHPpRDvZOYiflFEEl5tIYQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB7804.eurprd08.prod.outlook.com (2603:10a6:150:5b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Tue, 24 Mar
 2026 15:15:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 15:15:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liuyd.fnst@fujitsu.com" <liuyd.fnst@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] gtk-doc: upgrade 1.35.1 -> 1.36.0
Thread-Topic: [OE-core][PATCH] gtk-doc: upgrade 1.35.1 -> 1.36.0
Thread-Index: AQHctfDeaW32L89xuU+z55bgHBoinbW91jYA
Date: Tue, 24 Mar 2026 15:15:38 +0000
Message-ID: <03973F2A-A04B-45F1-832B-150E7CFE813B@arm.com>
References: <20260317093125.10898-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260317093125.10898-1-liuyd.fnst@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB7804:EE_|AM4PEPF00025F95:EE_|DB9PR08MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: 2229449c-6f5c-49f4-a6c9-08de89b85c08
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 EUucNcf0YBPvR3b1oaikm2lQOCXCGVP2KfbYivaqqve1naA6/Ivt710F2YsrHs+ZkKJL1I4VdAt1YVESu1PXXn6szSYI0WMvIp0WAjQs+7AJKpfJrWffSvXD+QGZLypYeDCl7fjLDmwS1cVaP8AKhhysuDguHWlwWaBYv3HTGSitcbLV/Xoxxv7gRmftxiLzrk6wM85/h5oplSQf7NBMM4UfhqjyWk/SEVrLhgbtdxV+dnrF05aI+WYqJAi2L2OXe5bpQsKG3fRpwZbaic9ZApNSF6bvhqL2ykdaKdhwPPFmlvHZ8Qd58QYEL2N5/WkHs2VagkLXbVK7KI8iOz1kW4TsYrIPxITaF5dWhnHIW/qZwQOIeWcNZ5qd+c03RV2A9GpY5O24PcYugOuZxoA3RwkgKeNKNU6o06l7MyaEOq78oAbz/8R1yvQK8taV8doRGcLqMPaEhMfo8/IEX+M1UiP82BirrbWmU71o1+2rgCeCcdb5LxdKSHbE4R+gnFO/XwTz9rM8jWPBM4lp629YQjeJh/Gimtn3NkN9HlWdDqKt/6vIvd+BtFFi2k6GGCXiTYiASJp02uthYaMZz3MQTjFlJzEAIz7tG5KaVt6s60ObSZEnY2pO9I2VyvzKrgeeZgkxZGjWBkUb0HWgkxvAN2KlxoqdbTOhPYFefMcovWVd5ky6vjTAh9laCqUbRTR4O92EdEP7pPZnBEPQBkPk+GbEMU7qb0YS7/uNH6XNT2Mc4OfzexlSu6zgUQgmipLBDYrNxcWZ5epLhRNQ87k5GKp8N9kV9Kuf8yrr9YUUQPA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F442B195A633C84B816150B7241EF52C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 dVCVmDR80xllCnx+JD2pzzhPTXT316sSBM5kigvBiU8ZraRr+R28kQaJFGbkWMtUY8sfsumZ7zNAp5d59q/MAHP44H8I2C7f6UY4HSss/E0YsdTVLoowh9ZjjH0EAknxti6Ynek254B+bHspaDxkTwegwHacCxwAPg2qG9ZNnirg7iGkDWPrlfXuPN9WM8K1V8I6oTFyVLEj9RHezxi1x41toyNYkt4xaGHvaYBiDluXWgg60fLN0w0n08Dtptd5Q+VvNifJoJHt2Zbuoo80OV3QJNHiUsbWbqWY35v57b7JOTkJrmfA3Sao/tO38/CjMclyysalu5ePEb2pK8h4Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7804
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9d86e65b-3b36-41ab-fe85-08de89b834b4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|36860700016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	j1+JuyICR/twW2wfnHyNQQXRjBNCBkRaAKmgB09UcYc+02RDjLlonF1VqiF/ZyePv4x4Saox6rBKwpHJCx/ZOcEin0hcpqGF5c1lw1fXBztAgNG3G5YBUKDkKFDU1N9iQppMstZX3mlMGAO9E/zx8KTYi3d/VlOjAjxf3wHJMimsi2tHEOTDMKVW8ZmXDAVET9RWV5CtYk3fzXd8BRwIoHIV8BoKRWGlWTBo6EAUDxAlBH6B8b0Y5FzAQpeWWEcbmYdOI5gTMWQKxF8KH6mEKzg0fBctzcSFSrUYyYleMeorqB3Rm1XqPCveVANpSKuDlvQkH3utDrVHzNjuronOqW1WtIKoXwduel73r57c3n3zrnfnNfxC5WdmPdmB4NgZEv2GJWJ2JTGxIgxdDC4+BUy6NAEedWZYKT77vIKU7QL7Qbftas8P6Rth8lEHgSbreDYn6Ovga0QxzA9VwW78q8wllgvhfDepwCeK7A0yOPhtr6y8sn0ncZt4Ggg3j4qnfdgJ7VYjPH6bkUQ7TJVvOFXXNGp80IxkJJFj5EIfKLC/J6AwsfgGSxWsNuNDfAyCrIrRs2uYAr1LbzzitF6thDLq9WkeXoQ6pWOKiFwvBvL2IjIeaytM/30ZRT4fUl8IYeQxm5t42++G5yYPboUOawVYNIx7OLC6ktLxG3W/iSFvA97jeUMOuYHUKfDlyZRXEevVRC64yZ4Vp78Fwy7XiOV09BFUD9TDzUBZb9nImKC4aSRh8rveITFipCYN9ShZLVzsJDnGq6zptklnEI29xA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(36860700016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sXgCImDZQwqmDiv3VGYl7Z0tTRNLDVCkLvnfw3V7PPUtTPUKSya2YyaiDTmEjwj6zmcAJ5c3OCbiBm7q4+kLLeSS0WFoFl3xGERzLBuYV1up0rBJVjR0/wCwtAYf2zmzpGaatn7KiqWKusLC7gzBUFAZvmzcBQB5LZGxfFrT9lgpFBaRc7A1/RnuKGBUQkGXmI8Wezce4rHlSAOeOmZ42ruW4BclaiGeqzkHCaGsIWGt1HfODOWNunvtwtUcVHKgc409dtHYdQsbSqxboUVBEMXrgGG8gRUXtIgz95dXuzJVVtaggzDvfQjrljKG6FOT1RWSixINn3wJWO4PwmBQLyXhnEOFxFMx6iHFpHFJGioQ8kibNz07zgWi74C7oftamgRzV96XErwC6FzKcJgmWrVV12DxnnSfWSgpKhfHU9xelerfnajCyV5f5qcjGfS2
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 15:16:44.3774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2229449c-6f5c-49f4-a6c9-08de89b85c08
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7794
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 15:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233806

SGksDQoNCk9uIDE3IE1hciAyMDI2LCBhdCAwOTozMSwgWWlkaW5nIExpdSAoRnVqaXRzdSkgdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGxpdXlkLmZuc3Q9ZnVqaXRzdS5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IC1QQUNLQUdFQ09ORklHW3dvcmtpbmctc2NyaXB0c10g
PSAiLCxsaWJ4c2x0LW5hdGl2ZSBkb2Nib29rLXhtbC1kdGQ0LW5hdGl2ZSBkb2Nib29rLXhzbC1z
dHlsZXNoZWV0cyBweXRob24zLXB5Z21lbnRzIg0KPiArUEFDS0FHRUNPTkZJR1t3b3JraW5nLXNj
cmlwdHNdID0gIiwsZG9jYm9vay14bWwtZHRkNC1uYXRpdmUgZG9jYm9vay14c2wtc3R5bGVzaGVl
dHPigJ0NCg0KU28gdGhlIHdvcmtpbmctc2NyaXB0cyBvcHRpb25zIHdhcyBzbyB0aGF0IGlmIGFw
aS1kb2N1bWVudGF0aW9uIGlzIGRpc2FibGVkIHRoZSBndGstZG9jIHBhY2thZ2UgaGFzIGEgbG90
IGxlc3MgYnVpbGQgZGVwZW5kZW5jaWVzLiAgV2l0aCB0aGlzIGNoYW5nZSwgdGhpcyBpcyBubyBs
b25nZXIgdGhlIGNhc2UuDQoNCklzIGl0IHBvc3NpYmxlIHRvIHNlZWQgbWVzb27igJlzIHNlYXJj
aCBmb3IgY29tbWFuZHMgd2UgZG9u4oCZdCB3YW50IGl0IHRvIHVzZSB3aXRoIC9iaW4vZmFsc2Ug
c28gdGhhdCB3ZSBjYW4ga2VlcCB0aGUgbWluaW1hbCBkZXBlbmRlbmNpZXMgd2hlbiBub3QgbmVl
ZGVkPw0KDQpUaGFua3MsDQpSb3Nz

