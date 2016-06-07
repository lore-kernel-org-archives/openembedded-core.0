Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BEEE077183
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 07 Jun 2016 01:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174506"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:18 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:35 +0300
Message-Id: <002817ebbcdfcc9401be5898bb466ec2954c8df1.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 17/37] gst-player: Start building with Gtk+3
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:34 -0000

Drop the patch that added gtk+2 support.
Use an icon that is found in adwaita icon theme.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../gstreamer/gst-player/gst-player.desktop        |  2 +-
 .../gstreamer/gst-player/gtk2.patch                | 71 ----------------------
 .../recipes-multimedia/gstreamer/gst-player_git.bb |  5 +-
 3 files changed, 3 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/gtk2.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-player/gst-player.desktop b/meta/recipes-multimedia/gstreamer/gst-player/gst-player.desktop
index 9fd207b..7ddd456 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player/gst-player.desktop
+++ b/meta/recipes-multimedia/gstreamer/gst-player/gst-player.desktop
@@ -1,7 +1,7 @@
 [Desktop Entry]
 Name=Media Player
 Comment=Basic media player
-Icon=audio-player
+Icon=multimedia-player
 TryExec=gtk-play
 Exec=gtk-play
 StartupNotify=true
diff --git a/meta/recipes-multimedia/gstreamer/gst-player/gtk2.patch b/meta/recipes-multimedia/gstreamer/gst-player/gtk2.patch
deleted file mode 100644
index 2cd18bb..0000000
--- a/meta/recipes-multimedia/gstreamer/gst-player/gtk2.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-As the rest of Sato is GTK+ 2, patch gtk-play to use GTK+ 2.  When the rest of
-Sato has been ported to GTK+ 3 this patch can be dropped.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-
-diff --git a/configure.ac b/configure.ac
-index b8af13b..90ab74c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -60,7 +60,7 @@ AC_SUBST(GLIB_PREFIX)
- GST_PREFIX="`$PKG_CONFIG --variable=prefix gstreamer-1.0`"
- AC_SUBST(GST_PREFIX)
- 
--PKG_CHECK_MODULES(GTK, [gtk+-3.0], [have_gtk="yes"], [have_gtk="no"])
-+PKG_CHECK_MODULES(GTK, [gtk+-2.0], [have_gtk="yes"], [have_gtk="no"])
- AM_CONDITIONAL(HAVE_GTK, test "x$have_gtk" != "xno")
- 
- GOBJECT_INTROSPECTION_CHECK([1.31.1])
-diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
-index f015077..954d6fb 100644
---- a/gtk/gtk-play.c
-+++ b/gtk/gtk-play.c
-@@ -34,6 +34,46 @@ typedef struct
-   gulong seekbar_value_changed_signal_id;
- } GtkPlay;
- 
-+/* Compat stubs */
-+GtkWidget *
-+gtk_box_new (GtkOrientation orientation,
-+             gint spacing)
-+{
-+  switch (orientation) {
-+  case GTK_ORIENTATION_HORIZONTAL:
-+    return gtk_hbox_new (FALSE, spacing);
-+  case GTK_ORIENTATION_VERTICAL:
-+    return gtk_vbox_new (FALSE, spacing);
-+  }
-+}
-+
-+GtkWidget*
-+gtk_button_new_from_icon_name (const gchar *icon_name,
-+                               GtkIconSize  size)
-+{
-+  GtkWidget *button;
-+  GtkWidget *image;
-+
-+  image = gtk_image_new_from_icon_name (icon_name, size);
-+  button =  g_object_new (GTK_TYPE_BUTTON,
-+                         "image", image,
-+                         NULL);
-+  return button;
-+}
-+
-+GtkWidget *
-+gtk_scale_new_with_range (GtkOrientation orientation,
-+                          gdouble min,
-+                          gdouble max,
-+                          gdouble step)
-+{
-+  switch (orientation) {
-+  case GTK_ORIENTATION_HORIZONTAL:
-+    return gtk_hscale_new_with_range (min, max, step);
-+  case GTK_ORIENTATION_VERTICAL:
-+    return gtk_vscale_new_with_range (min, max, step);
-+  }
-+}
- 
- static void
- set_title (GtkPlay * play, const gchar * title)
diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index 8129169..6d39c2d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -2,11 +2,10 @@ SUMMARY = "GStreamer playback helper library and examples"
 LICENSE = "LGPL-2.0+"
 LIC_FILES_CHKSUM = "file://lib/gst/player/gstplayer.c;beginline=1;endline=19;md5=03aeca9d8295f811817909075a15ff65"
 
-DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gtk+"
+DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gtk+3"
 
 SRC_URI = "git://github.com/sdroege/gst-player.git \
            file://filechooser.patch \
-           file://gtk2.patch \
            file://Fix-pause-play.patch \
            file://Add-error-signal-emission-for-missing-plugins.patch \
            file://gst-player.desktop"
@@ -17,7 +16,7 @@ S = "${WORKDIR}/git"
 
 inherit autotools gtk-doc lib_package pkgconfig distro_features_check gobject-introspection
 
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 do_configure_prepend() {
 	touch ${S}/ChangeLog
-- 
2.1.4


