Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD22F55102
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 09:57:21 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32665.1772963836271691675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 01:57:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nVU0MRZ6;
 spf=pass (domain: konsulko.com, ip: 209.85.219.48, mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-899ee491af3so76615486d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 01:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772963835; x=1773568635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cIjy2j2PCZnheVG4lqi84MjDU8KBSavlEYcd/y1TM+c=;
        b=nVU0MRZ6W7H9WRYL3B/5It0K9qQXZwlAUMVORvumv6smyVlHHzjdJtxszRxN5e03mt
         n9RekO9PPdFSxTik91mW8jmtBOGvDZtGEzQoF69476ECm8KDAqBC5P37HGNKmaZKLPUM
         cW2v30xlyWCmBBSNcRdZj+gWio+r30Sjy2bng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772963835; x=1773568635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cIjy2j2PCZnheVG4lqi84MjDU8KBSavlEYcd/y1TM+c=;
        b=gA74Xmdxx6YvOZibzgkb+wtp0OkQNtchdJcmCHkDrJJs413D77Qvvox5H4Mogkj7rH
         iyDqK4cZR5Z1/DYUGTA6hLIHGCZ4cf2fDSeRwnValV1kOjwx9Qab2fmb3Xr6gmRzDBGo
         3w+h9YCYOaX4dmykC2nPSGw5/l0f40bl8bAe6WUesJH1++90KbECfqcZK+rtIpgERQtQ
         HhejP62/hJvqKkDujnz7Ti1GapF1WCyrd/SFCBtzfgLelBrOom93zxw3uAlq635H+UUc
         Xf6OSZw451tWLweDFFr415KFK1+L9RwkgcSLn6lddJoSoXBWPFBd3lC/q9nlHbf91ATO
         EsvA==
X-Gm-Message-State: AOJu0Yxj4NFrZz09C7Pmoz/LUuFA7FmlFkJyWo8eNLOS8pxT9VwTnCyA
	3LxCo87Hcqv+P7Q2XMWJZg+rXkJZX5D5irfSCnOr1kKe3eG5dHk+TH62thCCOp1qEN5qgwVzEtw
	+i5vI
X-Gm-Gg: ATEYQzzpg0Fyp3Pf5DAYtved114103egs+Zx193tPOKYvDy7MdZJDVFcixdKPwZpnAa
	uOKvToPSrXjzUmKokPiFI/CChX3i64d7vuJREeRY0mOfo5EP4T08j5/gXkgKJEbnIvUHK8rqW5k
	897NOrqjenmt92PJyetSegeSGBxH2qlUzOYkGdXamARCC7JMw8+ohUTT1/F//T48KFsWShPynUj
	JxcLTYur/cs+0vaIh+rxYmhhjxP3kwq0G6SCYu6/+T9qWSI6AnkNxOV6przb9wEyFlV//97dv5Y
	e0p2++g48seUGWgbyaogz5ua3HlPkfnIlwB195tc3P6laok9UJ4T/yX1z7PeR6UoBxA/VwBiKqd
	edWLN3PPM7OE7lxJVyf+XROhxOfCcKjS0ccSZLURTOJithIqNdFaIPZqgjznwjMWolf+MWmKpY1
	zTotIohSZOZpQDJ61WHmdyiV3h5WqG2QQWs9plHytIRnQmLxw0q3r4wGTjoV6XUd3o/F+DrDIgu
	ybnYf3cl3QQps2jM1ThYsT4xAnUAR5qqxuah2X9Plo5qg4r85UE+W7HKnsfgY8I
X-Received: by 2002:a05:6214:5195:b0:899:fd8c:55c6 with SMTP id 6a1803df08f44-89a30a5ee49mr107258866d6.23.1772963834930;
        Sun, 08 Mar 2026 01:57:14 -0800 (PST)
Received: from ghidorah.spiteful.org (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a3171bca1sm50858976d6.51.2026.03.08.01.57.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 01:57:14 -0800 (PST)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] weston: update to 15.0.0
Date: Sun,  8 Mar 2026 05:57:00 -0400
Message-ID: <5f4c8c72cb972c976aa2e95d0288fba6d3369415.1772963425.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1772963425.git.scott.murray@konsulko.com>
References: <cover.1772963425.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 09:57:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232639

Announcement:
https://lore.freedesktop.org/wayland-devel/aZbDU-xtVMLhB0wD@xpredator/

Functional changes:
- New Vulkan renderer. A "vulkan" PACKAGECONFIG option has been
  added to enable building it, and it is enabled if "vulkan" is
  present in DISTRO_FEATURES, similar to how X11 and Wayland are
  handled.
- New Lua shell. A "lua-shell" PACkAGECONFIG option has been added
  to enable building it, but it has not been enabled by defsult to
  avoid affecting build times.
- Fullscreen shell and screen-share module marked as deprecated.
  Their PACKAGECONFIG options have been updated to still work, but
  have not been renamed to avoid breaking working configurations.
- Perfetto support. A "perfetto" PACKAGECONFIG option has been
  added to enable building it, but it is not on by default due
  to meta-oe being required to build.
- The "client-no-resize" option for the RDP backend has been
  replaced with "resizeable/no-resizeable" to match the VNC
  backend. The example in weston.ini has been updated.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../wayland/weston-init/weston.ini            |  2 +-
 ...d-drm-meson.build-allow-libdisplay-i.patch | 28 -------------------
 .../{weston_14.0.2.bb => weston_15.0.0.bb}    | 17 +++++++----
 3 files changed, 12 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch
 rename meta/recipes-graphics/wayland/{weston_14.0.2.bb => weston_15.0.0.bb} (88%)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/recipes-graphics/wayland/weston-init/weston.ini
index 6bd5aef55a..0ec70c3ef3 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston.ini
+++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
@@ -69,7 +69,7 @@ require-input=false
 #max_accel_factor = 1.0
 
 [screen-share]
-command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
+command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-resizeable
 
 #[xwayland]
 #path=/usr/bin/Xwayland
diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch b/meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch
deleted file mode 100644
index 07916f77b3..0000000000
--- a/meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From fe8166164170465458561581afd55c325d8e138b Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 17 Dec 2025 12:54:20 +0100
-Subject: [PATCH] libweston/backend-drm/meson.build: allow libdisplay-info
- 0.3.0
-
-The patch in the main branch is against top level meson.build,
-so I manually edited in the same tweak in the 14.x codebase.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1815]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- libweston/backend-drm/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libweston/backend-drm/meson.build b/libweston/backend-drm/meson.build
-index 002669e..a8f2ea5 100644
---- a/libweston/backend-drm/meson.build
-+++ b/libweston/backend-drm/meson.build
-@@ -4,7 +4,7 @@ endif
- 
- dep_libdisplay_info = dependency(
- 	'libdisplay-info',
--	version: ['>= 0.1.1', '< 0.3.0'],
-+	version: ['>= 0.1.1', '< 0.4.0'],
- 	fallback: ['display-info', 'di_dep'],
- 	default_options: [
- 		'werror=false',
diff --git a/meta/recipes-graphics/wayland/weston_14.0.2.bb b/meta/recipes-graphics/wayland/weston_15.0.0.bb
similarity index 88%
rename from meta/recipes-graphics/wayland/weston_14.0.2.bb
rename to meta/recipes-graphics/wayland/weston_15.0.0.bb
index c53b03def0..94ae818656 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.2.bb
+++ b/meta/recipes-graphics/wayland/weston_15.0.0.bb
@@ -11,10 +11,9 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://weston.desktop \
            file://xwayland.weston-start \
            file://systemd-notify.weston-start \
-           file://0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch \
            "
 
-SRC_URI[sha256sum] = "b47216b3530da76d02a3a1acbf1846a9cd41d24caa86448f9c46f78f20b6e0ac"
+SRC_URI[sha256sum] = "58c6186d29a5d2f0be0dec4882af71cc190a11da803f6ed1bf0b2c74120da973"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
@@ -36,7 +35,7 @@ EXTRA_OEMESON += "-Dpipewire=false -Dtests=false"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms wayland egl clients', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd vulkan x11', d)} \
                    ${@bb.utils.contains_any('DISTRO_FEATURES', 'wayland x11', '', 'headless', d)} \
                    image-jpeg \
                    screenshare \
