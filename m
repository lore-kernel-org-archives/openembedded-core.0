Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B978CE7AF5
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 09:02:54 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.119])
 by mx.groups.io with SMTP id smtpd.web11.30525.1725613362147603825
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 02:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=rZMRjStl;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.119, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VM/SauBaYkhd3GlxABRy1JJzXpE5xfRdeuXYKhDZI0f7lg61NxwOzFAI9yUGqVYROH3R6QSmR6zHnFnQyqG7QwbTGMDUjx2ytjnyJ4KoRxfqNDmpyzY3X7pbmAv8+JpJjSbroMxQ5btLAMunX82vk/BgUG+SuZ+UF0wRG0bVaIRhipeR6E3qtMZsoNwEp3mhPgjvAflyp2s50Y1c1M5I28ZxQim65YME3nKImgAK12bvfeMO08Tu+dyw/7mj0iQVfsfh4lWgjCWoWMM9oQkrbs6aGhcGPJDtDrcjXI/LuYZoXnkJar72bQfSpnRibp8kB1S7gGxjP2w+WBRRHU3XWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rpt9pS6HdeTbKv3TVv9aQadaWajIDsfeyyj7aBw5sZw=;
 b=fabkSx7FZU8ilrjjQwZcf2TeqeUClrdZdT16cVv3XmPT3T5vgzU+BctXXrJW4xgM4KvnAoOVyDkjtziOBUxAizjDrFCfjVxEAKaZ9dXWinpIgZS9cHkjUwthkfV/WQAf7TrHYdnmOngkZTcY7icVZZHBhNP49s1Bz1NT1dFergn/ZoOza0ZcxDsYwcRw7sTaFotygIi/MH7YZUSkJbD6rG01cIciTR1h2/n183KD5lGw4/fsjKZ2Zy1j5mzCRqEzexI6eOYLy0IpcvJI1zH6VEDSOZOzR2WtHbKdH4F6itMu0ZBpsqZzC33d25j0jaPvFGlUHC1db8Bn1UXldnXMyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rpt9pS6HdeTbKv3TVv9aQadaWajIDsfeyyj7aBw5sZw=;
 b=rZMRjStlYwTuXvR0YGZCIMis64FcMdrL1ghxR7mNi2kkMniKb64p8qGRMSwlQMZ9sCkkc6C5S9+j2//l3jsr6gXl5XukdMG4NMBkXhi6euX6PoSFKpfVLpQprcqw8mFA0fao4EABPyWnU0NRYIOCUtJCu3mRKDPQtqP1d+HoxgidIjlfAcpXQ45N5vh8OjYeX56lBHnFWruFFSUSze86hBNthCwrA1lMhE4bUxbTlgCdkRJwBYuzIvTPlgZqGon1RFcFaEfBcanL1qovdmhBdDFNvwmlG9xpWwzo7hZ2cTHSxy8Wi6NSxvCv7r1JMa0t3a37R4axMlw5mivgMBLCiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB6780.eurprd06.prod.outlook.com (2603:10a6:102:66::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 09:02:39 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 09:02:39 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	=?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= <vesa.jaaskelainen@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 7/7] python3-maturin: Fix cross compilation issue for armv7l, mips64, ppc
