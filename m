Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35EDCD4F3D
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 15:59:01 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15749.1779292736709983200
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 08:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cq8L93Zh;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cq8L93Zh;
 spf=pass (domain: arm.com, ip: 52.101.70.16, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=t8LSzSwiy7YhWyDNlHHGunKW4oAUPDjvFPjnN2haf0RZhaypdDU8Vr/uDM3gwsnYJzqYkFcSLSF+yWDNs0ne8qfK8/R5H+pBNyCKmS2l7Q3OFWs1hzmWzG3UaKu5vJprOmKf3ZZYnlocT8lU+P5onshbgQjTFLhhGKr4ZAo3LKwzagU7ZqoP8GTfKiX4qYsos47P9YkAoDiSRMOeMYX1J3cZM73Eoq0NxYrcPMwnOpqyFMkZQy2CmydBL473U3yxeXAzLet64+fvnEqpkUyEmSmcsZ73Q42utkSfxK9a7L4f2ySC+QkcX1UEGGBLp6oc/X3LAKx8l1TriblDRmQw/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fU5Gu5ESaM3UncQHNF0D6Lo2r+2Axvm6mKInz3OfuWw=;
 b=n4SMlLKkljmHeMvNbQ/aV4BAf72tQm+AjTwhcSz1mTHQyG2bx5VonnN8t4gkFWTDwBFt/kbTijFzP/NOHA9/NPLEMo7/pFgYAGKYwMdqwkPAEC6HYPLxBYChpf6m6BFUnmwVpiRYvRAEiWtgFRGK1DAGeGJnPpGgphEA+YHnlOkyHg5ogkghx+wZNd0zk+4w9googpsN7fiPSPaZGvrfxBtXQ+ZfcLg2NRE8D3Bp0CcNU80yJHyRkAsTc5C7rycOYD/71bTcqq3kIqPR8GqH4Y3ER+NpT1zCZOLVKU27yj2jNQRv3h52KU2gxWbXdgowsaHA+z3IzxWvg+qKurQdNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fU5Gu5ESaM3UncQHNF0D6Lo2r+2Axvm6mKInz3OfuWw=;
 b=cq8L93Zh8kQ1S+oe2Bq4rk7MNcp+rsYYgwHHy/oORu3O6RMRWa2EJuJmHK2NyGOSpifhAezQwX3EZRLqqJp3TS5ClvRDUH0c8kqFYECGM7NBvxb4AQvKTSINRFSab7xwTWctTZTzMP6pgeRI236aStiwQ8JzFI5fI7X70MwvHVI=
Received: from DB8P191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::20)
 by PAXPR08MB7393.eurprd08.prod.outlook.com (2603:10a6:102:2bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 15:58:51 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::24) by DB8P191CA0010.outlook.office365.com
 (2603:10a6:10:130::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 15:58:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 15:58:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrdY8hJesf/LlJT7+d7OCoUsx/wbWjpileowk/wVXDQd57Lyx17ZNfyhzHip5Ti+quyteDoA+5J1YF2owslAu8QNvXpNajjIEGkBzCgzMLt0sLfLUZmo9cVt8mE6G9fbxv9yWp+LQ92J178LyEHl1khhFwNbGWug8GHP/+kr5XH8P4YuoudnXuBxXcgW87pXKYEqYl+biBMe+GYZyyEqxHbQHN45+4mn5qPXYMX40dmfugddJAziPbhiLshCcUC7tm7Zau7FGQgI8mStZdbWnEEndCQuyKxkKqkg5amW+nwK1y7gkWptWUsQONDHYn1EMQeI005MK5mT/1Thcf855A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fU5Gu5ESaM3UncQHNF0D6Lo2r+2Axvm6mKInz3OfuWw=;
 b=lmpXB9q3mkk+IdX2dRMYaPljklzMvJxMmyHdbxQ5DFtZ9K5ropeM2Hsp+Wz8zc51z8q+TN0C+M+xj/MzgDCCTRITEtUWXeeO4Hy/XCjHorRzcSMDR0YREQWO+XnQLcwFTpr9XGhH1ZZQo4NKvR23nekpnmzNULiLqCRCp8e03hTfCi/LqFAHmcy8uk4gZgcQsBKLw5fpYKF57TfV08Myx1re5i3Zon5K4qTfEaXZ5zKsiMoe2HugoU4eUIzh1Y1rk6Z+24OxoN0iFvcnwldsWjIm3FeS+DIclrVwFrU3Iyh1dKCmYxjypwdffQajFqAzufn8aQbmaPpMtuNzNAPMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fU5Gu5ESaM3UncQHNF0D6Lo2r+2Axvm6mKInz3OfuWw=;
 b=cq8L93Zh8kQ1S+oe2Bq4rk7MNcp+rsYYgwHHy/oORu3O6RMRWa2EJuJmHK2NyGOSpifhAezQwX3EZRLqqJp3TS5ClvRDUH0c8kqFYECGM7NBvxb4AQvKTSINRFSab7xwTWctTZTzMP6pgeRI236aStiwQ8JzFI5fI7X70MwvHVI=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AMDPR08MB11435.eurprd08.prod.outlook.com (2603:10a6:20b:719::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 15:57:48 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 15:57:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v2] libxslt: add ptest support
Thread-Topic: [OE-core][PATCH v2] libxslt: add ptest support
Thread-Index: AQHc5sGipqsrm3femE6GXZhk8wlGXbYXFT6A
Date: Wed, 20 May 2026 15:57:48 +0000
Message-ID: <36EBF09C-B341-442B-8029-1DB9222B0FE3@arm.com>
References: <20260506092057.27057-1-pratik.farkase@est.tech>
 <20260518122642.31494-1-pratik.farkase@est.tech>
In-Reply-To: <20260518122642.31494-1-pratik.farkase@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AMDPR08MB11435:EE_|DB5PEPF00014B9C:EE_|PAXPR08MB7393:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc88a0e-879f-4f8e-286f-08deb688af88
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|6133799003|38070700021|18002099003|56012099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info-Original: 
 O7QV75dUKERoKP+EKvGL7KRmi3Ryu/H18coiRGZXC+1PbgERIEcZ3lm5rQOPeygeuTLirZJkbl6HMDnCAAufGytu+3ZapcJGknpmdlAdiHgfweSkWTtTRZQonIMkVmLS7L2YYLnzCDQ+OCd6eHyGdeE3ChIhWgWHKVz58TWuGXvA5bWYlnhmn2xxThrns4eGbHe5ooA/xvIwPjvRQvn2x6PdWSVZHnzKaDYmA1ieugzzmRUMpAEpixxo0p89ELnzlP1CeYDzXzsnwKSjVzQgDisMcfcS9NP++muUayXq8kg1fOy5yKqz8TXxm+DzxRDJPQHFG+WFy4uHNn4S1SoXlGzZKF4i0odLMSgCtN4xkqdKORjXVPv2EJophuE0cUiVhm5A9IU1FOWRwI/pNpOAGrndvKv5P6OXS/tGx9A0RUVmJuNwsepJtWB67HQKrNJQZLhgirODjh9bOBevKm65Bpnj6ZIhbTkThMGYIYxzEVwBI81ztp6b4eO3TwgyB3oPHWp5RhgoMybBYEadUMbyCX8Ox0ksAxc8v2ThX+RaMkqKkqAdGWUaou2fivv8x8gur+SZpqGoS/o98OgrP2PRZYc1L3pj6xIkz+nHjaNie8f8+2pzuzbyGgcDAi8EDvIzgSlqpuzK4ieWSsNpJ57Zwhko1qQdUIwAq1HHpczVvfwwO/if5bYYswDgecJlBR3aulhr1MUwMp/eNUJa2TbvY2RRNyZWybd21zQScinEzUn7e2OOZ6iRtT3pR9E8Czqg
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(38070700021)(18002099003)(56012099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2AADF223BA7D2546A8DC161EF8BBA281@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 QeZxoNRa2puZvQVamV6fXZI4KwuIITjds9dIpyayEbxR49Z53j8UFxjBzizJM/rqwPwyiYJViJoVbWBixvJ9EjPaukq37fJQNqI5gRiJLhR6aHIKG60J3F87OWGHvonBlOQutazUhmQpxJe4YcFeBbDYA6Cb5T15D2ROEnk1UMTZew6SLlx7R2c3bpnkCbIz2nMgNnMWTomS5wFEWa/YscvIUMC1U5HPXY8+CbdOgQcbpHGPFsXwgQTHaxOiwJfCir/afL2dNp6fZu/KxO7+x7Zr69RioTxJYcfe0eFg8WqCUx4oMhUusz6sHtKrwgeivp1sOtB9mHgFpTRPTagAWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11435
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f9f1a0b7-6200-4b73-14ec-08deb6888a20
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|14060799003|376014|82310400026|36860700016|6133799003|56012099003|18002099003|11063799006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	ceNs/zFv736k3J0I+OKUbdgGCstL2EELB1zVEcGHwFmsr499JJJPoZyR5cclsJ37jk9A6dEESNXNJovAm6CCz50HF7WbmtP6mfCYJl9ks/Po5MOXiPxGF2/xr3UkE/kFY+bcRK2QNBjCnZV4aIMnnI1weGmCiTe1is/6fz+1ASKCcezGR0MQ+kDl3qJ11d/h+zEDx/8UXyfbE1wL5REhz7X+ANlwtKkL0d8LVXlAwCPkpYsviOZWXzf2jjmDof+jrPyns35r9uo5UhxXNt0S9H4H9l7XvOQQev/NT0QgHjuRkSCKAMfmcUJb8litaMVy0+l5TBxxQq2biqxHlbQo0WFvJyaia8Mo7QKhHsL2thBktbMs3oiahocwKFuB3aORdx6ig5hrSM1GTKvY1nx1ax6ohCZlYrk+4STWowpYknL8VZAXq7hcXreT7jT92oyMLVxUerScViX2jq+Co0qtYesW1EtN82BQxubppqP/Xzmg+qrFZFgJ+JMci/ipE9h9MHljZ16d7BaMi+embtCZfVDB89dYsmUsg6X2lsVhNe6SRefPHTf6lr4vrieRoWMMBTo9rSwHTWiJlfx6gPNsN3gX1yPAweu9XU5dd2NUIqkGj1Ehkz7dzNaITP5rVnRL8JVNoTIvxo8oazRdljyhtFg3Ifnrs966pPa2IwOkVKBb6kyiFpcbi+/u3ptYrUSmBR828Kn46GTL4ZHNIQMVvZwlpqCohdY3nO18KcVa0TQ=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(376014)(82310400026)(36860700016)(6133799003)(56012099003)(18002099003)(11063799006)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	r1G5MNmiW0yR9KxE6eN3DmHFnIe4XVCJF6xSl9Cpe0rOcem5atdKleqbOY0LWG8l7PeDB5Ng+xvGGlDpFg5VMjh5lCJiaOawz+4FtPUrMDiQTm8pM5MzhBGcApZd9FeQKjHT1jPBACOTob8wAzMEdafU7rBhUsr1LbUqrAKxIEmxa4epwaliBjdN9s4XQwfVwEOhS/6KKEOJjHwlHxmH1D54L+vGKjSweXxBBoOH227TNwyn7yEAWGW4pRZ92EgdV1DXpvaJ9cfEFljxfPCEKEMfjMw7GYMz9unOHPTTcYGySF9uEcjDGPE2sgHS0Qr/vqL6zbTbdyb5o/JnKfMrzW9BgzTZ/tTHxhVi1qLBnA7fBCicghEXHlV5LcgbrwZA2i9neJrb/6DeTGvANuCdBeWpO3/ufs9ujvonSxPqVr9UJKQctoV6HZcTAg6TsQef
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 15:58:50.8961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc88a0e-879f-4f8e-286f-08deb688af88
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7393
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 15:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237453

T24gMTggTWF5IDIwMjYsIGF0IDEzOjI2LCBQcmF0aWsgRmFya2FzZSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cHJhdGlrLmZhcmthc2U9ZXN0LnRlY2hAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+ICsgICAgZm9yIGQgaW4gZ2VuZXJhbCBSRUMgUkVDMiBkb2N1bWVudHMgZW5j
b2RpbmcgZXhzbHQgZXh0ZW5zaW9ucyBcDQo+ICsgICAgICAgICAgICAga2V5cyBuYW1lc3BhY2Vz
IG51bWJlcnMgcGx1Z2lucyByZXBvcnRzOyBkbw0KPiArICAgICAgICBpZiBbIC1kICR7U30vdGVz
dHMvJGQgXTsgdGhlbg0KPiArICAgICAgICAgICAgY3AgLXIgJHtTfS90ZXN0cy8kZCAke0R9JHtQ
VEVTVF9QQVRIfS90ZXN0cy8NCj4gKyAgICAgICAgZmkNCg0KRG9u4oCZdCBjaGVjayBmb3IgZXhp
c3RlbmNlIGhlcmUsIHdlIHdhbnQgdG8ga25vdyBpZiB0aGlzIGxpc3QgY2hhbmdlcy4NCg0KPiAr
ICAgIGRvbmUNCj4gKw0KPiArICAgICMgUmVtb3ZlIGVuY29kaW5nIHRlc3QgdGhhdCByZXF1aXJl
cyB3aW5kb3dzLTEyNTEgaWNvbnYgc3VwcG9ydA0KPiArICAgIHJtIC1mICR7RH0ke1BURVNUX1BB
VEh9L3Rlc3RzL2VuY29kaW5nL2J1Zy0xNDYuKg0KPiArfQ0KDQpJIHRoaW5rIHlvdSBjYW4gc29s
dmUgdGhpcyBieSBqdXN0IHJkZXBlbmRpbmcgb24gZ2xpYmMtY2hhcm1hcC1jcDEyNTEgKHdoaWNo
IHdpbGwgbmVlZCB0byBiZSBjb25kaXRpb25hbCBvbiBnbGliYykuDQoNClJvc3MNCg0K

