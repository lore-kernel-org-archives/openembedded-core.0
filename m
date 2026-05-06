Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7408CD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 18:51:56 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26641.1778093509742269739
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 11:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=qNP5ZvS1;
 spf=pass (domain: est.tech, ip: 40.107.159.18, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYwSEioogcER35bxKszWHGivJwaaWKTfmHLMZKsZ1dCUts2xnAIclXeiyYpvmFcPsyHlpHk1ICjUbpSQI55RZqeZ+uSYkiNYnG1rz1KvjzbJLb089xSYm2vRHzKC5cSlSnyKb9BRGMMoSffCSo6Ur+Bjf7svNgnngsftQZcCHnu9SG6AEngWEtZ/PBThcxxw6MxxwPt/OrhDVEu6zOvQKd4JFnxfzRGfam1DkezIaYFh75f51LXHjltMeTo8U7JhflXLPzFcHCMMUI15m46vHPT2pCjCPVMt5nt8iwzHt3B9WSSd7fxHI3R+xRm9VKRX8eDGkEcAI/yoVCwH0LG7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKyO2pMiqRJeIk9seCZZfL+CDqyKnurKJF5WTbFN8n8=;
 b=R+GFw9KS98elbISPkG1UJQYrPDhNWlEhziUiDx4OGEYaxXL+ZAcYCO6eC2F6nAwUU9n53J/NMdsz/8EujuIUq4DaVZe0IbSmttAEO0xTPIs/bVJMCrCfHajxtSKzsvfb6OXG2TEb4r12Ak9AsSPfFozxREgkNCtYvqA3M7vJd6W04hT8t9rmNIHXIRLcl6Ow1JNjSFpLkZajargEAvdWWC2THv85OmZG8o1dNn/ElorIKR1M4fHaqwFFKnnJOz2bLzmR1FyTNi0zUZmRb5puAxBPUNhylzpcwrRu1YyoeP9CbkKzeXabhtWBZvgp3xy74rnyQ5+k7z8Tm2dW8gNw9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKyO2pMiqRJeIk9seCZZfL+CDqyKnurKJF5WTbFN8n8=;
 b=qNP5ZvS1F3so7ZekKfKJ2JnmxZDC50QehMmpKDEG6cgwH3136DkvCsxAsBDAuelyirhU9g7hdN+UjvDWovN73QKDtOlDqT4u2wBubZkSDTiRODI6r8TnVyp4FKcInxX3CiNJ1iSxNst+EPZ+OQe/a+/dJrMYfkG5+SVeRmFl4xMrg6QciiLL1B9sl2xSRuwOt55fN21KETawOCQlcxVK0Mo44cj5ozzc9MLzeyrXWjjIyHS1u+MZJk30RSbSlz/Qtrx2FhDgdID/Y3z9MIwMKGjAt10bbCCgi0CbKv1Y10JRGNd++IxmOS2OFnt2ga1K+NHSdhCIFg4TwobBvcszrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a9e)
 by DB8P189MB0809.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:122::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 18:51:45 +0000
