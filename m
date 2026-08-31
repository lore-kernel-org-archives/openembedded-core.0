Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0F7C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 06:25:12 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23847.1788157502324163314
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 23:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=SuxVHoFU;
 spf=pass (domain: est.tech, ip: 40.107.162.35, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWmoos4f16/2TvzyJx9P5AkkYhHyIJNWDFbMif+nATtRDY+QSnHERoJbECcJ1En89jP8bmHCRojyWYl2ZXI5jQoha1OUeJNNH0Nhg+bIl26dWAQPJqVy1dqonDxJMiX5qqf/HKcSJVyitdtVnjD8Z/qqvg04wZBUhEb611TybRnvbsmtS7LvVcL0QJNHd5+x42uSrcllWN4mSIXsyyQ1Zrrzo8OhdZcHm8XxtKZpwQRshZYe4wc808nDesI2sEVRO652ol9R78S1xIH72Lg1UTTxxj8pZ1gMZmbdNG5X8fym64Zt8EvCp4N+NQ4khwgsuuhP2wdw+fP2AVRX5vztcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4lLq14jhjqsmdQ6YgPPA23XX+AIHUVx2ojmBLTrc3I=;
 b=nAoHk+TSlwyEuBZZvj58vtbAmV0FRUwecL88LMaO8lP5U3mQtBy4ZZgs3LH+T2GzDq4TS1rXgaxn2lXcxwJ5jerJAAJIUgVD3pdzeOxZveSKCexs9wCfDfTq2Jm0N9uO+9G0QtI3uKHmYXiPiQB5T5Vjgv9lZ1onJM8uTasLFT7Yv2HHJHFfI93iXzZ4z6f9/Yi4vHdJsggHcAsk+QrkqBwbgnNHs7Pu55A6gaW0IWzdIapoc8qTtpZTppqfWbeihMzeleJjS9AhRsvo3RYAbdHSeYngEyupaTrhZwgY6n38UxLJMiFSbIHSU1u5w7+WZVl3qJzJasdnkm+B+tOihg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4lLq14jhjqsmdQ6YgPPA23XX+AIHUVx2ojmBLTrc3I=;
 b=SuxVHoFUyGGvyGYEtv0Q06UbnnPdL+o7JYpk9Nc2QxCpf6OSnCYz9GIM1VY7KknoooWic+ru49Q+vvq3PwaiK7brhk2gqHWeFmr1JllNZHmo4vaXwNGUAV1dD62u7iXPpEIl/cUjiOgrxIhZxKJx4mK9zS+XqrkGTQvFW6mZaG7b7deALvytb1TG8FYQFZ1CkK5UJJIxcv9VJH6vWZWg6LdEkNrZ6iqE0AqOtrPOHzLkY3JIO3bFOAqlCvChGyGS0ZlRMs931ESuxfVDds7C0Gn/atdKe2AgU3zs4NnB40LHyF9Vy6b8+kYJWdxdsBjNB3MHKhwssvYj8Jmosj80YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:24:58 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:24:58 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v4] zstd: add ptest support
