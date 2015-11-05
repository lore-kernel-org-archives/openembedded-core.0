Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F022660125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:25:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Nov 2015 05:26:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,247,1444719600"; d="scan'208";a="843801019"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 05 Nov 2015 05:25:59 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Nov 2015 15:29:00 +0200
Message-Id: <824e863ff0a986c0c812f25fbe5bebcf060bde02.1446729162.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446729162.git.jussi.kukkonen@intel.com>
References: <cover.1446729162.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/6] glib-2.0: Upgrade 2.44.1 -> 2.46.1
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
X-List-Received-Date: Thu, 05 Nov 2015 13:26:01 -0000

Fix cross-compilation build issue in gio tests.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...on-t-depend-on-a-data-file-that-s-not-bui.patch | 38 ++++++++++++++++++++++
 .../{glib-2.0_2.44.1.bb => glib-2.0_2.46.1.bb}     |  5 +--
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.44.1.bb => glib-2.0_2.46.1.bb} (78%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch
new file mode 100644
index 0000000..5f3fef0
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch
@@ -0,0 +1,38 @@
+From 99dabcb02e2b3f90a12d17a9995752fcae57b522 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Thu, 5 Nov 2015 11:08:32 +0200
+Subject: [PATCH] gio/tests: Don't depend on a data file that's not built
+
+data.gresource is not built when cross-compiling: Don't
+add it to test_data in that case.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Backport [https://bugzilla.gnome.org/show_bug.cgi?id=757628]
+---
+ gio/tests/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gio/tests/Makefile.am b/gio/tests/Makefile.am
+index 894cf43..cc7deb3 100644
+--- a/gio/tests/Makefile.am
++++ b/gio/tests/Makefile.am
+@@ -76,7 +76,6 @@ dist_test_data = \
+ 	$(NULL)
+ 
+ test_data = \
+-	test.gresource				\
+ 	$(NULL)
+ 
+ uninstalled_test_extra_programs = \
+@@ -520,6 +519,8 @@ libresourceplugin_la_SOURCES = resourceplugin.c plugin_resources.c
+ libresourceplugin_la_LDFLAGS = -avoid-version -module -export-dynamic $(no_undefined)
+ libresourceplugin_la_LIBADD = $(LDADD)
+ 
++test_data += test.gresource
++
+ # libtool contains a bug whereby the created .la file doesn't contain the correct dlname='' in the case that
+ # you're building a library but not installing it.  This is apparently because the only considered use for an
+ # uninstalled library is as a convenience library for linking (despite the fact that we give -module).  The lack
+-- 
+2.6.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.44.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb
similarity index 78%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.44.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb
index 1e3d36a..22fd34a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.44.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.46.1.bb
@@ -15,9 +15,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch \
            file://allow-run-media-sdX-drive-mount-if-username-root.patch \
 	   file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
+	   file://0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch \
           "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
 
-SRC_URI[md5sum] = "83efba4722a9674b97437d1d99af79db"
-SRC_URI[sha256sum] = "8811deacaf8a503d0a9b701777ea079ca6a4277be10e3d730d2112735d5eca07"
+SRC_URI[md5sum] = "c90e93ceb45100ffc1d40ec5d2ca3248"
+SRC_URI[sha256sum] = "5a1f03b952ebc3a7e9f612b8724f70898183e31503db329b4f15d07163c8fdfb"
-- 
2.1.4


