Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA8D781FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 12:25:38 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jul 2017 05:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,359,1496127600"; d="scan'208";a="878888013"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jul 2017 05:25:37 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id CAC025807D9;
	Fri, 14 Jul 2017 05:25:36 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jul 2017 15:25:24 +0300
Message-Id: <18410237c5d66f4433b8d57baf56d4a7c80ff4b7.1500034432.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1500034432.git.jussi.kukkonen@intel.com>
References: <cover.1500034432.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/4] python3-pygobject: Don't use gnome-common
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
X-List-Received-Date: Fri, 14 Jul 2017 12:25:42 -0000

Patch out the one use of gnome-common macros: pygobject is moving to
autoconf-archive in next release so this patch is temporary.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...onfigure.ac-Don-t-use-gnome-common-macros.patch | 33 ++++++++++++++++++++++
 .../python/python3-pygobject_3.24.1.bb             |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pygobject/0001-configure.ac-Don-t-use-gnome-common-macros.patch

diff --git a/meta/recipes-devtools/python/python3-pygobject/0001-configure.ac-Don-t-use-gnome-common-macros.patch b/meta/recipes-devtools/python/python3-pygobject/0001-configure.ac-Don-t-use-gnome-common-macros.patch
new file mode 100644
index 0000000..aaedb58
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pygobject/0001-configure.ac-Don-t-use-gnome-common-macros.patch
@@ -0,0 +1,33 @@
+From 206360744cedff20eae3c8fcfde9938fdae99592 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Thu, 6 Jul 2017 11:47:21 +0300
+Subject: [PATCH] configure.ac: Don't use gnome-common macros
+
+remove GNOME_COMPILE_WARNINGS() call: it's from gnome-common which
+is deprecated.
+
+This patch can be removed when upgrading to 3.25.1: at that point
+pygobject needs autoconf-archive instead.
+
+Upstream-Status: Inappropriate [Already handled upstream]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.ac | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1f15b3c..5cb170f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -221,8 +221,6 @@ AC_ARG_WITH(common,
+     with_common=yes)
+ AM_CONDITIONAL(WITH_COMMON, test "$with_common" = "yes")
+ 
+-# compiler warnings, errors, required cflags, and code coverage support
+-GNOME_COMPILE_WARNINGS([maximum], [-Wno-error=missing-prototypes])
+ AC_MSG_CHECKING(for Gnome code coverage support)
+ m4_ifdef([GNOME_CODE_COVERAGE],
+          [AC_MSG_RESULT(yes)
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/python/python3-pygobject_3.24.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.24.1.bb
index 5795ae3..9d10af2 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.24.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.24.1.bb
@@ -5,12 +5,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 inherit autotools pkgconfig gnomebase distutils3-base gobject-introspection upstream-version-is-even
 
-DEPENDS += "gnome-common-native python3 glib-2.0"
+DEPENDS += "python3 glib-2.0"
 
 SRCNAME="pygobject"
 SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
     file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \
+    file://0001-configure.ac-Don-t-use-gnome-common-macros.patch \
 "
 
 SRC_URI[md5sum] = "69a843311d0f0385dff376e11a2d83d2"
-- 
2.1.4


