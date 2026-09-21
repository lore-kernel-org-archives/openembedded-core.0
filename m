Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84730C982DE
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 10:44:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46151.1789987244632294601
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 03:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qkzuHMCM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3724cae21c=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79VQa614193
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 03:11:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=L02RzWXriq6ekoUpl9Siq7/xMi4Fwi028G21BpxBUqU=; b=
	qkzuHMCMZk70scezmUE5YNY22cJa23/0yalmONyrGQweUPkO8IYzPPaPN5KAW/GZ
	HBgFFr4pUJtDu0+UMut2UFCjHh8UfAVS9nN43nYrixBebgV1avoJb+J3BNa0NlkY
	E8OX0webZoaanazsALZvBuqpl2W2ftWVewQnoOQgXK3sVJXla0t1IjQSMfn3kNEI
	7gukDt/OI+Saqt70/4uzUMmJwcLTK/UEz/2xbo34uo6aD/fw6JVhzwq6miM4D4lU
	Nd0N3yjzzEWCKvXeub3+3aIcNHdIKZZxA5t3v82+Gtpc5W9zAzIUkn+Z8OqaK68V
	Ll0QIOaImyDpLfHOeJUbvg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gsnp1a5wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 03:11:07 -0700 (PDT)
Received: from ala-p2exch02.corp.ad.wrs.com (10.11.226.102) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 21 Sep 2026 03:11:07 -0700
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-p2exch02.corp.ad.wrs.com (10.11.226.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.46; Mon, 21 Sep 2026 03:11:06 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 21 Sep 2026 03:11:06 -0700
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Randy MacLeod <Randy.MacLeod@windriver.com>,
        Shiva Komati
	<Shiva.Komati@windriver.com>,
        Himani Ramesh Barde
	<HimaniRamesh.Barde@windriver.com>
Subject: [PATCH v2] tiff: add ptest support
Date: Mon, 21 Sep 2026 10:11:02 +0000
Message-ID: <20260921101102.2619364-1-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915073518.2271284-1-HimaniRamesh.Barde@windriver.com>
References: <20260915073518.2271284-1-HimaniRamesh.Barde@windriver.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0NiBTYWx0ZWRfX1CegPWXtgqmr
 iPpp6DcOaoM2/neAExzstXlixH4RJom+8/XMK/283KSpA5d2/deMKlS2JKJUEXGZTl4O6vKvZ6D
 nhs/grV7kTkyHrOcKgHWHau6ZszExpqK9aMJh6+9j8M2578HbzRLUOXySBlZ8QXHFmehumbz7Lb
 cmRrGoHl1hGJtDds8xUst8u08qT4+KLZjnKpKdS1WMdwdQKAy+f4wBVl8gRmA9JZeLOTiBh3v7g
 H9XEa5snRVmfQaHwfHCYKW8vlVlk3A6gkoNftXoysAT6LwJv9cZmw4hWMpeZ1dckkGtv8GHX1rz
 UkVrkuAdQAdLdglY/oblSbAPEP051hV2QbTb1Tq48daYKX77fHuVzSIQNtigFk1DjHGdPoUqFlP
 93htgXjmyXUuSo9JpRwHdvmqSCD62czpPRiLWw4B/73UUizELRjWhXLGRWutQijdNFG9LLva4Lq
 4k4lDBCcBHKg6IUFc5w==
X-Proofpoint-GUID: tFoXIkdA7DOGca_Y-F_XSUbXP82wjFSp
X-Authority-Analysis: v=2.4 cv=V4foQuni c=1 sm=1 tr=0 ts=6ab102bb cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=Qs8GJauRAAAA:8 a=t7CeM3EgAAAA:8
 a=NPSSsMgJiW1vNHCyjKsA:9 a=-MsOl3yrPmtpHepMbiy1:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: tFoXIkdA7DOGca_Y-F_XSUbXP82wjFSp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0NiBTYWx0ZWRfXy7eUxJE/ONVY
 bxr5KqgrT91L0zyA/ShS9mh62Vc3nHkdn92DHf2sHhFpORiLUNDcj14Jh+DAwq9IgRjdyeFTMWF
 v3WxE935f3N08by54y9cGBS2LnF/KLC9ETreWi8UF13hXtR6hEmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210146
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 10:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246320

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

The list of C test programs is defined once in the recipe (TIFF_PTEST_PROGS)
and substituted into run-ptest at install time to avoid duplication. The
wrapper emits automake-style PASS/FAIL/SKIP results and skips two tests
whose optional support is not built in the default configuration: the JBIG
test (jbig is not in the default PACKAGECONFIG) and the thumbnail test (the
thumbnail tool is not built).

Registered in ptest-packagelists.inc under PTESTS_SLOW; the suite runs in
roughly 30s on qemux86-64.

Validated on qemux86-64: 17 C unit tests and 85 shell-script tests pass,
2 skipped (jbig, thumbnail), 0 failed.

Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
---

v2:
- Drop the INSANE_SKIP buildpaths (test binaries package reproducibly; QA passes).
- Drop make and bash from RDEPENDS (run-ptest never calls make; the test
  scripts are all #!/bin/sh).
- Define the C test program list once (TIFF_PTEST_PROGS) and substitute it
  into run-ptest at install time instead of duplicating it.
- Commit log: add test counts and note the ~30s runtime.

 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-multimedia/libtiff/tiff/run-ptest | 29 ++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.7.2.bb | 44 ++++++++++++++++++-
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
index 0000000..5abee0e
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/run-ptest
@@ -0,0 +1,29 @@
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
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
index 8bc3a48..55fe1df 100644
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
 
@@ -64,3 +65,44 @@ do_install:append() {
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
+    # Fill in the program list and the SOURCE_DIR path baked into
+    # test_ifd_loop_detection so run-ptest resolves them at runtime.
+    sed -i -e "s|@PROGS@|${TIFF_PTEST_PROGS}|" \
+           -e "s|@SOURCE_DIR@|../../tiff-${PV}/test|g" \
+           ${D}${PTEST_PATH}/run-ptest
+    # Input images and reference outputs
+    cp -r ${S}/test/images ${D}${PTEST_PATH}/test/
+    cp -r ${S}/test/refs ${D}${PTEST_PATH}/test/
+}
+
+RDEPENDS:${PN}-ptest += "tiff-utils"
-- 
2.54.0