Date: Fri,  6 Sep 2024 09:01:51 +0000
Message-ID: <20240906090151.513160-7-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240906090151.513160-1-niko.mauno@vaisala.com>
References: <20240906090151.513160-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P192CA0020.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::6) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f5c4f0b-dc7a-4317-a66e-08dcce52a8d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Hyizbg8IxDZiBvggpjiGKLglI8hy1WHgo0vy/GDfLCp9WPaJKPoMV6NauCln?=
 =?us-ascii?Q?7eVCOQKhUFLnQUP64VUZKpjvY1EX3WIpMSsQAikwMcqGsfs1iKe+JZF63ewr?=
 =?us-ascii?Q?+E+zpnNHPUs/kY6W4aqdiFtDBaN1YNZBQl02sZ+13JnUIuK0SQ50sw9eKaFB?=
 =?us-ascii?Q?vcDGArtNqX22Xoxg7MV8KrwTiOKx6Cy2sD/hsWy0TTBLKUjCg8yAZbIjpe4N?=
 =?us-ascii?Q?Xg3tTYhKx82rU4Bk6y9qp5E7IIa2C6/97i/7L8Frmw4K5EKhluhpJWM+VmtP?=
 =?us-ascii?Q?YF7wAspMoT0eegJnHvlB2z7zZIFAZeeMBgsPeIuJt0kgEIntTL2wVsARuuhs?=
 =?us-ascii?Q?4KkJ4CrzfDO5BNdxOYeHm4wLQncQ6gQdDQDyiFca9SloAGiFGHwvrnZzJDTb?=
 =?us-ascii?Q?WlevKPvOKnjg3Er48TRsoviBVm0NJFRRZO1ynJxoqzkHhNJZneBxrQEyFE+p?=
 =?us-ascii?Q?1aeoH/xDRPhSwrNA/zdgQ2StpdZteoz289Uj6pQ9BOeRFJikWstbD/3/r5f1?=
 =?us-ascii?Q?1PIlmtoGEirtuPKL/Wd6+EC48U1AOxvI1qBrbU7/GNq0KCI0HqONFaEBOtbA?=
 =?us-ascii?Q?UvxEn0Kjq0gpUf0WijIrdA3PIrns+IPBLLUIyYwohr1wfTOLSkM5tZ5NRvUz?=
 =?us-ascii?Q?OHf/DCmHQBAb+4kk1EPyTHjBWC4xEpSEranlPgOaFaEV/AbCte30jaXtGHaY?=
 =?us-ascii?Q?fK8LDoVgIvDJRL1lZXlmiCR/7B+zQFhU6xXeR13vdnUt8boW+7yN+UT+87Kw?=
 =?us-ascii?Q?1UoUC0xIZPpIgdAViVfNY9NTpGtMlcQeuLjlAI8nH1uGZ8F+8RLiQ2xUl4wI?=
 =?us-ascii?Q?PZ0GHLKbbmszdE4qE6vG56r0WbOkv8dQliLup8yaoKBXfDdnJ3i5J0uFZjwp?=
 =?us-ascii?Q?ZkMJOo+2BG7iyLhtNhXTzWCcioE9Fp3PDQbEzm+OL3dQnXhsxSq638qHvPU3?=
 =?us-ascii?Q?ME9D8KshD1mlpJAx73rYp+hPk1/L0aW8i7nVi/ws+rwi03tz2s9pMB2ERtg9?=
 =?us-ascii?Q?BjT1Qd1jvP91fuvtD/VROOEZLR9KKNkeP7xk+YU5COKn2/6O1CgfLMbjsrkJ?=
 =?us-ascii?Q?snpeQw+gJf+BbSmWQUk9YYXWNCSpYb90uGAP5+WiOUKg8ZyzJHLvXY2h35W4?=
 =?us-ascii?Q?MQ0FLoktkxYJQmmGRcpEEwjqvCQPgrYsJCxyJmvl5ONC8jg8MSBYBwL2Gvp1?=
 =?us-ascii?Q?benZrXMbxDETmH3HRFvCTGa6F7fbq3n4rtzg+q4S+q6X7yaI8xfHnjRFAW+r?=
 =?us-ascii?Q?MPtfoGHkprVt41giSmd6MGHcTXB5oUM4zm3pSTj3f1M1aD+3EoBEXH/dYH8J?=
 =?us-ascii?Q?JnouiifHYIEH/6WAcQdh05lyng9aZnduf0vv69AFVTa6WyF9aAVQeCOAT3/P?=
 =?us-ascii?Q?6Xbqf578qCmgIgL/0ojjVNBTyipPgkYw0MEne0fFEI8aQeUf6Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nfd5rEzOafeOVQ7rVYCuzPfq3eD6oUbaVOamcq6k3kD/bychqhHta+x5KFQh?=
 =?us-ascii?Q?/Ob8maTu1krUC4qfERKtT4yZTUF2aT1tWTYFCuh5DFQP8bdla6kdzF+mOxlN?=
 =?us-ascii?Q?LLcN2eHHLZHD7m6IiR8V0zWtgucCOVmqyZmC3koGo42KcTbZRyzX8QbQz8xA?=
 =?us-ascii?Q?3ZYmIL6I80vIqfj6za9zCZ44GT9olhEvPhSUX+JB+/5H/Wgfe48vjlVHLEY2?=
 =?us-ascii?Q?oNkJmUdo6RoL3Nn0sko7WySHdaVqrCPrmGzlaOe4Tw+3WiSM3jjnY7KvLKI9?=
 =?us-ascii?Q?suWoAD9/dTiV8ugy1Fu8Yh5p7QjD3iog8m0z1f45yGwSq/qaA+XlYjY67ulO?=
 =?us-ascii?Q?qdsLC5/TaIyiY2VSKmXTq23ysl84L5aux8G/e0FYzT0IYqjxr/mqzELPHS5P?=
 =?us-ascii?Q?93JEkQlWqz8OG3m/ZVdbKgQFTyQYm/h/igTg2yRBSCpt1UuMCyBCl2LpYLwY?=
 =?us-ascii?Q?5XFqAdn8qafpB9ICYvexmCjb1nn1Oyieb6O1EHoqn6C1foSObzouqx9dNOWw?=
 =?us-ascii?Q?rlbMeth3keVqeytdUA0a969EXWXKQ0QPEt2fL026ffMWyomP4TgBq5dwLxqI?=
 =?us-ascii?Q?P1uI2ScAW7phsWBqnXaXtRtD6SVTS9Dp41mNC19UO7ly0aYTWKFr7/Tbr+GE?=
 =?us-ascii?Q?1teelRCRI4Wqh/JF/zg5h0mrNpnOVmJmDksr1E7bQO9JVUZIfEc8k0CFL5/C?=
 =?us-ascii?Q?xQoRcaVB5gIw0fvlRXHA9BifpPrWBoX/ry7cctKce2sDTe8i9RGGARWrYeAy?=
 =?us-ascii?Q?LwKgzxDKj1uXKu+TcV9J2eLVyYLEe51qbI0aFirtIn8XgKsC64+MkltFugkk?=
 =?us-ascii?Q?UybjBh8tgebmCIT7p7fmlBW/600fwijHK2lLu2RQVctAmrrZFdO53qLocO27?=
 =?us-ascii?Q?huYUnMvf449CokvTBB/inVevKBBMJqb1ORFR+Lp+lDI0OOpDwOJ1+v1UGhsM?=
 =?us-ascii?Q?7SPCTz0MQ3DrlbmvVyQSpJAXG7vVLjcLuAxYCen7sJJNpv2TjgJMoYk+ufcO?=
 =?us-ascii?Q?0JMcW5sTtkX6tySuIgsvpQFv1E5jhVXV3cDGeAfLOerGSJ7Z0a3+bK5/iqU2?=
 =?us-ascii?Q?iZ02jp59L35815Cq1awlbVpvDhoPCuTjCwIAHYdNwOGhkDzVUylnVWtSXXPi?=
 =?us-ascii?Q?5ku5WYJnPWmdDteuxeEizgHIng2088UEfTT1UJtg1WWZNSO4bhHX4MVXasM2?=
 =?us-ascii?Q?/zmK3qTXoWSl6uMGibyahbQeS6kkUJ+STpvAVwpsQLuLuB+NZSK5yeBJm9rP?=
 =?us-ascii?Q?5TXvL4tGPYnDKGyVj5S0/4kRQtjWDiCVjB+k26VCb83jVkCS08aQI59jW6rT?=
 =?us-ascii?Q?vucrh+TrQZMvcvl1ttQwyBZDqQ3zfqVl1dKqdhyRFeMzwOk8yGiOe6sJtB7V?=
 =?us-ascii?Q?EQ3/oXV5HiyrA4bpHz6pmGI7ATwW8RGVN3ezWaQa1YFAmyamAXnBcIgS4/Gw?=
 =?us-ascii?Q?Wc21TWE7LQx4VkzAts2Gm6UKuOjc+18ycn0iir845WUFAMapK1UT1JkzownX?=
 =?us-ascii?Q?s4c4e++3uqk0z81pNGK0uw0D9xEgJuKsShJj2GaTkaJjBkP/aqwSjSV0LBg4?=
 =?us-ascii?Q?LnCrKiY5XrFHQ8eFdchI8GbzqhWx0AkpFWpiSxsKLJBJUiFKycO4npEcUpfn?=
 =?us-ascii?Q?vg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5c4f0b-dc7a-4317-a66e-08dcce52a8d2
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 09:02:39.8488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ql5VgneJbzabmBjMG6xaraKuztQJSzM4csmn138AoflX6QtNSMNxwVF3JIfcK+7+u9F5X6ubFg8zS5jg/EItQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6780
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 09:02:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204259

