Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7DECA5FC1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 07:42:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8158.1790754106364821072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 00:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U2gCoPGA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=47339e56a2=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U5t2P52393952;
	Wed, 30 Sep 2026 07:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MqWRQM1iaCJeikmkTYuGMgRilUD1Oif+OpCXSzJKa6I=; b=
	U2gCoPGAwPhSRQ9V/XEFcree1iV1YP7XHumdbsqNVLElDSvYBpJaXulIFsKBxyeK
	zuOlWrESE1T0q2Yxp+RBjCESD9AziQdhnw+sv5zVc2o7vqC6kvC9Wl0jSnglm490
	RalpkHhl4E5oe6UJW2WBPURP1s5EsEm3ha+W8SsgQ5+Y6VA+G4YxQywBt+Bmv7BG
	jxN/7V6D/cpcipMSaR/PbUdd/SvoTU8Ur1MwN8StP8ZGxpmn8p9PH8WT9+RuJY9l
	Oi2mmHn6UJpJYd62zED2/WHow+hI5gnEHjV2qzaOj5Yyebq7a7txyZe9LyJDqWo/
	MroQf4UquIvpNRrHCyGGQw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx38we31b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 30 Sep 2026 07:34:38 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 30 Sep 2026 00:34:37 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 30 Sep 2026 00:34:37 -0700
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Randy MacLeod <Randy.MacLeod@windriver.com>,
        Shiva Komati
	<Shiva.Komati@windriver.com>,
        Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>,
        Himani Ramesh Barde
	<HimaniRamesh.Barde@windriver.com>
Subject: [PATCH v4] tiff: add ptest support
Date: Wed, 30 Sep 2026 07:34:32 +0000
Message-ID: <20260930073432.3027882-1-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925080552.4144665-1-HimaniRamesh.Barde@windriver.com>
References: <20260925080552.4144665-1-HimaniRamesh.Barde@windriver.com>
MIME-Version: 1.0
X-Proofpoint-GUID: niyytVJf83iUt3IxdF7ONl1nXAkhs0nz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyOSBTYWx0ZWRfX94RprQaFpIH5
 9B1d+2IrSUMaIpaFCNwc8ObkHtek6uCPm02YBO0S6bKugG+BTQqFhXNQ9RQu+IwbFWisJ59vXBr
 wa2vfrCanZoGI3nzHk6vyCJrvq1ve5tGFePXrwMegp2IfWhwlxkSIld6gI6cXMzki8pcunPXx45
 5+J7AKZt6vUjqB2HnZX6k0cnGwma5wp1ciZPBI6lA+5jN+NlYKPOFjH0mjy264wWCXz8/NH0cQD
 mCm2y75xtmW1zznhpzElS7Avv1mG3oHIRncSfEfbhPvyHBJw9pzrLUIkQ+ciq3i5vMuHAE0Bl4K
 5Dk/qe7h6q8aTlVwj1VrmTFW4G0YUdwKMjCNmZ6uySpP63pHciwS0NlBk1QAcnHE2JO+4o70m9Q
 WP7dpyqO3oDFAyavZ1W/VkOAHhpUubJsnvQCjIAHXf2xCp9UPzoYgjkE3MO/C+h46ilnzoM6bQ1
 8wz7LULGX0H7SyfqgVA==
X-Proofpoint-ORIG-GUID: niyytVJf83iUt3IxdF7ONl1nXAkhs0nz
X-Authority-Analysis: v=2.4 cv=ZYSIpcVA c=1 sm=1 tr=0 ts=6abcbb8e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=Qs8GJauRAAAA:8 a=t7CeM3EgAAAA:8
 a=U56svMRynmzF8my4cj4A:9 a=-MsOl3yrPmtpHepMbiy1:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyOSBTYWx0ZWRfX2JHLJvMjGboe
 6RIsovXgHtWLo/k5zRFy+O8n0a+TrCv6ACLmgYJ4K1xTp5IpFETf0sJAmc43JgvQA8OK4sCzvyx
 0zjqY/ocOcQAOt6dXnSTtnDsdzio868ZLENZsZhVOisn8lNA+T6/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300029
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 07:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246922

Run the libtiff test suite as a ptest: the C unit tests (the automake
check_PROGRAMS) and the shell tests that drive the tiff command-line tools.

