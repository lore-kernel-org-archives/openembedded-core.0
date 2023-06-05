Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D75BC7EE2D
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 13:52:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8292.1685973163941679040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 06:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CCFCD75;
	Mon,  5 Jun 2023 06:53:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F0CA3F663;
	Mon,  5 Jun 2023 06:52:43 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/4] vulkan-samples: fix build on 32-bit platforms
Date: Mon,  5 Jun 2023 14:52:38 +0100
Message-Id: <20230605135241.2568169-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 13:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182381

From: Ross Burton <ross.burton@arm.com>

Backport a patch from upstream to fix the build on 32-bit platforms, and
remove the COMPATIBLE_HOST restriction.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../vulkan/vulkan-samples/32bit.patch         | 101 ++++++++++++++++++
 .../vulkan/vulkan-samples_git.bb              |   2 +-
 2 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/32bit.pat=
ch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/32bit.patch b/me=
ta/recipes-graphics/vulkan/vulkan-samples/32bit.patch
new file mode 100644
index 00000000000..644c3b61670
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/32bit.patch
@@ -0,0 +1,101 @@
+From 49761ca63797014223d8e3ff6fb2c0235803c19c Mon Sep 17 00:00:00 2001
+From: asuessenbach <asuessenbach@nvidia.com>
+Date: Wed, 3 May 2023 09:50:08 +0200
+Subject: [PATCH] Resolve some Vulkan-Hpp-related issues on Win32.
+
+This patch fixes vulkan-samples compilation on 32-bit hosts.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+---
+ framework/common/hpp_vk_common.h                        | 4 ++--
+ framework/core/hpp_buffer.cpp                           | 4 ++--
+ framework/core/hpp_buffer.h                             | 2 +-
+ framework/core/hpp_image.cpp                            | 2 +-
+ samples/api/hpp_texture_loading/hpp_texture_loading.cpp | 2 +-
+ 5 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/framework/common/hpp_vk_common.h b/framework/common/hpp_vk_=
common.h
+index 39ed3dcde..0cbbe479e 100644
+--- a/framework/common/hpp_vk_common.h
++++ b/framework/common/hpp_vk_common.h
+@@ -92,7 +92,7 @@ inline bool is_dynamic_buffer_descriptor_type(vk::Desc=
riptorType descriptor_type
+=20
+ inline vk::ShaderModule load_shader(const std::string &filename, vk::De=
vice device, vk::ShaderStageFlagBits stage)
+ {
+-	return vkb::load_shader(filename, device, static_cast<VkShaderStageFla=
gBits>(stage));
++	return static_cast<vk::ShaderModule>(vkb::load_shader(filename, device=
, static_cast<VkShaderStageFlagBits>(stage)));
+ }
+=20
+ inline void set_image_layout(vk::CommandBuffer         command_buffer,
+@@ -104,7 +104,7 @@ inline void set_image_layout(vk::CommandBuffer      =
   command_buffer,
+                              vk::PipelineStageFlags    dst_mask =3D vk:=
:PipelineStageFlagBits::eAllCommands)
+ {
+ 	vkb::set_image_layout(command_buffer,
+-	                      image,
++	                      static_cast<VkImage>(image),
+ 	                      static_cast<VkImageLayout>(old_layout),
+ 	                      static_cast<VkImageLayout>(new_layout),
+ 	                      static_cast<VkImageSubresourceRange>(subresource=
_range),
+diff --git a/framework/core/hpp_buffer.cpp b/framework/core/hpp_buffer.c=
pp
+index 8da265acb..e6509b9f4 100644
+--- a/framework/core/hpp_buffer.cpp
++++ b/framework/core/hpp_buffer.cpp
+@@ -84,7 +84,7 @@ HPPBuffer::~HPPBuffer()
+ 	if (get_handle() && (allocation !=3D VK_NULL_HANDLE))
+ 	{
+ 		unmap();
+-		vmaDestroyBuffer(get_device().get_memory_allocator(), get_handle(), a=
llocation);
++		vmaDestroyBuffer(get_device().get_memory_allocator(), static_cast<VkB=
uffer>(get_handle()), allocation);
+ 	}
+ }
+=20
+@@ -93,7 +93,7 @@ VmaAllocation HPPBuffer::get_allocation() const
+ 	return allocation;
+ }
+=20
+-VkDeviceMemory HPPBuffer::get_memory() const
++vk::DeviceMemory HPPBuffer::get_memory() const
+ {
+ 	return memory;
+ }
+diff --git a/framework/core/hpp_buffer.h b/framework/core/hpp_buffer.h
+index 7a243c265..bad47406d 100644
+--- a/framework/core/hpp_buffer.h
++++ b/framework/core/hpp_buffer.h
+@@ -55,7 +55,7 @@ class HPPBuffer : public vkb::core::HPPVulkanResource<=
vk::Buffer>
+=20
+ 	VmaAllocation  get_allocation() const;
+ 	const uint8_t *get_data() const;
+-	VkDeviceMemory get_memory() const;
++	vk::DeviceMemory get_memory() const;
+=20
+ 	/**
+ 	 * @return Return the buffer's device address (note: requires that the=
 buffer has been created with the VK_BUFFER_USAGE_SHADER_DEVICE_ADDRESS_B=
IT usage fla)
+diff --git a/framework/core/hpp_image.cpp b/framework/core/hpp_image.cpp
+index 00fa89ba7..5e6f27363 100644
+--- a/framework/core/hpp_image.cpp
++++ b/framework/core/hpp_image.cpp
+@@ -138,7 +138,7 @@ HPPImage::~HPPImage()
+ 	if (get_handle() && memory)
+ 	{
+ 		unmap();
+-		vmaDestroyImage(get_device().get_memory_allocator(), get_handle(), me=
mory);
++		vmaDestroyImage(get_device().get_memory_allocator(), static_cast<VkIm=
age>(get_handle()), memory);
+ 	}
+ }
+=20
+diff --git a/samples/api/hpp_texture_loading/hpp_texture_loading.cpp b/s=
amples/api/hpp_texture_loading/hpp_texture_loading.cpp
+index 11a1f24c1..cbdd22773 100644
+--- a/samples/api/hpp_texture_loading/hpp_texture_loading.cpp
++++ b/samples/api/hpp_texture_loading/hpp_texture_loading.cpp
+@@ -170,7 +170,7 @@ void HPPTextureLoading::load_texture()
+ 		memory_allocate_info  =3D {memory_requirements.size,
+ 		                         get_device()->get_gpu().get_memory_type(memo=
ry_requirements.memoryTypeBits, vk::MemoryPropertyFlagBits::eDeviceLocal)=
};
+ 		texture.device_memory =3D get_device()->get_handle().allocateMemory(m=
emory_allocate_info);
+-		VK_CHECK(vkBindImageMemory(get_device()->get_handle(), texture.image,=
 texture.device_memory, 0));
++		get_device()->get_handle().bindImageMemory(texture.image, texture.dev=
ice_memory, 0);
+=20
+ 		vk::CommandBuffer copy_command =3D get_device()->create_command_buffe=
r(vk::CommandBufferLevel::ePrimary, true);
+=20
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/re=
cipes-graphics/vulkan/vulkan-samples_git.bb
index 52a9ee75fe9..458d1405aee 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,6 +9,7 @@ SRC_URI =3D "gitsm://github.com/KhronosGroup/Vulkan-Sampl=
es.git;branch=3Dmain;protoc
            file://debugfix.patch \
            file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch;pa=
tchdir=3Dthird_party/spdlog \
            file://0001-Deprecate-u8string_view.patch;patchdir=3Dthird_pa=
rty/spdlog \
+           file://32bit.patch \
            "
=20
 UPSTREAM_CHECK_COMMITS =3D "1"
@@ -18,7 +19,6 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "These are not the relea=
ses you're looking for"
 S =3D "${WORKDIR}/git"
=20
 REQUIRED_DISTRO_FEATURES =3D 'vulkan'
-COMPATIBLE_HOST =3D "(x86_64|aarch64|mips64|powerpc64|riscv64|loongarch6=
4).*-linux"
=20
 inherit cmake features_check
=20
--=20
2.34.1


