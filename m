Return-Path: <benhur.tessele@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A48ECA5FFC
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 11:12:56 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43187.1791285174141141395
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 04:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=MeytY0jf;
 spf=pass (domain: est.tech, ip: 52.101.69.27, mailfrom: benhur.tessele@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTtVYiULBix6CD3LSNoS1krPAEWGACUm69YG9oQ2DMjrTeum5EuY/bBL8ADIcQBaPF47oy00eiQDjcn0bp/xX9Gi+7fEpY5DxPHU8oSJgzF1aLzZcZXX5sPY3bckS5JvnVZQOzSCN2zVCQXiocen6ef/ZcrAnrBD5KlkpobMgE0aYrf0o41U46lgMofKDO/LhA65C9CzBr/LZDXt3m9Icnm8VGhDM94XNwqtvgJvIX0QU8vnbZJIIVNTDdx6rTJvaYu97hvzxqz7JsfXPYUL+QKk7DMqf5kWajemv8z2eGl6of4qr0uBmPp18Itb75Q74+eXNuNVYc6C3eUXL+VPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=et8ji5a7HeFJRP9Wq8v4vRFvu+tYj83cUDFabRP9PzE=;
 b=uA2r/ehuMmY9cW2Kig8Wxck+eaO24Ly40MnaMLqGYvCDfxTI0SISr1yypP0aDPy9XnnvCwvmFweGj1AVe3spj76rOgfOJGMiUpUNINvOh01VbXXWLlaDBeNimMyavqL2d8/yOYUp7eOZ17YUh4T8RH1b6CLNKgjNFcM/aDFjAg6FlimTLklyehAzvyvJzKQLKKeWSTJRNdHhVKKoYlHoflqughqPepr7Zp9cULhRqB+8hyQl5xOswXdxGokWRkGdJUYlUagzzVLVreRoQOBmhb8pPg54oARVwCi6NJzsAt2mBbPWjmbG45lXbVlNz0G/riFWMWWyh+B+IuqFpFjj0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=et8ji5a7HeFJRP9Wq8v4vRFvu+tYj83cUDFabRP9PzE=;
 b=MeytY0jf5r1aKr81B3gpzhpbgulPgGvZRWq5zKq4rt/uO97oiNolyhXth/c3NXjuELwbzV1yEjNRCb78WbDBmdmoBoZwuwRK2hzliOaQ0AfRMdqucJB9PGgky4bmLunajpsMU0y0Mh3l3wIP6OwtKLPyjas8k1hjJtGyB2pxnJvmZKu7tBE2albmR0bDOizYKSIQsWXSsZt1J4/+oisP+kTQ/5NnkIeHZ/6zLeI52rRT5rQzmEjujuv9Mj7fAKZG40/Fl5xrrAYB2DGjkFWgjHX3t9SRd3FZ3dgM/psPAKogshyO56N+AJVQIq1gtUJJjTnD/UUw7neBAdpNpAwo2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35a::16)
 by GV2P189MB2212.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 11:12:47 +0000
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f]) by PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:12:46 +0000
From: Benhur Tessele <benhur.tessele@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Randy MacLeod <Randy.MacLeod@windriver.com>,
	paul@pbarker.dev,
	mathieu.dubois-briand@bootlin.com,
	Benhur Tessele <benhur.tessele@est.tech>
