Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7FCC61DFD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 07:16:33 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6992.1788333384780883665
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 00:16:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bRnoubg4;
 spf=pass (domain: est.tech, ip: 52.101.69.6, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuMcXpX4Pg92dSmeHtz5+yYnbQMKPqzs0LBbSLCN/pFIwfsrGzG6bxHK84H/Ar8Mb0YU5ZE0W9flwKcdFtdR2LyU10s9h4AlFyFZsUxCatlL4iLuQkpdEJKtjVpIyGPAxOFwku8hnv1hJmWVt5n0CX+28X6lIcdmLIOE6zuDx9lMQnkB1WuMuMyADK7Q51MSJpAs14ScChlIyrJ7bOQXcJ91DLmJDds64BEAJmaGN9PCyPDZ9cOZVDTk670ioAjzuRvbwDgwgQyj/JDGw2h4/ckDZjZPXlMT02cbT7z62bKJ1NgspnVhCPkkOVKASDFShZXzCmTp2rmt4hAEZNhmLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yyk2kLDp9Py7woBruwVtYYPU/ETM9McvnjZdd7uBCt4=;
 b=VXhX2wiur7AJz7Tv1P2b4KT+kn9s/ljOySyPWUNnH2AwrnNxqvMj8gc+agAbN1uCmvoPU4OexRL+OhFQyJTzBbmVZAExO3AOvSD4t6653ZT25VT4+mECJJuXrngaIx5qHj9FRBNPDN6ogdN3ujgv7KHGgyQDBDaEooHw8+wgY5o5UUDNxN0Zn221tPIBEE4+7xwtpWyrYwYV2PAefYWSFQltcZbBfG1bnTgbqqrJ1zPLWq07Z87EztNCSlSh9ldiHCgL05Ga5O5qGneRH+/0s7AtCmLdsT8vqF6g/Pm0r1PxFUUyJUQcwtTf0gw2fiXyCxOQVuqSKGCCRJTOjTyd6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yyk2kLDp9Py7woBruwVtYYPU/ETM9McvnjZdd7uBCt4=;
 b=bRnoubg4F/wCO7EnWj7vs+YLf1hHUDHyOkSTBLeUDJxMLpyYUWFqdcvyTRsnRBFO1XzRANJ3tlqroI8FCBOJKLUXo3PyeNl+7RuAjkwLoRK4qYsInaC/QCua3c/4tIeQGPcqGiEgdgjHQ3RLDc+O9a5utfSgs6grEUHsqovqLzisdStj/ZmdtoO2WN7CHpSgoKKzGJphgPqll6u2cl3mWX1bZNP2CsIa48J8ZRRF75BC6t2yKhWLf1mGzUt+pW2n5qf+L5gilNWCGlBCqcegyQJi6dTJ577NOL53l2ePykkKIDqyVa9zupTig0zdZQxwl99+aTRsQjhEBZ5hsMshmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by GVXP189MB3404.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 07:16:18 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 07:16:18 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v6] zstd: add ptest support
