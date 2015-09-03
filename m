Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB4C76FB8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 15:32:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Sep 2015 08:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,462,1437462000"; d="scan'208";a="797539526"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2015 08:32:50 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 18:34:13 +0300
Message-Id: <f5f4a16fdb097b19fb45e9f667f59f99e9f04ef5.1441293149.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/12] gnome-icon-theme: remove the recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 15:32:50 -0000

It is not used by anything in oe-core and will be moved to meta-gnome

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../gnome/gnome-icon-theme/pkgconfig-native.patch  | 28 ----------------------
 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb | 22 -----------------
 2 files changed, 50 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/gnome-icon-theme/pkgconfig-native.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb

diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme/pkgconfig-native.patch b/meta/recipes-gnome/gnome/gnome-icon-theme/pkgconfig-native.patch
deleted file mode 100644
index 6139eab..0000000
--- a/meta/recipes-gnome/gnome/gnome-icon-theme/pkgconfig-native.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-icon-naming-utils is a native dependency so we need to use the native pkg-config
-to find it.  Simply perform the old switcheroonie on $PKG_CONFIG so
-pkg-config-native is used temporarily.
-
-Upstream-Status: Inappropriate (OE-specific)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index 6074f2c..3d38e49 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -40,6 +40,8 @@ if test "x$enable_mapping" != "xno"; then
-    UTILS_REQUIRED=0.8.7
- 
-    AC_MSG_CHECKING([icon-naming-utils >= $UTILS_REQUIRED])
-+   save_PKG_CONFIG=$PKG_CONFIG
-+   PKG_CONFIG=pkg-config-native
-    PKG_CHECK_EXISTS(icon-naming-utils >= $UTILS_REQUIRED,
-                     have_utils=yes, have_utils=no)
-    if test "x$have_utils" = "xyes"; then
-@@ -51,6 +53,7 @@ if test "x$enable_mapping" != "xno"; then
-       AC_MSG_ERROR([icon-naming-utils >= $UTILS_REQUIRED is required to build
-                     and install gnome-icon-theme])
-    fi
-+   PKG_CONFIG=save_PKG_CONFIG
- else
-    ICONMAP="false"
- fi
diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
deleted file mode 100644
index a6a3afa..0000000
--- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "GNOME 2 default icon themes"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-SECTION = "x11/gnome"
-
-LICENSE = "LGPLv3+ | CC-BY-SA-3.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e7e289d90fc8bdceed5e3f142f98229e"
-
-PR = "r5"
-
-DEPENDS = "icon-naming-utils-native intltool-native libxml-simple-perl-native"
-
-inherit allarch autotools perlnative gtk-icon-cache pkgconfig gettext
-
-SRC_URI = "${GNOME_MIRROR}/${BPN}/2.31/${BPN}-${PV}.tar.bz2 \
-           file://pkgconfig-native.patch"
-
-SRC_URI[md5sum] = "8e727703343d4c18c73c79dd2009f8ed"
-SRC_URI[sha256sum] = "ea7e05b77ead159379392b3b275ca0c9cbacd7d936014e447cc7c5e27a767982"
-
-FILES_${PN} += "${datadir}/*"
-RRECOMMENDS_${PN} += "librsvg-gtk"
-- 
2.1.4


