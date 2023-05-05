Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF221C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:21:04 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.30346.1683300055376312560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=yyHgCuQe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-64115e652eeso20487832b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300054; x=1685892054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOReEVHHtmagCLcd2xqolXw6VVWUTsdcHHhJkM0/eJM=;
        b=yyHgCuQe4S9Qc6o2EdP2MN+4lx6hVqxWts6hDF628XLRhygIpbIvBzCjJ/dPYQRNd4
         PbFKmvc98he8QzALr02yadorINLOmqaHoR+A2aje1bEPRJKaMMvD/vk2WhPmV8CMVYR6
         f0f6qcQjEa+jNIlL5lmlEZaCRwUPwR0wPZhvLo63bXZyXGCyqS+QDqwRhlGK607QSH9C
         3YNJzz//1cy17JcXdo+wMuwIFSZ6mmOLECTMksh548En1wFk4ITgGWBx2U83SLBBuQ3u
         7b3myhgnirKldGPA6fzD2FTiX7VpCmc1aTtIG3VnQa7J2+CKtPeCsRauIrM4/e1Y7uWe
         z7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300054; x=1685892054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOReEVHHtmagCLcd2xqolXw6VVWUTsdcHHhJkM0/eJM=;
        b=U/JrQw4iDVwhOf0mhKJ8bVz5Hjf8A4uOaJ9IYs76ltpq146ReSuIGgRwV2pOpE94H/
         AlD77/NK8NCnwXr/Pd2Ju/O//i7bud3vLVWSL5HPt3GR2KNjybPXtPc/JrvpBUGYgJ4U
         Z9qqQxmo3RpXNCutxJsr7WofbNiTTaC0SHJ3RBmUpAyxbV4Csa459Pz0KoE8yQNXNXH7
         XyviUskdIWypDuBCUuzB4ZWDewZusAGVg2/rABWzygQFTU7E2AKe8TI17xHb2vd2/1u0
         SUge/ErDqi7avLoUotOh7nttgwAhOYG+0n7/o5BF76VZg8wrEajmZMsz4WQgk1rfckh8
         ORaw==
X-Gm-Message-State: AC+VfDwwOMVMi8YWJsQ9b5sff/csw0FqZXx8qK8DDla8jWebVqO06hN3
	xBxUwqcqG3ZVr2rrN2DwkcX5ORdg/JrFGNpyWi0=
X-Google-Smtp-Source: ACHHUZ4k1UZcpJCNDgH4vfxpCZSJRn8B5aL1Pj854+tAW04QLH00qQZedEBybU4dVPsoFnFhbTIcOQ==
X-Received: by 2002:a05:6a00:3318:b0:63d:368c:97c2 with SMTP id cq24-20020a056a00331800b0063d368c97c2mr7339630pfb.8.1683300054382;
        Fri, 05 May 2023 08:20:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 25/35] mesa: upgrade 23.0.0 -> 23.0.2
Date: Fri,  5 May 2023 05:19:36 -1000
Message-Id: <66f67e43e25dc58a07a49bb8e12699f1a6ce06f4.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180945

From: Wang Mingyu <wangmy@fujitsu.com>

23.0.1 changes

New features
None

Bug fixes
radv: A Plague Tale: Requiem black “flash” on 7900XTX
7900 XTX: Graphical corruption / artifacts in Cyberpunk
radv: CmdCopyQueryPoolResults broken for VK_QUERY_TYPE_PRIMITIVES_GENERATED_EXT with queryCount > 1
radeonsi draws spurious values to depth buffer
rusticl over llvmpipe + ffmpeg’s Opencl filter = error -51
rusticl over llvmpipe + ffmpeg’s Opencl filter = error -51
OpenGL crashes in X-Plane 11
[Bisected] Regression: Project Zomboid renders black
hasvk: Black pixels with 8xMSAA and fast clears on Intel(R) HD Graphics 4400 (HSW GT2)
radv: GTA IV graphical artifacts on 7900XTX
radv: Resident Evil Revelations 2 artifacts on 7900XTX with DCC
radv: Prototype 2 black textures on RDNA 3 when DCC is enabled
Mesa 23.0.0 crashes immediately with indirect rendering
[RADV] Returnal - pistol muzzle flash fills whole screen (graphical artifact)
ACO: dEQP-VK.binding_model.descriptor_buffer.multiple.graphics_geom_buffers1_sets3_imm_samplers hangs on NAVI10
Build failures with recent lld
r600,regression: Glitches on terrain with the NIR backend on Transport Fever 2
r600/TURKS: Crash of the game “A Hat in Time” with Gallium Nine and NIR path (third report)
[gen9atom] Vulkan tests cause gpu hang: dEQP-VK.memory_model.*
GL_SHADER_BINARY_FORMAT_SPIR_V is not added to the list of GL_SHADER_BINARY_FORMATS even if GL_ARB_gl_spirv is supported.
[ANV/DG2] Vertex explosion in nvpro-samples/vk_raytracing_tutorial_KHR/ray_tracing_gltf
CUEtools FLACCL hit assert in rusticl
Assertion Failed on Intel HD 5500 with Linux / Mesa 22.3.1 / OpenGL

23.0.2 changes

New features
None

Bug fixes
allwinner a64: DRM_IOCTL_MODE_CREATE_DUMB failed: Cannot allocate memory after some time of apps usage
mesa: index buffer leaking
RadeonSI: null dereference in amdgpu_cs_add_buffer, potential refcount mismatch, running BeyondAllReason
eglCreateImageKHR, error: EGL_BAD_ALLOC (0x3003), message: “createImageFromDmaBufs failed” on AMD multi-gpu with explicit format modifiers
libgrl.a installed but not used?
radv: crash compiling UE5 lumen hardware RT shader
aco: unused vtmp_in_loop
radv,nir: dEQP-VK.ray_query.builtin.rayqueryterminate.* failures
glsl compiled error when the RHS of operator `>>` is int64_t by enabling GL_ARB_gpu_shader_int64 extension
QPainter fails to render multiple shapes with a brush set since Mesa 23.0
eglSwapBuffers blocks in wayland when it’s wl_surface_frame event is stolen.
plasmashell sometimes hangs with mesa_glthread
pps_device.h:23:11: error: ‘uint32_t’ does not name a type

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit f7f483f90ba17342a83fdfe7c7dccf5a3f7bf624)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mesa/{mesa-gl_23.0.0.bb => mesa-gl_23.0.2.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_23.0.0.bb => mesa_23.0.2.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_23.0.0.bb => mesa-gl_23.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.0.0.bb => mesa_23.0.2.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.0.0.bb b/meta/recipes-graphics/mesa/mesa-gl_23.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_23.0.0.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.0.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8f72f25c17..babd10a855 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,7 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[sha256sum] = "01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4bae904fe918707d253e4"
+SRC_URI[sha256sum] = "1b7d3399fc6f16f030361f925d33ebc7600cbf98094582f54775b6a1180529e7"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_23.0.0.bb b/meta/recipes-graphics/mesa/mesa_23.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.0.0.bb
rename to meta/recipes-graphics/mesa/mesa_23.0.2.bb
-- 
2.34.1


