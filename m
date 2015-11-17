Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id B4D6F60119
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:57:59 +0000 (UTC)
Received: by wmww144 with SMTP id w144so22274698wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 03:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=9Eid9vYVJSEUHLWMbkRcuKewBZCXMB0k6sbfezFYotA=;
	b=hCqh3fJTpVGCLeqvOHCcLwxSgLFzimnNS5agHQZuaF2CkevCJw03zJfLfnJhD6l36X
	yvK6v5nIXcWYnWEiltRXCDEMDwTesmkdSlm4Rjk87hCfSpVT3cksH5qNvGaJvJDW1Wo+
	QMeufflKJtT47EFFJl+65wvR0lqpVRndSq59tSFxtHv+eEDH0ZbFZEfor1yy2bkZok5y
	//7rAEv/UcLuy07HDHg7ItzxCxXinqRlDwwppsGPi0BtO4R5X1MT0JxuVi0pQfOjR9cQ
	9wmiPqJZEIQJK6GY9UPQAVyicxbpLn/wRDAAdoglsjJ0fnJ8Axolc6cmhTzti6OwtyqT
	bmxQ==
X-Received: by 10.194.60.179 with SMTP id i19mr42729629wjr.135.1447761479806; 
	Tue, 17 Nov 2015 03:57:59 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l81sm23654806wmb.2.2015.11.17.03.57.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 03:57:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 11:57:54 +0100
Message-Id: <7445847e63323288f55477d5796234a6083abfb1.1447757562.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 02/16] guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable thumb where it fails for qemuarm
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
X-List-Received-Date: Tue, 17 Nov 2015 11:58:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc_4.9.bb                          | 5 ++---
 meta/recipes-devtools/guile/guile_2.0.11.bb                   | 4 ++++
 meta/recipes-devtools/opensp/opensp_1.5.2.bb                  | 4 ++++
 meta/recipes-extended/mailx/mailx_12.5-5.bb                   | 5 +++++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.1.bb | 3 +++
 meta/recipes-support/libunwind/libunwind_1.1.bb               | 4 ++++
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.1.bb
index 99b01c8..077c714 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.1.bb
@@ -24,3 +24,6 @@ LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
 
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
2.6.3


