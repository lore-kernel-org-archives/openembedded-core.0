Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C145FEB64DD
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 17:09:18 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.13175.1687444943921445321
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 07:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=LZrMhnTy;
 spf=pass (domain: baylibre.com, ip: 209.85.128.46, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fa79605a3bso1213815e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 07:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687444942; x=1690036942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxVaVVmRyGC/NYnvqxzIi1VEx3WGm2TkCroaAiHX0tI=;
        b=LZrMhnTyGFUz+QtkBqmXPV2yQVHlahqaNyr0RB+/3UeBIylwouqlJbiSKcMMM6V7fi
         /1XafswVR/V72QKxLiY9/cf996u2QI2YtwFus4RHFYBBJGTVyH2s1ZoWDYPGY/g9nNKz
         8NGtClG4dKSgIUR7rd3AEfmVarZDSrY8MSSjET2+yDrK8G6TJenuCGsaJEub2pO4R760
         dMEzZU5jpSXQU8skp2B9IdUVusg3pYjjOnAEXciwmSemWTHQI3hBMZyM/ZYyO/2hW2dr
         aFAMjYGBrSQU4qfGZZh8Av8BMcGzEbl+qASUSaXxMpDrdgyo6uvUSobNzvim0cyNinEO
         pTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687444942; x=1690036942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxVaVVmRyGC/NYnvqxzIi1VEx3WGm2TkCroaAiHX0tI=;
        b=ErbAjxHlYvo02MXiErOU0+XeQYDVJU519oBIoLSPsQz8ol0wy+EEzglAD9OqmZ+xb9
         npzlJH3ScwPIo9FNnqYr7goX0l4B/fCbztr4RZDtO1J42uAS+1PAtP9p2b99/HLZj4+x
         j4GzH0Kt+LdImVq90xPs9qEg7RkZ534sprGo/bOVQU48rJjeTR11nyx1ObM7OKwcOcBM
         qzGQx3FMWRaR1UCosRlsapBzqs+j6XMnlMSIw3gAtmQVb/Z0qDLK3etMzvscEc7GMJcp
         eCcWRkmmbo+sAGGpK+iKz5jFovmkfkT+zIA9LZKUGmQQq870AmXRjY+PagCvqzVgGdPi
         7pbQ==
X-Gm-Message-State: AC+VfDzXj/UxFRiIuJs2N5cHZUelhNoJx6Kd5K/vTLm6GDxrt6617WuV
	KZ+quE3wzm8x17rB/VwXHJgUdQuDOaJVmJOD344=
X-Google-Smtp-Source: ACHHUZ557plQ8cimvAAMYlFDPcHlOqZhbXKqmT0IgGFlCAK55OP70wpaeJSV+WhunJwWPNcl0FZxmw==
X-Received: by 2002:a05:600c:4fd2:b0:3f9:b5bb:d762 with SMTP id o18-20020a05600c4fd200b003f9b5bbd762mr8465125wmq.9.1687444942417;
        Thu, 22 Jun 2023 07:42:22 -0700 (PDT)
Received: from tapa.fritz.box ([194.110.145.167])
        by smtp.gmail.com with ESMTPSA id f20-20020a1c6a14000000b003f8f884ebe5sm7968951wmc.2.2023.06.22.07.42.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:42:22 -0700 (PDT)
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/3] weston: Upgrade 11.0.1 -> 12.0.1
Date: Thu, 22 Jun 2023 15:42:16 +0100
Message-Id: <acca25d2cbd58d50cbaa3962f922990fee700403.1687444823.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687444823.git.pidge@baylibre.com>
References: <cover.1687444823.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 17:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183274

Tracking https://gitlab.freedesktop.org/wayland/weston/-/issues/488
we're keeping -Ddeprecated-launcher-logind but plans should be made to
remove this/work around.

We also need to add xcb-util-cursor from meta-openembedded as this is
now required for ptest. When this is pulled we can remove from meta-oe.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 .../wayland/{weston_11.0.1.bb => weston_12.0.1.bb}    | 11 ++++++++---
 .../xorg-lib/xcb-util-cursor_0.1.4.bb                 | 10 ++++++++++
 2 files changed, 18 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_11.0.1.bb => weston_12.0.1.bb} (90%)
 create mode 100644 meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb

diff --git a/meta/recipes-graphics/wayland/weston_11.0.1.bb b/meta/recipes-graphics/wayland/weston_12.0.1.bb
similarity index 90%
rename from meta/recipes-graphics/wayland/weston_11.0.1.bb
rename to meta/recipes-graphics/wayland/weston_12.0.1.bb
index 4f6ce19915..c15d55d86a 100644
--- a/meta/recipes-graphics/wayland/weston_11.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_12.0.1.bb
@@ -6,14 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
                     file://libweston/compositor.c;endline=27;md5=eb6d5297798cabe2ddc65e2af519bcf0 \
                     "
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/uploads/f5648c818fba5432edc3ea63c4db4813/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/12.0.1/downloads/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "a413f68c252957fc3191c3650823ec356ae8c124ccc0cb440da5cdc4e2cb9e57"
+SRC_URI[sha256sum] = "b18591eab278bc191720f6c09158040b795e7118af1d5ddca6acd9a8e2039535"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 UPSTREAM_CHECK_REGEX = "weston-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
@@ -26,6 +26,7 @@ require ${THISDIR}/required-distro-features.inc
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0"
 DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' xcb-util-cursor xcb-util ', '', d)}"
 
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'lto', '-Wl,-z,undefs', '', d)}"
 
@@ -71,13 +72,17 @@ PACKAGECONFIG[lcms] = "-Dcolor-management-lcms=true,-Dcolor-management-lcms=fals
 # Weston with webp support
 PACKAGECONFIG[webp] = "-Dimage-webp=true,-Dimage-webp=false,libwebp"
 # Weston with systemd-login support
-PACKAGECONFIG[systemd] = "-Dsystemd=true -Dlauncher-logind=true,-Dsystemd=false -Dlauncher-logind=false,systemd dbus"
+PACKAGECONFIG[systemd] = "-Dsystemd=true -Ddeprecated-launcher-logind=true,-Dsystemd=false -Ddeprecated-launcher-logind=false,systemd dbus"
 # Weston with Xwayland support (requires X11 and Wayland)
 PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,xwayland"
 # colord CMS support
 PACKAGECONFIG[colord] = "-Ddeprecated-color-management-colord=true,-Ddeprecated-color-management-colord=false,colord"
 # Clients support
 PACKAGECONFIG[clients] = "-Dsimple-clients=${SIMPLECLIENTS} -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
+# Pipewire support
+PACKAGECONFIG[pipewire] = "-Dbackend-pipewire=true,-Dbackend-pipewire=false, pipewire"
+# neatvnc support
+PACKAGECONFIG[neatvnc] = "-Dbackend-vnc=true,-Dbackend-vnc=false, neatvnc"
 # Virtual remote output with GStreamer on DRM backend
 PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0 gstreamer1.0-plugins-base"
 # Weston with screen-share support
diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb b/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb
new file mode 100644
index 0000000000..047697845c
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb
@@ -0,0 +1,10 @@
+require recipes-graphics/xorg-lib/xcb-util.inc
+
+SUMMARY = "XCB port of libXcursor"
+
+DEPENDS += "xcb-util xcb-util-renderutil xcb-util-image"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ce469b61c70ff8d7cce0547476891974"
+
+SRC_URI[sha256sum] = "28dcfe90bcab7b3561abe0dd58eb6832aa9cc77cfe42fcdfa4ebe20d605231fb"
-- 
2.34.1


