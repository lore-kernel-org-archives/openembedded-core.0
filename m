Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id EA72C7756D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:26:47 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 187so6363578pgb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 07:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=1G3TEVM0/dcsP9KIXsKwkx4Do6qewbOz5bGAx8ySdvo=;
	b=RwiRsHM9b4wwZ5T45x0dxrloSVBf0DonPMBFED/ojDVwST/m+nJ4U3xQxYcR+crHUa
	l4zzHnOpiK6HZz9OpE48niv7vS/nhoIXhG9rhCkq8ArUqfrlq++6gm2YvacXUyJ9ncUa
	TxqFFQ6LlW2xQ5+MhGgNVGhqVV+kTUq0DZSmnE+BzXEUA3YG39CO4D5navnC3K51pVaF
	8wGKkUx42HxYTs9X6pM+fN1B32MNh06qLpC4DktMilubLDRPYKTUKCVDjEfNvBB4eLkx
	I/JXHfQn4AG21CWHG4Vum81AAONEFrZEWlBx+hKeIg+PQaqa8iDHfAB/WyMubkdIvBO4
	LpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=1G3TEVM0/dcsP9KIXsKwkx4Do6qewbOz5bGAx8ySdvo=;
	b=eIrcwiCTboG437vAfAGz0qqGkol6ZcjmorWkph/NgBsx27UDQ7xnAOYkpC3NhF7F/s
	Dub+VqswBiZC2wA9HzSMknAmk/4QPluWAP62sjuB/4FzMdnhgy4eKqpXpxYIbBwwTdvz
	An7v1ENNFs2vJmKvm443R/Qihd2ACaXN5VwGotfFDlnsli6flHZVglNcSBXYqvAh78we
	gwgY57cbEhYqpU//4Kzok+f1V2eMt1+z1mFYyhuFD7KQTgSrBuS7kuGlUUQAmQr4/+2i
	83fnrt60Ln645qOLzGTjpjbCIlbFETdP//yyucQszWebOAXLRJqJIsyt2Dw3pt+uiiyf
	sNLA==
X-Gm-Message-State: AMke39mjTUGxpZSDXqv7bE5eGFs0kND3cX02DB5isocVCdFrwCX75x6iY1Y1tMTBSPKbqA==
X-Received: by 10.84.233.193 with SMTP id m1mr27238649pln.118.1488814009022;
	Mon, 06 Mar 2017 07:26:49 -0800 (PST)
Received: from [127.0.1.1] (CPE-123-211-135-66.lnse3.woo.bigpond.net.au.
	[123.211.135.66]) by smtp.gmail.com with ESMTPSA id
	k76sm40354326pfg.42.2017.03.06.07.26.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 07:26:48 -0800 (PST)
Date: Tue, 07 Mar 2017 01:26:20 +1000
Message-Id: <20170306152620.22194-4-nathan@nathanrossi.com>
In-Reply-To: <20170306152620.22194-0-nathan@nathanrossi.com>
References: <20170306152620.22194-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH v3 4/4] qemu: Move recipe version specific patches and features to recipe
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
X-List-Received-Date: Mon, 06 Mar 2017 15:26:48 -0000
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
 meta/recipes-devtools/qemu/qemu.inc      | 30 +-----------------------------
 meta/recipes-devtools/qemu/qemu_2.8.0.bb | 31 ++++++++++++++++++++++++++++++-
 2 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5bd41d0d90..85b344c960 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -3,29 +3,14 @@ HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "glib-2.0 zlib pixman"
 RDEPENDS_${PN}_class-target += "bash"
-RDEPENDS_${PN}-ptest = "bash make"
 
 require qemu-targets.inc
-inherit autotools pkgconfig ptest bluetooth
+inherit autotools pkgconfig bluetooth
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
@@ -70,22 +55,9 @@ do_configure() {
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
diff --git a/meta/recipes-devtools/qemu/qemu_2.8.0.bb b/meta/recipes-devtools/qemu/qemu_2.8.0.bb
index ce475e02cb..7bb4d06fb9 100644
--- a/meta/recipes-devtools/qemu/qemu_2.8.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.8.0.bb
@@ -1,9 +1,20 @@
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
+            file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
             file://no-valgrind.patch \
             file://pathlimit.patch \
@@ -19,6 +30,11 @@ SRC_URI += " \
             file://0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch \
 "
 
+SRC_URI_append_class-native = " \
+            file://fix-libcap-header-issue-on-some-distro.patch \
+            file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
+            "
+
 SRC_URI =+ "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 
 SRC_URI[md5sum] = "17940dce063b6ce450a12e719a6c9c43"
@@ -30,4 +46,17 @@ COMPATIBLE_HOST_mipsarchn64 = "null"
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


