Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 08CAB728CB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 22:51:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2015 14:51:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,733,1413270000"; d="scan'208";a="635157225"
Received: from unknown (HELO swold-mobl5.amr.corp.intel.com) ([10.252.248.119])
	by orsmga001.jf.intel.com with ESMTP; 09 Jan 2015 14:51:52 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jan 2015 14:51:38 -0800
Message-Id: <b4808affa824d58795054f8940f16d80b048132f.1420843293.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1420843293.git.sgw@linux.intel.com>
References: <cover.1420843293.git.sgw@linux.intel.com>
In-Reply-To: <cover.1420843293.git.sgw@linux.intel.com>
References: <cover.1420843293.git.sgw@linux.intel.com>
Subject: [PATCH 1/5 v2] usbutils: Add version 008
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
X-List-Received-Date: Fri, 09 Jan 2015 22:51:57 -0000

The latest version of usbutil (v008) uses the latest version of udev (v196 or greater)
which is only available as part of the systemd package.  So add systemd as a DEPENDS and
REQUIRED_DISTRO_FEATURE.

Add v008 version of iconv.patch

COPYING file is GPLv2, but has newer formatting and address change.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/usbutils/usbutils-008/iconv.patch | 41 ++++++++++++++++++++++
 meta/recipes-bsp/usbutils/usbutils_008.bb          | 28 +++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-bsp/usbutils/usbutils-008/iconv.patch
 create mode 100644 meta/recipes-bsp/usbutils/usbutils_008.bb

diff --git a/meta/recipes-bsp/usbutils/usbutils-008/iconv.patch b/meta/recipes-bsp/usbutils/usbutils-008/iconv.patch
new file mode 100644
index 0000000..6455567
--- /dev/null
+++ b/meta/recipes-bsp/usbutils/usbutils-008/iconv.patch
@@ -0,0 +1,41 @@
+This patch adds support for detecting iconv support using autotools
+uclibc does not have iconv implementation inside libc like glibc, therefore
+the existing checks were not sufficient, it worked for glibc but not for
+uclibc. The new patch portably detects the iconv support and adds the
+libiconv to linker cmdline
+
+This patch should be submitted upstream too
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: usbutils-008/configure.ac
+===================================================================
+--- usbutils-008.orig/configure.ac
++++ usbutils-008/configure.ac
+@@ -10,7 +10,9 @@ AC_USE_SYSTEM_EXTENSIONS
+ AC_SYS_LARGEFILE
+ 
+ AC_CHECK_HEADERS([byteswap.h])
+-AC_CHECK_FUNCS([nl_langinfo iconv])
++
++AM_GNU_GETTEXT
++AM_ICONV
+ 
+ PKG_CHECK_MODULES(LIBUSB, libusb-1.0 >= 1.0.0)
+ 
+Index: usbutils-008/Makefile.am
+===================================================================
+--- usbutils-008.orig/Makefile.am
++++ usbutils-008/Makefile.am
+@@ -29,7 +29,8 @@ lsusb_CPPFLAGS = \
+ 
+ lsusb_LDADD = \
+ 	$(LIBUSB_LIBS) \
+-	$(UDEV_LIBS)
++	$(UDEV_LIBS) \
++	$(LIBICONV)
+ 
+ man_MANS = \
+ 	lsusb.8	\
diff --git a/meta/recipes-bsp/usbutils/usbutils_008.bb b/meta/recipes-bsp/usbutils/usbutils_008.bb
new file mode 100644
index 0000000..b032d4e
--- /dev/null
+++ b/meta/recipes-bsp/usbutils/usbutils_008.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Host side USB console utilities"
+DESCRIPTION = "Contains the lsusb utility for inspecting the devices connected to the USB bus."
+HOMEPAGE = "http://www.linux-usb.org"
+SECTION = "base"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "libusb zlib virtual/libiconv systemd"
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
+           file://usb-devices-avoid-dependency-on-bash.patch \
+           file://Fix-NULL-pointer-crash.patch \
+           file://iconv.patch \
+          "
+
+RC_URI[md5sum] = "cb20148c2e784577e924a7b4c560c8fb"
+SRC_URI[sha256sum] = "6d5f16c2961df37e22e492c736a3e162a8fde24480f23a40d85f79af80d3fe95"
+
+inherit autotools gettext pkgconfig distro_features_check
+# This version of usbutils relies on the udev from systemd, so unless 
+# we can decouple udev from system, we require systemd for now.
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+FILES_${PN}-dev += "${datadir}/pkgconfig"
+
+RDEPENDS_${PN} = "libudev"
+RDEPENDS_${PN}-ptest = "libboost-system libboost-thread"
-- 
2.1.0


