Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19109C982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 13:01:14 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48178.1789995665216955535
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 06:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=B/8uAfON;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=B/8uAfON;
 spf=pass (domain: arm.com, ip: 40.107.159.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Y1c279jmCC4XdUjUORqMh6jlcF6NLAoqq4FWBNp2p0AmN/RDspZ7DqrpbO6477jjrg12ePmxDUbIp2+3d9056o9qw15Aidx3IzDKxUOsOvOTvmY+Gymyg2ZBdW8mLfkC1EoHMrq5QZIN421R2urF2yvLeRJytWOgai+33+eoas9tVZ1Jlq31imuzCKwQE/GB/X77JW5dqO+2Kl/Py344HGB/8RRjakAlotKs2u+rFsZlCqW13SxOt+LEZp/YLYJBXenq5W2VP8CbTJCYCCiFF3bP9mTe1VKxREBDEKjQ7v/T4QaM4zp+61g9Y22JfO7akNH/pBIojUq0CWMbq12f6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5iOKVMX5xlloVJQHA5NfNjVWA1+Re2mKP6iCuOI42w=;
 b=a5H8B5jI9cw1HdyDubB9z1C1HuPuza6onjfWaZB5NrUHEjD4AuG0mEdYlbJdq66F0k1K13mdl9vcFptc8+uqKAQuMiE5f2uBS/f3gW0WLId7A+VC5VQUycGNJrlv+cUXeLjGRFfzcOiRTjwhr1yQS+824FnFcQ1KDcXJSxMzssWiGwXGUaAvpXKFkOenoe4tptApbTao8ZmhEwdrwmjGDHkF4hS9D94Co7FfI8W64rK92J3YY0bDw6tb7LlDT9K1HBxf/TmptyVAQPOs/mjyBXsIKF2jNOvIpK9rtGkVp5JVyQoBHhEBECfUucQdOMzLElTH3lcy6nkdzd4hQs5y6A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=googlemail.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5iOKVMX5xlloVJQHA5NfNjVWA1+Re2mKP6iCuOI42w=;
 b=B/8uAfONXv27vvQbshdozU2G0ynN2nBHN5lEOAI+40WWLhrsnpTbBnFrUy83GnS49jEBgfCkqroSlp+a3MxWwHWe0VGohL1kqjduxjb+BOf8J34c3swIptzXYoE+8FVuMsJj2AkuN9ZzE5xsINeeNeB5Rq/Tv+uuHL/2TQP1O0w=
Received: from ZR0P278CA0158.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::17)
 by AS8PR08MB6120.eurprd08.prod.outlook.com (2603:10a6:20b:299::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Mon, 21 Sep
 2026 13:00:59 +0000
Received: from MI3PEPF0000855C.eurprd05.prod.outlook.com
 (2603:10a6:910:41:cafe::85) by ZR0P278CA0158.outlook.office365.com
 (2603:10a6:910:41::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 13:00:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF0000855C.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 13:00:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FiwUgqCeed96ufoNh3vX300APqE/yVlB5isT2QEWpV7zIUWDUhlTQl6TJSBE6tQET8OgY8iWxheGj6AgQgJLTIpQ/J9fbBWLB/jSgT3s8dqHprO1HygmV9ZI9fQXucPFgIaMk2kK1vD3iFWa0/DnlOk/i2vOihdoXxmPU43/nGs9kZKuI0W/uvxXi98HLab0SjtuSx7OqnzF0CWb9sxxWW+4sSS87l1RfbwGjUG06qyiypuyh2fLSp1HGc6SKFYeWbb0JXxHkK2qjg1fXfypkeoelmCBzvdA53oBEJnHVBKaonBsTtJ2+3kEv7LdA5nRhoXp7VC39utNylZLETDo6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5iOKVMX5xlloVJQHA5NfNjVWA1+Re2mKP6iCuOI42w=;
 b=CRNnVjehIiRGu6RgTZIeKbwYWn/BYG+ipSJdAF87UMaXUxsXYfueMBS1cIk0cGVRcVZHwy9sKgvK8gn4/EtE1lLgykBwSXyaEz9sIHoHWC0mED/N6IbBJq+J+lSNhaw+AtkUqlSSVgwDIL2RvtUlunBBNABvpPytwSsTnZXTijGfn4T2kg/UbLGoVR3nsUoUhNJOfj7VuYAWoVOHKHGavd2TJbyjqHj7EEmCiwOWMoG/jsZAWp8cBhCSSEdnfBfymm0RF7NZTHqvSCJUgleYYk0hjO/0wCQ528bEFeGJEVSmyFc21L26DJLD3P4UHN8VbcVF62N917i753cYppSXQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5iOKVMX5xlloVJQHA5NfNjVWA1+Re2mKP6iCuOI42w=;
 b=B/8uAfONXv27vvQbshdozU2G0ynN2nBHN5lEOAI+40WWLhrsnpTbBnFrUy83GnS49jEBgfCkqroSlp+a3MxWwHWe0VGohL1kqjduxjb+BOf8J34c3swIptzXYoE+8FVuMsJj2AkuN9ZzE5xsINeeNeB5Rq/Tv+uuHL/2TQP1O0w=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GVXPR08MB10785.eurprd08.prod.outlook.com (2603:10a6:150:156::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Mon, 21 Sep
 2026 13:00:25 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0451.012; Mon, 21 Sep 2026
 13:00:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <mrksvolk@googlemail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH 1/3] gtk4: upgrade 4.22.5 -> 4.24.0
Thread-Topic: [oe-core][PATCH 1/3] gtk4: upgrade 4.22.5 -> 4.24.0
Thread-Index: AQHdRZ/Vx51L/0oh+UmqWPUcZTCJybbRFeqAgAMdyoCAABDCgIAAQsUAgAR/zgA=
Date: Mon, 21 Sep 2026 13:00:25 +0000
Message-ID: <B7443D2E-456D-42C5-900F-820A28EC2009@arm.com>
References: <20260916055325.3396270-1-f_l_k@t-online.de>
 <DLGPQ1X40IXU.3E13NLLX5ZW3M@bootlin.com>
 <4F8AC12D-97C5-4997-9FEC-2F9CD54334C1@arm.com>
 <CAGMZJCeG9bmmTpxXm7qH7kbDQL+LEGWH4MWOb5=XRw57qPcfig@mail.gmail.com>
 <DE2CF7FF-FA7B-4415-8143-11E0F7EFFD2F@arm.com>
In-Reply-To: <DE2CF7FF-FA7B-4415-8143-11E0F7EFFD2F@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GVXPR08MB10785:EE_|MI3PEPF0000855C:EE_|AS8PR08MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: be80f149-a9d1-4283-754e-08df17e061d5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|38070700021|11063799006|3023799007|6133799003|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 9QY3Iijln0Ye0o8XwlQ57LTlhwf6NQVgLtcQUooPyChCKRAJgwz9mPyk+9de2yRBZkxuoyIFyOzsvXQdqFuMEQMhnx1s39lMmIuMpEj7XKgnyUTT6/QScxhEXJfZZQg4Cbnw0/iwiqv6E75WW2JMFGuscv6VyjkrK5eKPxzyQMC6cfn247kUZ1K7NV9doXKSFJwHheH0W/oOc0bh7igX1jUWa4CqnZ1tsQ5Tfyiscf2s4VvjPabEz8ouh7FchbNHQPJoYrMBSA+QG5h6GYNGq7+KhK8CrRk86nGDwRIJbWIOVzWwUx4j8UBMoItA6uNSxdrZuU3mlGYxnKnr5QcKceAs8x6343i5jVvx8WmunQoBCT3wfs8oIu5Gfda54cfPI8OAvmsjW3+s2D4f+VSXv94Ws2zjMS86D3/sVUMKMnDIMl3KHri30/tKX49HoZMn7Iuy1Bol35/w2HYKOV9NrbJBd6Gq/o4Wgng/NphX2TAcPzmO9dsyDDWroUqv9DOfI3JGg+yWPHLw/SceJY9W67Ydd3wyeKQChfUFwgI0BoNPeHwplcMZLYHwH9FGnj2q9UWTHskYcJQB92w2ol9EgWXdr3L8ntm26aMO+JFanbl3v7cE9ksbKeZUZ5ut2Fgcu0nW4MLSVQiqXTUHDJBEW4LccvWD1YmEQuw/H21savw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(11063799006)(3023799007)(6133799003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC2D22FDB624F54F91A9AB91A87A0CE1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 hkBfhwf37mTiBmvk0++WHESpYPQa6LcJIUmFikBUPItxg+7b9V3xc4ktL76vIdO9ix+OHGnGQSKQ9Ad2/FKnDfS3AX/3h/zHqsI1gICaEztBcfgR3+SGsqagP4aMdAXaPbU9A+Q8VTr0eW3WmidtH9Bu7TQ0tl7vrfNjHFcRhj1KGvOj+/FDq39Z4DEc41NxkzFN9yO7eaFI8FDrnloG4pftCoR8pnXs8VvxzelTTpemfgbQ2MOljVNqAIwP4Lh22e8eaStpMtdApLcvq5DORkG3BtDjAlOP5e2dJz6Zu4yALyP57ym/ZsRG9DcBjzzYGHOEPCJkcUEGSyF7ZGl6yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10785
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 MI3PEPF0000855C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0dbf19b2-efbb-4681-b749-08df17e04dac
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|14060799003|36860700016|82310400026|1800799024|23010399003|10067099003|56012099006|11063799006|3023799007|6133799003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	fiQ4D897eetARgDBWmJI6aREGXldkyo0/PpKXaWM0K+8DLjupoySf2aCGOYjxbUk/CcAIEzvtBbqMK1Nyt9MU0FrDLfAxZHf5A4dk1RWfRIsrXVtTR2HLrk0gvZVcvX9FWDCftccSmHb4KtMRncgkEl7O+HY58jsGgrKPUNOsu42GYLX9Bl557m8JVgnBiUKvZr+BDEwat1pUS0MPmiODjjDJd0FgUqYaBhsoP6q12s5vXP5zLVNTD5UrAwCGA0SLQgCpSWp6372p/KYh29UIdhhkgi3MTxIJWoPNH5HT9l2AblaK+oQVdcD1mM5ZdvRJs9p8aZt11aL+qGKpa9JBxiL4xNlxwQOKCukqa/APYpXE4/DZl/qC3BtGQrwwHDNS0fCweHUn/UxxK29GWPVPiIjAFESrf9zu+zkqJEBmmD5XdG74KqwCb6p6svkYyINEEjV4c9Q3I9xAkG0rHimJODgOyYNlqf3GH6mv7Qvp3FqN/5vk+fdNgVU7+ZmkKckdbODEfQ7oRtHe9sXn+aW7GBr4TD8l52fKQNQg7qvcmTqpYeqFvKyVq+JI65m4BynCi5BRGHFsz2ydbn4q2bLaHXwRPtgtIHvOLBtItv6Iyq4Dymr+mR/5RY63xFP5wvuortzspy8lIGpc8lYM4bilw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(14060799003)(36860700016)(82310400026)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(3023799007)(6133799003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8GOQWmFVlNUpaot/pgmY2iYQFrEgAjOzA/hcGEIKRUStBv5n1/XxQRRbeUPfA1HU/jb0NFyU0aTyl7ZO2y11MO4TppplHGdkc2J4jMrT8hqQa7HKxbjd1EcodrT4gXLynT1fEGWSFSXRUCk6EwQEMwmHGRdVOYSOABNNnYkXLBb7C4S8crpqkNX9S1S8z4HErQXnXKjpAAMAs3h/WmD1ALzuHisnwc5F8dPAqw+WFPvKXS+55KYhNlz9C19VvaREIyLZFDk/Z2Q/hhid83HJC6akxuaU7WkAa1fpclCdQlvr0t2SkfOvdoSl3Xd5jFV3Rzx0n/b2dJ8Gfsk5LLj82b1c8rxxzYBDwfKz5rHyL7oAgDYK/hnLHD2DaInJA+sSmhLvZd+1zqZys7rukv4e/f8QgETIpA+ivmF1ytDhTUoa+adi1Dfz+igKOyX8IJQb
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:00:59.0447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be80f149-a9d1-4283-754e-08df17e061d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MI3PEPF0000855C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 13:01:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246331

T24gMTggU2VwIDIwMjYsIGF0IDE3OjE3LCBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNv
bT4gd3JvdGU6DQo+PiBUaGUgcm9vdCBjYXVzZSBpcyBub3QgaW4gbWVzb24uIEl0IGlzIHRoZSBj
b21iaW5hdGlvbiBvZiBhIGdjYyBjb25maWd1cmUNCj4+IGJ1ZyB0aGF0IG9ubHkgaGl0cyAzMi1i
aXQgQVJNIGFuZCBhIHdlYWtuZXNzIGluIGR3YXJmc3JjZmlsZXMgdGhhdCBoaWRlcw0KPj4gdGhl
IHByb2JsZW0gZXZlcnl3aGVyZSBlbHNlLiBUaGF0IGlzIHdoeSBvbmx5IGJlYWdsZWJvbmUtYWx0
IGZhaWxlZCBhbmQNCj4+IHdoeSBuZWl0aGVyIG9mIHVzIGNhbiByZXByb2R1Y2UgaXQgb24geDg2
LTY0Lg0KPiANCj4gU291bmRzIGxpa2Ugd2XigJlyZSBmaXhpbmcgdGhlIHdyb25nIHBsYWNlLg0K
DQpJ4oCZdmUganVzdCBzZW50IGFuIG9lLWNvcmUgcGF0Y2ggdG8gYmFja3BvcnQgYSBub3ctdXBz
dHJlYW0gZ2NjIGZpeCBmb3IgdGhpcy4NCg0KPj4gZHdhcmZzcmNmaWxlcyB1bmNvbmRpdGlvbmFs
bHkgcHJpbnRzIGNvbXBfZGlyICsgIi8iICsgbmFtZSBmb3IgdGhlIENVLCBzbw0KPj4gZm9yIGFu
IGFic29sdXRlIG5hbWUgaXQgcHJvZHVjZXMgYSBkb3VibGVkIHBhdGg6DQo+PiAgL3Vzci9zcmMv
ZGVidWcvZ3RrNC80LjI0LjAvL3Vzci9zcmMvZGVidWcvZ3RrNC80LjI0LjAvZ3RrL3N2Zy9saWJn
dGtfc3ZnLmEucC9ndGtfc3ZnLXVuaXR5MC5jDQo+IA0KPiBCdWcgaW4gZHdhcmZzcmNmaWxlcy4g
IGJpbnV0aWxzIGhhcyBhIHRvb2wgbm93IHRvIGRvIHRoaXMgKGV1LXNyY2ZpbGVzKSwgc28gSeKA
mW0gYWN0dWFsbHkgdGVzdGluZyBhIGJ1aWxkIHdpdGggdGhhdCBpbnN0ZWFkLg0KDQpNeSB0ZXN0
IGJyYW5jaCB3b3JrcyBidXQgd2UgY2FuIG1lcmdlIHRoYXQgcG9zdC1yZWxlYXNlLCBhcyB0aGlz
IGlzIGVudGlyZWx5IHVucmVsYXRlZCB0byB0aGUgaXNzdWUuDQoNCj4+IFdoYXQgaXMgZGlmZmVy
ZW50IG9uIEFSTToNCj4+IA0KPj4gV2hldGhlciB0aGUgZmlsZSBpcyBjb3BpZWQgYW55d2F5IGRl
cGVuZHMgb24gdGhlIGxpbmUgdGFibGUuIEkgYnVpbHQgYQ0KPj4gZ2NjLWNyb3NzLWFybSBhbmQg
Y29tcGlsZWQgYSBtaW5pbWFsIHVuaXR5IGZpbGUgd2l0aCBib3RoIHRvb2xjaGFpbnMgYW5kDQo+
PiB0aGUgc2FtZSBmbGFnczoNCj4+IA0KPj4gIHg4Ni02NDogRFdBUkYgNSBsaW5lIHRhYmxlIGJ1
aWx0IGJ5IGdhcywgdW5pdHkgZmlsZSBvbmx5IGFzIGVudHJ5IDAsDQo+PiAgICAgICAgICB3aGlj
aCBkd2FyZnNyY2ZpbGVzIHNraXBzIChpdHMgbG9vcCBzdGFydHMgYXQgMSkNCj4+ICBhcm06ICAg
IERXQVJGIDMgbGluZSB0YWJsZSBidWlsdCBieSBnYXMsIHVuaXR5IGZpbGUgYXMgZW50cnkgMSwN
Cj4+ICAgICAgICAgIGxpc3RlZCBieSBkd2FyZnNyY2ZpbGVzIGFzDQo+PiAgICAgICAgICAvdXNy
L3NyYy9kZWJ1Zy9ndGs0LzQuMjQuMC9ndGsvc3ZnL2xpYmd0a19zdmcuYS5wL2d0a19zdmctdW5p
dHkwLmMNCj4gDQo+IFNvIGlzIGluZGV4IDAgc3BlY2lhbD8gSSBkb27igJl0IHVuZGVyc3RhbmQg
d2hhdOKAmXMgaGFwcGVuaW5nIGhlcmUuIEkgbm90ZSB0aGF0IGV1LXNyY2ZpbGVzIGFuZCBkd2Fy
ZnNyY2ZpbGVzIG91dHB1dCBzbGlnaHRseSBkaWZmZXJlbnQgdGhpbmdzIGhlcmUsIHNwZWNpZmlj
YWxseSB0aGUgdW5pdHkgZmlsZSBpdHNlbGYgaXNu4oCZdCBkdW1wZWQgYnkgZXUtc3JjZmlsZXMu
DQoNClRoZSBhY3R1YWwgcmVwcm9kdWNlciBpcyB3aGVuIGEgYmluYXJ5IGlzIGJ1aWx0IHdpdGgg
ZHdhcmY1IGRhdGEgX2FuZF8gdGhlIHNvdXJjZSBmaWxlIGRvZXNu4oCZdCBhY3R1YWxseSBoYXZl
IGFueSBzeW1ib2xzLCBpdCBkb2VzbuKAmXQgYXBwZWFyIGluIHRoZSBzb3VyY2UgZmlsZSBsaXN0
LiAgSeKAmXZlIGZpbGVkIGEgYnVnIHdpdGggZWxmdXRpbHMgKGh0dHBzOi8vc291cmNld2FyZS5v
cmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTM0NjY2KSBmb3IgdGhpcyBlZGdlIGNhc2UuICBB
cyB0aGUgZmlsZSBoYXMgbm8gZGVmaW5pdGlvbnMgaXTigJlzIG5vdCByZWFsbHkgYSBwcm9ibGVt
IHRoYXQgaXQgZG9lc27igJl0IGdldCBpbmNsdWRlZCBpbiBvdXIgZGVidWcgc291cmNlcyBmaWxl
Lg0KDQpTbywgd2hlbiB0aGUgZ2NjIGZpeCBpcyBtZXJnZWQsIHdlIGNhbiB0YWtlIHYxIG9mIHRo
aXMgdXBncmFkZSB3aXRob3V0IHRoZSB3b3JrYXJvdW5kLg0KDQpSb3Nz

