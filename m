Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 631BD72F50
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 11:08:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2017 03:08:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,225,1484035200"; d="scan'208";a="1136433824"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 01 Mar 2017 03:08:23 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 13:07:22 +0200
Message-Id: <20170301110722.10260-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libgpg-error: correctly configure on mips64
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
X-List-Received-Date: Wed, 01 Mar 2017 11:08:24 -0000

This fixes the long-standing error:

../../libgpg-error-1.26/src/posix-lock.c:137: get_lock_object: Assertion `!"sizeof lock obj"' failed.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gcr/gcr_3.20.0.bb                   | 4 ----
 meta/recipes-gnome/libsecret/libsecret_0.18.5.bb       | 5 -----
 meta/recipes-sato/webkit/webkitgtk_2.14.5.bb           | 5 -----
 meta/recipes-support/libgpg-error/libgpg-error_1.26.bb | 2 ++
 4 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.20.0.bb b/meta/recipes-gnome/gcr/gcr_3.20.0.bb
index 20889021a57..f31abced02e 100644
--- a/meta/recipes-gnome/gcr/gcr_3.20.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.20.0.bb
@@ -36,7 +36,3 @@ ARM_INSTRUCTION_SET = "arm"
 #
 # This will be investigated later.
 EXTRA_OECONF_append_x86-64 = " --disable-introspection --disable-gtk-doc"
-
-# Gcr-3.broken: poky/build-mips64/tmp/work/mips64-poky-linux/libgpg-error/1.19-r0/libgpg-error-1.19/src/posix-lock.c:119: get_lock_object: Assertion `!"sizeof lock obj"' failed.
-# qemu: uncaught target signal 6 (Aborted) - core dumped
-EXTRA_OECONF_append_mips64 = " --disable-introspection --disable-gtk-doc"
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.5.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.5.bb
index 77b9fd5be50..2b917ec517b 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.5.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.5.bb
@@ -18,8 +18,3 @@ ARM_INSTRUCTION_SET = "arm"
 do_configure_prepend() {
     rm -f ${S}/build/m4/vapigen.m4
 }
-
-# Secret-1: poky/build-mips64/tmp/work/mips64-poky-linux/libgpg-error/1.19-r0/libgpg-error-1.19/src/posix-lock.c:119: get_lock_object: Assertion `!"sizeof lock obj"' failed.
-# qemu: uncaught target signal 6 (Aborted) - core dumped
-EXTRA_OECONF_append_mips64 = " --disable-introspection --disable-gtk-doc"
-
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.14.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.14.5.bb
index 5fb07da26d9..1eb5b0b6e1d 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.14.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.14.5.bb
@@ -111,8 +111,3 @@ ARM_INSTRUCTION_SET_armv6 = "arm"
 ARM_INSTRUCTION_SET_armv7a = "thumb"
 ARM_INSTRUCTION_SET_armv7r = "thumb"
 ARM_INSTRUCTION_SET_armv7ve = "thumb"
-
-# WebKit2-4.0: ../../libgpg-error-1.21/src/posix-lock.c:119: get_lock_object: Assertion `!"sizeof lock obj"' failed.
-# qemu: uncaught target signal 6 (Aborted) - core dumped
-EXTRA_OECMAKE_append_mipsarchn32 = " -DENABLE_INTROSPECTION=OFF -DENABLE_GTKDOC=OFF"
-EXTRA_OECMAKE_append_mipsarchn64 = " -DENABLE_INTROSPECTION=OFF -DENABLE_GTKDOC=OFF"
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.26.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.26.bb
index 87c4f5185b4..b9e3b0065ce 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.26.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.26.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
 
 SRC_URI[md5sum] = "97456709dbbcbb69354317ffe3e347cd"
 SRC_URI[sha256sum] = "4c4bcbc90116932e3acd37b37812d8653b1b189c1904985898e860af818aee69"
+PR = "r1"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
@@ -34,6 +35,7 @@ do_compile_prepend() {
 	  arm)	      TUPLE=arm-unknown-linux-gnueabi ;;
 	  armeb)      TUPLE=arm-unknown-linux-gnueabi ;;
 	  i586|i686)  TUPLE=i686-pc-linux-gnu ;;
+	  mips64*)    TUPLE=mips64el-unknown-linux-gnuabi64 ;;
 	  mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
 	  mips*)      TUPLE=mips-unknown-linux-gnu ;;
 	  x86_64)     TUPLE=x86_64-pc-linux-gnu ;;
-- 
2.11.0