Date: Wed,  2 Sep 2026 09:16:13 +0200
Message-ID: <20260902071613.9813-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831062453.8048-1-pratik.farkase@est.tech>
References: <20260831062453.8048-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0273.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::10) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|GVXP189MB3404:EE_
X-MS-Office365-Filtering-Correlation-Id: c01577ed-fc86-4d7e-bb26-08df08c2154f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|3023799007|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	+DEEO8xkWUd82F1pD0Qvqv/gGz7KYpq3t1hskscyGXWHYHv92SvxO1bq4qEepCG5xctHNZ3n73PNxlqu4nAJ/7oqv6OO1T3t27jEJeglY2kqiksFUj92FLdVF6bV/xBOoVPp2zhv+Ct5ZM7dM1Ho0xd0mxYpm+WxL1StPgp7tPqnRy7cOVpuH4wX82LOS2WawFc3Uq2L41vUSTOGZ5RY8+90geAEix385OzV68vi6giYbJxVjZ4w9PSJswdKEnTZEXdDIcfP3si431ARb2m3v12mB6sLZMKs1uxb4ML2wXdejudr7usEGultJMWxplxaqIfmp0gkeMTNrKKCQCCaaM3j/YiWMvzlAg7TXRP8pd51uZlk0+aaSJAfeGx6AOMPGU6yHm5aUJSzpRX6LbLE4bHJ7WrhUWyQMR79s4z9x21O/shi6m6+I2Vq6apdn3pWukY0tLX6ebi11kpTWYDPNFExIF58Q+ZUlu0KX/htyFeeQxcAmsweMLkPxYVaAM1UNCgY0jzcAt1Y0UBviDeINJBoaD58jrGBdvJEtJHodTWsksn9G3JJwSyarxGUdPoKMd7d99s92iLPXsFtbfPEnXuCVu9LwpxzTrXIO1o4n2X0bIeQlpXrxv6RPsZVZE2oFbRncF46NGtI0c9fFi9gNFh/AXpFe/7pn4IXO9uhN+o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VzD8RPBvswTh9TiR/OjzZ7QFk5qEo6BE1IOX9u8daeKvOYRFHfilRiuxv40C?=
 =?us-ascii?Q?0bJs1cm29/dexqdkEaJ+LhY54pNhmRS+1WU/PidcPYGBmOPlmCozdWXgd1fb?=
 =?us-ascii?Q?Gl3kuanpa7oqNaAhIWhKG69DCxzx4e9popoDGAnW7PbRBX//CoBR57Hpe7m0?=
 =?us-ascii?Q?r9lwphSNBeD8S+P7KSlR05y+dXhHQOrkob/pk6lKXnuMu33K4y6C89Uk+bKI?=
 =?us-ascii?Q?f+3OiKMcJ5zWnUc9jk8CPSm2Yeuzm3hP++4UyY+EvSGP6fmT+rEO1ZOzshEF?=
 =?us-ascii?Q?6ziNEWxRwXa528TwcaYr50OAwrHQ9sauJxMR6PEYw+nCqfzJvX9VHqvTJ4rb?=
 =?us-ascii?Q?JV0Uoga629xeYqR2UFS53OMNh6LI7vBHeKQtnwoLi2pxWx6X9F3wIXm8Uidq?=
 =?us-ascii?Q?/Rfp8e3CdegA/UsJXq76yCxTRGmpBWWmm/QgEmEvi7rbwwfRcmHdcNA2531Z?=
 =?us-ascii?Q?cemYh+/alSsINoyRVsSIXycPhRxC4NfyXUGgB6xDAKk6Pr0JfoVJEqG5xg5s?=
 =?us-ascii?Q?Q4pNTZyT8JS8S0SSM6T4A+Nycn8PXtKLZ+WPj238MUeeJOWKwEl8En7W+wWT?=
 =?us-ascii?Q?VCffo8E8iBSYawyOaXAdvmB8RoJp6GaPgKYEOkzPQaUDzSv+wtTdYw/5SQCZ?=
 =?us-ascii?Q?91LRdma78eX5MhCEh8W5m0HkNMDxo2ub9fmwQK8id+XHlhgj6dh6uy0iJPjZ?=
 =?us-ascii?Q?9RBHSdUgC2sM3T43iSuHhp5RIrqEW0eJqeW/CqY7jnGXTFaiPqXfLqxrgcVy?=
 =?us-ascii?Q?RTombqf4EDt+l2LyzeFyMIJsEVccIi7G+XRGovHSM/NfhPWjPc4LnEiwJIrS?=
 =?us-ascii?Q?qJQMMdJ6tJ1Usd+4ZjeeKvbsvxNzPK2pE7WVLjbIGx1HBdVQmADNrgISgfbU?=
 =?us-ascii?Q?KZeoCtrr80En8Ohs4OxOAOhXUiU9RZNnst9UPC5ZLCP3KJWLtfeXmiquThkT?=
 =?us-ascii?Q?zUgGMXKtS25qJowbwJfGFIBtsQaicOWg3sZCDBKV1+MnHhi5zmMMqCCO8/pT?=
 =?us-ascii?Q?MgwrmHZDxHN0lGWQJv2o/phe9sabUEgijDxZR3MU9VwlN2JPvcA+l79jSRYq?=
 =?us-ascii?Q?GAuWFyz0svqQOwYHXMeBJeiFnJoO/LAhgOhNHv5huWH+OgdPkweFIKIIwgKW?=
 =?us-ascii?Q?eiDXCdcfOaArm5XGqNAIS3WXh6EtO197SZanV0JDHTUfrdRcWecLZYXoD/qS?=
 =?us-ascii?Q?zhCgIA6lOn7I2jlsHfu3PgbtasmGJhwTO+fKoF603TdmlFqhw3LRAXRP/khO?=
 =?us-ascii?Q?K7IejvNExcPq6bdgo0L9wgoq3G2htMrpx6cPkfXziH95jK6z1IJVBSt48Z6i?=
 =?us-ascii?Q?0RECfL1eEWL1Q4DP5J0OEnUVwAFcy90/6OUAinMGrESglylRB5LW0Li5rx9B?=
 =?us-ascii?Q?xO6wMedwKUCsmGoPWq88OBZzvrXdG8IZfbnBlcnBeAJf6dkADJe9wW4CD72V?=
 =?us-ascii?Q?s5PgIeKh7hi6QSSumKh046cWKHLRUbYZqyrAFXGPBSGMLGY8BHWO4ZiJdPGH?=
 =?us-ascii?Q?KpU4VTbyejPO4UDr73sfLoM4H9D8oB0WOtv0wHh7V2TBMzsTPn6FT0X0bjeY?=
 =?us-ascii?Q?c9VZwhEbBYF66VJVbMd1opmaMHVHosczagYoD2eUlBLiR+b2wiHCOIMHyz7M?=
 =?us-ascii?Q?5YiXcuH4zN7oSEVDl8u8W3G+yW+x75bYFeX2I/Qca3P9K8bfvbc3XRLlNj0D?=
 =?us-ascii?Q?6uhHvWfEN2yeM8cCDqP4AxzZtqmEO+ZFaQgVlz6RDOC4z1mjMfBwj6fdpREf?=
 =?us-ascii?Q?0t3sMjfxFg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c01577ed-fc86-4d7e-bb26-08df08c2154f
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 07:16:18.5352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWOD0VY0NqHN7jagsz6AkK0jACXMfa+N21lqAkdwMJc4h6N/ioAUqcBbkMhfDAfom1jDIjEL4qRoctQlO8hyug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB3404
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 07:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244897

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
Changes in v6:
- Move IMAGE_ROOTFS_EXTRA_SPACE override next to the other
  IMAGE_ROOTFS_EXTRA_SPACE entries for consistency

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
 meta/recipes-core/images/core-image-ptest.bb  |  4 ++
 ...std-max-level-when-memory-is-insuffi.patch | 31 ++++++++++++++
 meta/recipes-extended/zstd/zstd/run-ptest     | 21 ++++++++++
 meta/recipes-extended/zstd/zstd_1.5.7.bb      | 40 ++++++++++++++++++-
 5 files changed, 96 insertions(+), 1 deletion(-)
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
index b20e8ca76d..22bb23c0e7 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -36,6 +36,9 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-python3-numpy=
 =3D "3048576"
 # golang go-ptest requires extra space
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-go =3D "1524288"
=20
+# zstd cli-tests create large temporary files (e.g. 1GB for window-resize)
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-zstd =3D "1524288"
+
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM =3D "-m 1024"
 QB_MEM:virtclass-mcextend-lttng-tools =3D "-m 4096"
@@ -45,6 +48,7 @@ QB_MEM:virtclass-mcextend-python3-numpy =3D "-m 4096"
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


