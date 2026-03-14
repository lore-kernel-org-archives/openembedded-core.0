Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B0310854B6
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 23:37:33 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20370.1773531444351267472
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 16:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mirgWSeu;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mirgWSeu;
 spf=pass (domain: arm.com, ip: 52.101.70.54, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YNe/8IXDSPzgdlAC7Sk/k1PvSg9btZ85eh5Yy7qJAq8hqlCxPaoEAwmLf2xzL/Oj9HdJiFzQyGPYky/GsBkK+pzZhSTt70Lvuw2m9Z07Ray6R8B8qyjr2QTMbu5dbnCxIUlr/8nmqx81L4PFCVzQqOJazl3PuHuAJesxCUqxyIPNWYcXAE4wpfoaVucifBY5bTfPWIhGSLGGvE9y6WOHIqOe9ggbj8WUE8NBTB9/xYfDirOiN3iVMnLmy4fWp1ji3puZRg57tZxCfARoOaFgL6uI2R6ViSL/vhud1X3Yk4kwThHAQXO5hsHEeaPpAsF7/6OWeE7FiZJKPSUKx/ZATg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGDrkvYa56FfYMsnuSym76T229j4XkYoMNtVyBqkCfQ=;
 b=r4s112bXvKIdINfDqMOq/4TrpBoV4xb26yN8C334UiyMif68eb0AVBx0Q/IdeUgUBhU6jUY8TDJXuuOXbLTxU9Xq1n0LgQvMkOeyj/MsZM67t7VTNiHaHAGhJhxzPLHptcJaccZ6bJUiFh+6r3tZ0Fs26hYCcdhVHICqlAwqDNrWx7dQLKRRTgJJzSKH116TmFmZLgRZj7EEfEEtpavdoAJYBLJ/99AKtSWakz/l3PDa29skmqsNnZyqfgZzmhuodIoz9havv2EoyaQAWT30cHVVV4bDY3mGaTV58T+dt1YqEY514zQA2vur47ui+FsJPh9Yc7/ZCuBd+eUCr5X6Ww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGDrkvYa56FfYMsnuSym76T229j4XkYoMNtVyBqkCfQ=;
 b=mirgWSeuMXwvDE4+AicOqwjL9pLrgMzx9tduR0DVlOQp5JmzmP1Cg0IqxqOs17OCJsj+0I/9r2lNeuObnGTbwlIXyqk+2QOykd2Dib/8lJzxNxt0b2vNV1/DsxqNibgxLNxFRmTtn3PCy1HwDQP0jzNjH5Q3UGJ8CGlz1zUC0FY=
Received: from DUZPR01CA0119.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::19) by AS2PR08MB8694.eurprd08.prod.outlook.com
 (2603:10a6:20b:55d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sat, 14 Mar
 2026 23:37:17 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::67) by DUZPR01CA0119.outlook.office365.com
 (2603:10a6:10:4bc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.21 via Frontend Transport; Sat,
 14 Mar 2026 23:37:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Sat, 14 Mar 2026 23:37:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8qPxI7nY2e3ItiaL1ViGZKrq0ru7Ba2iRZYvMY0UfFtO3m7OrY54ZBsyCAOQJD3v6KtLNCyejTNNLDUooiqLZt7v7od4bnr84bfVbJKewBgEsJjgEgxbqnS04KN/++GN/HSw/54OZb951X8E6bmNGfn7ZrVa3dDKyKf7JvPvFRvfPFLchiBcWSiJEfFfxIR/6shD7BmUJmIrUa5npfTCRu0g8QAYoHO6F+5Winbmh5F1vK34UASy6r9FK8MIb+sB6TvvmIDNcTDSsET4C+ajPtRSalrt7WPOYfiRO81nuuvGDQI6iRuAcrabxHPgyRHTekc5iCVB8CYXxlJBQw0xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGDrkvYa56FfYMsnuSym76T229j4XkYoMNtVyBqkCfQ=;
 b=aAKYQ7avgHlHL4osw7w50Lfy9WyJVqCuyUIOuOwnQliJp+Z1k2N8xsr3S6EiDEfeqZKCtsTmnc13IEaBbpZqm68pS6i+HKf9BFJt6sZJJvtCv2fFye4puPcDSR96hiceFNZSqmm9yHKxCzNTM3vyngxnzHS9PN2VLFNZ+i+vc3IcMey0ze4jyH1vYUioYtlkIjZbEhdpaONayh+3JzG7Z1/EmL5Nsw8p1ZnvEF0FlaorJE9Dv5WSjtJMQkIS1paGmCbqgxOa33qcYjOFmWXfEXuIUiijC6TnhU0u3kq8W4ZUIScuKbXCxIB+cZXqE0EdSdeYWlMVvpdcRbUzlvnwVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGDrkvYa56FfYMsnuSym76T229j4XkYoMNtVyBqkCfQ=;
 b=mirgWSeuMXwvDE4+AicOqwjL9pLrgMzx9tduR0DVlOQp5JmzmP1Cg0IqxqOs17OCJsj+0I/9r2lNeuObnGTbwlIXyqk+2QOykd2Dib/8lJzxNxt0b2vNV1/DsxqNibgxLNxFRmTtn3PCy1HwDQP0jzNjH5Q3UGJ8CGlz1zUC0FY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB6187.eurprd08.prod.outlook.com (2603:10a6:10:209::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sat, 14 Mar
 2026 23:36:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9700.018; Sat, 14 Mar 2026
 23:36:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "mathieu.dubois-briand@bootlin.com"
	<mathieu.dubois-briand@bootlin.com>, "mattware@cisco.com"
	<mattware@cisco.com>, "esparlin@cisco.com" <esparlin@cisco.com>,
	"peter.marko@siemens.com" <peter.marko@siemens.com>
Subject: Re: [OE-core] [PATCH v8 4/9] glib/python3/acl: Add pkgconfig to
 RDEPENDS
Thread-Topic: [OE-core] [PATCH v8 4/9] glib/python3/acl: Add pkgconfig to
 RDEPENDS
Thread-Index: AQHcsin30slvWsYMDk6QAnmLlXo/BLWtrWgAgAEE5YA=
Date: Sat, 14 Mar 2026 23:36:13 +0000
Message-ID: <92D2D374-4D24-4499-A2F4-85B46B3C3008@arm.com>
References: <cover.1773324129.git.liezhi.yang@windriver.com>
 <af076df542e7b42d2c3d7ab46188a98b400aac45.1773324129.git.liezhi.yang@windriver.com>
 <85a2a6b63bb35ea7748763500ceec3f411dd63ba.camel@linuxfoundation.org>
In-Reply-To: 
 <85a2a6b63bb35ea7748763500ceec3f411dd63ba.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB6187:EE_|DB5PEPF00014B9A:EE_|AS2PR08MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: 685f76ef-d17f-4179-eb7f-08de8222a0ed
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 q2szItzZg9LwoFgctMw/KrAZRoz9N8F1LQ1C6Da64T5769RcDs+fBaeiGdDc6BEpOfgyNbPIcMd0NGMuQ8gPaiVOxlRrSUqDfNDrdGT3n/opVUVTsfFulYEiVOhZAmHtFn6qH0z6yPEeN8PbShb5p4FmrN/I1ywxn9tCjqp5xqqaTKIsUOjtrDxzM6EZIiy6BUoOYq75NTdN6c4eEu3jwYVEwZFh/mGk6wnIOTa/zz07OGrpihsdxo6TRYDR//qpWt3eNLCyGzV3cUY1HYdknWKmrqdNJ++g60EAtqAIro0pyfLby8KFrq5qQ2+L30OXLbAzaFkIET7sJCFEfA7i4RqMNIcOLy/fHlHnO0Q48fAuAtUiU+MqsQS7a7sLXWhpvSiNeQlWa7BY0+G1Q/klOVdin9+ZXbLT2fb8EB6KrHADW5DfTQhiNXVDiVH5HisEZbjH7daY9fKWwN5Qjyu3SSG1XYoJ7AZHTKL9D0WoXVur39gDjZ1UHVChBukKk1pgvZn4Opy7/TFurCvwP14mhZEO9zjrI7VIRS1T63iLEAm2/AsWx1JTFF7weniHJQtABhhz7dmqYBVQtJMqSZv2u9/+oQLX9/rcbB+qvLKGAZUjQkTUd2S0M/XRONaL9S+skwljziw3WkPSbs4bhiZDnDMheuRiiqV9CkxcQS/MJwdyD0fKMOQO0FBsFtSDr8jC6lT0nv7vUwv/mlRZo5/BFHatxtNKhfQLkLPd9Vi6h326wwwvr2f2iMwpTa3GFjBf4qNj8jbzz2Kvu0J1PURO1aKDP1Gnw+3l9UHm5HgbWfk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2742D9199EDFAC4793F7AB30229FFCDC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 L51rTcSwtAsY7+bmYQi55sm1yRczekKI2SqHXsTwVxHwNFy1NVsE+oBmSCQQQgu0trsMkRfW3NI/Uk/6rVh6m8QjfUp4cRtzYWmfHZw+Es1M9jClkp7uFGrcJQPysSI5Xfr6lpXyoE9k79/HS85jNB7iP/5O4QJfUsVuHKbv++0pfdsrQa5PDIfY2o0S2Uhk2QjWWDixDogdpovSUib2JGPtWcfNTNTfsYiyU1/HdqVoApeklOIfnVIAKBtt7Xz4qwWiwHquWPgzRoSscXBAQ3FUSJHnojsBw24EibA5dI9akgzSkaziTkLQ+hivdgrvbLiZzmbtzEKL/jwcgOUC9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6187
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b5b2b709-bd6a-4712-4f1b-08de82227ac3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|14060799003|35042699022|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	iU2V+pqmdVTP6qD/444pMB7q2FtZJ6bXcjVdrz2x1X4rjrJzyjOmvhny2+esvJv/yBNR6f//Rm719c3cGPZPPovL1Y7eRIF5cLLv3ofSOt0TTet0wKJ7qGUx+62VHOHbzGSsiiHWRNTfrPNRgtoR/xnoE6UXFC3lZdyfcVzQt8L5UdObwCpndoDvUKdEVcYFkoaQ981gYht6XeFOzqd7ZlDBJ1Ais1j7Hc2NwDSY0kH4WZMDSlImud82YhtALEuixOWrpmSmE+1s8pJFGuQTQTUFG5kOMbYkDi5cWZPm6P3peRfX3JpuE1mpd94PBmmAf5+B3qAPonBMHGauJPQjB8BVcsozLLY8ktOwr7aXgZiJttQyXotFmUgOg7odFlQABU1g8kQuGjBRgKN8D4cK4qUZ6z/2u9kycZhH+5Gx1VpHRcnZP2WhwCMz4oaFeZ9b/nBtVEjOR92LUyupRk9REfj9ZGcXv0CvqyO6xVxP3iJbUon9lkfsHgWpS2a5EHLtfhPhsPgzivBpIWIT1/R+/Ci9HnXulhBEX2YE5w7cLLpnD3ZjiqPMFcGCJAFxTJq145JTqWc45W4A2OzldEcv+Sd/pcihPNIjNGkIALsb7wi9FyCgJPQg3yqrDyfTDvqSwrSej7gWmvFQ+ntn5nnzMhvu45Zhlc9cAZgkD0eaM+m92gw6GbVor9HsOW0xaHnaXOSL1KuU9BdOXU1FxWiE1ZW9SWwPdt0D62Fx0L1Lv2RdsCEiqaDS8LkeE0ed0ftDrzDzJI8Caao5ETyh1rtZxw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(14060799003)(35042699022)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kr9h1Zb+46Zuv7sxXxDTLR3GECIHsFeymyADB3i36Rcnz6EFI2+K4gtHig6Rj71P+mm4+XvuaWdvL/wY6PUnc8AzywtK/2cSFSL2naR/zy3NLqqgQj/08P+ebP6UXQYpKZOfL9ISLpArPLjzOkJ+QmGoxWfAbLVOppcc4hwfZRkrLZrtDDMwPFDEjf7j10wCReOOMnxMqfGTeOSxAGPqyBYbQ78gXEyS/sgsBA8E074ME2h/DYGP+jFtnjNezuThpYPLCi4BZCtFvY5ZswMJdJAAy4fx0mvAHiH+EINM+Dy+h3y2LqYYRoF8xFRrSOo2QhE2dFzvwqGkld5Yfs+AVAbE+LCy+NCTy5V9N3QqB/MjQhe5u67LVt8JtRoQ2cIl/MhL9JjRFd0XQ89i6lA1/tCQz0yd25wbOh5MAuaN6f18kAXVRcZciPRYyQBhj02Y
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 23:37:17.2674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 685f76ef-d17f-4179-eb7f-08de8222a0ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8694
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 23:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233102

T24gMTQgTWFyIDIwMjYsIGF0IDA4OjAyLCBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIDIwMjYtMDMtMTIgYXQg
MDc6MDkgLTA3MDAsIFJvYmVydCBZYW5nIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3Rl
Og0KPj4gRnJvbTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+DQo+PiAN
Cj4+IEZpeGVkIGlzc3VlcyBsaWtlOjoNCj4+IEVycm9yOg0KPj4gIFByb2JsZW0gMTogcGFja2Fn
ZSBweXRob24zLXB0ZXN0LTMuMTQuMi1yMC5jb3J0ZXhhMTV0MmhmX25lb24gZnJvbSBvZS1yZXBv
IHJlcXVpcmVzIHB5dGhvbjMtZGV2LCBidXQgbm9uZSBvZiB0aGUgcHJvdmlkZXJzIGNhbiBiZSBp
bnN0YWxsZWQNCj4+ICAgLSBjb25mbGljdGluZyByZXF1ZXN0cw0KPj4gICAtIG5vdGhpbmcgcHJv
dmlkZXMgL3Vzci9iaW4vcGtnLWNvbmZpZyBuZWVkZWQgYnkgcHl0aG9uMy1kZXYtMy4xNC4yLXIw
LmNvcnRleGExNXQyaGZfbmVvbiBmcm9tIG9lLXJlcG8NCj4+ICBQcm9ibGVtIDI6IHBhY2thZ2Ug
bGliZ2xpYi0yLjAtcHRlc3QtMToyLjg2LjMtcjAuY29ydGV4YTE1dDJoZl9uZW9uIGZyb20gb2Ut
cmVwbyByZXF1aXJlcyBnbGliLTIuMC1kZXYsIGJ1dCBub25lIG9mIHRoZSBwcm92aWRlcnMgY2Fu
IGJlIGluc3RhbGxlZA0KPj4gICAtIGNvbmZsaWN0aW5nIHJlcXVlc3RzDQo+PiAgIC0gbm90aGlu
ZyBwcm92aWRlcyAvdXNyL2Jpbi9wa2ctY29uZmlnIG5lZWRlZCBieSBsaWJnbGliLTIuMC1kZXYt
MToyLjg2LjMtcjAuY29ydGV4YTE1dDJoZl9uZW9uIGZyb20gb2UtcmVwbw0KPj4gKHRyeSB0byBh
ZGQgJy0tc2tpcC1icm9rZW4nIHRvIHNraXAgdW5pbnN0YWxsYWJsZSBwYWNrYWdlcyBvciAnLS1z
ZXRvcHQ9b3B0aW9uYWxfbWV0YWRhdGFfdHlwZXM9ZmlsZWxpc3RzJyB0byBsb2FkIGFkZGl0aW9u
YWwgZmlsZWxpc3RzIG1ldGFkYXRhKQ0KPj4gDQo+PiBUaGlzIGlzIGJlY2F1c2UgdGhlIHJwbSA2
LjAuMSBjYW4gZmluZCB0aGUgcGtnLWNvbmZpZyBmaWxlcyAoLnBjKQ0KPj4gcHJvdmlkZXMvcmVx
dWlyZXMgY29ycmVjdGx5IG5vdywgdGhlIHJwbSA0LjIwLjEgY291bGRuJ3QgZmluZCB0aGF0Lg0K
Pj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgWWFuZyA8bGllemhpLnlhbmdAd2luZHJpdmVy
LmNvbT4NCj4gDQo+IEknbSBhIGJpdCB3b3JyaWVkIGFib3V0IHRoZSBwa2ctY29uZmlnIGRlcGVu
ZGVuY2llcy4gQXJlIHdlIGFibGUgdG8NCj4gdHVybiB0aGlzIG9mZiBpZiB3ZSBuZWVkL3dhbnQg
dG8/DQo+IA0KPiBUaGUgcmVhc29uIHdoeSBpcyB0aGF0IGluc3RhbGxpbmcgYSAtZGV2IHBhY2th
Z2UgZG9lc24ndCBuZWNlc3NhcmlseQ0KPiBtZWFuIHlvdSBhY3R1YWxseSBuZWVkL3dhbnQgcGtn
LWNvbmZpZy4gSSBhcHByZWNpYXRlIHRoZXJlIGlzIGEgLnBjDQo+IGZpbGUgdGhlcmUsIGJ1dCBq
dXN0IGJlY2F1c2UgeW91IGhhdmUgYSAucGMgZmlsZSwgaXQgZG9lc24ndCBtZWFuIHlvdQ0KPiBh
cmUgZ29pbmcgdG8gbmVlZC93YW50IHRvIHVzZSBpdC4NCj4gDQo+IERvIHlvdSBoYXZlIGFueSBj
b21wYXJpc29uIG9mIHRoZSBkZXBlbmRlbmNpZXMgYmVmb3JlL2FmdGVyIHRoZSBjaGFuZ2UNCj4g
YW5kIGFyZSB0aGVyZSBhbnkgb3RoZXIgY2hhbmdlcyB3ZSBuZWVkIHRvIGJlIGF3YXJlIG9mPw0K
DQpNeSBvdGhlciBjb25jZXJuIGlzIHdoeSB0aGlzIGlzIG5lZWRlZCBmb3IgdGhlc2UgdGhyZWUg
cmVjaXBlcyBhbmQgbm8gb3RoZXJz4oCmDQoNClJvc3M=

