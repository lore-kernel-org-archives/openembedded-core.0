Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4E32071E30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 13:12:50 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id s67so7714411pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 05:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=tEbaDEIj++xKbfAnjjoU8xiI5fWmBr4/j+7pF9peR+w=;
	b=a02Z6hmcH7lBrVTFPtThW7XYC4yz9wCy7VmzTNnhk3s+yZ+DEHrdH76zB0N9es7xYi
	aE4z/rXeXrsoY+C+9sgtvUpQQDZKAIoimsNxl37EE///3DP9b+swqNF3H4Ey4iFUZMTz
	etik7cA9pYB0VXOqVjfxEsbEPcMVBc1J99LxIajT1kvThLsS+9RND6+qgQ+koQlOcK4V
	XtR6o+UCq50yx/IwHUCOqnfc3QGjPZwAbkcDgww4ccmCSk0azZDYloUygQbdc6AOZ/nL
	c+rMgbiRQrlYBz4ByTsXN26AC49gw+pDaRBzk2V5pkxfBcan1VtRaCqphhST04HBr5kF
	nzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=tEbaDEIj++xKbfAnjjoU8xiI5fWmBr4/j+7pF9peR+w=;
	b=Umyb2Se51Lr+zKUFKrzbMiDqJeiUum6Z7O5TpOHkoc1DhL1NS5/kEjmVEBR/Vxqd0S
	zcP0PFsryCG2O4jiWVh36LAIO2y4SQ2OzfEF8b2Wu9P9ik5a/dSprxNT6QHv9u0s/6bi
	OF1CiQo/d8VlvvZ+xbwY40sa/NXDaEo0qsdoomFuZQDJfwy0TjdfADGi5p1sPYMUjta/
	PgrJEeibmCMbjVXJ2+vtPoc9qrBqvXGoIp65x5cRQQbwVWR+1gHgdKiFqwhzwsUTOEyl
	5XzBYTvhBXvlbsyNmVRPKnjBaI3FVgWlDOjcAy6zkpnNMvswBTDMirG8d9JHnQML7Cwg
	fH+g==
X-Gm-Message-State: AMke39kl81HKigK7a9En9VOwwTXjv6Lbtm1b3YqTeZfJVwHWYkNsShKXvbUJMHbPg6e4KQ==
X-Received: by 10.99.8.194 with SMTP id 185mr35254433pgi.76.1487682772452;
	Tue, 21 Feb 2017 05:12:52 -0800 (PST)
Received: from [127.0.1.1] (CPE-123-211-135-66.lnse3.woo.bigpond.net.au.
	[123.211.135.66]) by smtp.gmail.com with ESMTPSA id
	m6sm41124265pfm.22.2017.02.21.05.12.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 05:12:51 -0800 (PST)
Date: Tue, 21 Feb 2017 23:12:29 +1000
Message-Id: <20170221131229.20126-4-nathan@nathanrossi.com>
In-Reply-To: <20170221131229.20126-0-nathan@nathanrossi.com>
References: <20170221131229.20126-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH v2 4/4] qemu: Move recipe version specific patches and features to recipe
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
X-List-Received-Date: Tue, 21 Feb 2017 13:12:51 -0000
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
 meta/recipes-devtools/qemu/qemu.inc      | 30 +----------------------------
 meta/recipes-devtools/qemu/qemu_2.8.0.bb | 33 ++++++++++++++++++++++++++++++--
 2 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e78cfb367b..a023551a31 100644
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
@@ -69,22 +54,9 @@ do_configure() {
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
index e0527a8fd9..2fb9647370 100644
--- a/meta/recipes-devtools/qemu/qemu_2.8.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.8.0.bb
@@ -1,15 +1,31 @@
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
             file://qemu-2.5.0-cflags.patch \
             file://target-ppc-fix-user-mode.patch \
-"
+            "
+
+SRC_URI_append_class-native = " \
+            file://fix-libcap-header-issue-on-some-distro.patch \
+            file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
+            "
 
 SRC_URI =+ "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 
@@ -22,4 +38,17 @@ COMPATIBLE_HOST_mipsarchn64 = "null"
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


