Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 687EC7391A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:50:44 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 75so30900280pgf.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=mboplQUTEr482bKSyaXAEfAlGzgiNwnMiZwkf4198y4=;
	b=dL29lC5xd/NaA901BXPwB+X6Txa3u022nXMwwaEpsNPgSYk7VDgT3sehob695yVzCY
	aURaMLeLm0dPeaOunRgsIIArsf/HjK1god/FqxlDeJvPXHcPUw9/K5ITcpmw+mnTRHJC
	Yeba1fGQzb7ZtsxS4feZS5elMR/8MYvAKL0c7R2+BdG9uv6x2GoWeCxYnwdZZfJjexMs
	GfFSuf/pnpQ1VPdBgKt2SOHH4scdKxMFzT13zI7FcjNk/fmSfMAVkbQv+OQcIMFgdpAs
	WPLK2vRjss+2bAsrDGo0jCwlzk+0q6MfEEoKH7VGvdj+oI+crpe1V3YMEnUTyEv/4enU
	0hIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=mboplQUTEr482bKSyaXAEfAlGzgiNwnMiZwkf4198y4=;
	b=BeO/BYOlM6ldaHqs9ThbiNQFDRhzTrWw2ZPyTz2WJrbtvNQwpsd7LwzHDnetiKnswi
	9Rxds3PO777lbF8HadB17vSXKS+dBeJxRXBKHj/+WPMw6FTFjuTN4WF/+eQRDJoffdXP
	Z7+pk/af4ZmGtEEvOFH7Iia9fhROSn3fyK3uKCx1pQfpwliywfrFlbw04dyIAMA96VmZ
	RmKEoZG/C5BQMzZx4BEm3ooT00Qc72EuymTMBlPGKIKAF0nuMrrwmj0e6DiM4/7P3f/E
	7hgHe54HBaDE+GGWpdxmu903HpwyK6LVHzBL4+DM4rqSWXJN0/Q2hwU4td+s5wjwA0gg
	sr5Q==
X-Gm-Message-State: AIkVDXJ7kLvmor/EOgoIbflESeBFjEIIRfdxwNvxCEAucGF90+PrAmkhAukPsFeEjoU/LA==
X-Received: by 10.98.66.138 with SMTP id h10mr21538056pfd.94.1485762645417;
	Sun, 29 Jan 2017 23:50:45 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	g87sm29681115pfj.20.2017.01.29.23.50.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:50:44 -0800 (PST)
Date: Mon, 30 Jan 2017 17:50:21 +1000
Message-Id: <20170130075021.1725-4-nathan@nathanrossi.com>
In-Reply-To: <20170130075021.1725-0-nathan@nathanrossi.com>
References: <20170130075021.1725-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 4/4] qemu: Move recipe version specific patches and features to recipe
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
X-List-Received-Date: Mon, 30 Jan 2017 07:50:45 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Move all the version specific patches, overrides and configuration that
are in qemu.inc to the versioned QEMU recipe.

This includes moving patches that target the versioned recipe, ptest
configuration (which is not available in QEMU by default) and the
installing of the powerpc_rom.bin.  All these patches/files are also
only located in the FILESEXTRAPATHS that is valid from the recipe file
and not from qemu.inc itself.

The purpose of this change is to make the qemu.inc re-usable for
multiple versions of QEMU as well as forks and recipes that intend to
provide custom patches.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/qemu/qemu.inc      | 31 +----------------------------
 meta/recipes-devtools/qemu/qemu_2.7.1.bb | 34 ++++++++++++++++++++++++++++++--
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0a6daf7bc8..3220a56175 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -3,30 +3,14 @@ HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "glib-2.0 zlib pixman"
 RDEPENDS_${PN}_class-target += "bash"
-RDEPENDS_${PN}-ptest = "bash make"
 
 require qemu-targets.inc
-inherit autotools ptest bluetooth
+inherit autotools bluetooth
 BBCLASSEXTEND = "native nativesdk"
 
 # QEMU_TARGETS is overridable variable
 QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
 
-SRC_URI = "\
-    file://powerpc_rom.bin \
-    file://disable-grabs.patch \
-    file://exclude-some-arm-EABI-obsolete-syscalls.patch \
-    file://wacom.patch \
-    file://add-ptest-in-makefile.patch \
-    file://run-ptest \
-    file://0001-target-mips-add-24KEc-CPU-definition.patch \
-    "
-
-SRC_URI_append_class-native = "\
-    file://fix-libcap-header-issue-on-some-distro.patch \
-    file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
-    "
-
 EXTRA_OECONF = " \
     --prefix=${prefix} \
     --bindir=${bindir} \
@@ -70,22 +54,9 @@ do_configure() {
     test ! -e ${S}/target-i386/beginend_funcs.sh || chmod a+x ${S}/target-i386/beginend_funcs.sh
 }
 
-do_compile_ptest() {
-	make buildtest-TESTS
-}
-
-do_install_ptest() {
-	cp -rL ${B}/tests ${D}${PTEST_PATH}
-	find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcod]" | xargs -i rm -rf {}
-
-	cp ${S}/tests/Makefile.include ${D}${PTEST_PATH}/tests
-}
-
 do_install () {
 	export STRIP="true"
 	autotools_do_install
-	install -d ${D}${datadir}/qemu
-	install -m 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
 }
 
 # The following fragment will create a wrapper for qemu-mips user emulation
diff --git a/meta/recipes-devtools/qemu/qemu_2.7.1.bb b/meta/recipes-devtools/qemu/qemu_2.7.1.bb
index 8180c5f75a..4026ef159e 100644
--- a/meta/recipes-devtools/qemu/qemu_2.7.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.7.1.bb
@@ -1,9 +1,21 @@
 require qemu.inc
 
+inherit ptest
+
+RDEPENDS_${PN}-ptest = "bash make"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
+SRC_URI += " \
+            file://powerpc_rom.bin \
+            file://disable-grabs.patch \
+            file://exclude-some-arm-EABI-obsolete-syscalls.patch \
+            file://wacom.patch \
+            file://add-ptest-in-makefile.patch \
+            file://run-ptest \
+            file://0001-target-mips-add-24KEc-CPU-definition.patch \
+            file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
             file://no-valgrind.patch \
@@ -11,7 +23,12 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-2.5.0-cflags.patch \
             file://0003-fix-CVE-2016-7908.patch \
             file://0004-fix-CVE-2016-7909.patch \
-"
+            "
+
+SRC_URI_append_class-native = " \
+            file://fix-libcap-header-issue-on-some-distro.patch \
+            file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
+            "
 
 SRC_URI =+ "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 
@@ -24,4 +41,17 @@ COMPATIBLE_HOST_mipsarchn64 = "null"
 do_install_append() {
     # Prevent QA warnings about installed ${localstatedir}/run
     if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
+    install -Dm 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
+}
+
+do_compile_ptest() {
+	make buildtest-TESTS
 }
+
+do_install_ptest() {
+	cp -rL ${B}/tests ${D}${PTEST_PATH}
+	find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcod]" | xargs -i rm -rf {}
+
+	cp ${S}/tests/Makefile.include ${D}${PTEST_PATH}/tests
+}
+
-- 
2.11.0