Subject: [PATCH v2 0/2] rust: add rust-analyzer support
Date: Tue,  6 Oct 2026 13:12:28 +0200
Message-ID: <20261006111230.1478039-1-benhur.tessele@est.tech>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0527.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::11) To PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:35a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWP189MB2572:EE_|GV2P189MB2212:EE_
X-MS-Office365-Filtering-Correlation-Id: a91f4ce5-a142-4baf-75c1-08df239ac020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|6133799003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	mNnE0ljHABBgn0zLla8DvnPdQ5qxsX5w+hMhDuNLoChD7K3rkmx6xcFaH0CtRIDlGv/EYi+/JnZjVCxyptgEmETXMDWAHwIXh8UNoHI9PQvnaCJYgDrhc94Z4U/oAcglFJmtBOywsASUJsVVG/nkfsSaoyO/yebdoERfURWEKGXmgh9mD1jeGXJCyLtzWNKowuYO0uPrS1HLL6zXAxM0G4g66/Q8q0E5MR7hZQFyWtgWwFwuUN11KSHPt/tA/D+tCNzSWYd4narcK4KsDiWJFRyhxIH+Vv3VVQ8gTnjcrg6Wth0AAfIzZPNpqvPA7emx1Rt+mUlcytPfWrEQL38z6zea5OsYOWqh78zalFwJQRZqlL/f0sSlJmtI7GSR+TU/V5sCvgxerUzXracdyKCA8+gaiStyOxRwFrziCcbrk372ZUxPZdwrQuKFV3+Sf42IGpfgkpZ0+NzkdYfVSKUZarTsXASLKJD0B2IuymBwAu5KXCxW1f/5o66jfCaVvmo+yLLdIzNuyykcZtdYUOjly6ekkrpTeZjruXlbb09+2mUf/kdcKel/LCTzZXdT3bDXK91v6tTOB0QDBWfjSpH4dngVbp4X7IWD7HGYPsx0/QiBY+MZZUPzSV8Qob8tsCCGra4dAcFfySiE9K6z7P9ss29wAnSapCoSsTa6SOcNxcA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWP189MB2572.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(6133799003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QkzfGhqYxU11SJNJCIcr0eluNDrdY7UXfA4JMomAfd4ABAJ1yT6MD61qXS1K?=
 =?us-ascii?Q?HR1njBkw8xGn9L0KnubdRTgrQagzG9GBUmiTNUI+pu8DzD4x3uSc9VPI01Sr?=
 =?us-ascii?Q?5jnC4ghi23GZpYXv7tfLJ2lYsPDGl7VJY9VnPe41LkBhGxFNIrjnR87ZeHUl?=
 =?us-ascii?Q?1IjEJqKJ6WmxAYiV4/BaIwx3Re5HKEg5d/xavh3y1lUsp9z5mSbFw2yiRenr?=
 =?us-ascii?Q?wCo9IsOmxeTrCIiTxij6pCjMbWgq1f5IlidhQyPR9PVPofRdaNm/VSIo54rP?=
 =?us-ascii?Q?oA5/zDK1lhHbXisz/WPEcoGKqDn3OI4qzPQrkLylbCJtB6Cam81k1/owNnZ8?=
 =?us-ascii?Q?3kDHnSjpBSHirTfUYAJxyBBNXAZ9IYjHAQhsKRyFbZgRsqfugyOHZCiHgpOZ?=
 =?us-ascii?Q?6ea6n2/f5s1qElSb6YXyl+jkrTDc1BqmsMGPyg5/z2ZtLbyBHEstVi7ph+6P?=
 =?us-ascii?Q?IPy9Iz5tA8otKgcJaqazQvXyvJKIjlgaePooJYlGzsdq4e10nWuafErQiG7h?=
 =?us-ascii?Q?PeCuQC7CAVQrrQYUh5dFcWxCMoQGZAQwXixlLB++g/Tg6Acy6DFyeHvXu0Xn?=
 =?us-ascii?Q?RBvzH2EsW3og8LDc5aPxCxK5vnhbMX45aj4qx1ayyT/Egh2jxqHdoCCOERBJ?=
 =?us-ascii?Q?KGeywE8MAZ+N5RCw5ca07+x+XfSoUD8v5XdqGJpBqnYdFMxlG7yNsOXATmRB?=
 =?us-ascii?Q?obBaOjrNQ2v07BtMos30MSxg+NkAeCGMpZBPL/IUtvr9HbdvL0B3eLmCakOP?=
 =?us-ascii?Q?Th+QaDkxBZelhGmE6+H1Da3jTlvOODifzXNkGqOi23wjsNAAUxZ33yZZdB21?=
 =?us-ascii?Q?b9Pm4yV4hg0Ku56nl20AuiPAAsBQbkFEft5nn+HNP//n79NMnvvVa96KB2Dn?=
 =?us-ascii?Q?uFvpkD9Wy10FHG1r+0pg0mborJmbQmL6I91euH0fwP/45KOcU0pDqBW4zXy0?=
 =?us-ascii?Q?d8sQbgn7pfgEKS6PLHNOu7yXNMpKTJ2b2irhgi6N9HWgDowhrhs0PIQ6Fu8P?=
 =?us-ascii?Q?ffWJblv8tXgtykEYKkPzOs3hxm81JVwIXigfoOj7tMbyLYDqUHV4C42QF5hT?=
 =?us-ascii?Q?QhG7pXmTJ6EaWct7x7APwuT2TQiwhW0nQ5WHl3n35xIzXZ1Do6CZjD5FHVXN?=
 =?us-ascii?Q?QpmzZgUjk61dFl2MEDkKsvIXRiMpqDhsgxZdJ7dTekfabcqslSCy+iYFEqU2?=
 =?us-ascii?Q?nhivwe+P9TSwtNMAZxKDjuK0hYGlgUHwNVH1J+gptmiZv1lAiuCWS9L8NYMr?=
 =?us-ascii?Q?xZO6ENIEC1jA5mjiyLd34dotiOdrL+1YLpoDHOLXz0tuLO5Min/HGqtkt3M8?=
 =?us-ascii?Q?EuAo6JSMNMjUeB4nNiRmoHWCbqUWsWnrNECbiE7S9qfZzeZ2krk/Zi+lvjvu?=
 =?us-ascii?Q?0tpD57BdYWt6/rUDUALlkZDUVnCWyMg161NHIQRnmk5lfhEgpTlaUq8Do6Or?=
 =?us-ascii?Q?AJkn+TSCmOTMQGVw7Gp+EEYu25c1tLkTM47H8LPwBf6Ro42A8C1g1KFO3hDe?=
 =?us-ascii?Q?yS2hv6c4wNzyMfeDYS5pMygpLeCIWL9WUrQ+apPPuxW6hfPgXCq4XJdTSW1G?=
 =?us-ascii?Q?KJm+BpozY6mYhc+b4NV+UV18zio0Q+jZe7PfnlrL0HqTfFyIhUpfAlaYXVLk?=
 =?us-ascii?Q?3Rgrhan0piP1b6Z3txJVxed9w8xi84Z5sls3PO+2wuM0c+7S5inxdApWlmCR?=
 =?us-ascii?Q?I4l8BSlB8WdEWv3SiDl13WGVkTZQqN2rckfsZa5lIkgw0Jr68VfKCtReL09R?=
 =?us-ascii?Q?OMW3MMIEBQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a91f4ce5-a142-4baf-75c1-08df239ac020
X-MS-Exchange-CrossTenant-AuthSource: PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:12:46.7483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTqrUXVCmyr2dRNLsWRlAAjuqOlTgi00Nz1RG3TsLaCCWg+zN4LKnE4IH2AO2NNrp+AYfsLaxMy4Omy872mpdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 11:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247282

rust-analyzer is built as part of the Rust tools but was neither
installed nor packaged. This series packages it and wires it into the
Rust SDK next to clippy and rustfmt.

Patch 1 adds a rust-tools-analyzer package for nativesdk variant.
Beyond the frontend binary it also ships the proc-macro server and
depends on the standard library sources, both of which are required for
rust-analyzer to actually function.

Patch 2 adds it to the cross-canadian toolchain so that an SDK built with
SDK_FEATURES =3D "rust" provides rust-analyzer out of the box.

v2:
 - Patch 1: build and install rust-analyzer for nativesdk only; dropped
   the target (class-target) install and the target package.
 - Patch 2 unchanged.

Testing:
 - Built an SDK with SDK_FEATURES =3D "rust", installed it in a container,
   and confirmed rust-analyzer resolves the standard library and expands
   proc-macros end to end: diagnostics/analysis-stats on a crate using a
   derive macro succeed, with the proc-macro server started from
   <sysroot>/libexec.
 - Reproduced the reported beaglebone-alt failure with v1
   (MACHINE=3Dbeaglebone-yocto, DISTRO=3Dpoky-altcfg) and confirmed v2 buil=
ds
   cleanly, with rust-analyzer no longer compiled for the target.

Benhur Tessele (2):
  rust: package rust-analyzer for the SDK
  packagegroup-rust-cross-canadian: add rust-analyzer to the SDK

 .../packagegroups/packagegroup-rust-cross-canadian.bb |  1 +
 meta/recipes-devtools/rust/rust_1.98.1.bb             | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

--=20
2.43.0


