Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6D3757403A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 12:30:45 +0000 (UTC)
Received: by widdi4 with SMTP id di4so53697285wid.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 05:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Czx9IeFUTAJ5Hev9LCD8mBYE5SxFS45e/DTOxwC764s=;
	b=TO5HptF0lDlfHl67E+937GZs8QVPklpKmUFr4Z6QXBMVtAnTBe/QkUweF2KlIQidE8
	kpKbIXgwaeNiMHtABg7iNPL2aSwRMcrSUB0Ngz1Tcm3kpRG1iFJAf4pGwMzVKxcPRmSw
	nNYuipqYoDqF8BfybKiL6hyeQGAessRpPK0lpHSJReSNalQSpfUhOUeQaZBTEIdiSB4k
	m/xEflpTjP5lNyh3sDaRh3p/XrN572nsM7+qHIbBlF2JwNKirwYr9AEWfU89UB5StRBp
	sof3gEd9/NgsOe7vm2kztVgIgHwtA3BHmTRDohyTeXsrqHRu8fW8+eNdLKF4i+BZOuyA
	LRCQ==
X-Received: by 10.180.72.198 with SMTP id f6mr13744498wiv.21.1431520246142;
	Wed, 13 May 2015 05:30:46 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id gy8sm7849261wib.13.2015.05.13.05.30.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 May 2015 05:30:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 May 2015 14:30:54 +0200
Message-Id: <1431520254-31607-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable thumb where it fails for qemuarm
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
X-List-Received-Date: Wed, 13 May 2015 12:30:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc_4.9.bb               | 23 ++++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.11.bb        | 19 ++++++++++++++++++
 meta/recipes-devtools/opensp/opensp_1.5.2.bb       |  5 +++++
 meta/recipes-extended/mailx/mailx_12.5.bb          |  4 ++++
 .../gstreamer/gstreamer1.0-libav_1.4.5.bb          |  9 +++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |  6 ++++++
 6 files changed, 66 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc_4.9.bb b/meta/recipes-devtools/gcc/gcc_4.9.bb
index c4827c6..9561b86 100644
--- a/meta/recipes-devtools/gcc/gcc_4.9.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.9.bb
@@ -4,4 +4,27 @@ require gcc-target.inc
 # Building with thumb enabled on armv4t fails with
 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318): additional relocation overflows omitted from the output
+# and on armv5te (qemuarm) it fails with ICE:
+# | /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/gcc-4.9.2-r0/gcc-4.9.2/gcc/cse.c:5949:1: error: unable to generate reloads for:
+# |  }
+# |  ^
+# | (jump_insn 3586 13095 8302 510 (parallel [
+# |             (set (pc)
+# |                 (if_then_else (lt (plus:SI (reg:SI 4908 [3615])
+# |                             (reg:SI 4876))
+# |                         (const_int 0 [0]))
+# |                     (label_ref 3590)
+# |                     (pc)))
+# |             (set (reg:SI 3252)
+# |                 (plus:SI (reg:SI 4908 [3615])
+# |                     (reg:SI 4876)))
+# |             (clobber (mem/c:SI (reg:SI 5320) [107 %sfp+-208 S4 A32]))
+# |         ]) /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/gcc-4.9.2-r0/gcc-4.9.2/gcc/cse.c:5174 225 {*addsi3_cbranch}
+# |      (expr_list:REG_DEAD (reg:SI 5320)
+# |         (expr_list:REG_DEAD (reg:SI 4908 [3615])
+# |             (expr_list:REG_DEAD (reg:SI 4876)
+# |                 (int_list:REG_BR_PROB 2100 (nil)))))
+# |  -> 3590)
+# | /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/gcc-4.9.2-r0/gcc-4.9.2/gcc/cse.c:5949:1: internal compiler error: in curr_insn_transform, at lra-constraints.c:3362
 ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index d1578e0..025eb54 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -104,3 +104,22 @@ guile_sstate_postinst() {
                 find ${STAGING_DIR_TARGET}/${libdir}/guile/2.0/ccache -type f | xargs touch
 	fi
 }
