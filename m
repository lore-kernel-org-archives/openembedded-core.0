Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A77CDE008
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 07:39:59 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30544.1782459589002677659
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 00:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=B/70t3tW;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=B/70t3tW;
 spf=pass (domain: arm.com, ip: 52.101.66.28, mailfrom: luca.fancellu@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MHvzKaPzCe7MS/GKuQfnhgpgsNsuXt59M8jIX+Q2mG/scEKSUI+nVq20z9b4nW2mAbTXMlY7qXtiLnpZGNqM93eD4SZcM65HaE24FTx8NDmxUNBb8hTAbPZOqpV/ooJ3Lrpdi0ZWuzvikBnhz6PmUuBHFo+rgyi3kImp3m9zphju1/2YF2IGT+ea3GqbmYt0Mv/OugA+6aDCXI8e/+De0yYoUsyaSvqhlKtximpWnN6RlIlOdWit/43h1ZBW4RvviQkS0DIZVxCbq6rpAaz6Q+sTPZ++fr2+ZmmaOuy1jlh7ORtpMxIuDeJIKmiMODSj8z9WpGxU8MZDY8unov4NHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARe1PHXEIZOLOUhl7azNRKyhW2UNi+iXM1Vnxiqy3Ik=;
 b=lTnLc7ZruaMIqGANHFU66aH/Yq8SRPVf6VbnFKbz4gR38nxPgqE/sb32lPwnLYtwzl+E4lZrs2oZmF6Rj72cX1YRe6SbU+CXpRKevY46e5oLL6491GBYuDDKVwXXcVgoha1ya9zT/At5jv4mCc59Stj79N6FC7/h4qpCbu36AiXFw48Vn2SW+bD8rNLsZgMlzm+OP7ZlNrZh/+ZATDQ4lNnmzzCxUd2SXJqrhn4FNkDPVHWshOhB4dHo1NSV85dNvzndDS6TZ2v67Ul1sNyRhVkKceFBARP+anboLTrg2cFK4DpX+CrqnP1kdYvBtW0AUef91cdCf0rUmi5xYogrMw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARe1PHXEIZOLOUhl7azNRKyhW2UNi+iXM1Vnxiqy3Ik=;
 b=B/70t3tWjykxlP674H2jukE1SK2DDPLuXxmGBxu/H4eK6/8WHM1nSmyA7uiAPDQ7PFk0fFlXr5GBp/FpLH8Lq8naWy0W/ZVTKceb+XGomPGmArwutzTHYwzGyIe9owTNcx4pz1CV+xFo9aXXpXd/ve6gmDxQmUYHafSToGQkUj8=
Received: from DUZPR01CA0303.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::27) by DU2PR08MB10067.eurprd08.prod.outlook.com
 (2603:10a6:10:493::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 07:39:44 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::9e) by DUZPR01CA0303.outlook.office365.com
 (2603:10a6:10:4b7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 07:39:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 26 Jun 2026 07:39:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTyIEdoQMJXMoYOdNx7DLLdej0gzbh7vP3tmbTUHUbEXg6K8VwwLMugHOgehoSvIHMEc1HZyv2Jf3k0RRD25o1IEsgOa+fJUUIDhPFXb1VzoeUzXxcluCsALiqphGN2Mt01a/gSLdFvtXW0g/LGe0YSqD+hyhzCc06E6N1Bc9UrsK0wW0i0p6Ft9No+UM0BWx+8OBJJDn8QNu+Rophdahrsg/QEYztBAT5DGH4EKHYeNKq6wl5Z8vpWw1zluLp3snMtrtW+dfgs8d7xYoleROK5Ry1q9BXSnCx2rfXxJnP5gSYvHj1fHYpIcOCIilPOCgiDrYkZKELoYeTGjzMFtSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARe1PHXEIZOLOUhl7azNRKyhW2UNi+iXM1Vnxiqy3Ik=;
 b=yCmo2PIAIrZj0Bi7rhkBmjsO/RBSERfbEiXVhfFAxd5jERN6yQXymsjyPO/opk/1CfHAANU1BZ+GBaQZ+MVko+lfH77KR+CWYhhWV5mPxcJfxXqcjUMEqR98CHZOyhW3zTgjJ4FdJgJq+LC2RD/AtIYXTnVJrsiS+BsIQ7jmPZ2IFgwri6WEi2X3Brh0KqfnN4HXm4vsI4M99/7h77FlW12u7x2/KcJ9TWOGUq5DJfha0BUlzrj0zsnQroO+akfIl1nvJTi0vZOyJ3FiJge8i6EifNtUtt5Q6SquIoHjT9AKZV+3ce89u59rf9t113Ul+dVHkVMsjyP7RovrgoffHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARe1PHXEIZOLOUhl7azNRKyhW2UNi+iXM1Vnxiqy3Ik=;
 b=B/70t3tWjykxlP674H2jukE1SK2DDPLuXxmGBxu/H4eK6/8WHM1nSmyA7uiAPDQ7PFk0fFlXr5GBp/FpLH8Lq8naWy0W/ZVTKceb+XGomPGmArwutzTHYwzGyIe9owTNcx4pz1CV+xFo9aXXpXd/ve6gmDxQmUYHafSToGQkUj8=
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS1PR08MB7563.eurprd08.prod.outlook.com (2603:10a6:20b:472::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 07:38:36 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 07:38:36 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] llvm: Enable MLIR support
Thread-Topic: [OE-core] [PATCH] llvm: Enable MLIR support
Thread-Index: AQHdBLZxzjTrhzY24kusGB1XpsuCcbZQdAaA
Date: Fri, 26 Jun 2026 07:38:36 +0000
Message-ID: <60267670-C3C0-4448-B2D8-B7B60E7297D3@arm.com>
References: <20260625133120.2111653-1-luca.fancellu@arm.com>
 <CANNYZj8L9c48wTyEp38RkCMzi=XQQS9_rr++KJwZvk2fSuTHeQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8L9c48wTyEp38RkCMzi=XQQS9_rr++KJwZvk2fSuTHeQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	DU2PR08MB7272:EE_|AS1PR08MB7563:EE_|DU6PEPF0000B621:EE_|DU2PR08MB10067:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c3f240-2e70-478d-0447-08ded35616d2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|22082099003|18002099003|38070700021|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info-Original: 
 BqdjQhAff2hlyYAnndj5Zbb3munyIQbLQa5xJ4pd9MT6cVN3KObu6jL+ALMofVYOKgB2JsXE2V4pZRZUUKafTusKzhz2w0jscB9g4Q3CpodzSU+RbB2hJzI53QSIji9r3hAUySaWqhPPWZ//xEX1rmfSf6Y6t2nZyIz0W9yntR+bQtpKHb/v7+dBBVFrYv12iZQLZRCqCJQLtXq4HeDqAUidFaYjXF//aVqbF7lClES/4ReiqkzOgD79iRRVj9nOqS7OHZXjoUeZ0Oxp5nQwu5QKZs4blKp6oIEBSUldmUJwZ9+miq4NtwvCSt14pDgPd18zN6qE95AqGxTzF1gR/7xhlgW26rwkWnWef1UU+x8O15I6XjnQ7IhsrYAkLIaTdsgmjvRvd73PPcuIKwSow22ysQtwLyqSfwiwMUVEIX0kpRdhDHQDH2mEM5C5XRWU2VZVC0AH5i/F+fx8N68XMTYkGcV3kbw0KuvrevVKZuM/gzAGOx5EzX8meoWdtEdcwu0o6VfLRUsJys+l+gvQFjb5T9QYWstMxoZvORuELBDYcwTq16UDxBImD3CRe0/y/sS1ebs5ok/U3IeElnqA7ORkdtJEEDehZFmxE0wKkXLCqIwQksYj4nYAVbQCiPHBSdxdme+1CqcWr9P+zjUIMThONQWSmuRVQEDDTukmfA+9Wd8so/WhpSYqfPZ7DFQZckN+VCh/NWL5eAu8Lbon7Ci5Ixm8f554df7/ce4iY0Q=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(38070700021)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <55DA1A0E221FB74BAC64124C24BB2C17@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 d6o24G9O9UWowbeg3GPck1w75lgBJgpSlfrxUqk2TyrAoQLkDsGEFibrQfrMS01pPZ7KScf2FIi3B2QvgPgABQcCbhrFBCI2U/2pWuJNwtOEY6V0KzUAQF7okUQDEaNpV4ir7OlVsqL+hyvQFASXs27g1IWHeXjGFigv1uWOYpoPkzBGTN1iJeEJrrR53FfKiZ4ulV/kBopzJy9Gt/3t1vwA3E/kBsAIUokysVl9rKvuBrtTMWW1piqWJW/FerG/OJgNlIrOn7EG7dcCnv3OMZS81NFqr/SUsmW166gcz1vFjHsZBmUUZfbLuPpAifyJOfs66dpa1eTe2D1VJhbmUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7563
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c0959c9a-5526-4b7a-32aa-08ded355eea6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|14060799003|35042699022|36860700016|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	L7dTYRPpOS6RXYyYRg9+mamW+7jtu+hlxD2W4+DvY+6WDHv+Dfz2pETA9K21EGoZH/sdMNuV9Ph5KE0XBLqSX37u41jrnYLoD/va1fDJcvYWkZYcoJHSaN7nGsngQm+bJKk5dSfkelyrUXJt/Nu3h7fWO5sQRN0k0KF4CFbBM1drvlCmVuqn/OSJsbQUw92S19+5jGIW80QAI9qwsv4SeD31Y+CaoF19ogLo/SUi8PZVH4FsHKO499/tRJ+05SqRewVHaNSH4dagQJKDwhobtnZhxvHufpTg4PAtxhS8+pVduwpmTspW33bhsuZRY3+L4wwmNUpIfFfNnGWM7GwOI3qekbaIcBwzHcQVoGMwQLpiWJiWUzCc1BdNSTapBvra5tERC75hBbdms322UYBsnYa/0tFZWER16+O38NcOBF3Xgtd1Ay0hHAaxaB5bruwV9UEi8Ot355cGaKPAn4FBg86fOh3eYitdB+nhWgadF5KpZUKqnD01xo62H1svluPihd9R8Lf5jn4FUYITd3EtDRaHwrjFC6E6X1i3vdMZGUUlS1XLDfrsA5FVvwYLy9WFa2sb8COp2en7vgA9QwGaH5OEm5cL4Lge5atW1eU4Rtcrw+8cjnODPzXG4UVVIrVWAcTvlTkfcIaMUU25g8LXIlsntbsYUarFBSCbE5Il86RsrnZaRKlznHTTnWjCe4nwGiVgLlcG4sJQv5u8vYHQHg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(14060799003)(35042699022)(36860700016)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zzjRKmRdrByAez/Be293tSaLDJF9Gn8wPLbxYkqw8Scq4CGVsmlRNI8IobbvqB5Ti2VWjAelF4W2ZhRmBd91fXtOrErVbgSWYoVytcbwFX/6VwPMuFMdsIXodhqjpkur9If2Z6HLR2qpzZimbNhTBkx2KSGtlJL+/G93MJwHKDmMxZdrfDQxIr/rRdx9QKiCtn6lDk/Ngfn2aIF9aQPxDsNf4ISzs9cwx5Gmub1+WECO1O1oV0Ts21WtwKGU3vn0va/kdBTAJmPZ38NVtEuueLUpOh6gn0DaOUIkzEIUTBIqawcAvdksEGa9Scz0eeRo40JPQe30o9vq7ZWLudyrADL7SkKHeiNs53Z4qx3Caxe6FqWWG21Szlsi4P7AMvhTkj+vg4IWUMlNT87HFnw3iF/bLOVW87/bGbzyk6cfdDY6AK0TG2a8u0UofRfjqWFH
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 07:39:43.6248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c3f240-2e70-478d-0447-08ded35616d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 07:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239612

Hi Alex,

> On 25 Jun 2026, at 16:22, Alexander Kanavin <alex.kanavin@gmail.com> wrot=
e:
>=20
> On Thu, 25 Jun 2026 at 15:31, luca fancellu via lists.openembedded.org
> <luca.fancellu=3Darm.com@lists.openembedded.org> wrote:
>>=20
>> Enable the MLIR LLVM project in the clang folder so the compiler
>> flow can use MLIR and TOSA APIs that are not provided by a plain
>> LLVM build.
>=20
> This needs a bit more justification. What is 'MLIR', what is 'TOSA'
> and why are those things important enough to be provided by oe-core?
> The recipe is added, but not used by anything.

Thanks, that is a fair point. The commit message is too terse and does
not explain why this belongs in oe-core.

MLIR is the LLVM project's multi-level IR compiler infrastructure. It is
used by compiler stacks that need to represent and lower higher-level
programs through multiple abstraction levels before reaching LLVM IR or
target-specific code. TOSA is one of the upstream MLIR dialects: it models
tensor operators used by ML compiler flows, especially when lowering neural
network workloads towards CPU, GPU, DSP or NPU-style targets.

The reason I proposed this in oe-core is that it is part of the same
llvm-project source tree that oe-core already carries for llvm/clang/lld/ll=
db.
MLIR consumers are tightly coupled to the LLVM/MLIR version and exported CM=
ake
targets. If oe-core does not provide it, downstream layers that need MLIR f=
or
AI/ML compiler flows have to carry their own LLVM/MLIR recipe or build a
private copy, which risks version skew with oe-core's LLVM and duplicates a
large toolchain component.

The recipe is intentionally standalone and not added to the default llvm or
clang build, so existing builds do not pay the MLIR build cost. It is only
built when requested by a layer, image, SDK, or native toolchain component.
The native and nativesdk variants are important because MLIR is commonly us=
ed
as build-time compiler infrastructure rather than as a target runtime libra=
ry.

I agree that having no in-tree consumer makes the patch weaker. One option =
I
can add is a small meta-selftest consumer recipe that uses CMake
find_package(MLIR CONFIG), links against the exported MLIR targets, and bui=
lds
a tiny program using the TOSA dialect. That would not make MLIR part of any
default image, but it would give oe-core coverage that the recipe exports a
usable MLIR SDK/native integration and that the TOSA dialect APIs are avail=
able.

If the preference is still that new recipes must have a production oe-core
consumer rather than a selftest consumer, then I will drop this.

Cheers,
Luca


