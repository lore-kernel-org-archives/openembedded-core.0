Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 86DE3784C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:58:03 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:58:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402246"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:58:04 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:43 +0200
Message-Id: <20171114145754.9643-16-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 16/27] gnome-desktop3: Update to 3.26.2
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
X-List-Received-Date: Tue, 14 Nov 2017 14:58:03 -0000

Add a patch to disable libseccomp (not currently used in Yocto).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ble-libseccomp-sycall-filtering-mechanism.patch | 38 ++++++++++++++++++++++
 ...op-thumbnail-don-t-convert-time_t-to-long.patch | 31 +++++++++---------
 ...desktop3_3.24.2.bb => gnome-desktop3_3.26.2.bb} | 14 ++++----
 3 files changed, 62 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-Disable-libseccomp-sycall-filtering-mechanism.patch
 rename meta/recipes-gnome/gnome-desktop/{gnome-desktop3_3.24.2.bb => gnome-desktop3_3.26.2.bb} (66%)

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-Disable-libseccomp-sycall-filtering-mechanism.patch b/meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-Disable-libseccomp-sycall-filtering-mechanism.patch
new file mode 100644
index 00000000000..10b07435c42
--- /dev/null
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-Disable-libseccomp-sycall-filtering-mechanism.patch
@@ -0,0 +1,38 @@
+From 9dfada06f8d2e02d7a04f793ba6e1d4a2aa5ffb7 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 5 Oct 2017 14:54:17 +0300
+Subject: [PATCH] Disable libseccomp (sycall filtering mechanism)
+
+Upstream forgot to make it optional, and it is not currently used in Yocto
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 86bcf1f..8911f19 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -157,17 +157,6 @@ else
+ fi
+ 
+ SECCOMP_PKG=""
+-dnl Check for bubblewrap compatible platform
+-case $host_os in
+-  linux*)
+-    PKG_CHECK_MODULES(LIBSECCOMP, [libseccomp])
+-    SECCOMP_PKG="libseccomp"
+-    AC_DEFINE_UNQUOTED(_GNU_SOURCE, 1, [Define to include GNU extensions])
+-    AC_DEFINE_UNQUOTED(HAVE_BWRAP, 1, [Define to 1 if Bubblewrap support is available])
+-    AC_DEFINE([ENABLE_SECCOMP], [1], [Define if using seccomp])
+-    AC_DEFINE_UNQUOTED(INSTALL_PREFIX, "$prefix", [Path to library install prefix])
+-    ;;
+-esac
+ 
+ dnl pkg-config dependency checks
+ 
+-- 
+2.14.1
+
diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch b/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch
index 18a069fadc7..c1a7d4f40f5 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch
@@ -1,31 +1,32 @@
-From adfa0c8f9fec1faac4bea6a94d947ea32e585923 Mon Sep 17 00:00:00 2001
+From 9048939b76b3bd10783adb79ed0aaf6cd13895cc Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Tue, 13 Dec 2016 20:39:51 -0700
-Subject: [PATCH] gnome-desktop-thumbnail: don't convert time_t to long
+Subject: [PATCH 1/2] gnome-desktop-thumbnail: don't convert time_t to long
 
 Explicitly use strftime+strptime rather than snprintf+atol. This fixes the
 build for X32, where long's size doesn't match that of time_t.
 
 Upstream-Status: Pending
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
 ---
  libgnome-desktop/gnome-desktop-thumbnail.c | 16 ++++++++++++++--
  1 file changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/libgnome-desktop/gnome-desktop-thumbnail.c b/libgnome-desktop/gnome-desktop-thumbnail.c
-index 3946309..b756333 100644
+index e56c3d7..5d96bf3 100644
 --- a/libgnome-desktop/gnome-desktop-thumbnail.c
 +++ b/libgnome-desktop/gnome-desktop-thumbnail.c
-@@ -126,6 +126,8 @@
+@@ -120,6 +120,8 @@
   * Since: 2.2
   */
  
 +#define _XOPEN_SOURCE
 +
  #include <config.h>