Date: Mon, 31 Aug 2026 08:24:53 +0200
Message-ID: <20260831062453.8048-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519090816.17783-1-pratik.farkase@est.tech>
References: <20260519090816.17783-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0457.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::12) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AM7P189MB0725:EE_
X-MS-Office365-Filtering-Correlation-Id: eb978e57-e13a-4973-2244-08df0728948b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|3023799007|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	S3BjE/8GCJDD9VSOuNk15HgADmEdxZkHl6X3wUN75tgNFGwHxiqoWrJXldN8eHtH5AQqgBvZS9ThFGUnpR/Ht5SjNN6PL5VN97nIjgp8YyFMnU6jO1T4JohZ2hQaTZVbFgFCOFTrzNcIb9lt4kVuMNJedTIAW1XLyNbcyaSY4qWwKpZBi0Bv9WQxvMwLA61+Yj+y4eQ3IfzXMjjVL/IWzF91vSdcvuQqeI7WPv4mYBCI+q74em+vl1vNydenhKqGztT0T/lEZiytk9DNo5GDsd5OsNeqMyPsgANGh4C6WCtcfSgEmhjNfHr9jAJB95tHNqP9DgA//Uuw5LPhX/zygS1KryH1u3EbcWFVZFnGDQxYP2tdexxS98IkwMl5jsempgnplfwXbBheNq65IhRP080+HVbu9EEzOlefdYKU60Q67OWTFK8sRbNhIxaOLEpT9YkOfrMqh2qQbt1chAOk8pUm+xv2NyznAFC5kcNSbBcQlfO+OcyazkuVBj1Ohq79ijcDqJ5oOcheBah/ew3dTqVZzvkf/Ykjc5+17FrF0MCx6y3yMqv/dyVABJ2eNkMbVYIau5S71BmdVuKP5pL3yRECu31qt1LFekk2+nutbKJILlgiKVyBIm23voXN+c3c/QH2XLqLleZ0NsqN60qIaLwLC3rEK5om48ywwtCVTgw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(3023799007)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5V3JQ5mI2/i6N1SXw1iUpfhEj4P/jRS1lgwMIFvNLDy6kjqMcLwp4WG9+CqS?=
 =?us-ascii?Q?3IDhowoiPhIz6SPwNW/J1yYTWJvHe6PwILG/9SUNpZ7fHfgO5k9lzY94nHBr?=
 =?us-ascii?Q?HnKjdY+mp0VTPhOyvE07+UkCmFsIQUGbJ/iIshenajhewo0Kf9wRCzN5RRJ2?=
 =?us-ascii?Q?5Xa1pZb635Kvlb3fZikkbEoNLel5ohPS4e9Nyp26u8Fj1q+5K1nljfwqgkat?=
 =?us-ascii?Q?NhAQ8sPXtoqW/iRqjOp+cpGB3YMfuwWzAjDOksw0hgGuNFJ0nGUHRSJw/4W6?=
 =?us-ascii?Q?PBXKThrci/7TpKAKNBVGuzyyaNy85iyWdnCkfTDPY70ChfVEqrG08SDdahq2?=
 =?us-ascii?Q?yYgmkKh4nuv1iuvZIE21e9eugEez7U90z/x5+axV5vXxjVnsCIWFXIwa+Qzp?=
 =?us-ascii?Q?260yTUhy/lif8f3Hvumyd6AV5g/GV8gOPH358gKTxf8HRLPir7qN78x/mBFS?=
 =?us-ascii?Q?7rNvxFbK+N2KJdTgDfMX2N74LH+NPznMUToOapfnA7Oze4tuUQvCrvJl2nt9?=
 =?us-ascii?Q?jTmxLALEiEzQ9gUePTDs2KXYl4Cr1WNvsDqW/o9p1TgGBW40cPl022CfnH8O?=
 =?us-ascii?Q?IFh/a988tKPEup328R0Tb0dOZRW6Jtjc5aV6yRPDJWLoDySRqk/AOH1T5bMR?=
 =?us-ascii?Q?GRZ6AAIhVvwQzs3HsKAjgcxGd/d8rNfk0J0udnt+6PIOFoc2kyNZ9XHAbYy8?=
 =?us-ascii?Q?0qpRvCMAzn/WrIhpQp3n/vi884RLIq68ZqIilj0euYzuyW0Mzxmxexngdbvj?=
 =?us-ascii?Q?lC+PDAKVSgy0x2Fcb2NHQLjBRV86hnBXbwvZ6rpxz+bhm+VtVNyjcn8Ygq3w?=
 =?us-ascii?Q?onAhel2uyNz7c1U6d4vasyXff0T6rqcw24HNlqCKUbT3TyHL25iP4vtboR07?=
 =?us-ascii?Q?5gOKRarWI5PtY/28NbQusjhSkMEv7xvVY+1Z+//OGeMGYCj+z1Ht+f84nghs?=
 =?us-ascii?Q?bOPEwT3b25pv1CsuOZ1fOnh2f9L8ZlWki9lTIqI8pQqW9uj/VFnN6zB4XTV5?=
 =?us-ascii?Q?d+Ko0dY3xNIaR7d/1cvIohvyzpXuePg7UIzO/43ORxPaeCGGDer0Di++S6lA?=
 =?us-ascii?Q?zaDMbY3BDi3byHobKfRKLIcT1VSz1zHdC5yGw77N0NkQBQ23OxvNlEgezpgV?=
 =?us-ascii?Q?EFq2nbNvAJnqtvsXDJZ3b6p8gDElLDq4tX1JoutXpCnlYySWJSbAGxWldd6m?=
 =?us-ascii?Q?hHRUzNTFbBA7eUjIni5kUmWEI9T3zh5zndYCzBMYdrleOEbaUjGpuvDs0Elx?=
 =?us-ascii?Q?iI5gN7albTt+t/29qugYx4IT3R9765ykvDV+EpjFjeuWTLW0tEkwhs8AHVar?=
 =?us-ascii?Q?wxF/UqHpodJOiUhCosPYCvaLHoGh8qqcpvqrvx10em2AEtbJGkZfcDxPFkiq?=
 =?us-ascii?Q?lHTrJgji0G8C0prn/N9b7syywhXNBSUeZrwhy0mMmWapUAQSVmOzL3ayJOXn?=
 =?us-ascii?Q?PULKYEb7niGxrKNV7JcvABoU4TuxssQRY3n/aTAk6umCz3Tpb+uPUd/jd/CL?=
 =?us-ascii?Q?HRPrn0IfRXPvLM/R6J6bIVmu/f990m2sqyR+vgCsskVsmquU1Z24Rh2QeGo6?=
 =?us-ascii?Q?3jm/oumtP1673d4BOgAbDjyOzsxkwNuft41Wlp4hS1GHOnmwjrlkjkbvAHFV?=
 =?us-ascii?Q?DIf9g4xjNVaZ5aSXqZwc1DCSzhG4ntDP6ven2A5pXSqPsX+vVsNTWiYA4+jS?=
 =?us-ascii?Q?mVgHoRjFXGZrqFqEHUJ7ikTnWVNhgktTd7tCyswSDQHkP8uu1bcSq3lbiMgd?=
 =?us-ascii?Q?6SGl53Ub9g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: eb978e57-e13a-4973-2244-08df0728948b
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:24:58.3286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdhtb1medhH8QCCPq9at8VizDNZSe20054o8Z8GNIUFkn3cUIIusqHRW+Mc/fHfQLI2njogC3U8+6MrjqgaLIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0725
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 06:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244732

