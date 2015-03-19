Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BE24B65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 08:54:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 19 Mar 2015 01:54:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,428,1422950400"; d="scan'208";a="700930824"
Received: from heimdall.fi.intel.com ([10.237.72.99])
	by orsmga002.jf.intel.com with ESMTP; 19 Mar 2015 01:54:00 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2015 10:53:53 +0200
Message-Id: <1426755233-11171-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gst-player: Fix Pause/Play in GTK+ player
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
X-List-Received-Date: Thu, 19 Mar 2015 08:54:01 -0000

Backport a bug fix from upstream gst-player to make
Pause and Play buttons work properly in gtk-play.

[ YOCTO #7429 ]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../gstreamer/gst-player/Fix-pause-play.patch      | 107 +++++++++++++++++++++
 .../recipes-multimedia/gstreamer/gst-player_git.bb |   1 +
 2 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-player/Fix-pause-play.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-player/Fix-pause-play.patch b/meta/recipes-multimedia/gstreamer/gst-player/Fix-pause-play.patch
new file mode 100644
index 0000000..783c42a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-player/Fix-pause-play.patch
@@ -0,0 +1,107 @@
+Fix pause/play
+
+The current player state is now notified via the state-changed signal,
+and in the GTK UI it was only used to keep track of the desired state.
+
+This is a backport of upstream commit 738479c7a0.
+
+Upstream-Status: Backport
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+---
+ gtk/gtk-play.c             |  8 ++++++--
+ lib/gst/player/gstplayer.c | 12 ------------
+ lib/gst/player/gstplayer.h |  2 --
+ 3 files changed, 6 insertions(+), 16 deletions(-)
+
+diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
+index 6e7a098..e2b605a 100644
+--- a/gtk/gtk-play.c
++++ b/gtk/gtk-play.c
+@@ -34,6 +34,7 @@ typedef struct
+   GtkWidget *info_bar;
+   GtkWidget *volume_button;
+   gulong seekbar_value_changed_signal_id;
++  gboolean playing;
+ } GtkPlay;
+ 
+ /* Compat stubs */
+@@ -118,12 +119,13 @@ play_pause_clicked_cb (GtkButton * button, GtkPlay * play)
+ {
+   GtkWidget *image;
+ 
+-  if (gst_player_is_playing (play->player)) {
++  if (play->playing) {
+     gst_player_pause (play->player);
+     image =
+         gtk_image_new_from_icon_name ("media-playback-start",
+         GTK_ICON_SIZE_BUTTON);
+     gtk_button_set_image (GTK_BUTTON (play->play_pause_button), image);
++    play->playing = FALSE;
+   } else {
+     gchar *title;
+ 
+@@ -136,6 +138,7 @@ play_pause_clicked_cb (GtkButton * button, GtkPlay * play)
+     title = gst_player_get_uri (play->player);
+     set_title (play, title);
+     g_free (title);
++    play->playing = TRUE;
+   }
+ }
+ 
+@@ -335,7 +338,7 @@ video_dimensions_changed_cb (GstPlayer * unused, gint width, gint height,
+ static void
+ eos_cb (GstPlayer * unused, GtkPlay * play)
+ {
+-  if (gst_player_is_playing (play->player)) {
++  if (play->playing) {
+     GList *next = NULL;
+     gchar *uri;
+ 
+@@ -452,6 +455,7 @@ main (gint argc, gchar ** argv)
+   }
+ 
+   play.player = gst_player_new ();
++  play.playing = TRUE;
+ 
+   g_object_set (play.player, "dispatch-to-main-context", TRUE, NULL);
+ 
+diff --git a/lib/gst/player/gstplayer.c b/lib/gst/player/gstplayer.c
+index 069b284..78e7ba1 100644
+--- a/lib/gst/player/gstplayer.c
++++ b/lib/gst/player/gstplayer.c
+@@ -1422,18 +1422,6 @@ gst_player_set_uri (GstPlayer * self, const gchar * val)
+   g_object_set (self, "uri", val, NULL);
+ }
+ 
+-gboolean
+-gst_player_is_playing (GstPlayer * self)
+-{
+-  gboolean val;
+-
+-  g_return_val_if_fail (GST_IS_PLAYER (self), FALSE);
+-
+-  g_object_get (self, "is-playing", &val, NULL);
+-
+-  return val;
+-}
+-
+ GstClockTime
+ gst_player_get_position (GstPlayer * self)
+ {
+diff --git a/lib/gst/player/gstplayer.h b/lib/gst/player/gstplayer.h
+index 6933dd7..35fb5bb 100644
+--- a/lib/gst/player/gstplayer.h
++++ b/lib/gst/player/gstplayer.h
+@@ -93,8 +93,6 @@ gchar *      gst_player_get_uri                       (GstPlayer    * player);
+ void         gst_player_set_uri                       (GstPlayer    * player,
+                                                        const gchar  * uri);
+ 
+-gboolean     gst_player_is_playing                    (GstPlayer    * player);
+-
+ GstClockTime gst_player_get_position                  (GstPlayer    * player);
+ GstClockTime gst_player_get_duration                  (GstPlayer    * player);
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index 988c407..18f2656 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -8,6 +8,7 @@ DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gtk+"
 SRC_URI = "git://github.com/sdroege/gst-player.git \
            file://filechooser.patch \
            file://gtk2.patch \
+           file://Fix-pause-play.patch \
            file://gst-player.desktop"
 
 SRCREV = "5386c5b984d40ef5434673ed62204e69aaf52645"
-- 
2.1.4


