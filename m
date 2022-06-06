Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319C5CCA473
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:44 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.30986.1654516893735839745
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CFmJK6C4;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id x17so19559575wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4wlp8GO3qhmf9t34FB67nN+np1mrReFE+aI2b9rURSw=;
        b=CFmJK6C4Dw/fpcFBj5JS5WLil78rBDve305tJ4+vvnsFGXUzwuozTrX3JSOnyoiI88
         Cq3qfNuSYVqsci2A5MPwh7Jg0zKiKv7ERjqF9ajDJOTIGEZDC5Z13EULlKduYCkBQUyx
         B4cOFpP+LDMleDd56eR+rwm5TJOMXRKDNVjhgINkebRSLjv6ZmxhLspxFAJsBqtPeZSP
         /FqX9AgjJKTu+++dHlM8T0OTotZMsnZSfUJp6a18X5MaSNgav99xl+v44a6IVNRlRFnM
         uNHTNkslcbRgts+d8gKwcjhBNrlghjwaEyDKZXnxMvJoQGgmZ16Bv0FdDI64rFdlsNxO
         DtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4wlp8GO3qhmf9t34FB67nN+np1mrReFE+aI2b9rURSw=;
        b=dO4ZqxAJxGtAr5iPr1yqA81p8ypoOxiQxlEnD3qzgLDVgZMlsK7eCM5cWWNni66+/d
         OEPa9Q9nOKFnfYtb42N6N9LZ7/zd6LaLtAvDnKxXPogM+/5cA1F07YgL0B/hQc8gNSL3
         KrduEU2gJkGtfZ4n+ezMy14YyV84Gq5kT03dUaDTvxqjNfq2F98co5/N8vAQ24ZPux6g
         TN+Pn41s4nSC2R73hqXJLKO7DMV86Ml9DlVOwvLetpXNi1IprYpRfMHNERglosHKX+s0
         zZ3IXYzdhKb558rndQuIB8eSIq9HHnJKh4ij/rbGDvAUrBPgN7lHk/1WHsmPBoFAYF6D
         5X4g==
X-Gm-Message-State: AOAM532+bChR03yCYyAJZasO9RZ/RjCNHF+27u3PlZhYO8/w97OQkp2Y
	HnmSl3xPJX+zwyvnke4TJY5Kodh0uvWMNQ==
X-Google-Smtp-Source: 
 ABdhPJzZY0vbW2sw7Gc1zUT6l/iEUtq4UXh4lEFJtwLiblqhGVQvXeeyn2c8e1RJ7pluMPCdI6iWDA==
X-Received: by 2002:adf:f842:0:b0:213:5c4b:981d with SMTP id
 d2-20020adff842000000b002135c4b981dmr19863998wrq.694.1654516891955;
        Mon, 06 Jun 2022 05:01:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/21] sato: work around missing icons in adwaita 42.0
Date: Mon,  6 Jun 2022 14:01:06 +0200
Message-Id: <20220606120126.3381438-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166594

adwaita icon theme upstream has done significant trimming around app category icons
(fullcolour versions gone completely, 'symbolic' b&w versions still around but marked
as legacy). Going forward, apps would need to provide their own icons. Given that
sato is likely to be deprecated in favour of wayland/weston rather soon, let's use
the symbolic icons for now.

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
 meta/recipes-sato/puzzles/puzzles_git.bb      |  2 +-
 .../rxvt-unicode/rxvt-unicode/rxvt.desktop    |  2 +-
 .../shutdown-desktop/shutdown.desktop         |  2 +-
 10 files changed, 87 insertions(+), 6 deletions(-)
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
index 0104f2672a..6f038cc475 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -37,7 +37,7 @@ do_install:append () {
 [Desktop Entry]
 Name=$title
 Exec=${bindir}/$prog
-Icon=applications-games
+Icon=applications-games-symbolic
 Terminal=false
 Type=Application
 Categories=Game;
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop
index 6b7978afc9..84a8ba7dc5 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop
@@ -3,7 +3,7 @@ Version=1.0
 Name=Terminal
 Comment=A unicode capable rxvt clone
 Exec=rxvt
-Icon=utilities-terminal
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


