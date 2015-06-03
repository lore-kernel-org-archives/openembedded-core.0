Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 405BC65D6E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 14:47:17 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 694DCF811EA; Wed,  3 Jun 2015 08:47:18 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL,FRT_ADOBE2 autolearn=no version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id A95E7F811EC;
	Wed,  3 Jun 2015 08:47:17 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 08:47:47 -0600
Message-Id: <1433342867-4644-3-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433342867-4644-1-git-send-email-gary@mlbassoc.com>
References: <1433342867-4644-1-git-send-email-gary@mlbassoc.com>
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH 2/2] gst-player: Remove obsolete patches (now in upstream)
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
X-List-Received-Date: Wed, 03 Jun 2015 14:47:17 -0000

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 ...error-signal-emission-for-missing-plugins.patch | 252 ---------------------
 .../gstreamer/gst-player/Fix-pause-play.patch      | 107 ---------
 .../gstreamer/gst-player/filechooser.patch         |  54 -----
 3 files changed, 413 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/Add-error-signal-emission-for-missing-plugins.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/Fix-pause-play.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/filechooser.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-player/Add-error-signal-emission-for-missing-plugins.patch b/meta/recipes-multimedia/gstreamer/gst-player/Add-error-signal-emission-for-missing-plugins.patch
deleted file mode 100644
index 712d46d..0000000
--- a/meta/recipes-multimedia/gstreamer/gst-player/Add-error-signal-emission-for-missing-plugins.patch
+++ /dev/null
@@ -1,252 +0,0 @@
-From d64c7edb66f4a64ff49c4306cf77fd269b7079ab Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Mon, 16 Mar 2015 13:45:30 +0200
-Subject: [PATCH] Add error signal emission for missing plugins
-
-Add a missing plugins error signal to gst-player. Note that this error
-does not necessarily mean the playback has completely failed, but in
-practice the user experience will be bad (think, e.g. of a mp4 file
-where H.264 codec is missing: AAC playback still works...).
-
-Use the signal in gtk-play to show a infobar if plugins are missing.
-
-Submitted upstream at https://github.com/sdroege/gst-player/pull/11
-
-Upstream-Status: Submitted
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac               |  2 +-
- gtk/gtk-play.c             | 54 +++++++++++++++++++++++++++++++++++++++++++++-
- lib/gst/player/gstplayer.c | 22 +++++++++++++++++++
- lib/gst/player/gstplayer.h |  3 ++-
- 4 files changed, 78 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 90ab74c..6cdb4eb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -53,7 +53,7 @@ AC_SUBST(LT_AGE)
- PKG_PROG_PKG_CONFIG
- 
- PKG_CHECK_MODULES(GLIB, [glib-2.0 gobject-2.0])
--PKG_CHECK_MODULES(GSTREAMER, [gstreamer-1.0 >= 1.4 gstreamer-video-1.0 >= 1.4])
-+PKG_CHECK_MODULES(GSTREAMER, [gstreamer-1.0 >= 1.4 gstreamer-video-1.0 >= 1.4 gstreamer-pbutils-1.0])
- 
- GLIB_PREFIX="`$PKG_CONFIG --variable=prefix glib-2.0`"
- AC_SUBST(GLIB_PREFIX)
-diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
-index b92773b..e2b605a 100644
---- a/gtk/gtk-play.c
-+++ b/gtk/gtk-play.c
-@@ -30,6 +30,8 @@ typedef struct
-   GtkWidget *prev_button, *next_button;
-   GtkWidget *seekbar;
-   GtkWidget *video_area;
-+  GtkWidget *info_label;
-+  GtkWidget *info_bar;
-   GtkWidget *volume_button;
-   gulong seekbar_value_changed_signal_id;
-   gboolean playing;
-@@ -141,6 +143,13 @@ play_pause_clicked_cb (GtkButton * button, GtkPlay * play)
- }
- 
- static void
-+clear_missing_plugins (GtkPlay * play)
-+{
-+  gtk_label_set_text (GTK_LABEL (play->info_label), "");
-+  gtk_widget_hide (play->info_bar);
-+}
-+
-+static void
- skip_prev_clicked_cb (GtkButton * button, GtkPlay * play)
- {
-   GList *prev;
-@@ -155,6 +164,7 @@ skip_prev_clicked_cb (GtkButton * button, GtkPlay * play)
- 
-   gtk_widget_set_sensitive (play->next_button, TRUE);
-   gst_player_set_uri (play->player, prev->data);
-+  clear_missing_plugins (play);
-   gst_player_play (play->player);
-   set_title (play, prev->data);
-   gtk_widget_set_sensitive (play->prev_button, g_list_previous (prev) != NULL);
-@@ -175,6 +185,7 @@ skip_next_clicked_cb (GtkButton * button, GtkPlay * play)
- 
-   gtk_widget_set_sensitive (play->prev_button, TRUE);
-   gst_player_set_uri (play->player, next->data);
-+  clear_missing_plugins (play);
-   gst_player_play (play->player);
-   set_title (play, next->data);
-   gtk_widget_set_sensitive (play->next_button, g_list_next (next) != NULL);
-@@ -193,10 +204,16 @@ volume_changed_cb (GtkScaleButton * button, gdouble value, GtkPlay * play)
-   gst_player_set_volume (play->player, value);
- }
- 
-+void
-+info_bar_response_cb (GtkInfoBar * bar, gint response, GtkPlay * play)
-+{
-+  gtk_widget_hide (GTK_WIDGET (bar));
-+}
-+
- static void
- create_ui (GtkPlay * play)
- {
--  GtkWidget *controls, *main_hbox, *main_vbox;
-+  GtkWidget *controls, *main_hbox, *main_vbox, *info_bar, *content_area;
- 
-   play->window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
-   g_signal_connect (G_OBJECT (play->window), "delete-event",
-@@ -208,6 +225,20 @@ create_ui (GtkPlay * play)
-   g_signal_connect (play->video_area, "realize",
-       G_CALLBACK (video_area_realize_cb), play);
- 
-+  play->info_bar = gtk_info_bar_new ();
-+  gtk_info_bar_set_message_type (GTK_INFO_BAR (play->info_bar),
-+      GTK_MESSAGE_WARNING);
-+  //gtk_info_bar_set_show_close_button (GTK_INFO_BAR (play->info_bar),
-+  //    TRUE);
-+  gtk_widget_set_no_show_all (play->info_bar, TRUE);
-+  g_signal_connect (play->info_bar, "response",
-+      G_CALLBACK (info_bar_response_cb), play);
-+
-+  content_area = gtk_info_bar_get_content_area (GTK_INFO_BAR (play->info_bar));
-+  play->info_label = gtk_label_new ("");
-+  gtk_container_add (GTK_CONTAINER (content_area), play->info_label);
-+  gtk_widget_show (play->info_label);
-+
-   /* Unified play/pause button */
-   play->play_pause_button =
-       gtk_button_new_from_icon_name ("media-playback-pause",
-@@ -258,6 +289,7 @@ create_ui (GtkPlay * play)
- 
-   main_vbox = gtk_box_new (GTK_ORIENTATION_VERTICAL, 0);
-   gtk_box_pack_start (GTK_BOX (main_vbox), main_hbox, TRUE, TRUE, 0);
-+  gtk_box_pack_start (GTK_BOX (main_vbox), play->info_bar, FALSE, FALSE, 0);
-   gtk_box_pack_start (GTK_BOX (main_vbox), controls, FALSE, FALSE, 0);
-   gtk_container_add (GTK_CONTAINER (play->window), main_vbox);
- 
-@@ -322,6 +354,7 @@ eos_cb (GstPlayer * unused, GtkPlay * play)
-       gtk_widget_set_sensitive (play->next_button, g_list_next (next) != NULL);
- 
-       gst_player_set_uri (play->player, next->data);
-+      clear_missing_plugins (play);
-       gst_player_play (play->player);
-       set_title (play, next->data);
-     } else {
-@@ -330,6 +363,24 @@ eos_cb (GstPlayer * unused, GtkPlay * play)
-   }
- }
- 
-+static void
-+error_cb (GstPlayer * player, GError * err, GtkPlay * play)
-+{
-+  char *message;
-+
-+  if (g_error_matches (err, gst_player_error_quark (),
-+      GST_PLAYER_ERROR_MISSING_PLUGIN)) {
-+    // add message to end of any existing message: there may be
-+    // multiple missing plugins.
-+    message = g_strdup_printf ("%s%s. ",
-+        gtk_label_get_text (GTK_LABEL (play->info_label)), err->message);
-+    gtk_label_set_text (GTK_LABEL (play->info_label), message);
-+    g_free (message);
-+
-+    gtk_widget_show (play->info_bar);
-+  }
-+}
-+
- int
- main (gint argc, gchar ** argv)
- {
-@@ -422,6 +473,7 @@ main (gint argc, gchar ** argv)
-   g_signal_connect (play.player, "video-dimensions-changed",
-       G_CALLBACK (video_dimensions_changed_cb), &play);
-   g_signal_connect (play.player, "end-of-stream", G_CALLBACK (eos_cb), &play);
-+  g_signal_connect (play.player, "error", G_CALLBACK (error_cb), &play);
- 
-   /* We have file(s) that need playing. */
-   set_title (&play, g_list_first (play.uris)->data);
-diff --git a/lib/gst/player/gstplayer.c b/lib/gst/player/gstplayer.c
-index bd682d9..78e7ba1 100644
---- a/lib/gst/player/gstplayer.c
-+++ b/lib/gst/player/gstplayer.c
-@@ -47,6 +47,7 @@
- 
- #include <gst/gst.h>
- #include <gst/video/video.h>
-+#include <gst/pbutils/missing-plugins.h>
- 
- GST_DEBUG_CATEGORY_STATIC (gst_player_debug);
- #define GST_CAT_DEFAULT gst_player_debug
-@@ -238,6 +239,7 @@ gst_player_class_init (GstPlayerClass * klass)
-       g_signal_new ("video-dimensions-changed", G_TYPE_FROM_CLASS (klass),
-       G_SIGNAL_RUN_LAST | G_SIGNAL_NO_RECURSE | G_SIGNAL_NO_HOOKS, 0, NULL,
-       NULL, NULL, G_TYPE_NONE, 2, G_TYPE_INT, G_TYPE_INT);
-+
- }
- 
- static void
-@@ -619,6 +621,21 @@ error_cb (GstBus * bus, GstMessage * msg, gpointer user_data)
-   g_mutex_unlock (&self->priv->lock);
- }
- 
-+static void
-+element_cb (GstBus * bus, GstMessage * msg, gpointer user_data)
-+{
-+  GstPlayer *self = GST_PLAYER (user_data);
-+
-+  if (gst_is_missing_plugin_message (msg)) {
-+    gchar *desc;
-+
-+    desc = gst_missing_plugin_message_get_description (msg);
-+    emit_error (self, g_error_new (GST_PLAYER_ERROR,
-+        GST_PLAYER_ERROR_MISSING_PLUGIN, "Missing plugin '%s'", desc));
-+    g_free (desc);
-+  }
-+}
-+
- static gboolean
- eos_dispatch (gpointer user_data)
- {
-@@ -1059,6 +1076,8 @@ gst_player_main (gpointer data)
-       NULL, NULL);
-   g_source_attach (bus_source, self->priv->context);
- 
-+  g_signal_connect (G_OBJECT (bus), "message::element",
-+      G_CALLBACK (element_cb), self);
-   g_signal_connect (G_OBJECT (bus), "message::error", G_CALLBACK (error_cb),
-       self);
-   g_signal_connect (G_OBJECT (bus), "message::eos", G_CALLBACK (eos_cb), self);
-@@ -1560,6 +1579,7 @@ gst_player_error_get_type (void)
-   static gsize id = 0;
-   static const GEnumValue values[] = {
-     {C_ENUM (GST_PLAYER_ERROR_FAILED), "GST_PLAYER_ERROR_FAILED", "failed"},
-+    {C_ENUM (GST_PLAYER_ERROR_MISSING_PLUGIN), "GST_PLAYER_ERROR_MISSING_PLUGIN", "missing-plugin"},
-     {0, NULL, NULL}
-   };
- 
-@@ -1577,6 +1597,8 @@ gst_player_error_get_name (GstPlayerError error)
-   switch (error) {
-     case GST_PLAYER_ERROR_FAILED:
-       return "failed";
-+    case GST_PLAYER_ERROR_MISSING_PLUGIN:
-+      return "missing-plugin";
-   }
- 
-   g_assert_not_reached ();
-diff --git a/lib/gst/player/gstplayer.h b/lib/gst/player/gstplayer.h
-index c438513..35fb5bb 100644
---- a/lib/gst/player/gstplayer.h
-+++ b/lib/gst/player/gstplayer.h
-@@ -44,7 +44,8 @@ GType        gst_player_error_get_type                (void);
- #define      GST_TYPE_PLAYER_ERROR                    (gst_player_error_get_type ())
- 
- typedef enum {
--  GST_PLAYER_ERROR_FAILED = 0
-+  GST_PLAYER_ERROR_FAILED = 0,
-+  GST_PLAYER_ERROR_MISSING_PLUGIN
- } GstPlayerError;
- 
- const gchar *gst_player_error_get_name                (GstPlayerError error);
--- 
-2.1.4
-
diff --git a/meta/recipes-multimedia/gstreamer/gst-player/Fix-pause-play.patch b/meta/recipes-multimedia/gstreamer/gst-player/Fix-pause-play.patch
deleted file mode 100644
index 783c42a..0000000
--- a/meta/recipes-multimedia/gstreamer/gst-player/Fix-pause-play.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-Fix pause/play
-
-The current player state is now notified via the state-changed signal,
-and in the GTK UI it was only used to keep track of the desired state.
-
-This is a backport of upstream commit 738479c7a0.
-
-Upstream-Status: Backport
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
----
- gtk/gtk-play.c             |  8 ++++++--
- lib/gst/player/gstplayer.c | 12 ------------
- lib/gst/player/gstplayer.h |  2 --
- 3 files changed, 6 insertions(+), 16 deletions(-)
-
-diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
-index 6e7a098..e2b605a 100644
---- a/gtk/gtk-play.c
-+++ b/gtk/gtk-play.c
-@@ -34,6 +34,7 @@ typedef struct
-   GtkWidget *info_bar;
-   GtkWidget *volume_button;
-   gulong seekbar_value_changed_signal_id;
-+  gboolean playing;
- } GtkPlay;
- 
- /* Compat stubs */
-@@ -118,12 +119,13 @@ play_pause_clicked_cb (GtkButton * button, GtkPlay * play)
- {
-   GtkWidget *image;
- 
--  if (gst_player_is_playing (play->player)) {
-+  if (play->playing) {
-     gst_player_pause (play->player);
-     image =
-         gtk_image_new_from_icon_name ("media-playback-start",
-         GTK_ICON_SIZE_BUTTON);
-     gtk_button_set_image (GTK_BUTTON (play->play_pause_button), image);
-+    play->playing = FALSE;
-   } else {
-     gchar *title;
- 
-@@ -136,6 +138,7 @@ play_pause_clicked_cb (GtkButton * button, GtkPlay * play)
-     title = gst_player_get_uri (play->player);
-     set_title (play, title);
-     g_free (title);
-+    play->playing = TRUE;
-   }
- }
- 
-@@ -335,7 +338,7 @@ video_dimensions_changed_cb (GstPlayer * unused, gint width, gint height,
- static void
- eos_cb (GstPlayer * unused, GtkPlay * play)
- {
--  if (gst_player_is_playing (play->player)) {
-+  if (play->playing) {
-     GList *next = NULL;
-     gchar *uri;
- 
-@@ -452,6 +455,7 @@ main (gint argc, gchar ** argv)
-   }
- 
-   play.player = gst_player_new ();
-+  play.playing = TRUE;
- 
-   g_object_set (play.player, "dispatch-to-main-context", TRUE, NULL);
- 
-diff --git a/lib/gst/player/gstplayer.c b/lib/gst/player/gstplayer.c
-index 069b284..78e7ba1 100644
---- a/lib/gst/player/gstplayer.c
-+++ b/lib/gst/player/gstplayer.c
-@@ -1422,18 +1422,6 @@ gst_player_set_uri (GstPlayer * self, const gchar * val)
-   g_object_set (self, "uri", val, NULL);
- }
- 
--gboolean
--gst_player_is_playing (GstPlayer * self)
--{
--  gboolean val;
--
--  g_return_val_if_fail (GST_IS_PLAYER (self), FALSE);
--
--  g_object_get (self, "is-playing", &val, NULL);
--
--  return val;
--}
--
- GstClockTime
- gst_player_get_position (GstPlayer * self)
- {
-diff --git a/lib/gst/player/gstplayer.h b/lib/gst/player/gstplayer.h
-index 6933dd7..35fb5bb 100644
---- a/lib/gst/player/gstplayer.h
-+++ b/lib/gst/player/gstplayer.h
-@@ -93,8 +93,6 @@ gchar *      gst_player_get_uri                       (GstPlayer    * player);
- void         gst_player_set_uri                       (GstPlayer    * player,
-                                                        const gchar  * uri);
- 
--gboolean     gst_player_is_playing                    (GstPlayer    * player);
--
- GstClockTime gst_player_get_position                  (GstPlayer    * player);
- GstClockTime gst_player_get_duration                  (GstPlayer    * player);
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-multimedia/gstreamer/gst-player/filechooser.patch b/meta/recipes-multimedia/gstreamer/gst-player/filechooser.patch
deleted file mode 100644
index 7bf1b03..0000000
--- a/meta/recipes-multimedia/gstreamer/gst-player/filechooser.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 43d4b19ab611d844156e26c4840cc54ddb73ae03 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Thu, 26 Feb 2015 17:17:05 +0000
-Subject: [PATCH] gtk-play: show a file chooser if no URIs were passed
-
----
- gtk/gtk-play.c |   28 ++++++++++++++++++++++++++--
- 1 file changed, 26 insertions(+), 2 deletions(-)
-
-diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
-index f015077..9766a72 100644
---- a/gtk/gtk-play.c
-+++ b/gtk/gtk-play.c
-@@ -319,8 +319,32 @@ main (gint argc, gchar ** argv)
-   // FIXME: Add support for playlists and stuff
-   /* Parse the list of the file names we have to play. */
-   if (!file_names) {
--    g_print ("Usage: %s FILE(s)|URI(s)\n", APP_NAME);
--    return 1;
-+    GtkWidget *chooser;
-+    int res;
-+
-+    chooser = gtk_file_chooser_dialog_new ("Select files to play", NULL,
-+                                          GTK_FILE_CHOOSER_ACTION_OPEN,
-+                                          "_Cancel", GTK_RESPONSE_CANCEL,
-+                                          "_Open", GTK_RESPONSE_ACCEPT,
-+                                          NULL);
-+    g_object_set (chooser,
-+                  "local-only", FALSE,
-+                  "select-multiple", TRUE,
-+                  NULL);
-+
-+    res = gtk_dialog_run (GTK_DIALOG (chooser));
-+    if (res == GTK_RESPONSE_ACCEPT) {
-+      GSList *l;
-+
-+      l = gtk_file_chooser_get_uris (GTK_FILE_CHOOSER (chooser));
-+      while (l) {
-+        play.uris = g_list_append (play.uris, l->data);
-+        l = g_slist_delete_link (l, l);
-+      }
-+    } else {
-+      return 0;
-+    }
-+    gtk_widget_destroy (chooser);
-   } else {
-     guint i;
- 
--- 
-1.7.10.4
-
-- 
1.9.1


