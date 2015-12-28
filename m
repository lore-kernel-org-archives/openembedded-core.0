Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 074BD6FF56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:14:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBS7Eppc025210
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:14:51 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:14:50 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:11 -0800
Message-ID: <0d1ea096cde4a145b0bb6efaa8fac03de74848d1.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/40] guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable thumb where it fails for qemuarm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Dec 2015 07:14:51 -0000
Content-Type: text/plain

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc_4.9.bb               |    5 ++---
 meta/recipes-devtools/guile/guile_2.0.11.bb        |    4 ++++
 meta/recipes-devtools/opensp/opensp_1.5.2.bb       |    4 ++++
 meta/recipes-extended/mailx/mailx_12.5-5.bb        |    5 +++++
 .../gstreamer/gstreamer1.0-libav_1.4.5.bb          |    3 +++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |    4 ++++
 6 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc_4.9.bb b/meta/recipes-devtools/gcc/gcc_4.9.bb
index b84baae..a9dc612 100644
--- a/meta/recipes-devtools/gcc/gcc_4.9.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.9.bb
@@ -1,10 +1,9 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-target.inc
 
-# Building with thumb enabled on armv4t fails with
-# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
-# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318): additional relocation overflows omitted from the output
+# http://errors.yoctoproject.org/Errors/Details/20497/
 ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
 
 BBCLASSEXTEND = "nativesdk"
 
diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index f455740..98b465b 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -119,3 +119,7 @@ guile_sstate_postinst() {
                 find ${STAGING_DIR_TARGET}/${libdir}/guile/2.0/ccache -type f | xargs touch
 	fi
 }
+
+# http://errors.yoctoproject.org/Errors/Details/20491/
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
diff --git a/meta/recipes-devtools/opensp/opensp_1.5.2.bb b/meta/recipes-devtools/opensp/opensp_1.5.2.bb
index a1f115c..60a7d2e 100644
--- a/meta/recipes-devtools/opensp/opensp_1.5.2.bb
+++ b/meta/recipes-devtools/opensp/opensp_1.5.2.bb
@@ -53,3 +53,7 @@ do_install_append_class-native() {
 FILES_${PN} += "${datadir}/OpenSP/"
 
 BBCLASSEXTEND = "native"
+
+# http://errors.yoctoproject.org/Errors/Details/20489/
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
diff --git a/meta/recipes-extended/mailx/mailx_12.5-5.bb b/meta/recipes-extended/mailx/mailx_12.5-5.bb
index ffa9049..c87c582 100644
--- a/meta/recipes-extended/mailx/mailx_12.5-5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5-5.bb
@@ -41,3 +41,8 @@ EXTRA_OEMAKE = "SENDMAIL=${sbindir}/sendmail IPv6=-DHAVE_IPv6_FUNCS PREFIX=/usr
 # fio.c:56:17: fatal error: ssl.h: No such file or directory
 # #include <ssl.h>
 PARALLEL_MAKE = ""
+
+# Causes gcc to get stuck and eat all available memory in qemuarm builds
+# http://errors.yoctoproject.org/Errors/Details/20488/
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb
index 97fc7ec..5d74a2e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb
@@ -25,3 +25,6 @@ LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
+# http://errors.yoctoproject.org/Errors/Details/20493/
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
diff --git a/meta/recipes-support/libunwind/libunwind_1.1.bb b/meta/recipes-support/libunwind/libunwind_1.1.bb
index 8282c1b..29bdf94 100644
--- a/meta/recipes-support/libunwind/libunwind_1.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
@@ -10,3 +10,7 @@ SRC_URI += "\
 
 SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
 SRC_URI[sha256sum] = "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a"
+
+# http://errors.yoctoproject.org/Errors/Details/20487/
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
-- 
1.7.9.5


