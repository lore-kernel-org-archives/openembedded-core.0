Return-Path: <riku.voipio@linaro.org>
Received: from afflict.kos.to (afflict.kos.to [92.243.29.197])
	by mail.openembedded.org (Postfix) with ESMTP id 63DA76007C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 14:05:17 +0000 (UTC)
Received: from aimless.elisa-laajakaista.fi
	(a91-156-63-85.elisa-laajakaista.fi [91.156.63.85])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id 0A74026545;
	Tue,  6 Aug 2013 16:05:13 +0200 (CEST)
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2013 17:04:53 +0300
Message-Id: <1375797893-3937-1-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.8.3.1
Cc: patches@linaro.org
Subject: [PATCH] qemu: pass CFLAGS via ./configure instead of a patch
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
X-List-Received-Date: Tue, 06 Aug 2013 14:05:17 -0000

OE carries a patch to pass CFLAGS to qemu. However, we can avoid
patching by passing CFLAGS with qemu's --extra-cflags option.

Tested that building qemu-native still works without zlib-dev
on host, and that qemu builds.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 .../qemu/files/fix-configure-checks.patch          | 22 ----------------------
 meta/recipes-devtools/qemu/qemu.inc                |  4 +---
 2 files changed, 1 insertion(+), 25 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/files/fix-configure-checks.patch

diff --git a/meta/recipes-devtools/qemu/files/fix-configure-checks.patch b/meta/recipes-devtools/qemu/files/fix-configure-checks.patch
deleted file mode 100644
index 294c220..0000000
--- a/meta/recipes-devtools/qemu/files/fix-configure-checks.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-In native builds, qemu can fail to find zlib development files in the native 
-sysroot and the build machine might not have zlib-dev packages installed.
-
-Add CFLAGS to qemu's CFLAGS which in the native case means BUILD_CFLAGS are
-added and files in the sysroot can be found.
-
-Patch from Paul Eggleton, Comments by RP 28/11/10
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: qemu-1.4.0/configure
-===================================================================
---- qemu-1.4.0.orig/configure	2013-02-15 15:05:35.000000000 -0800
-+++ qemu-1.4.0/configure	2013-02-25 13:44:17.915273181 -0800
-@@ -286,6 +286,7 @@
- QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
- QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
- QEMU_INCLUDES="-I. -I\$(SRC_PATH) -I\$(SRC_PATH)/include"
-+QEMU_CFLAGS="$QEMU_CFLAGS $CFLAGS"
- if test "$debug_info" = "yes"; then
-     CFLAGS="-g $CFLAGS"
-     LDFLAGS="-g $LDFLAGS"
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c43f1ef..72988f5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -16,7 +16,6 @@ QEMU_TARGETS ?= "arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
 SRC_URI = "\
     file://powerpc_rom.bin \
     file://no-strip.patch \
-    file://fix-configure-checks.patch \
     file://larger_default_ram_size.patch \
     "
 
@@ -28,12 +27,11 @@ SRC_URI_append_class-native = "\
     file://fix-libcap-header-issue-on-some-distro.patch \
     "
 
-EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman"
+EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman --extra-cflags='${CFLAGS}'"
 
 EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls \
 				--disable-curl \
 				"
-
 export LIBTOOL="${HOST_SYS}-libtool"
 
 do_configure_prepend_class-native() {
-- 
1.8.3.1


