Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCyNr-0006m7-CR
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 20:13:43 +0200
Received: by wwi18 with SMTP id 18so46115wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 11:11:19 -0700 (PDT)
Received: by 10.227.139.89 with SMTP id d25mr276764wbu.58.1303409471606;
	Thu, 21 Apr 2011 11:11:11 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z13sm1326393wbd.63.2011.04.21.11.11.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 11:11:10 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2011 20:10:48 +0200
Message-Id: <1303409452-19263-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1303409452-19263-5-git-send-email-koen@dominion.thruhere.net>
References: <1303409452-19263-1-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-2-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-3-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-4-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-5-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome 06/10] gnome-settings-daemon: import from oe-core rev 0a6f77f549c095692045825f4b5c4c5a2edff73c
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
X-List-Received-Date: Thu, 21 Apr 2011 18:13:43 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../gnome/gnome-settings-daemon/configurefix.patch |   30 +
 .../gnome-settings-daemon/desktop-moblin.patch     |   11 +
 ...-settings-daemon-2.24.0-catch-deviceadded.patch |   19 +
 .../gnome-settings-daemon-fix-gthread.patch        |   13 +
 .../gnome-settings-daemon/mojito-cleanup.patch     |   74 +++
 .../gnome/gnome-settings-daemon/mount-plugin.patch |  618 ++++++++++++++++++++
 .../gnome/gnome-settings-daemon_2.26.1.bb          |   25 +
 7 files changed, 790 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/configurefix.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/desktop-moblin.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-2.24.0-catch-deviceadded.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-fix-gthread.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/mojito-cleanup.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/mount-plugin.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome/gnome-settings-daemon_2.26.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/configurefix.patch b/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/configurefix.patch
