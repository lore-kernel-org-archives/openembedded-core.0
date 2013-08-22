Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 835BC61EC2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 15:41:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Aug 2013 08:41:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,934,1367996400"; d="scan'208";a="384973496"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.241])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2013 08:41:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 16:41:10 +0100
Message-Id: <1377186070-13173-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] gpgme: update to 1.4.3
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
X-List-Received-Date: Thu, 22 Aug 2013 15:41:48 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../gpgme/gpgme-1.4.2/disable_gpgconf_check.patch  | 39 ----------------------
 .../gpgme/gpgme-1.4.3/disable_gpgconf_check.patch  | 39 ++++++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.4.2.bb          | 29 ----------------
 meta/recipes-support/gpgme/gpgme_1.4.3.bb          | 30 +++++++++++++++++
 4 files changed, 69 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-support/gpgme/gpgme-1.4.2/disable_gpgconf_check.patch
 create mode 100644 meta/recipes-support/gpgme/gpgme-1.4.3/disable_gpgconf_check.patch
 delete mode 100644 meta/recipes-support/gpgme/gpgme_1.4.2.bb
 create mode 100644 meta/recipes-support/gpgme/gpgme_1.4.3.bb

diff --git a/meta/recipes-support/gpgme/gpgme-1.4.2/disable_gpgconf_check.patch b/meta/recipes-support/gpgme/gpgme-1.4.2/disable_gpgconf_check.patch
deleted file mode 100644
index df09530..0000000
--- a/meta/recipes-support/gpgme/gpgme-1.4.2/disable_gpgconf_check.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 1.2.0, gpgme will check if gpgconf & g13(from 1.3.0) exist, and cause
-configure failure if not founding them in cross-compile environment. We can
-add the gnupg-native to get them, but still have some issues:
-
-1. need add new package: libksba, update libassuan(not in sato), and extend
-   native support in some other packages(libgcrypt, libgpg-error, pth...)
-2. Even we have gnupg, the g13 only exist in development branch, so that we
-   still have the g13 check failure in configure.
-
-I have searched the compile log, and found gpgconf/g13 are not used. So use a
-simple method here, throw a warning mesg rather than an error here just like in
-non-cross-compile environment.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: gpgme-1.3.0/configure.ac
-===================================================================
---- gpgme-1.3.0.orig/configure.ac	2010-07-21 09:38:09.000000000 +0800
-+++ gpgme-1.3.0/configure.ac	2010-07-21 09:39:19.000000000 +0800
-@@ -574,7 +574,7 @@
- *** Could not find gpgconf, install gpgconf or use --with-gpgconf=PATH to enable it
- ***])
-     else
--      AC_MSG_ERROR([
-+      AC_MSG_WARN([
- ***
- *** Can not determine path to gpgconf when cross-compiling, use --with-gpgconf=PATH
- ***])
-@@ -670,7 +670,7 @@
- *** Could not find g13, install g13 or use --with-g13=PATH to enable it
- ***])
-     else
--      AC_MSG_ERROR([
-+      AC_MSG_WARN([
- ***
- *** Can not determine path to g13 when cross-compiling, use --with-g13=PATH
- ***])
diff --git a/meta/recipes-support/gpgme/gpgme-1.4.3/disable_gpgconf_check.patch b/meta/recipes-support/gpgme/gpgme-1.4.3/disable_gpgconf_check.patch
new file mode 100644
index 0000000..df09530
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme-1.4.3/disable_gpgconf_check.patch
@@ -0,0 +1,39 @@
+From 1.2.0, gpgme will check if gpgconf & g13(from 1.3.0) exist, and cause
+configure failure if not founding them in cross-compile environment. We can
+add the gnupg-native to get them, but still have some issues:
+
+1. need add new package: libksba, update libassuan(not in sato), and extend
+   native support in some other packages(libgcrypt, libgpg-error, pth...)
+2. Even we have gnupg, the g13 only exist in development branch, so that we
+   still have the g13 check failure in configure.
+
+I have searched the compile log, and found gpgconf/g13 are not used. So use a
+simple method here, throw a warning mesg rather than an error here just like in
+non-cross-compile environment.
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Index: gpgme-1.3.0/configure.ac
+===================================================================
+--- gpgme-1.3.0.orig/configure.ac	2010-07-21 09:38:09.000000000 +0800
++++ gpgme-1.3.0/configure.ac	2010-07-21 09:39:19.000000000 +0800
+@@ -574,7 +574,7 @@
+ *** Could not find gpgconf, install gpgconf or use --with-gpgconf=PATH to enable it
+ ***])
+     else
+-      AC_MSG_ERROR([
++      AC_MSG_WARN([
+ ***
+ *** Can not determine path to gpgconf when cross-compiling, use --with-gpgconf=PATH
+ ***])
+@@ -670,7 +670,7 @@
+ *** Could not find g13, install g13 or use --with-g13=PATH to enable it
+ ***])
+     else
+-      AC_MSG_ERROR([
++      AC_MSG_WARN([
+ ***
+ *** Can not determine path to g13 when cross-compiling, use --with-g13=PATH
+ ***])
diff --git a/meta/recipes-support/gpgme/gpgme_1.4.2.bb b/meta/recipes-support/gpgme/gpgme_1.4.2.bb
deleted file mode 100644
index 040cdf4..0000000
--- a/meta/recipes-support/gpgme/gpgme_1.4.2.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "High-level GnuPG encryption/signing API"
-DESCRIPTION = "GnuPG Made Easy (GPGME) is a library designed to make access to GnuPG easier for applications. It provides a High-Level Crypto API for encryption, decryption, signing, signature verification and key management"
-HOMEPAGE = "http://www.gnupg.org/gpgme.html"
-BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
-
-LICENSE = "GPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://src/gpgme.h.in;endline=23;md5=dccb4bb624011e36513c61ef0422d054 \
-                    file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d"
-
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
-           file://disable_gpgconf_check.patch"
-
-SRC_URI[md5sum] = "c8cb345ba7c0353e47bdf3c5c05e49be"
-SRC_URI[sha256sum] = "2c4f2bf71e53e6fb7badf07801d4248777566a621c8c2339c02c289731df6856"
-DEPENDS = "libgpg-error libassuan ${PTH}"
-PTH_libc-uclibc = "npth"
-PTH = "pth"
-
-EXTRA_OECONF = "--with-pth=${STAGING_DIR_HOST} --without-pth-test \
-                --with-gpg=${bindir}/gpg --without-gpgsm"
-
-inherit autotools binconfig
-
-PACKAGES =+ "${PN}-pth ${PN}-pthread"
-FILES_${PN}-pth = "${libdir}/libgpgme-pth.so.*"
-FILES_${PN}-pthread = "${libdir}/libgpgme-pthread.so.*"
-FILES_${PN}-dev += "${datadir}/common-lisp/source/gpgme/*"
diff --git a/meta/recipes-support/gpgme/gpgme_1.4.3.bb b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
new file mode 100644
index 0000000..aacd923
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
@@ -0,0 +1,30 @@
+SUMMARY = "High-level GnuPG encryption/signing API"
+DESCRIPTION = "GnuPG Made Easy (GPGME) is a library designed to make access to GnuPG easier for applications. It provides a High-Level Crypto API for encryption, decryption, signing, signature verification and key management"
+HOMEPAGE = "http://www.gnupg.org/gpgme.html"
+BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
+
+LICENSE = "GPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
+                    file://src/gpgme.h.in;endline=23;md5=dccb4bb624011e36513c61ef0422d054 \
+                    file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d"
+
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
+           file://disable_gpgconf_check.patch"
+
+SRC_URI[md5sum] = "334e524cffa8af4e2f43ae8afe585672"
+SRC_URI[sha256sum] = "2d1cc12411753752d9c5b9037e6fd3fd363517af720154768cc7b46b60120496"
+
+DEPENDS = "libgpg-error libassuan ${PTH}"
+PTH_libc-uclibc = "npth"
+PTH = "pth"
+
+EXTRA_OECONF = "--with-pth=${STAGING_DIR_HOST} --without-pth-test \
+                --with-gpg=${bindir}/gpg --without-gpgsm"
+
+inherit autotools binconfig
+
+PACKAGES =+ "${PN}-pth ${PN}-pthread"
+FILES_${PN}-pth = "${libdir}/libgpgme-pth.so.*"
+FILES_${PN}-pthread = "${libdir}/libgpgme-pthread.so.*"
+FILES_${PN}-dev += "${datadir}/common-lisp/source/gpgme/*"
-- 
1.8.1.2


