Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 971AD772EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:44:03 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:44:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599686858"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:44:03 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:46:56 +0200
Message-Id: <591dd18780f0c60456b6f8ee54ee27cc9cf4cc94.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
References: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 11/19] libxcb: Remove unused git-version of the recipe
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
X-List-Received-Date: Fri, 13 Nov 2015 09:44:03 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxcb.inc       | 30 ------------------------
 meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb | 31 +++++++++++++++++++++----
 meta/recipes-graphics/xorg-lib/libxcb_git.bb    | 10 --------
 3 files changed, 27 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb.inc
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb_git.bb

diff --git a/meta/recipes-graphics/xorg-lib/libxcb.inc b/meta/recipes-graphics/xorg-lib/libxcb.inc
deleted file mode 100644
index fe31f20..0000000
--- a/meta/recipes-graphics/xorg-lib/libxcb.inc
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "XCB: The X protocol C binding library"
-DESCRIPTION = "The X protocol C-language Binding (XCB) is a replacement \
-for Xlib featuring a small footprint, latency hiding, direct access to \
-the protocol, improved threading support, and extensibility."
-HOMEPAGE = "http://xcb.freedesktop.org"
-BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=XCB"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SECTION = "x11/libs"
-LICENSE = "MIT-X"
-
-DEPENDS = "xcb-proto xproto libxau xcb-proto-native libpthread-stubs"
-
-SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2 \
-           file://xcbincludedir.patch \
-           file://disable-check.patch"
-
-PACKAGES_DYNAMIC = "^libxcb-.*"
-
-FILES_${PN} = "${libdir}/libxcb.so.*"
-
-inherit autotools pkgconfig pythonnative distro_features_check
-
-# The libxau and others requires x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES = "x11"
-
-python populate_packages_prepend () {
-    do_split_packages(d, '${libdir}', '^libxcb-(.*)\.so\..*$', 'libxcb-%s', 'XCB library module for %s', allow_links=True)
-}
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb
index 23a83ef..1f4852d 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb
@@ -1,10 +1,33 @@
-include libxcb.inc
+SUMMARY = "XCB: The X protocol C binding library"
+DESCRIPTION = "The X protocol C-language Binding (XCB) is a replacement \
+for Xlib featuring a small footprint, latency hiding, direct access to \
+the protocol, improved threading support, and extensibility."
+HOMEPAGE = "http://xcb.freedesktop.org"
+BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=XCB"
+SECTION = "x11/libs"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
-
-DEPENDS += "libxdmcp"
-
+SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2 \
+           file://xcbincludedir.patch \
+           file://disable-check.patch"
 SRC_URI[md5sum] = "f97a65e6158775de518ac391935634c2"
 SRC_URI[sha256sum] = "b720fd6c7d200e5371affdb3f049cc8f88cff9aed942ff1b824d95eedbf69d30"
+
+BBCLASSEXTEND = "native nativesdk"
+
+DEPENDS = "xcb-proto xproto libxau xcb-proto-native libpthread-stubs libxdmcp"
+
+PACKAGES_DYNAMIC = "^libxcb-.*"
+
+FILES_${PN} = "${libdir}/libxcb.so.*"
+
+inherit autotools pkgconfig pythonnative distro_features_check
+
+# The libxau and others requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
+
+python populate_packages_prepend () {
+    do_split_packages(d, '${libdir}', '^libxcb-(.*)\.so\..*$', 'libxcb-%s', 'XCB library module for %s', allow_links=True)
+}
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_git.bb b/meta/recipes-graphics/xorg-lib/libxcb_git.bb
deleted file mode 100644
index 186636e..0000000
--- a/meta/recipes-graphics/xorg-lib/libxcb_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DEFAULT_PREFERENCE = "-1"
-
-include libxcb.inc
-
-SRCREV = "625ed596cae6dd8175aeb6cb6f26784928042f22"
-PV = "1.1.90.1+gitr${SRCPV}"
-PR = "r1"
-
-SRC_URI = "git://anongit.freedesktop.org/git/xcb/libxcb"
-S = "${WORKDIR}/git"
-- 
2.1.4