@@ -63,9 +62,11 @@ PACKAGECONFIG[headless] = "-Dbackend-headless=true,-Dbackend-headless=false"
 # Weston on RDP
 PACKAGECONFIG[rdp] = "-Dbackend-rdp=true,-Dbackend-rdp=false,freerdp,freerdp"
 # VA-API desktop recorder
-PACKAGECONFIG[vaapi] = "-Dbackend-drm-screencast-vaapi=true,-Dbackend-drm-screencast-vaapi=false,libva"
+PACKAGECONFIG[vaapi] = "-Ddeprecated-backend-drm-screencast-vaapi=true,-Ddeprecated-backend-drm-screencast-vaapi=false,libva"
 # Weston with EGL support
 PACKAGECONFIG[egl] = "-Drenderer-gl=true,-Drenderer-gl=false,virtual/egl"
+# Weston with Vulkan support
+PACKAGECONFIG[vulkan] = "-Drenderer-vulkan=true,-Drenderer-vulkan=false,glslang-native vulkan-loader vulkan-headers"
 # Weston with lcms support
 PACKAGECONFIG[lcms] = "-Dcolor-management-lcms=true,-Dcolor-management-lcms=false,lcms"
 # Weston with webp support
@@ -79,21 +80,25 @@ PACKAGECONFIG[clients] = "-Dsimple-clients=${SIMPLECLIENTS} -Ddemo-clients=true,
 # Virtual remote output with GStreamer on DRM backend
 PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0 gstreamer1.0-plugins-base"
 # Weston with screen-share support
