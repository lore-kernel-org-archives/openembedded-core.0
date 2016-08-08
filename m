Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EACF77706E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 11:12:10 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 08 Aug 2016 04:12:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,489,1464678000"; d="scan'208";a="152310030"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2016 04:12:12 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 0E3856A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 04:11:55 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 14:13:06 +0300
Message-Id: <1470654788-8717-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/3] gst-player: update the callback for delete-event
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
X-List-Received-Date: Mon, 08 Aug 2016 11:12:12 -0000

provide similar behaviour for Media Player's quit and close callback
functions.

[YOCTO #10045]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...ovide-similar-behaviour-for-quit-and-clos.patch | 32 ++++++++++++++++++++++
 .../recipes-multimedia/gstreamer/gst-player_git.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-player/0001-gtk-play-provide-similar-behaviour-for-quit-and-clos.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-player/0001-gtk-play-provide-similar-behaviour-for-quit-and-clos.patch b/meta/recipes-multimedia/gstreamer/gst-player/0001-gtk-play-provide-similar-behaviour-for-quit-and-clos.patch
new file mode 100644
index 0000000..e3f1c4f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-player/0001-gtk-play-provide-similar-behaviour-for-quit-and-clos.patch
@@ -0,0 +1,32 @@
+From 220c2659a45dd354270a465c45197970dae5f548 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Fri, 5 Aug 2016 17:52:18 +0300
+Subject: [PATCH] gtk-play: provide similar behaviour for quit and close
+
+In x86 targets, gtk-play just pause rather than quitting the application
+when we click the close button (delete-event). Change the callback function
+to get similar behaviour when we click on "Quit" menu option.
+
+Upstream-Status: Accepted
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ gtk/gtk-play.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
+index a520bef..16afc6b 100644
+--- a/gtk/gtk-play.c
++++ b/gtk/gtk-play.c
+@@ -177,7 +177,7 @@ load_from_builder (const gchar * filename, gboolean register_sig_handler,
+ static void
+ delete_event_cb (GtkWidget * widget, GdkEvent * event, GtkPlay * play)
+ {
+-  gst_player_stop (play->player);
++  gtk_widget_destroy (GTK_WIDGET (play));
+ }
+ 
+ static void
+-- 
+2.4.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index b09244b..00ad941 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://github.com/sdroege/gst-player.git \
            file://filechooser.patch;apply=0 \
            file://Fix-pause-play.patch;apply=0 \
            file://Add-error-signal-emission-for-missing-plugins.patch;apply=0 \
+           file://0001-gtk-play-provide-similar-behaviour-for-quit-and-clos.patch \
            file://gst-player.desktop"
 
 SRCREV = "ea90e63c1064503f9ba5d59aa4ca604f13ca5def"
-- 
2.4.0


