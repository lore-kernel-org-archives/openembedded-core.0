Return-Path: <stephen.arnold42@gmail.com>
X-Greylist: delayed 331 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Jun 2016 00:14:12 UTC
Received: from gatekeeper.gentoogeek.org (gatekeeper.gentoogeek.org
	[66.159.242.209])
	by mail.openembedded.org (Postfix) with ESMTP id 6130A60745
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 00:14:12 +0000 (UTC)
Received: from prime.arnolds.bogus (prime.arnolds.bogus [192.168.0.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by gatekeeper.gentoogeek.org (Postfix) with ESMTPS id 04BEA2047
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 17:08:37 -0700 (PDT)
Received: from ptolemy.arnolds.bogus (ptolemy.arnolds.bogus
	[::ffff:192.168.0.11])
	by prime.arnolds.bogus with ESMTP; Tue, 07 Jun 2016 17:08:34 -0700
	id 0000000000241F0D.57576205.00003C38
From: Stephen Arnold <sarnold@vctlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 17:00:33 -0700
Message-Id: <1465344033-21973-1-git-send-email-sarnold@vctlabs.com>
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
X-List-Received-Date: Wed, 08 Jun 2016 00:14:13 -0000

The main thing is build failures with gold linker, but qemu is also a
little too aggressive at finding random tools on the build host, so we
also set the build env for qemu-native and make sure it doesn't reset
its own (hard-coded) cflags when we don't want it to.

Signed-off-by: Stephen Arnold <sarnold@vctlabs.com>
---
 meta/recipes-devtools/qemu/qemu.inc                     | 13 +++++++++++--
 meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch | 13 +++++++++++++
 meta/recipes-devtools/qemu/qemu_2.5.0.bb                |  1 +
 3 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 95fe66f..87c9f75 100644
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
diff --git a/meta/recipes-devtools/qemu/qemu_2.5.0.bb b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
index 03a6cbe..97ad743 100644
--- a/meta/recipes-devtools/qemu/qemu_2.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
@@ -16,6 +16,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://rng_remove_the_unused_request_cancellation_code.patch \
             file://rng_move_request_queue_cleanup_from_RngEgd_to_RngBackend.patch \
             file://CVE-2016-2858.patch \
+            file://qemu-2.5.0-cflags.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f469f2330bbe76e3e39db10e9ac4f8db"
-- 
2.8.1