-PACKAGECONFIG[screenshare] = "-Dscreenshare=true,-Dscreenshare=false"
+PACKAGECONFIG[screenshare] = "-Ddeprecated-screenshare=true,-Ddeprecated-screenshare=false"
 # Traditional desktop shell
 PACKAGECONFIG[shell-desktop] = "-Dshell-desktop=true,-Dshell-desktop=false"
 # Fullscreen shell
-PACKAGECONFIG[shell-fullscreen] = "-Dshell-fullscreen=true,-Dshell-fullscreen=false"
+PACKAGECONFIG[shell-fullscreen] = "-Ddeprecated-shell-fullscreen=true,-Ddeprecated-shell-fullscreen=false"
 # In-Vehicle Infotainment (IVI) shell
 PACKAGECONFIG[shell-ivi] = "-Dshell-ivi=true,-Dshell-ivi=false"
 # Kiosk shell
 PACKAGECONFIG[shell-kiosk] = "-Dshell-kiosk=true,-Dshell-kiosk=false"
+# Lua shell
+PACKAGECONFIG[shell-lua] = "-Dshell-lua=true,-Dshell-lua=false,lua"
 # JPEG image loading support
 PACKAGECONFIG[image-jpeg] = "-Dimage-jpeg=true,-Dimage-jpeg=false, jpeg"
 # screencasting via PipeWire
 PACKAGECONFIG[pipewire] = "-Dbackend-pipewire=true,-Dbackend-pipewire=false,pipewire,pipewire"
 # VNC remote screensharing
 PACKAGECONFIG[vnc] = "-Dbackend-vnc=true,-Dbackend-vnc=false,neatvnc libpam"
+# Perfetto performance analysis support
+PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"
 
 do_install:append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.51.0