Received: from DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 ([fe80::48a0:eb8a:db1e:38bb]) by DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 ([fe80::48a0:eb8a:db1e:38bb%7]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 18:51:45 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] gmp: add ptest support
Date: Wed,  6 May 2026 20:51:28 +0200
Message-ID: <20260506185128.10489-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506074618.15882-1-pratik.farkase@est.tech>
References: <20260506074618.15882-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0112.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::28) To DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::a9e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PPFB77F8FB19:EE_|DB8P189MB0809:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab73bce-def1-44f4-6821-08deaba08512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|3023799003|18002099003|22082099003|12006099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	IulSueO5GJ5f5T0Vpk8kcVFJiU+/fzix0UPifTeY7ZbMnRiZnsAi9tkoxR3jzai05X2McWtFdRNJZwvIgeBR6xH5X0vxk2qBbkOTu0lh5IGQg+Dl26cx05qa+EilP23LcXvL57kCq6q6VWhTgzxL2h3osiR33gMFxMk1O8Pi2Xej+GaN0Gwe6zHwYEqVyO1zDT7FLV32TcoavPZeoZb7QR0Q3YftqsPvUKNRAr+Gwh6jb+QI2Tz8z3gJR3ENMrF8AZps3Q+dvDf4Vp3IWGl6tsy8kmcoWHWMz1qAxndh6U5wq5e79eTcDpJiKZWKkCclvJfa1rP+4R84CQg47hauxY1m36JlBTEh4pPR2oeYeweP5ishx9LJJmN00HZPC81h5EjcILexIG/xE10y+9PIR35utUXbMU7R2tYdDTrsiVeDADHQG54dhojJ9hiJD0AAwTX5UVmn3PHANq46bes9RkJ6Rmz7LsLBIv2knBzSFQB9uQgckywgV92cYxTShWfwLX6nPUhPKw+L3xWL35ES3vROTomOVxqjQ19YU6sk1esaULA0vwP1ClG/HY5Wygik1aiewZLh9++J/+jq8aR/3QSV4L8hgkvUdRMr2+F5mUzYrVRi+JqfK9eKFwXt9E+r9jb8ISfgLMp4AgJCeiY1vA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3023799003)(18002099003)(22082099003)(12006099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OUvNFquoFrViqOm1ZV/KKd/wUZ9kXyzQ9cKm9tlsQQHAlg+0iFzo876kgb3Z?=
 =?us-ascii?Q?zbqIC2fVv+oxC8siaIBmNCtrIIn61bB9LopYfQQJUbyrO34U1AozSPfBHqj3?=
 =?us-ascii?Q?9/lgiz6O67Ff0nMV3VL/MiEt6AXuckbmPcPUYUMd22HRLzEYTvMAHe1Vd+7T?=
 =?us-ascii?Q?txxwH34gHSmCasV9QkzyCZaudzXsyZPdX1zqJFJAVmgG1zG7BklEB75a6Beh?=
 =?us-ascii?Q?H/8nrgb8xjcD/n6ys6jpsN9bik+SA7jIeskNdhIt4IInfYJtCe3gfjsD8yS8?=
 =?us-ascii?Q?TW/IPgv189vU+kFU/DvJ0p2yP/uEN+PuPBM2vHyDPjf2RY7VjR5cmfSJiyiH?=
 =?us-ascii?Q?tf2JsHIbLC03CgS3MabW+JkcYDB2NHkIEX0VMnSosNhWcwUJXAoatFvCShZT?=
 =?us-ascii?Q?75sTaL01KAUaS9a2tEC71+xwT33YJa+OXfCio8rxjObTLzeOF2rXKmdj2wbS?=
 =?us-ascii?Q?B1IBsr6oTQ664WGNh1eomEnS+YuLYPmzuX5/mXRMThwaJzCDKRqnLaXpmEwA?=
 =?us-ascii?Q?RrLHLNrS0rOxO1AfXSdSMRoJ0sPJyfMYLwXhvAJsblMeVikf6cVAK5i4dfMK?=
 =?us-ascii?Q?C/RMOnlJ1hDrAG3FTPK8GEsRj9u9dOfCmK/vSJVE8/AcKmKPPuOz6ta43XD5?=
 =?us-ascii?Q?/L/vkc7yMfPL/FNENSMFZddMBuKIpPhrrqzO0CdIfk6+Ooj8E7+A5hzVHPCb?=
 =?us-ascii?Q?1jSVJsugRxqh6Xp5aw81RyekAKan5YTFcIkW1RQS9nqYyM5El6Hhh5qbMg8n?=
 =?us-ascii?Q?YzL7FT9nXnYfwn238hNfurh0VUWYmm479dpeT7yuGxutoxQNFNGsPdST9MnB?=
 =?us-ascii?Q?m399w+k3v3JTbaKAyHKM8DqB8oNWIN1tMIzngGKD/v5hnH2uFV2Gsre2DxqL?=
 =?us-ascii?Q?nFTGPRUY+JSIsB/TGxcfhzxxTvQsQvwmWZYpiskKOBzojQqDYGZr8QNX2DUp?=
 =?us-ascii?Q?qXqWzKOP5bLR8Qd2RtEIIHnzEA9W2Yj0TjB9dzvX8d7EHnjN0JyT+lDsxS6D?=
 =?us-ascii?Q?U8XCfUfI2Id+ucd4zwwZP0ek03WphWbI+6xAZUkAjjQsI3TAx7fiEdj3xISW?=
 =?us-ascii?Q?oI58+9UN8RhpBfBSsjTcEpI/S6GlaAZPgsqmSHNAt7rTH3be0D3X+y3hUaBU?=
 =?us-ascii?Q?oo8ZZf10sOsfpH2pxPJrk3ToadYpiW3RkapSiFiKR/946fc/KNGc2d3oexqM?=
 =?us-ascii?Q?U9D8mZRBXZjNW9a4ASaDq1TzEehX/C3g9K7vaoUt2mcT0rz23e9mJYYecncG?=
 =?us-ascii?Q?Kke8WxKkSjk9r3IIFQ4IGaCDG4bFBjMvu4mcXZEPpDNJL7UADfUEm1PtqOrl?=
 =?us-ascii?Q?Lu6qSK2tr05c7pTfeEVhPy1ecZCbREIiHO1iDFF8DGd++ty1iOQzcCA4yfdy?=
 =?us-ascii?Q?3+kENfXS/dKDPFqHfy3v8y4OdfJCq2F62WXZq1U6/WMA6vt6ypnxi/JE1pqF?=
 =?us-ascii?Q?tEmGZvbya2GKGGxazdL2E8unN82rjfacY6W1IndG1NkOsMsgW4IuiXW/Wtjv?=
 =?us-ascii?Q?sPYVnHROdHZWIroGCQTG7YdQSaYESQZ2cuBP1S7VOSuPm6tbOusfSbKqgSyG?=
 =?us-ascii?Q?n07sShYg17cabgwkIJ1xgj4St/7hw5WrU2RgOEtZk2OKGx3+lXXSSlhf2ieL?=
 =?us-ascii?Q?lbblTKnzO7UrJkEKKs2FhqrBqgj/2cDOOYDqIzmiun0CY1LVk/TmG+DwiAN8?=
 =?us-ascii?Q?G9lHrnxk3SEekjVyZmrnL1SVStT7Cuyim2deCU7rft6SftoHjL94xhlBHob+?=
 =?us-ascii?Q?Jzv7SO63yQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab73bce-def1-44f4-6821-08deaba08512
X-MS-Exchange-CrossTenant-AuthSource: DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 18:51:45.2498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqJvhiwVLlPfyLu1E+XkgU50zstPxa43IJ37KGo3+IA+Rr4orZZKs6IKh/RiWXf7lY2Mu0NYALSRHRQlzXc9ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0809
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 18:51:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236549

Add ptest support for gmp, running the full upstream unit test suite
(200 tests) covering mpz, mpn, mpf, mpq, rand, misc, and C++ bindings.

Tests are compiled with 'make check TESTS=3D' to build without executing,
then installed via libtool to the ptest directory preserving the upstream
subdirectory structure.

Tested on qemux86-64 with ptest-runner: 200 PASS, 0 FAIL (268s).

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
Changes in v2 :
- Handle exit code 77 as SKIP per autotools convention. Fixes
  mpn/t-addaddmul failure on riscv64 and arm64 where
  mpn_addaddmul_1msb0 has no native implementation.
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-support/gmp/gmp.inc              |  2 +-
 meta/recipes-support/gmp/gmp/run-ptest        | 19 +++++++++++++++++++
 meta/recipes-support/gmp/gmp_6.3.0.bb         | 17 +++++++++++++++++
 4 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-support/gmp/gmp/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 50b6a8a41e..1e6989ae38 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -24,6 +24,7 @@ PTESTS_FAST =3D "\
     gdbm \
     gdk-pixbuf \
     glib-networking \
+    gmp \
     gzip \
     icu \
     json-c \
diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gm=
p.inc
index 1872226616..106521954d 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -3,7 +3,7 @@ DESCRIPTION =3D "GMP is a free library for arbitrary precis=
ion arithmetic, operati
 HOMEPAGE =3D "http://gmplib.org/"
 SECTION =3D "devel"
=20
-inherit autotools texinfo multilib_header
+inherit autotools texinfo multilib_header ptest
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[readline] =3D "--with-readline=3Dyes,--with-readline=3Dno,re=
adline"
diff --git a/meta/recipes-support/gmp/gmp/run-ptest b/meta/recipes-support/=
gmp/gmp/run-ptest
new file mode 100755
index 0000000000..c0fde816c1
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp/run-ptest
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+cd "$(dirname "$0")/tests" || exit 1
+
+for d in . mpz mpn mpf mpq rand misc cxx; do
+    [ -d "$d" ] || continue
+    for test in $(find "$d" -maxdepth 1 -type f -executable | sort); do
+        testname=3D$(echo "$test" | sed 's|^\./||')
+        ./"$test"
+        ret=3D$?
+        if [ $ret -eq 0 ]; then
+            echo "PASS: $testname"
+        elif [ $ret -eq 77 ]; then
+            echo "SKIP: $testname"
+        else
+            echo "FAIL: $testname"
+        fi
+    done
+done
diff --git a/meta/recipes-support/gmp/gmp_6.3.0.bb b/meta/recipes-support/g=
mp/gmp_6.3.0.bb
index 8f18bdca1b..ffdd3e4397 100644
--- a/meta/recipes-support/gmp/gmp_6.3.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.3.0.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "https://gmplib.org/download/${BPN}/${BP}${RE=
VISION}.tar.bz2 \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.pat=
ch \
            file://0001-Complete-function-prototype-in-acinclude.m4-for-C23=
-.patch \
            file://0001-acinclude.m4-Add-parameter-names-in-prototype-for-g=
.patch \
+           file://run-ptest \
            "
 SRC_URI[sha256sum] =3D "ac28211a7cfb609bae2e2c8d6058d66c8fe96434f740cf6fe2=
e47b000d1c20cb"
=20
@@ -51,3 +52,19 @@ SSTATE_SCAN_FILES +=3D "gmp.h"
 MIPS_INSTRUCTION_SET =3D "mips"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/tests check TESTS=3D
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    for d in . mpz mpn mpf mpq rand misc cxx; do
+        install -d ${D}${PTEST_PATH}/tests/$d
+        find ${B}/tests/$d -maxdepth 1 -type f -executable \
+            ! -name "*.la" | while read -r t; do
+            ${B}/libtool --mode=3Dinstall install -m 0755 "$t" ${D}${PTEST=
_PATH}/tests/$d/
+        done
+    done
+}
--=20
2.43.0