Add ptest support for zstd running fullbench and the upstream cli-tests
suite, providing integration testing of compression, decompression,
dictionaries, file handling, and CLI behavior.

Tests included:
  - fullbench: validates all internal compression/decompression functions
  - cli-tests: 41 shell-based integration tests covering compression,
    decompression, dictionaries, file-stat, progress, symlinks,
    cltools, and multi-threading

The cli-tests run as the ptest user so that permission-related tests
work correctly. The levels.sh test is patched to skip the --max
compression level on systems with less than 10GB RAM, as it allocates
~8.5GB on 64-bit systems.

Tested on qemux86-64 (4GB RAM) with ptest-runner: fullbench PASS,
cli-tests 41/41 PASS. Runtime is ~41 seconds.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
Changes in v4:
- Run cli-tests as ptest user for permission tests
- Add GNU grep and less to RDEPENDS for cltools tests
- Install zstdgrep/zstdless scripts for cltools tests
- Patch levels.sh to skip --max level on systems with <10GB RAM

Changes in v3:
- Reduced test scope to fullbench + cli-tests only
- Removed fuzzers and stress tests
- Moved from PTESTS_SLOW to PTESTS_FAST

Changes in v2:
- Added source .c/.h files as training corpus for dictionary builder tests
- Fixed cli-tests invocation

 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-core/images/core-image-ptest.bb  |  1 +
 ...std-max-level-when-memory-is-insuffi.patch | 31 ++++++++++++++
 meta/recipes-extended/zstd/zstd/run-ptest     | 21 ++++++++++
 meta/recipes-extended/zstd/zstd_1.5.7.bb      | 40 ++++++++++++++++++-
 5 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zst=
d-max-level-when-memory-is-insuffi.patch
 create mode 100644 meta/recipes-extended/zstd/zstd/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index ce6c0a2d76..d8eba9dafa 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -150,6 +150,7 @@ PTESTS_SLOW =3D "\
     tcl \
     tcl8 \
     util-linux \
+    zstd \
 "
=20
 # python3 ptests hang on qemuriscv64
diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-co=
re/images/core-image-ptest.bb
index b20e8ca76d..c9d4414c85 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -45,6 +45,7 @@ QB_MEM:virtclass-mcextend-python3-numpy =3D "-m 4096"
 QB_MEM:virtclass-mcextend-tcl =3D "-m 5100"
 QB_MEM:virtclass-mcextend-go =3D "-m 4096"
 QB_MEM:virtclass-mcextend-gnutls =3D "-m 1536"
+QB_MEM:virtclass-mcextend-zstd =3D "-m 4096"
=20
 TEST_SUITES =3D "ping ssh parselogs ptest"
