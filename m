Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A031DC61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 08:22:23 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25180.1788164540861489240
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 01:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=X5Sxpu9a;
 spf=pass (domain: est.tech, ip: 52.101.65.28, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KulyKIluIOH4LpQHv0YlEInDPogmLUoiwwgGlDs5lmJyWWSsqPES8iWbiOC++Vd9fLooruBX/AdzCaBhtXdduYJn/DlGS9GEOKyodroa6FlpA4WA/5ibloPMr4yaXTebIZNibsiogMpBXraNvq1/3JVWoU570a1gJZrlDcD10GKVDtyQ5KybShqFS2Pk6uhvL5fvB5eU7lw+arcONwNaKmBCc6aIgetFPuXH6fszPK4hVmdjP5TFsK+8l6KB1XsEG6mPz68WO6uuXsfi0d+jEsl9jlHbMPjGVhSxlFnlQXoypTpI+4Q0mt5bjhzfmQSl826foVRIs6I+Py3Yfsvb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zl8hX2qHgvuJ1uR2Ov/ThM7M9Tl4SPeEkewFh3U+Ijk=;
 b=gSZtlSVCiavmwQOzX79a0OJGibDHC5o1f7sX+6az8PdzHw3joU/Ig6UJD5KpTwd//xrGSCIDMoNrUVrHwEZTZccqSQ9jftq26Aqb636iUL9FKlmtLEvmJ1yz9jZ02orCXmpScQGoTkwG3Xsa+e+U8DNJ38zSy356ov/VgzlyWm9u9epEuhafNT8dWuc+yAYsAhDe350pyhitiTCS9LUMgVjldjC9xYJ0xWPn0ZXRH8p7Ed+KmVdRVQrrMV0h1dp9clNfpXt9qCSHJvSVFfiHP3/cOzXTOSvf5AbLqQwrIsoUkfB9EWumgi0yeOajxCfrmgsprTHmLPfhCnaT/R1Xhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zl8hX2qHgvuJ1uR2Ov/ThM7M9Tl4SPeEkewFh3U+Ijk=;
 b=X5Sxpu9aHTtNh0HTNIgfgzx/jN4hXHI+J5eUYMji7RUG/iqxMsvMchBEOSjUgXccgU9TtgZlCWdFs14g1CYZQ1UZwM+qkrapvbKwTYiN9sETjaTn8hmdboZ8WUw6LDwvwzNcQDJaHNfTObPvgZZn5cFX0NwwcK44ZN3u4jnH7GGD3x7WLMmrlQvAB37YmdFvZxs65ulnAKWhdbRnbnxWQydKiDC3KAovc4gHL5B9Qf2FEs3ObDRt1JhLYzhwxGwDbQDycrGnUVP4K2Y5lccFSrpMT9fmEbaRSFeCJMIX9P8x5HDGrCyH8Yv8sP+Vf/qW8AbJMBcfUdGw40xFOfeMOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DU2P189MB2544.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:499::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 08:22:16 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 08:22:16 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v5] zstd: add ptest support
