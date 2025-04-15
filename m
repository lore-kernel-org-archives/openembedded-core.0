Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9102FC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 12:42:13 +0000 (UTC)
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch [45.157.188.8])
 by mx.groups.io with SMTP id smtpd.web11.19044.1744720925601218258
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 05:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.8, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZcP1R4p7wzsDv;
	Tue, 15 Apr 2025 14:42:03 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4ZcP1R1C2pzLH2;
	Tue, 15 Apr 2025 14:42:02 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 15 Apr 2025 14:41:51 +0200
Subject: [PATCH] mesa: enable PanVK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-mesa-panvk-v1-1-39592671ef11@cherry.de>
X-B4-Tracking: v=1; b=H4sIAA5U/mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0NT3dzU4kTdgsS8smxdcwNjyzQTAzMDEyNTJaCGgqLUtMwKsGHRsbW
 1AJBLS7RcAAAA
X-Change-ID: 20250415-mesa-panvk-7039f4060425
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 12:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214844

From: Quentin Schulz <quentin.schulz@cherry.de>

If panfrost is enabled, we currently build panfrost tools and the
gallium driver. There's also a vulkan driver available for panfrost, so
let's enable it as well whenever panfrost PACKAGECONFIG is enabled,
similarly to how it's done for the gallium driver.

PanVK is the "commercial" name for the vulkan driver for panfrost but
it's enabled under the panfrost name in meson.

This was "tested" with `vkgears -info` with mesa-demos from commit
11939e1697b894be3c68a89e3ea86fc51a320836 on an RK3588-based system.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Just stumbled upon PanVK yesterday[1] so wondered how to make this work.

Sadly, vkgears from mesa-demos 9.0.0 doesn't seem to work well:

root@jaguar:~# vkgears -info
xkbcommon: ERROR: failed to add default include path /usr/share/X11/xkb
Segmentation fault

But I've bumped it to the latest commit in main branch with the
following:

"""
 diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipes-graphics/mesa/mesa-demos_git.bb
 similarity index 84%
 rename from meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
 rename to meta/recipes-graphics/mesa/mesa-demos_git.bb
 index 0301b55361..99dc298389 100644
 --- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
 +++ b/meta/recipes-graphics/mesa/mesa-demos_git.bb
 @@ -6,12 +6,15 @@ BUGTRACKER = "https://bugs.freedesktop.org"
  SECTION = "x11"
  
  LICENSE = "MIT & PD"
 -LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=914225785450eff644a86c871d3ae00e \
 +LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481fbdb2ac800ecb12405c33bcfacae \
                      file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
  
 -SRC_URI = "https://archive.mesa3d.org/demos/${BPN}-${PV}.tar.xz \
 -           "
 -SRC_URI[sha256sum] = "3046a3d26a7b051af7ebdd257a5f23bfeb160cad6ed952329cdff1e9f1ed496b"
 +SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;branch=main;protocol=https"
 +SRCREV = "11939e1697b894be3c68a89e3ea86fc51a320836"
 +
 +PV = "9.0.0+"
 +
 +S = "${WORKDIR}/git"
  
  inherit meson pkgconfig features_check
  # depends on virtual/egl, virtual/libgl ...
 @@ -28,7 +31,7 @@ PACKAGECONFIG[drm] = "-Dlibdrm=enabled,-Dlibdrm=disabled,libdrm"
  PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
  PACKAGECONFIG[gles1] = "-Dgles1=enabled,-Dgles1=disabled,virtual/libgles1"
  PACKAGECONFIG[gles2] = "-Dgles2=enabled,-Dgles2=disabled,virtual/libgles2"
 -PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR},,freeglut"
 +PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR} -Dglut=enabled,-Dglut=disabled,freeglut"
  PACKAGECONFIG[osmesa] = "-Dosmesa=enabled,-Dosmesa=disabled,"
  PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader glslang-native"
  PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor"
"""

and while I have not managed to make vkgears show something with my
minimal image on an RK3588 system, `vkgears -info` shows:

