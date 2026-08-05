Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEE3C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:49:12 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34115.1785908938497415638
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cvIdbA9N;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785908938; x=1817444938;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gSRWrp9Wl4BaDFqBgOmfrx1YStUBwiBDb1b2ajOKz08=;
  b=cvIdbA9NZCk6sn0nJt1cj+IL+bXZBTnUQvbi1takA8L2sh9+dJlU0p+e
   FjmGef+2dszumtURmKq2xbDITw/qYbCqhyTcad5GvlxmfKxTyanlicJiv
   ro4aRAfXICnmzovr1hOum+D3MPDiYlEHHXDuCIo0oK0f2co5azQPuHXhs
   RMAyK2efs4FRRP31AWAZqt+qdv3Qe8J5VrIb0sOy8yc4M8aB2HXZz4JEl
   8oU4rC4lwUPIFsItPJLLbhkPYk7LlwbaHalawYzMCEgc+eY4UhZLZVy5A
   WPN1ZoFGzh9thMsXIxh23ro3OmHbC4XW7uC/wj3XUi0gydJXl1VgLVQ8Z
   g==;
X-CSE-ConnectionGUID: N+bzCQcdTwaLLQn1aGxmGA==
X-CSE-MsgGUID: lKrF37l2STSrVY7T4b87XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="237724972"
X-IronPort-AV: E=Sophos;i="6.25,205,1779116400"; 
   d="scan'208";a="237724972"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 14:48:56 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6AC0A1C1C71B
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 05:48:56 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 27BA7148CE49
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 05:48:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 2CD511801111;
	Wed,  5 Aug 2026 05:48:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] weston: upgrade 15.0.1 -> 16.0.0
Date: Wed,  5 Aug 2026 13:48:49 +0800
Message-ID: <20260805054849.1513-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 05:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242821

From: Wang Mingyu <wangmy@fujitsu.com>

Backport the patch to allow weston to build with libdisplay-info 0.4.0.

Update PACKAGECONFIG entries to reflect the options actually
   available in Weston 16.0.0 (many deprecated options have been
   removed or renamed):
   - Remove the following (no longer exist):
       * screenshare
       * shell-fullscreen
       * vaapi (deprecated-backend-drm-screencast-vaapi)
   - Rename 'remoting' to 'deprecated-remoting' (the option name
     changed upstream).
   - In EXTRA_OEMESON, change '-Dpipewire=false' to
     '-Dbackend-pipewire=false' because the meson option was renamed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../weston/Allow-libdisplay-info-0.4.0.patch  | 28 +++++++++++++++++++
 .../{weston_15.0.1.bb => weston_16.0.0.bb}    | 15 +++-------
 2 files changed, 32 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/Allow-libdisplay-info-0.4.0.patch
 rename meta/recipes-graphics/wayland/{weston_15.0.1.bb => weston_16.0.0.bb} (89%)

