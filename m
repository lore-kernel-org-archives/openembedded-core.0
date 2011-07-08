Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qf0M0-0005pQ-8G
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 03:59:40 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jul 2011 18:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,496,1304319600"; d="scan'208";a="25218652"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by fmsmga002.fm.intel.com with ESMTP; 07 Jul 2011 18:55:46 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 10:11:53 +0800
Message-Id: <b28512c7dab41e5da535c700642206770694e678.1310090994.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1310090994.git.dongxiao.xu@intel.com>
References: <cover.1310090994.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1310090994.git.dongxiao.xu@intel.com>
References: <cover.1310090994.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/2] fltk: add this recipe for alsa-tools build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jul 2011 01:59:40 -0000

alsa-tools has dependency on fltk.
Import this recipe from open-embedded.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../fltk/fltk-1.1.10/disable_test.patch            |   18 +++++++++
 meta/recipes-multimedia/fltk/fltk_1.1.10.bb        |   38 ++++++++++++++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-multimedia/fltk/fltk-1.1.10/disable_test.patch
 create mode 100644 meta/recipes-multimedia/fltk/fltk_1.1.10.bb

diff --git a/meta/recipes-multimedia/fltk/fltk-1.1.10/disable_test.patch b/meta/recipes-multimedia/fltk/fltk-1.1.10/disable_test.patch
new file mode 100644
index 0000000..0221503
--- /dev/null
+++ b/meta/recipes-multimedia/fltk/fltk-1.1.10/disable_test.patch
@@ -0,0 +1,18 @@
+Disable the test component.
+Derived from OE.
+
+Upstream-Status: Inappropriate [configuration]
+
+Index: fltk-1.1.9/Makefile
+===================================================================
+--- fltk-1.1.9.orig/Makefile	2008-06-06 16:14:11.936736201 +0200
++++ fltk-1.1.9/Makefile	2008-06-06 16:14:22.526357637 +0200
+@@ -27,7 +27,7 @@
+ 
+ include makeinclude
+ 
+-DIRS	=	$(IMAGEDIRS) src fluid test documentation
++DIRS	=	$(IMAGEDIRS) src fluid documentation
+ 
+ all: makeinclude fltk-config
+ 	for dir in $(DIRS); do\
diff --git a/meta/recipes-multimedia/fltk/fltk_1.1.10.bb b/meta/recipes-multimedia/fltk/fltk_1.1.10.bb
new file mode 100644
index 0000000..bd25344
--- /dev/null
+++ b/meta/recipes-multimedia/fltk/fltk_1.1.10.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "FLTK is a cross-platform C++ GUI toolkit"
+HOMEPAGE = "http://www.fltk.org"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPL"
+DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1c0b73db66884b6a925e727400315130"
+
+PR = "r0"
+
+SRC_URI = "http://ftp.easysw.com/ftp/pub/fltk/${PV}/fltk-${PV}-source.tar.bz2 \
+	   file://disable_test.patch \
+	  "
+
+S = "${WORKDIR}/fltk-${PV}"
+
+inherit lib_package autotools binconfig
+
+TARGET_CC_ARCH += "${LDFLAGS} -DXFT_MAJOR=2"
+
+EXTRA_OECONF = "--enable-shared \
+		--enable-threads \
+		--enable-xdbe --enable-xft --enable-gl \
+		--x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR}"
+
+do_configure() {
+        oe_runconf
+}
+
+python populate_packages_prepend () {
+        if (bb.data.getVar('DEBIAN_NAMES', d, 1)):
+                bb.data.setVar('PKG_${PN}', 'libfltk${PV}', d)
+}
+
+LEAD_SONAME = "libfltk.so"
+
+SRC_URI[md5sum] = "a1765594bc427ff892e36089fe1fa672"
+SRC_URI[sha256sum] = "37ada22bf2586b8dd30d84209b8b58bdcb864627e5d02ae3f2c323a29261b19a"
-- 
1.7.1



