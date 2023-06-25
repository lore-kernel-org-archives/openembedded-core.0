Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E8AC04FE2
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.20171.1687728174440314128
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SXeFkgWd;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f9c88ac077so34253965e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728173; x=1690320173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skiqdFk3d/C9IU4J5IBijMw2bNNLxGRZO/Hb7gnDavM=;
        b=SXeFkgWdXDkCDXEB40s1mnL3krzP26wQSD4nSGo6L0BQqHt2Xqkg2rMUzPFvgHjsot
         dvHOt3h1enM6ySnLcyHtT83TqvO2VpZZ5T645eWgVzGFOZiI+UaKnOZcSjn4Hi1nwRGW
         ZeLOPegSvFbsD5WZ+IbiC90o3dMasMTFI59pBE323NXiSxOqQ5p5oR8JBfI7F08dyZ+2
         wXtn/eaoj6WCTVsFTI9jcY/iHQuTyXFqmtHGLxkWsYcIYxuQQNAw3uBaoaNVRkBguW35
         KBOUyjhNNIr53clWG65FdwZEW3CDimy8t38DHD+Gmx2UvSaX+tchZa3azmdt4foI0jHd
         NpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728173; x=1690320173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skiqdFk3d/C9IU4J5IBijMw2bNNLxGRZO/Hb7gnDavM=;
        b=CU3UI2YLM8bQPek6OXbL0CUEmKWO5iwLEbndTEZeGmsju2HNxnJKXURSwFDIUyAu2I
         3SKrD0JVWWHz3DRLVVevcAUWMhAl+M0pwKJ8ifSb87+tGSTRo4g2Bgy9sELYI6i6plkG
         wxLGFXRNSqkYF5d8kXcL+3S6ALbQukWhRGalkjdAuhwz7ipAZcrbeJ4R8Lzp9kIakA1D
         KoINyhTy26z6n9KjZNH4v116uApNyg7tjz2dyL6ZHW8vRLJJfQ1GkY7iQHKSXlr3Ang2
         noLYDMECD7i9ZZc/VvTXB+CwR7nUowWnGkSyO1Hn+CBwiWaFxsB26cWoI3Q3W7WUtAXW
         7i+w==
X-Gm-Message-State: AC+VfDycTfgZSm+d6fqOYBS9qqMHW3oYDiuQWv6qurtqvovsCXY3eZDE
	mzDM2m6dG0Eu15w23oQiB1qjPAItzBRaWA==
X-Google-Smtp-Source: ACHHUZ4+F6gKTLH/6xrluu5iVwXqfmQUaz8X/gyaTK5XRcfXQzG0cPQCywaAEnOITiBvk3TsicFBiA==
X-Received: by 2002:a5d:644d:0:b0:311:1db3:92fc with SMTP id d13-20020a5d644d000000b003111db392fcmr22840954wrw.14.1687728172862;
        Sun, 25 Jun 2023 14:22:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/21] weston: update 11.0.1 -> 12.0.1
Date: Sun, 25 Jun 2023 23:22:36 +0200
Message-Id: <20230625212241.915739-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183391

Default to launcher-seatd always, as launcher-logind option has been deprecated.

xcb-util-cursor is an additional dependency of xwayland support.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{weston_11.0.1.bb => weston_12.0.1.bb}      | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_11.0.1.bb => weston_12.0.1.bb} (89%)

diff --git a/meta/recipes-graphics/wayland/weston_11.0.1.bb b/meta/recipes-graphics/wayland/weston_12.0.1.bb
similarity index 89%
rename from meta/recipes-graphics/wayland/weston_11.0.1.bb
rename to meta/recipes-graphics/wayland/weston_12.0.1.bb
index 0838791a6bf..d9eae1ff62f 100644
--- a/meta/recipes-graphics/wayland/weston_11.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_12.0.1.bb
@@ -6,14 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
                     file://libweston/compositor.c;endline=27;md5=eb6d5297798cabe2ddc65e2af519bcf0 \
                     "
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/uploads/f5648c818fba5432edc3ea63c4db4813/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "a413f68c252957fc3191c3650823ec356ae8c124ccc0cb440da5cdc4e2cb9e57"
+SRC_URI[sha256sum] = "b18591eab278bc191720f6c09158040b795e7118af1d5ddca6acd9a8e2039535"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 UPSTREAM_CHECK_REGEX = "weston-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
@@ -37,7 +37,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms wayla
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
                    ${@bb.utils.contains_any('DISTRO_FEATURES', 'wayland x11', '', 'headless', d)} \
-                   ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'sysvinit', 'launcher-libseat', '', d)} \
+                   launcher-libseat \
                    image-jpeg \
                    screenshare \
                    shell-desktop \
@@ -71,9 +71,9 @@ PACKAGECONFIG[lcms] = "-Dcolor-management-lcms=true,-Dcolor-management-lcms=fals
 # Weston with webp support
 PACKAGECONFIG[webp] = "-Dimage-webp=true,-Dimage-webp=false,libwebp"
 # Weston with systemd-login support
-PACKAGECONFIG[systemd] = "-Dsystemd=true -Dlauncher-logind=true,-Dsystemd=false -Dlauncher-logind=false,systemd dbus"
+PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd dbus"
 # Weston with Xwayland support (requires X11 and Wayland)
-PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,libxcb libxcursor xwayland"
+PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,libxcb libxcursor xcb-util-cursor xwayland"
 # colord CMS support
 PACKAGECONFIG[colord] = "-Ddeprecated-color-management-colord=true,-Ddeprecated-color-management-colord=false,colord"
 # Clients support
@@ -94,6 +94,13 @@ PACKAGECONFIG[shell-kiosk] = "-Dshell-kiosk=true,-Dshell-kiosk=false"
 PACKAGECONFIG[image-jpeg] = "-Dimage-jpeg=true,-Dimage-jpeg=false, jpeg"
 # support libseat based launch
 PACKAGECONFIG[launcher-libseat] = "-Dlauncher-libseat=true,-Dlauncher-libseat=false,seatd"
+# deprecated and superseded by libseat launcher
+PACKAGECONFIG[launcher-logind] = "-Ddeprecated-launcher-logind=true,-Ddeprecated-launcher-logind=false,"
+# screencasting via PipeWire
+PACKAGECONFIG[pipewire] = "-Dbackend-pipewire=true,-Dbackend-pipewire=false,pipewire"
+# VNC remote screensharing
+PACKAGECONFIG[vnc] = "-Dbackend-vnc=true,-Dbackend-vnc=false,neatvnc"
+
 
 do_install:append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.30.2


