Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 800B67488C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 11:46:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2018 04:46:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,410,1520924400"; d="scan'208";a="229395390"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 17 May 2018 04:46:08 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2018 14:38:31 +0300
Message-Id: <20180517113837.24240-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180517113837.24240-1-alexander.kanavin@linux.intel.com>
References: <20180517113837.24240-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/10] gnome-desktop3: remove the recipe
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
X-List-Received-Date: Thu, 17 May 2018 11:46:11 -0000

Epiphany no longer needs it, nothing else does,
and so it will be moved to meta-oe.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../epiphany/epiphany_3.28.1.1.bb             |  2 +-
 ...ibseccomp-sycall-filtering-mechanism.patch | 45 --------------
 ...humbnail-don-t-assume-time_t-is-long.patch | 61 -------------------
 .../gnome-desktop/gnome-desktop3_3.28.1.bb    | 28 ---------
 5 files changed, 1 insertion(+), 136 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-Disable-libseccomp-sycall-filtering-mechanism.patch
 delete mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch
 delete mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.28.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 7787a2c1378..6d6c148de88 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -206,7 +206,6 @@ RECIPE_MAINTAINER_pn-glide = "Otavio Salvador <otavio.salvador@ossystems.com.br>
 RECIPE_MAINTAINER_pn-gmp = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gnome-common = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gnome-desktop-testing = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-gnome-desktop3 = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-gnome-doc-utils = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gnome-themes-standard = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gnu-config = "Robert Yang <liezhi.yang@windriver.com>"
diff --git a/meta/recipes-gnome/epiphany/epiphany_3.28.1.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.28.1.1.bb
index 490d0f6a9c8..d6f8eda902e 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.28.1.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.28.1.1.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
-	   gsettings-desktop-schemas gnome-desktop3 libxml2-native \
+	   gsettings-desktop-schemas libxml2-native \
 	   glib-2.0 glib-2.0-native json-glib"
 
 GNOMEBASEBUILDCLASS = "meson"
diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-Disable-libseccomp-sycall-filtering-mechanism.patch b/meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-Disable-libseccomp-sycall-filtering-mechanism.patch
deleted file mode 100644
index aa11e8a62ec..00000000000
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-Disable-libseccomp-sycall-filtering-mechanism.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 96753d85d8b53dd8f87b8f444892efffdbfab388 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 5 Oct 2017 14:54:17 +0300
-Subject: [PATCH] Disable libseccomp (sycall filtering mechanism)
-
-Upstream forgot to make it optional, and it is not currently used in Yocto
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- configure.ac | 20 --------------------
- 1 file changed, 20 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 118d04f..47c8894 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -151,26 +151,6 @@ fi
- 
- SECCOMP_PKG=""
- enable_seccomp="no"
--dnl Check for bubblewrap compatible platform
--case $host_os in
--  linux*)
--    case $host_cpu in
--      alpha|ia64|m68k|sh4|sparc64)
--        enable_seccomp="no (not available on this architecture)"
--        AC_MSG_WARN("seccomp not available on this architecture")
--        ;;
--      *)
--        PKG_CHECK_MODULES(LIBSECCOMP, [libseccomp])
--        SECCOMP_PKG="libseccomp"
--        AC_DEFINE([ENABLE_SECCOMP], [1], [Define if using seccomp])
--        enable_seccomp="yes"
--        ;;
--    esac
--    AC_DEFINE_UNQUOTED(_GNU_SOURCE, 1, [Define to include GNU extensions])
--    AC_DEFINE_UNQUOTED(HAVE_BWRAP, 1, [Define to 1 if Bubblewrap support is available])
--    AC_DEFINE_UNQUOTED(INSTALL_PREFIX, "$prefix", [Path to library install prefix])
--    ;;
--esac
- 
- dnl pkg-config dependency checks
- 
diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch b/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch
deleted file mode 100644
index fcc152fdef3..00000000000
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 9048939b76b3bd10783adb79ed0aaf6cd13895cc Mon Sep 17 00:00:00 2001
-From: Christopher Larson <chris_larson@mentor.com>
-Date: Tue, 13 Dec 2016 20:39:51 -0700
-Subject: [PATCH 1/2] gnome-desktop-thumbnail: don't convert time_t to long
-
-Explicitly use strftime+strptime rather than snprintf+atol. This fixes the
-build for X32, where long's size doesn't match that of time_t.
-
-Upstream-Status: Pending
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-
-
-Modify patch described above to eliminate replacement of
-
-g_snprintf (mtime_str, 21, "%" G_GINT64_FORMAT, (gint64) mtime)
-
-which is not necessary.  Retain replacement of atol().
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
----
- libgnome-desktop/gnome-desktop-thumbnail.c | 16 ++++++++++++++--
- 1 file changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/libgnome-desktop/gnome-desktop-thumbnail.c b/libgnome-desktop/gnome-desktop-thumbnail.c
-index e56c3d7..5d96bf3 100644
---- a/libgnome-desktop/gnome-desktop-thumbnail.c
-+++ b/libgnome-desktop/gnome-desktop-thumbnail.c
-@@ -120,6 +120,8 @@
-  * Since: 2.2
-  */
- 
-+#define _XOPEN_SOURCE
-+
- #include <config.h>
- 
- #include <glib.h>
-@@ -1319,6 +1326,7 @@ gnome_desktop_thumbnail_is_valid (GdkPixbuf          *pixbuf,
- {
-   const char *thumb_uri, *thumb_mtime_str;
-   time_t thumb_mtime;
-+  struct tm tmp_mtime;
- 
-   thumb_uri = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::URI");
-   if (g_strcmp0 (uri, thumb_uri) != 0)
-@@ -1327,7 +1335,11 @@ gnome_desktop_thumbnail_is_valid (GdkPixbuf          *pixbuf,
-   thumb_mtime_str = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::MTime");
-   if (!thumb_mtime_str)
-     return FALSE;
--  thumb_mtime = atol (thumb_mtime_str);
-+  if (!strptime (thumb_mtime_str, "%s", &tmp_mtime))
-+    return FALSE;
-+  thumb_mtime = mktime (&tmp_mtime);
-+  if (!thumb_mtime)
-+    return FALSE;
-   if (mtime != thumb_mtime)
-     return FALSE;
- 
--- 
-2.14.1
-
diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.28.1.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.28.1.bb
deleted file mode 100644
index 39b3491fdb1..00000000000
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.28.1.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "GNOME library for reading .desktop files"
-SECTION = "x11/gnome"
-LICENSE = "GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-
-BPN = "gnome-desktop"
-
-inherit gnome pkgconfig upstream-version-is-even gobject-introspection
-SRC_URI[archive.md5sum] = "bcbf906d94eb08060c60a7364384d678"
-SRC_URI[archive.sha256sum] = "78a397a2be47586e6dc075d6a7fc5659aae3d10713d76994ce1b46086e7ecb9a"
-
-SRC_URI += " \
-           file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
-           file://0001-Disable-libseccomp-sycall-filtering-mechanism.patch \
-           "
-
-DEPENDS += "intltool-native gsettings-desktop-schemas gconf virtual/libx11 gtk+3 glib-2.0 startup-notification xkeyboard-config iso-codes udev"
-
-inherit distro_features_check gtk-doc
-REQUIRED_DISTRO_FEATURES = "x11"
-
-EXTRA_OECONF = "--disable-desktop-docs"
-
-PACKAGES =+ "libgnome-desktop3"
-FILES_libgnome-desktop3 = "${libdir}/lib*${SOLIBS} ${datadir}/libgnome-desktop*/pnp.ids ${datadir}/gnome/*xml"
-
-RRECOMMENDS_libgnome-desktop3 += "gsettings-desktop-schemas"
-- 
2.17.0


