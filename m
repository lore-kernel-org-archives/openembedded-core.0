Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF40CCA461
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:51 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32820.1792040627834142683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gDZ3z6qS;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a17baef589so14325685e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040626; x=1792645426; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Za3Z6rlZ2hURy+whoeyit23PemGE0uyck00pz2djhO4=;
        b=gDZ3z6qSCxVumtOFeOXFMW754EEklY7uZ2061MnmRP6uY6rRqBj8HHqVh/GPUyDpgy
         +Uo1kLUhi3xUWKDVLaIO0NSYOcOSFiku7JapKjN4jKkw9xbNw47U87Gfm0StVeDsyHXL
         pAA+nUGDTqsgVSBlvqvfDskZhXjturFyQNvS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040626; x=1792645426;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Za3Z6rlZ2hURy+whoeyit23PemGE0uyck00pz2djhO4=;
        b=LytuqjawAv6RLamujiyEjlHe8nKm2s5LQM4BD8+7482F/0+XHp+6kXSaIgNC8i5UG2
         +6b0Y3qUT3wUz72bgZW1uy6JzDLinRpzr9duIp26ZNKaqeZpWiEgCejCP/zJg++wiTAK
         NYt8+0VBcNub3re5wBibK3Po5LoIZEfkkchVK7zA+LjJwZDKIXCE8lW0ItVWYTXr3TUp
         MKTXAt5gk5SwStCIMgPGQnnrcUaaBNOa1vQj+2wfTjuGc7Z1Qkh6yqxEe6/5H4oTn/c2
         M3DVLZUqQVSZ4pCECx7G+Pz/Ef3CVvWJso/+ZYz2LAIts4j4lBkV2XcBPjqRhA+okiTj
         73Jw==
X-Gm-Message-State: AFq9FYK+TGatBM4l7ha1PK1C+mIBdvUhLhj2yhZf/2Zpf2/NtzBqdyMP
	05qHAyEs9YYQuNrRUYFojhwK6C9Wh/g01tBGiy8TQp76RJYnc1k/9J0Nsl8D7XX6i8thniqUthB
	rq+mj5BA=
X-Gm-Gg: AYBFou0xssw4li/AYw5m9RGJkWGrbpMyUQruj/rsiQpuWGFrmPD3BrqTw+oYntmtQJs
	X0XTkZjjuVV9qI8bP2qNK5C8XwOusQbotdmAciBBNCbgGqANnY9pPFWw3mkTk5MqBUIqNZaiVHC
	b8PYcFsySb3AkI0fbRU6xMal9p6Yjys1rGDThHMPu/fvgx2MKEyiFMgHnS3AouRHXP6kE07esNx
	KuTVLC/oXsmj6zKbolEudWa7c3+Z93kvV1c34iPLJgnGpXZEs+v3WKAQ38JA7UXI1YWIDHiyuWl
	9WGUuIVcu3FOVaWZAdd7eSPX4/x99FVocJk0kH2JhH4a0Kcw94r2HtLoJTbo8vHB6A3syOBLLFm
	8CpHQUNKAbLW4Jatt1d4BhnoMAfgKWBCDgQOsvHLcmuqzTl5DO7ew7ga16z/TQW+jbZbue+5GPC
	didK+oZlnUdL1RZ/2jO65Zse+Aa90TAl8eBoa1+KfGIYfBxol2y5RwA2DGI8ldhmdqK7HFq+EyC
	ka33jSSw98wmHtJaA9tYHv1Rxx5bGHthaYqiJhuLQyxPSpakEW4xqwcZsVL+UvryW3zENI8Lg==
X-Received: by 2002:a05:600c:8b64:b0:49d:174e:2a1e with SMTP id 5b1f17b1804b1-4a18e498851mr379080495e9.19.1792040625860;
        Wed, 14 Oct 2026 22:03:45 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/55] mesa: patch CVE-2026-40393
Date: Thu, 15 Oct 2026 07:02:35 +0200
Message-ID: <077a8fc11e7f4767ce51f04518388631edbd4350.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247810

From: Peter Marko <peter.marko@siemens.com>

Pick patches per [1].

