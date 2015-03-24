Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1F73A73A99
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 16:15:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Mar 2015 09:15:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,459,1422950400"; d="scan'208";a="703459818"
Received: from heimdall.fi.intel.com ([10.237.72.61])
	by orsmga002.jf.intel.com with ESMTP; 24 Mar 2015 09:15:34 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Mar 2015 18:15:28 +0200
Message-Id: <1427213728-20816-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gst-player: Add error messages for missing plugins
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
X-List-Received-Date: Tue, 24 Mar 2015 16:15:36 -0000

Make it easier to understand problems with missing gstreamer plugins
(e.g. decoders) by adding an info bar with a message like "Missing
plugin 'MPEG-4 AAC decoder'" to the player.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...error-signal-emission-for-missing-plugins.patch | 252 +++++++++++++++++++++
 .../recipes-multimedia/gstreamer/gst-player_git.bb |   1 +
 2 files changed, 253 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-player/Add-error-signal-emission-for-missing-plugins.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-player/Add-error-signal-emission-for-missing-plugins.patch b/meta/recipes-multimedia/gstreamer/gst-player/Add-error-signal-emission-for-missing-plugins.patch
new file mode 100644
index 0000000..712d46d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-player/Add-error-signal-emission-for-missing-plugins.patch
@@ -0,0 +1,252 @@
+From d64c7edb66f4a64ff49c4306cf77fd269b7079ab Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Mon, 16 Mar 2015 13:45:30 +0200
+Subject: [PATCH] Add error signal emission for missing plugins
+
+Add a missing plugins error signal to gst-player. Note that this error
+does not necessarily mean the playback has completely failed, but in
+practice the user experience will be bad (think, e.g. of a mp4 file
+where H.264 codec is missing: AAC playback still works...).
+
+Use the signal in gtk-play to show a infobar if plugins are missing.
+
+Submitted upstream at https://github.com/sdroege/gst-player/pull/11
+
+Upstream-Status: Submitted
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.ac               |  2 +-
+ gtk/gtk-play.c             | 54 +++++++++++++++++++++++++++++++++++++++++++++-
+ lib/gst/player/gstplayer.c | 22 +++++++++++++++++++
+ lib/gst/player/gstplayer.h |  3 ++-
+ 4 files changed, 78 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 90ab74c..6cdb4eb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -53,7 +53,7 @@ AC_SUBST(LT_AGE)
+ PKG_PROG_PKG_CONFIG
+ 
+ PKG_CHECK_MODULES(GLIB, [glib-2.0 gobject-2.0])
+-PKG_CHECK_MODULES(GSTREAMER, [gstreamer-1.0 >= 1.4 gstreamer-video-1.0 >= 1.4])
++PKG_CHECK_MODULES(GSTREAMER, [gstreamer-1.0 >= 1.4 gstreamer-video-1.0 >= 1.4 gstreamer-pbutils-1.0])
+ 
+ GLIB_PREFIX="`$PKG_CONFIG --variable=prefix glib-2.0`"
+ AC_SUBST(GLIB_PREFIX)
+diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
+index b92773b..e2b605a 100644
+--- a/gtk/gtk-play.c
++++ b/gtk/gtk-play.c
+@@ -30,6 +30,8 @@ typedef struct
+   GtkWidget *prev_button, *next_button;
+   GtkWidget *seekbar;
+   GtkWidget *video_area;
++  GtkWidget *info_label;
++  GtkWidget *info_bar;
+   GtkWidget *volume_button;
+   gulong seekbar_value_changed_signal_id;
+   gboolean playing;
+@@ -141,6 +143,13 @@ play_pause_clicked_cb (GtkButton * button, GtkPlay * play)
+ }
+ 
+ static void
++clear_missing_plugins (GtkPlay * play)
++{
++  gtk_label_set_text (GTK_LABEL (play->info_label), "");
++  gtk_widget_hide (play->info_bar);
++}
++
++static void
+ skip_prev_clicked_cb (GtkButton * button, GtkPlay * play)
+ {
+   GList *prev;
+@@ -155,6 +164,7 @@ skip_prev_clicked_cb (GtkButton * button, GtkPlay * play)
+ 
+   gtk_widget_set_sensitive (play->next_button, TRUE);
+   gst_player_set_uri (play->player, prev->data);
++  clear_missing_plugins (play);
+   gst_player_play (play->player);
+   set_title (play, prev->data);
+   gtk_widget_set_sensitive (play->prev_button, g_list_previous (prev) != NULL);
+@@ -175,6 +185,7 @@ skip_next_clicked_cb (GtkButton * button, GtkPlay * play)
+ 
+   gtk_widget_set_sensitive (play->prev_button, TRUE);
+   gst_player_set_uri (play->player, next->data);
++  clear_missing_plugins (play);
+   gst_player_play (play->player);
+   set_title (play, next->data);
+   gtk_widget_set_sensitive (play->next_button, g_list_next (next) != NULL);
+@@ -193,10 +204,16 @@ volume_changed_cb (GtkScaleButton * button, gdouble value, GtkPlay * play)
+   gst_player_set_volume (play->player, value);
+ }
+ 
++void
++info_bar_response_cb (GtkInfoBar * bar, gint response, GtkPlay * play)
++{
++  gtk_widget_hide (GTK_WIDGET (bar));
++}
++
+ static void
+ create_ui (GtkPlay * play)
+ {
+-  GtkWidget *controls, *main_hbox, *main_vbox;
++  GtkWidget *controls, *main_hbox, *main_vbox, *info_bar, *content_area;
+ 
+   play->window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
+   g_signal_connect (G_OBJECT (play->window), "delete-event",
+@@ -208,6 +225,20 @@ create_ui (GtkPlay * play)
+   g_signal_connect (play->video_area, "realize",
+       G_CALLBACK (video_area_realize_cb), play);
+ 
++  play->info_bar = gtk_info_bar_new ();
++  gtk_info_bar_set_message_type (GTK_INFO_BAR (play->info_bar),
++      GTK_MESSAGE_WARNING);
++  //gtk_info_bar_set_show_close_button (GTK_INFO_BAR (play->info_bar),
++  //    TRUE);
++  gtk_widget_set_no_show_all (play->info_bar, TRUE);
++  g_signal_connect (play->info_bar, "response",
++      G_CALLBACK (info_bar_response_cb), play);
++
++  content_area = gtk_info_bar_get_content_area (GTK_INFO_BAR (play->info_bar));
++  play->info_label = gtk_label_new ("");
++  gtk_container_add (GTK_CONTAINER (content_area), play->info_label);
++  gtk_widget_show (play->info_label);
++
+   /* Unified play/pause button */
+   play->play_pause_button =
+       gtk_button_new_from_icon_name ("media-playback-pause",
+@@ -258,6 +289,7 @@ create_ui (GtkPlay * play)
+ 
+   main_vbox = gtk_box_new (GTK_ORIENTATION_VERTICAL, 0);
+   gtk_box_pack_start (GTK_BOX (main_vbox), main_hbox, TRUE, TRUE, 0);
++  gtk_box_pack_start (GTK_BOX (main_vbox), play->info_bar, FALSE, FALSE, 0);
+   gtk_box_pack_start (GTK_BOX (main_vbox), controls, FALSE, FALSE, 0);
+   gtk_container_add (GTK_CONTAINER (play->window), main_vbox);
+ 
+@@ -322,6 +354,7 @@ eos_cb (GstPlayer * unused, GtkPlay * play)
+       gtk_widget_set_sensitive (play->next_button, g_list_next (next) != NULL);
+ 
+       gst_player_set_uri (play->player, next->data);
++      clear_missing_plugins (play);
+       gst_player_play (play->player);
+       set_title (play, next->data);
+     } else {
+@@ -330,6 +363,24 @@ eos_cb (GstPlayer * unused, GtkPlay * play)
+   }
+ }
+ 
++static void
++error_cb (GstPlayer * player, GError * err, GtkPlay * play)
++{
++  char *message;
++
++  if (g_error_matches (err, gst_player_error_quark (),
++      GST_PLAYER_ERROR_MISSING_PLUGIN)) {
++    // add message to end of any existing message: there may be
++    // multiple missing plugins.
++    message = g_strdup_printf ("%s%s. ",
++        gtk_label_get_text (GTK_LABEL (play->info_label)), err->message);
++    gtk_label_set_text (GTK_LABEL (play->info_label), message);
++    g_free (message);
++
++    gtk_widget_show (play->info_bar);
++  }
++}
++
+ int
+ main (gint argc, gchar ** argv)
+ {
+@@ -422,6 +473,7 @@ main (gint argc, gchar ** argv)
+   g_signal_connect (play.player, "video-dimensions-changed",
+       G_CALLBACK (video_dimensions_changed_cb), &play);
+   g_signal_connect (play.player, "end-of-stream", G_CALLBACK (eos_cb), &play);
++  g_signal_connect (play.player, "error", G_CALLBACK (error_cb), &play);
+ 
+   /* We have file(s) that need playing. */
+   set_title (&play, g_list_first (play.uris)->data);
+diff --git a/lib/gst/player/gstplayer.c b/lib/gst/player/gstplayer.c
+index bd682d9..78e7ba1 100644
+--- a/lib/gst/player/gstplayer.c
++++ b/lib/gst/player/gstplayer.c
+@@ -47,6 +47,7 @@
+ 
+ #include <gst/gst.h>
+ #include <gst/video/video.h>
++#include <gst/pbutils/missing-plugins.h>
+ 
+ GST_DEBUG_CATEGORY_STATIC (gst_player_debug);
+ #define GST_CAT_DEFAULT gst_player_debug
+@@ -238,6 +239,7 @@ gst_player_class_init (GstPlayerClass * klass)
+       g_signal_new ("video-dimensions-changed", G_TYPE_FROM_CLASS (klass),
+       G_SIGNAL_RUN_LAST | G_SIGNAL_NO_RECURSE | G_SIGNAL_NO_HOOKS, 0, NULL,
+       NULL, NULL, G_TYPE_NONE, 2, G_TYPE_INT, G_TYPE_INT);
++
+ }
+ 
+ static void
+@@ -619,6 +621,21 @@ error_cb (GstBus * bus, GstMessage * msg, gpointer user_data)
+   g_mutex_unlock (&self->priv->lock);
+ }
+ 
++static void
++element_cb (GstBus * bus, GstMessage * msg, gpointer user_data)
++{
++  GstPlayer *self = GST_PLAYER (user_data);
++
++  if (gst_is_missing_plugin_message (msg)) {
++    gchar *desc;
++
++    desc = gst_missing_plugin_message_get_description (msg);
++    emit_error (self, g_error_new (GST_PLAYER_ERROR,
++        GST_PLAYER_ERROR_MISSING_PLUGIN, "Missing plugin '%s'", desc));
++    g_free (desc);
++  }
++}
++
+ static gboolean
+ eos_dispatch (gpointer user_data)
+ {
+@@ -1059,6 +1076,8 @@ gst_player_main (gpointer data)
+       NULL, NULL);
+   g_source_attach (bus_source, self->priv->context);
+ 
++  g_signal_connect (G_OBJECT (bus), "message::element",
++      G_CALLBACK (element_cb), self);
+   g_signal_connect (G_OBJECT (bus), "message::error", G_CALLBACK (error_cb),
+       self);
+   g_signal_connect (G_OBJECT (bus), "message::eos", G_CALLBACK (eos_cb), self);
+@@ -1560,6 +1579,7 @@ gst_player_error_get_type (void)
+   static gsize id = 0;
+   static const GEnumValue values[] = {
+     {C_ENUM (GST_PLAYER_ERROR_FAILED), "GST_PLAYER_ERROR_FAILED", "failed"},
++    {C_ENUM (GST_PLAYER_ERROR_MISSING_PLUGIN), "GST_PLAYER_ERROR_MISSING_PLUGIN", "missing-plugin"},
+     {0, NULL, NULL}
+   };
+ 
+@@ -1577,6 +1597,8 @@ gst_player_error_get_name (GstPlayerError error)
+   switch (error) {
+     case GST_PLAYER_ERROR_FAILED:
+       return "failed";
++    case GST_PLAYER_ERROR_MISSING_PLUGIN:
++      return "missing-plugin";
+   }
+ 
+   g_assert_not_reached ();
+diff --git a/lib/gst/player/gstplayer.h b/lib/gst/player/gstplayer.h
+index c438513..35fb5bb 100644
+--- a/lib/gst/player/gstplayer.h
++++ b/lib/gst/player/gstplayer.h
+@@ -44,7 +44,8 @@ GType        gst_player_error_get_type                (void);
+ #define      GST_TYPE_PLAYER_ERROR                    (gst_player_error_get_type ())
+ 
+ typedef enum {
+-  GST_PLAYER_ERROR_FAILED = 0
++  GST_PLAYER_ERROR_FAILED = 0,
++  GST_PLAYER_ERROR_MISSING_PLUGIN
+ } GstPlayerError;
+ 
+ const gchar *gst_player_error_get_name                (GstPlayerError error);
+-- 
+2.1.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index 07224c0..54cfbbc 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://github.com/sdroege/gst-player.git \
            file://filechooser.patch \
            file://gtk2.patch \
            file://Fix-pause-play.patch \
+           file://Add-error-signal-emission-for-missing-plugins.patch \
            file://gst-player.desktop"
 
 SRCREV = "5386c5b984d40ef5434673ed62204e69aaf52645"
-- 
2.1.4


