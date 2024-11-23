Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A5BE66882
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 19:38:34 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web11.54204.1732390709210466854
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Nov 2024 11:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KhM3hTYz;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: hiagofranco@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-514668ec665so2607774e0c.0
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 11:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732390708; x=1732995508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=205xEtK5EIaiAtdQgmJPmtnmPhrfii3BwvrPWL6KpIg=;
        b=KhM3hTYziuXca4Yomm4OQ8ov3niiv7yljFxzTg+DCxyceFlBgTa1T49wgsP2gmAeOJ
         /VLn8PXSJ3l88pRBzFSZKi13ZkEmHTefK7j6X+JjTDI6CqSMFAutN7LXMFXJlv/11YAs
         Sr4vupPYpJ7Djo+vUlEvFi6UQfHUbIl2A3tJ4iiILsu/34rUw/EXmaq4W4fato/DdMsk
         gqtYiAO/ra5J5QNYgUm2N80lqnbtCT+JcoCPklIzdF7EeQuBykB2XrpOj6KhN8RHdOLK
         7Dqcv3vQcgHm+6OLEPlCTinXyOwmHOfghwTkbMGY82JTnHw7elhxQjk3sDPdkU5EdHpj
         74Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732390708; x=1732995508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=205xEtK5EIaiAtdQgmJPmtnmPhrfii3BwvrPWL6KpIg=;
        b=uRZC11GUKZmXZUyz1tPXgQ6yUwQsq3KxfM1k2a4FuqEVHkWRKNeaToWW4YF2qfLRdP
         NCTIziPLgdPVRBFIbRy83O74fhDCe3btJ+B/Rq0djToSZ+ivOM5TJptY+29EOjoW1Vm9
         tA0v49cQB9uQGld2fVzWzWU2Zzg4KhlwgQh3EYyOqL2J6vKTHoeL/yNgw3qd5VsGHEXE
         uAg8HZ/fRoN1k4EkFF9ptL+zXDCSr8tlM/x1Bi+7Vu0DCBTT8DRX+JYztu4ahuXYH4lN
         erwPdpL0JCb8BESiYfPPa/l8UGgTZyMt7FaHT8JIXgKozGQe7CK2YH3M7MJcEeEbCYL4
         CYKQ==
X-Gm-Message-State: AOJu0YzQvPtLTXrbMEG2X7QDWYum70vMGPpL0xD2ac9HioDpQzYEtVhb
	nRenksj9Sn0J72Stc05H7nMsRy1pqQbXFINTrOju693OS6uCAJjH4Zialw==
X-Gm-Gg: ASbGncvoJ+7jU4E9QS5BkEC8jxFjouv993qyf0zq9h+MKef49jdj6JX8LT0SukNFRZA
	eZIisPwN1Uv7hUHCQwjmC5e7NHfA0FRzvZm6Gg7BzJUArJ1ajx5NDzU/isWPyFYspKLLSM+gib7
	egsKQjZggA7Ap9BEPqICLXxRFHT4Ni0yESGapXz9rfbGrHkwXN/obbKLL4jAoEHeWLrBAxhpXJW
	Z2T+SM7rcyeULzvaz9UBmvi4Uojkek4bUmaXst1GxaLqkhyBTw=
X-Google-Smtp-Source: AGHT+IGClMafPV3/96gvaDvmJ2FzypJWIKS1olVplBN6gN0Ox6uIK/HBxJ0yjApCjwsLFNLWkGcndQ==
X-Received: by 2002:a05:6122:4b0c:b0:50d:34fe:fef0 with SMTP id 71dfb90a1353d-514fe63f74bmr6665218e0c.6.1732390707737;
        Sat, 23 Nov 2024 11:38:27 -0800 (PST)
