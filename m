Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2623C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 15:58:45 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.492.1782748723062618220
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 08:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QjkG46Kl;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QjkG46Kl;
 spf=pass (domain: arm.com, ip: 52.101.70.23, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=p/PzxXPVDaoromJf3c0W/nJR52rmYFpBOkjzKUQfdngD8la3QEgt0nYrU7yMRU3lEY0ROM9w5aGiKlB+BHGlbQi4A3RRYSzPo7oMLDhVeOCp8J8irWeOOyqavV6Ib59gmSal4pmFiWC1Z0oknt9ZC2Lb9S5219tmmEwKMvsh2pSPMtYlhMcZSOWQ7ThB/sVA45sRtHwJLJ0sNbaQvO+tb1d1kAsl0KxRVazYQRdIn77jzwf0PencROHcT/FnlkO/53YBEWBnpAQPSZ9VfMhqhokm2hmR5Ra9dix3b2T0oN31i94912A2TO2dBDM17inZCAWpLmkJC03pDMjyLRGZ5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1mVkdIQySAtK/dVDrN311UWoxWSXLEmi5dW4potBdQ=;
 b=VY3AkJZ5/3BbQsKTHh7jqwVYP3X5LuNlOGS+65nZmr594NU5COiuQ0LZdL3Nc+bTd9T5GB6Wz2JP7UbLVatlebYMPoGCwzPQtep2eO6KRVNoAFZ/tmQbsPlp6QlkpscqUlf4jBkM1QkAFEVLqDHK67hZuGe/5woUzAoSLmLl+sGHdksdXbqMbTi1xnJdJoCrj2hpOTCTIggWc9ZFs3A0RRpNqSK1ED1zIhMgPalftxPaaIVMjSypTcTCzTu1EMrs87iHTIvH0YLq3pTiLxmOmzs3r+gS2gll2j9pgY40EDWNaVlbqg81pVJtTmjNK9nD9XfHV6Xkx1sykcz4BshwyA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1mVkdIQySAtK/dVDrN311UWoxWSXLEmi5dW4potBdQ=;
 b=QjkG46KlPAPedVbQ13YAhSdGlWr/F/zVfefwM/Em9cLFKt9CG4J5A4hDYs47cbJ4TWKNiHKCm//QSnksQk2dIv1o84nKpfkxvGrwAj4GaMBHSIsYSFHrtUQb1vpKGSrHyvqhKZxLKR3qRKF0AS/ricNv7P+FLmxaalABZcgN3AM=
Received: from DU7P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::20)
 by DBBPR08MB10721.eurprd08.prod.outlook.com (2603:10a6:10:530::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 29 Jun
 2026 15:58:38 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::7d) by DU7P190CA0024.outlook.office365.com
 (2603:10a6:10:550::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 15:58:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 29 Jun 2026 15:58:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIVtMIOgzGCNHiY8Z42aodtYbzpBSYqHsNG+JNH3Xh29/FkErtMEcxpkfH6WcPKzggoGyK3AZ++NaiM+YCTqiyKFTdbVOGl3JIiQ2e9hCYg6YOuEeWBtW2lO7CoCgmACEmv51W8KqKhkLkHlErtuDHY9P5DvCmNnqcXzQcvV4EGNTdVIy0HfQ6Sv8tXNkUBdgHNf4kdwagkwi/CVFGkJ2Xvf8YjrLSvSrBTRVzxrwbQJ1d0ATFngPJF9omLloCTgmX4ZzSnIQjbcZxn6gEKvXj9yYi6mK1+GoyO7TFoCBx/i6nE3SZG3KdvIgeGdcAV24fF4yeGaOYQbBCgX6U1UIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1mVkdIQySAtK/dVDrN311UWoxWSXLEmi5dW4potBdQ=;
 b=UBqnd8N/+anAVY3OvpoNUA6qlq1cbMnf/zlexovVfGSiCncwfOFtQBAJWOizGo+o9ZcpkGkzpRUod2dZn8S1ElksGQLamNUD5ANBGJ4ODPAnWSNCBSeTc9oeVA62xfyNEWZNzDb2Q6nO6WnwFeSdFJZkE9Bo+32E5hXlCTMfCiLRtk3ae44aekO7xTAdCnSFMYIla1WK07iNaVKOcVGagWSOGbGgZ6nEGXTLINL9rFRU4Ch9pYE10v0dWn0BnLLgcupmeeRWx3zhhArjpLh+20zhMJdVJQY7SGZ/mkE+YLw1TXBBLFHvCPMlpXHb69UfTTNE5zhKM6rmOvFf5iYecQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1mVkdIQySAtK/dVDrN311UWoxWSXLEmi5dW4potBdQ=;
 b=QjkG46KlPAPedVbQ13YAhSdGlWr/F/zVfefwM/Em9cLFKt9CG4J5A4hDYs47cbJ4TWKNiHKCm//QSnksQk2dIv1o84nKpfkxvGrwAj4GaMBHSIsYSFHrtUQb1vpKGSrHyvqhKZxLKR3qRKF0AS/ricNv7P+FLmxaalABZcgN3AM=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DU2PR08MB9991.eurprd08.prod.outlook.com (2603:10a6:10:493::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:57:35 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 15:57:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] classes/meson: use ninja explicitly when
 compiling
Thread-Topic: [OE-core] [PATCH 1/3] classes/meson: use ninja explicitly when
 compiling
Thread-Index: AQHdB9HatQvDJH9KxkGde9TjEmuiMLZVmLgAgAAXlwA=
Date: Mon, 29 Jun 2026 15:57:35 +0000
Message-ID: <2B810764-3EBC-42D8-BF96-B9AAE9C087B2@arm.com>
References: <20260629141559.1305873-1-ross.burton@arm.com>
 <CAMKF1spi6u8p2GN1cOgRhwifTtH5ZX14Y8OnByn2fGjU+AtoYQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spi6u8p2GN1cOgRhwifTtH5ZX14Y8OnByn2fGjU+AtoYQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DU2PR08MB9991:EE_|DB1PEPF000509EA:EE_|DBBPR08MB10721:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a8deb5-433e-405f-fe12-08ded5f7489a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|38070700021|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 RPmKOODLk7naLaYpZdvzoDyrd3c5/0uUhixshVlt7k8J3zJ08gBocskUukpQ+kcyH/iqND3A383rSDSjeooAMPa8YjC6rEcPWhIi66aPq9SGbIrCVimD5+U1JGYIafujhuiJumb3rInCZyD8wfBZJYX3OJbUyozFEKiWLbrhmVg+chiHOAGtreAfa2ZhqCc8Q97mrk9B2KKLWhz2hD+biufdXpb5zeuu79Ws4suC96Yj7lg5448N1M2MN8ApAtXm7fW9kfFuggogE1Xv3qKOqtNE6s0FCRexit048599IwOC5f3VKFaHF1sYL/NTi4QMJXNhTWN87NMxnQHw8SaJq+4BV2porZI5pjafvCVg57D5X6GkWxr3uDNcw0WVYJLfRyer0eg8rmSEhtM3k3ga5SfkrKf2JQjTWk2ZQVbsPXA3K0VFMQEUXALs0zLStXv5oBXc/naPRj2mvp25SLhdfz2t4aXiVGdQJ+etolstwPgMDZlM0OuvPArhJW8jtIQ7Lv4VdgefhMc0irJUrPGnzpK3R8Rj00UA8amJuV7TYH9fVY7z/q2gPyb8IpNU7Agal9z3TrgdSOpM0DkFyzD9cnuK5bLX/enIDR0XBGpS1UCnm4kFFsjEoMgg44ZOj5r0KOO7+gT7vNNUONB94nhMlsmzZ++VM6t87/U7gMicTCcjromQgNaLQ91cT64Ijzs4h1csGfefc567a6WIXiteJMnYg5XfoVpOt0l/jIQd5HQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(38070700021)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <55F0781EE9080B4987DBD1D0789CBFE4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 Q6l8axc0nxI4p0gWfgzwzlixj8rN07X/p7lwxj4Ei9XuINPcW4HGLOHMNhQD3MsAZdPEx7SqzbG/Y7qVO3G4vldxbuz8O8VCwsUgUH+rlcXHFMnpG8M047qVhhSBbj7xozzhdtQKnUahAwOlL7B+tqAfz26cDGdw50I9Vv3GpI6mxOYJj+GPfE8EO5rdKAMNC714k1wCxB2M10parmtEHlM6OD5OFbAg7PVAi45YP3sAvoqU16xTl5DesUQqI3m17e4KILhztz6K7bLmpQ45fdklSt1HB6fRrTB5X7xw0uBV3jca3Twrqo5pmFIhLjSddszH3m/2Xf8Z7dRLlRHmYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB9991
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ba53a905-abf6-4ea0-dbfc-08ded5f72320
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|14060799003|35042699022|376014|36860700016|82310400026|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	XNi6VrvPZTKhUupHjBfKTRzjlHvuWT/PMnqBURUXzDH3hcoqG7oFDWUOqWpcj2PPOp2hQ85waADUTb3/T1vlmzPqswEMQ4PxJ1cI6yVW2g3MByzhAajKgVwk4Oz5bRWa6FBCmNCwqech+CUBI9TJ/RXU3H8BRPGkGBLASoY+rFsaCVBg53hnh4QiiqVKgMIPbJolyyyejqACUniCQhLBLsO0Uk+UMx/Gpz1duUQTYOFVTXRi4x6T8A1a7eeEEV0mGvTE//1w4g7oo0xKscIsgzXKBxZamFksiIupb8gOZv0aKE1cIFCkowP2IPtNzx9F/fBmj68EaKf/VmfCc6bq+5F73F4Lx9IVll75ZBCwKo2rPEUGX4ZJgvyKyZ1F75YGXkB9whuc595VQGvj8K0uy5X3LvCpaQAaegOHamhM8WmMwYcnTWXqvXidVqyZ6lJe7gND6QJyYgf2MTLm8I4NtDgn10QN1VJuNm0DjgLX9OboW1qKoHdY+K7jcSibE+Jv3zre8y++OOy4nekXfWA33cURJfs5SSvDjnYz/yerVCHYRevHyohNLg1hv8tpHc+TgBsMf5RV1Xi37n/AJpKg7mJ61qOWzSUD+FRHwuCDhGn62PhMelJe8acwj/el+GP5/QdLrnDogUcKzI2eJiAx4dzBJ705nKO1HBjvhEZqedFF2fiOAZbKvrQ3i2+4u0xmKe6j271v0h3aYRAOkOE4ZA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(14060799003)(35042699022)(376014)(36860700016)(82310400026)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	A7FRkJC5+dwA/Hi5jmjDy2JTH2k5cppvraGOAdrUA9HFa/dtYbRdHJxg6HUzVBJKawUQMM97QJ9ulyA2Sm/7TxA6OFvp+BCOVQg035eoMrfKQN98q6wyLY0HCgISL//5y5Zn55ce0qREIRtk+9GE5s1TfJx4aFu5ff7CK9g8RzGKAlv0qMqdAMzjpf2ZFHjQAEDEdFZ9ji2mDdAqs4ezYvZTGsVx4bD0e+y77HDthHU18Z3I3DrB0av/Q3thEZ7YNHjL2qExWI5r5h1CkqOgwgYj6seXAfcK2FBfWhMYcg9NtX6alqFdxo+MlrgbWUfNV9GaFUgkNUZvT0LQQznyiWIFz55Wdg5Tndw/AbvkWCz6OHZq1zm6hfmBHFWk/70KWZJ0cAsMc1ARsAECn5FYha0DzZ9BSJBxeKJyVHUe7XhHVgL55uE9eAVjV40ZcujW
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:58:38.4488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a8deb5-433e-405f-fe12-08ded5f7489a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10721
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 15:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239813

T24gMjkgSnVuIDIwMjYsIGF0IDE1OjMyLCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gTGlrZSBjbWFrZSB2ZXJib3NlIGNvdWxkIGJlIGEgY29uZmlndXJhYmxlIGtub2Ig
c2luY2UgaXRzIGJlaW5nIGFkZGVkIGJ5IHRoaXMgcGF0Y2gNCg0KLXYgd2FzIGFscmVhZHkgYW4g
b3B0aW9uLCBidXQgSeKAmW0gYSBiaXQgbWVoIG9uIGFkZGluZyBvcHRpb25zIHRvIG1ha2UgdGhl
IGxvZ3MgdXNlZnVsLg0KDQpSb3Nz