do_compile_ptest builds the test programs. do_install_ptest installs the
binaries, the shell scripts, the common.sh helper, and the images/ and
refs/ data, and points common.sh at the installed tools in ${bindir}
instead of the build tree. The recipe lists the C programs once, in
TIFF_PTEST_PROGS, and fills that list into run-ptest at install time.

One test, test_ifd_loop_detection, opened its images through a build-time
path instead of relative to the current directory, so it failed once
installed. A small upstream patch makes it read the images from ".", like
the other tests, so it now passes on every architecture.

run-ptest prints automake-style PASS/FAIL/SKIP lines. Two tests skip in the
default configuration:

  - the JBIG test, because jbig is not in the default PACKAGECONFIG
  - the thumbnail test, because the thumbnail tool is not built

Registered under PTESTS_SLOW in ptest-packagelists.inc; the suite runs in
about 30s on qemux86-64.

Validated on qemux86-64:

  - 17 C unit tests pass
  - 85 shell tests pass
  - 2 skip (jbig, thumbnail)
  - 0 fail

Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
---

v4:
- Regenerate the embedded test_ifd_loop_detection patch against tiff
  4.7.2 so it applies without fuzz (reported by the autobuilder).

v3:
- Fix test_ifd_loop_detection on non-x86 architectures. It opened its
  images through the build-time SOURCE_DIR path, which does not exist in
  the installed ptest; a small upstream patch makes it read them relative
  to ".", like the other tests. This replaces the run-ptest symlink that
  v2 used to fake that path.
- Reword the commit message per review.

v2:
- Drop the INSANE_SKIP buildpaths; the test binaries package cleanly.
- Drop make and bash from RDEPENDS (run-ptest calls neither).
- Define the C test program list once (TIFF_PTEST_PROGS) instead of
  duplicating it in run-ptest.
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-multimedia/libtiff/tiff/run-ptest | 23 ++++++++++
 ...t_ifd_loop_detection-relative-images.patch | 34 +++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.7.2.bb | 42 ++++++++++++++++++-
 4 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-multimedia/libtiff/tiff/run-ptest
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/test_ifd_loop_detection-relative-images.patch

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 2b5d665..837e1c1 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -151,6 +151,7 @@ PTESTS_SLOW = "\
     tar \
     tcl \
     tcl8 \
+    tiff \
     util-linux \
     zstd \
 "
diff --git a/meta/recipes-multimedia/libtiff/tiff/run-ptest b/meta/recipes-multimedia/libtiff/tiff/run-ptest
new file mode 100755
index 0000000..ebf11c9
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/run-ptest
@@ -0,0 +1,23 @@
+#!/bin/sh
+# Run the libtiff test suite and emit ptest-style PASS/FAIL/SKIP lines.
+cd "$(dirname "$0")/test" || exit 1
+
+
+# @PROGS@ is filled in from TIFF_PTEST_PROGS at install time.
+CPROGS="@PROGS@"
+
+for t in $CPROGS; do
+    if [ -x "./$t" ]; then
+        if ./"$t" >/dev/null 2>&1; then echo "PASS: $t"; else echo "FAIL: $t"; fi
+    fi
+done
+
+for t in *.sh; do
+    [ "$t" = "common.sh" ] && continue
+    case "$t" in
+        *jbig*) echo "SKIP: $t (JBIG support not enabled)"; continue ;;
+        tiffcp-thumbnail.sh)
+            command -v thumbnail >/dev/null 2>&1 || { echo "SKIP: $t (thumbnail tool not built)"; continue; } ;;
+    esac
+    if sh "./$t" >/dev/null 2>&1; then echo "PASS: $t"; else echo "FAIL: $t"; fi
+done
diff --git a/meta/recipes-multimedia/libtiff/tiff/test_ifd_loop_detection-relative-images.patch b/meta/recipes-multimedia/libtiff/tiff/test_ifd_loop_detection-relative-images.patch
new file mode 100644
index 0000000..c46e74d
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/test_ifd_loop_detection-relative-images.patch
@@ -0,0 +1,34 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
+Date: Tue, 22 Sep 2026 00:00:00 +0000
+Subject: [PATCH] test_ifd_loop_detection: find images relative to CWD
+
+test_ifd_loop_detection is the only C test in the suite that references
+its input images through the compile-time SOURCE_DIR macro
+(-DSOURCE_DIR="@srcdir@") instead of opening them relative to the current
+working directory the way every other test does. When the test is run
+from an installed location (for example an OpenEmbedded ptest package)
+the build-time @srcdir@ path no longer exists, so the images are not
+found and the test fails.
+
+Override SOURCE_DIR to "." so the images are resolved relative to the
+directory the test is executed from, matching the behaviour of the other
+tests. In-tree "make check" still works because it runs the test from the
+build test/ directory whose srcdir is already ".".
+
+Upstream-Status: Submitted [libtiff]
+
+Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
+---
+--- a/test/test_ifd_loop_detection.c
++++ b/test/test_ifd_loop_detection.c
+@@ -46,6 +46,9 @@
+ 
+ #include "tiffio.h"
+ 
++#undef SOURCE_DIR
++#define SOURCE_DIR "."
++
+ // #define DEBUG_TESTING
+ #ifdef DEBUG_TESTING
+ #define GOTOFAILURE                                                            \
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
index 8bc3a48..767b295 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ab490c3088a0acff254eb2f8c577547"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
+           file://test_ifd_loop_detection-relative-images.patch \
+           file://run-ptest \
 	   "
 
 SRC_URI[sha256sum] = "672bd7d10aee4606171afb864f3570b83340f6a33e2c186dc0512f7145ffdf6a"
