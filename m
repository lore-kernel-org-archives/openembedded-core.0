Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BEBCD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 09:08:36 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17136.1779181706334037137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 02:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ITJUkI+e;
 spf=pass (domain: est.tech, ip: 52.101.83.17, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YcWLkF02Sd6HR+M3vHZuiNzj2Zz18vCo6A0nsgkd618wLtcm0xNTKPYKIqpzcgxN2cTUUVR/LjK1T1k4T5PPsYAyxaP1f22Rd6Ku40OWnUV6YciqH8qB4p0ZqibCKWu9AXPts5C89R8Uqm6Y2C4/B+SjTXhuLXGjQDUdDzdfVQSFbz6kriRqijjgoicsnrPAVA0kOdwW2UcaRi0BWk1v4eFIbjAJE+PZzIMNm3nUNfqR6XmmaQk4wi0DADmxLynpCipeUE95LbezwWWvjvV1mkj5YQk0KobYgkMhoU4EHthZt9fY4T0iKvqGxzfAw6DgUrs7WWTU6CdtspEr2pIMEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IDRUP5Ewd1BMdXAj3ZjlTN3LJ+5Cq0LZkGE8BTMkV0=;
 b=kDI9PMXDrPGwgxrX/VSHVuCKJfr6hMRcQy/khfxontr5EGlSUyCmVYXRqPaCDtw5Eb6j2qYE35GOlmc0DDmWGswmcBIUW6QlRGxcjA8LsxnQdUcee7U/VxVGwqyNU1V4pD1QwCCzNd/Lq3BBy/YIR02ZsOBKULd9k/0lWUEryPMzNTmaf4HBE8n6Gl+BRFF2ofPZ3NIvGSH2Y9ki1IRhUQ7i6SRIkvrfB4JiDPIcMH5eUUdZDT259pewmexRD7hHsXjPprY9kW1DsdzyVOm+bCGAofszfm+MYOcDgKXVDWf+dvubLaWREnMbnZWfFM/NPqTKoJx5XB6K6jHoaGGKEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IDRUP5Ewd1BMdXAj3ZjlTN3LJ+5Cq0LZkGE8BTMkV0=;
 b=ITJUkI+eNaqal+0V91932kVGQxfmxQBLZLDx3F7VulJs/8bi221A2fs8sLtk72+CGlP9EuyUZAoYtpzXEfWMjBsfFq7XjBMaiK7xbH2XRhxN1JlhsfsL/kYhs60M+MxBHJA/hCt89hdfC3UqmU04339jGCCtmTyfDFIYf2yECUUq+mV8gP7rdoiD7bJmfnVm+ZLxH+iGzBP8r6Ftc/lEqV61M3tjTfP4p2Yiv1WQTmHm31mRE+lNBm/voyiPCCE/4CR2o6Sy8gAFkPYiGnJiecSJikpvAXCWmbaLeA4/4z5N2f4TUr4vRShMDpqVpXvF3+wmyPbQKSRnk3r7uInbHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by PAVP189MB2457.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:301::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 09:08:20 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 09:08:20 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [PATCH v2] zstd: add ptest support
Date: Tue, 19 May 2026 11:08:16 +0200
Message-ID: <20260519090816.17783-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508083451.11094-1-pratik.farkase@est.tech>
References: <20260508083451.11094-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB8PR06CA0050.eurprd06.prod.outlook.com
 (2603:10a6:10:120::24) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|PAVP189MB2457:EE_
X-MS-Office365-Filtering-Correlation-Id: 4094dd97-8678-4ea5-824a-08deb5862c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|11063799006|22082099003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	07lkPWJxtnEpbsmRNToRe4X0C/cgw7gTPpQXpHKHJwUFLDf+e5xDmxW9VFduAWw7N/h4jf23ipo5wJFAm690PEESyDR8kU02duth/aT3iX8bqUmK+Y7W18JMu3IWj6ihGUtMVaCL5rWRRsDFjrBkOg94nr13kxwYzC2GZEDyzl8x9pdGmaoQ6x2DLUVMdGMx2g5Ghx+sGE3yIJsHG16xCnDakQD/3scRL8W/UpguS1KaOPX944Xesbf/6E52XVzOzhWbP+hV4zakWMBn1z+fb7kswFQErGUUOwOqq6QOvwL2+54U3/z3G37GVPNpxfPykJ4iqlVr8oFjM/MO0iumVtZV7HTvxPJIP/k5M2nSjVWzZsWL6LnQRoXyhI11uIa0ILYp3UeeKnyEglo4nskeq9YKbbzrLyRedjAoeV3s+aLrtD77QnhVq8D1voRuQADodQqgZGV7f0anbKg+vs+tgnC+KbdjeheOMCNmKkjpR7RySCYOVLzrLB4uM0aZSJV16kbvPge7nzMy9C3+ecCGwrsWPIyM2gZP7r4A+ZiqQj+NrUYq2DA7FZluwASED6vO2mFqwsUhQj4u4J0Y8/6+MX/+RfK5AaolyLbeVlnHFhYfwifOoQrs7Dhgb7jqS/Vqgo/2/YGp1NgGK0zjAlEZaKZLly1UzbJEoTcC0yABuGLiMAaPtu1907dZe6LI12VX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(22082099003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2HPk0uqaS32BrZjdPisDjnzUhkyii9iZoKv43s9a/6Db5FJ0KxYT9xEP8MYj?=
 =?us-ascii?Q?Uge3HJqG4C0M511eNc6hKpbk14vUiSTMLijaC+6mV+3CyORgfRrECbYRe0v2?=
 =?us-ascii?Q?IprRfvgNgIK+4n6wDqR9UBz+rjeQkZIyHK9zGDi5IjMWGcRJpIoh1GUQAPlb?=
 =?us-ascii?Q?bQNtNH+yJDNTlq7aDma6yMGyHW7YfCyBx+UB0i1o5E4neLKteZQ89hl1Hqe/?=
 =?us-ascii?Q?7OxyC79vqHpF2074rqIkEyQ90B+ybd29RXM4oGkVcnHtZK1kOUme72AqHDIB?=
 =?us-ascii?Q?HTFHVQObTLiCuJV6S1tIadJs/emioISXzFO5psuWvt4/9daaybnOMi7dkFtO?=
 =?us-ascii?Q?2lu6VHY4K+sgD9bwzMPHi2/ztc9T15Nj/3ndRbxk++EEYHCvoGKCGPLIsZjM?=
 =?us-ascii?Q?Qo6bEfgmT2bTBsONW6JoMJkw5O+/8eodVsW4Hp77bW2NA967FpdK0CBKRrUt?=
 =?us-ascii?Q?K38eKkKO5z41Guq5xJ4pO2zWspDqAws9XZ/VtJG0TYVzw2kFTAXwLaUotUZt?=
 =?us-ascii?Q?q7wO+uLmbfRp3PboiruIDORW5HMHe366UHleFhhBnWDAJDhTuh0TKPzM/nMU?=
 =?us-ascii?Q?9qJlscQbF/aBXRSMIUTc58RwTVTQfeWdUXRbrEuvjaSKZiKMSIvzV0RSbVi6?=
 =?us-ascii?Q?8VRESySyMJm00JrIoULLsdjKivciW3GXHB/MwlRLnUqfZmTzed9uHOtPMPCz?=
 =?us-ascii?Q?cMdQtThDlHZueQx3BukeW0kRbFcI42abwpAJepyf2lGxgrWXNoqEETWjqH5y?=
 =?us-ascii?Q?GjFHDD5rj+sutiCItJpTe7zX9iS83qtYvnS/yGX7/ykjo/Zw6Y7GFr8YMcTk?=
 =?us-ascii?Q?rhgaNbi6aBvYq+ocJCwy7R10lqRc7W09uOyF97+F3wzDP2dnJ8/ugpnlZZth?=
 =?us-ascii?Q?FMn5/zWqu8kLZoQOPiw/5MvU8WOtBIrM+KhdQfW+xc5N8bhfQD2/0pUxX0td?=
 =?us-ascii?Q?I43gs28OyV6SH4suRej+OCHbg0Vw8mPdDdAessGlnBEmLusTaXPKBKvkyiwO?=
 =?us-ascii?Q?srC9nXrtARjnfdp/vR8DyRl4SSF0bXPiO3Sa6eCWs54G769m9RHaSn21mtKo?=
 =?us-ascii?Q?vh4k9vNkwTy66+Erp0jm/2kqu2kmzcBcxc+19sTEjEsAbrX2ACjBdEs9954D?=
 =?us-ascii?Q?pVBKNdds9vyPLb1RdtemF2Z56+jqsKG7PcA0yb98a1utCckBFfOyxGdWQ55G?=
 =?us-ascii?Q?nwyzeC9fwyMKb1KGpxpPS8J6H3Bffb7Ze6LAuscUN0nvqrRGQc3DWCNl9FVv?=
 =?us-ascii?Q?aF86XHccmG4m1B224keWN8tkaoHvC7LcKTHri9WY238ML+YX8Bey5K25bUAz?=
 =?us-ascii?Q?EAX5kuCNCGEjWBBlipRgFfsk2dPxU60ooV2TqDw2cYJllt4MZ+b84wBiIGkE?=
 =?us-ascii?Q?wFQT3lciXqeJY8nEv/vDxruaOASKwGIFY7M4JeTdeJUnzfHKbgtGXeuDhZFt?=
 =?us-ascii?Q?qFQGvMNzGuN8+98rQRieynOdfykgvspYn8PHW74zsuLn2+ryg5+YCeifznmy?=
 =?us-ascii?Q?uSqfGeCvIA11xyE/v+qqdpk91r+DLMWaIv1W5DfutvFxz6CWoXvf2yFfmik2?=
 =?us-ascii?Q?Quusrwjgq3ZcKJMsgXdkxe6rLNwsXLz8RAjzaFIkWScV8gx1E9gG/HVFsDGB?=
 =?us-ascii?Q?QefQImP5HFJOOoKk3q+t6TFZpR5knLQ1jrTg2o33/GvzSnI+TW3jvyHYkQ9V?=
 =?us-ascii?Q?auhVKF2YLPpgBX8LPWaBcHsxvCtqtoriD44jFEikMskTv5tkReUs96aPhCdS?=
 =?us-ascii?Q?+Di7CNAaIQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4094dd97-8678-4ea5-824a-08deb5862c07
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 09:08:20.3843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTfCGl4WNbbs2hDe6HUqPk6k7G1ps1BVbYkizHIMxKwiIm8nN+d9S4O9BB+NZNmdPusILrgKIWWK2IG9ZQB25w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP189MB2457
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 09:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237295

Add comprehensive ptest support for zstd running the full upstream test
suite covering compression correctness, streaming, dictionaries, CLI
behavior, and fuzz testing.

Tests included:
  - fullbench: validates all internal compression/decompression functions
  - poolTests: thread pool ordering and synchronization
  - invalidDictionaries: dictionary error handling
  - legacy: legacy format (v0.4+) compatibility
  - fuzzer: randomized compression/decompression (200s, ~700+ rounds)
  - zstreamtest: streaming API fuzzer (90s, ~250+ rounds)
  - decodecorpus: random frame generation and decode (30s, ~450+ rounds)
  - playTests.sh: comprehensive CLI validation including compression,
    decompression, multithreading, dictionaries, sparse files, frame
    concatenation, long distance matching, benchmarks, and round-trips
  - cli-tests: 36 Python-based CLI integration tests covering
    compression, decompression, progress, file-stat, dictionaries,
    symlinks, and file handling

Tests excluded from cli-tests (environment limitations):
  - compression/levels.sh: requires >8GB for --ultra/--max levels
  - compression/window-resize.sh: requires >4GB for 1GB window
  - file-stat/compress-file-to-dir-without-write-perm.sh: ptest runs
    as root which bypasses permission checks
  - cltools/: requires GNU grep (--label), unavailable with BusyBox

Source .c/.h files from tests/ and programs/ are installed as training
corpus for the dictionary builder tests.

zstreamtest requires 4096MB RAM for (hashLog=3D29 allocates ~2.8GB).
Set QB_MEM:virtclass-mcextend-zstd =3D "-m 4096" in core-image-ptest.

Tested on qemux86-64 (4GB) with ptest-runner: 9 PASS, 0 FAIL. Runtime is ~1=
3 min.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-core/images/core-image-ptest.bb  |  1 +
 meta/recipes-extended/zstd/zstd/run-ptest     | 27 +++++++++++
 meta/recipes-extended/zstd/zstd_1.5.7.bb      | 48 ++++++++++++++++++-
 4 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-extended/zstd/zstd/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 50b6a8a41e..05caa44c43 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -146,6 +146,7 @@ PTESTS_SLOW =3D "\
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
diff --git a/meta/recipes-extended/zstd/zstd/run-ptest b/meta/recipes-exten=
ded/zstd/zstd/run-ptest
new file mode 100755
index 0000000000..fe503ce8c9
--- /dev/null
+++ b/meta/recipes-extended/zstd/zstd/run-ptest
@@ -0,0 +1,27 @@
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
+run_test fullbench            ./fullbench -i1
+run_test poolTests            ./poolTests
+run_test invalidDictionaries  ./invalidDictionaries
+run_test legacy               ./legacy
+run_test fuzzer               ./fuzzer -v -T200s
+run_test zstreamtest          ./zstreamtest -v -T90s
+run_test decodecorpus         ./decodecorpus -t -T30
+
+ZSTD_BIN=3D$(command -v zstd) DATAGEN_BIN=3D./datagen ZSTDRTTEST=3D ./play=
Tests.sh
+run_test playTests test $? -eq 0
+
+if [ -d cli-tests ] && command -v python3 >/dev/null 2>&1; then
+    ./cli-tests/run.py --exec-prefix=3D"" --zstd=3D"$(command -v zstd)" --=
datagen=3D./datagen
+    run_test cli-tests test $? -eq 0
+else
+    echo "SKIP: cli-tests"
+fi
diff --git a/meta/recipes-extended/zstd/zstd_1.5.7.bb b/meta/recipes-extend=
ed/zstd/zstd_1.5.7.bb
index 0e872b95aa..66e326f386 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.7.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.7.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0822a32f7acdbe=
013606746641746ee8 \
                     file://COPYING;md5=3D39bba7d2cf0ba1036f2a6e2be52fe3f0 =
\
                     "
=20
-SRC_URI =3D "git://github.com/facebook/zstd.git;branch=3Drelease;protocol=
=3Dhttps"
+SRC_URI =3D "git://github.com/facebook/zstd.git;branch=3Drelease;protocol=
=3Dhttps \
+           file://run-ptest \
+           "
=20
 SRCREV =3D "f8745da6ff1ad1e7bab384bd1f9d742439278e99"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
@@ -42,3 +44,47 @@ PACKAGE_BEFORE_PN =3D "libzstd"
 FILES:libzstd =3D "${libdir}/libzstd${SOLIBS}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+inherit ptest
+
+PTEST_BINARIES =3D "datagen fullbench poolTests fuzzer zstreamtest \
+                  invalidDictionaries legacy decodecorpus"
+
+do_compile_ptest() {
+    oe_runmake -C ${S}/tests ${PTEST_BINARIES} \
+        ZSTD_LEGACY_SUPPORT=3D${ZSTD_LEGACY_SUPPORT}
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests ${D}${PTEST_PATH}/programs
+
+    # Test binaries and shell script
+    for t in ${PTEST_BINARIES} playTests.sh; do
+        install -m 0755 ${S}/tests/$t ${D}${PTEST_PATH}/tests/
+    done
+
+    # Test data and cli-tests
+    for d in golden-decompression golden-decompression-errors \
+             golden-compression golden-dictionaries dict-files cli-tests; =
do
+        cp -r ${S}/tests/$d ${D}${PTEST_PATH}/tests/
+    done
+
+    # Source files used as dictionary training corpus
+    install -m 0644 ${S}/tests/*.c ${D}${PTEST_PATH}/tests/
+    install -m 0644 ${S}/programs/*.c ${S}/programs/*.h ${D}${PTEST_PATH}/=
programs/
+    install -m 0755 ${S}/programs/zstdgrep ${S}/programs/zstdless ${D}${PT=
EST_PATH}/programs/
+
+    # Remove tests incompatible with ptest environment:
+    # levels.sh: --ultra/--max levels require >8GB RAM for allocation
+    rm -f ${D}${PTEST_PATH}/tests/cli-tests/compression/levels.sh
+    # window-resize.sh: 1GB window size requires >4GB RAM
+    rm -f ${D}${PTEST_PATH}/tests/cli-tests/compression/window-resize.sh
+    # compress-file-to-dir-without-write-perm.sh: ptest runs as root,
+    # which bypasses filesystem permission checks
+    rm -f ${D}${PTEST_PATH}/tests/cli-tests/file-stat/compress-file-to-dir=
-without-write-perm.sh
+    # cltools/: zstdgrep requires GNU grep --label option not available
+    # in BusyBox grep
+    rm -rf ${D}${PTEST_PATH}/tests/cli-tests/cltools
+}
+
+RDEPENDS:${PN}-ptest +=3D "bash coreutils python3-core python3-io"
--=20
2.34.1


