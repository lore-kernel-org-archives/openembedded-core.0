Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1645C5DF81
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:34:00 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9812.1787153637327544511
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vpnfp2wq;
 spf=pass (domain: est.tech, ip: 52.101.66.11, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8dXGAp8xqYu2WhICltqjnChG8LTnhe8eWad8Ydx3gxTFswxfkFZLGCQDkIIx+0vJvlPW3uFtZmVXLcW6tmsGXYFj24MCqbDw4ZWI7h43gzGoJaKi5W7xnGbzyLy1APSPDgY8BARLI2SijLRO+7pHJJdDyrXShJgXLB5Q/sDp1YzRI32SDFyvscrNSiiMx+vi7NXPyxOIPpHETdCZyREyudq1pJThoGn8a48WYqNR4eC09gfT5HXYUn635UcMPb6Jkcsny3euz8QjjvP9ZIJutZlbwF27gooMQY/Onr/J7Cf56Q6fdHgM7FSQ8f+lTBpRMfLZ2SbkJ+D1S9RERi04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8tXCc4Yddo1T6tK5ncqluwhHPYbCkjuWRdOFSbbI4k=;
 b=wwxN4lmTrdeGdd2q3xetlxTrHbLTqrsltjCiESSGzJ1ziPOoxNNEEG9kmH8hkNMizoeE61DPsOP47BAfUDCb7nVHyPLYJSXV8mrvQqA3P/6CdLyb1wQlWCwkVYxsbJ9MYFP0klnEUYO4D2XiYVs1xJCN0tmhUcLeNhML5fHkeK0xoUM62TjGUBwC/QA08M2HMo+FC717CS3xH9gsiBgvbpH1tS3nlyCOE51EwA9VZMyGcZd2Izh6+7QD2ywSo25ZakLPioBpd5Fr4fhMl8aqzALxzDTjWmxtKQZFW6YGewEcHy9PYmKMkyWct5SAUKlnRjSmKN60Y/02NEn57F6D+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8tXCc4Yddo1T6tK5ncqluwhHPYbCkjuWRdOFSbbI4k=;
 b=vpnfp2wqMWZFVrdjBmOEITUjClWAHicHN1Wte+WDYau9DXdknOLmPqAwe+JjUQ0ZfWZYBNJCSF0pzKmHja8C214uCCEaTsj1HUT+/P8Q2umiu5eX9ma69EvtIyhUUr+AeJcUkNmBv5888GX9XS2iym8mpOMlC3KVwndiq9B2ADsUF4AqmljWuBNH2GB0jfcONpFSy1zxMu3bWcsRigu10pSVnDdcCte25X2a4/kEhw6s1PWZVrJts5hgDWCldQFNcDtYCdds/Xa67UxT57gZm6R2rApZEkcW7ovWuUxC3tec6bNcBuoVyWG+sUGTVl9xGjXLmZexhJJz9Cj2LhlpFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI0P189MB3358.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2b7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.2; Wed, 19 Aug
 2026 15:33:56 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.000; Wed, 19 Aug 2026
 15:33:56 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 1/2] strace: upgrade 7.1 -> 7.2