@@ -23,7 +25,7 @@ CVE_STATUS[CVE-2023-6277] = "fixed-version: Fixed since 4.7.0, NVD tracks this a
 CVE_STATUS[CVE-2025-8851] = "fixed-version: Fixed since 4.7.0, NVD tracks this as fixed in 2024-08-11 vulnerability"
 CVE_STATUS[CVE-2026-4775] = "fixed-version: Fixed since 4.7.2, NVD tracks this as version-less vulnerability"
 
-inherit autotools multilib_header
+inherit autotools multilib_header ptest
 
 CACHED_CONFIGUREVARS = "ax_cv_check_gl_libgl=no"
 
@@ -64,3 +66,41 @@ do_install:append() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# C unit-test programs (check_PROGRAMS) built and run by ptest. Defined once
+# here and substituted into run-ptest at install time to avoid duplication.
+TIFF_PTEST_PROGS = "ascii_tag long_tag short_tag strip_rw rewrite custom_dir \
+    custom_dir_EXIF_231 defer_strile_loading defer_strile_writing \
+    test_directory test_IFD_enlargement test_open_options \
+    test_append_to_strip test_ifd_loop_detection testtypes \
+    test_signed_tags raw_decode"
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/test check TESTS=""
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/test
+    # Compiled C unit-test programs. libtool leaves a wrapper script in test/
+    # and the real ELF binary in test/.libs/; testtypes is static and lives
+    # only in test/.
+    for prog in ${TIFF_PTEST_PROGS}; do
+        if [ -e ${B}/test/.libs/$prog ]; then
+            install -m 0755 ${B}/test/.libs/$prog ${D}${PTEST_PATH}/test/
+        else
+            install -m 0755 ${B}/test/$prog ${D}${PTEST_PATH}/test/
+        fi
+    done
+    # Shell test scripts and the shared helper
+    install ${S}/test/*.sh ${D}${PTEST_PATH}/test/
+    install ${S}/test/common.sh ${D}${PTEST_PATH}/test/
+    # Point the test scripts at the installed tiff tools instead of ../tools
+    sed -i -e "s|^TOOLS=.*|TOOLS=${bindir}|" ${D}${PTEST_PATH}/test/common.sh
+    # Fill in the C test program list from TIFF_PTEST_PROGS.
+    sed -i -e "s|@PROGS@|${TIFF_PTEST_PROGS}|" ${D}${PTEST_PATH}/run-ptest
+    # Input images and reference outputs
+    cp -r ${S}/test/images ${D}${PTEST_PATH}/test/
+    cp -r ${S}/test/refs ${D}${PTEST_PATH}/test/
+}
+
+RDEPENDS:${PN}-ptest += "tiff-utils"
-- 
2.54.0


