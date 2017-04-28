Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 844BF77EB2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 11:54:37 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Apr 2017 04:54:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,388,1488873600"; d="scan'208";a="81754953"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 28 Apr 2017 04:54:38 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id BEA3A6A4006;
	Fri, 28 Apr 2017 04:54:25 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Apr 2017 14:54:34 +0300
Message-Id: <1493380475-19241-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gst-player: Disable visualizations as workaround
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
X-List-Received-Date: Fri, 28 Apr 2017 11:54:37 -0000

Audio playback in gtk-play is broken with vaapi because the
visualizations do not work: disable visualizations as workaround.
This should be reverted as soon as [YOCTO #11410] is fixed.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

Hi,
I'm proposing this for 2.3 (in case there is a new RC).

Thanks,
  Jussi


 .../0001-gtk-play-Disable-visualizations.patch     | 59 ++++++++++++++++++++++
 .../recipes-multimedia/gstreamer/gst-player_git.bb |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-player/0001-gtk-play-Disable-visualizations.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-player/0001-gtk-play-Disable-visualizations.patch b/meta/recipes-multimedia/gstreamer/gst-player/0001-gtk-play-Disable-visualizations.patch
new file mode 100644
index 0000000..ea88120
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-player/0001-gtk-play-Disable-visualizations.patch
@@ -0,0 +1,59 @@
+From 6cf42c468e93b0aaa171961e059bc3e2fb915889 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 28 Apr 2017 14:35:19 +0300
+Subject: [PATCH] gtk-play: Disable visualizations
+
+This is a workaround for [YOCTO #11410] (audio playback is broken in
+mediaplayer if vaapi is used). It disables visualizations and makes
+sure we clear the window (otherwise nothing does that and result is
+very ugly).
+
+This patch should be removed when 11410 is fixed.
+
+Upstream-Status: Inappropriate [bug workaround]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ gtk/gtk-play.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
+index 8ae0fea..63b9bb0 100644
+--- a/gtk/gtk-play.c
++++ b/gtk/gtk-play.c
+@@ -1401,6 +1401,15 @@ get_child_position (GtkOverlay * overlay, GtkWidget * widget,
+   return TRUE;
+ }
+ 
++/* Hack to make sure something gets drawn if visualizations are disabled */
++static gboolean
++draw_cb (GtkWidget *widget, cairo_t *cr, gpointer data)
++{
++  cairo_set_source_rgb (cr, 0, 0, 0);
++  cairo_paint (cr);
++  return FALSE;
++}
++
+ static void
+ create_ui (GtkPlay * play)
+ {
+@@ -1431,6 +1440,8 @@ create_ui (GtkPlay * play)
+     play->video_area = gtk_drawing_area_new ();
+     g_signal_connect (play->video_area, "realize",
+         G_CALLBACK (video_area_realize_cb), play);
++    g_signal_connect (play->video_area, "draw",
++        G_CALLBACK (draw_cb), NULL);
+   }
+   gtk_widget_set_events (play->video_area, GDK_EXPOSURE_MASK
+       | GDK_LEAVE_NOTIFY_MASK
+@@ -1753,7 +1764,7 @@ gtk_play_constructor (GType type, guint n_construct_params,
+ 
+   /* enable visualization (by default playbin uses goom) */
+   /* if visualization is enabled then use the first element */
+-  gst_player_set_visualization_enabled (self->player, TRUE);
++  gst_player_set_visualization_enabled (self->player, FALSE);
+ 
+   g_signal_connect (G_OBJECT (self), "show", G_CALLBACK (show_cb), NULL);
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index ebc4ae8..cb12a46 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://github.com/sdroege/gst-player.git \
            file://filechooser.patch;apply=0 \
            file://Fix-pause-play.patch;apply=0 \
            file://Add-error-signal-emission-for-missing-plugins.patch;apply=0 \
+           file://0001-gtk-play-Disable-visualizations.patch \
            file://gst-player.desktop"
 
 SRCREV = "ee3c226c82767a089743e4e06058743e67f73cdb"
-- 
2.1.4