Date: Wed, 19 Aug 2026 17:33:45 +0200
Message-ID: <20260819153346.64078-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260819153346.64078-1-jaipaul.cheernam@est.tech>
References: <20260819153346.64078-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0206.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::21) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI0P189MB3358:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd04393-3da3-4899-628c-08defe07485a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	EdRH3CDrNykx3lLh+G5zidSIZ7CdsDzXeH9tjVeJz0Sdp9jOfm8EoobC5soPcaEPGHETayo/boEYFHWuUz2pDeiZkZ7NKuMLjHLFfTv1PmJtlo8EiTcBs6/HgY15Acuz3FMkRC9ghAvYLxxKEYQUDVjoGOGpDtknaPJf1gMIFc9PFGCXNMW1ZqXF5BkXPx0UZmV6zAYs4V9TuSPkgfX5zTVBdIqHcWFsU4zp4qKn8IJY1xqYDbUGCF4M782qP0z2Tg7hbH0myp4r9lMNj/DE3TGQfTOQf+D/H9PXSj+SoVTJdsVZ5Tpc5n6GmKK7XMIW81CTOStKGY/UyZJh0l1YFZIjN8+n20X8Q6B8KLLnOCPBQmdTyRYaxb7sf/Ys7+s9MDm7q7W2Ae4WbvHgG/bhkOuJKjA0x9BreRsPY0+Z4j7DVm4uI47VwGjCuL+d3ZLtpElwK+fsKwZhiJuVVsDXwRl+TTlDexbMBY39m/b7XLzPGZtpDhep9/t6aHF5ZWvoegMZ9y3nn+qmzGLo+438GAHflBeqxY1gmQLHBpTdH8Awf7ugejkFv08MlUbs7AORjS7r8QoCQdaSme6dQsoOFaZpBNKQPT2xmIEwjx5sTas=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HvMNXwHx2oRI3zLm5SuGri1tIUtz0m8vhDWT/zWppPnDQ8+0jUIZNJvLaDhx?=
 =?us-ascii?Q?hIHShA2GKex2obIDSDVgYuPCpHFFQd+I7n62s1s+VlfdLVnB+eRnur/7fhuK?=
 =?us-ascii?Q?HxPc/P89ZfmY9X1EoWHhLYPYJ+zUp41thb92JopQy9QlWSkcgmXjjiZTAT7v?=
 =?us-ascii?Q?MLdjLLUShdT6f1xHd9SajHYkq9bslO2EST510B1KiTfnKq8G/SOfGVIrWDq7?=
 =?us-ascii?Q?CSeA1m59lZfgt9D/oBH3AIZ47uSpt7Hy7y6yD4zeYMEreN3yma4qSFGPfMws?=
 =?us-ascii?Q?7LaJceUX2siWMKQlVFehe364n4Srnos7+W/SNf9iHdvqGY7gkruLpqCixRxk?=
 =?us-ascii?Q?xR++F61UAhob6GAKjiqAfOJuH4tMfiCW3fBMxco7bXfIZiHYSlGnd04G/kmI?=
 =?us-ascii?Q?ZctdaIkJA29oxqq/HK0sWIR2tO7ysqAhpKwEJ4wSkE/YL26Bk+GGdMTVSbJP?=
 =?us-ascii?Q?IuUL7biAnXpw1yrVjgMnbw523WGeLpeTLQKtK8icONcZ+0P8UoFMS6feE7x9?=
 =?us-ascii?Q?bSN6Hj4KAiz9HZrCnhwta461jd8IyVZnilV5/to9k4zNjhpgsS5PiYariTnE?=
 =?us-ascii?Q?WjCVwjyY4SpIlRaSyuWM8v7wPRO4FHSPX0Euctinn6vMEVpydO8UrWb16bcc?=
 =?us-ascii?Q?aSow4RaV/4ixcqqamV/JQWMwpEoWZw2LC1tb/kaBxrJ0S+rRk306e50Xg03o?=
 =?us-ascii?Q?3pAv5TkL5ojYGRTIt71K6VegxS61CELIStVpdfPk5xz0XIMH9qe4T5eZkQZk?=
 =?us-ascii?Q?hxmhtXP+5n3OqczCOVrsqhf8IvbB3OtD/fe5xKA5Fyeyozz9xXqL9VKTCLF5?=
 =?us-ascii?Q?wDwFR9IMomt31BoyzjEjfZRHTitYOa9DAJMiGd2vvdwUCJuUS/u7yp0gQnkV?=
 =?us-ascii?Q?8sc5HboFZr2igOXZ7IrdLrEYFubFKpYtch4Od/p8JGUqRLHuidzIpT8vpEuE?=
 =?us-ascii?Q?Uy5lkhaig4D/eY1auZhlLyAs/pkfYw9poczHmFxKLXIKC0STPonecMe5Ck/m?=
 =?us-ascii?Q?d4L3bNQFQPPMwgl+oHk0A/e514rggfqx9Bfl50tzclpZyav7A3Wcp8nf3j0m?=
 =?us-ascii?Q?/FaPn9wRu2RUXYIC/JiRNiUxhw/B1hHD+zLANaGaLsHeTpVxUBiKMzV+thEI?=
 =?us-ascii?Q?rPHGtz8gsTOD7OqZIVG6XYpfaCmyNY3MJIFUDhhgfVb8vaYAhwCkbj9H6fre?=
 =?us-ascii?Q?Lz/FY8uoG+0+ZH7kfiEjCZ292zcvW/tvSxapkorX9RJ8I9kBKgxI3ybDa8iv?=
 =?us-ascii?Q?FDGHmhBVIFjeFBTqleAbC8bv+qnZJBxy0A0e3rV9MgwMDIruMfpdKErVFblW?=
 =?us-ascii?Q?Zmu2qYbgsByoAzYPQ2LyPHMEx72TIONtvSl9qqIrh8FBJr6UyfcohEm6DKhJ?=
 =?us-ascii?Q?H9eB7gqDP9Qloc/c8FBBVsii+eMzEYIG7Lvf00kbawD1wvJSPPhdMfda4m4m?=
 =?us-ascii?Q?5VDBNg18b/2y5jgsJi3VJPZcBIxz0X8UvgQINR9u0mt1FAZCtbXJYwOWFAvJ?=
 =?us-ascii?Q?5if69vYCMv2ElZ7LnbuQdfhHtrUPDPLNdZjzl29XHy/Yn65JBCEwthe2EaUR?=
 =?us-ascii?Q?ymaRkPUis9V60F8nJQM0Z2QhQy4+62N3ybNmrqh93tEVX1OJGFrnf37lnL4d?=
 =?us-ascii?Q?LjBCQpYDfaeao3N1Bg98qhcd2CGEuV07CjBMx6t3Vat6utpfx9xSUx21osKH?=
 =?us-ascii?Q?sRUbSoLZwCs1zNbBrg4zotK0rf5mYd1kKf9frzmdv5rGNsdD0mrt0EpZ860N?=
 =?us-ascii?Q?xRKkWJAsfQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd04393-3da3-4899-628c-08defe07485a
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 15:33:56.6319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nv4iO/AS8h/j04SALO9bi9ZUp0D1nqmaYxGtEKWMO2+XYuKoaaJWP54bAyaolWEXHc4XKNfjSlbIKFdytp2GwBw5dIW4yl2IN8IigWYgzw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3358
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243734

