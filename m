Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrS-0004Y7-T2
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752277"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:11 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:11 -0800
Message-Id: <6e7f14cb91be4dc8eb3bbbdd059988b9cd503398.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 085/113] oprofileui: upgrade to 82ecf8c6b53b84f80682a8312f9defa83a95f2a3
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:41 -0000

From: Shane Wang <shane.wang@intel.com>

This patch removed two patches because those are there in the upstream.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../oprofileui/dso_linking_change_build_fix.patch  |   27 ---
 .../oprofileui/migrate-from-gnomevfs-to-gio.patch  |  219 --------------------
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    2 +-
 3 files changed, 1 insertions(+), 247 deletions(-)
 delete mode 100644 meta/recipes-kernel/oprofile/oprofileui/dso_linking_change_build_fix.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofileui/migrate-from-gnomevfs-to-gio.patch

diff --git a/meta/recipes-kernel/oprofile/oprofileui/dso_linking_change_build_fix.patch b/meta/recipes-kernel/oprofile/oprofileui/dso_linking_change_build_fix.patch
deleted file mode 100644
index 39ceb22..0000000
--- a/meta/recipes-kernel/oprofile/oprofileui/dso_linking_change_build_fix.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-With dso linking change in gcc, all the libraries are needed to be explicitely specified to linker now. It breaks this package in following way. The libm library needs to be specified explicitely.
-
-| make[2]: Entering directory `/disk0/pokybuild/build1/tmp/work/i586-poky-linux/oprofileui-0.0+svnr197-r0/trunk/src'^M
-| ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux -Wall -g -std=gnu99 -DPKG_DATA_DIR=\""/usr/share/oprofileui"\"  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o oprofile-viewer main.o client.o archive.o archive_window.o archive_save_window.o view.o report.o parser.o image.o symbol.o module.o symbol_instance.o module_instance.o callee_symbol_instance.o caller_symbol_instance.o state-util.o -pthread -lglade-2.0 -lgtk-x11-2.0
 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lxml2 -lgnomevfs-2 -lgmodule-2.0 -lgconf-2 -ldbus-glib-1 -ldbus-1 -lpthread -lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0   -pthread -lavahi-ui -lgtk-x11-2.0 -lavahi-common -lavahi-client -lavahi-glib -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0   ../protocol/libop.a^M
-| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: ^X^B: invalid DSO for symbol `log@@GLIBC_2.0' definition^M
-| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/lib/libm.so.6: could not read symbols: Bad value^M
-| collect2: ld returned 1 exit status^M
-| make[2]: *** [oprofile-viewer] Error 1^M
-
-Upstream-Status: Inappropriate [configuration]
-
-Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2011/01/11
-
-Index: trunk/src/Makefile.am
-===================================================================
---- trunk.orig/src/Makefile.am
-+++ trunk/src/Makefile.am
-@@ -56,7 +56,7 @@ oprofile_viewer_SOURCES = \
- 
- oprofile_viewer_LDFLAGS = 
- 
--oprofile_viewer_LDADD = $(OPROFILEUI_LIBS) $(AVAHI_LIBS) $(top_builddir)/protocol/libop.a
-+oprofile_viewer_LDADD = $(OPROFILEUI_LIBS) -lm $(AVAHI_LIBS) $(top_builddir)/protocol/libop.a
- 
- testparser_SOURCES = \
- 	parser.c \
diff --git a/meta/recipes-kernel/oprofile/oprofileui/migrate-from-gnomevfs-to-gio.patch b/meta/recipes-kernel/oprofile/oprofileui/migrate-from-gnomevfs-to-gio.patch
deleted file mode 100644
index bf3979f..0000000
--- a/meta/recipes-kernel/oprofile/oprofileui/migrate-from-gnomevfs-to-gio.patch
+++ /dev/null
@@ -1,219 +0,0 @@
-migrate from gnome-vfs to gio, as gnome-vfs is obsolete.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Pending
-
-Index: git/src/main.c
-===================================================================
---- git.orig/src/main.c	2011-06-21 10:35:31.000000000 +0800
-+++ git/src/main.c	2011-06-21 10:44:12.000000000 +0800
-@@ -44,7 +44,6 @@
- #include <gtk/gtk.h>
- #include <glade/glade.h>
- #include <glib.h>
--#include <libgnomevfs/gnome-vfs.h>
- #include <gconf/gconf-client.h>
- #include <glib/gi18n.h>
- 
-@@ -1005,8 +1004,7 @@
-   /* Cleanup the old archive */
-   archive_full_cleanup ();
- 
--  if (gnome_vfs_initialized())
--    gnome_vfs_shutdown ();
-+  g_type_init();
- 
-   g_free(opui_config->host);
-   g_free(opui_config->opcontrol_params);
-Index: git/src/archive.c
-===================================================================
---- git.orig/src/archive.c	2011-06-21 10:38:57.000000000 +0800
-+++ git/src/archive.c	2011-06-21 10:54:16.000000000 +0800
-@@ -45,7 +45,6 @@
- #include <glade/glade.h>
- #include <glib.h>
- #include <glib/gstdio.h>
--#include <libgnomevfs/gnome-vfs.h>
- 
- #include "oprofileui.h"
- #include "response.h"
-@@ -86,56 +85,113 @@
- 
-   if (ret < 0)
-     {
--      /* Use gnomevfs to copy the file as a fallback */
--      GnomeVFSURI *src_uri, *dst_uri;
--      GnomeVFSResult res;
--
--      src_uri = gnome_vfs_uri_new (gnome_vfs_get_uri_from_local_path(src));
--      dst_uri = gnome_vfs_uri_new (gnome_vfs_get_uri_from_local_path(dest));
--      res = gnome_vfs_xfer_uri (src_uri, dst_uri,
--          GNOME_VFS_XFER_DEFAULT |
--          GNOME_VFS_XFER_NEW_UNIQUE_DIRECTORY, 
--          GNOME_VFS_XFER_ERROR_MODE_ABORT,
--          GNOME_VFS_XFER_OVERWRITE_MODE_REPLACE,
--          NULL, NULL);
--      if (res != GNOME_VFS_OK)
-+      /* Use gio to copy the file as a fallback */
-+      GFile *src_file, *dst_file;
-+      gboolean res;
-+      GError *error = NULL;
-+
-+      src_file = g_file_new_for_path (src);
-+      dst_file = g_file_new_for_path (dest);
-+
-+      res = g_file_copy(src_file, dst_file,
-+                        G_FILE_COPY_NOFOLLOW_SYMLINKS |
-+                        G_FILE_COPY_OVERWRITE,
-+                        NULL,
-+                        NULL,
-+                        NULL,
-+                        &error);
-+
-+      if (!res && error)
-         {
--          const gchar *err_string = gnome_vfs_result_to_string (res);
-+          printf ("GIO: error %s (%s to %s)\n", error->message, src, dest);
- 
--          printf ("GNOME-VFS: error %s (%s to %s)\n", err_string, src, dest);
-+          g_error_free(error);
-         }
-+
-+      g_object_unref(src_file);
-+      g_object_unref(dst_file);
-+
-+    }
-+}
-+
-+#define IS_IO_ERROR(__error, KIND) (((__error)->domain == G_IO_ERROR && (__error)->code == G_IO_ERROR_ ## KIND))
-+
-+static gboolean
-+remove_target_recursively(GFile *file)
-+{
-+  GFileEnumerator *enumerator;
-+  GError *error = NULL;
-+  GFile *child;
-+  GFileInfo *info;
-+  gboolean stop = FALSE;
-+
-+  enumerator = g_file_enumerate_children(file,
-+                                         G_FILE_ATTRIBUTE_STANDARD_NAME,
-+                                         G_FILE_QUERY_INFO_NOFOLLOW_SYMLINKS,
-+                                         NULL,
-+                                         &error);
-+
-+  if (enumerator)
-+    {
-+      error = NULL;
-+
-+      while ( (info = g_file_enumerator_next_file(enumerator, NULL, &error))
-+               != NULL ) {
-+
-+        child = g_file_get_child(file, g_file_info_get_name(info));
-+        if (!remove_target_recursively(child))
-+          {
-+              stop = TRUE;
-+              break;
-+          }
-+        g_object_unref(child);
-+        g_object_unref(info);
-+      }
-+
-+      g_object_unref(enumerator);
-+    }
-+  else if (IS_IO_ERROR(error, NOT_DIRECTORY))
-+    {
-+      g_error_free(error);
-     }
-+  else
-+    {
-+      g_error_free(error);
-+      stop = TRUE;
-+    }
-+
-+  if (stop)
-+    return FALSE;
-+
-+  error = NULL;
-+  if (!g_file_delete(file, NULL, &error))
-+    {
-+      char *path = g_file_get_path(file);
-+      printf ("GIO: error %s when deleteing file %s.\n", error->message, path);
-+      g_free(path);
-+
-+      g_error_free(error);
-+      return FALSE;
-+    }
-+
-+  return TRUE;
-+
- }
- 
- /* Delete the directory specified by path */
- static void
- archive_removedir(gchar *path)
- {
--  GnomeVFSResult res;
--  GnomeVFSURI *src_uri;
--  GList uri_list;
-+  GFile *src_file;
- 
-   if (path == NULL)
-     return;
- 
--  gnome_vfs_init ();
--
--  src_uri = gnome_vfs_uri_new (gnome_vfs_get_uri_from_local_path(path));
--
--  uri_list.data = src_uri;
--  uri_list.next = NULL;
--  uri_list.prev = NULL;
-+  src_file = g_file_new_for_path (path);
- 
--  res = gnome_vfs_xfer_delete_list (&uri_list,
--      GNOME_VFS_XFER_ERROR_MODE_ABORT,
--      GNOME_VFS_XFER_EMPTY_DIRECTORIES,
--      NULL, NULL);
--
--  if (res != GNOME_VFS_OK)
-+  if (! remove_target_recursively(src_file))
-     {
--      const gchar *err_string = gnome_vfs_result_to_string (res);
--
--      printf ("GNOME-VFS: error %s\n", err_string);
-+      printf ("GIO:remove %s failed", path);
-     }
- }
- 
-@@ -242,8 +298,6 @@
-   gchar **tmp;
-   int i;
- 
--  gnome_vfs_init ();
--
-   tmp = g_strsplit (reply->payload, "\n", 0);
- 
-   for (i=0; i < g_strv_length (tmp); i++)
-@@ -436,8 +490,6 @@
- {
-   gint counter;
- 
--  gnome_vfs_init ();
--
-   downloaded_files = g_slist_append (downloaded_files, g_strdup("/var/lib/oprofile/.converted"));
- 
-   archive_save_window_show (g_slist_length (downloaded_files) +
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2011-06-21 10:49:40.000000000 +0800
-+++ git/configure.ac	2011-06-21 10:49:58.000000000 +0800
-@@ -29,7 +29,7 @@
- AM_CONDITIONAL(ENABLE_SERVER, test x$enable_server = xyes)
- AM_CONDITIONAL(ENABLE_CLIENT, test x$enable_client = xyes)
- 
--PKG_CHECK_MODULES(OPROFILEUI, [glib-2.0 libglade-2.0 gtk+-2.0 libxml-2.0 gnome-vfs-2.0 gconf-2.0])
-+PKG_CHECK_MODULES(OPROFILEUI, [glib-2.0 libglade-2.0 gtk+-2.0 libxml-2.0 gconf-2.0])
- AC_SUBST(OPROFILEUI_CFLAGS)
- AC_SUBST(OPROFILEUI_LIBS)
- 
diff --git a/meta/recipes-kernel/oprofile/oprofileui_git.bb b/meta/recipes-kernel/oprofile/oprofileui_git.bb
index 2b56981..3fe9bb4 100644
--- a/meta/recipes-kernel/oprofile/oprofileui_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui_git.bb
@@ -1,6 +1,6 @@
 require oprofileui.inc
 
-SRCREV = "b3116a4f80ae64bd280e6434d66f33ed492d449a"
+SRCREV = "82ecf8c6b53b84f80682a8312f9defa83a95f2a3"
 PV = "0.0+git${SRCPV}"
 PR = "r0"
 
-- 
1.7.6.4



