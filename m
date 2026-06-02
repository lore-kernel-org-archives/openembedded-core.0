Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E81CD5BD1
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 16:58:34 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3169.1780419508509691486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 09:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GgR8N7Di;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GgR8N7Di;
 spf=pass (domain: arm.com, ip: 40.107.130.9, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=r+rwL5DkZmh7Fs3aGmSt3Jz1yvq3erv8P3EdQQfiI1q6QVuWsEnkHb7tV5mbx73RlvJ+YkmBVPMlfuLsiFrXpbeP7yUsZl1t5bwSD0xhWpWTSWYr+oyxoKlyzlc7xd54CtETf2JJIRVb1FRHFtO3IGDFWTcdaYVSvQEzdd7EL0r4HxJIoJynmNdG3RTvc4N0odZwqZOKf80O0MxXut37kOoqJL1Keoq/kMD5ksG5vT3+But6AVqh4kIo97elNOdr86TymCansrBXgE7BK/7TlFEHbNFc+bdUyhpcm/nAZbXSKRBODIXAQqdIMdxWpbvidmbrgs7EiB13FYZj2BndyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nm1TkW7ORY91PsZA+muaP+40XTHh5mb9E3rDRv68q2Y=;
 b=CsWQ7vCL9N57Sr75le62zVjHwOuLTNTnt47C+pNzaVLwCA2/D2pA/y/FQZRNHeNIWcrbkhSnZr7YM8lvQPbyqtIHhA1OD/qdeRX4lwgpUuPsAGjOcnaVk91hggpZyisjztlSaseLcNPejOh1D5/cfXedRHnpB+vtJ2Ya4oxNx0IYMzbPus6uPU+Q0hk0qYTU1m96/PtVuwZFZCiWwE2Lm84k0qXar0cZ6uJMPIaCjoAK41jDFACIfsLekPiCS9S7GM+7N8P81wlS+/2y8QuEw2F8KTnkdet8kMdJ1CQ00ZWIpT1NUH/NVKwsxX1+da7T94cH29gBOypYTl8g3+m2Ow==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nm1TkW7ORY91PsZA+muaP+40XTHh5mb9E3rDRv68q2Y=;
 b=GgR8N7DiAXrBCK0iQg4YoOC4+5cTo1pbtDBUqI0f0vVsEhxat501fwmfYd3EkuNm4QGESsY5l8Brin0dxI5vUAAUQzcvb8lPZCU0RTzo9XFV4+CzJk1gWQb7XqifdyEIsCHYFbyIEd1Zce3aVVBY7CzZ5Dkk5EDBIwg4q1DisKE=
Received: from AS8PR04CA0154.eurprd04.prod.outlook.com (2603:10a6:20b:331::9)
 by AMDPR08MB11388.eurprd08.prod.outlook.com (2603:10a6:20b:717::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 16:58:23 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:331:cafe::58) by AS8PR04CA0154.outlook.office365.com
 (2603:10a6:20b:331::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.15 via Frontend Transport; Tue, 2
 Jun 2026 16:58:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Tue, 2 Jun 2026 16:58:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAMrZAVks+yaIbTCGq2ojx2FdFG/Dh/XyiNx/wsOf8AcXVtRrv6nzcqTG2w8Sx76XIITjPix1xqIb7k8haVq+oim+JfjimEtnVH5IacuwBkG6mgOju0uymIk8AwgCj5Tvp0q2VJE8+Qs1y7uVweaRlnH6Xg5w08RcwM3ZRl/OA2IV9gLYZrMoSZInL0L5BxQPtZhPNJJIguJY0qPswD50bv4TAmfik2Hn2jphMu3abOepa514Re7oi7qLebzqA6ou1NIE7//W40RNeMCZ8214s+/b6WCI0ealeJ09CCWceaVwZSvxFv2Wd+qpzdxbITFqAJun8Bh288HN1Ie2N822A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nm1TkW7ORY91PsZA+muaP+40XTHh5mb9E3rDRv68q2Y=;
 b=J5Fxeb8Ts69E4NKXT8pbfAe2coaQtmAh7RYeGcuOOfGvqMgDhGrg469oZ7w31uGV+8G/oQvcjtDcDFYhdbx0F/ygoFojRZkqTy5zH8tzQsYzqkz6RKtGjwYtQL3v7a4PUHpvzfXqCrv3eqm3zScF4gWEQlahFVzPjEI11fOFYYIlRtpcXUm352obs1krMaQkx1xjmGQJufG1n7va1PKjsUg/CeOyXAW1dYsj/9wby4lfIZeDzRR4HbURj4qIvEj6lzp/ZcFPKp+ijsJcp68eM89h7snsWieKz1j5jN7WNWG64MP00+p+LWkGRKiaixcK6hQQzqh6LUWWiC2KCUr3dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nm1TkW7ORY91PsZA+muaP+40XTHh5mb9E3rDRv68q2Y=;
 b=GgR8N7DiAXrBCK0iQg4YoOC4+5cTo1pbtDBUqI0f0vVsEhxat501fwmfYd3EkuNm4QGESsY5l8Brin0dxI5vUAAUQzcvb8lPZCU0RTzo9XFV4+CzJk1gWQb7XqifdyEIsCHYFbyIEd1Zce3aVVBY7CzZ5Dkk5EDBIwg4q1DisKE=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DB9PR08MB7651.eurprd08.prod.outlook.com (2603:10a6:10:30e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 16:57:19 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 16:57:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Quan.Sun@windriver.com" <Quan.Sun@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
Thread-Topic: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
Thread-Index: AQHc7uBcNqIOGzdLsECsFrVYZ+HbzbYrg/AA
Date: Tue, 2 Jun 2026 16:57:18 +0000
Message-ID: <85CB8A63-D069-40E7-A0C4-74D615E6CAAD@arm.com>
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
In-Reply-To: <20260528202639.4097815-1-Quan.Sun@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DB9PR08MB7651:EE_|AMS0EPF000001AB:EE_|AMDPR08MB11388:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea57e5a-1028-479e-664c-08dec0c827a1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099006|22082099003|18002099003|11063799006|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 SMPfuHagFlpNDtC9GYHE0nTFuNeYu/PpkGvmdnPbI0GJ36eyF5yHQLXOkjM91yB5DyQFdhZuqU0FVcQ14BatGgzxW2BPIZAYfFYpGP02IMBzESmUYp8ow9m4xg5OCIgazvox5dYIll5PrdAIX0OG2zS4RIDt+ZS9Ze0AAZtkEb29r3aLDM0R51bV8iWvdKuwE+dTd+btg7Pw76B/jqedVHEMK2C1gH3A3VYaGwSMWsqpSBTBrJFLi/Z2JfxrJjfvPZm1nRUqMfZ1kEFY73z6WxL9erESpG4no/D9yHnGmDhAUHRh6WASDRdvtVv4588gYo1+Vr3vY/jTOhxVCV3VEALGWF0vK/B7Kjk9iFufSnH6GhH8GoGq8vWNTaDZmGLuT+/ClThZPT7NsfqxGvCkRs6wP52xP5ACms51W+wrm4oJQdCAW+niRUDNopFIEVeom89ha5kh+gL+ygmEZgyUHwHq/DYeeO8mm4ubYUdymDyKAlP6QiXwWY9YYil931iapH79I1kKOUkbJ+0VdY8vNyLjtB/Yfj3L/ZEoLg7ZDtZUOxRt5sIm47ZVpeyShZvixP70NuPxVP9FifLMmxqFc3YaUKud9h3A1skLy88QmVWbCdu0/p91jhrh8M/MDrewO9JDhRFbdn16DhdhSePpHg27PIDwaf6sRNcv7Er3UGqpMIRK3cfJDXX9Ag874ldYSSretDlxPyIU0K/FenaBysJ8qxBSVIgIDSS7FHbb+vY9eYZVFyloostAXCi1k14S
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099006)(22082099003)(18002099003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CF7D96509353E14D8D65E2EB13D778AE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 C7D2hWm+GsPu9h4jU2LSLi5Zq5Lyxl0nqUoHbyXUHsF+H+ds39lQwMDr+HulBlOeKZMkakCf1ORU6zHAJawHBPdJ7kQaZ5AlcKApff9QzBV6/TuECaapDrthhIDo+qZUBD/KwXLJcyvJV3uA6+9uGU2ln8j5AfMqIe24bBWlgrHN3A2lkS4GOq1QGPzWs2mUfOHEcjjn1dzp/v1pJPASYMZsPrddHEv9E7DGK6rH69vTDhBcQ2jkujj+PGErNSLDbrVKgJT5DZb42+wRaKfBSc9rFk9TpzMFR+AlW37Q1lV22IxpbwpbCr7gzEE31k7ooAeqE9KwvRGO9YZATJ7wZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7651
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	695724b3-f73c-4259-a29d-08dec0c801b0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|14060799003|35042699022|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	LAdm7pBIxtq77jFzMdj2ZpQ6vCEq79tUDQD3rJTAHlBmuIPHJPYm/OK50E61/wdoKok30U86UIImxT9pjJlDuQ8/O0ZvTru/IR3Aiuzecwi4xY9/nXKJg4u02C1IjnP+i5BC3M7xRoAAsFvRBxUctYI7cR7F66VtezXX6gXGu/OjQrem0LqkycgP1APPE/TSaBM64qdayAyxyDtMkgbEjMPiGZRGEWCMI2BBo3fVPrbJiA94EXD/af9hCjBPn3hbdB+EHhJ4PPdB87d6sl7jKcIi109YpF0SjROCGBr4xdkXdMrMN77UDdKnOotF93yecji/mJGySdJZE0eggSNihVATWOOhEDK5Ld2D1pf0CzGOlk1dOtTsozjG/SlghJkAKG7ndB2nI5FXrvdLWQMj4JdsMIwBHrnO5sUuu40YZUbPHsfJQnEnwfRWLlFvcol1zKXCoH7yPpIuVJ+ChWY7tPKhVdvH5MmpkMqdyyatjSTMoYFv7MmdbiaCPg8CosHOg/a0z1AQbohK1FcOgjI7TOTphFD8r43ebUIDKz+6J+5Nu25NkRgL9ZAbs/21rSXHZgCcN2f1XPziLw1y1RUbDvXInbRSfcMe8Id6J8HpR+zcHjLMaE86/MGJaaDLebjJeisqaA02ybdQvbfdUFSjpYkiq4EdpE9Cx3dFWZ0DSPexy1Bf9VE16ymESnNVPQ4CkxgtAjbVrcizwmoKaJPT8co29eHBvFaK4xheRQdcwW4=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(14060799003)(35042699022)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lnz/OENq7PzA8FwMHU5vwCveAts1kkXYZ+kbAUmOE1VAch+gaNSzTJlsPKlS0Fia5FRA39d3ATddeTi0S+x5ZVM/V5I/t+EKnRb/+TB9vY2zx+mDo+4wqvHma4Dv5gvFYAKXQIyjFAAaU3VwKUWQBnBHTy+3AOpxpUHJtlZwfW1ciOXS8VG+rM2dpZS7krQthRJ2XzouW1QhB2/eUg4qQqG9npWbN/FCk+o9QgtmbCnl1Ona1HpawIZ0bbWcpW5ILYrCM+oAxtMCZiSLfMWf/GOlGGelxh0jTCjQxUtZ/wo/fTb6csHhEv4xDRDY6t15u7tdVLFus2GV3RG9njaD7wpfjrBY5rOQUhjWaVkb6uTyjy00PV4JL0jKFdzHOQ36bZvdZaaseSvc7vBoZ09+56zM2qV6mRwGPCunNqYvD0WwBLVahiMu4TYfbOnPsMgD
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:58:22.3662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea57e5a-1028-479e-664c-08dec0c827a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11388
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 16:58:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238066

On 28 May 2026, at 21:26, Quan Sun via lists.openembedded.org <Quan.Sun=3Dw=
indriver.com@lists.openembedded.org> wrote:
> - Add python3-qemu-qmp recipe (0.0.6) as a separate package. The QMP
>  Python library was removed from the QEMU source tree in 11.0.0 and
>  split into its own upstream project. This is needed by
>  qemu-system-native for testimage integration.
>  Add an entry for this recipe in maintainers.inc.

Can you split this piece out and send it separately?  We can merge this now=
, whilst the graphic and other issues are fixed and tested.

Thanks,
Ross=