Date: Mon, 31 Aug 2026 10:21:52 +0200
Message-ID: <20260831082152.9680-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831062453.8048-1-pratik.farkase@est.tech>
References: <20260831062453.8048-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0050.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::23) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DU2P189MB2544:EE_
X-MS-Office365-Filtering-Correlation-Id: 058c4a1f-3b2b-4afb-bc58-08df0738f798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|6133799003|3023799007|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	NiQBchQidvt9xjueDmnGXtl8yP+hgPgOWOy1nLM4Nx2V/hKERWHlk4b7/vhwxZSQttrhiR8J0vOX26AzYuNyyqlRvOkeEfMmJsVqkm5U+f1pihWw1sVNL5xrPeEgmRUAZEdlHgOt5+jLIamfL6xNvAnLJTAVzv5MkWpiLAUAfiMQEJry6LzRkrOW05tH1XtD0ubSV1j2QG8hKYHX/VP0Mj8Y50UJ8dpfG6VOmNraNjOMlbrlQgI/f3dsWVPie7cj/NXtDUjEtFLcqqpKZnlsa5MCMGceRLi9ZLuhAMaBxWbu917tjePQJ12PS6vzJqo9RHdtqoUvNGyVibIMAuHaeu0C319/mVKz2Dwi95Rw9p1qRHtK2j3F2m3ZN2L1gO+xmVs9x/3ZUFwM9GCsZ5ZtGBuWJoEyHPvjVzRe++tI1K8TeXt//Bpe9PfajA9ykLI2+L9NRDWrZ5gAyaL31z4NIsa/rF7gcNIW41QJ5qCjhyQTL8zrARFUo6WiNl+2B4+uNzetylg4Q98AajQS3s8mN2dtVrl1WlL7C24aZOvDRaBGlMu59Arq2UAyb1g2am+iZSw/L17hr5iDbNVgz4mkNp7VPDdQmNitTfuWd/DQopZVrAUaEM7ufaW48YB8gx1LHnuQGWhEke41sz9K91/dYmwaUN6JE7DSEGp9V7nojrI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?STGUs0UllePq5qIERYaA8uPb+/Rg22tZ3YjclTVlcc09+1YVp19zgqtf8GNt?=
 =?us-ascii?Q?IfhcsKV5gG8AdmBR+rZ5vXdkXL24jCwAr+fMeGb0hpE01gZkWDdwphetBeya?=
 =?us-ascii?Q?KrmadJOtYP+cI2YuAv5r9a7wTpf4nwnQ+l4x7N6Hy1lxgI+iKmFd61bFpOa0?=
 =?us-ascii?Q?RhbfRVelr/sV31eOED/b7GQ4fYPPHhY8VHccw0rC2P1WyfSQ6l4W5W9CgVz4?=
 =?us-ascii?Q?RJaDnXSWilD9LHFmqwOT+wW7mCUe26Af4rQmwxXouaV2TKzynhpIxN8Dk5Dx?=
 =?us-ascii?Q?/0KhL7r3Puv85Kcs7TdHatxN+Y0dfMzYp+TJSA6QrERk8pEKaECieQ6BvlvC?=
 =?us-ascii?Q?VT/JFTfr8vgf24Rv3BhTYIcHzwRCL2MSmRPS6cGevhBN0oA+LbeEp+SGTrIU?=
 =?us-ascii?Q?jrku3Obd61yBpRuX43oWFEczZOc6rVzZfWsq4OguMBIvdpWYlJDiHjXYeMFL?=
 =?us-ascii?Q?VhODGI+mJuAzmuC2LMXP6wCLtbX73Oqx8jZGA5eQ8H8KXDexENEZx53Xegka?=
 =?us-ascii?Q?WvJENYkW12FVp8/UOU/A2Cj3Een6goYdpmOyttVSNFMXhYFLyUAalDhrNtMT?=
 =?us-ascii?Q?19A8y911bCo6FObTKFLUaaDRqGCkIoCDP5/Ot+lTyYDvnnF9XdKQYRcIpcw4?=
 =?us-ascii?Q?K0yj0camPiMfaHf+zPnEMVpv1CUvHBq4ZQMsHIQW7gjLGfj4eLd1I7oZYnzN?=
 =?us-ascii?Q?OW+kgsDs+6wbvfwy5cDpsDfTO5XXz49HZSu6eq/rRetjmcPaZew6X9yswsqV?=
 =?us-ascii?Q?uopKKayPfiQibczV7auX3mABdupIm1R0mi+/e+qZEjAKYFvLP6wIYu2y61s8?=
 =?us-ascii?Q?/LhXi/SVVvkWB5BA6OJLU9MqMDWQg4voYblLrrTNzeNW4viIK93w3seQ3jUg?=
 =?us-ascii?Q?BqEtcLmAtNcH1d18MecqM4Mqzrzux6CX6j6EBT7gvf9eTnPCA1uTJPw4kKu1?=
 =?us-ascii?Q?OAS0cUK20w3BKM2xxoQokKX+IVrtJf4hzCjPLhPb/3akTNZG34cjTMRMUxU6?=
 =?us-ascii?Q?OIuOlWTJiSLwje10/za2vR6VD42cHUw4TXxv2EUPk0135caWNYQS1GHSrF//?=
 =?us-ascii?Q?NZiQZJuJngMOyRBhcFkun36xbFZfLeIcBzUmUNywB0WIAEx2PcNbIP66s4IL?=
 =?us-ascii?Q?0g+wcZHjWttA5Uzpm4x9mAluo2D4CO1f9uqGXOBdEXDcXXMIeKEdBrbZWN9l?=
 =?us-ascii?Q?ib3THm31JT8xv0D1ZAMhpZ8FgrIdeLmZ8tMymOjmhRo3GLrgHcs76qBrw8bB?=
 =?us-ascii?Q?QjKsmefPzJj+TsEWRWTtA42yCRL6akl/YvNhr72uNjOW6rqc4lQSrXVTXs9Z?=
 =?us-ascii?Q?q5b7+m/2oCPc8yAYLbqU2Usz3MaqVSBcD3WbVQc33WHv3cgBts9ME20MH6gr?=
 =?us-ascii?Q?z5R/vfCy1o1PZJQXynMl90xnqjULiJKlFsSTwIDQiP9DKesYeJfMsvGPHppo?=
 =?us-ascii?Q?L670ViZgT+tWj2QxYDbjPLJ5ztSpZIaBLWcodXWE6osKeV4dsZyc5a+njp6l?=
 =?us-ascii?Q?FeFpi9JgjjWuV3M2tyx4Xi+sVMcWGx1UMjJEVnDuXkd40v18vmVU8EwZ+Dv8?=
 =?us-ascii?Q?YLTqBok/hwbKMNQ6rUZ1D1Wu4/dyIIn0onq92xmHgsH2uPxQ+OFFmPspJi13?=
 =?us-ascii?Q?J9zrohjDQZqOjlWf8vnZ+5MBYQlVz91tN76rgPl63RPrUB6gdEyFJ8X3G5Ki?=
 =?us-ascii?Q?unNmTkv3EgVeJTOmm6rmiiQbSaS1idM4SMSz7POqqGTJCwksWYgkltVD9LyU?=
 =?us-ascii?Q?w+q5/tDsEA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 058c4a1f-3b2b-4afb-bc58-08df0738f798
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 08:22:16.4532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3UrsAUdX+vHgV5wIQf6h0udt0OYJ45+ekQRs8N9wTp0QXkYMytS1J6JWgR9KOZLt+BZIqWeZlP58Jd38wM0G4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P189MB2544
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 08:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244738

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
Changes in v5:
- Add IMAGE_ROOTFS_EXTRA_SPACE override for zstd ptest image
  (window-resize.sh creates a 1GB file and needs sufficient disk)