- #include <sys/types.h>
- #include <sys/stat.h>
-@@ -1483,6 +1485,7 @@ save_thumbnail (GdkPixbuf  *pixbuf,
+ 
+ #include <glib.h>
+@@ -1105,6 +1107,7 @@ save_thumbnail (GdkPixbuf  *pixbuf,
    char *tmp_path = NULL;
    int tmp_fd;
    char mtime_str[21];
@@ -33,11 +34,11 @@ index 3946309..b756333 100644
    gboolean ret = FALSE;
    GError *error = NULL;
    const char *width, *height;
-@@ -1502,7 +1505,11 @@ save_thumbnail (GdkPixbuf  *pixbuf,
+@@ -1124,7 +1127,11 @@ save_thumbnail (GdkPixbuf  *pixbuf,
      goto out;
    close (tmp_fd);
  
--  g_snprintf (mtime_str, 21, "%ld",  mtime);
+-  g_snprintf (mtime_str, 21, "%" G_GINT64_FORMAT, (gint64) mtime);
 +  tmp_mtime = localtime (&mtime);
 +  if (!tmp_mtime)
 +    goto out;
@@ -46,15 +47,15 @@ index 3946309..b756333 100644
    width = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::Image::Width");
    height = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::Image::Height");
  
-@@ -1695,6 +1702,7 @@ gnome_desktop_thumbnail_is_valid (GdkPixbuf          *pixbuf,
+@@ -1319,6 +1326,7 @@ gnome_desktop_thumbnail_is_valid (GdkPixbuf          *pixbuf,
  {
    const char *thumb_uri, *thumb_mtime_str;
    time_t thumb_mtime;
 +  struct tm tmp_mtime;
-   
+ 
    thumb_uri = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::URI");
-   if (!thumb_uri)
-@@ -1705,7 +1713,11 @@ gnome_desktop_thumbnail_is_valid (GdkPixbuf          *pixbuf,
+   if (g_strcmp0 (uri, thumb_uri) != 0)
+@@ -1327,7 +1335,11 @@ gnome_desktop_thumbnail_is_valid (GdkPixbuf          *pixbuf,
    thumb_mtime_str = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::MTime");
    if (!thumb_mtime_str)
      return FALSE;
@@ -66,7 +67,7 @@ index 3946309..b756333 100644
 +    return FALSE;
    if (mtime != thumb_mtime)
      return FALSE;
-   
+ 
 -- 
-2.8.0
+2.14.1
 
diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.24.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb
similarity index 66%
rename from meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.24.2.bb
rename to meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb
index 5c1c213002d..cd6c194c1b7 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.24.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb
@@ -7,12 +7,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 BPN = "gnome-desktop"
 
 inherit gnome pkgconfig upstream-version-is-even gobject-introspection
-SRC_URI[archive.md5sum] = "af7c6a243df7a335a010bdc05b34ca93"
-SRC_URI[archive.sha256sum] = "8fa1de66a6a75963bffc79b01a60434c71237d44c51beca09c0f714a032d785e"
-
-SRC_URI += "file://gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch \
-            file://0001-configure.ac-Remove-gnome-common-macro-calls.patch \
-"
+SRC_URI[archive.md5sum] = "6cee2ecd677d87eaa0eb5ebfa7b45fb3"
+SRC_URI[archive.sha256sum] = "f7561a7a313fc474b2c390cd9696df1f5c1e1556080e43f4afe042b1060e5f2a"
+
+SRC_URI += " \
+           file://gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch \
+           file://0001-configure.ac-Remove-gnome-common-macro-calls.patch \
+           file://0001-Disable-libseccomp-sycall-filtering-mechanism.patch \
+           "
 
 DEPENDS += "intltool-native gsettings-desktop-schemas gconf virtual/libx11 gtk+3 glib-2.0 startup-notification xkeyboard-config iso-codes udev"
 
-- 
2.15.0


