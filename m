Return-Path: <psaavedra@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB04FC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 12:27:14 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [178.60.130.6])
 by mx.groups.io with SMTP id smtpd.web09.5496.1667392025461376239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 05:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=lR/2DBJl;
 spf=pass (domain: igalia.com, ip: 178.60.130.6, mailfrom: psaavedra@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hk+cKxM43L+sEFuTiCWEiAU7O+6IxGArsq9BQIRe4RE=; b=lR/2DBJledTmcm1IFK+L6HxHDb
	PziqSQhLElwx2K+Awn/+MdHlB4XaoGv7nO/VzuwfcXqqMFpEFIHWWCHgjgvpgVOXf+8SXGT8zRxFC
	+7uhB91fNyfwPAzrjCP3+aCNqLVsicblA1xLdxvK07GO00rvVMPqpo6JZAtea5VBGTLHQFJkY8h8r
	+TVtdiXrq39BLUfOJmQipaKxhqht48XnqqZiCV3n1xiGrxcy94HiI1MYLzQwMpTiBBq5h6+A8NjYM
	mKY+cVG7BAZBAUuzbB1lmLBeFrNUh0pqP/jDFi4htRpA/1HSw2FX+9zsUgYjUg7mKz6Z+FJKtxH//
	I3b+AIIg==;
Received: from [89.7.24.164] (helo=golpe.local.igalia.com)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1oqCpi-00ApA5-0u; Wed, 02 Nov 2022 13:27:02 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-core@lists.openembedded.org
Cc: Pablo Saavedra <psaavedra@igalia.com>
Subject: [master][PATCH] weston: update 10.0.2 -> 11.0.0
Date: Wed,  2 Nov 2022 13:26:58 +0100
Message-Id: <20221102122658.321986-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 12:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172587

Highlights for this release:

- Continued work on color management infrastructure:
  In Weston 11, if you enable the tentative, experimental and WIP color
  management option, Weston will not only blend in linear light, but
  you can also set up a monitor ICC profile and Weston will do some
  kind of color mapping from sRGB to that profile. Furthermore, you can
  configure a monitor into HDR mode and deliver HDR characteristics from
  weston.ini to the monitor, but Weston will *not* produce proper HDR
  content yet, meaning the display is incorrect.
- Various RDP improvements.
- Performance improvements in the DRM backend.
- Support for the wp_single_pixel_buffer_v1 protocol.
- weston_buffer refactoring.
- Groundwork for running multiple backends at the same time (e.g. KMS + RDP)
  and for multi-GPU support in the DRM backend. This is not supported
  yet, but may be in a future release.

Breaking changes for users:

- The cms-static and cms-colord plugins are now deprecated.
- A number of features have been removed from desktop-shell: multiple
  workspaces, zoom, exposay.
- wl_shell support has been removed (superseded by xdg-shell).
- The fbdev backend has been removed (superseded by KMS).
- weston-launch and launcher-direct have been removed (superseded by libseat).
- The weston-info and weston-gears clients have been removed (weston-info is
  superseded by wayland-info).
- The KMS max-bpc property is now set by default. If you experience black
  screens with (faulty) monitors, try lowering it in weston.ini.
- Weston will now abort when running out of memory. Weston is not suitable
  for memory constrained environments.
---
 .../wayland/{weston_10.0.2.bb => weston_11.0.0.bb}        | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_10.0.2.bb => weston_11.0.0.bb} (93%)

diff --git a/meta/recipes-graphics/wayland/weston_10.0.2.bb b/meta/recipes-graphics/wayland/weston_11.0.0.bb
similarity index 93%
rename from meta/recipes-graphics/wayland/weston_10.0.2.bb
rename to meta/recipes-graphics/wayland/weston_11.0.0.bb
index 786d12be61..ba4f4062d0 100644
--- a/meta/recipes-graphics/wayland/weston_10.0.2.bb
+++ b/meta/recipes-graphics/wayland/weston_11.0.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "89646ca0d9f8d413c2767e5c3828eaa3fa149c2a105b3729a6894fa7cf1549e7"
+SRC_URI[sha256sum] = "a6138d4dc9554560ac304312df456019f4be025ec79130f05fb5f2e41c091e1d"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 UPSTREAM_CHECK_REGEX = "weston-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
@@ -58,12 +58,8 @@ PACKAGECONFIG[wayland] = "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual
 PACKAGECONFIG[x11] = "-Dbackend-x11=true,-Dbackend-x11=false,virtual/libx11 libxcb libxcb libxcursor cairo"
 # Headless Weston
 PACKAGECONFIG[headless] = "-Dbackend-headless=true,-Dbackend-headless=false"
-# Weston on framebuffer
-PACKAGECONFIG[fbdev] = "-Ddeprecated-backend-fbdev=true,-Ddeprecated-backend-fbdev=false,udev mtdev"
 # Weston on RDP
 PACKAGECONFIG[rdp] = "-Dbackend-rdp=true,-Dbackend-rdp=false,freerdp"
-# weston-launch
-PACKAGECONFIG[launch] = "-Ddeprecated-weston-launch=true,-Ddeprecated-weston-launch=false,drm"
 # VA-API desktop recorder
 PACKAGECONFIG[vaapi] = "-Dbackend-drm-screencast-vaapi=true,-Dbackend-drm-screencast-vaapi=false,libva"
 # Weston with EGL support
@@ -77,7 +73,7 @@ PACKAGECONFIG[systemd] = "-Dsystemd=true -Dlauncher-logind=true,-Dsystemd=false
 # Weston with Xwayland support (requires X11 and Wayland)
 PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false"
 # colord CMS support
-PACKAGECONFIG[colord] = "-Dcolor-management-colord=true,-Dcolor-management-colord=false,colord"
+PACKAGECONFIG[colord] = "-Ddeprecated-color-management-colord=true,-Ddeprecated-color-management-colord=false,colord"
 # Clients support
 PACKAGECONFIG[clients] = "-Dsimple-clients=${SIMPLECLIENTS} -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
 # Virtual remote output with GStreamer on DRM backend
-- 
2.34.1


