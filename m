Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD936D59D87
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 00:10:47 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.34225.1732579843497654491
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 16:10:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hvI5zikr;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: hiagofranco@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-724e113c821so3129997b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 16:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732579842; x=1733184642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=205xEtK5EIaiAtdQgmJPmtnmPhrfii3BwvrPWL6KpIg=;
        b=hvI5zikrjnMAIWySYjfRNVb+dvH8hIX+ibfpfFFH9vy/wJJHn20vxJMeRTBIE44jWg
         W/+K1XwmgJ8Pkg6aBJ2WhadRT3LJ9q+7Uld2G/4JesNStN1z8BRVGbizDzu72EX2pKAL
         TjOvy0M9a32FWrPYx4TZHY32xc5VfzOAd/vnDDdPJyDp/JVjk3Lfgh8Ljt6FOAj7FJlG
         Ma+wkULfSBJQANk/qoEmXNkDyMskqhd9lEeqscQzrm8Zqz0Yj9rowF/O4NAfZMyLdT/h
         3d3Yacbesf2SFIMPA125ZmpbPM8vW1HtcbNReWa1Kx7pYWAJv7e6EQOiSWI4Wl+4h2Qw
         sKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732579842; x=1733184642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=205xEtK5EIaiAtdQgmJPmtnmPhrfii3BwvrPWL6KpIg=;
        b=WirwuY0NmB77cMi/plk5jIxIApwPwkOdwaqbbidhfIZgyWdHBlVijDc4UcTC5HGxVy
         FyQUWgjsWxvJzfAElaQ5uy4XKU6pkAF6ZYnrkyXbYXsKGbIYmRthp8WpU7CBJT+sUI0v
         YFL2U7M9kKJ9t7Io7QLkPZThv6JhyXdiXEUzig8kidYQztsZpUaeBM3P+3AKXxXLP63f
         uJmItpri8Qn/g6oeWuSwPCtdcDdONOJqTJete7nyWWf17/4h8AMSSE5/ZGP2FOzQE8Iu
         2BaOIyTu7xEFwbRsrMdHwdyK/43yxlSJTTglDMQ/AvDKFZajHFFguC53O0DqcUk9CxhU
         WTVQ==
X-Gm-Message-State: AOJu0YzKYFjO64CyDH7KjZl54nn+WJuB1bG2tkEmsmmpElRNl2vYuIh/
	4INvhI669Izj0zlBGKJJohmXgXnAZeP45NaH3m58ZG2eev1yi7hoXl6AjQ==
X-Gm-Gg: ASbGncu2WYdZXJACzjKpty4fPILsl9tsDGQrl4mMUloBrY63XizBiQ55jV4e2qf9NPx
	Rd31gjTTH0aNvq6TqE5b/+9QJbfOG/ZEuu7Q52Fp2yTI3VRLQoeQtu+9SXDuZQwiRa6Qo3Yp4jA
	ypZy4Z5EZWjwRZHvRmNVtOCmzo1k7QIuvps3uRyURukdQt3QdpNuRsrpL5YcITSgFssKVSeP+Lf
	gbSlpi6xJ/YY/TKjn553pbfsC4kPt01DwL9pQ9qJ1yiQjC24WQmconioMCw0GFx
X-Google-Smtp-Source: AGHT+IFdCxAcSI8phQSP+lQezslRFVY4rwKMisvbUq4VEqBNbFpEgjQyNek8WLjBxVRtXTkM8n8o7Q==
X-Received: by 2002:a17:902:dac8:b0:211:e686:760 with SMTP id d9443c01a7336-2129f2a53a6mr233736625ad.53.1732579842360;
        Mon, 25 Nov 2024 16:10:42 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a7c1:5c7a:1bbe:c924:2a5:636])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba1b40sm71383655ad.87.2024.11.25.16.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 16:10:41 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH v3 3/3] weston: upgrade 13.0.3 -> 14.0.1
Date: Mon, 25 Nov 2024 21:08:36 -0300
Message-Id: <20241126000836.6901-4-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241126000836.6901-1-hiagofranco@gmail.com>
References: <20241126000836.6901-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 00:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207806

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


