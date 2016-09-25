Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6998F600E3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2016 18:40:21 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP; 25 Sep 2016 11:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,395,1470726000"; d="scan'208";a="13040400"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 25 Sep 2016 11:40:22 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 0F2FB6A4080
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2016 11:39:55 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Sep 2016 21:40:05 +0300
Message-Id: <1474828805-23813-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] gst-player: Disable visualizations
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
X-List-Received-Date: Sun, 25 Sep 2016 18:40:21 -0000

On some machines, visualizations in gst-player trigger a bug in
xvimagesink. Till we have a proper fix, disable the visualization
rather than downgrading the xvimagesink.

Fixes [YOCTO #10041]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../0001-Disable-visualizations-by-default.patch   | 36 ++++++++++++++++++++++
 .../recipes-multimedia/gstreamer/gst-player_git.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-player/0001-Disable-visualizations-by-default.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-player/0001-Disable-visualizations-by-default.patch b/meta/recipes-multimedia/gstreamer/gst-player/0001-Disable-visualizations-by-default.patch
new file mode 100644
index 0000000..dabdcea
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-player/0001-Disable-visualizations-by-default.patch
@@ -0,0 +1,36 @@
+From 93e1838f8b8704e4d7d71965f61bee931377b080 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Thu, 22 Sep 2016 19:26:40 +0300
+Subject: [PATCH] Disable visualizations by default
+
+As documented in [YOCTO #10041] visualizations trigger a bug in
+xvimagesink on some hardware, which prevents playback in the
+mediaplayer. Disable visualizations until the xv issue is solved
+to enable playback QA.
+
+Upstream-Status: Inappropriate [workaround]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ gtk/gtk-play.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
+index 8ae0fea..322e599 100644
+--- a/gtk/gtk-play.c
++++ b/gtk/gtk-play.c
+@@ -1751,9 +1751,8 @@ gtk_play_constructor (GType type, guint n_construct_params,
+   g_signal_connect (self->player, "volume-changed",
+       G_CALLBACK (player_volume_changed_cb), self);
+ 
+-  /* enable visualization (by default playbin uses goom) */
+-  /* if visualization is enabled then use the first element */
+-  gst_player_set_visualization_enabled (self->player, TRUE);
++  /* Disable visualization by default */
++  gst_player_set_visualization_enabled (self->player, FALSE);
+ 
+   g_signal_connect (G_OBJECT (self), "show", G_CALLBACK (show_cb), NULL);
+ 
+-- 
+2.4.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index 2a4c9dc..51f3544 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://github.com/sdroege/gst-player.git \
            file://Fix-pause-play.patch;apply=0 \
            file://Add-error-signal-emission-for-missing-plugins.patch;apply=0 \
            file://0001-gtk-play-provide-similar-behaviour-for-quit-and-clos.patch \
+           file://0001-Disable-visualizations-by-default.patch \
            file://gst-player.desktop"
 
 SRCREV = "ea90e63c1064503f9ba5d59aa4ca604f13ca5def"
-- 
2.4.0


