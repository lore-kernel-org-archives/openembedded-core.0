Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63C8CC6B0E
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 16:47:15 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2422.1791910030051128274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 09:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rr8yUTex;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rr8yUTex;
 spf=pass (domain: arm.com, ip: 40.107.130.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gqiBlRIsrFjOCOrvXYYT8Q49b1WQjLcZVhkC0uLZd+2VmiOnQ1zSE7CLBNRR+GzERaKIQeBMOP861TXI/4r4BRhfmY46Iwrt6xPhBzSdFG4rwmiGrNW0KvQGRcrNAsTxwoGvsrqB4qU+QN+GbujUvBlppdXkidvcMlC2QfoWfuSCmUXmPbuQEy+TVBJiBL3wB12Yr7D8jTnAQb3XCSUAR2UxEiexFzQ7eMxh3sDyr4FlAzhIiPPy298XbdIJAkpXjN9IAbLwS4cuL99jkQCZwOrdy7dfPKXsyEvp0rftSt6Z+9NkXx1FzDMVasVmLwVYHMtAniVdC0f9qJQeWWKLXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MRbg18hoIotXn9d/UyYUjzbTCVilR1yFU0EXCGCqW0=;
 b=W1gJ/k44h0QC/KrYpdzUSZ6vQY4wpd4/Pd6P34bOjEkbY42nKxcHZC9oQeuygPP7LuzIN+f7W2n+8JG21xa2iBB/eAj6j68lcyaqLTVMJb82Qln1J/Z98cWyiZ9MO1OKbDZA5s+aMn6f74dDRZF3w6Xae8aZPAzZXmlXktH/v2tBkzCX8HmopeO6xYuwQnR/KI6NN26l22fIlOJWwBdcPTLlGX2TRNTITigjyclTpRLfM35GstMGpotDY5NWvYNOeMQ8iBPo0L9VbNuLSZDZ0xcjJjVAZn2p+s6yfOrDnKr6z5gezel90xpTAnjmm58rXozeZumUoJ9upO+UsBi4oA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=konsulko.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MRbg18hoIotXn9d/UyYUjzbTCVilR1yFU0EXCGCqW0=;
 b=rr8yUTexL9N4NeW07cbOM4O7RCMhchcLGzap903vySy7KaHTVPJPP6QYI1BlrE3X/mkvgiZphS6fxTYaRHe11YfrrKq1d2iBg7+yl+ovKbAWn+4A1DChaq3vGo4vrYlbDIH0Dz8o8WLH5ppOwVeYi32aC6BmhlSTdAeIfqSxX5k=
Received: from AS4P250CA0006.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::8)
 by DBBPR08MB10461.eurprd08.prod.outlook.com (2603:10a6:10:535::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 16:47:00 +0000
Received: from CPH1EPF0000052B.eurprd05.prod.outlook.com
 (2603:10a6:20b:5df:cafe::52) by AS4P250CA0006.outlook.office365.com
 (2603:10a6:20b:5df::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 16:47:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 CPH1EPF0000052B.mail.protection.outlook.com (10.167.241.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Tue, 13 Oct 2026 16:46:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJfX2Kxq6u/D016QbFQAWc/9eEKqq+/qHUM8kJFNZMeey4s5G0pygz3EkTZtxaMg9mXQ72bFnrF7rgkRWColHTDpV/MW+Fd7mcpYIQvvm9eE+qt0JWOd4H1kUOx1fgp2npWfS8rm/wO0r3I1K6Q1JJHllw3yPq0SHLDcltBB6KbT9dEe946iLff9HphXHqVa2VqLjQry62vd05plsqBvTNuedQLuLpLHBofZ0xymbQaGgmtqLC+mskBGxZzhxW81Ht36u5VlFwlU5GA4YrzrdGkpnkGQ2f+7+ZEF6lyG6h7zvzYV+XxOMfdzrO0q42M1RnsAgO96BGfMAUsXQ+ovmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MRbg18hoIotXn9d/UyYUjzbTCVilR1yFU0EXCGCqW0=;
 b=i0qXGm0Cw/woRhQv2U8Ifay7ljikMnqKHwrE/bI5d5UhAy4Y8ypkr3zijb/1h3Yj8SyP4l36BTsyW6WOOlDW9k5JGpju9dmURD3mPP4RLMLO/7rcr77BIdAHiKpqBWxKkEBwiZnLSfC0WsEP8n1omZ651sJPQZrmGbd8X2/1f2sVDrJBlITbyokEEKdrznLf+Kx1AX6bvnsbBc05ZcFOkReO2aIY8ad6LRlIAGg7n+uM+yXc2MyzP4mmb9/xVyHx/N1jSL08UCqHvu5I9xceBSHRVXnazBZocImmkEQ26NP1dPLl35l/0opciI6EmOILhfnu9evrfWygb/NkWi5owQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MRbg18hoIotXn9d/UyYUjzbTCVilR1yFU0EXCGCqW0=;
 b=rr8yUTexL9N4NeW07cbOM4O7RCMhchcLGzap903vySy7KaHTVPJPP6QYI1BlrE3X/mkvgiZphS6fxTYaRHe11YfrrKq1d2iBg7+yl+ovKbAWn+4A1DChaq3vGo4vrYlbDIH0Dz8o8WLH5ppOwVeYi32aC6BmhlSTdAeIfqSxX5k=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by GV1PR08MB8258.eurprd08.prod.outlook.com (2603:10a6:150:89::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.11; Tue, 13 Oct
 2026 16:46:24 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0522.009; Tue, 13 Oct 2026
 16:46:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "leon.anavi@konsulko.com" <leon.anavi@konsulko.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] python3-subunit: Upgrade 1.4.4 -> 1.4.6
Thread-Topic: [OE-core] [PATCH 2/2] python3-subunit: Upgrade 1.4.4 -> 1.4.6
Thread-Index: AQHdWx6wJo230scwGUa8jzYpCpuPtrb7rnmA
Date: Tue, 13 Oct 2026 16:46:24 +0000
Message-ID: <9F10311A-D627-47FB-8145-5106C2EBD720@arm.com>
References: <20261013142450.2456130-1-leon.anavi@konsulko.com>
 <20261013142450.2456130-2-leon.anavi@konsulko.com>
In-Reply-To: <20261013142450.2456130-2-leon.anavi@konsulko.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB9410:EE_|GV1PR08MB8258:EE_|CPH1EPF0000052B:EE_|DBBPR08MB10461:EE_
X-MS-Office365-Filtering-Correlation-Id: 51e6699b-b9e5-4430-a869-08df294999a3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|4143699003|38070700021|18002099003|22082099003|6133799003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info-Original: 
 4LgN6W6Eg44KGiyUXbi74YlPaWXWk4zDPIB6ZqQtBzUBi5/C4ySzjUHK3c/GWnVf0C/LEUgsWgoRgQZpo6KM9d0o2zlfzVC8OpU4fd4qg1SB0eno06voDaetGgvj4ZelYNb2ZovfoOj3jFNq/UBurz8qcxpNdPYExoenixqPpDgFSEnkq4s/g9G+xe/D83zqDczFSMqCzf7btkCXgqyR107s2U87ihAnH+4b9Yd489WEdHNDklpqbci2bhiFFh/GNQkVg3QKtaqU5n7wD8W8qV2GCqDjcvzD/oQLQq/fxWuA7LwIJ70kveivn8UT7x9FJFpGYwlh3gwrhBHxwEIghr/h4Ssjbkexr2aYKl0EHUgeH2ghaqvSy8v9p3H0L/YpDyL1ChMyIgmgqBdlgTx4q1+GGbTNFDAPfI4psopuejIubSXc9CfJEwSudEt5vpBZbQHff3xSFeOSPKE/ktNcHGEzqAInbrEbSPM03EN+OPXluGvGysvRVLXWW+oYwMYInqyTvElAhh8n1+I0Jfd90mYpMKAnHzcnzSmBNeCj1Ny284JsN7CKQqUarUCawyfeKP409vWqII7rs7NUKRVynpiKUaEGOc8vkg4vj0xVuxjyQQKIH4xmkwoQkJy1g1Hsdg1bVa7VwfpVFIUNaWrPZaSXVFs1BHlSbSQOr4jann1ujs7hWT/utYLK5yfyTNvcrPa8rLGYcDD6oiHdGQplRJQcVnXaOdIl36Au09qxUSY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(38070700021)(18002099003)(22082099003)(6133799003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <78F8B6849A1C684E924412179CEB9866@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 ijiY1SjalYsZcWVu1TWVTPRLeU4ETo9S9Lk7PI6CYuoHB4j2tXjWCUwIJyHZcN7yDkTl+xf/zu2PLIYYodevoRUgK2BbtZegZeS7+SMCdBm6S0T2YOgAFIJ14hTnhYrv5Rxn2E2Yk1zPtCm5PgC+gNrcVXPCINE2no39kqZ0f0lRsHiCbE/dShxKeBA9BSfxKBq610QhCk2mZTw3IlqA2ogtHL0RITjjWfHck4unyKJ7ZNludgLWP8YbCq0Ino1x8NqQ8wZZtDk2U6nF8/XX/PHpPngOC0HLItCszCLxDJuRvKhRiVmhTRNzuMmTEKeHQNCSGScfSKJrsP7jCDGhzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8258
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 CPH1EPF0000052B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dbf189d2-9b89-497d-a62f-08df29498482
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|35042699022|14060799003|82310400026|23010399003|36860700016|56012099006|11063799006|4143699003|261009223027099003|10067099003|22082099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	hQnuHA9Ik1Ebl32LIM6gRL0DvFF1BDVM/pHctAOo279ljxHXVuE9fxSdY0i0xcJeiN4KsoJHorKOx6i2mwutlARLyoj8+gbORV4EfCZeguTl+REFTLM3cJ/2aNhrkB1SLg4K/5uzWgO1aE+mtyIsOOCBHlqCbhoVGc/hc/RL3TOcUIc25SUNzLt+NihLHAnhw+GcVTgMesS/3HXm9jiLCwsiM3URUHIof62vj2BluKs2juGD/6NJwbJplnIB8AUY28qFz60OL3MUVO7SKdm/7XskIdalOEKCQmjxLDr/wnL/Qu+1ezWikMGOTMbMauTHxni5wog3ifhqsYiBxVCp/NPV8+FjZh6Th7eneVzJSBBczMcGgczEpaEQ0qo1jGG+CgPynWQRCGtYboIXVehiMyAyvGLS2XouLJDKYHGKV4d0q/75J9FmfDAOLu0Fbc8twVPtryJM5BSPII32MmB83FHLvOY+e4WE8cVoLjZyKSv5sBJezQgbcAMTxY6VNnReGPxWQIKWcKDoVbH/6KzJyyyMhzGLr2WLXsGEA0pL1YbOIYSOjTKW0sVXvTY9dCa5UP+GZs7PWvRR7sVGNnWx+sUL/rMLGu6eDZh3E+VrhPSTdsX6sdIp/F1MPY7ECrGbsRjRmd4c+N9Xby/tg13uk9mQ+066OoyGbXRSr99w0rNQm29r1ksPlrdJHTnE0bAih9bFYNRkM3x8J6IVvcn+lg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(35042699022)(14060799003)(82310400026)(23010399003)(36860700016)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3anmdxQRW52BTC18MZN9826TVZC9OsR0jayHtQuflEvGS6bX4GELLfCAI5rZMgFmFT57GfflOrHNlozHOmTVO4varGt/mD5dzEV44AkWp7Dfe/OPgDlrcZ+EmkhtuEnE5vcfvKNqvdHxcWjGcJx9VznCHbmlLkWe31W9a8ZDkIAtTvYDEGCNFxTXJbptM7vkYpGoOd2J0aM72PrApRoJad+lTkeLK9KFT48dSIdvvwyVaMi1If7rZB/2meaX5JCcabsxPLS4pQW1nedMKhNugi/zYYQfGw1ucbDuo6rIL3q06OkrkPNwgBZ6GCr1UuOlp3esFUh661aoX+W0cfgeJuA4xYWf/UurRyAMuB7L2HnnuC3k7KwPZ24ukz92hfKqU46gatc5ng4OYRLtuC27KXLQIUp568FsGd0m0t50GoXEEsppCBCpMrjVvPvCEvZY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 16:46:59.6099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e6699b-b9e5-4430-a869-08df294999a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CPH1EPF0000052B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10461
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 16:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247731

T24gMTMgT2N0IDIwMjYsIGF0IDE1OjI0LCBMZW9uIEFuYXZpIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxsZW9uLmFuYXZpPWtvbnN1bGtvLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gDQo+ICtERVBFTkRTICs9ICJweXRob24zLWlzbzg2MDEtbmF0aXZlIHB5dGhvbjMt
dGVzdHRvb2xzLW5hdGl2ZeKAnQ0KDQpXZWxsLCB0aGF0IGFubm95ZWQgbWUuICBJZiBodHRwczov
L2dpdGh1Yi5jb20vdGVzdGluZy1jYWJhbC9zdWJ1bml0L3B1bGwvMTA1IGdldHMgbWVyZ2VkIHdl
IGNhbiBkcm9wIHRoaXMgbGluZSBvbiB1cGdyYWRlLg0KDQpSb3Nz

