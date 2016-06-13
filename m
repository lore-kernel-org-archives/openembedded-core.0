Return-Path: <stephen.arnold42@gmail.com>
Received: from gatekeeper.gentoogeek.org (gatekeeper.gentoogeek.org
	[66.159.242.209])
	by mail.openembedded.org (Postfix) with ESMTP id 98F4860290
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 01:18:23 +0000 (UTC)
Received: from prime.arnolds.bogus (prime.arnolds.bogus [192.168.0.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by gatekeeper.gentoogeek.org (Postfix) with ESMTPS id 723B32047
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 18:18:22 -0700 (PDT)
Received: from ptolemy.arnolds.bogus ([::ffff:192.168.0.11])
	by prime.arnolds.bogus with ESMTP; Sun, 12 Jun 2016 18:18:15 -0700
	id 0000000000241FF7.575E09DE.00002312
From: Stephen Arnold <sarnold@vctlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jun 2016 18:09:56 -0700
Message-Id: <1465780196-7491-1-git-send-email-sarnold@vctlabs.com>
X-Mailer: git-send-email 2.8.1
Cc: Stephen Arnold <sarnold@vctlabs.com>
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
X-List-Received-Date: Mon, 13 Jun 2016 01:18:25 -0000

The main thing is build failures with gold linker, but qemu is also a
little too aggressive at finding random tools on the build host, so we
also set the build env for qemu-native and make sure it doesn't reset
its own (hard-coded) cflags when we don't want it to.

Signed-off-by: Stephen Arnold <sarnold@vctlabs.com>
---
 meta/recipes-devtools/qemu/qemu.inc                     | 13 +++++++++++--
 meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch | 13 +++++++++++++
 meta/recipes-devtools/qemu/qemu_2.6.0.bb                |  4 +++-
 3 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index bf689bb..d5925fd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -30,8 +30,12 @@ SRC_URI_append_class-native = "\
 
 EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
 
-EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror \
-				"
+EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror"
+
+EXTRA_OEMAKE_append_class-native = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
+
+LDFLAGS_append_class-native = " -fuse-ld=bfd"
+
 export LIBTOOL="${HOST_SYS}-libtool"
 
 do_configure_prepend_class-native() {
@@ -40,6 +44,11 @@ do_configure_prepend_class-native() {
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
diff --git a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
new file mode 100644
index 0000000..173394f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
@@ -0,0 +1,13 @@
+--- a/configure
++++ b/configure
+@@ -4468,10 +4468,6 @@ fi
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
diff --git a/meta/recipes-devtools/qemu/qemu_2.6.0.bb b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
index e391326..735d013 100644
--- a/meta/recipes-devtools/qemu/qemu_2.6.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
@@ -8,7 +8,9 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
             file://no-valgrind.patch \
             file://pathlimit.patch \
-           "
+            file://qemu-2.5.0-cflags.patch \
+"
+
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "ca3f70b43f093e33e9e014f144067f13"
 SRC_URI[sha256sum] = "c9ac4a651b273233d21b8bec32e30507cb9cce7900841febc330956a1a8434ec"
-- 
2.8.1