Changes in v4:
- Run cli-tests as ptest user for permission tests
- Add GNU grep and less to RDEPENDS for cltools tests
- Install zstdgrep/zstdless scripts for cltools tests
- Patch levels.sh to skip --max level on systems with <10GB RAM

Changes in v3:
- Reduced test scope to fullbench + cli-tests only (per Ross's review)
- Removed fuzzers and stress tests
- Moved from PTESTS_SLOW to PTESTS_FAST

Changes in v2:
- Added source .c/.h files as training corpus for dictionary builder tests
- Fixed cli-tests invocation

 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-core/images/core-image-ptest.bb  |  2 +
 ...std-max-level-when-memory-is-insuffi.patch | 31 ++++++++++++++
 meta/recipes-extended/zstd/zstd/run-ptest     | 21 ++++++++++
 meta/recipes-extended/zstd/zstd_1.5.7.bb      | 40 ++++++++++++++++++-
 5 files changed, 94 insertions(+), 1 deletion(-)
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
index b20e8ca76d..e466562859 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -45,6 +45,8 @@ QB_MEM:virtclass-mcextend-python3-numpy =3D "-m 4096"
 QB_MEM:virtclass-mcextend-tcl =3D "-m 5100"
 QB_MEM:virtclass-mcextend-go =3D "-m 4096"
 QB_MEM:virtclass-mcextend-gnutls =3D "-m 1536"
+QB_MEM:virtclass-mcextend-zstd =3D "-m 4096"
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-zstd =3D "1524288"
=20
 TEST_SUITES =3D "ping ssh parselogs ptest"
=20
diff --git a/meta/recipes-extended/zstd/zstd/0001-cli-tests-skip-zstd-max-l=
evel-when-memory-is-insuffi.patch b/meta/recipes-extended/zstd/zstd/0001-cl=
i-tests-skip-zstd-max-level-when-memory-is-insuffi.patch
new file mode 100644
index 0000000000..5f9d5b85d1
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
+Upstream-Status: Inappropriate [https://github.com/facebook/zstd/issues/47=
48]
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