root@jaguar:~# vkgears -info
xkbcommon: ERROR: failed to add default include path /usr/share/X11/xkb
WARNING: panvk is not a conformant Vulkan implementation, testing use only.
apiVersion       = 1.1.305
driverVersion    = 6400002
vendorID         = 13b5
deviceID         = a8670000
deviceType       = integrated GPU
deviceName       = Mali-G610
deviceExtensions =
	VK_KHR_8bit_storage
	VK_KHR_16bit_storage
	VK_KHR_bind_memory2
	VK_KHR_buffer_device_address
	VK_KHR_copy_commands2
	VK_KHR_create_renderpass2
	VK_KHR_dedicated_allocation
	VK_KHR_descriptor_update_template
	VK_KHR_device_group
	VK_KHR_driver_properties
	VK_KHR_dynamic_rendering
	VK_KHR_external_fence
	VK_KHR_external_fence_fd
	VK_KHR_external_memory
	VK_KHR_external_memory_fd
	VK_KHR_external_semaphore
	VK_KHR_external_semaphore_fd
	VK_KHR_get_memory_requirements2
	VK_KHR_global_priority
	VK_KHR_image_format_list
	VK_KHR_index_type_uint8
	VK_KHR_maintenance1
	VK_KHR_maintenance2
	VK_KHR_maintenance3
	VK_KHR_map_memory2
	VK_KHR_multiview
	VK_KHR_pipeline_executable_properties
	VK_KHR_pipeline_library
	VK_KHR_push_descriptor
	VK_KHR_relaxed_block_layout
	VK_KHR_sampler_mirror_clamp_to_edge
	VK_KHR_shader_draw_parameters
	VK_KHR_shader_expect_assume
	VK_KHR_shader_float16_int8
	VK_KHR_shader_non_semantic_info
	VK_KHR_shader_relaxed_extended_instruction
	VK_KHR_shader_subgroup_rotate
	VK_KHR_storage_buffer_storage_class
	VK_KHR_swapchain
	VK_KHR_synchronization2
	VK_KHR_timeline_semaphore
	VK_KHR_variable_pointers
	VK_KHR_vertex_attribute_divisor
	VK_KHR_zero_initialize_workgroup_memory
	VK_EXT_4444_formats
	VK_EXT_buffer_device_address
	VK_EXT_custom_border_color
	VK_EXT_depth_clip_enable
	VK_EXT_external_memory_dma_buf
	VK_EXT_global_priority
	VK_EXT_global_priority_query
	VK_EXT_graphics_pipeline_library
	VK_EXT_host_query_reset
	VK_EXT_image_drm_format_modifier
	VK_EXT_image_robustness
	VK_EXT_index_type_uint8
	VK_EXT_physical_device_drm
	VK_EXT_pipeline_creation_cache_control
	VK_EXT_pipeline_creation_feedback
	VK_EXT_pipeline_robustness
	VK_EXT_private_data
	VK_EXT_provoking_vertex
	VK_EXT_queue_family_foreign
	VK_EXT_sampler_filter_minmax
	VK_EXT_scalar_block_layout
	VK_EXT_shader_module_identifier
	VK_EXT_subgroup_size_control
	VK_EXT_tooling_info
	VK_GOOGLE_decorate_string
	VK_GOOGLE_hlsl_functionality1
	VK_GOOGLE_user_type
Vulkan not supported on given XCB surface
Failed to create surface!

So I guess this is good enough for starters?

[1] https://www.collabora.com/news-and-blog/news-and-events/panvk-is-officially-vulkan-11-conformant.html
---
 meta/recipes-graphics/mesa/mesa-demos_git.bb | 47 ++++++++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc          |  1 +
 2 files changed, 48 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_git.bb b/meta/recipes-graphics/mesa/mesa-demos_git.bb
new file mode 100644
index 0000000000000000000000000000000000000000..99dc298389f4d6c2a11a0df5cca484799f986bc5
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos_git.bb
@@ -0,0 +1,47 @@
+SUMMARY = "Mesa demo applications"
+DESCRIPTION = "This package includes the demonstration application, such as glxgears. \
+These applications can be used for Mesa validation and benchmarking."
+HOMEPAGE = "http://mesa3d.org"
+BUGTRACKER = "https://bugs.freedesktop.org"
+SECTION = "x11"
+
+LICENSE = "MIT & PD"
+LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481fbdb2ac800ecb12405c33bcfacae \
+                    file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
+
+SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;branch=main;protocol=https"
+SRCREV = "11939e1697b894be3c68a89e3ea86fc51a320836"
+
+PV = "9.0.0+"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig features_check
+# depends on virtual/egl, virtual/libgl ...
+REQUIRED_DISTRO_FEATURES = "opengl x11"
+
+EXTRA_OEMESON = "-Dwith-system-data-files=true"
+
+# Note: wayland is not included as the feature requires libdecor recipe,
+# which is not currently in core
+PACKAGECONFIG ?= "drm egl gles1 gles2 \
+                  ${@bb.utils.filter('DISTRO_FEATURES', 'vulkan x11', d)}"
+
+PACKAGECONFIG[drm] = "-Dlibdrm=enabled,-Dlibdrm=disabled,libdrm"
+PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
+PACKAGECONFIG[gles1] = "-Dgles1=enabled,-Dgles1=disabled,virtual/libgles1"
+PACKAGECONFIG[gles2] = "-Dgles2=enabled,-Dgles2=disabled,virtual/libgles2"
+PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR} -Dglut=enabled,-Dglut=disabled,freeglut"
+PACKAGECONFIG[osmesa] = "-Dosmesa=enabled,-Dosmesa=disabled,"
+PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader glslang-native"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor"
+PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libglu libxkbcommon libxcb"
+
+do_install:append() {
+	# it can be completely empty when all PACKAGECONFIG options are disabled
+	rmdir --ignore-fail-on-non-empty ${D}${bindir}
+
+	if [ -f ${D}${bindir}/clear ]; then
+		mv ${D}${bindir}/clear ${D}${bindir}/clear.mesa-demos
+	fi
+}
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index aca34983e97ca684d662987d3a1d0b61ba44029a..0163d96a36a5e8eb016ddbe2b645d6bcaba71179 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -119,6 +119,7 @@ VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',fr
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_LLVM}', '', d)}"
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
 
 # mesa development and testing tools support, per driver

---
base-commit: 122e9a49614b2ddedaae1d90c06004a7a4c43998
change-id: 20250415-mesa-panvk-7039f4060425

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