+
+# Fails to build for qemuarm:
+# | {standard input}: Assembler messages:
+# | {standard input}:16707: Error: instruction not supported in Thumb16 mode -- `adds r0,r2,r4'
+# | {standard input}:16707: Error: lo register required -- `str r0,[r8]'
+# | {standard input}:18192: Error: instruction not supported in Thumb16 mode -- `subs r0,r2,r4'
+# | {standard input}:18192: Error: lo register required -- `str r0,[r8]'
+# | {standard input}:18279: Error: selected processor does not support Thumb mode `smull r3,r6,r2,r6'
+# | {standard input}:34878: Error: instruction not supported in Thumb16 mode -- `subs r0,r2,r4'
+# | {standard input}:34878: Error: lo register required -- `str r0,[r8]'
+# | {standard input}:35148: Error: selected processor does not support Thumb mode `smull r3,r5,r2,r5'
+# | {standard input}:35241: Error: instruction not supported in Thumb16 mode -- `adds r0,r2,r4'
+# | {standard input}:35241: Error: lo register required -- `str r0,[r8]'
+# | {standard input}:16707: Error: branch out of range
+# | {standard input}:18192: Error: branch out of range
+# | {standard input}:34878: Error: branch out of range
+# | {standard input}:35241: Error: branch out of range
+# | make[3]: *** [libguile_2.0_la-vm.lo] Error 1
+ARM_INSTRUCTION_SET = "arm"
diff --git a/meta/recipes-devtools/opensp/opensp_1.5.2.bb b/meta/recipes-devtools/opensp/opensp_1.5.2.bb
index a1f115c..a9f03a4 100644
--- a/meta/recipes-devtools/opensp/opensp_1.5.2.bb
+++ b/meta/recipes-devtools/opensp/opensp_1.5.2.bb
@@ -53,3 +53,8 @@ do_install_append_class-native() {
 FILES_${PN} += "${datadir}/OpenSP/"
 
 BBCLASSEXTEND = "native"
+
+# Fails to build with thumb-1 (qemuarm)
+# | {standard input}: Assembler messages:
+# | {standard input}: Error: unaligned opcodes detected in executable segment
+ARM_INSTRUCTION_SET = "arm"
diff --git a/meta/recipes-extended/mailx/mailx_12.5.bb b/meta/recipes-extended/mailx/mailx_12.5.bb
index a53da3a..3b49145 100644
--- a/meta/recipes-extended/mailx/mailx_12.5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5.bb
@@ -34,3 +34,7 @@ EXTRA_OEMAKE = "SENDMAIL=${sbindir}/sendmail"
 # fio.c:56:17: fatal error: ssl.h: No such file or directory
 # #include <ssl.h>
 PARALLEL_MAKE = ""
+
+# Causes gcc to get stuck and eat all available memory in qemuarm builds
+# jenkins  20755 99.9  6.1 5155676 5041932 ?     R    11:30  38:51 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.2/cc1 -quiet -I /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/mailx/12.5-r2/heirloom-mailx-12.5/EXT -isysroot /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -D _BSD_SOURCE -D DEBIAN -D _GNU_SOURCE -D MAILRC="/etc/nail.rc" -D MAILSPOOL="/var/mail" -D SENDMAIL="/usr/sbin/sendmail" -D HAVE_IPv6_FUNCS send.c -quiet -dumpbase send.c -march=armv5te -mthumb -mthumb-interwork -mtls-dialect=gnu -auxbase send -g -O2 -feliminate-unused-debug-types -o -
+ARM_INSTRUCTION_SET = "arm"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb
index 11b1cfb..42ba589 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb
@@ -24,3 +24,12 @@ LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
+# Fails to build with thumb-1 (qemuarm)
+#| {standard input}: Assembler messages:
+#| {standard input}:5126: Error: instruction not supported in Thumb16 mode -- `adds r3,r1,r0,lsr#31'
+#| {standard input}:5127: Error: selected processor does not support Thumb mode `itet ne'
+#| {standard input}:5128: Error: Thumb does not support conditional execution
+#| {standard input}:5129: Error: Thumb does not support conditional execution
+#| {standard input}:5130: Error: Thumb does not support conditional execution
+#| make[5]: *** [libavresample/audio_mix.o] Error 1
+ARM_INSTRUCTION_SET = "arm"
diff --git a/meta/recipes-support/libunwind/libunwind_1.1.bb b/meta/recipes-support/libunwind/libunwind_1.1.bb
index ee6f522..8453170 100644
--- a/meta/recipes-support/libunwind/libunwind_1.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
@@ -9,3 +9,9 @@ SRC_URI += "\
 
 SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
 SRC_URI[sha256sum] = "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a"
+
+# Fails to build with thumb-1 (qemuarm)
+#| {standard input}: Assembler messages:
+#| {standard input}:84: Error: lo register required -- `ldmia r2,{r4-r12,lr}'
+#| make[2]: *** [arm/Gresume.lo] Error 1
+ARM_INSTRUCTION_SET = "arm"
-- 
2.4.0