Release Log: https://github.com/strace/strace/releases#release-v7.2

Compare Log: https://github.com/strace/strace/compare/v7.1...v7.2

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...gnore-pwritev-pwrite64-tests-on-musl.patch | 62 +++++++++++++++++++
 ...toconf-macro-to-detect-largefile-sup.patch |  2 +-
 ...kport-ax_prog_cc_for_build.m4-macros.patch |  2 +-
 ...001-strace-fix-reproducibilty-issues.patch |  2 +-
 ...002-tests-Replace-off64_t-with-off_t.patch |  2 +-
 .../strace/strace/Makefile-ptest.patch        |  6 +-
 .../strace/strace/ptest-spacesave.patch       |  2 +-
 .../strace/strace/skip-load.patch             |  2 +-
 .../strace/strace/update-gawk-paths.patch     |  2 +-
 .../strace/{strace_7.1.bb =3D> strace_7.2.bb}   |  2 +-
 10 files changed, 73 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/files/0001-Ignore-pwritev-=
pwrite64-tests-on-musl.patch
 rename meta/recipes-devtools/strace/{strace_7.1.bb =3D> strace_7.2.bb} (96=
%)

diff --git a/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite6=
4-tests-on-musl.patch b/meta/recipes-devtools/strace/files/0001-Ignore-pwri=
tev-pwrite64-tests-on-musl.patch
new file mode 100644
index 0000000000..340e2b625e
--- /dev/null
+++ b/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests=
-on-musl.patch
@@ -0,0 +1,62 @@
+From fe8a5ec102a93b3a8da5feab86a89dee540b9de5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Aug 2025 22:18:58 -0700
+Subject: [PATCH] Ignore pwritev/pwrite64 tests on musl
+
+musl uses wrappers for pwritev and pwrite64 using
+pwritev2 syscall [1], however the test exepcts that the
+program will call pwritev and pwrite64 ( glibc behavior )
+
+This can be fixed if the function calls are changed to
+use syscall() API directly, but that needs change upstream [2]
+
+Issue is reported upstream [3]
+
+[1] https://git.musl-libc.org/cgit/musl/commit/src?id=3D5370070fded61b5691=
96764673a4fc8440aac79e
+[2] https://github.com/strace/strace/pull/347
+[3] https://github.com/strace/strace/issues/349
+
+Upstream-Status: Inappropriate [Musl Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/pread64-pwrite64.gen.test | 3 +++
+ tests/preadv-pwritev.gen.test   | 3 +++
+ tests/pwritev.gen.test          | 3 +++
+ 3 files changed, 9 insertions(+)
+
+diff --git a/tests/pread64-pwrite64.gen.test b/tests/pread64-pwrite64.gen.=
test
+index b53e069..0a1e6e6 100755
+--- a/tests/pread64-pwrite64.gen.test
++++ b/tests/pread64-pwrite64.gen.test
+@@ -1,4 +1,7 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (pread64-pw=
rite64 -a21 -eread=3D0 -ewrite=3D1 -e trace=3Dpread64,pwrite64 -P pread64-p=
write64-tmpfile -P /dev/zero -P /dev/null); do not edit.
+ . "${srcdir=3D.}/init.sh"
++
++skip_ "Test not ported to musl, musl generates pwritev2"
++
+ run_strace_match_diff -a21 -eread=3D0 -ewrite=3D1 -e trace=3Dpread64,pwri=
te64 -P pread64-pwrite64-tmpfile -P /dev/zero -P /dev/null
+diff --git a/tests/preadv-pwritev.gen.test b/tests/preadv-pwritev.gen.test
+index 5ed8297..b83f129 100755
+--- a/tests/preadv-pwritev.gen.test
++++ b/tests/preadv-pwritev.gen.test
+@@ -1,4 +1,7 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (preadv-pwr=
itev -a19 -eread=3D0 -ewrite=3D1 -e trace=3Dpreadv,pwritev); do not edit.
+ . "${srcdir=3D.}/init.sh"
++
++skip_ "Test not ported to musl, musl generates pwritev2"
++
+ run_strace_match_diff -a19 -eread=3D0 -ewrite=3D1 -e trace=3Dpreadv,pwrit=
ev
+diff --git a/tests/pwritev.gen.test b/tests/pwritev.gen.test
+index e54fd15..4999816 100755
+--- a/tests/pwritev.gen.test
++++ b/tests/pwritev.gen.test
+@@ -1,4 +1,7 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (pwritev -a=
22 -s7); do not edit.
+ . "${srcdir=3D.}/init.sh"
++
++skip_ "Test not ported to musl, musl generates pwritev2"
++
+ run_strace_match_diff -a22 -s7
diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autocon=
f-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace=
/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
index 5a7d05ae41..25f32d1734 100644
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro=
-to-detect-largefile-sup.patch
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro=
-to-detect-largefile-sup.patch
@@ -1,4 +1,4 @@
-From 65fb22e302a4dbec675377e61593b52c2e291705 Mon Sep 17 00:00:00 2001
+From 334b66af1329bc6970c9ff9ee668af6cc2133b8f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:54:27 -0800
 Subject: [PATCH] configure: Use autoconf macro to detect largefile support
diff --git a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_c=
c_for_build.m4-macros.patch b/meta/recipes-devtools/strace/strace/0001-m4-B=
ackport-ax_prog_cc_for_build.m4-macros.patch
index d3e35077de..60e5141197 100644
--- a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch
+++ b/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch
@@ -1,4 +1,4 @@
-From 77790a889ca5227936e2de2c587ef1fd9c8e718c Mon Sep 17 00:00:00 2001
+From b402cfcdfb782ab3a8b264b23536a4de5f709746 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:39:47 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducib=
ilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-rep=
roducibilty-issues.patch
index 78509da2b1..4907b16a1c 100644
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-is=
sues.patch
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-is=
sues.patch
@@ -1,4 +1,4 @@
-From 455905ce2a3f886264e6344051654d7c2d9faf88 Mon Sep 17 00:00:00 2001
+From 5905b406c5325442f2001339937ad22b2d068b15 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 19:56:55 +0000
 Subject: [PATCH] strace: fix reproducibilty issues
diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t=
-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-=
off64_t-with-off_t.patch
index ec1905321a..e784268855 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-o=
ff_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-o=
ff_t.patch
@@ -1,4 +1,4 @@
-From 447203bdced57a521534c4fb7d1962318a81c1bd Mon Sep 17 00:00:00 2001
+From bcca8619f749ba78a4ce78d39c603e2606175175 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:56:13 -0800
 Subject: [PATCH] tests: Replace off64_t with off_t
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/met=
a/recipes-devtools/strace/strace/Makefile-ptest.patch
index d864b68fc1..1e3c8ee2aa 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 6f9eb5907fa2a7d6127737e41fb4e9fb5fb091d3 Mon Sep 17 00:00:00 2001
+From 2749699b77b4fcce7e6e960f246259b05f3dafcc Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 20 insertions(+)
=20
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index f37d053..975f878 100644
+index 84a9638..23fd218 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -18,6 +18,7 @@ SIZEOF_LONG =3D @SIZEOF_LONG@
@@ -24,7 +24,7 @@ index f37d053..975f878 100644
  AM_CFLAGS =3D $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)
  bundled_CPPFLAGS =3D
  if USE_BUNDLED_HEADERS
