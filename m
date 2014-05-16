Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 41B3F65FE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 20:50:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2014 13:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1069,1389772800"; d="scan'208";a="512966351"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.101])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2014 13:50:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 May 2014 13:50:45 -0700
Message-Id: <1400273445-15060-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] libusb1: disable floating dependency on udev
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
X-List-Received-Date: Fri, 16 May 2014 20:50:50 -0000

libusb added support for udev, but this causes a circular dependecny between
udev and libusb, so hardcode the disable here.

Also remove the patch that is no longer used.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libusb/libusb1/obsolete_automake_macros.patch         | 15 ---------------
 meta/recipes-support/libusb/libusb1_1.0.18.bb             |  4 +++-
 2 files changed, 3 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patch

diff --git a/meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patch b/meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patch
deleted file mode 100644
index b1dd66c..0000000
--- a/meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Submitted [https://libusb.org/ticket/159]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd libusb-1.0.9/configure.ac libusb-1.0.9/configure.ac
---- libusb-1.0.9/configure.ac	2012-04-20 09:44:27.000000000 +0300
-+++ libusb-1.0.9/configure.ac	2013-01-02 16:36:44.152121483 +0200
-@@ -31,7 +31,7 @@
-
- AC_CONFIG_SRCDIR([libusb/core.c])
- AC_CONFIG_MACRO_DIR([m4])
--AM_CONFIG_HEADER([config.h])
-+AC_CONFIG_HEADERS([config.h])
- m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES([yes])])
-
- AC_PREREQ([2.50])
diff --git a/meta/recipes-support/libusb/libusb1_1.0.18.bb b/meta/recipes-support/libusb/libusb1_1.0.18.bb
index c64f1db..395145a 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.18.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.18.bb
@@ -18,7 +18,9 @@ S = "${WORKDIR}/libusb-${PV}"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--libdir=${base_libdir}"
+# Don't configure udev by default since it will cause a circular
+# dependecy with udev package, which depends on libusb
+EXTRA_OECONF = "--libdir=${base_libdir} --disable-udev"
 
 do_install_append() {
 	install -d ${D}${libdir}
-- 
1.8.3.1


