Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D6CC636CF
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.9390.1649926646898641272
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 01:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gc9A1yFH;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id c64so5456812edf.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 01:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BJ47UE+SoSzSq0/ksMuJy3WqxX0T0wLXjfpMccm4vwY=;
        b=gc9A1yFHNZO/6WNSmxkC9qc2ydzJRFIUHXtOV9Er38odwqRJ/XQ3rpbIE6ZXpqIwa4
         4JQbyS6GaFwucaPIc782ey0Yp/aP1T2XNLyuQLAAOJw+iHCOK/bomwnTxMPlFldc5f7X
         I+I7xlhajuXbV/LvglTemQyE7Rjkd8FQAm4R5E66oxD9K/LxoOY9p3AsXKfA2+nazIK7
         SkHldjpBkVtSlU/7HHf8T4IxHTHpv7cMK0vQOAgAMThvJverEWRMan/Gd2cxJecGV7ck
         mYaYafzUj4BjjcKms2L+iRC875f+G6Lg1dj/gAui/gK4KAiCg7+f9T7+Qhw2JLoX1gE2
         4UYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BJ47UE+SoSzSq0/ksMuJy3WqxX0T0wLXjfpMccm4vwY=;
        b=Gxg9O2a28BQLfNDC6w+rR57r2aEmMrwBruQrQcEib+GaCrYBw/fdrjeS+W5iTicFns
         haPRuCcg0qRhhySFw6pmV+QeZr5GElyCuWtg0M+MClYpG+41udTxTgQXeb+srYSlf4dQ
         EoqyquHvkwXihUmYis0qg3sw4qhmaOYsyPcfcI5d9v7uH8RG5X5tvNgBoj+115PZjMNF
         CneUe83rQTOUyK06bve3DDYqmNstpXUeexWAM/QprYHoJjvptaJnd2gmoK0vpNL626gd
         6WqehEEh3gY7pqQ9S86Cu0a45QBanyUelrfsMZUC+/kOWHFI1Ipe0vkDbS2oRzzebtgF
         mz3A==
X-Gm-Message-State: AOAM533JmssSU4rSil1l0I8n3pw51wCCuiCfV+URl8eZ3UBxrU9ld9jb
	JEMrnBhSz25c61nW+GAl0l9LeR2gt1U=
X-Google-Smtp-Source: 
 ABdhPJwp2VB87MfEOkvAyIdMxs7IDlwKGNiyBpf+vbYV4EALulvkoug8OXO90/h1jd9ABpo6SahE8w==
X-Received: by 2002:a05:6402:909:b0:416:6f3c:5c1d with SMTP id
 g9-20020a056402090900b004166f3c5c1dmr1854873edz.108.1649926645425;
        Thu, 14 Apr 2022 01:57:25 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 jr16-20020a170906a99000b006e4c05e8919sm429542ejb.35.2022.04.14.01.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 01:57:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] sato: work around missing icons
Date: Thu, 14 Apr 2022 10:57:09 +0200
Message-Id: <20220414085710.2010223-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220414085710.2010223-1-alex@linutronix.de>
References: <20220414085710.2010223-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164398

adwaita icon theme upstream has done significant trimming around app category icons
(fullcolour versions gone completely, 'symbolic' b&w versions still around but marked
as legacy). We can use the symbolic icons for now, but going forwards, apps would
need to provide their own icons. Given that sato is likely to be deprecated in favour
of wayland/weston rather soon, let's use the symbolic icons for now.