Received: from hiagof-nb.. ([146.70.98.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-514faf3a95fsm508162e0c.15.2024.11.23.11.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 11:38:26 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH v2 3/3] weston: upgrade 13.0.3 -> 14.0.1
Date: Sat, 23 Nov 2024 16:35:29 -0300
Message-Id: <20241123193527.1435268-4-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241123193527.1435268-1-hiagofranco@gmail.com>
References: <20241123193527.1435268-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 19:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207693

From: Hiago De Franco <hiago.franco@toradex.com>

Key changes are:

- Patches have been removed since they were merged upstream and are no
  longer needed on 14.0.1.
- Since commit a16598b038b2 ("backend-drm: make libdisplay-info
  mandatory") from Weston, libdisplay-info is now a build dependency.
- Since commit f271dd34b617 ("compositor: delete cms-static and
  cms-colord plugins") from Weston, "deprecated-color-management-colord"
  has been removed, therefore remove the "colord" PACKAGECONFIG.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 ...Include-libgen.h-for-basename-signat.patch | 45 -------------------
 ...1-vnc-Allow-neatvnc-in-version-0.8.0.patch | 27 -----------
 .../{weston_13.0.3.bb => weston_14.0.1.bb}    |  8 +---
 3 files changed, 2 insertions(+), 78 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
 rename meta/recipes-graphics/wayland/{weston_13.0.3.bb => weston_14.0.1.bb} (94%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
deleted file mode 100644
index 2a833ee973c6..000000000000
--- a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 1a2a87013eb6af8e5267ecaf61e17b65a31dc662 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 14 Dec 2023 09:13:54 -0800
-Subject: [PATCH] libweston,tools: Include libgen.h for basename signature
-
-Latest musl has removed the declaration from string.h [1] as it only
-implements POSIX version alone and string.h in glibc implements GNU
-version of basename. This now results in compile errors on musl.
-
-This might be a warning with older compilers but it is error with
-Clang-17+ as it treats -Wimplicit-function-declaration as error
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1420]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libweston/backend-drm/libbacklight.c | 1 +
- tools/zunitc/src/zunitc_impl.c       | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/libweston/backend-drm/libbacklight.c b/libweston/backend-drm/libbacklight.c
-index ca7f2d6..74690fa 100644
---- a/libweston/backend-drm/libbacklight.c
-+++ b/libweston/backend-drm/libbacklight.c
-@@ -41,6 +41,7 @@
- #include <drm.h>
- #include <fcntl.h>
- #include <malloc.h>
-+#include <libgen.h>
- #include <string.h>
- #include <errno.h>
- 
-diff --git a/tools/zunitc/src/zunitc_impl.c b/tools/zunitc/src/zunitc_impl.c
-index 18f0301..9b460fa 100644
---- a/tools/zunitc/src/zunitc_impl.c
-+++ b/tools/zunitc/src/zunitc_impl.c
-@@ -27,6 +27,7 @@
- 
- #include <errno.h>
- #include <fcntl.h>
-+#include <libgen.h>
- #include <stdarg.h>
- #include <stdbool.h>
- #include <stdio.h>
diff --git a/meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch b/meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
deleted file mode 100644
index 4ac1c075fdce..000000000000
--- a/meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 534cfa08ea0a0c2646b4aec20b16bf95f6d0aae6 Mon Sep 17 00:00:00 2001
-From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
-Date: Mon, 3 Jun 2024 13:39:27 +0200
-Subject: [PATCH] vnc: Allow neatvnc in version 0.8.0
-
-Neat VNC 0.8.0 does not introduce any changes that breaks API used
-by VNC backend, so it is safe to extend compatibility.
-
-Upstream-Status: Backport [05e5405651054c580b248c4ab2791ed8d66369e3]
-Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
----
- libweston/backend-vnc/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libweston/backend-vnc/meson.build b/libweston/backend-vnc/meson.build
-index b7b6916..39b15cf 100644
---- a/libweston/backend-vnc/meson.build
-+++ b/libweston/backend-vnc/meson.build
-@@ -3,7 +3,7 @@ if not get_option('backend-vnc')
- endif
- 
- config_h.set('BUILD_VNC_COMPOSITOR', '1')
--dep_neatvnc = dependency('neatvnc', version: ['>= 0.7.0', '< 0.8.0'], required: false, fallback: ['neatvnc', 'neatvnc_dep'])
-+dep_neatvnc = dependency('neatvnc', version: ['>= 0.7.0', '< 0.9.0'], required: false, fallback: ['neatvnc', 'neatvnc_dep'])
- if not dep_neatvnc.found()
- 	error('VNC backend requires neatvnc which was not found. Or, you can use \'-Dbackend-vnc=false\'.')
- endif
diff --git a/meta/recipes-graphics/wayland/weston_13.0.3.bb b/meta/recipes-graphics/wayland/weston_14.0.1.bb
similarity index 94%
rename from meta/recipes-graphics/wayland/weston_13.0.3.bb
rename to meta/recipes-graphics/wayland/weston_14.0.1.bb
index 471dc52bb361..50749d7d153c 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.3.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.1.bb
@@ -7,15 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
                     "
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
-           file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch \
-           file://0001-vnc-Allow-neatvnc-in-version-0.8.0.patch \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "27f68d96e3b97d98daadef13a202356524924fa381418fa6716b9136ef099093"
+SRC_URI[sha256sum] = "a8150505b126a59df781fe8c30c8e6f87da7013e179039eb844a5bbbcc7c79b3"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
@@ -27,7 +25,7 @@ inherit meson pkgconfig useradd
 require ${THISDIR}/required-distro-features.inc
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0"
-DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
+DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native libdisplay-info"
 
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'lto', '-Wl,-z,undefs', '', d)}"
 
@@ -75,8 +73,6 @@ PACKAGECONFIG[webp] = "-Dimage-webp=true,-Dimage-webp=false,libwebp"
 PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd dbus"
 # Weston with Xwayland support (requires X11 and Wayland)
 PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,libxcb libxcursor xcb-util-cursor xwayland"
-# colord CMS support
-PACKAGECONFIG[colord] = "-Ddeprecated-color-management-colord=true,-Ddeprecated-color-management-colord=false,colord"
 # Clients support
 PACKAGECONFIG[clients] = "-Dsimple-clients=${SIMPLECLIENTS} -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
 # Virtual remote output with GStreamer on DRM backend
-- 
2.39.5


