Return-Path: <stephen.arnold42@gmail.com>
Received: from gatekeeper.gentoogeek.org (gatekeeper.gentoogeek.org
	[66.159.242.209])
	by mail.openembedded.org (Postfix) with ESMTP id 21E7C73243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 01:03:24 +0000 (UTC)
Received: from prime.arnolds.bogus (prime.arnolds.bogus [192.168.0.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by gatekeeper.gentoogeek.org (Postfix) with ESMTPS id E50492125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 18:03:24 -0700 (PDT)
Received: from ptolemy.arnolds.bogus ([::ffff:192.168.0.11])
	by prime.arnolds.bogus with ESMTP; Mon, 20 Jun 2016 18:03:18 -0700
	id 0000000000241F19.5768925C.00002C60
From: Stephen Arnold <sarnold@vctlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2016 17:54:48 -0700
Message-Id: <1466470488-947-1-git-send-email-sarnold@vctlabs.com>
X-Mailer: git-send-email 2.8.1
Cc: Stephen Arnold <nerdboy@gentoo.org>, Stephen Arnold <sarnold@vctlabs.com>
Subject: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some environment vars
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
X-List-Received-Date: Tue, 21 Jun 2016 01:03:27 -0000

The main thing is build failures with gold linker, but qemu is also a
little too aggressive at finding random tools on the build host, so we
also set the build env for qemu-native and make sure it doesn't reset
its own (hard-coded) cflags when we don't want it to.

Signed-off-by: Stephen Arnold <sarnold@vctlabs.com>

The cflags patch was imported from Gentoo Portage and has been
manitained over several versions; this version was rebased against
upstream qemu git.

Upstream-Status: Inappropriate
 - Patch addresses distribution maintenance and build environment
   sanity.

Signed-off-by: Stephen Arnold <nerdboy@gentoo.org>
---
 meta/recipes-devtools/qemu/qemu.inc                | 11 ++++++--
 .../qemu/qemu/qemu-2.6.0-cflags.patch              | 31 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.6.0.bb           |  1 +
 3 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index bf689bb..0a68f05 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -30,8 +30,10 @@ SRC_URI_append_class-native = "\
 
 EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
 
-EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror \
-				"
+EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror"
+
+EXTRA_OEMAKE_append_class-native = " LD="${TARGET_PREFIX}ld.bfd" AR="${AR}" OBJCOPY="${OBJCOPY}" LDFLAGS="${LDFLAGS}""
+
 export LIBTOOL="${HOST_SYS}-libtool"
 
 do_configure_prepend_class-native() {
@@ -40,6 +42,11 @@ do_configure_prepend_class-native() {
 	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
 		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
 	fi
+
+	# Alter target makefiles to accept CFLAGS set via env
+	sed -i -r \
+		-e 's/^(C|OP_C|HELPER_C)FLAGS=/\1FLAGS+=/' \
+		"${S}"/Makefile "${S}"/Makefile.target
 }
 
 KVMENABLE = "--enable-kvm"
diff --git a/meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch b/meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch
new file mode 100644
index 0000000..5b78edf
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch
@@ -0,0 +1,31 @@
+From 5d29baaf7a8c09f2f97231116e0f396b0402b23d Mon Sep 17 00:00:00 2001
+From: Steve Arnold <stephen.arnold42@gmail.com>
+Date: Sun, 19 Jun 2016 11:29:44 -0700
+Subject: [PATCH] configure: remove hard-coded flags and let build env handle
+ it
+
+Apply distribution patch for handling debug and fortify source options.
+
+Signed-off-by: Steve Arnold <nerdboy@gentoo.org>
+---
+ configure | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/configure b/configure
+index 10cb212..6f1b10c 100755
+--- a/configure
++++ b/configure
+@@ -4539,10 +4539,6 @@ fi
+ if test "$gcov" = "yes" ; then
+   CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
+   LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
+-elif test "$fortify_source" = "yes" ; then
+-  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
+-elif test "$debug" = "no"; then
+-  CFLAGS="-O2 $CFLAGS"
+ fi
+ 
+ ##########################################
+-- 
+2.8.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.6.0.bb b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
index e391326..62c509b 100644
--- a/meta/recipes-devtools/qemu/qemu_2.6.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
             file://no-valgrind.patch \
             file://pathlimit.patch \
+            file://qemu-2.5.0-cflags.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "ca3f70b43f093e33e9e014f144067f13"
-- 
2.8.1


