Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF44BC88E73
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 08:10:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18162.1789458583333885183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=b/IFgVPK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3718b6eb52=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Zo2O2451037
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 00:36:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=iG/TmAsr2
	8+kTR8GPODAMPZojMHYxavYQvv1dGEuCXs=; b=b/IFgVPKg9cQeNf0UTAUS34RP
	mbHYnJXqmuhisJJOnMKddQMnUfqtVHwEWKeobDBA/bz3xCtWBReL81ReWnaHHSIG
	UAT8xA1AhlZwUvd6ncdcGK66/lIZg8h6jb9WvJ7Tw38/ifvHzqyZIcbxuUMtOiJi
	oKyirYtRqCo/9uAtGHEpVUAu9OiShIx64TCmB1ih1S8/xk8VtuvJvtSlphk7vIKq
	LApMhpUFVis0ZSW6p2J2XGzhqfhDw35GDJt6CPspIpczp9vJdQPR4wwPiXYp6jp8
	//uVL8Jv639jh6MX7arfiKY7YVplArvi/tj6epyeUuP4oXzCU2POfw7OG6Tpw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gn210nekw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 00:36:23 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 15 Sep 2026 00:36:22 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 15 Sep 2026 00:36:22 -0700
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Randy MacLeod <Randy.MacLeod@windriver.com>,
        Shiva Komati
	<Shiva.Komati@windriver.com>,
        Himani Ramesh Barde
	<HimaniRamesh.Barde@windriver.com>
Subject: [PATCH] tiff: add ptest support
Date: Tue, 15 Sep 2026 07:36:20 +0000
Message-ID: <20260915073620.2271352-1-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Proofpoint-GUID: qhGfScWabtgbF1JMXyp3HI9XOdEA8oxK
X-Proofpoint-ORIG-GUID: qhGfScWabtgbF1JMXyp3HI9XOdEA8oxK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwNyBTYWx0ZWRfX9UgwHnz8qjPQ
 bvtLglbyfc3U6PNad7/RE8wRmekk4EuO0pUPUT4//aVE4vYekaquCVBmGsct8gyj8xeS9UvaqUU
 uy3v/IK/wJwlerdgFLdQ/LTY0JPUHol+kbYH6EkgdWJo2YIMaclG2Weu+YS9PITJzND/U+LrQaY
 auGV6jzO/78oWLOlvFwfCNceX16H0cfqOQR1tsNxkPL4EbMDkWRSMipFYYkJQPJ8CTafEK0x0Ik
 zNsZD4jBvVB1Dqn32RgyheEnDjOz2/UrpZatPCBiwEEql1i7TTLm+mDf3Wgqqn/sMHIs2k+Zb1y
 0Nvw1pYgXC4JZywUSt61zXEjjX1Y/wHM3HPwgEiPQjOc9fy8d4O6n8YilkeTw386nO/2vE1WrAA
 /rkaKqF5ukSKFEIskS2AOEt3NqtZgbF7brYkan8PCAdzptzIz3I/t6ibQ88F9yudNiuMrw2fM8x
 fmBBgtDpZqtdwFPPefg==
X-Authority-Analysis: v=2.4 cv=J5Y/fwnS c=1 sm=1 tr=0 ts=6aa8f577 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=Qs8GJauRAAAA:8 a=t7CeM3EgAAAA:8
 a=uw5dici6eL7eeb2-vccA:9 a=-MsOl3yrPmtpHepMbiy1:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwNyBTYWx0ZWRfX1rU+bgHmu8IN
 PM9iOHKGymfScgsRfJuglz4uS5UxcFG673KWqc8kgZStAf1BabkxQeQberg1CdOBiKWyo42hPTl
 USV2ch31LHTooDrESeUwDEBGN7DGYKBJHFsf6+Ebfsp31M8K0t9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150107
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 08:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245825

Enable ptest for tiff (libtiff), running the upstream test suite shipped
in the source test/ directory: the C unit-test programs (check_PROGRAMS)
plus the shell-script tests that exercise the tiff command-line tools.