Also pick two patches preparing the used helper functions.
Drop changes in .pick_status.json not affting our builds.
Resolve minor conflicts.

[1] https://security-tracker.debian.org/tracker/CVE-2026-40393

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../mesa/files/CVE-2026-40393-01.patch        | 126 ++++++++++++++++++
 .../mesa/files/CVE-2026-40393-02.patch        | 119 +++++++++++++++++
 .../mesa/files/CVE-2026-40393-03.patch        | 103 ++++++++++++++
 .../mesa/files/CVE-2026-40393-04.patch        |  54 ++++++++
 meta/recipes-graphics/mesa/mesa.inc           |   4 +
 5 files changed, 406 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/CVE-2026-40393-01.patch
 create mode 100644 meta/recipes-graphics/mesa/files/CVE-2026-40393-02.patch
 create mode 100644 meta/recipes-graphics/mesa/files/CVE-2026-40393-03.patch
 create mode 100644 meta/recipes-graphics/mesa/files/CVE-2026-40393-04.patch

diff --git a/meta/recipes-graphics/mesa/files/CVE-2026-40393-01.patch b/meta/recipes-graphics/mesa/files/CVE-2026-40393-01.patch
new file mode 100644
index 00000000000..f24853a1dd4
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/CVE-2026-40393-01.patch
@@ -0,0 +1,126 @@
+From b0653370d0ea7d6c72cd419451debed52e09653d Mon Sep 17 00:00:00 2001
+From: Paulo Zanoni <paulo.r.zanoni@intel.com>
+Date: Mon, 18 Mar 2024 16:33:54 -0700
+Subject: [PATCH] vulkan: don't zero-initialize STACK_ARRAY()'s stack array
+
+STACK_ARRAY() is used in a lot of places. When games are running we
+see STACK_ARRAY() arrays being used all the time: each queue
+submission uses 6, WaitSemaphores and syncobj waiting also uses them:
+they're constantly present in Vulkan runtime.
+
+There's no need for STACK_ARRAY()'s stack array to be initialized,
+callers cannot not depend on it. If the number of elements is greater
+than STACK_ARRAY_SIZE, then STACK_ARRAY() will just malloc() the array
+and return it not initialized: anybody depending of
+zero-initialization is going to break when the array is big.
+
+The reason why we're zero-intializing STACK_ARRAY()'s stack array is
+to silence -Wmaybe-uninitialized warnings: see commit d7957df31848
+("vulkan: fix uninitialized variables"). I don't think that commit is
+the ideal way to deal with the problem, so this patch proposes a
+better solution.
+
+The problem here is that zero-initializing it adds code we don't need
+for every single caller. STACK_ARRAY() already has 63 callers and only
+3 of them are affected by the -Wmaybe-uninitialized warining. So here
+we undo what commit d7957df31848 did and instead we fix the 3 cases
+that actually generate the -Wmaybe-uninitialized warnings.
+
+Gcc is only emitting those warinings because it knows that the number
+of elements in the array may be zero, so the loops we have that set
+elements to the array may end up do nothing, and then we pass the
+array uninitialized to other functions.
+
+For the cases related to vk_sync this is just returning VK_SUCCESS
+earlier, instead of relying on the check that eventually happens at
+__vk_sync_wait_many(). For the vkCmdWaitEvents() function, the Vulkan
+spec says that "eventCount must be greater than 0", so the early
+return doesn't hurt anybody either. In both cases we make the zero
+case faster by not defining an 8-sized array, zero-initializing it,
+then returning success without using it.
+
+Reference: d7957df31848 ("vulkan: fix uninitialized variables")
+Acked-by: Yonggang Luo <luoyonggang@gmail.com>
+Reviewed-by: Yiwei Zhang <zzyiwei@chromium.org>
+Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28288>
+
+CVE: CVE-2026-40393
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/b0653370d0ea7d6c72cd419451debed52e09653d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/vulkan/runtime/vk_queue.c           |  4 ++++
+ src/vulkan/runtime/vk_sync_binary.c     |  3 +++
+ src/vulkan/runtime/vk_synchronization.c |  3 +++
+ src/vulkan/util/vk_util.h               | 14 +++++++-------
+ 4 files changed, 17 insertions(+), 7 deletions(-)
+
+diff --git a/src/vulkan/runtime/vk_queue.c b/src/vulkan/runtime/vk_queue.c
+index b54dff90d5d..c8b55b58b0a 100644
+--- a/src/vulkan/runtime/vk_queue.c
++++ b/src/vulkan/runtime/vk_queue.c
+@@ -1037,6 +1037,10 @@ vk_queue_wait_before_present(struct vk_queue *queue,
+       return VK_SUCCESS;
+ 
+    const uint32_t wait_count = pPresentInfo->waitSemaphoreCount;
++
++   if (wait_count == 0)
++      return VK_SUCCESS;
++
+    STACK_ARRAY(struct vk_sync_wait, waits, wait_count);
+ 
+    for (uint32_t i = 0; i < wait_count; i++) {
+diff --git a/src/vulkan/runtime/vk_sync_binary.c b/src/vulkan/runtime/vk_sync_binary.c
+index 3d2720f9348..c10cabe348a 100644
+--- a/src/vulkan/runtime/vk_sync_binary.c
++++ b/src/vulkan/runtime/vk_sync_binary.c
+@@ -91,6 +91,9 @@ vk_sync_binary_wait_many(struct vk_device *device,
+                          enum vk_sync_wait_flags wait_flags,
+                          uint64_t abs_timeout_ns)
+ {
++   if (wait_count == 0)
++      return VK_SUCCESS;
++
+    STACK_ARRAY(struct vk_sync_wait, timeline_waits, wait_count);
+ 
+    for (uint32_t i = 0; i < wait_count; i++) {
+diff --git a/src/vulkan/runtime/vk_synchronization.c b/src/vulkan/runtime/vk_synchronization.c
+index 53fb56e686d..701474164e4 100644
+--- a/src/vulkan/runtime/vk_synchronization.c
++++ b/src/vulkan/runtime/vk_synchronization.c
+@@ -249,6 +249,9 @@ vk_common_CmdWaitEvents(
+    VK_FROM_HANDLE(vk_command_buffer, cmd_buffer, commandBuffer);
+    struct vk_device *device = cmd_buffer->base.device;
+ 
++   if (eventCount == 0)
++      return;
++
+    STACK_ARRAY(VkDependencyInfo, deps, eventCount);
+ 
+    /* Note that dstStageMask and srcStageMask in the CmdWaitEvent2() call
+diff --git a/src/vulkan/util/vk_util.h b/src/vulkan/util/vk_util.h
+index 85807f410fa..d29db67a4d0 100644
+--- a/src/vulkan/util/vk_util.h
++++ b/src/vulkan/util/vk_util.h
+@@ -358,14 +358,14 @@ vk_spec_info_to_nir_spirv(const VkSpecializationInfo *spec_info,
+ 
+ #define STACK_ARRAY_SIZE 8
+ 
+-#ifdef __cplusplus
+-#define STACK_ARRAY_ZERO_INIT {}
+-#else
+-#define STACK_ARRAY_ZERO_INIT {0}
+-#endif
+-
++/* Sometimes gcc may claim -Wmaybe-uninitialized for the stack array in some
++ * places it can't verify that when size is 0 nobody down the call chain reads
++ * the array. Please don't try to fix it by zero-initializing the array here
++ * since it's used in a lot of different places. An "if (size == 0) return;"
++ * may work for you.
++ */
+ #define STACK_ARRAY(type, name, size) \
+-   type _stack_##name[STACK_ARRAY_SIZE] = STACK_ARRAY_ZERO_INIT; \
++   type _stack_##name[STACK_ARRAY_SIZE]; \
+    type *const name = \
+      ((size) <= STACK_ARRAY_SIZE ? _stack_##name : (type *)malloc((size) * sizeof(type)))
+ 
diff --git a/meta/recipes-graphics/mesa/files/CVE-2026-40393-02.patch b/meta/recipes-graphics/mesa/files/CVE-2026-40393-02.patch
new file mode 100644
index 00000000000..620d50e60d3
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/CVE-2026-40393-02.patch
@@ -0,0 +1,119 @@
+From f43cff3728e58c377d1e03b13db62514217abfe1 Mon Sep 17 00:00:00 2001
+From: Faith Ekstrand <faith.ekstrand@collabora.com>
+Date: Tue, 29 Jul 2025 03:10:41 -0400
+Subject: [PATCH] util: Move STACK_ARRAY into util
+
+It's useful for more than just Vulkan.
+
+Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
+Reviewed-by: Christoph Pillmayer <christoph.pillmayer@arm.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36385>
+
+CVE: CVE-2026-40393
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/f43cff3728e58c377d1e03b13db62514217abfe1]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/util/meson.build      |  1 +
+ src/util/stack_array.h    | 45 +++++++++++++++++++++++++++++++++++++++
+ src/vulkan/util/vk_util.h | 17 +--------------
+ 3 files changed, 47 insertions(+), 16 deletions(-)
+ create mode 100644 src/util/stack_array.h
+
+diff --git a/src/util/meson.build b/src/util/meson.build
+index a60fbc7b660..ed746734b87 100644
+--- a/src/util/meson.build
++++ b/src/util/meson.build
+@@ -122,6 +122,7 @@ files_mesa_util = files(
+   'softfloat.h',
+   'sparse_array.c',
+   'sparse_array.h',
++  'stack_array.h',
+   'string_buffer.c',
+   'string_buffer.h',
+   'strndup.h',
+diff --git a/src/util/stack_array.h b/src/util/stack_array.h
+new file mode 100644
+index 00000000000..e2133bdc2f4
+--- /dev/null
++++ b/src/util/stack_array.h
+@@ -0,0 +1,45 @@
++/*
++ * Copyright © 2025 Collabora, Ltd.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining a
++ * copy of this software and associated documentation files (the "Software"),
++ * to deal in the Software without restriction, including without limitation
++ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
++ * and/or sell copies of the Software, and to permit persons to whom the
++ * Software is furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice (including the next
++ * paragraph) shall be included in all copies or substantial portions of the
++ * Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
++ * IN THE SOFTWARE.
++ */
++
++#include <stdlib.h>
++
++#ifndef UTIL_STACK_ARRAY_H
++#define UTIL_STACK_ARRAY_H
++
++#define STACK_ARRAY_SIZE 8
++
++/* Sometimes gcc may claim -Wmaybe-uninitialized for the stack array in some
++ * places it can't verify that when size is 0 nobody down the call chain reads
++ * the array. Please don't try to fix it by zero-initializing the array here
++ * since it's used in a lot of different places. An "if (size == 0) return;"
++ * may work for you.
++ */
++#define STACK_ARRAY(type, name, size) \
++   type _stack_##name[STACK_ARRAY_SIZE]; \
++   type *const name = \
++     ((size) <= STACK_ARRAY_SIZE ? _stack_##name : (type *)malloc((size) * sizeof(type)))
++
++#define STACK_ARRAY_FINISH(name) \
++   if (name != _stack_##name) free(name)
++
++#endif /* UTIL_STACK_ARRAY_H */
+diff --git a/src/vulkan/util/vk_util.h b/src/vulkan/util/vk_util.h
+index aea4c569a18..4f5972b291a 100644
+--- a/src/vulkan/util/vk_util.h
++++ b/src/vulkan/util/vk_util.h
+@@ -25,6 +25,7 @@
+ 
+ #include "util/bitscan.h"
+ #include "util/macros.h"
++#include "util/stack_array.h"
+ #include "compiler/shader_enums.h"
+ #include <stdlib.h>
+ #include <string.h>
+@@ -356,22 +357,6 @@ struct nir_spirv_specialization*
+ vk_spec_info_to_nir_spirv(const VkSpecializationInfo *spec_info,
+                           uint32_t *out_num_spec_entries);
+ 
+-#define STACK_ARRAY_SIZE 8
+-
+-/* Sometimes gcc may claim -Wmaybe-uninitialized for the stack array in some
+- * places it can't verify that when size is 0 nobody down the call chain reads
+- * the array. Please don't try to fix it by zero-initializing the array here
+- * since it's used in a lot of different places. An "if (size == 0) return;"
+- * may work for you.
+- */
+-#define STACK_ARRAY(type, name, size) \
+-   type _stack_##name[STACK_ARRAY_SIZE]; \
+-   type *const name = \
+-     ((size) <= STACK_ARRAY_SIZE ? _stack_##name : (type *)malloc((size) * sizeof(type)))
+-
+-#define STACK_ARRAY_FINISH(name) \
+-   if (name != _stack_##name) free(name)
+-
+ static inline uint8_t
+ vk_index_type_to_bytes(enum VkIndexType type)
+ {
diff --git a/meta/recipes-graphics/mesa/files/CVE-2026-40393-03.patch b/meta/recipes-graphics/mesa/files/CVE-2026-40393-03.patch
new file mode 100644
index 00000000000..96ab229a552
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/CVE-2026-40393-03.patch
@@ -0,0 +1,103 @@
+From 978fd42b4b7d1e9c0435ffa7e1a4d339cba9b76e Mon Sep 17 00:00:00 2001
+From: Ian Romanick <ian.d.romanick@intel.com>
+Date: Fri, 23 Jan 2026 09:58:26 -0800
+Subject: [PATCH] spirv: Use STACK_ARRAY instead of NIR_VLA
+
+The number of fields comes from the shader, so it could be a value large
+enough that using alloca would be problematic.
+
+Fixes: 2a023f30a64 ("nir/spirv: Add basic support for types")
+Reviewed-by: Caio Oliveira <caio.oliveira@intel.com>
+Reviewed-by: Ryan Neph <ryanneph@google.com>
+Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
+(cherry picked from commit 3da828d2dd12e20ba2afc152db8d7236c7a48c13)
+
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40092>
+
+CVE: CVE-2026-40393
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/978fd42b4b7d1e9c0435ffa7e1a4d339cba9b76e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/compiler/spirv/spirv_to_nir.c | 27 +++++++++++++++++----------
+ 1 file changed, 17 insertions(+), 10 deletions(-)
+
+diff --git a/src/compiler/spirv/spirv_to_nir.c b/src/compiler/spirv/spirv_to_nir.c
+index 65229eee740..9cf2c66cec9 100644
+--- a/src/compiler/spirv/spirv_to_nir.c
++++ b/src/compiler/spirv/spirv_to_nir.c
+@@ -27,7 +27,6 @@
+ 
+ #include "glsl_types.h"
+ #include "vtn_private.h"
+-#include "nir/nir_vla.h"
+ #include "nir/nir_control_flow.h"
+ #include "nir/nir_constant_expressions.h"
+ #include "nir/nir_deref.h"
+@@ -37,6 +36,7 @@
+ #include "util/u_math.h"
+ #include "util/u_string.h"
+ #include "util/u_debug.h"
++#include "util/stack_array.h"
+ 
+ #include <stdio.h>
+ 
+@@ -1013,7 +1013,7 @@ vtn_type_get_nir_type(struct vtn_builder *b, struct vtn_type *type,
+       case vtn_base_type_struct: {
+          bool need_new_struct = false;
+          const uint32_t num_fields = type->length;
+-         NIR_VLA(struct glsl_struct_field, fields, num_fields);
++         STACK_ARRAY(struct glsl_struct_field, fields, num_fields);
+          for (unsigned i = 0; i < num_fields; i++) {
+             fields[i] = *glsl_get_struct_field_data(type->type, i);
+             const struct glsl_type *field_nir_type =
+@@ -1023,20 +1023,25 @@ vtn_type_get_nir_type(struct vtn_builder *b, struct vtn_type *type,
+                need_new_struct = true;
+             }
+          }
++
++         const struct glsl_type *result;
+          if (need_new_struct) {
+             if (glsl_type_is_interface(type->type)) {
+-               return glsl_interface_type(fields, num_fields,
+-                                          /* packing */ 0, false,
+-                                          glsl_get_type_name(type->type));
++               result = glsl_interface_type(fields, num_fields,
++                                            /* packing */ 0, false,
++                                            glsl_get_type_name(type->type));
+             } else {
+-               return glsl_struct_type(fields, num_fields,
+-                                       glsl_get_type_name(type->type),
+-                                       glsl_struct_type_is_packed(type->type));
++               result = glsl_struct_type(fields, num_fields,
++                                         glsl_get_type_name(type->type),
++                                         glsl_struct_type_is_packed(type->type));
+             }
+          } else {
+             /* No changes, just pass it on */
+-            return type->type;
++            result = type->type;
+          }
++
++         STACK_ARRAY_FINISH(fields);
++         return result;
+       }
+ 
+       case vtn_base_type_image:
+@@ -1647,7 +1652,7 @@ vtn_handle_type(struct vtn_builder *b, SpvOp opcode,
+       val->type->offsets = vtn_alloc_array(b, unsigned, num_fields);
+       val->type->packed = false;
+ 
+-      NIR_VLA(struct glsl_struct_field, fields, count);
++      STACK_ARRAY(struct glsl_struct_field, fields, count);
+       for (unsigned i = 0; i < num_fields; i++) {
+          val->type->members[i] = vtn_get_type(b, w[i + 2]);
+          const char *name = NULL;
+@@ -1703,6 +1708,8 @@ vtn_handle_type(struct vtn_builder *b, SpvOp opcode,
+                                             name ? name : "struct",
+                                             val->type->packed);
+       }
++
++      STACK_ARRAY_FINISH(fields);
+       break;
+    }
+ 
diff --git a/meta/recipes-graphics/mesa/files/CVE-2026-40393-04.patch b/meta/recipes-graphics/mesa/files/CVE-2026-40393-04.patch
new file mode 100644
index 00000000000..71e959f0edf
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/CVE-2026-40393-04.patch
@@ -0,0 +1,54 @@
+From 45ce75f3bcd638dcf7daae09f9bf0b7c015b81c4 Mon Sep 17 00:00:00 2001
+From: Ian Romanick <ian.d.romanick@intel.com>
+Date: Fri, 23 Jan 2026 10:07:27 -0800
+Subject: [PATCH] nir: Use STACK_ARRAY instead of NIR_VLA
+
+The number of fields comes from the shader, so it could be a value large
+enough that using alloca would be problematic.
+
+Fixes: c11833ab24d ("nir,spirv: Rework function calls")
+Reviewed-by: Caio Oliveira <caio.oliveira@intel.com>
+Reviewed-by: Ryan Neph <ryanneph@google.com>
+Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
+(cherry picked from commit 9017d37e84771f921a63676dd8b955df9ef20f29)
+
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40092>
+
+CVE: CVE-2026-40393
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/45ce75f3bcd638dcf7daae09f9bf0b7c015b81c4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/compiler/nir/nir_functions.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/compiler/nir/nir_functions.c b/src/compiler/nir/nir_functions.c
+index 5d5f66293be..d4b3e652f1c 100644
+--- a/src/compiler/nir/nir_functions.c
++++ b/src/compiler/nir/nir_functions.c
+@@ -21,10 +21,10 @@
+  * IN THE SOFTWARE.
+  */
+ 
++#include "util/stack_array.h"
+ #include "nir.h"
+ #include "nir_builder.h"
+ #include "nir_control_flow.h"
+-#include "nir_vla.h"
+ 
+ /*
+  * TODO: write a proper inliner for GPUs.
+@@ -177,12 +177,13 @@ static bool inline_functions_pass(nir_builder *b,
+     * to an SSA value first.
+     */
+    const unsigned num_params = call->num_params;
+-   NIR_VLA(nir_def *, params, num_params);
++   STACK_ARRAY(nir_def *, params, num_params);
+    for (unsigned i = 0; i < num_params; i++) {
+       params[i] = call->params[i].ssa;
+    }
+ 
+    nir_inline_function_impl(b, call->callee->impl, params, NULL);
++   STACK_ARRAY_FINISH(params);
+    return true;
+ }
+ 
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index eb23a3f82c3..357d371a3d1 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,6 +20,10 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
            file://0001-c11-threads-fix-build-on-c23.patch \
+           file://CVE-2026-40393-01.patch \
+           file://CVE-2026-40393-02.patch \
+           file://CVE-2026-40393-03.patch \
+           file://CVE-2026-40393-04.patch \
 "
 
 SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"

