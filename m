Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B4CC471A01
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 07:17:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 04 Oct 2016 00:17:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,442,1473145200"; d="scan'208";a="1060148232"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 04 Oct 2016 00:17:33 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 10:17:28 +0300
Message-Id: <bb580be973e1577cf63acadbbbfb7e3650947c71.1475565233.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <9ad13291600d5d0d1845de7f36f36a40533d88a6.1475565233.git.jussi.kukkonen@intel.com>
References: <9ad13291600d5d0d1845de7f36f36a40533d88a6.1475565233.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1475565233.git.jussi.kukkonen@intel.com>
References: <cover.1475565233.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 2/2] Revert "gst-player: Disable visualizations"
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
X-List-Received-Date: Tue, 04 Oct 2016 07:17:33 -0000

This reverts oe-core commit b79d1bf49b56a97216fb719ac19e4dd9022f15b4.

Now that xf86-video-intel is upgraded, visualizations can be enabled
by default.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-Disable-visualizations-by-default.patch   | 36 ----------------------
 .../recipes-multimedia/gstreamer/gst-player_git.bb |  1 -
 2 files changed, 37 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/0001-Disable-visualizations-by-default.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-player/0001-Disable-visualizations-by-default.patch b/meta/recipes-multimedia/gstreamer/gst-player/0001-Disable-visualizations-by-default.patch
deleted file mode 100644
index dabdcea..0000000
--- a/meta/recipes-multimedia/gstreamer/gst-player/0001-Disable-visualizations-by-default.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 93e1838f8b8704e4d7d71965f61bee931377b080 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Thu, 22 Sep 2016 19:26:40 +0300
-Subject: [PATCH] Disable visualizations by default
-
-As documented in [YOCTO #10041] visualizations trigger a bug in
-xvimagesink on some hardware, which prevents playback in the
-mediaplayer. Disable visualizations until the xv issue is solved
-to enable playback QA.
-
-Upstream-Status: Inappropriate [workaround]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- gtk/gtk-play.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
-index 8ae0fea..322e599 100644
---- a/gtk/gtk-play.c
-+++ b/gtk/gtk-play.c
-@@ -1751,9 +1751,8 @@ gtk_play_constructor (GType type, guint n_construct_params,
-   g_signal_connect (self->player, "volume-changed",
-       G_CALLBACK (player_volume_changed_cb), self);
- 
--  /* enable visualization (by default playbin uses goom) */
--  /* if visualization is enabled then use the first element */
--  gst_player_set_visualization_enabled (self->player, TRUE);
-+  /* Disable visualization by default */
-+  gst_player_set_visualization_enabled (self->player, FALSE);
- 
-   g_signal_connect (G_OBJECT (self), "show", G_CALLBACK (show_cb), NULL);
- 
--- 
-2.4.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index 51f3544..2a4c9dc 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://github.com/sdroege/gst-player.git \
            file://Fix-pause-play.patch;apply=0 \
            file://Add-error-signal-emission-for-missing-plugins.patch;apply=0 \
            file://0001-gtk-play-provide-similar-behaviour-for-quit-and-clos.patch \
-           file://0001-Disable-visualizations-by-default.patch \
            file://gst-player.desktop"
 
 SRCREV = "ea90e63c1064503f9ba5d59aa4ca604f13ca5def"
-- 
2.1.4