do_compile_ptest builds the test programs via "make check TESTS=" (build
only, no run). do_install_ptest installs the compiled test binaries (real
ELF from test/.libs, static testtypes from test/), the shell test scripts,
the shared common.sh helper, and the images/refs data. common.sh is
adjusted so the scripts find the installed tiff tools in ${bindir} rather
than the build tree's ../tools, and run-ptest recreates the SOURCE_DIR
path that test_ifd_loop_detection was compiled with so its images resolve
on target.

The run-ptest wrapper emits automake-style PASS/FAIL/SKIP results and
skips the JBIG test (JBIG is not in the default PACKAGECONFIG) and the
thumbnail test (the thumbnail tool is not built by default).

The recipe is registered in ptest-packagelists.inc (PTESTS_SLOW), and
buildpaths QA is skipped for the -ptest package since the compiled test
binaries legitimately embed build paths.

Validated on qemux86-64: all C tests and shell tests pass, 2 skipped
(jbig, thumbnail), 0 failed.

Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-multimedia/libtiff/tiff/run-ptest | 31 ++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.7.2.bb | 42 ++++++++++++++++++-
 3 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-multimedia/libtiff/tiff/run-ptest

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
index 0000000..40301ed
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/run-ptest
@@ -0,0 +1,31 @@
+#!/bin/sh
+# Run the libtiff test suite and emit ptest-style PASS/FAIL/SKIP lines.
+cd "$(dirname "$0")/test" || exit 1
+
+# test_ifd_loop_detection is built with -DSOURCE_DIR="@SOURCE_DIR@" and opens
+# its images via that relative path; symlink it to the installed test dir.
+if [ ! -e "@SOURCE_DIR@" ]; then
+    mkdir -p "$(dirname @SOURCE_DIR@)"
+    ln -sf "$(pwd)" "@SOURCE_DIR@" 2>/dev/null || true
+fi
+
+CPROGS="ascii_tag long_tag short_tag strip_rw rewrite custom_dir \
+custom_dir_EXIF_231 defer_strile_loading defer_strile_writing test_directory \
+test_IFD_enlargement test_open_options test_append_to_strip \
+test_ifd_loop_detection testtypes test_signed_tags raw_decode"
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
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
index 8bc3a48..ea4300b 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ab490c3088a0acff254eb2f8c577547"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
+           file://run-ptest \
 	   "
 
 SRC_URI[sha256sum] = "672bd7d10aee4606171afb864f3570b83340f6a33e2c186dc0512f7145ffdf6a"
@@ -23,7 +24,7 @@ CVE_STATUS[CVE-2023-6277] = "fixed-version: Fixed since 4.7.0, NVD tracks this a
 CVE_STATUS[CVE-2025-8851] = "fixed-version: Fixed since 4.7.0, NVD tracks this as fixed in 2024-08-11 vulnerability"
 CVE_STATUS[CVE-2026-4775] = "fixed-version: Fixed since 4.7.2, NVD tracks this as version-less vulnerability"
 
-inherit autotools multilib_header
+inherit autotools multilib_header ptest
 
 CACHED_CONFIGUREVARS = "ax_cv_check_gl_libgl=no"
 
@@ -64,3 +65,42 @@ do_install:append() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
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
+    for prog in ascii_tag long_tag short_tag strip_rw rewrite custom_dir \
+                custom_dir_EXIF_231 defer_strile_loading defer_strile_writing \
+                test_directory test_IFD_enlargement test_open_options \
+                test_append_to_strip test_ifd_loop_detection testtypes \
+                test_signed_tags raw_decode; do
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
+    # test_ifd_loop_detection embeds -DSOURCE_DIR=../../tiff-${PV}/test; fill
+    # that path into run-ptest so it can be symlinked to the installed tests.
+    sed -i -e "s|@SOURCE_DIR@|../../tiff-${PV}/test|g" ${D}${PTEST_PATH}/run-ptest
+    # Input images and reference outputs
+    cp -r ${S}/test/images ${D}${PTEST_PATH}/test/
+    cp -r ${S}/test/refs ${D}${PTEST_PATH}/test/
+}
+
+RDEPENDS:${PN}-ptest += "make bash tiff-utils"
+
+# The compiled C test programs embed build paths in debug info; this is
+# expected for ptest binaries and not relevant to the shipped library.
+INSANE_SKIP:${PN}-ptest += "buildpaths"
-- 
2.54.0


