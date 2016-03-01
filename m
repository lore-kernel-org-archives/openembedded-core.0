Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D1F457319C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 02:53:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 29 Feb 2016 18:53:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,521,1449561600"; d="scan'208";a="898065715"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga001.jf.intel.com with ESMTP; 29 Feb 2016 18:53:14 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 02:53:18 +0000
Message-Id: <139e23b946cbf69b379b42b67a03315b2b2bdad2.1456800675.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1456800675.git.alejandro.hernandez@linux.intel.com>
References: <cover.1456800675.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 3/4] usbutils: Fix for new eudev implementation
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
X-List-Received-Date: Tue, 01 Mar 2016 02:53:14 -0000

usbutils was only compatible with systemds udev, since we now
provide a udev alternative compatible with upstream systemds udev,
we can now use the newer version of usbutils along with it too.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-bsp/usbutils/usbutils-008/iconv.patch | 41 ----------------------
 meta/recipes-bsp/usbutils/usbutils/iconv.patch     | 29 +++++++--------
 meta/recipes-bsp/usbutils/usbutils_007.bb          | 31 ----------------
 meta/recipes-bsp/usbutils/usbutils_008.bb          |  5 +--
 4 files changed, 16 insertions(+), 90 deletions(-)
 delete mode 100644 meta/recipes-bsp/usbutils/usbutils-008/iconv.patch
 delete mode 100644 meta/recipes-bsp/usbutils/usbutils_007.bb

diff --git a/meta/recipes-bsp/usbutils/usbutils-008/iconv.patch b/meta/recipes-bsp/usbutils/usbutils-008/iconv.patch
deleted file mode 100644
index 6455567..0000000
--- a/meta/recipes-bsp/usbutils/usbutils-008/iconv.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-This patch adds support for detecting iconv support using autotools
-uclibc does not have iconv implementation inside libc like glibc, therefore
-the existing checks were not sufficient, it worked for glibc but not for
-uclibc. The new patch portably detects the iconv support and adds the
-libiconv to linker cmdline
-
-This patch should be submitted upstream too
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: usbutils-008/configure.ac
-===================================================================
---- usbutils-008.orig/configure.ac
-+++ usbutils-008/configure.ac
-@@ -10,7 +10,9 @@ AC_USE_SYSTEM_EXTENSIONS
- AC_SYS_LARGEFILE
- 
- AC_CHECK_HEADERS([byteswap.h])
--AC_CHECK_FUNCS([nl_langinfo iconv])
-+
-+AM_GNU_GETTEXT
-+AM_ICONV
- 
- PKG_CHECK_MODULES(LIBUSB, libusb-1.0 >= 1.0.0)
- 
-Index: usbutils-008/Makefile.am
-===================================================================
---- usbutils-008.orig/Makefile.am
-+++ usbutils-008/Makefile.am
-@@ -29,7 +29,8 @@ lsusb_CPPFLAGS = \
- 
- lsusb_LDADD = \
- 	$(LIBUSB_LIBS) \
--	$(UDEV_LIBS)
-+	$(UDEV_LIBS) \
-+	$(LIBICONV)
- 
- man_MANS = \
- 	lsusb.8	\
diff --git a/meta/recipes-bsp/usbutils/usbutils/iconv.patch b/meta/recipes-bsp/usbutils/usbutils/iconv.patch
index c557334..6455567 100644
--- a/meta/recipes-bsp/usbutils/usbutils/iconv.patch
+++ b/meta/recipes-bsp/usbutils/usbutils/iconv.patch
@@ -10,10 +10,10 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: usbutils-007/configure.ac
+Index: usbutils-008/configure.ac
 ===================================================================
---- usbutils-007.orig/configure.ac
-+++ usbutils-007/configure.ac
+--- usbutils-008.orig/configure.ac
++++ usbutils-008/configure.ac
 @@ -10,7 +10,9 @@ AC_USE_SYSTEM_EXTENSIONS
  AC_SYS_LARGEFILE
  