When bitbaking python3-rpds-py it built extension module as:

  site-packages/rpds/rpds.cpython-312-armv7l-linux-gnueabihf.so

Which caused error on target:

  root@qemuarm:~# python3 -c "from rpds import HashTrieMap, HashTrieSet, Li=
st"
  Traceback (most recent call last):
    File "<string>", line 1, in <module>
    File "/usr/lib/python3.12/site-packages/rpds/__init__.py", line 1, in <=
module>
      from .rpds import *
  ModuleNotFoundError: No module named 'rpds.rpds'

Where as it should have been:

  site-packages/rpds/rpds.cpython-312-arm-linux-gnueabihf.so

Associated upstream bug report:
https://github.com/PyO3/maturin/issues/2203

Associated upstream pull request:
https://github.com/PyO3/maturin/pull/2204

Note - mitigation has not been tested with musl:
https://github.com/PyO3/maturin/pull/2204#issuecomment-2323952320

(From OE-Core rev: 32a8a7379008cc6e367b7664c5b10b29f0bb8136)

Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala.=
com>
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...n-architecture-name-resolvation-code.patch | 107 ++++++++++++++++++
 ...ation-issue-with-linux-armv7l-archit.patch |  76 +++++++++++++
 ...n-ABI-name-resolvation-code-as-helpe.patch |  98 ++++++++++++++++
 ...ation-issue-with-linux-ppc-architect.patch |  68 +++++++++++
 ...ation-issue-with-linux-mips64-archit.patch |  82 ++++++++++++++
 .../python/python3-maturin_1.4.0.bb           |   7 ++
 6 files changed, 438 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Extra=
