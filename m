Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B0CCD3439
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 17:37:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2105.1778002621247638197
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 10:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6CC0A407E5
	for <openembedded-core@lists.openembedded.org>; Tue,  5 May 2026 17:37:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KIqwmX9Gc94V
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2026 17:37:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 50E1E40C85
	for <openembedded-core@lists.openembedded.org>; Tue,  5 May 2026 17:37:00 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2E3E117D202;
	Tue,  5 May 2026 13:36:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 2/2] weston: upgrade 15.0.0 -> 15.0.1
Date: Tue,  5 May 2026 13:36:58 -0400
Message-Id: <20260505173658.3662663-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260505173658.3662663-1-denis@denix.org>
References: <20260505173658.3662663-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 17:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236521

Remove previously backported patches.

Release notes:
https://lore.freedesktop.org/wayland-devel/aespQ3LKAOy5O3Hx@xpredator/T/#=
u

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 ...e-asserts-relying-on-shader-compiler.patch |  47 ------
 ...guard-surface-output-creation-with-b.patch | 151 ------------------
 .../{weston_15.0.0.bb =3D> weston_15.0.1.bb}    |   4 +-
 3 files changed, 1 insertion(+), 201 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-gl-shaders-=
Remove-asserts-relying-on-shader-compiler.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-vulkan-rend=
erer-guard-surface-output-creation-with-b.patch
 rename meta/recipes-graphics/wayland/{weston_15.0.0.bb =3D> weston_15.0.=
1.bb} (96%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-gl-shaders-Remove-=
asserts-relying-on-shader-compiler.patch b/meta/recipes-graphics/wayland/=
weston/0001-gl-shaders-Remove-asserts-relying-on-shader-compiler.patch
deleted file mode 100644
index 4c9b740bd2..0000000000
--- a/meta/recipes-graphics/wayland/weston/0001-gl-shaders-Remove-asserts=
-relying-on-shader-compiler.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 5c49563ef49a502a6b8fae44f8778e109d32c2d9 Mon Sep 17 00:00:00 2001
-From: Robert Mader <robert.mader@collabora.com>
-Date: Mon, 2 Mar 2026 13:11:05 +0100
-Subject: [PATCH] gl-shaders: Remove asserts relying on shader compiler
- behavior
-
-yuv_coefficients and yuv_offsets should get optimized away by shader
-compilers as the related code paths can never be reached. This seems to
-work well on Mesa but not necessarily with other drivers.
-
-While on it, assert that the uniforms *are* present, unless the
-yuv-to-rgb conversion is handled by the driver.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/wayland/weston=
/-/commit/5c49563ef49a502a6b8fae44f8778e109d32c2d9]
-Signed-off-by: Robert Mader <robert.mader@collabora.com>
----
- libweston/renderer-gl/gl-shaders.c | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/libweston/renderer-gl/gl-shaders.c b/libweston/renderer-gl/=
gl-shaders.c
-index 98041882..18eeedf6 100644
---- a/libweston/renderer-gl/gl-shaders.c
-+++ b/libweston/renderer-gl/gl-shaders.c
-@@ -762,8 +762,18 @@ gl_shader_load_config_representation(struct weston_=
compositor *compositor,
-=20
- 	if (sconf->yuv_coefficients =3D=3D WESTON_COLOR_MATRIX_COEF_UNSET ||
- 	    sconf->yuv_coefficients =3D=3D WESTON_COLOR_MATRIX_COEF_IDENTITY) =
{
--		assert(shader->yuv_coefficients_uniform =3D=3D -1);
--		assert(shader->yuv_offsets_uniform =3D=3D -1);
-+		/*
-+		 * In this case the yuv_coefficients and yuv_offsets uniforms
-+		 * should never be used and thus get optimized away by the
-+		 * shader compiler. Unfortunately on some drivers this is not
-+		 * the case, so we can't assert on it.
-+		 */
-+		return;
-+	}
-+
-+	if (shader->yuv_coefficients_uniform =3D=3D -1 ||
-+	    shader->yuv_offsets_uniform =3D=3D -1) {
-+		assert(shader->key.variant =3D=3D SHADER_VARIANT_EXTERNAL);
- 		return;
- 	}
-=20
---=20
-2.34.1
-
diff --git a/meta/recipes-graphics/wayland/weston/0001-vulkan-renderer-gu=
ard-surface-output-creation-with-b.patch b/meta/recipes-graphics/wayland/=
weston/0001-vulkan-renderer-guard-surface-output-creation-with-b.patch
deleted file mode 100644
index 2d69ae2106..0000000000
--- a/meta/recipes-graphics/wayland/weston/0001-vulkan-renderer-guard-sur=
face-output-creation-with-b.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From ba10e6d81462fc8628dd340ba9404e13745eae18 Mon Sep 17 00:00:00 2001
-From: Erico Nunes <nunes.erico@gmail.com>
-Date: Thu, 5 Mar 2026 17:29:06 +0100
-Subject: [PATCH] vulkan-renderer: guard surface output creation with bac=
kend
- defines
-
-Fix compilation errors when compiling with x11 or wayland backends
-disabled or not available.
-
-Fixes: 8f56d03d ("libweston: Vulkan renderer")
-
-Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
-Upstream-Status: Backport [https://cgit.freedesktop.org/wayland/weston/c=
ommit/?id=3Dba10e6d81]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
----
- .../vulkan-renderer-internal.h                | 17 ++++++++++----
- libweston/renderer-vulkan/vulkan-renderer.c   | 22 +++++++++++++++----
- 2 files changed, 31 insertions(+), 8 deletions(-)
-
-diff --git a/libweston/renderer-vulkan/vulkan-renderer-internal.h b/libw=
eston/renderer-vulkan/vulkan-renderer-internal.h
-index aadfc6e4..f8604227 100644
---- a/libweston/renderer-vulkan/vulkan-renderer-internal.h
-+++ b/libweston/renderer-vulkan/vulkan-renderer-internal.h
-@@ -35,17 +35,21 @@
- #include <stdbool.h>
- #include <time.h>
-=20
--#include <wayland-util.h>
- #include <vulkan/vulkan.h>
- #include "shared/helpers.h"
- #include "libweston/libweston.h"
- #include "libweston/libweston-internal.h"
--#include <xcb/xcb.h>
-=20
--#define VK_USE_PLATFORM_XCB_KHR
-+#if defined(BUILD_WAYLAND_COMPOSITOR)
- #define VK_USE_PLATFORM_WAYLAND_KHR
- #include <vulkan/vulkan_wayland.h>
-+#endif
-+
-+#if defined(BUILD_X11_COMPOSITOR)
-+#define VK_USE_PLATFORM_XCB_KHR
-+#include <xcb/xcb.h>
- #include <vulkan/vulkan_xcb.h>
-+#endif
-=20
- #define MAX_NUM_IMAGES 5
- #define MAX_CONCURRENT_FRAMES 2
-@@ -173,10 +177,15 @@ struct vulkan_renderer {
- 	struct wl_list pipeline_list;
- 	struct dmabuf_allocator *allocator;
-=20
-+#if defined(BUILD_WAYLAND_COMPOSITOR)
- 	PFN_vkCreateWaylandSurfaceKHR create_wayland_surface;
--	PFN_vkCreateXcbSurfaceKHR create_xcb_surface;
- 	PFN_vkGetPhysicalDeviceWaylandPresentationSupportKHR get_wayland_prese=
ntation_support;
-+#endif
-+
-+#if defined(BUILD_X11_COMPOSITOR)
-+	PFN_vkCreateXcbSurfaceKHR create_xcb_surface;
- 	PFN_vkGetPhysicalDeviceXcbPresentationSupportKHR get_xcb_presentation_=
support;
-+#endif
-=20
- 	PFN_vkGetImageMemoryRequirements2KHR get_image_memory_requirements2;
- 	PFN_vkGetMemoryFdPropertiesKHR get_memory_fd_properties;
-diff --git a/libweston/renderer-vulkan/vulkan-renderer.c b/libweston/ren=
derer-vulkan/vulkan-renderer.c
-index 9f701913..b15eff46 100644
---- a/libweston/renderer-vulkan/vulkan-renderer.c
-+++ b/libweston/renderer-vulkan/vulkan-renderer.c
-@@ -303,16 +303,20 @@ static const struct vulkan_extension_table vulkan_=
inst_ext_table[] =3D {
- 		.name =3D VK_KHR_SURFACE_EXTENSION_NAME,
- 		.flag =3D EXTENSION_KHR_SURFACE,
- 	},
-+#if defined(BUILD_WAYLAND_COMPOSITOR)
- 	{
- 		.name =3D VK_KHR_WAYLAND_SURFACE_EXTENSION_NAME,
- 		.flag =3D EXTENSION_KHR_WAYLAND_SURFACE,
- 		.instance_dep =3D EXTENSION_KHR_SURFACE,
- 	},
-+#endif
-+#if defined(BUILD_X11_COMPOSITOR)
- 	{
- 		.name =3D VK_KHR_XCB_SURFACE_EXTENSION_NAME,
- 		.flag =3D EXTENSION_KHR_XCB_SURFACE,
- 		.instance_dep =3D EXTENSION_KHR_SURFACE,
- 	},
-+#endif
- };
-=20
- /* Keep in sync with vulkan-renderer-internal.h. */
-@@ -3455,9 +3459,12 @@ vulkan_renderer_output_window_create_swapchain(st=
ruct weston_output *output,
- 	struct vulkan_renderer *vr =3D get_renderer(ec);
- 	struct vulkan_output_state *vo =3D get_output_state(output);
- 	VkResult result;
--	VkBool32 supported;
-+	VkBool32 supported =3D 0;
- 	assert(vulkan_instance_has(vr, EXTENSION_KHR_SURFACE));
-=20
-+	vo->swapchain.surface =3D VK_NULL_HANDLE;
-+
-+#if defined(BUILD_WAYLAND_COMPOSITOR)
- 	if (options->wayland_display && options->wayland_surface) {
- 		assert(vulkan_instance_has(vr, EXTENSION_KHR_WAYLAND_SURFACE));
-=20
-@@ -3472,7 +3479,10 @@ vulkan_renderer_output_window_create_swapchain(st=
ruct weston_output *output,
- 		result =3D vr->create_wayland_surface(vr->inst, &wayland_surface_crea=
te_info, NULL,
- 						    &vo->swapchain.surface);
- 		check_vk_success(result, "vkCreateWaylandSurfaceKHR");
--	} else if (options->xcb_connection && options->xcb_window) {
-+	}
-+#endif
-+#if defined(BUILD_X11_COMPOSITOR)
-+	if (options->xcb_connection && options->xcb_window) {
- 		assert(vulkan_instance_has(vr, EXTENSION_KHR_XCB_SURFACE));
-=20
- 		supported =3D vr->get_xcb_presentation_support(vr->phys_dev, 0, optio=
ns->xcb_connection, options->xcb_visualid);
-@@ -3486,9 +3496,9 @@ vulkan_renderer_output_window_create_swapchain(str=
uct weston_output *output,
- 		result =3D vr->create_xcb_surface(vr->inst, &xcb_surface_create_info,=
 NULL,
- 						&vo->swapchain.surface);
- 		check_vk_success(result, "vkCreateXcbSurfaceKHR");
--	} else {
--		assert(0);
- 	}
-+#endif
-+	assert(vo->swapchain.surface !=3D VK_NULL_HANDLE);
-=20
- 	vkGetPhysicalDeviceSurfaceSupportKHR(vr->phys_dev, 0, vo->swapchain.su=
rface, &supported);
- 	assert(supported);
-@@ -4190,15 +4200,19 @@ load_instance_proc(struct vulkan_renderer *vr, c=
onst char *func, void *proc_ptr)
- static void
- vulkan_renderer_setup_instance_extensions(struct vulkan_renderer *vr)
- {
-+#if defined(BUILD_WAYLAND_COMPOSITOR)
- 	if (vulkan_instance_has(vr, EXTENSION_KHR_WAYLAND_SURFACE)) {
- 		load_instance_proc(vr, "vkCreateWaylandSurfaceKHR", &vr->create_wayla=
nd_surface);
- 		load_instance_proc(vr, "vkGetPhysicalDeviceWaylandPresentationSupport=
KHR", &vr->get_wayland_presentation_support);
- 	}
-+#endif
-=20
-+#if defined(BUILD_X11_COMPOSITOR)
- 	if (vulkan_instance_has(vr, EXTENSION_KHR_XCB_SURFACE)) {
- 		load_instance_proc(vr, "vkCreateXcbSurfaceKHR", &vr->create_xcb_surfa=
ce);
- 		load_instance_proc(vr, "vkGetPhysicalDeviceXcbPresentationSupportKHR"=
, &vr->get_xcb_presentation_support);
- 	}
-+#endif
- }
-=20
- static void
---=20
-2.51.0
-
diff --git a/meta/recipes-graphics/wayland/weston_15.0.0.bb b/meta/recipe=
s-graphics/wayland/weston_15.0.1.bb
similarity index 96%
rename from meta/recipes-graphics/wayland/weston_15.0.0.bb
rename to meta/recipes-graphics/wayland/weston_15.0.1.bb
index da347659f1..c4158e7ea3 100644
--- a/meta/recipes-graphics/wayland/weston_15.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_15.0.1.bb
@@ -7,15 +7,13 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd79ee9e66bb0=
f95d3386a7acae780b70 \
                     "
=20
 SRC_URI =3D "https://gitlab.freedesktop.org/wayland/weston/-/releases/${=
PV}/downloads/${BPN}-${PV}.tar.xz \
-           file://0001-vulkan-renderer-guard-surface-output-creation-wit=
h-b.patch \
-           file://0001-gl-shaders-Remove-asserts-relying-on-shader-compi=
ler.patch \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
            file://systemd-notify.weston-start \
            "
=20
-SRC_URI[sha256sum] =3D "58c6186d29a5d2f0be0dec4882af71cc190a11da803f6ed1=
bf0b2c74120da973"
+SRC_URI[sha256sum] =3D "551d039bfb0c837ba5a4d027cdb8ee16bded0eedb789821f=
8025d8a64b791f6d"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/weston/-/=
tags"
 UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
--=20
2.25.1