@@ -23,18 +23,19 @@ Index: usbutils-007/configure.ac
 +AM_GNU_GETTEXT
 +AM_ICONV
  
- AC_ARG_ENABLE(zlib,
- 	AS_HELP_STRING(--disable-zlib,disable support for zlib))
-Index: usbutils-007/Makefile.am
+ PKG_CHECK_MODULES(LIBUSB, libusb-1.0 >= 1.0.0)
+ 
+Index: usbutils-008/Makefile.am
 ===================================================================
---- usbutils-007.orig/Makefile.am
-+++ usbutils-007/Makefile.am
-@@ -27,7 +27,7 @@ lsusb_CPPFLAGS = \
- 	-DDATADIR=\"$(datadir)\"
+--- usbutils-008.orig/Makefile.am
++++ usbutils-008/Makefile.am
+@@ -29,7 +29,8 @@ lsusb_CPPFLAGS = \
  
  lsusb_LDADD = \
--	$(LIBUSB_LIBS)
-+	$(LIBUSB_LIBS) $(LIBICONV)
+ 	$(LIBUSB_LIBS) \
+-	$(UDEV_LIBS)
++	$(UDEV_LIBS) \
++	$(LIBICONV)
  
- if HAVE_ZLIB
- lsusb_CPPFLAGS += -DHAVE_LIBZ
+ man_MANS = \
+ 	lsusb.8	\
diff --git a/meta/recipes-bsp/usbutils/usbutils_007.bb b/meta/recipes-bsp/usbutils/usbutils_007.bb
deleted file mode 100644
index b93b2bd..0000000
--- a/meta/recipes-bsp/usbutils/usbutils_007.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Host side USB console utilities"
-DESCRIPTION = "Contains the lsusb utility for inspecting the devices connected to the USB bus."
-HOMEPAGE = "http://www.linux-usb.org"
-SECTION = "base"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-DEPENDS = "libusb zlib virtual/libiconv"
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
-           file://usb-devices-avoid-dependency-on-bash.patch \
-           file://Fix-NULL-pointer-crash.patch \
-           file://iconv.patch \
-          "
-
-SRC_URI[md5sum] = "be6c42294be5c940f208190d3479d50c"
-SRC_URI[sha256sum] = "e65c234cadf7c81b6b1567c440e3b9b31b44f51c27df3e45741b88848d8b37d3"
-
-inherit autotools gettext pkgconfig
-
-do_install_append() {
-	# We only need the compressed copy, remove the uncompressed version
-	rm -f ${D}${datadir}/usb.ids
-}
-
-PACKAGES += "${PN}-ids"
-FILES_${PN}-dev += "${datadir}/pkgconfig"
-FILES_${PN}-ids = "${datadir}/usb*"
-
-RDEPENDS_${PN} = "${PN}-ids"
diff --git a/meta/recipes-bsp/usbutils/usbutils_008.bb b/meta/recipes-bsp/usbutils/usbutils_008.bb
index 0f2d8d4..75312c3 100644
--- a/meta/recipes-bsp/usbutils/usbutils_008.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_008.bb
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "libusb zlib virtual/libiconv systemd"
+DEPENDS = "libusb zlib virtual/libiconv udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
            file://usb-devices-avoid-dependency-on-bash.patch \
@@ -18,9 +18,6 @@ SRC_URI[md5sum] = "cb20148c2e784577e924a7b4c560c8fb"
 SRC_URI[sha256sum] = "6d5f16c2961df37e22e492c736a3e162a8fde24480f23a40d85f79af80d3fe95"
 
 inherit autotools gettext pkgconfig distro_features_check
-# This version of usbutils relies on the udev from systemd, so unless 
-# we can decouple udev from system, we require systemd for now.
-REQUIRED_DISTRO_FEATURES = "systemd"
 
 FILES_${PN}-dev += "${datadir}/pkgconfig"
 
-- 
2.6.2


