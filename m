Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1B7C360670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 18:01:49 +0000 (UTC)
Received: by wesk11 with SMTP id k11so13278340wes.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 10:01:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=KtgJhWAZ+ASCRNup852mNXK4UYG9azP6EibTZ86q6zI=;
	b=lX+gi5iVsqzR2vwSPP3VNKoIA5eAwA8HSSh7cWVRtNpDQvqYPGeNsamkPBU15kOyhJ
	rhL0RL+6JAmLzgs81Nhj6vPVTDr5r3lLj+/irEP/kixLcj9uKGzIYYK+OaE1NVIOHmtg
	2X8nIFWi6WZkd0yE1ui94l0noG9xc2Q5OzmePJqTt/u+TfFJGD5LdvuWoQHSq/fZeRpw
	+yz4kndnM2N5TFywEVtBySv9Khuu1RYtr1sHpRfJEMXACDMDlmKk6FWbLpCrBbJNjbgM
	jZ8AJp5NXbBIrP7APQ2cjogTzcymCvyRrKe8uYvkVpsySaKicG4OVo8oyAGugPWeBxpx
	8XMw==
X-Gm-Message-State: ALoCoQnWb/mgIvN2Mksv+wqiR6hfwmRMHP2T8Z+Lr7kPsvk4zI4PV1omZKXWTlrA36ygRy8tCW2i
X-Received: by 10.180.79.227 with SMTP id m3mr19076140wix.3.1424973710429;
	Thu, 26 Feb 2015 10:01:50 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id kj8sm2433359wjc.29.2015.02.26.10.01.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Feb 2015 10:01:49 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Feb 2015 17:59:00 +0000
Message-Id: <1424973542-30540-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/3] gst-player: add
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
X-List-Received-Date: Thu, 26 Feb 2015 18:01:50 -0000

gst-player is a convenience library for handling media playback in GStreamer.
It also has a sample application that can be used as a basic media player for
testing.

Patch in a file selector for use without a terminal and a desktop file so it
appears in the desktop.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gstreamer/gst-player/filechooser.patch         |   54 ++++++++++++++++++++
 .../gstreamer/gst-player/gst-player.desktop        |   10 ++++
 .../recipes-multimedia/gstreamer/gst-player_git.bb |   31 +++++++++++
 3 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-player/filechooser.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-player/gst-player.desktop
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-player_git.bb

diff --git a/meta/recipes-multimedia/gstreamer/gst-player/filechooser.patch b/meta/recipes-multimedia/gstreamer/gst-player/filechooser.patch
new file mode 100644
index 0000000..7bf1b03
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-player/filechooser.patch
@@ -0,0 +1,54 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 43d4b19ab611d844156e26c4840cc54ddb73ae03 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Thu, 26 Feb 2015 17:17:05 +0000
+Subject: [PATCH] gtk-play: show a file chooser if no URIs were passed
+
+---
+ gtk/gtk-play.c |   28 ++++++++++++++++++++++++++--
+ 1 file changed, 26 insertions(+), 2 deletions(-)
+
+diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
+index f015077..9766a72 100644
+--- a/gtk/gtk-play.c
++++ b/gtk/gtk-play.c
+@@ -319,8 +319,32 @@ main (gint argc, gchar ** argv)
+   // FIXME: Add support for playlists and stuff
+   /* Parse the list of the file names we have to play. */
+   if (!file_names) {
+-    g_print ("Usage: %s FILE(s)|URI(s)\n", APP_NAME);
+-    return 1;
++    GtkWidget *chooser;
++    int res;
++
++    chooser = gtk_file_chooser_dialog_new ("Select files to play", NULL,
++                                          GTK_FILE_CHOOSER_ACTION_OPEN,
++                                          "_Cancel", GTK_RESPONSE_CANCEL,
++                                          "_Open", GTK_RESPONSE_ACCEPT,
++                                          NULL);
++    g_object_set (chooser,
++                  "local-only", FALSE,
++                  "select-multiple", TRUE,
++                  NULL);
++
++    res = gtk_dialog_run (GTK_DIALOG (chooser));
++    if (res == GTK_RESPONSE_ACCEPT) {
++      GSList *l;
++
++      l = gtk_file_chooser_get_uris (GTK_FILE_CHOOSER (chooser));
++      while (l) {
++        play.uris = g_list_append (play.uris, l->data);
++        l = g_slist_delete_link (l, l);
++      }
++    } else {
++      return 0;
++    }
++    gtk_widget_destroy (chooser);
+   } else {
+     guint i;
+ 
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-player/gst-player.desktop b/meta/recipes-multimedia/gstreamer/gst-player/gst-player.desktop
new file mode 100644
index 0000000..9eb6ada
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-player/gst-player.desktop
@@ -0,0 +1,10 @@
+[Desktop Entry]
+Name=Media Player
+Comment=Basic media plaer
+Icon=audio-player
+TryExec=gtk-play
+Exec=gtk-play
+StartupNotify=true
+Terminal=false
+Type=Application
+Categories=GTK;AudioVideo;
diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
new file mode 100644
index 0000000..a7df526
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -0,0 +1,31 @@
+SUMMARY="GStreamer playback helper library and examples"
+
+LICENSE = "LGPL-2.0+"
+LIC_FILES_CHKSUM = "file://lib/gst/player/gstplayer.c;beginline=1;endline=19;md5=03aeca9d8295f811817909075a15ff65"
+
+DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gtk+3"
+
+SRC_URI = "git://github.com/sdroege/gst-player.git \
+           file://filechooser.patch \
+           file://gst-player.desktop"
+
+SRCREV = "5386c5b984d40ef5434673ed62204e69aaf52645"
+
+S = "${WORKDIR}/git"
+
+inherit autotools gtk-doc lib_package pkgconfig
+
+do_configure_prepend() {
+	touch ${S}/ChangeLog
+}
+
+EXTRA_OECONF += "ac_cv_path_VALGRIND=no ac_cv_path_GDB=no"
+
+do_install_append() {
+	install -m 0644 -D ${WORKDIR}/gst-player.desktop ${D}${datadir}/applications/gst-player.desktop
+}
+
+FILES_${PN}-bin += "${datadir}/applications/*.desktop"
+
+RDEPENDS_${PN}-bin = "gstreamer1.0-plugins-base-playback"
+RRECOMMENDS_${PN}-bin = "gstreamer1.0-plugins-base-meta gstreamer1.0-plugins-good-meta gstreamer1.0-plugins-bad-meta gstreamer1.0-plugins-ugly-meta"
-- 
1.7.10.4