=20
diff --git a/meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zstd-max-l=
evel-when-memory-is-insuffi.patch b/meta/recipes-extended/zstd/zstd/0001-cl=
i-tests-skip-zstd-max-level-when-memory-is-insuffi.patch
new file mode 100644
index 0000000000..5652887e38
--- /dev/null
+++ b/meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zstd-max-level-wh=
en-memory-is-insuffi.patch
@@ -0,0 +1,31 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Pratik Farkase <pratik.farkase@est.tech>
+Date: Thu, 27 Aug 2026 12:00:00 +0000
+Subject: [PATCH] cli-tests: skip zstd --max level when memory is insuffici=
ent
+
+The --max compression level on 64-bit systems allocates ~8.5GB, which
+exceeds what is available in memory-constrained test environments such
+as QEMU. Extend the existing 32-bit skip logic to also check available
+system memory, using the same fallback (copy level-19 output as max).
+
+Upstream-Status: Submitted [https://github.com/facebook/zstd/issues/4748]
+Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
+---
+ tests/cli-tests/compression/levels.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/cli-tests/compression/levels.sh b/tests/cli-tests/compr=
ession/levels.sh
+index b8230f2..7846d3e 100755
+--- a/tests/cli-tests/compression/levels.sh
++++ b/tests/cli-tests/compression/levels.sh
+@@ -16,8 +16,8 @@ zstd --fast=3D10 file -o file-f10.zst -q
+ zstd --fast=3D1 file -o file-f1.zst -q
+ zstd -1 file -o file-1.zst -q
+ zstd -19 file -o file-19.zst -q
+-if echo "$version_info" | grep -q '32-bit'; then
+-    # skip --max test: not enough address space
++if echo "$version_info" | grep -q '32-bit' || [ "$(awk '/MemTotal/{print =
$2}' /proc/meminfo)" -lt 10000000 ]; then
++    # skip --max test: not enough address space or memory (<10GB)
+     cp file-19.zst file-max.zst
+ else
+     zstd --max file -o file-max.zst -q
diff --git a/meta/recipes-extended/zstd/zstd/run-ptest b/meta/recipes-exten=
ded/zstd/zstd/run-ptest
new file mode 100644
index 0000000000..0949e9187a
--- /dev/null
+++ b/meta/recipes-extended/zstd/zstd/run-ptest
@@ -0,0 +1,21 @@
+#!/bin/sh
+# SPDX-License-Identifier: MIT
+
+cd "$(dirname "$0")/tests" || exit 1
+
+run_test() {
+    name=3D$1; shift
+    if "$@"; then echo "PASS: $name"; else echo "FAIL: $name"; fi
+}
+
+run_test fullbench ./fullbench -i1
+
+if [ -d cli-tests ] && command -v python3 >/dev/null 2>&1; then
+    # cli-tests needs to write to bin/symlinks and scratch dirs.
+    # Run as ptest user so permission-related tests work correctly.
+    chown -R ptest:ptest .
+    su ptest -s /bin/sh -c "./cli-tests/run.py --exec-prefix=3D'' --zstd=
=3D'$(command -v zstd)' --datagen=3D./datagen"
+    run_test cli-tests test $? -eq 0
+else
+    echo "SKIP: cli-tests"
+fi
diff --git a/meta/recipes-extended/zstd/zstd_1.5.7.bb b/meta/recipes-extend=
ed/zstd/zstd_1.5.7.bb
index ef0bd54c9c..4c3b377c14 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.7.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.7.bb
@@ -12,7 +12,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0822a32f7acdb=
e013606746641746ee8 \
                     file://COPYING;md5=3D39bba7d2cf0ba1036f2a6e2be52fe3f0 =
\
                     "
=20
-SRC_URI =3D "git://github.com/facebook/zstd.git;branch=3Drelease;protocol=
=3Dhttps;tag=3Dv${PV}"
+SRC_URI =3D "git://github.com/facebook/zstd.git;branch=3Drelease;protocol=
=3Dhttps;tag=3Dv${PV} \
+           file://run-ptest \
+           file://0001-cli-tests-skip-zstd-max-level-when-memory-is-insuff=
i.patch \
+           "
=20
 SRCREV =3D "f8745da6ff1ad1e7bab384bd1f9d742439278e99"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
@@ -44,3 +47,38 @@ PACKAGE_BEFORE_PN =3D "libzstd"
 FILES:libzstd =3D "${libdir}/libzstd${SOLIBS}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+inherit ptest
+
+do_compile_ptest() {
+    oe_runmake -C ${S}/tests fullbench datagen \
+        ZSTD_LEGACY_SUPPORT=3D${ZSTD_LEGACY_SUPPORT}
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    install -d ${D}${PTEST_PATH}/programs
+
+    # Test binaries
+    install -m 0755 ${S}/tests/fullbench ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${S}/tests/datagen ${D}${PTEST_PATH}/tests/
+
+    # cli-tests
+    cp -r ${S}/tests/cli-tests ${D}${PTEST_PATH}/tests/
+
+    # Golden test data needed by cli-tests
+    for d in golden-compression golden-decompression golden-dictionaries; =
do
+        cp -r ${S}/tests/$d ${D}${PTEST_PATH}/tests/
+    done
+
+    # zstdgrep/zstdless scripts needed by cltools tests
+    install -m 0755 ${S}/programs/zstdgrep ${D}${PTEST_PATH}/programs/
+    install -m 0755 ${S}/programs/zstdless ${D}${PTEST_PATH}/programs/
+
+    # The levels.sh expected stderr includes set -v traces that change
+    # after patching the memory check. Remove the exact match file so
+    # the test framework ignores stderr comparison.
+    rm -f ${D}${PTEST_PATH}/tests/cli-tests/compression/levels.sh.stderr.e=
xact
+}
+
+RDEPENDS:${PN}-ptest +=3D "bash grep less python3-core python3-modules"
--=20
2.43.0


