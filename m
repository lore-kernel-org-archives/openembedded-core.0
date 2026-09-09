Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0001C79F8C
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:34:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7029.1788942875838572006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tkM7bLbe;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8D6831A1A75
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Sep 2026 08:34:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 624AE60448
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Sep 2026 08:34:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E60A311C7AF30;
	Wed,  9 Sep 2026 10:34:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788942872; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=9i1iKgyu/YKc1kmFZEp75GHG4uKUznig8JgFAy+pf2g=;
	b=tkM7bLbeEEMHN81M+zjES+oV3DshJ8zSETTo+MuSY7jda2fteNjTn6Vh4KO7y2QSAzXSws
	wqoB/vIgSTiiE4BHKrAxDFJBkJiaW1esuPxi7Y60xzesXAJQRXspjmcFkqTIs/RiZ06+DF
	0NTWraiwFwVJFoKxr5m+chGnBRzjiAIdga0WX9l3qFuTpJ8VltsBMxouKxYyZwHtJ5AGCi
	nSIfJh4oOO+8PjhGSuShVJeOelhpu6yVd+XcvAx2yJtG1qOCnpEnAm7pWdMWT+zeGTARPv
	B4EYTwbPYkKzMNNzPwPHBq5F+TYcFS2AQtv1jD7rdbX4j6xeq8zFrfWqNACrTg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 09 Sep 2026 10:34:21 +0200
Subject: [PATCH] gst-examples: fix patches using striplevel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-mathieu-gst-examples-striplevel-v1-1-0eabe6da85cb@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAwaoWoC/x2NSwqDQBAFryK9TkNrjGCuIlmM8Y02+GN6FEG8u
 4O7qk3VSYagMPpmJwXsarrMSfJXRv/BzT1Yu+RUSFFJLTVPLg6KjXuLjMNN6whji0ET7BhZ8q4
 ty4/3Ur0pVdYAr8dzaH7XdQP+z9D1cQAAAA==
X-Change-ID: 20260909-mathieu-gst-examples-striplevel-01db445ff063
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788942871; l=5473;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=zZLnOVRpYFUanZ5/cku3Mm84HBnksqJHKhWkAUaGwvQ=;
 b=Ngv+CH/4/fEbx7GkVbzPNdNVHZPCNAX3ngW9WPTMNuGtAcW7Z+oiK+RNzuNB/I8vqtk/dOTpQ
 8EHkO7UUruHAM5EE9p4qzmKmfQTgp2MORlAAYyDGfGva8+tBVAAn/b6
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 08:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245454

Devtool upgrade is failing on gst-examples, as devtool generated patches
contain paths relative to the git root, but do_patch then tries to apply
them on a subfolder when the recipe is built. As a consequence we always
had to manually strip the paths in patches generated with devtool
upgrade.

Use do_patch "striplevel" parameter instead: we can keep paths relative
to the git root in patches, and both "devtool upgrade" and do_patch will
be happy.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../0001-Make-player-examples-installable.patch          | 16 ++++++++--------
 ...amples-gtk-show-player-warnings-in-a-dialog-box.patch |  6 +++---
 meta/recipes-multimedia/gstreamer/gst-examples_1.28.7.bb |  4 ++--
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
index caf2e02980bc..72fe5a26aaed 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -8,14 +8,14 @@ Upstream-Status: Denied [Upstream considers these code examples, for now a least
 
 https://bugzilla.gnome.org/show_bug.cgi?id=777827
 ---
- playback/player/gst-play/meson.build | 1 +
- playback/player/gtk/meson.build      | 1 +
+ subprojects/gst-examples/playback/player/gst-play/meson.build | 1 +
+ subprojects/gst-examples/playback/player/gtk/meson.build      | 1 +
  2 files changed, 2 insertions(+)
 
-diff --git a/playback/player/gst-play/meson.build b/playback/player/gst-play/meson.build
+diff --git a/subprojects/gst-examples/playback/player/gst-play/meson.build b/subprojects/gst-examples/playback/player/gst-play/meson.build
 index 5e80ca8dd4a8..129e5bdcbe3d 100644
---- a/playback/player/gst-play/meson.build
-+++ b/playback/player/gst-play/meson.build
+--- a/subprojects/gst-examples/playback/player/gst-play/meson.build
++++ b/subprojects/gst-examples/playback/player/gst-play/meson.build
 @@ -2,5 +2,6 @@ executable('gst-play',
      ['gst-play.c',
       'gst-play-kb.c',
@@ -23,10 +23,10 @@ index 5e80ca8dd4a8..129e5bdcbe3d 100644
 +    install: true,
      dependencies : [gst_dep, dependency('gstreamer-play-1.0'), m_dep])
  
-diff --git a/playback/player/gtk/meson.build b/playback/player/gtk/meson.build
+diff --git a/subprojects/gst-examples/playback/player/gtk/meson.build b/subprojects/gst-examples/playback/player/gtk/meson.build
 index 6892f152544f..20d7505877c2 100644
---- a/playback/player/gtk/meson.build
-+++ b/playback/player/gtk/meson.build
+--- a/subprojects/gst-examples/playback/player/gtk/meson.build
++++ b/subprojects/gst-examples/playback/player/gtk/meson.build
 @@ -21,5 +21,6 @@ if gtk_dep.found()
         'gtk-video-renderer.h',
         'gtk-video-renderer.c'],
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch
index cb9b815488ec..6c02d8d71fee 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch
@@ -12,10 +12,10 @@ Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
  .../playback/player/gtk/gtk-play.c            | 20 +++++++++++++++++++
  1 file changed, 20 insertions(+)
 
-diff --git a/playback/player/gtk/gtk-play.c b/playback/player/gtk/gtk-play.c
+diff --git a/subprojects/gst-examples/playback/player/gtk/gtk-play.c b/subprojects/gst-examples/playback/player/gtk/gtk-play.c
 index fb83f6be29c5..2310c716f2e9 100644
---- a/playback/player/gtk/gtk-play.c
-+++ b/playback/player/gtk/gtk-play.c
+--- a/subprojects/gst-examples/playback/player/gtk/gtk-play.c
++++ b/subprojects/gst-examples/playback/player/gtk/gtk-play.c
 @@ -88,6 +88,7 @@ typedef struct
    gboolean loop;
    gboolean fullscreen;
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.7.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.7.bb
index 627bc9013710..9a4c73f092f6 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.7.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://playback/player/gtk/gtk-play.c;beginline=1;endline=20
 DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gtk+3 json-glib glib-2.0-native"
 
 SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;branch=1.28;tag=${PV} \
-           file://0001-Make-player-examples-installable.patch \
-           file://0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch \
+           file://0001-Make-player-examples-installable.patch;striplevel=3 \
+           file://0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch;striplevel=3 \
            file://gst-player.desktop \
            "
 

---
base-commit: 9ed2651231082b51ab75379219e034b7dec8c06e
change-id: 20260909-mathieu-gst-examples-striplevel-01db445ff063

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


