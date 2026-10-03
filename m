Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A47CA5FEC
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 14:32:16 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6704.1791037926674397066
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 07:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=f0IdNlCs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202610031432023f747213a300020706-adqgdg@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202610031432023f747213a300020706
        for <openembedded-core@lists.openembedded.org>;
        Sat, 03 Oct 2026 16:32:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=hAm46+xvfKcXJhTYm95oNmZ2I6nNLU2Lpg8O0OkVP9Q=;
 b=f0IdNlCsm/yMZvoVIfJGBWE3OJnCvi6Rgqjhr2u/r3Q7OhwJZ82IcJGxBwSjnXN1OfAhZU
 REoqKWC4QsKW1L3A/BIR5J2YyYtVR76g4d9hQR1LUANfgmL2xPWfBHSRsxR+NmukEbwPzC8T
 VMkctXTNQ1JufQDWi08mixTdBURcphRyJsMQwRF/CWexppm8J+MzcPfPrlQUP//x+QzZGdVD
 4YgOi6Oy0o2MgnWQ8uyu8mXtJXevBtgWTJa44smwVbgf0ousbd/EbDPJhqgp5Vdwh/LKPjXl
 q9L8Ekab1PN9sms4S4k3KW/qi3BTcXbEPjMNLmc5t7lTA8ghpyIGFo3w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] mesa: patch CVE-2026-40393
Date: Sat,  3 Oct 2026 16:31:47 +0200
Message-ID: <20261003143148.333985-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 14:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247159

From: Peter Marko <peter.marko@siemens.com>

Pick patches per [1].

Also pick two patches preparing the used helper functions.
Drop changes in .pick_status.json not affting our builds.
Resolve minor conflicts.

[1] https://security-tracker.debian.org/tracker/CVE-2026-40393

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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

