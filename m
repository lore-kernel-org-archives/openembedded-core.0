Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QYvDU-0008Rk-CI
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 09:17:45 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jun 2011 00:14:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,399,1304319600"; d="scan'208";a="20751020"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2011 00:14:05 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2011 15:12:19 +0800
Message-Id: <aa366699d62266365c6acd5bea71f02aedb63adc.1308639329.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308639329.git.edwin.zhai@intel.com>
References: <cover.1308639329.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1308639329.git.edwin.zhai@intel.com>
References: <cover.1308639329.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] gnome-vfs: remove gnome-vfs as it is deprecated in favour of GVFS and GIO
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
X-List-Received-Date: Tue, 21 Jun 2011 07:17:45 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Remove unnecessary dependency via configure option and make oprofileui use GIO

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../oprofileui/migrate-from-gnomevfs-to-gio.patch  |  219 ++++++++++++++++++++
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    1 +
 .../gstreamer/gst-meta-base_0.10.bb                |    2 +-
 .../gstreamer/gst-plugins-base_0.10.32.bb          |    6 +-
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    2 +-
 5 files changed, 224 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-kernel/oprofile/oprofileui/migrate-from-gnomevfs-to-gio.patch

diff --git a/meta/recipes-kernel/oprofile/oprofileui/migrate-from-gnomevfs-to-gio.patch b/meta/recipes-kernel/oprofile/oprofileui/migrate-from-gnomevfs-to-gio.patch
new file mode 100644
index 0000000..bf3979f
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofileui/migrate-from-gnomevfs-to-gio.patch
@@ -0,0 +1,219 @@
+migrate from gnome-vfs to gio, as gnome-vfs is obsolete.
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Pending
+
+Index: git/src/main.c
+===================================================================
+--- git.orig/src/main.c	2011-06-21 10:35:31.000000000 +0800
++++ git/src/main.c	2011-06-21 10:44:12.000000000 +0800
+@@ -44,7 +44,6 @@
+ #include <gtk/gtk.h>
+ #include <glade/glade.h>
+ #include <glib.h>
+-#include <libgnomevfs/gnome-vfs.h>
+ #include <gconf/gconf-client.h>
+ #include <glib/gi18n.h>
+ 
+@@ -1005,8 +1004,7 @@
+   /* Cleanup the old archive */
+   archive_full_cleanup ();
+ 
+-  if (gnome_vfs_initialized())
+-    gnome_vfs_shutdown ();
++  g_type_init();
+ 
+   g_free(opui_config->host);
+   g_free(opui_config->opcontrol_params);
+Index: git/src/archive.c
+===================================================================
+--- git.orig/src/archive.c	2011-06-21 10:38:57.000000000 +0800
++++ git/src/archive.c	2011-06-21 10:54:16.000000000 +0800
+@@ -45,7 +45,6 @@
+ #include <glade/glade.h>
+ #include <glib.h>
+ #include <glib/gstdio.h>
+-#include <libgnomevfs/gnome-vfs.h>
+ 
+ #include "oprofileui.h"
+ #include "response.h"
+@@ -86,56 +85,113 @@
+ 
+   if (ret < 0)
+     {
+-      /* Use gnomevfs to copy the file as a fallback */
+-      GnomeVFSURI *src_uri, *dst_uri;
+-      GnomeVFSResult res;
+-
+-      src_uri = gnome_vfs_uri_new (gnome_vfs_get_uri_from_local_path(src));
+-      dst_uri = gnome_vfs_uri_new (gnome_vfs_get_uri_from_local_path(dest));
+-      res = gnome_vfs_xfer_uri (src_uri, dst_uri,
+-          GNOME_VFS_XFER_DEFAULT |
+-          GNOME_VFS_XFER_NEW_UNIQUE_DIRECTORY, 
+-          GNOME_VFS_XFER_ERROR_MODE_ABORT,
+-          GNOME_VFS_XFER_OVERWRITE_MODE_REPLACE,
+-          NULL, NULL);
+-      if (res != GNOME_VFS_OK)
++      /* Use gio to copy the file as a fallback */
++      GFile *src_file, *dst_file;
++      gboolean res;
++      GError *error = NULL;
++
++      src_file = g_file_new_for_path (src);
++      dst_file = g_file_new_for_path (dest);
++
++      res = g_file_copy(src_file, dst_file,
++                        G_FILE_COPY_NOFOLLOW_SYMLINKS |
++                        G_FILE_COPY_OVERWRITE,
++                        NULL,
++                        NULL,
++                        NULL,
++                        &error);
++
++      if (!res && error)
+         {
+-          const gchar *err_string = gnome_vfs_result_to_string (res);
++          printf ("GIO: error %s (%s to %s)\n", error->message, src, dest);
+ 
+-          printf ("GNOME-VFS: error %s (%s to %s)\n", err_string, src, dest);
++          g_error_free(error);
+         }
++
++      g_object_unref(src_file);
++      g_object_unref(dst_file);
++
++    }
++}
++
++#define IS_IO_ERROR(__error, KIND) (((__error)->domain == G_IO_ERROR && (__error)->code == G_IO_ERROR_ ## KIND))
++
++static gboolean
++remove_target_recursively(GFile *file)
++{
++  GFileEnumerator *enumerator;
++  GError *error = NULL;
++  GFile *child;
++  GFileInfo *info;
++  gboolean stop = FALSE;
++
++  enumerator = g_file_enumerate_children(file,
++                                         G_FILE_ATTRIBUTE_STANDARD_NAME,
++                                         G_FILE_QUERY_INFO_NOFOLLOW_SYMLINKS,
++                                         NULL,
++                                         &error);
++
++  if (enumerator)
++    {
++      error = NULL;
++
++      while ( (info = g_file_enumerator_next_file(enumerator, NULL, &error))
++               != NULL ) {
++
++        child = g_file_get_child(file, g_file_info_get_name(info));
++        if (!remove_target_recursively(child))
++          {
++              stop = TRUE;
++              break;
++          }
++        g_object_unref(child);
++        g_object_unref(info);
++      }
++
++      g_object_unref(enumerator);
++    }
++  else if (IS_IO_ERROR(error, NOT_DIRECTORY))
++    {
++      g_error_free(error);
+     }
++  else
++    {
++      g_error_free(error);
++      stop = TRUE;
++    }
++
++  if (stop)
++    return FALSE;
++
++  error = NULL;
++  if (!g_file_delete(file, NULL, &error))
++    {
++      char *path = g_file_get_path(file);
++      printf ("GIO: error %s when deleteing file %s.\n", error->message, path);
++      g_free(path);
++
++      g_error_free(error);
++      return FALSE;
++    }
++
++  return TRUE;
++
+ }
+ 
+ /* Delete the directory specified by path */
+ static void
+ archive_removedir(gchar *path)
+ {
+-  GnomeVFSResult res;
+-  GnomeVFSURI *src_uri;
+-  GList uri_list;
++  GFile *src_file;
+ 
+   if (path == NULL)
+     return;
+ 
+-  gnome_vfs_init ();
+-
+-  src_uri = gnome_vfs_uri_new (gnome_vfs_get_uri_from_local_path(path));
+-
+-  uri_list.data = src_uri;
+-  uri_list.next = NULL;
+-  uri_list.prev = NULL;
++  src_file = g_file_new_for_path (path);
+ 
+-  res = gnome_vfs_xfer_delete_list (&uri_list,
+-      GNOME_VFS_XFER_ERROR_MODE_ABORT,
+-      GNOME_VFS_XFER_EMPTY_DIRECTORIES,
+-      NULL, NULL);
+-
+-  if (res != GNOME_VFS_OK)
++  if (! remove_target_recursively(src_file))
+     {
+-      const gchar *err_string = gnome_vfs_result_to_string (res);
+-
+-      printf ("GNOME-VFS: error %s\n", err_string);
++      printf ("GIO:remove %s failed", path);
+     }
+ }
+ 
+@@ -242,8 +298,6 @@
+   gchar **tmp;
+   int i;
+ 
+-  gnome_vfs_init ();
+-
+   tmp = g_strsplit (reply->payload, "\n", 0);
+ 
+   for (i=0; i < g_strv_length (tmp); i++)
+@@ -436,8 +490,6 @@
+ {
+   gint counter;
+ 
+-  gnome_vfs_init ();
+-
+   downloaded_files = g_slist_append (downloaded_files, g_strdup("/var/lib/oprofile/.converted"));
+ 
+   archive_save_window_show (g_slist_length (downloaded_files) +
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac	2011-06-21 10:49:40.000000000 +0800
++++ git/configure.ac	2011-06-21 10:49:58.000000000 +0800
+@@ -29,7 +29,7 @@
+ AM_CONDITIONAL(ENABLE_SERVER, test x$enable_server = xyes)
+ AM_CONDITIONAL(ENABLE_CLIENT, test x$enable_client = xyes)
+ 
+-PKG_CHECK_MODULES(OPROFILEUI, [glib-2.0 libglade-2.0 gtk+-2.0 libxml-2.0 gnome-vfs-2.0 gconf-2.0])
++PKG_CHECK_MODULES(OPROFILEUI, [glib-2.0 libglade-2.0 gtk+-2.0 libxml-2.0 gconf-2.0])
+ AC_SUBST(OPROFILEUI_CFLAGS)
+ AC_SUBST(OPROFILEUI_LIBS)
+ 
diff --git a/meta/recipes-kernel/oprofile/oprofileui_git.bb b/meta/recipes-kernel/oprofile/oprofileui_git.bb
index aac33ea..0047748 100644
--- a/meta/recipes-kernel/oprofile/oprofileui_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui_git.bb
@@ -8,4 +8,5 @@ S = "${WORKDIR}/git"
 
 # Oprofileui at http://labs.o-hand.com/oprofileui/ is not maintained now.
 SRC_URI = "git://git.yoctoproject.org/oprofileui;protocol=git \
+           file://migrate-from-gnomevfs-to-gio.patch \
            file://dso_linking_change_build_fix.patch "
diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
index 5bb67cc..1788104 100644
--- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
@@ -20,7 +20,7 @@ RDEPENDS_gst-meta-base = "\
     gst-plugins-base-playbin \
     gst-plugins-base-decodebin \
     gst-plugins-base-decodebin2 \
-    gst-plugins-base-gnomevfs \
+    gst-plugins-base-gio \
     gst-plugins-base-alsa \
     gst-plugins-base-volume \
     gst-plugins-base-ximagesink \
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
index f81011f..a9e2b52 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
@@ -6,9 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
 
-DEPENDS += "virtual/libx11 alsa-lib freetype gnome-vfs liboil libogg libvorbis libxv libtheora avahi util-linux tremor"
-RDEPENDS_${PN} += "gnome-vfs-plugin-file gnome-vfs-plugin-http gnome-vfs-plugin-ftp \
-             gnome-vfs-plugin-sftp"
+DEPENDS += "virtual/libx11 alsa-lib freetype liboil libogg libvorbis libxv libtheora avahi util-linux tremor"
 
 SRC_URI += " file://gst-plugins-base-tremor.patch"
 
@@ -19,7 +17,7 @@ PR = "r0"
 
 inherit gettext
 
-EXTRA_OECONF += "--disable-freetypetest --disable-pango"
+EXTRA_OECONF += "--disable-freetypetest --disable-pango --disable-gnome_vfs"
 
 do_configure_prepend() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 3c5101b..b507bef 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://WebCore/rendering/RenderApplet.h;endline=22;md5=fb969
                     file://WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
                     file://JavaScriptCore/parser/Parser.h;endline=23;md5=2f3cff0ad0a9c486da5a376928973a90"
 
-DEPENDS = "enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base gnome-vfs flex-native gperf-native perl-native sqlite3"
+DEPENDS = "enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native sqlite3"
 DEPENDS_darwin8 = "curl icu libxml2 cairo libxslt libidn gnutls gtk+ gstreamer flex-native gperf-native perl-native sqlite3"
 
 SRCREV_FORMAT = "webcore-rwebkit"
-- 
1.7.1