[YOCTO #14782]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gstreamer/gst-examples/gst-player.desktop |  2 +-
 ...sktop-update-icon-to-one-available-i.patch | 25 ++++++++++++++++++
 .../matchbox-config-gtk_0.2.bb                |  4 ++-
 ...ile.c-use-view-refresh-symbolic-icon.patch | 26 +++++++++++++++++++
 .../matchbox-desktop/matchbox-desktop_2.2.bb  |  1 +
 ...l.desktop-use-an-icon-available-in-a.patch | 25 ++++++++++++++++++
 .../matchbox-terminal_0.2.bb                  |  4 ++-
 meta/recipes-sato/puzzles/puzzles_git.bb      |  3 ++-
 .../rxvt-unicode/rxvt-unicode/rxvt.desktop    |  2 +-
 .../shutdown-desktop/shutdown.desktop         |  2 +-
 10 files changed, 88 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-sato/matchbox-config-gtk/files/0001-mb-appearance.desktop-update-icon-to-one-available-i.patch
 create mode 100644 meta/recipes-sato/matchbox-desktop/files/0001-taku-launcher-tile.c-use-view-refresh-symbolic-icon.patch
 create mode 100644 meta/recipes-sato/matchbox-terminal/matchbox-terminal/0001-matchbox-terminal.desktop-use-an-icon-available-in-a.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/gst-player.desktop b/meta/recipes-multimedia/gstreamer/gst-examples/gst-player.desktop
index 7ddd456a1e..a5df5c9c84 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/gst-player.desktop
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/gst-player.desktop
@@ -1,7 +1,7 @@
 [Desktop Entry]
 Name=Media Player
 Comment=Basic media player
-Icon=multimedia-player
+Icon=multimedia-player-symbolic
 TryExec=gtk-play
 Exec=gtk-play
 StartupNotify=true
diff --git a/meta/recipes-sato/matchbox-config-gtk/files/0001-mb-appearance.desktop-update-icon-to-one-available-i.patch b/meta/recipes-sato/matchbox-config-gtk/files/0001-mb-appearance.desktop-update-icon-to-one-available-i.patch
new file mode 100644
index 0000000000..7e75fdab9a
--- /dev/null
+++ b/meta/recipes-sato/matchbox-config-gtk/files/0001-mb-appearance.desktop-update-icon-to-one-available-i.patch
@@ -0,0 +1,25 @@
+From ab2c716bb0679a67dc6b0878ef750d3fdd29edb7 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 13 Apr 2022 22:19:11 +0200
+Subject: [PATCH] mb-appearance.desktop: update icon to one available in
+ adwaita 42.0
+
+Upstream-Status: Inappropriate [apps need their own icons as of 42.0]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ appearance/mb-appearance.desktop | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/appearance/mb-appearance.desktop b/appearance/mb-appearance.desktop
+index 4db2bbc..cfa5142 100644
+--- a/appearance/mb-appearance.desktop
++++ b/appearance/mb-appearance.desktop
+@@ -2,7 +2,7 @@
+ Name=Appearance
+ Comment=Change the appearance
+ Exec=matchbox-appearance
+-Icon=preferences-desktop-theme
++Icon=preferences-desktop-appearance-symbolic
+ Terminal=false
+ Type=Application
+ Categories=GTK;Settings;DesktopSettings;
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
index d951baf361..c91f9a7cc2 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
@@ -12,7 +12,9 @@ RDEPENDS:${PN} = "settings-daemon"
 # SRCREV tagged 0.2
 SRCREV = "ef2192ce98d9374ffdad5f78544c3f8f353c16aa"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
-           file://no-handed.patch"
+           file://no-handed.patch \
+           file://0001-mb-appearance.desktop-update-icon-to-one-available-i.patch \
+           "
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/matchbox-desktop/files/0001-taku-launcher-tile.c-use-view-refresh-symbolic-icon.patch b/meta/recipes-sato/matchbox-desktop/files/0001-taku-launcher-tile.c-use-view-refresh-symbolic-icon.patch
new file mode 100644
index 0000000000..7a4db83da2
--- /dev/null
+++ b/meta/recipes-sato/matchbox-desktop/files/0001-taku-launcher-tile.c-use-view-refresh-symbolic-icon.patch
@@ -0,0 +1,26 @@
+From 764201dff04a7ca1c3862357ea485a6fc624dd00 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 13 Apr 2022 22:01:30 +0200
+Subject: [PATCH] taku-launcher-tile.c: use view-refresh-symbolic icon
+
+Plain view-refresh is no longer provided in latest adwaita icon theme.
+
+Upstream-Status: Inappropriate [apps need their own icons as of 42.0]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ libtaku/taku-launcher-tile.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libtaku/taku-launcher-tile.c b/libtaku/taku-launcher-tile.c
+index e7f58f3..8bbf2f7 100644
+--- a/libtaku/taku-launcher-tile.c
++++ b/libtaku/taku-launcher-tile.c
+@@ -185,7 +185,7 @@ taku_launcher_tile_new_from_item (TakuMenuItem *item)
+   taku_icon_tile_set_secondary (TAKU_ICON_TILE (tile),
+                                 taku_menu_item_get_description (item));
+   taku_icon_tile_set_pixbuf (TAKU_ICON_TILE (tile),
+-                             get_icon ("view-refresh", size));
++                             get_icon ("view-refresh-symbolic", size));
+ 
+   /* Don't need to update the icon here, because we'll get a style-set signal
+      when the widget is realised which will update the icon. */
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
index b05a9c48ad..c306aba6ec 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
@@ -15,6 +15,7 @@ SECTION = "x11/wm"
 SRCREV = "6bc67d09da4147e5552fe30011a05a2c59d2f777"
 SRC_URI = "git://git.yoctoproject.org/${BPN}-2;branch=master \
            file://vfolders/ \
+           file://0001-taku-launcher-tile.c-use-view-refresh-symbolic-icon.patch \
            "
 
 EXTRA_OECONF = "--enable-startup-notification --with-dbus"
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal/0001-matchbox-terminal.desktop-use-an-icon-available-in-a.patch b/meta/recipes-sato/matchbox-terminal/matchbox-terminal/0001-matchbox-terminal.desktop-use-an-icon-available-in-a.patch
new file mode 100644
index 0000000000..48987f9d31
--- /dev/null
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal/0001-matchbox-terminal.desktop-use-an-icon-available-in-a.patch
@@ -0,0 +1,25 @@
+From ec16ba4a1cb0e4217910a1b36783f00828bb5dfc Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 13 Apr 2022 22:24:50 +0200
+Subject: [PATCH] matchbox-terminal.desktop: use an icon available in adwaita
+ 42.0
+
+Upstream-Status: Inappropriate [apps need their own icons as of 42.0]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ matchbox-terminal.desktop | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/matchbox-terminal.desktop b/matchbox-terminal.desktop
+index c84a24c..fedaf10 100644
+--- a/matchbox-terminal.desktop
++++ b/matchbox-terminal.desktop
+@@ -3,7 +3,7 @@ Type=Application
+ Name=Terminal
+ Comment=When all else fails.
+ Exec=matchbox-terminal
+-Icon=utilities-terminal
++Icon=utilities-terminal-symbolic
+ Terminal=false
+ Categories=GTK;Utility;
+ StartupNotify=true
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
index 802ffa971b..048e247b89 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
@@ -11,7 +11,9 @@ SECTION = "x11/utils"
 
 #SRCREV tagged 0.2
 SRCREV = "161276d0f5d1be8187010fd0d9581a6feca70ea5"
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
+           file://0001-matchbox-terminal.desktop-use-an-icon-available-in-a.patch \
+           "
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 381d3cc456..6f038cc475 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -23,6 +23,7 @@ DEPENDS += "gtk+3"
 do_install:append () {
     # net conflicts with Samba, so rename it
     mv ${D}${bindir}/net ${D}${bindir}/puzzles-net
+    rm ${D}/${datadir}/applications/net.desktop
 
     # Create desktop shortcuts
     install -d ${D}/${datadir}/applications/
@@ -36,7 +37,7 @@ do_install:append () {
 [Desktop Entry]
 Name=$title
 Exec=${bindir}/$prog
-Icon=applications-games
+Icon=applications-games-symbolic
 Terminal=false
 Type=Application
 Categories=Game;
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop
index 882ea41136..84a8ba7dc5 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop
@@ -3,7 +3,7 @@ Version=1.0
 Name=Terminal
 Comment=A unicode capable rxvt clone
 Exec=rxvt
-Icon=terminal
+Icon=utilities-terminal-symbolic
 Terminal=false
 Type=Application
 Categories=Utility;TerminalEmulator;
diff --git a/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop b/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop
index 662659afc2..bc437ca2de 100644
--- a/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop
+++ b/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop
@@ -4,7 +4,7 @@ Type=Application
 Name=Shutdown
 Comment=Close down the machine safely
 Exec=poweroff
-Icon=system-shutdown
+Icon=system-shutdown-symbolic
 Terminal=false
 Categories=Utility;
 StartupNotify=true
-- 
2.30.2


