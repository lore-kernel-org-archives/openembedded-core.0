Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF2A1088E77
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 04:38:42 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4054.1773895118130808825
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 21:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dP2SzyjD;
 spf=pass (domain: konsulko.com, ip: 209.85.160.174, mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50917e02532so6337631cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 21:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1773895117; x=1774499917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZiU8jPEEPVCvxtPlTA/gwb/2cByapPL/zoeqpZH4Hc=;
        b=dP2SzyjDm4gXUbcCwE29mF3V65XGqvo+ZYmYDgzrJymrxoe0XzP7s1Yn0rUh2FM9Xa
         wPaterhK8psuBBAI09SsKyTgBAH3BC6pux5bIxPgn62e5vHOB8Q/LCku7f94tGP0Q08s
         YzNQ1h24TuUOhobRYc+cJBVOH/KJePH1dJmy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773895117; x=1774499917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZiU8jPEEPVCvxtPlTA/gwb/2cByapPL/zoeqpZH4Hc=;
        b=Okb92l99abWkTttkE1QuFnSTmLsTm8gZd5NXM5/RjJU+cu61/J+iCp8NaG0juVHRWZ
         GCU+Yog70VsAV0yCooENI5DHfJZGHo0muM6LId3QMwJGPlNcM08IG5B4mVOsBEsMDjcw
         MjwjIoETouyak6z97RKA+pcBcL/nt4ZBc+gNTveuYsiMq2SiX2QvRbBPd5SkzhndfPRN
         KDVLKhm4r2X2X7iHYDZ26/agq1J2dI/0bAjiXSD1FjtJDQ85pnsfKpJHt98/HALK5WVV
         DeG5fjJCu8XQZ7SbLSEhbaI9KmS2qdyJX0HrJUYBkU0zI5xaTuFeB7n6H/X59yNNn8+N
         SMXA==
X-Gm-Message-State: AOJu0YxY/pjD4DQdQ+jFiUfMFT/oL+TsaHyB5JLAd51x+FIcCnDtUTWV
	D44abGvDHibqSg3MSw5ZWUDaR7HstakPgcJz43AkoiplVfnwivKulQGlvgxUTdrlk5rXUAxCwY1
	8fsWA
X-Gm-Gg: ATEYQzzWfrsX0D9tEzEoWxRVJfD8ujKLrCgPGxVvaH01dchLQQWk0Vv9LpLr8kOZ4eJ
	gYWy+UWSYpLLhUhuuXgDtmhfv3z9ui2n86C+5yC8eLpejqqQ3A3KTo5Nimgn7yAKSSxgD9YAh7w
	ByWTU5FkYY9FEY7uYUEO1XsiWBR7DKNgLSlAEeROtsqYZF6jeoSbJHW46HLn5FMXyrnkz3jCEDz
	LDXHwIhMPktL2cqelW4X6fAPaLMUeBzg2/EcUhXEvvDQ/mh47NLAALO1mk8dBGiMZKveyPh1aor
	THYYhd75poCvSv6+MxUqtT5hOPcP/Wo0CJ0TWQRSyzlpoWqQ2T9Jlj6VXRCEqM/TV0tXc5myMVT
	MBOQWoY3pFFOg+z6u1tBD6aWf6Al1IE8KQPPl/YRwP4sObFxO/T5jsR0dMh/jOamZlSmr1xSLBm
	lplmLPcULBrSe1BzPIw2V4PLXkeGBX063gM2dt1KwuuK2Du/BkPn4khxOMpwGfueTcLeKzygDbc
	kAtXKueHbRQM9hbt46NdU85/o5zd2cIjXB9MKOOestiAM7eYwxdb3E0UtXT/tbn
X-Received: by 2002:ac8:5a8d:0:b0:509:1510:6a21 with SMTP id d75a77b69052e-50b148896cfmr82518121cf.56.1773895116619;
        Wed, 18 Mar 2026 21:38:36 -0700 (PDT)
Received: from ghidorah.spiteful.org (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b13489f93sm49011131cf.4.2026.03.18.21.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 21:38:35 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v2] weston: update to 15.0.0
Date: Thu, 19 Mar 2026 00:38:21 -0400
Message-ID: <20260319043821.4015188-1-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 04:38:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233459

Announcement:
https://lore.freedesktop.org/wayland-devel/aZbDU-xtVMLhB0wD@xpredator/

Functional changes:
- New Vulkan renderer. A "vulkan" PACKAGECONFIG option has been
  added to enable building it, and it is enabled if "vulkan" is
  present in DISTRO_FEATURES, similar to how X11 and Wayland are
  handled.  A post-release change has been backported to fix
  building the new backend with X11 or Wayland disabled.
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
v2:
- Added backport of fix for building Vulkan renderer with X11 or
  Wayland disabled.

 .../wayland/weston-init/weston.ini            |   2 +-
 ...d-drm-meson.build-allow-libdisplay-i.patch |  28 ----
 ...guard-surface-output-creation-with-b.patch | 151 ++++++++++++++++++
 .../{weston_14.0.2.bb => weston_15.0.0.bb}    |  18 ++-
 4 files changed, 164 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch
 rename meta/recipes-graphics/wayland/{weston_14.0.2.bb => weston_15.0.0.bb} (87%)

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
diff --git a/meta/recipes-graphics/wayland/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch b/meta/recipes-graphics/wayland/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch
new file mode 100644
index 0000000000..2d69ae2106
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch
@@ -0,0 +1,151 @@
+From ba10e6d81462fc8628dd340ba9404e13745eae18 Mon Sep 17 00:00:00 2001
+From: Erico Nunes <nunes.erico@gmail.com>
+Date: Thu, 5 Mar 2026 17:29:06 +0100
+Subject: [PATCH] vulkan-renderer: guard surface output creation with backend
+ defines
+
+Fix compilation errors when compiling with x11 or wayland backends
+disabled or not available.
+
+Fixes: 8f56d03d ("libweston: Vulkan renderer")
+
+Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
+Upstream-Status: Backport [https://cgit.freedesktop.org/wayland/weston/commit/?id=ba10e6d81]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+---
+ .../vulkan-renderer-internal.h                | 17 ++++++++++----
+ libweston/renderer-vulkan/vulkan-renderer.c   | 22 +++++++++++++++----
+ 2 files changed, 31 insertions(+), 8 deletions(-)
+
+diff --git a/libweston/renderer-vulkan/vulkan-renderer-internal.h b/libweston/renderer-vulkan/vulkan-renderer-internal.h
+index aadfc6e4..f8604227 100644
+--- a/libweston/renderer-vulkan/vulkan-renderer-internal.h
++++ b/libweston/renderer-vulkan/vulkan-renderer-internal.h
+@@ -35,17 +35,21 @@
+ #include <stdbool.h>
+ #include <time.h>
+ 
+-#include <wayland-util.h>
+ #include <vulkan/vulkan.h>
+ #include "shared/helpers.h"
+ #include "libweston/libweston.h"
+ #include "libweston/libweston-internal.h"
+-#include <xcb/xcb.h>
+ 
+-#define VK_USE_PLATFORM_XCB_KHR
++#if defined(BUILD_WAYLAND_COMPOSITOR)
+ #define VK_USE_PLATFORM_WAYLAND_KHR
+ #include <vulkan/vulkan_wayland.h>
++#endif
++
++#if defined(BUILD_X11_COMPOSITOR)
++#define VK_USE_PLATFORM_XCB_KHR
++#include <xcb/xcb.h>
+ #include <vulkan/vulkan_xcb.h>
++#endif
+ 
+ #define MAX_NUM_IMAGES 5
+ #define MAX_CONCURRENT_FRAMES 2
+@@ -173,10 +177,15 @@ struct vulkan_renderer {
+ 	struct wl_list pipeline_list;
+ 	struct dmabuf_allocator *allocator;
+ 
++#if defined(BUILD_WAYLAND_COMPOSITOR)
+ 	PFN_vkCreateWaylandSurfaceKHR create_wayland_surface;
+-	PFN_vkCreateXcbSurfaceKHR create_xcb_surface;
+ 	PFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR get_wayland_presentation_support;
++#endif
++
++#if defined(BUILD_X11_COMPOSITOR)
++	PFN_vkCreateXcbSurfaceKHR create_xcb_surface;
+ 	PFN_vkGetPhysicalDeviceXcbPresentationSupportKHR get_xcb_presentation_support;
++#endif
+ 
+ 	PFN_vkGetImageMemoryRequirements2KHR get_image_memory_requirements2;
+ 	PFN_vkGetMemoryFdPropertiesKHR get_memory_fd_properties;
+diff --git a/libweston/renderer-vulkan/vulkan-renderer.c b/libweston/renderer-vulkan/vulkan-renderer.c
+index 9f701913..b15eff46 100644
+--- a/libweston/renderer-vulkan/vulkan-renderer.c
++++ b/libweston/renderer-vulkan/vulkan-renderer.c
+@@ -303,16 +303,20 @@ static const struct vulkan_extension_table vulkan_inst_ext_table[] = {
+ 		.name = VK_KHR_SURFACE_EXTENSION_NAME,
+ 		.flag = EXTENSION_KHR_SURFACE,
+ 	},
++#if defined(BUILD_WAYLAND_COMPOSITOR)
+ 	{
+ 		.name = VK_KHR_WAYLAND_SURFACE_EXTENSION_NAME,
+ 		.flag = EXTENSION_KHR_WAYLAND_SURFACE,
+ 		.instance_dep = EXTENSION_KHR_SURFACE,
+ 	},
++#endif
++#if defined(BUILD_X11_COMPOSITOR)
+ 	{
+ 		.name = VK_KHR_XCB_SURFACE_EXTENSION_NAME,
+ 		.flag = EXTENSION_KHR_XCB_SURFACE,
+ 		.instance_dep = EXTENSION_KHR_SURFACE,
+ 	},
++#endif
+ };
+ 
+ /* Keep in sync with vulkan-renderer-internal.h. */
+@@ -3455,9 +3459,12 @@ vulkan_renderer_output_window_create_swapchain(struct weston_output *output,
+ 	struct vulkan_renderer *vr = get_renderer(ec);
+ 	struct vulkan_output_state *vo = get_output_state(output);
+ 	VkResult result;
+-	VkBool32 supported;
++	VkBool32 supported = 0;
+ 	assert(vulkan_instance_has(vr, EXTENSION_KHR_SURFACE));
+ 
++	vo->swapchain.surface = VK_NULL_HANDLE;
++
++#if defined(BUILD_WAYLAND_COMPOSITOR)
+ 	if (options->wayland_display && options->wayland_surface) {
+ 		assert(vulkan_instance_has(vr, EXTENSION_KHR_WAYLAND_SURFACE));
+ 
+@@ -3472,7 +3479,10 @@ vulkan_renderer_output_window_create_swapchain(struct weston_output *output,
+ 		result = vr->create_wayland_surface(vr->inst, &wayland_surface_create_info, NULL,
+ 						    &vo->swapchain.surface);
+ 		check_vk_success(result, "vkCreateWaylandSurfaceKHR");
+-	} else if (options->xcb_connection && options->xcb_window) {
++	}
++#endif
++#if defined(BUILD_X11_COMPOSITOR)
++	if (options->xcb_connection && options->xcb_window) {
+ 		assert(vulkan_instance_has(vr, EXTENSION_KHR_XCB_SURFACE));
+ 
+ 		supported = vr->get_xcb_presentation_support(vr->phys_dev, 0, options->xcb_connection, options->xcb_visualid);
+@@ -3486,9 +3496,9 @@ vulkan_renderer_output_window_create_swapchain(struct weston_output *output,
+ 		result = vr->create_xcb_surface(vr->inst, &xcb_surface_create_info, NULL,
+ 						&vo->swapchain.surface);
+ 		check_vk_success(result, "vkCreateXcbSurfaceKHR");
+-	} else {
+-		assert(0);
+ 	}
++#endif
++	assert(vo->swapchain.surface != VK_NULL_HANDLE);
+ 
+ 	vkGetPhysicalDeviceSurfaceSupportKHR(vr->phys_dev, 0, vo->swapchain.surface, &supported);
+ 	assert(supported);
+@@ -4190,15 +4200,19 @@ load_instance_proc(struct vulkan_renderer *vr, const char *func, void *proc_ptr)
+ static void
+ vulkan_renderer_setup_instance_extensions(struct vulkan_renderer *vr)
+ {
++#if defined(BUILD_WAYLAND_COMPOSITOR)
+ 	if (vulkan_instance_has(vr, EXTENSION_KHR_WAYLAND_SURFACE)) {
+ 		load_instance_proc(vr, "vkCreateWaylandSurfaceKHR", &vr->create_wayland_surface);
+ 		load_instance_proc(vr, "vkGetPhysicalDeviceWaylandPresentationSupportKHR", &vr->get_wayland_presentation_support);
+ 	}
++#endif
+ 
++#if defined(BUILD_X11_COMPOSITOR)
+ 	if (vulkan_instance_has(vr, EXTENSION_KHR_XCB_SURFACE)) {
+ 		load_instance_proc(vr, "vkCreateXcbSurfaceKHR", &vr->create_xcb_surface);
+ 		load_instance_proc(vr, "vkGetPhysicalDeviceXcbPresentationSupportKHR", &vr->get_xcb_presentation_support);
+ 	}
++#endif
+ }
+ 
+ static void
+-- 
+2.51.0
+
diff --git a/meta/recipes-graphics/wayland/weston_14.0.2.bb b/meta/recipes-graphics/wayland/weston_15.0.0.bb
similarity index 87%
rename from meta/recipes-graphics/wayland/weston_14.0.2.bb
rename to meta/recipes-graphics/wayland/weston_15.0.0.bb
index c53b03def0..b67f5f52dd 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.2.bb
+++ b/meta/recipes-graphics/wayland/weston_15.0.0.bb
@@ -7,14 +7,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
                     "
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
+           file://0001-vulkan-renderer-guard-surface-output-creation-with-b.patch \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
            file://systemd-notify.weston-start \
-           file://0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch \
            "
 
-SRC_URI[sha256sum] = "b47216b3530da76d02a3a1acbf1846a9cd41d24caa86448f9c46f78f20b6e0ac"
+SRC_URI[sha256sum] = "58c6186d29a5d2f0be0dec4882af71cc190a11da803f6ed1bf0b2c74120da973"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
@@ -36,7 +36,7 @@ EXTRA_OEMESON += "-Dpipewire=false -Dtests=false"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms wayland egl clients', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd vulkan x11', d)} \
                    ${@bb.utils.contains_any('DISTRO_FEATURES', 'wayland x11', '', 'headless', d)} \
                    image-jpeg \
                    screenshare \
@@ -63,9 +63,11 @@ PACKAGECONFIG[headless] = "-Dbackend-headless=true,-Dbackend-headless=false"
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
@@ -79,21 +81,25 @@ PACKAGECONFIG[clients] = "-Dsimple-clients=${SIMPLECLIENTS} -Ddemo-clients=true,
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


