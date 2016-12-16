Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3A728773A7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 14:57:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 16 Dec 2016 06:57:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,358,1477983600"; d="scan'208";a="798732350"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Dec 2016 06:57:31 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2016 16:57:28 +0200
Message-Id: <20161216145728.1070-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] libfm: fix configure error if native vala is absent
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
X-List-Received-Date: Fri, 16 Dec 2016 14:57:32 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...heck-the-stamp-file-that-indicates-if-we-.patch | 28 ++++++++++++++++++++++
 meta/recipes-support/libfm/libfm_1.2.5.bb          |  3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libfm/libfm/0001-Correctly-check-the-stamp-file-that-indicates-if-we-.patch

diff --git a/meta/recipes-support/libfm/libfm/0001-Correctly-check-the-stamp-file-that-indicates-if-we-.patch b/meta/recipes-support/libfm/libfm/0001-Correctly-check-the-stamp-file-that-indicates-if-we-.patch
new file mode 100644
index 0000000..fb91d90
--- /dev/null
+++ b/meta/recipes-support/libfm/libfm/0001-Correctly-check-the-stamp-file-that-indicates-if-we-.patch
@@ -0,0 +1,28 @@
+From 23c6e9df611c86a5e97079e1b88c7a18474bf0bc Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 16 Dec 2016 16:52:04 +0200
+Subject: [PATCH] Correctly check the stamp file that indicates if we need to
+ re-build vala code
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d043b3d..0e85590 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -42,7 +42,7 @@ AM_COND_IF(EXTRALIB_ONLY,
+     [enable_actions=no])
+ if test x"$enable_actions" = xyes; then
+     dnl no vala compiler required when sources are from dist tarball
+-    if test -f src/actions/libfmactions_la_vala.stamp; then
++    if test -f $srcdir/src/actions/libfmactions_la_vala.stamp; then
+         AM_PROG_VALAC
+     else
+         AM_PROG_VALAC([0.13.0])
+-- 
+2.10.2
+
diff --git a/meta/recipes-support/libfm/libfm_1.2.5.bb b/meta/recipes-support/libfm/libfm_1.2.5.bb
index 638c364..aca59e1 100644
--- a/meta/recipes-support/libfm/libfm_1.2.5.bb
+++ b/meta/recipes-support/libfm/libfm_1.2.5.bb
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4641e94ec96f98fabc56ff9cc48be14b \
 SECTION = "x11/libs"
 DEPENDS = "glib-2.0 pango gtk+3 menu-cache intltool-native libexif libfm-extra gettext-native"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
+           file://0001-Correctly-check-the-stamp-file-that-indicates-if-we-.patch"
 
 SRC_URI[md5sum] = "a1ba9ae5e920f38b647dd511edd6c807"
 SRC_URI[sha256sum] = "c706bb1020cf5f2d6f5a9226f692ce1985947134dcf2bde64278bd0420779b5a"
-- 
2.10.2