ct-extension-architecture-name-resolvation-code.patch
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0002-Fix-c=
ross-compilation-issue-with-linux-armv7l-archit.patch
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0003-Extra=
ct-extension-ABI-name-resolvation-code-as-helpe.patch
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0004-Fix-c=
ross-compilation-issue-with-linux-ppc-architect.patch
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0005-Fix-c=
ross-compilation-issue-with-linux-mips64-archit.patch

diff --git a/meta/recipes-devtools/python/python3-maturin/0001-Extract-exte=
nsion-architecture-name-resolvation-code.patch b/meta/recipes-devtools/pyth=
on/python3-maturin/0001-Extract-extension-architecture-name-resolvation-cod=
e.patch
new file mode 100644
index 0000000000..f75d5a1ba8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0001-Extract-extension-a=
rchitecture-name-resolvation-code.patch
@@ -0,0 +1,107 @@
+From 42a97ee7100ad158d4b1ba6133ea13cc864a567f Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3DA4inen?=3D
+ <vesa.jaaskelainen@vaisala.com>
+Date: Sun, 1 Sep 2024 09:23:10 +0300
+Subject: [PATCH 1/5] Extract extension architecture name resolvation code =
as
+ helper
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This commit introduces helper InterpreterConfig.get_python_ext_arch() that
+can be used to determine the extension architecture name python uses in
+`ext_suffix` for this architecture.
+
+Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/42a97ee7=
100ad158d4b1ba6133ea13cc864a567f]
+
+Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala=
.com>
+---
+ src/python_interpreter/config.rs | 18 ++++++------------
+ src/target.rs                    | 16 ++++++++++++++++
+ 2 files changed, 22 insertions(+), 12 deletions(-)
+
+diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/con=
fig.rs
+index 912f9218..d76606f2 100644
+--- a/src/python_interpreter/config.rs
++++ b/src/python_interpreter/config.rs
+@@ -47,15 +47,7 @@ impl InterpreterConfig {
+             // Python 2 is not supported
+             return None;
+         }
+-        let python_arch =3D if matches!(target.target_arch(), Arch::Armv6=
L | Arch::Armv7L) {
+-            "arm"
+-        } else if matches!(target.target_arch(), Arch::Powerpc64Le) && py=
thon_impl =3D=3D PyPy {
+-            "ppc_64"
+-        } else if matches!(target.target_arch(), Arch::X86) && python_imp=
l =3D=3D PyPy {
+-            "x86"
+-        } else {
+-            target.get_python_arch()
+-        };
++        let python_ext_arch =3D target.get_python_ext_arch(python_impl);
+         // See https://github.com/pypa/auditwheel/issues/349
+         let target_env =3D match python_impl {
+             CPython =3D> {
+@@ -77,7 +69,7 @@ impl InterpreterConfig {
+                 let ldversion =3D format!("{}{}{}", major, minor, abiflag=
s);
+                 let ext_suffix =3D format!(
+                     ".cpython-{}-{}-linux-{}.so",
+-                    ldversion, python_arch, target_env
++                    ldversion, python_ext_arch, target_env
+                 );
+                 Some(Self {
+                     major,
+@@ -90,7 +82,8 @@ impl InterpreterConfig {
+             }
+             (Os::Linux, PyPy) =3D> {
+                 let abi_tag =3D format!("pypy{}{}-{}", major, minor, PYPY=
_ABI_TAG);
+-                let ext_suffix =3D format!(".{}-{}-linux-{}.so", abi_tag,=
 python_arch, target_env);
++                let ext_suffix =3D
++                    format!(".{}-{}-linux-{}.so", abi_tag, python_ext_arc=
h, target_env);
+                 Some(Self {
+                     major,
+                     minor,
+@@ -204,7 +197,8 @@ impl InterpreterConfig {
+             }
+             (Os::Emscripten, CPython) =3D> {
+                 let ldversion =3D format!("{}{}", major, minor);
+-                let ext_suffix =3D format!(".cpython-{}-{}-emscripten.so"=
, ldversion, python_arch);
++                let ext_suffix =3D
++                    format!(".cpython-{}-{}-emscripten.so", ldversion, py=
thon_ext_arch);
+                 Some(Self {
+                     major,
+                     minor,
+diff --git a/src/target.rs b/src/target.rs
+index dc7df0cf..84bae559 100644
+--- a/src/target.rs
++++ b/src/target.rs
+@@ -1,4 +1,5 @@
+ use crate::cross_compile::is_cross_compiling;
++use crate::python_interpreter::InterpreterKind;
+ use crate::PlatformTag;
+ use anyhow::{anyhow, bail, format_err, Result};
+ use platform_info::*;
+@@ -368,6 +369,21 @@ impl Target {
+         }
+     }
+=20
++    /// Returns the extension architecture name python uses in `ext_suffi=
x` for this architecture.
++    pub fn get_python_ext_arch(&self, python_impl: InterpreterKind) -> &s=
tr {
++        if matches!(self.target_arch(), Arch::Armv6L | Arch::Armv7L) {
++            "arm"
++        } else if matches!(self.target_arch(), Arch::Powerpc64Le)
++            && python_impl =3D=3D InterpreterKind::PyPy
++        {
++            "ppc_64"
++        } else if matches!(self.target_arch(), Arch::X86) && python_impl =
=3D=3D InterpreterKind::PyPy {
++            "x86"
++        } else {
++            self.get_python_arch()
++        }
++    }
++
+     /// Returns the name python uses in `sys.platform` for this os
+     pub fn get_python_os(&self) -> &str {
+         match self.os {
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-maturin/0002-Fix-cross-co=
mpilation-issue-with-linux-armv7l-archit.patch b/meta/recipes-devtools/pyth=
on/python3-maturin/0002-Fix-cross-compilation-issue-with-linux-armv7l-archi=
t.patch
new file mode 100644
index 0000000000..4366dde111
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0002-Fix-cross-compilati=
on-issue-with-linux-armv7l-archit.patch
@@ -0,0 +1,76 @@
+From 0c6b8cc84eff72ed21098029aaba079b899dbee2 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3DA4inen?=3D
+ <vesa.jaaskelainen@vaisala.com>
+Date: Sun, 1 Sep 2024 09:23:40 +0300
+Subject: [PATCH 2/5] Fix cross compilation issue with linux-armv7l
+ architecture
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+When compiling under Yocto project for linux-armv7l target architecture
+.so files were generated incorrectly as:
+
+  rpds.cpython-312-armv7l-linux-gnueabihf.so
+
+Where as platform and EXT_SUFFIX are defined as:
+
+  >>> sysconfig.get_platform()
+  'linux-armv7l'
+  >>> sysconfig.get_config_vars()['EXT_SUFFIX']
+  '.cpython-312-arm-linux-gnueabihf.so'
+
+Which should have caused the .so files as:
+
+  rpds.cpython-312-arm-linux-gnueabihf.so
+
+Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/0c6b8cc8=
4eff72ed21098029aaba079b899dbee2]
+
+Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala=
.com>
+---
+ src/python_interpreter/config.rs | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/con=
fig.rs
+index d76606f2..5736aedc 100644
+--- a/src/python_interpreter/config.rs
++++ b/src/python_interpreter/config.rs
+@@ -306,7 +306,7 @@ impl InterpreterConfig {
+                     format!(
+                         ".cpython-{}-{}-{}-{}.{}",
+                         abi_tag,
+-                        target.get_python_arch(),
++                        target.get_python_ext_arch(interpreter_kind),
+                         target.get_python_os(),
+                         target_env,
+                         file_ext,
+@@ -319,7 +319,7 @@ impl InterpreterConfig {
+                         major,
+                         minor,
+                         abi_tag,
+-                        target.get_python_arch(),
++                        target.get_python_ext_arch(interpreter_kind),
+                         target.get_python_os(),
+                         target_env,
+                         file_ext,
+@@ -330,7 +330,7 @@ impl InterpreterConfig {
+                     format!(
+                         ".{}-{}-{}.{}",
+                         abi_tag.replace('_', "-"),
+-                        target.get_python_arch(),
++                        target.get_python_ext_arch(interpreter_kind),
+                         target.get_python_os(),
+                         file_ext,
+                     )
+@@ -341,7 +341,7 @@ impl InterpreterConfig {
+                 format!(
+                     ".cpython-{}-{}-{}.{}",
+                     abi_tag,
+-                    target.get_python_arch(),
++                    target.get_python_ext_arch(interpreter_kind),
+                     target.get_python_os(),
+                     file_ext
+                 )
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-maturin/0003-Extract-exte=
nsion-ABI-name-resolvation-code-as-helpe.patch b/meta/recipes-devtools/pyth=
on/python3-maturin/0003-Extract-extension-ABI-name-resolvation-code-as-help=
e.patch
new file mode 100644
index 0000000000..b4a7f69492
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0003-Extract-extension-A=
BI-name-resolvation-code-as-helpe.patch
@@ -0,0 +1,98 @@
+From fa64426f3a98a0455721c23ec86bd2240708b45e Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3DA4inen?=3D
+ <vesa.jaaskelainen@vaisala.com>
+Date: Sun, 1 Sep 2024 15:55:07 +0300
+Subject: [PATCH 3/5] Extract extension ABI name resolvation code as helper
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This commit introduces helper InterpreterConfig.get_python_target_env()
+that can be used to determine the extension ABI python uses in
+`ext_suffix` for this architecture.
+
+Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/fa64426f=
3a98a0455721c23ec86bd2240708b45e]
+
+Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala=
.com>
+---
+ src/python_interpreter/config.rs | 19 ++-----------------
+ src/target.rs                    | 20 ++++++++++++++++++++
+ 2 files changed, 22 insertions(+), 17 deletions(-)
+
+diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/con=
fig.rs
+index 5736aedc..938e9955 100644
+--- a/src/python_interpreter/config.rs
++++ b/src/python_interpreter/config.rs
+@@ -48,17 +48,7 @@ impl InterpreterConfig {
+             return None;
+         }
+         let python_ext_arch =3D target.get_python_ext_arch(python_impl);
+-        // See https://github.com/pypa/auditwheel/issues/349
+-        let target_env =3D match python_impl {
+-            CPython =3D> {
+-                if python_version >=3D (3, 11) {
+-                    target.target_env().to_string()
+-                } else {
+-                    target.target_env().to_string().replace("musl", "gnu"=
)
+-                }
+-            }
+-            PyPy | GraalPy =3D> "gnu".to_string(),
+-        };
++        let target_env =3D target.get_python_target_env(python_impl, pyth=
on_version);
+         match (target.target_os(), python_impl) {
+             (Os::Linux, CPython) =3D> {
+                 let abiflags =3D if python_version < (3, 8) {
+@@ -294,12 +284,7 @@ impl InterpreterConfig {
+         };
+         let file_ext =3D if target.is_windows() { "pyd" } else { "so" };
+         let ext_suffix =3D if target.is_linux() || target.is_macos() {
+-            // See https://github.com/pypa/auditwheel/issues/349
+-            let target_env =3D if (major, minor) >=3D (3, 11) {
+-                target.target_env().to_string()
+-            } else {
+-                target.target_env().to_string().replace("musl", "gnu")
+-            };
++            let target_env =3D target.get_python_target_env(interpreter_k=
ind, (major, minor));
+             match interpreter_kind {
+                 InterpreterKind::CPython =3D> ext_suffix.unwrap_or_else(|=
| {
+                     // Eg: .cpython-38-x86_64-linux-gnu.so
+diff --git a/src/target.rs b/src/target.rs
+index 84bae559..ad8ebaba 100644
+--- a/src/target.rs
++++ b/src/target.rs
+@@ -1,5 +1,6 @@
+ use crate::cross_compile::is_cross_compiling;
+ use crate::python_interpreter::InterpreterKind;
++use crate::python_interpreter::InterpreterKind::{CPython, GraalPy, PyPy};
+ use crate::PlatformTag;
+ use anyhow::{anyhow, bail, format_err, Result};
+ use platform_info::*;
+@@ -384,6 +385,25 @@ impl Target {
+         }
+     }
+=20
++    /// Returns the environment python uses in `ext_suffix` for this arch=
itecture.
++    pub fn get_python_target_env(
++        &self,
++        python_impl: InterpreterKind,
++        python_version: (usize, usize),
++    ) -> String {
++        match python_impl {
++            CPython =3D> {
++                // For musl handling see https://github.com/pypa/auditwhe=
el/issues/349
++                if python_version >=3D (3, 11) {
++                    self.target_env().to_string()
++                } else {
++                    self.target_env().to_string().replace("musl", "gnu")
++                }
++            }
++            PyPy | GraalPy =3D> "gnu".to_string(),
++        }
++    }
++
+     /// Returns the name python uses in `sys.platform` for this os
+     pub fn get_python_os(&self) -> &str {
+         match self.os {
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-maturin/0004-Fix-cross-co=
mpilation-issue-with-linux-ppc-architect.patch b/meta/recipes-devtools/pyth=
on/python3-maturin/0004-Fix-cross-compilation-issue-with-linux-ppc-architec=
t.patch
new file mode 100644
index 0000000000..bda5dca8f6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0004-Fix-cross-compilati=
on-issue-with-linux-ppc-architect.patch
@@ -0,0 +1,68 @@
+From f2c892109a05db144e8b18bcbcf9c24fe8d977c4 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3DA4inen?=3D
+ <vesa.jaaskelainen@vaisala.com>
+Date: Sun, 1 Sep 2024 15:55:16 +0300
+Subject: [PATCH 4/5] Fix cross compilation issue with linux-ppc architectu=
re
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+When compiling under Yocto project for linux-ppc target architecture
+.so files were generated incorrectly as:
+
+  rpds.cpython-312-ppc-linux-gnu.so
+
+Where as platform and EXT_SUFFIX are defined as:
+
+  >>> sysconfig.get_platform()
+  'linux-ppc'
+  >>> sysconfig.get_config_vars()['EXT_SUFFIX']
+  '.cpython-312-powerpc-linux-gnu.so'
+
+Which should have caused the .so files as:
+
+  rpds.cpython-312-powerpc-linux-gnu.so
+
+Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/f2c89210=
9a05db144e8b18bcbcf9c24fe8d977c4]
+
+Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala=
.com>
+---
+ src/python_interpreter/config.rs | 8 ++++++++
+ src/target.rs                    | 2 ++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/con=
fig.rs
+index 938e9955..8f883887 100644
+--- a/src/python_interpreter/config.rs
++++ b/src/python_interpreter/config.rs
+@@ -424,6 +424,14 @@ mod test {
+             ".cpython-310-powerpc64le-linux-gnu.so"
+         );
+=20
++        let sysconfig =3D InterpreterConfig::lookup_one(
++            &Target::from_target_triple(Some("powerpc-unknown-linux-gnu".=
to_string())).unwrap(),
++            InterpreterKind::CPython,
++            (3, 10),
++        )
++        .unwrap();
++        assert_eq!(sysconfig.ext_suffix, ".cpython-310-powerpc-linux-gnu.=
so");
++
+         let sysconfig =3D InterpreterConfig::lookup_one(
+             &Target::from_target_triple(Some("s390x-unknown-linux-gnu".to=
_string())).unwrap(),
+             InterpreterKind::CPython,
+diff --git a/src/target.rs b/src/target.rs
+index ad8ebaba..93afd9bb 100644
+--- a/src/target.rs
++++ b/src/target.rs
+@@ -380,6 +380,8 @@ impl Target {
+             "ppc_64"
+         } else if matches!(self.target_arch(), Arch::X86) && python_impl =
=3D=3D InterpreterKind::PyPy {
+             "x86"
++        } else if matches!(self.target_arch(), Arch::Powerpc) {
++            "powerpc"
+         } else {
+             self.get_python_arch()
+         }
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-maturin/0005-Fix-cross-co=
mpilation-issue-with-linux-mips64-archit.patch b/meta/recipes-devtools/pyth=
on/python3-maturin/0005-Fix-cross-compilation-issue-with-linux-mips64-archi=
t.patch
new file mode 100644
index 0000000000..b24196d5dd
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0005-Fix-cross-compilati=
on-issue-with-linux-mips64-archit.patch
@@ -0,0 +1,82 @@
+From 5fe643579bcc63d824f6a0f0936fff451c622903 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3DA4inen?=3D
+ <vesa.jaaskelainen@vaisala.com>
+Date: Sun, 1 Sep 2024 15:55:54 +0300
+Subject: [PATCH 5/5] Fix cross compilation issue with linux-mips64
+ architecture
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+When compiling under Yocto project for linux-mips64 target architecture
+.so files were generated incorrectly as:
+
+  rpds.cpython-312-mips64-linux-gnu.so
+
+Where as platform and EXT_SUFFIX are defined as:
+
+  >>> sysconfig.get_platform()
+  'linux-mips64'
+  >>> sysconfig.get_config_vars()['EXT_SUFFIX']
+  '.cpython-312-mips64-linux-gnuabi64.so'
+
+Which should have caused the .so files as:
+
+  rpds.cpython-312-mips64-linux-gnuabi64.so
+
+Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/5fe64357=
9bcc63d824f6a0f0936fff451c622903]
+
+Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala=
.com>
+---
+ src/python_interpreter/config.rs | 19 +++++++++++++++++++
+ src/target.rs                    |  4 +++-
+ 2 files changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/con=
fig.rs
+index 8f883887..ef656010 100644
+--- a/src/python_interpreter/config.rs
++++ b/src/python_interpreter/config.rs
+@@ -432,6 +432,25 @@ mod test {
+         .unwrap();
+         assert_eq!(sysconfig.ext_suffix, ".cpython-310-powerpc-linux-gnu.=
so");
+=20
++        let sysconfig =3D InterpreterConfig::lookup_one(
++            &Target::from_target_triple(Some("mips64-unknown-linux-gnu".t=
o_string())).unwrap(),
++            InterpreterKind::CPython,
++            (3, 10),
++        )
++        .unwrap();
++        assert_eq!(
++            sysconfig.ext_suffix,
++            ".cpython-310-mips64-linux-gnuabi64.so"
++        );
++
++        let sysconfig =3D InterpreterConfig::lookup_one(
++            &Target::from_target_triple(Some("mips-unknown-linux-gnu".to_=
string())).unwrap(),
++            InterpreterKind::CPython,
++            (3, 10),
++        )
++        .unwrap();
++        assert_eq!(sysconfig.ext_suffix, ".cpython-310-mips-linux-gnu.so"=
);
++
+         let sysconfig =3D InterpreterConfig::lookup_one(
+             &Target::from_target_triple(Some("s390x-unknown-linux-gnu".to=
_string())).unwrap(),
+             InterpreterKind::CPython,
+diff --git a/src/target.rs b/src/target.rs
+index 93afd9bb..25fc6c07 100644
+--- a/src/target.rs
++++ b/src/target.rs
+@@ -396,7 +396,9 @@ impl Target {
+         match python_impl {
+             CPython =3D> {
+                 // For musl handling see https://github.com/pypa/auditwhe=
el/issues/349
+-                if python_version >=3D (3, 11) {
++                if matches!(self.target_arch(), Arch::Mips64 | Arch::Mips=
64el) && self.is_linux() {
++                    "gnuabi64".to_string()
++                } else if python_version >=3D (3, 11) {
+                     self.target_env().to_string()
+                 } else {
+                     self.target_env().to_string().replace("musl", "gnu")
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-maturin_1.4.0.bb b/meta/r=
ecipes-devtools/python/python3-maturin_1.4.0.bb
index ed19ee647a..7322de0d08 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
@@ -7,6 +7,13 @@ LIC_FILES_CHKSUM =3D "file://license-apache;md5=3D1836efb2=
eb779966696f473ee8540542 \
=20
 SRC_URI +=3D "file://0001-Add-32-bit-RISC-V-support.patch"
 SRC_URI[sha256sum] =3D "ed12e1768094a7adeafc3a74ebdb8dc2201fa64c4e7e31f14c=
fc70378bf93790"
+SRC_URI:append =3D "\
+    file://0001-Extract-extension-architecture-name-resolvation-code.patch=
 \
+    file://0002-Fix-cross-compilation-issue-with-linux-armv7l-archit.patch=
 \
+    file://0003-Extract-extension-ABI-name-resolvation-code-as-helpe.patch=
 \
+    file://0004-Fix-cross-compilation-issue-with-linux-ppc-architect.patch=
 \
+    file://0005-Fix-cross-compilation-issue-with-linux-mips64-archit.patch=
 \
+"
=20
 S =3D "${WORKDIR}/maturin-${PV}"
=20
--=20
2.39.2