diff --git a/meta/recipes-graphics/wayland/weston/Allow-libdisplay-info-0.4.0.patch b/meta/recipes-graphics/wayland/weston/Allow-libdisplay-info-0.4.0.patch
new file mode 100644
index 0000000000..07f37b277f
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/Allow-libdisplay-info-0.4.0.patch
@@ -0,0 +1,28 @@
+From 54cd5c3354c618815addd7e1d82fc66247099136 Mon Sep 17 00:00:00 2001
+From: Tom Pollard <tom.pollard@codethink.co.uk>
+Date: Tue, 28 Jul 2026 10:51:27 +0100
+Subject: [PATCH] Allow libdisplay-info 0.4.0
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/wayland/weston/-/commit/54cd5c3354c618815addd7e1d82fc66247099136]
+
+Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 03f4d3201f..4814a81592 100644
+--- a/meson.build
++++ b/meson.build
+@@ -180,7 +180,7 @@ endif
+ 
+ dep_libdisplay_info = dependency(
+ 	'libdisplay-info',
+-	version: ['>= 0.2.0', '< 0.4.0'],
++	version: ['>= 0.2.0', '< 0.5.0'],
+ 	fallback: ['display-info', 'di_dep'],
+ 	default_options: [
+ 		'werror=false',
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/wayland/weston_15.0.1.bb b/meta/recipes-graphics/wayland/weston_16.0.0.bb
similarity index 89%
rename from meta/recipes-graphics/wayland/weston_15.0.1.bb
rename to meta/recipes-graphics/wayland/weston_16.0.0.bb
index 946e64cea5..8e5d79aec3 100644
--- a/meta/recipes-graphics/wayland/weston_15.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_16.0.0.bb
@@ -11,9 +11,10 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://weston.desktop \
            file://xwayland.weston-start \
            file://systemd-notify.weston-start \
+           file://Allow-libdisplay-info-0.4.0.patch \
            "
 
-SRC_URI[sha256sum] = "551d039bfb0c837ba5a4d027cdb8ee16bded0eedb789821f8025d8a64b791f6d"
+SRC_URI[sha256sum] = "dfb32e2bccabda957b94a8d0ec6075acd18c71c87ebc543ee3e618d294ca0f7f"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
@@ -31,16 +32,14 @@ LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'lto', '-Wl,-z,undefs', '',
 
 WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
 
-EXTRA_OEMESON += "-Dpipewire=false -Dtests=false"
+EXTRA_OEMESON += "-Dbackend-pipewire=false -Dtests=false"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms wayland egl clients', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd vulkan x11', d)} \
                    ${@bb.utils.contains_any('DISTRO_FEATURES', 'wayland x11', '', 'headless', d)} \
                    image-jpeg \
-                   screenshare \
                    shell-desktop \
-                   shell-fullscreen \
                    shell-ivi \
                    shell-kiosk \
                    "
@@ -61,8 +60,6 @@ PACKAGECONFIG[x11] = "-Dbackend-x11=true,-Dbackend-x11=false,virtual/libx11 libx
 PACKAGECONFIG[headless] = "-Dbackend-headless=true,-Dbackend-headless=false"
 # Weston on RDP
 PACKAGECONFIG[rdp] = "-Dbackend-rdp=true,-Dbackend-rdp=false,freerdp,freerdp"
-# VA-API desktop recorder
-PACKAGECONFIG[vaapi] = "-Ddeprecated-backend-drm-screencast-vaapi=true,-Ddeprecated-backend-drm-screencast-vaapi=false,libva"
 # Weston with EGL support
 PACKAGECONFIG[egl] = "-Drenderer-gl=true,-Drenderer-gl=false,virtual/egl"
 # Weston with Vulkan support
@@ -78,13 +75,9 @@ PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,libxcb libxcursor xw
 # Clients support
 PACKAGECONFIG[clients] = "-Dsimple-clients=${SIMPLECLIENTS} -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
 # Virtual remote output with GStreamer on DRM backend
-PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0 gstreamer1.0-plugins-base"
-# Weston with screen-share support
-PACKAGECONFIG[screenshare] = "-Ddeprecated-screenshare=true,-Ddeprecated-screenshare=false"
+PACKAGECONFIG[remoting] = "-Ddeprecated-remoting=true,-Ddeprecated-remoting=false,gstreamer1.0 gstreamer1.0-plugins-base"
 # Traditional desktop shell
 PACKAGECONFIG[shell-desktop] = "-Dshell-desktop=true,-Dshell-desktop=false"
-# Fullscreen shell
-PACKAGECONFIG[shell-fullscreen] = "-Ddeprecated-shell-fullscreen=true,-Ddeprecated-shell-fullscreen=false"
 # In-Vehicle Infotainment (IVI) shell
 PACKAGECONFIG[shell-ivi] = "-Dshell-ivi=true,-Dshell-ivi=false"
 # Kiosk shell
-- 
2.43.0


