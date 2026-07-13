Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D467C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 15:02:18 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12915.1783954927511521210
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 08:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rZJkGAqF;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=rZJkGAqF;
 spf=pass (domain: arm.com, ip: 52.101.70.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AH9o9U/P69A8PEjuViSBdZ5q5rO5w2cfUfn9Q39sRd66zkPA+Td3zrf9OZj9kaIt34D0PMpXBJTIQgIGptw7f+0b87m8GfuQAmw55i4qQInW1dTk8qF2yW9QwAjLXU8k92giR9+X3JJGRIvnj9VRw8yn1LaluZiHtnZhTSrAcKivEd94W4zRfYKSv0VYFvB8wR4b3bOK7H3Re2bHKnHvFliPtGFBKdhHjmGdhIse1DG6bpkNZ9W0da2Cx0rg0Ucu1fanocJ/1M9DM8GQBpacloEXjrMPD53Kx6MhSK+kdgvHQZpGJdU70B2nWD8BdeMZErg1jzaSsHerhDcW3NYK8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNEq+fDH1UKHm+YV+t8lZlOh4V+4l0ovK5DV9eBwWhs=;
 b=c6U0ff21TNFL4BlWXzqY4I30j0cvlD8rE1kb/p7ZkKiEuS1A5tykR4OCJ0uqd/7Zm4xtJNsha0foSabLhiNyHqDBCbyFx2sNTaSxdpRkUVXnJGZBD6Hpt5SoinNpGWxVV681XL1Aw23H54BP506Jv3pa+uGYvZPeM93ElbTTQ23m4PxSm7pKsbEw2j9NstLeycyprPYDZjRRVFWn8/7BqYP23qqezSYai2kSgrAH7Sv8cfPFm14v9xRm957spHJVh0oRmtdT2dYHOw2JHXrhr4tNgfs/y4kspI5VzH10K/BSqm12MhfgjJtQCS9i7yWh9NyCoE3jwwWK+n5lwOe5kw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNEq+fDH1UKHm+YV+t8lZlOh4V+4l0ovK5DV9eBwWhs=;
 b=rZJkGAqFlSYvtSgQt73RUw/lOzBHnQLeuCE3Jmjx+oGkn9GvvQ9Jjpsk/ZdH3yW/NS68LmX661iHk6sE47bIrDsySemX1M4izvqP1MY7HLmogDzjGkJZayqxIq0Th0P3RnuWbf3pY3ArLq7+avpPSInIBUYym4GHV+9HXGaaep8=
Received: from AM0PR02CA0173.eurprd02.prod.outlook.com (2603:10a6:20b:28e::10)
 by DU0PR08MB9276.eurprd08.prod.outlook.com (2603:10a6:10:41c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 15:02:01 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::4f) by AM0PR02CA0173.outlook.office365.com
 (2603:10a6:20b:28e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 15:02:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Mon, 13 Jul 2026 15:02:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1I4xnEI2cCsmQcqUX+STgA2Fo8yhK9n/u84yfPH/P50mZNm78yTD+S4ZKI4ntzBQbxyngbYbahp2mZNYje48eaQa3U2j+qMtxO0z9PNufSxKD4fodmMQI4hszEyD5HwFZ8gJk8GXqUpC1U8m75v0x2vEn0fwi+dXwxK0py/S8BiNIO2y05OvAkXs50KIrUaWJn13emHFwAfIFp004E3QDKiP0ERgvs/H+6r5idSocTzVGajNS7Z4JGexHb95hss9o34x688CtTHpZYhlVyptcBFhx93uEv9eD+ALVwUmMB8PABy2oIfAvoNj6w6wFjwipdVcLcqFiBR+QccpIKz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNEq+fDH1UKHm+YV+t8lZlOh4V+4l0ovK5DV9eBwWhs=;
 b=HKcfZEOTmQeOGQBV6219cYmGR7CKZR9Yey3VCpMjS4O1TfS5idrtWuTRZEVQxf3y8O/UsKLR/+Bx9v+q+agpCF6u61Gz2FpROBHZbAP/gbBoN4XrFLcjGMu+p8KkzRgasZX4SWyXEMoPRpxGToJIrfo5XjEHmovlQ/K8V2/cS+pULzZ5PcdcpglTLOd0OcPAc7SQiZZDhE1YjSUYzFA/ba/ytR2TprrCqa5ymQWeKZOoGiC4npm6nQ4LelKyoDlxA+MyurCwMo/swnc05pJSW4Qv15KN9h29DH4w1c6Nl55asJqUqNuQ0UxqdBMSTFbYKtbTXo7b+mYGuN8kmk3Dgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNEq+fDH1UKHm+YV+t8lZlOh4V+4l0ovK5DV9eBwWhs=;
 b=rZJkGAqFlSYvtSgQt73RUw/lOzBHnQLeuCE3Jmjx+oGkn9GvvQ9Jjpsk/ZdH3yW/NS68LmX661iHk6sE47bIrDsySemX1M4izvqP1MY7HLmogDzjGkJZayqxIq0Th0P3RnuWbf3pY3ArLq7+avpPSInIBUYym4GHV+9HXGaaep8=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PAWPR08MB11013.eurprd08.prod.outlook.com (2603:10a6:102:468::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Mon, 13 Jul
 2026 15:00:59 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 15:00:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] pkgconf: upgrading to 3.0.1 SUCCEEDED
Thread-Topic: [AUH] pkgconf: upgrading to 3.0.1 SUCCEEDED
Thread-Index: AQHdEoiwdUyPIc8fiUWeaIW1IzVyurZri7UA
Date: Mon, 13 Jul 2026 15:00:59 +0000
Message-ID: <D920B66C-617D-4E34-9F25-CFDFF6A5EECE@arm.com>
References: 
 <0101019f59f41743-700da19d-583f-42ea-a64a-663a24627177-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101019f59f41743-700da19d-583f-42ea-a64a-663a24627177-000000@us-west-2.amazonses.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PAWPR08MB11013:EE_|AMS0EPF0000019A:EE_|DU0PR08MB9276:EE_
X-MS-Office365-Filtering-Correlation-Id: 746d07fa-9fe2-4ab3-681c-08dee0efb1ae
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 1cz2/4D1xoCtpzINyXYvF9KhBQ6tWIUuKBjbh48pn8GgzO88o2l7zUDW3b1bc39BTFD5v0F8EcTAifeR5R9TP4rxHye63QWL6cjz8PuzhdMtdiHuv22APxd1xKmIrY918rkJb1lN2e+ctUfRa9LBczF0nTStJWOo2sGXyQd+pnEmfRjuah5sJ+BK9n1cxANkiRqzWMnSQbyf7MJDrSTAAKPQp9q/Jnf7VsK4iRBfnNnguN0MCIV0vxzKUweNPxz5b7NVp9s92azEXamwr8wIxgoe4+L8De5bEjwp2EDZAmBBy9RoCsdOXC2VTw6NQaGy5AIohNYz6zHjdVxtTRxD8BcdCKkmUo5GYXpuLNDqMeWsBfJKRQWRb2TkVshik4ZtUASs1ajYSRDmYef5esrfR4UBdvnIC2iQpmLSTppy8LB4K6yI6hvlG3MvRGEHDu9nzL01z686q1M8dEfqdiUnULyv8c/ZCq16JAtWDaOOllk/Ajc6WDErBLTz+UApXtADrMhDUljVUk0RQYBjz/F8a8luljckWeSb0rtnpY/LaTGUsBzJgz6LEi0/XbIUEx6lwpk9gK3m3Z6+cUkOlddGADQdAuzZytzP48yv2uouRQXD+4KXo5OxAi0pcEfFvlpeabIYh2kNNObK9FE/aYXs+tVLdPjefb6uETKXzmJrS+r6MWESqs38+O8SyLuPcCcVsYtGcldwDErgcm9o84FceNNuXEXhf0gJ8w1tF9CBvkQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <786D573D0BE3F141A551369D79448584@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 GEDuhof2++b7fM0xO4cXLG7Z9/gzzUFLqjeR2tW71KP1avPnHXzzZK4TRwDl+llabhrYS6SCZtmJBLndtLkefYmWpWXHfhafShbiwTbnuDeM87W1C0UM24JTOni2Z7jfA2RXZxhAh3qVQoEY33gQEsas646vYQkpZjuWtiNkuuA1oWoz95UmU0MFcYo4qcZYeowVv5Kl7m2RltAOzZwRkef6evEoHi3Yxlhn99E9wUCJy5LmclyTEw4Kow8ZdnuEEkg9gbx4MkwtSqvmwUfQEfcs3sfwt8fBbPtz1uCpE4rhwsPyhWCOzpglTziJJDUZZ+GxZfuA/gJ0u8BU6PtWoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11013
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	56fff85d-abd1-451b-6e6b-08dee0ef8c79
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|35042699022|23010399003|376014|36860700016|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	TsycUOlGdTmZlBZJK+7ef3zDmkYBXAIE7GmygsE4+6Bt2sHst7/4Nsv40JaZOPZKoezh0OAuzvrAcQNfMKkSGczbdJ6AVkfwNiJAoQOvw16xntODvWPiLi+36WZEKPsWD9CedsJuZ2XM5IPYTeZvthRcLx2qjLrtqS32YBgJ0hnbQN2Y4PqdVn/u67ZwZ3XE7hGoB0cJikDY96AxbIqab/bsMr5r9IS5P/4w7dQ5hS5ktoPQfXRIndwDve8ziJB2uvH5DIy3IJhb+8hSHapzt3PtAodeQBEz34fYGIdili+wl9WKQHiZVvkk9L/wwWvZBEMVuOwq4bvpp4C3EGLZuurjtE0C5mP0/EmUuD/8w+lxNWNSkxnroL5s04YvKUWGp6Yf8qtlSh/kiDV25/TwGEsTreW9LD19j8ibSuBh/9VAmkK1wletrH4O/CrWVedBKy15JZ84d+ubAeDy754QUz3GzayJi5I2ixQcSgBb+FItXtwm4KgzZAkMYNwFDTY+nJuEsh1rVHbsJMfLCKKPiIlIvZrkrocxacPzKU4hjB9gWVmrb1ubCq5FDAUam2e+tb3JR+7eBmSZayP8AIgt3jPN21KnkSANg/vItvG95gEpZ4YyEjXzTY+Mm0yTMTMaASFxHmIa5KnqbPKFsQM5uKEyQyrmzaVVhfGAGOETbAT4rfVXL4g6xflYseCDHniJ5HPOb5VgZ522YCXclgyp7A==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(35042699022)(23010399003)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kK3JBCuceypLOCrT3Mcq2UcByp780g0vb+QR8/vkS7JOM8puIJoAjJZ2jzj5msGhQtYZUd9uCuaGqwdlYFzclJfngFgdY3B8jigUiaW1SbI2tv39PkmzBgmJrf3+Unr2v5IWE8LmAJj/a5mkjDit2qOXHafObEl0gyAehnor4B6xFihtwVDcJXTtFlCkU/iNOBEBgELDh8/YQa1B6oaku74AvjaIew05YtF5P4DGgV1anNn/5yjs7oAQiKatuHVIdW7aJhTlLQPfrEDW8YgqRuOIEY6orqVobrStnuwjpsyM8PVwKMg2rW+ULjxLG3GxBgkXH5KzPmACyUXPWZ1DGlSgKXYJ409KJ07aahc8MKoWaVyPxrZCFtBWnQ1HU4Qa1HZD1pwCQ65lZSnrFTe12+85gfS0eT2TP4KD/OoGZrAgaBxOC3xshzjwQVaRv2rT
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 15:02:01.5659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 746d07fa-9fe2-4ab3-681c-08dee0efb1ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9276
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 15:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240843

T24gMTMgSnVsIDIwMjYsIGF0IDA2OjI5LCBhdWhAeW9jdG9wcm9qZWN0Lm9yZyB3cm90ZToNCj4g
dGhpcyBlbWFpbCBpcyBhIG5vdGlmaWNhdGlvbiBmcm9tIHRoZSBBdXRvIFVwZ3JhZGUgSGVscGVy
DQo+IHRoYXQgdGhlIGF1dG9tYXRpYyBhdHRlbXB0IHRvIHVwZ3JhZGUgdGhlIHJlY2lwZShzKSAq
cGtnY29uZiogdG8gKjMuMC4xKiBoYXMgU3VjY2VlZGVkLg0KDQpUaGUgdXBncmFkZSB3b3JrcyBi
dXQgYnJlYWtzIHRoZSBidWlsZC4gIEnigJltIHRhbGtpbmcgdG8gdXBzdHJlYW0gYWJvdXQgdGhp
cy4NCg0KUm9zcw==

