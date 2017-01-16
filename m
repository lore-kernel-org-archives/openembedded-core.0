Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3966C71B58
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:18:16 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y143so14251247pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=n6wt2iBLt6PnO6MsZgVKLUA8lqL+rwucRhqiBJt3rMM=;
	b=QRVwdLBSChXKpa7Cu3sxXxHUFXZyEG49922nJRruD97ORhE8AkdTVeUhjPU52Cim0i
	WAmm9GYvy8rePcOOOl1In8UePDijm/u0NFb2zCl36q9VPUXyR099CC7NDF/ff0S8LBPE
	PVv01Me5yT1eCOOS6EjD6777ZdDD5p60qOBjgs+3YfdzohOZ8s7svGJbNzu/p1aQEhBI
	kidQ+59TRyjE1F7rka7cE0OGxpKNxaKK7YTJgGq3vQjCPLC5jC1g0Rvw36q9o/lFOsU2
	MIpXmK7ALt85HMAMPRQfwvyZS8dCiKKOhygWaIkdEAOLDvu5L8lgqwUtAth7toUWq1EI
	CGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=n6wt2iBLt6PnO6MsZgVKLUA8lqL+rwucRhqiBJt3rMM=;
	b=Zuz9VTmPQuuERHizcsrUhX/osjp7zGZGferPQCQ1nOHiD9ERnnmgfmF9wMLBwWdeij
	Ju1rojt2UFZuXObq6/v+DtKXxsvpaCLZ1v/IMIg1OBXOVorNX2CplUpIY8laIkansVUy
	Z3fmbCaivgRGbl3q5jqgub58JxnggzZGMesCt/KvzcUYMff+PXlBBEqHBTH70aRtKwvY
	hfuNf0UMXkeES9CSyNwM1fC8RRcwqTEPUcK8xRwo7wHgjG4dryb+BIicA2o0GFjSrXEQ
	OG3LRSwkebkdxOdBqfHS4qKb27IGopl3t1R9Tq13qju9foXkx/GcqpZkxBkaUEiuCU4y
	qMVQ==
X-Gm-Message-State: AIkVDXJimoH1az6Vwepy4qWjwQOg8+GI0IJ/fk4OkgtZxyNwJTPBGeBy07eJq3BLUtlURA==
X-Received: by 10.84.132.1 with SMTP id 1mr51069252ple.44.1484576296904;
	Mon, 16 Jan 2017 06:18:16 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	t3sm48236386pfb.60.2017.01.16.06.18.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:18:16 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-30-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 30/30] qemu: Move recipe version specific patches and features to recipe
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
X-List-Received-Date: Mon, 16 Jan 2017 14:18:16 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Move all the version specific patches, overrides and configuration that
are in qemu.inc to the versioned QEMU recipe.

This includes moving patches that target the versioned recipe as well as
ptest configuration (which is not available in QEMU by default) and well
and the installing of the powerpc_rom.bin.  All these patches/files are
also only located in the FILESEXTRAPATHS that is valid from the recipe
file and not from qemu.inc itself.

The purpose of this change is to make the qemu.inc re-usable for
multiple versions of QEMU as well as forks and recipes that intend to
provide custom patches.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/qemu/qemu.inc      | 31 +----------------------------
 meta/recipes-devtools/qemu/qemu_2.7.0.bb | 34 ++++++++++++++++++++++++++++++--
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f11221c991..4a6a88fdbc 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -3,10 +3,9 @@ HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "glib-2.0 zlib pixman"
 RDEPENDS_${PN}_class-target += "bash"
-RDEPENDS_${PN}-ptest = "bash make"
 
 require qemu-targets.inc
-inherit autotools ptest
+inherit autotools
 BBCLASSEXTEND = "native nativesdk"
 
 PR = "r1"
@@ -14,21 +13,6 @@ PR = "r1"
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
@@ -72,22 +56,9 @@ do_configure() {
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
diff --git a/meta/recipes-devtools/qemu/qemu_2.7.0.bb b/meta/recipes-devtools/qemu/qemu_2.7.0.bb
index 0d680a7eee..fba2184414 100644
--- a/meta/recipes-devtools/qemu/qemu_2.7.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.7.0.bb
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
@@ -14,7 +26,12 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://0003-fix-CVE-2016-7908.patch \
             file://0004-fix-CVE-2016-7909.patch \
             file://0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch \
-"
+            "
+
+SRC_URI_append_class-native = " \
+            file://fix-libcap-header-issue-on-some-distro.patch \
+            file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
+            "
 
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "08d4d06d1cb598efecd796137f4844ab"
@@ -26,4 +43,17 @@ COMPATIBLE_HOST_mipsarchn64 = "null"
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