-@@ -967,3 +968,22 @@ check-valgrind-local: $(check_LIBRARIES) $(check_PROG=
RAMS)
+@@ -968,3 +969,22 @@ check-valgrind-local: $(check_LIBRARIES) $(check_PROG=
RAMS)
  CLEANFILES =3D ksysent.h
 =20
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/me=
ta/recipes-devtools/strace/strace/ptest-spacesave.patch
index 33f9c86894..00f404c003 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -1,4 +1,4 @@
-From 868dff21f47036dec4db603129d46d4f8ea4a29d Mon Sep 17 00:00:00 2001
+From ae538d4dcb0ea7265d72671b7dd3537ca1356437 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 29 May 2019 00:10:32 +0100
 Subject: [PATCH] strace: Tweak ptest disk space management
diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/rec=
ipes-devtools/strace/strace/skip-load.patch
index 1bdcb77ddb..610dd94fe9 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -1,4 +1,4 @@
-From 537e44aa0204590171936eec0fcd279b74fbbfee Mon Sep 17 00:00:00 2001
+From 2653515537b66a4b1286be107e9ef406c55040b4 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Sat, 30 Aug 2025 00:47:03 +0200
 Subject: [PATCH] strace: skip a number of load-sensitive tests
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/=
meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index a83eb49ba3..8895b0ff9e 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From 7066b2e49ddbde0379ca52cebeefeca4f80fb75b Mon Sep 17 00:00:00 2001
+From be1b3d74ca4ffb3c8d3e38fdb96f23d5920f8ef1 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:01:00 -0800
 Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
diff --git a/meta/recipes-devtools/strace/strace_7.1.bb b/meta/recipes-devt=
ools/strace/strace_7.2.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_7.1.bb
rename to meta/recipes-devtools/strace/strace_7.2.bb
index b5c6543da0..6ae1de7c0b 100644
--- a/meta/recipes-devtools/strace/strace_7.1.bb
+++ b/meta/recipes-devtools/strace/strace_7.2.bb
@@ -19,7 +19,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/strace-${=
PV}.tar.xz \
 SRC_URI:append:libc-musl =3D "\
            file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
            "
-SRC_URI[sha256sum] =3D "81743ecf2a5b44186b2f5038afdc8beda7e5c70aed15b4fbfb=
cc6e9ece24490f"
+SRC_URI[sha256sum] =3D "4bde6246926890dcee824f6e6ac42a06752f47d77e5097d86e=
3c0d6d4b709fe5"
=20
 inherit autotools github-releases ptest
=20