new file mode 100644
index 0000000..01b4f64
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/configurefix.patch
@@ -0,0 +1,30 @@
+Index: gnome-settings-daemon-2.26.1/configure.ac
+===================================================================
+--- gnome-settings-daemon-2.26.1.orig/configure.ac	2009-09-16 22:57:31.000000000 +0100
++++ gnome-settings-daemon-2.26.1/configure.ac	2009-09-16 22:58:45.000000000 +0100
+@@ -133,9 +133,6 @@
+ #
+ AC_DEFUN([AC_CHECK_X_HEADERS], [
+   ac_save_CPPFLAGS="$CPPFLAGS"
+-  if test \! -z "$includedir" ; then
+-    CPPFLAGS="$CPPFLAGS -I$includedir"
+-  fi
+   CPPFLAGS="$CPPFLAGS $X_CFLAGS"
+   AC_CHECK_HEADERS([$1],[$2],[$3],[$4])
+   CPPFLAGS="$ac_save_CPPFLAGS"])
+@@ -148,15 +145,9 @@
+   ac_save_LDFLAGS="$LDFLAGS"
+ #  ac_save_LIBS="$LIBS"
+ 
+-  if test \! -z "$includedir" ; then
+-    CPPFLAGS="$CPPFLAGS -I$includedir"
+-  fi
+   # note: $X_CFLAGS includes $x_includes
+   CPPFLAGS="$CPPFLAGS $X_CFLAGS"
+ 
+-  if test \! -z "$libdir" ; then
+-    LDFLAGS="$LDFLAGS -L$libdir"
+-  fi
+   # note: $X_LIBS includes $x_libraries
+   LDFLAGS="$LDFLAGS $ALL_X_LIBS"
+ 
diff --git a/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/desktop-moblin.patch b/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/desktop-moblin.patch
new file mode 100644
index 0000000..d3fd76c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/desktop-moblin.patch
@@ -0,0 +1,11 @@
+--- gnome-settings-daemon-2.26.1/data/gnome-settings-daemon.desktop.in.in~	2009-04-24 20:59:51.000000000 -0700
++++ gnome-settings-daemon-2.26.1/data/gnome-settings-daemon.desktop.in.in	2009-04-24 20:59:51.000000000 -0700
+@@ -2,7 +2,7 @@
+ Type=Application
+ _Name=GNOME Settings Daemon
+ Exec=@LIBEXECDIR@/gnome-settings-daemon
+-OnlyShowIn=GNOME;
++OnlyShowIn=GNOME;MOBLIN;
+ X-GNOME-Autostart-Phase=Initialization
+ X-GNOME-Autostart-Notify=true
+ X-GNOME-AutoRestart=true
diff --git a/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-2.24.0-catch-deviceadded.patch b/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-2.24.0-catch-deviceadded.patch
new file mode 100644
index 0000000..8e1d0ce
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-2.24.0-catch-deviceadded.patch
@@ -0,0 +1,19 @@
+============================================================
+ Listen for DeviceAdded in addition to DeviceEnabled
+
+  This should help address problems like left-handed
+mouse, and acceleration settings getting lost after
+resume, or when new devices gets plugged in.
+
+diff --git a/plugins/mouse/gsd-mouse-manager.c b/plugins/mouse/gsd-mouse-manager.c
+--- a/plugins/mouse/gsd-mouse-manager.c
++++ b/plugins/mouse/gsd-mouse-manager.c
+@@ -320,7 +320,7 @@ devicepresence_filter (GdkXEvent *xevent,
+         if (xev->type == xi_presence)
+         {
+             XDevicePresenceNotifyEvent *dpn = (XDevicePresenceNotifyEvent *) xev;
+-            if (dpn->devchange == DeviceEnabled)
++            if (dpn->devchange == DeviceEnabled || dpn->devchange == DeviceAdded)
+                 set_mouse_settings ((GsdMouseManager *) data);
+         }
+         return GDK_FILTER_CONTINUE;
diff --git a/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-fix-gthread.patch b/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-fix-gthread.patch
new file mode 100644
index 0000000..d77063e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/gnome-settings-daemon-fix-gthread.patch
@@ -0,0 +1,13 @@
+Index: gnome-settings-daemon-2.25.90/configure.ac
+===================================================================
+--- gnome-settings-daemon-2.25.90.orig/configure.ac
++++ gnome-settings-daemon-2.25.90/configure.ac
+@@ -85,6 +85,8 @@ AC_PATH_PROG(GCONFTOOL, gconftool-2)
+ 
+ AM_GCONF_SOURCE_2
+ 
++AC_CHECK_LIB(gthread-2.0, g_thread_init)
++
+ dnl ---------------------------------------------------------------------------
+ dnl - Check for libnotify
+ dnl ---------------------------------------------------------------------------
diff --git a/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/mojito-cleanup.patch b/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/mojito-cleanup.patch
new file mode 100644
index 0000000..1aff2d6
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/mojito-cleanup.patch
@@ -0,0 +1,74 @@
+diff --git a/plugins/housekeeping/gsd-housekeeping-manager.c b/plugins/housekeeping/gsd-housekeeping-manager.c
+index f84cfad..e8f474a 100644
+--- a/plugins/housekeeping/gsd-housekeeping-manager.c
++++ b/plugins/housekeeping/gsd-housekeeping-manager.c
+@@ -85,9 +85,13 @@ thumb_data_free (gpointer data)
+         }
+ }
+ 
++typedef enum {
++  HASH,
++  HASH_PNG
++} FileType;
+ 
+ static GList *
+-read_dir_for_purge (const char *path, GList *files)
++read_dir_for_purge (const char *path, GList *files, FileType type)
+ {
+         GFile           *read_path;
+         GFileEnumerator *enum_dir;
+@@ -105,9 +109,20 @@ read_dir_for_purge (const char *path, GList *files)
+                 GFileInfo *info;
+                 while ((info = g_file_enumerator_next_file (enum_dir, NULL, NULL)) != NULL) {
+                         const char *name;
++                        gboolean prune = FALSE;
++
+                         name = g_file_info_get_name (info);
+ 
+-                        if (strlen (name) == 36 && strcmp (name + 32, ".png") == 0) {
++                        switch (type) {
++                        case HASH:
++                          prune = (strlen (name) == 36);
++                          break;
++                        case HASH_PNG:
++                          prune = (strlen (name) == 36 && strcmp (name + 32, ".png") == 0);
++                          break;
++                        }
++
++                        if (prune) {
+                                 ThumbData *td;
+                                 GFile     *entry;
+                                 char      *entry_path;
+@@ -197,14 +212,14 @@ purge_thumbnail_cache (void)
+                                  ".thumbnails",
+                                  "normal",
+                                  NULL);
+-        files = read_dir_for_purge (path, NULL);
++        files = read_dir_for_purge (path, NULL, HASH_PNG);
+         g_free (path);
+ 
+         path = g_build_filename (g_get_home_dir (),
+                                  ".thumbnails",
+                                  "large",
+                                  NULL);
+-        files = read_dir_for_purge (path, files);
++        files = read_dir_for_purge (path, files, HASH_PNG);
+         g_free (path);
+ 
+         path = g_build_filename (g_get_home_dir (),
+@@ -212,7 +227,14 @@ purge_thumbnail_cache (void)
+                                  "fail",
+                                  "gnome-thumbnail-factory",
+                                  NULL);
+-        files = read_dir_for_purge (path, files);
++        files = read_dir_for_purge (path, files, HASH_PNG);
++        g_free (path);
++
++        path = g_build_filename (g_get_user_cache_dir (),
++                                 "mojito",
++                                 "thumbnails",
++                                 NULL);
++        files = read_dir_for_purge (path, files, HASH);
+         g_free (path);
+ 
+         g_get_current_time (&current_time);
diff --git a/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/mount-plugin.patch b/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/mount-plugin.patch
new file mode 100644
index 0000000..67f056b
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon/mount-plugin.patch
@@ -0,0 +1,618 @@
+diff --git a/configure.ac b/configure.ac
+index 135f2ce..ba737a5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -356,6 +356,7 @@ plugins/keybindings/Makefile
+ plugins/keyboard/Makefile
+ plugins/media-keys/Makefile
+ plugins/media-keys/cut-n-paste/Makefile
++plugins/mount/Makefile
+ plugins/mouse/Makefile
+ plugins/screensaver/Makefile
+ plugins/sound/Makefile
+diff --git a/data/gnome-settings-daemon.schemas.in b/data/gnome-settings-daemon.schemas.in
+index 4920ae3..502e9e6 100644
+--- a/data/gnome-settings-daemon.schemas.in
++++ b/data/gnome-settings-daemon.schemas.in
+@@ -557,5 +557,29 @@
+       </locale>
+     </schema>
+ 
++    <schema>
++      <key>/schemas/apps/gnome_settings_daemon/plugins/mount/active</key>
++      <applyto>/apps/gnome_settings_daemon/plugins/mount/active</applyto>
++      <owner>gnome-settings-daemon</owner>
++      <type>bool</type>
++      <default>TRUE</default>
++      <locale name="C">
++        <short>Enable mount plugin</short>
++        <long>Set to True to enable the plugin to automount media.</long>
++      </locale>
++    </schema>
++    <schema>
++      <key>/schemas/apps/gnome_settings_daemon/plugins/mount/priority</key>
++      <applyto>/apps/gnome_settings_daemon/plugins/mount/priority</applyto>
++      <owner>gnome-settings-daemon</owner>
++      <type>int</type>
++      <default>99</default>
++      <locale name="C">
++        <short></short>
++        <long></long>
++      </locale>
++    </schema>
++
++
+   </schemalist>
+ </gconfschemafile>
+diff --git a/plugins/Makefile.am b/plugins/Makefile.am
+index 2d33061..46615c1 100644
+--- a/plugins/Makefile.am
++++ b/plugins/Makefile.am
+@@ -11,6 +11,7 @@ SUBDIRS =		\
+ 	keybindings	\
+ 	keyboard	\
+ 	media-keys	\
++	mount		\
+ 	mouse		\
+ 	screensaver	\
+ 	sound		\
+diff --git a/plugins/mount/Makefile.am b/plugins/mount/Makefile.am
+new file mode 100644
+index 0000000..188c83d
+--- /dev/null
++++ b/plugins/mount/Makefile.am
+@@ -0,0 +1,39 @@
++plugin_LTLIBRARIES = \
++	libmount.la
++
++libmount_la_SOURCES = 		\
++	gsd-mount-manager.c	\
++	gsd-mount-manager.h	\
++	gsd-mount-plugin.c	\
++	gsd-mount-plugin.h
++
++libmount_la_CPPFLAGS = \
++	-I$(top_srcdir)/gnome-settings-daemon		\
++	-DGNOME_SETTINGS_LOCALEDIR=\""$(datadir)/locale"\" \
++	$(AM_CPPFLAGS)
++
++libmount_la_CFLAGS = \
++	$(SETTINGS_PLUGIN_CFLAGS)	\
++	$(AM_CFLAGS)
++
++libmount_la_LDFLAGS = 		\
++	$(GSD_PLUGIN_LDFLAGS)
++
++libmount_la_LIBADD  = 		\
++	$(SETTINGS_PLUGIN_LIBS)
++
++plugin_in_files = 		\
++	mount.gnome-settings-plugin.in
++
++plugin_DATA = $(plugin_in_files:.gnome-settings-plugin.in=.gnome-settings-plugin)
++
++EXTRA_DIST = 			\
++	$(plugin_in_files)
++
++CLEANFILES = 			\
++	$(plugin_DATA)
++
++DISTCLEANFILES =		\
++	$(plugin_DATA)
++
++@GSD_INTLTOOL_PLUGIN_RULE@
+diff --git a/plugins/mount/gsd-mount-manager.c b/plugins/mount/gsd-mount-manager.c
+new file mode 100644
+index 0000000..a768f03
+--- /dev/null
++++ b/plugins/mount/gsd-mount-manager.c
+@@ -0,0 +1,261 @@
++/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-
++ *
++ * Copyright (C) 2009 Intel Corporation
++ *
++ * This program is free software; you can redistribute it and/or modify it under
++ * the terms of the GNU General Public License as published by the Free Software
++ * Foundation; either version 2 of the License, or (at your option) any later
++ * version.
++ *
++ * This program is distributed in the hope that it will be useful, but WITHOUT
++ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
++ * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
++ * details.
++ *
++ * You should have received a copy of the GNU General Public License along with
++ * this program; if not, write to the Free Software Foundation, Inc., 59 Temple
++ * Place - Suite 330, Boston, MA 02111-1307, USA.
++ *
++ */
++
++#include <config.h>
++
++#include <glib.h>
++#include <glib/gi18n.h>
++#include <gio/gio.h>
++#include <gtk/gtk.h>
++
++#include "gsd-mount-manager.h"
++
++#define GSD_MOUNT_MANAGER_GET_PRIVATE(o) (G_TYPE_INSTANCE_GET_PRIVATE ((o), GSD_TYPE_MOUNT_MANAGER, GsdMountManagerPrivate))
++
++struct GsdMountManagerPrivate
++{
++        GVolumeMonitor *monitor;
++};
++
++G_DEFINE_TYPE (GsdMountManager, gsd_mount_manager, G_TYPE_OBJECT)
++
++static gpointer manager_object = NULL;
++
++#if 0
++static void
++drive_connected_cb (GVolumeMonitor *monitor,
++                    GDrive *drive,
++                    GsdMountManager *manager)
++{
++        /* TODO: listen for the eject button */
++}
++#endif
++
++static void
++volume_mounted_cb (GObject *source_object, GAsyncResult *result, gpointer user_data)
++{
++        GError *error = NULL;
++        char *name;
++
++        name = g_volume_get_name (G_VOLUME (source_object));
++
++	if (!g_volume_mount_finish (G_VOLUME (source_object), result, &error)) {
++                g_debug ("Failed to mount '%s': %s", name, error->message);
++
++		if (error->code != G_IO_ERROR_FAILED_HANDLED) {
++                        char *primary;
++                        GtkWidget *dialog;
++
++			primary = g_strdup_printf (_("Unable to mount %s"), name);
++
++                        dialog = gtk_message_dialog_new (NULL, 0,
++                                                         GTK_MESSAGE_ERROR,
++                                                         GTK_BUTTONS_CLOSE,
++                                                         primary);
++
++			g_free (primary);
++                        gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG (dialog), error->message);
++
++                        gtk_dialog_run (GTK_DIALOG (dialog));
++                        gtk_widget_destroy (dialog);
++		}
++		g_error_free (error);
++	} else {
++                g_debug ("Mounted '%s'", name);
++        }
++
++        g_free (name);
++}
++
++static void
++volume_added_cb (GVolumeMonitor *monitor,
++                 GVolume *volume,
++                 GsdMountManager *manager)
++{
++        char *name;
++
++        name = g_volume_get_name (volume);
++        g_debug ("Volme '%s' added", name);
++
++        if (g_volume_can_mount (volume)) {
++                GMountOperation *mount_op;
++
++                g_debug ("Mounting '%s'", name);
++
++                mount_op = gtk_mount_operation_new (NULL);
++                g_volume_mount (volume, G_MOUNT_MOUNT_NONE,
++                                mount_op, NULL,
++                                volume_mounted_cb, manager);
++        }
++
++        g_free (name);
++}
++
++static void
++mount_added_cb (GVolumeMonitor *monitor,
++                GMount *mount,
++                GsdMountManager *manager)
++{
++        GFile *file;
++        char *uri;
++
++        file = g_mount_get_root (mount);
++        uri = g_file_get_uri (file);
++
++        g_debug ("%s mounted, starting file manager", uri);
++
++        /* TODO: error */
++        gtk_show_uri (NULL, uri, GDK_CURRENT_TIME, NULL);
++
++        g_free (uri);
++        g_object_unref (file);
++}
++
++static void
++mount_existing_volumes (GsdMountManager *manager)
++{
++        /* TODO: iterate over drives to hook up eject */
++        GList *l;
++
++        g_debug ("Mounting existing volumes");
++
++        l = g_volume_monitor_get_volumes (manager->priv->monitor);
++        while (l) {
++                GVolume *volume = l->data;
++                GMount *mount;
++
++                mount = g_volume_get_mount (volume);
++                if (mount == NULL &&
++                    g_volume_can_mount (volume) &&
++                    g_volume_should_automount (volume)) {
++                        GMountOperation *mount_op;
++                        char *name;
++
++                        name = g_volume_get_name (volume);
++                        g_debug ("Mounting '%s'", name);
++                        g_free (name);
++
++                        mount_op = gtk_mount_operation_new (NULL);
++                        g_volume_mount (volume, G_MOUNT_MOUNT_NONE,
++                                        mount_op, NULL,
++                                        volume_mounted_cb, manager);
++                }
++
++                if (mount)
++                        g_object_unref (mount);
++                g_object_unref (volume);
++                l = g_list_delete_link (l, l);
++        }
++}
++
++gboolean
++gsd_mount_manager_start (GsdMountManager *manager,
++                               GError               **error)
++{
++        g_debug ("Starting mount manager");
++
++        manager->priv->monitor = g_volume_monitor_get ();
++
++#if 0
++	g_signal_connect_object (manager->priv->monitor, "drive-connected",
++				 G_CALLBACK (drive_connected_cb), manager, 0);
++#endif
++	g_signal_connect_object (manager->priv->monitor, "volume-added",
++				 G_CALLBACK (volume_added_cb), manager, 0);
++	g_signal_connect_object (manager->priv->monitor, "mount-added",
++				 G_CALLBACK (mount_added_cb), manager, 0);
++
++        /* TODO: handle eject buttons */
++
++#if 0
++        mount_existing_volumes (manager);
++#endif
++
++        return TRUE;
++}
++
++void
++gsd_mount_manager_stop (GsdMountManager *manager)
++{
++        g_debug ("Stopping mount manager");
++}
++
++static void
++gsd_mount_manager_dispose (GObject *object)
++{
++        GsdMountManager *manager = GSD_MOUNT_MANAGER (object);
++
++        if (manager->priv->monitor) {
++                g_signal_handlers_disconnect_by_func
++                        (manager->priv->monitor, volume_added_cb, manager);
++                g_signal_handlers_disconnect_by_func
++                        (manager->priv->monitor, mount_added_cb, manager);
++                g_object_unref (manager->priv->monitor);
++                manager->priv->monitor = NULL;
++        }
++
++        G_OBJECT_CLASS (gsd_mount_manager_parent_class)->dispose (object);
++}
++
++static void
++gsd_mount_manager_init (GsdMountManager *manager)
++{
++        manager->priv = GSD_MOUNT_MANAGER_GET_PRIVATE (manager);
++}
++
++static void
++gsd_mount_manager_finalize (GObject *object)
++{
++        GsdMountManager *mount_manager;
++
++        g_return_if_fail (object != NULL);
++        g_return_if_fail (GSD_IS_MOUNT_MANAGER (object));
++
++        mount_manager = GSD_MOUNT_MANAGER (object);
++
++        g_return_if_fail (mount_manager->priv != NULL);
++
++        G_OBJECT_CLASS (gsd_mount_manager_parent_class)->finalize (object);
++}
++
++static void
++gsd_mount_manager_class_init (GsdMountManagerClass *klass)
++{
++        GObjectClass   *object_class = G_OBJECT_CLASS (klass);
++
++        object_class->dispose = gsd_mount_manager_dispose;
++        object_class->finalize = gsd_mount_manager_finalize;
++
++        g_type_class_add_private (klass, sizeof (GsdMountManagerPrivate));
++}
++
++GsdMountManager *
++gsd_mount_manager_new (void)
++{
++        if (manager_object != NULL) {
++                g_object_ref (manager_object);
++        } else {
++                manager_object = g_object_new (GSD_TYPE_MOUNT_MANAGER, NULL);
++                g_object_add_weak_pointer (manager_object,
++                                           (gpointer *) &manager_object);
++        }
++
++        return GSD_MOUNT_MANAGER (manager_object);
++}
+diff --git a/plugins/mount/gsd-mount-manager.h b/plugins/mount/gsd-mount-manager.h
+new file mode 100644
+index 0000000..9093fff
+--- /dev/null
++++ b/plugins/mount/gsd-mount-manager.h
+@@ -0,0 +1,58 @@
++/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-
++ *
++ * Copyright (C) 2009 Intel Corporation
++ *
++ * This program is free software; you can redistribute it and/or modify it under
++ * the terms of the GNU General Public License as published by the Free Software
++ * Foundation; either version 2 of the License, or (at your option) any later
++ * version.
++ *
++ * This program is distributed in the hope that it will be useful, but WITHOUT
++ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
++ * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
++ * details.
++ *
++ * You should have received a copy of the GNU General Public License along with
++ * this program; if not, write to the Free Software Foundation, Inc., 59 Temple
++ * Place - Suite 330, Boston, MA 02111-1307, USA.
++ *
++ */
++
++#ifndef __GSD_MOUNT_MANAGER_H
++#define __GSD_MOUNT_MANAGER_H
++
++#include <glib-object.h>
++
++G_BEGIN_DECLS
++
++#define GSD_TYPE_MOUNT_MANAGER         (gsd_mount_manager_get_type ())
++#define GSD_MOUNT_MANAGER(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), GSD_TYPE_MOUNT_MANAGER, GsdMountManager))
++#define GSD_MOUNT_MANAGER_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST((k), GSD_TYPE_MOUNT_MANAGER, GsdMountManagerClass))
++#define GSD_IS_MOUNT_MANAGER(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), GSD_TYPE_MOUNT_MANAGER))
++#define GSD_IS_MOUNT_MANAGER_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE ((k), GSD_TYPE_MOUNT_MANAGER))
++#define GSD_MOUNT_MANAGER_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), GSD_TYPE_MOUNT_MANAGER, GsdMountManagerClass))
++
++typedef struct GsdMountManagerPrivate GsdMountManagerPrivate;
++
++typedef struct
++{
++        GObject parent;
++        GsdMountManagerPrivate *priv;
++} GsdMountManager;
++
++typedef struct
++{
++        GObjectClass parent_class;
++} GsdMountManagerClass;
++
++GType                   gsd_mount_manager_get_type            (void);
++
++GsdMountManager *       gsd_mount_manager_new                 (void);
++
++gboolean                gsd_mount_manager_start               (GsdMountManager *manager,
++                                                               GError         **error);
++void                    gsd_mount_manager_stop                (GsdMountManager *manager);
++
++G_END_DECLS
++
++#endif /* __GSD_MOUNT_MANAGER_H */
+diff --git a/plugins/mount/gsd-mount-plugin.c b/plugins/mount/gsd-mount-plugin.c
+new file mode 100644
+index 0000000..af295a5
+--- /dev/null
++++ b/plugins/mount/gsd-mount-plugin.c
+@@ -0,0 +1,103 @@
++/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-
++ *
++ * Copyright (C) 2009 Intel Corporation
++ *
++ * This program is free software; you can redistribute it and/or modify it under
++ * the terms of the GNU General Public License as published by the Free Software
++ * Foundation; either version 2, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful, but WITHOUT
++ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
++ * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
++ * details.
++ *
++ * You should have received a copy of the GNU General Public License along with
++ * this program; if not, write to the Free Software Foundation, Inc., 59 Temple
++ * Place - Suite 330, Boston, MA 02111-1307, USA.
++ *
++ */
++
++#include <config.h>
++
++#include <glib/gi18n.h>
++#include <gmodule.h>
++#include <gnome-settings-daemon/gnome-settings-plugin.h>
++
++#include "gsd-mount-plugin.h"
++#include "gsd-mount-manager.h"
++
++struct GsdMountPluginPrivate {
++        GsdMountManager *manager;
++};
++
++#define GSD_MOUNT_PLUGIN_GET_PRIVATE(object) (G_TYPE_INSTANCE_GET_PRIVATE ((object), GSD_TYPE_MOUNT_PLUGIN, GsdMountPluginPrivate))
++
++GNOME_SETTINGS_PLUGIN_REGISTER (GsdMountPlugin, gsd_mount_plugin)
++
++static void
++gsd_mount_plugin_init (GsdMountPlugin *plugin)
++{
++        plugin->priv = GSD_MOUNT_PLUGIN_GET_PRIVATE (plugin);
++
++        g_debug ("GsdMountPlugin initializing");
++
++        plugin->priv->manager = gsd_mount_manager_new ();
++}
++
++static void
++gsd_mount_plugin_finalize (GObject *object)
++{
++        GsdMountPlugin *plugin;
++
++        g_return_if_fail (object != NULL);
++        g_return_if_fail (GSD_IS_MOUNT_PLUGIN (object));
++
++        g_debug ("GsdMountPlugin finalizing");
++
++        plugin = GSD_MOUNT_PLUGIN (object);
++
++        g_return_if_fail (plugin->priv != NULL);
++
++        if (plugin->priv->manager != NULL) {
++                g_object_unref (plugin->priv->manager);
++        }
++
++        G_OBJECT_CLASS (gsd_mount_plugin_parent_class)->finalize (object);
++}
++
++static void
++impl_activate (GnomeSettingsPlugin *plugin)
++{
++        gboolean res;
++        GError  *error;
++
++        g_debug ("Activating mount plugin");
++
++        error = NULL;
++        res = gsd_mount_manager_start (GSD_MOUNT_PLUGIN (plugin)->priv->manager, &error);
++        if (! res) {
++                g_warning ("Unable to start mount manager: %s", error->message);
++                g_error_free (error);
++        }
++}
++
++static void
++impl_deactivate (GnomeSettingsPlugin *plugin)
++{
++        g_debug ("Deactivating mount plugin");
++        gsd_mount_manager_stop (GSD_MOUNT_PLUGIN (plugin)->priv->manager);
++}
++
++static void
++gsd_mount_plugin_class_init (GsdMountPluginClass *klass)
++{
++        GObjectClass           *object_class = G_OBJECT_CLASS (klass);
++        GnomeSettingsPluginClass *plugin_class = GNOME_SETTINGS_PLUGIN_CLASS (klass);
++
++        object_class->finalize = gsd_mount_plugin_finalize;
++
++        plugin_class->activate = impl_activate;
++        plugin_class->deactivate = impl_deactivate;
++
++        g_type_class_add_private (klass, sizeof (GsdMountPluginPrivate));
++}
+diff --git a/plugins/mount/gsd-mount-plugin.h b/plugins/mount/gsd-mount-plugin.h
+new file mode 100644
+index 0000000..526a41f
+--- /dev/null
++++ b/plugins/mount/gsd-mount-plugin.h
+@@ -0,0 +1,55 @@
++/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-
++ *
++ * Copyright (C) 2009 Intel Corporation
++ *
++ * This program is free software; you can redistribute it and/or modify it under
++ * the terms of the GNU General Public License as published by the Free Software
++ * Foundation; either version 2, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful, but WITHOUT
++ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
++ * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
++ * details.
++ *
++ * You should have received a copy of the GNU General Public License along with
++ * this program; if not, write to the Free Software Foundation, Inc., 59 Temple
++ * Place - Suite 330, Boston, MA 02111-1307, USA.
++ *
++ */
++
++#ifndef __GSD_MOUNT_PLUGIN_H__
++#define __GSD_MOUNT_PLUGIN_H__
++
++#include <glib-object.h>
++#include <gmodule.h>
++#include <gnome-settings-daemon/gnome-settings-plugin.h>
++
++G_BEGIN_DECLS
++
++#define GSD_TYPE_MOUNT_PLUGIN                (gsd_mount_plugin_get_type ())
++#define GSD_MOUNT_PLUGIN(o)                  (G_TYPE_CHECK_INSTANCE_CAST ((o), GSD_TYPE_MOUNT_PLUGIN, GsdMountPlugin))
++#define GSD_MOUNT_PLUGIN_CLASS(k)            (G_TYPE_CHECK_CLASS_CAST((k), GSD_TYPE_MOUNT_PLUGIN, GsdMountPluginClass))
++#define GSD_IS_MOUNT_PLUGIN(o)               (G_TYPE_CHECK_INSTANCE_TYPE ((o), GSD_TYPE_MOUNT_PLUGIN))
++#define GSD_IS_MOUNT_PLUGIN_CLASS(k)         (G_TYPE_CHECK_CLASS_TYPE ((k), GSD_TYPE_MOUNT_PLUGIN))
++#define GSD_MOUNT_PLUGIN_GET_CLASS(o)        (G_TYPE_INSTANCE_GET_CLASS ((o), GSD_TYPE_MOUNT_PLUGIN, GsdMountPluginClass))
++
++typedef struct GsdMountPluginPrivate GsdMountPluginPrivate;
++
++typedef struct
++{
++        GnomeSettingsPlugin    parent;
++        GsdMountPluginPrivate *priv;
++} GsdMountPlugin;
++
++typedef struct
++{
++        GnomeSettingsPluginClass parent_class;
++} GsdMountPluginClass;
++
++GType   gsd_mount_plugin_get_type            (void) G_GNUC_CONST;
++
++G_MODULE_EXPORT GType register_gnome_settings_plugin (GTypeModule *module);
++
++G_END_DECLS
++
++#endif /* __GSD_MOUNT_PLUGIN_H__ */
+diff --git a/plugins/mount/mount.gnome-settings-plugin.in b/plugins/mount/mount.gnome-settings-plugin.in
+new file mode 100644
+index 0000000..ca29ad1
+--- /dev/null
++++ b/plugins/mount/mount.gnome-settings-plugin.in
+@@ -0,0 +1,8 @@
++[GNOME Settings Plugin]
++Module=mount
++IAge=0
++_Name=Mount
++_Description=Mount removable media
++Authors=Ross Burton
++Copyright=Copyright © 2009 Intel Corporation
++Website=
diff --git a/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon_2.26.1.bb b/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon_2.26.1.bb
new file mode 100644
index 0000000..cb216b2
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/gnome-settings-daemon_2.26.1.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "GNOME settings daemon"
+LICENSE = "GPL"
+DEPENDS = "libxklavier gnome-doc-utils gtk+ libglade libgnomekbd gnome-desktop librsvg libxml2 libart-lgpl"
+
+PR = "r3"
+
+inherit gnome
+
+SRC_URI += "file://desktop-moblin.patch;patch=1 \
+            file://gnome-settings-daemon-fix-gthread.patch;patch=1 \
+            file://mount-plugin.patch;patch=1 \
+            file://gnome-settings-daemon-2.24.0-catch-deviceadded.patch;patch=1 \
+            file://configurefix.patch;patch=1 \
+            file://mojito-cleanup.patch;patch=1"
+
+EXTRA_OECONF = "--disable-esd --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR}"
+ASNEEDED = ""
+
+FILES_${PN} += "${libdir}/gnome-settings-daemon-2.0/*.so ${libdir}/gnome-settings-daemon-2.0/*plugin \
+                ${datadir}/dbus-1/ \
+                ${datadir}/icon* \
+                ${datadir}/xsession*"
+
+FILES_${PN}-dbg += "${libdir}/gnome-settings-daemon-2.0/.debug"
+FILES_${PN}-dev += "${libdir}/gnome-settings-daemon-2.0/*.a ${libdir}/gnome-settings-daemon-2.0/*.la"
-- 
1.6.6.1



