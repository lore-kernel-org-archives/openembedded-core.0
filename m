Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 804F26A96A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 16:12:05 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so5694333wgh.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 09:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=FAjcL/yDn+1NN4qlUnRAusK4MaHVBvVhKga+rL9ZER8=;
	b=EquiXFvkdYa5XIcKuSrUpKT5l4WBoeZN6D3uAJhJ0qhgT7c2xB/ZxRqROuZ+vNAfcM
	vyTDZyj8DTzOK4Db6vn2FS0iLDgoohsPrW1zQ+e0Ym8E3miLuP1J/KyRm87rQVVOhIJg
	uKT/pLdgayxmoPBb0RxelcUMeRAAdBoEesylYd9CTFP3HEp8kAEiXB6ypniyqQYTKbNW
	KXCq/eUKNnblBttlJ270Io9FUzBdOEA8Iea9c9fd47Ww1RgLUdUGIOVWc+VzNyi0AHjn
	mvbyGwX5y7aSFh/jEonB5w7WDzyw1i3ISAalXzNxkARursYicRNy/WuigPuHIyNSyrJN
	9dZA==
X-Received: by 10.194.176.71 with SMTP id cg7mr6176909wjc.18.1371744726176;
	Thu, 20 Jun 2013 09:12:06 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id k10sm1508166wia.4.2013.06.20.09.12.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Jun 2013 09:12:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2013 17:08:28 +0100
Message-Id: <01efaa8c93fd7146bec6e2c6e2531260b64c12d6.1371744428.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371744428.git.ross.burton@intel.com>
References: <cover.1371744428.git.ross.burton@intel.com>
In-Reply-To: <cover.1371744428.git.ross.burton@intel.com>
References: <cover.1371744428.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkr6yfofqFRpiGmnbhiXhXCf4Jzeyl4yCrsfAk8MCI7P2hVRgOjCgOUA0a6wAR6aZVznGi2
Subject: [PATCH 6/7] clutter: add Wayland support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Jun 2013 16:12:05 -0000

Add PACKAGECONFIG stanzas for Wayland client and server, and respect the x11 and
wayland DISTRO_FEATURES to enable the relevant backends as appropriate by
default.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.0.inc |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index 68cb22b..f51c740 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -13,6 +13,7 @@ AUTOTOOLS_AUXDIR = "${S}/build"
 EDEPENDS_X11 = "virtual/libx11 libxi libxfixes"
 EDEPENDS_GLX = "virtual/libgl"
 EDEPENDS_EGL = "virtual/egl"
+EDEPENDS_WAYLAND = "wayland libxkbcommon gdk-pixbuf"
 
 EDEPENDS_EVDEV = "libxkbcommon"
 ERDEPENDS_EVDEV = "xkeyboard-config"
@@ -22,8 +23,6 @@ EXTRA_OECONF += "--disable-introspection	\
 	     	 --disable-quartz-backend	\
 	     	 --disable-win32-backend	\
 	     	 --disable-gdk-backend		\
-	     	 --disable-wayland-backend	\
-	     	 --disable-wayland-compositor	\
 	     	 --disable-cex100-backend	\
 	     	 --disable-tslib-input		\
 	    	"
@@ -32,9 +31,12 @@ PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,${EDEPENDS_X11}
 PACKAGECONFIG[glx] = ",,${EDEPENDS_X11} ${EDEPENDS_GLX}"
 PACKAGECONFIG[egl] = "--enable-egl-backend,--disable-egl-backend,${EDEPENDS_EGL}"
 PACKAGECONFIG[evdev] = "--enable-evdev-input,--disable-evdev-input,${EDEPENDS_EVDEV},${ERDEPENDS_EVDEV}"
+PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,${EDEPENDS_WAYLAND}"
+PACKAGECONFIG[wayland-compositor] = "--enable-wayland-compositor,--disable-wayland-compositor,wayland"
 
 # Default configuration, distros might want to override
-PACKAGECONFIG ??= "x11 glx"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'x11', 'glx x11', '', d)}"
 
 FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
 
-- 
1.7.10.4


