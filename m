Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D05EC47073
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 19:14:57 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.190720.1703963689721713631
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Dec 2023 11:14:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QwuxLQAt;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ccc5fca3f6so50204041fa.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 11:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703963688; x=1704568488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKJoxtaOZYwqoJcEO5ATul6jLI5VhX+I5p1jJcZehu4=;
        b=QwuxLQAtY3leo4zHj5iW7d05cSiAXY73UCRYHI7H5bgZdbVbbfU+aN+zeMc25nwHgW
         +ss648ci19MqXBBdO8w7Rj45ocdOCg2kni9ydOqgZPnxGJ/GrIQVH98QFoJEpbXCIQBS
         kM/oUJPWSjinwhFFoa7MU3NhSZUkC9Xa8hUiODCrtzte2QxJX+9Et1NJYblkHQg2ljfD
         SEdgiW2ITc9DlJueO/rstsOkE4FYicBgaybcSmcrtm+ByeH+DUGo/zfL/lhrgKeypvWR
         qWB7j4hY3BfX/G1Ijd+yKHmX+BUgywu8bUN7Aj9SRyR51OWClriWIXv7RXAAxVpSBxc1
         Jupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703963688; x=1704568488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKJoxtaOZYwqoJcEO5ATul6jLI5VhX+I5p1jJcZehu4=;
        b=NWtORjoA0JJMLQeMnqgVvo0FtY/A18CFPeQ/aGLLjDwNKh0yP1nwzs1yqLKvUvX0pj
         gMFFFf2aRzz4ttxHzbsIJoKZGKFSORLiSmHUAuFnTO6NxU+lk8i+4hf4YHAn0vsXtmzz
         Cy438/4l33SxxNapS55BiKN2F/nL3XrELeUp5gEIq/m0FUn7nN3chZl4xLtiZ8neO5e4
         Q3KQXabZ5DLPgYK4G3LOf2Gj9WPE9EnJRk2Mh+8f/D94gdEFYuOWo8cq7BLHe9xZhtii
         jAZlQjzV7y9Rfce8HeZzgcKnEB7U0/UAgSOwHYbegN5Ll7dqFP4zw5SC7YIyGbEUu6cw
         LFig==
X-Gm-Message-State: AOJu0YwSAGCTy+Wfe/P2vBRYHX4Y68NZRsh06NpiK+YpZEJg4j5/zEDz
	2wmZUTB8oAJoyJsowAbLqYJrM5Hu0+4ViuRa3jZ866Jo5kqxcQ==
X-Google-Smtp-Source: AGHT+IEpqmUydTN4BBhQ92KALmlrWgJ4scvOotDXkbzmvab2HOi5THNcAv5MMvip8+FKqO58vDFdvA==
X-Received: by 2002:a2e:8e8f:0:b0:2cc:eae4:8064 with SMTP id z15-20020a2e8e8f000000b002cceae48064mr1838433ljk.47.1703963687678;
        Sat, 30 Dec 2023 11:14:47 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z4-20020a2ebcc4000000b002ccd60a6fd4sm1948165ljp.32.2023.12.30.11.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 11:14:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v5 3/3] mesa: fix building of RustiCL + nouveau
Date: Sat, 30 Dec 2023 21:14:44 +0200
Message-Id: <20231230191444.1204808-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
References: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 19:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193082

Incorporate a patch by Karol Herbst, fixing nouveau / libgalliumvl
dependency.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-graphics/mesa/files/26680.patch | 236 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc          |   1 +
 2 files changed, 237 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/26680.patch

diff --git a/meta/recipes-graphics/mesa/files/26680.patch b/meta/recipes-graphics/mesa/files/26680.patch
new file mode 100644
index 000000000000..a42b7667edee
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/26680.patch
@@ -0,0 +1,236 @@
+From daf4935359cb3c88606536924e346ead5e4b2137 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Thu, 14 Dec 2023 03:19:34 +0100
+Subject: [PATCH 1/7] gallium/vl: stub vl_video_buffer_create_as_resource
+
+It's used by radeonsi
+
+Signed-off-by: Karol Herbst <kherbst@redhat.com>
+Upstream-Status: Pending [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26680]
+---
+ src/gallium/auxiliary/vl/vl_stubs.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/gallium/auxiliary/vl/vl_stubs.c b/src/gallium/auxiliary/vl/vl_stubs.c
+index 194e7a8700b6b..89e5f28128909 100644
+--- a/src/gallium/auxiliary/vl/vl_stubs.c
++++ b/src/gallium/auxiliary/vl/vl_stubs.c
+@@ -146,6 +146,16 @@ vl_create_mpeg12_decoder(struct pipe_context *pipe,
+    return NULL;
+ }
+ 
++struct pipe_video_buffer *
++vl_video_buffer_create_as_resource(struct pipe_context *pipe,
++                                   const struct pipe_video_buffer *tmpl,
++                                   const uint64_t *modifiers,
++                                   int modifiers_count)
++{
++   assert(0);
++   return NULL;
++}
++
+ /*
+  * vl_zscan
+  */
+-- 
+GitLab
+
+
+From 5dd1598b5ac988d3ef53adc9dcb1f2bc1788513c Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Sat, 30 Dec 2023 20:00:33 +0100
+Subject: [PATCH 2/7] gallium/vl: remove stubs which are already defined in
+ mesa_util
+
+---
+ src/gallium/auxiliary/vl/vl_stubs.c | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/src/gallium/auxiliary/vl/vl_stubs.c b/src/gallium/auxiliary/vl/vl_stubs.c
+index 89e5f28128909..fcdbd9850428b 100644
+--- a/src/gallium/auxiliary/vl/vl_stubs.c
++++ b/src/gallium/auxiliary/vl/vl_stubs.c
+@@ -155,9 +155,3 @@ vl_video_buffer_create_as_resource(struct pipe_context *pipe,
+    assert(0);
+    return NULL;
+ }
+-
+-/*
+- * vl_zscan
+- */
+-const int vl_zscan_normal[] = {0};
+-const int vl_zscan_alternate[] = {0};
+-- 
+GitLab
+
+
+From 6df28bce29d34da949f84739f52a5eff7fb01b80 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Thu, 14 Dec 2023 03:20:08 +0100
+Subject: [PATCH 3/7] rusticl: link against libgalliumvl_stub
+
+---
+ src/gallium/targets/rusticl/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/gallium/targets/rusticl/meson.build b/src/gallium/targets/rusticl/meson.build
+index b2963fe6dfa76..e1acaca7e68e3 100644
+--- a/src/gallium/targets/rusticl/meson.build
++++ b/src/gallium/targets/rusticl/meson.build
+@@ -42,6 +42,7 @@ librusticl = shared_library(
+   ],
+   link_whole : librusticl,
+   link_with : [
++    libgalliumvl_stub,
+     libpipe_loader_static,
+     libswdri,
+     libswkmsdri,
+-- 
+GitLab
+
+
+From b158c041e2b89c73fd16be945286efa7dcf9b75f Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Thu, 14 Dec 2023 03:28:48 +0100
+Subject: [PATCH 4/7] frontend/nine: link against libgalliumvl_stub
+
+---
+ src/gallium/targets/d3dadapter9/meson.build | 9 +--------
+ 1 file changed, 1 insertion(+), 8 deletions(-)
+
+diff --git a/src/gallium/targets/d3dadapter9/meson.build b/src/gallium/targets/d3dadapter9/meson.build
+index 282859fd93266..c6f1a0dc2a287 100644
+--- a/src/gallium/targets/d3dadapter9/meson.build
++++ b/src/gallium/targets/d3dadapter9/meson.build
+@@ -27,7 +27,7 @@ gallium_nine_c_args = []
+ gallium_nine_ld_args = []
+ gallium_nine_link_depends = []
+ gallium_nine_link_with = [
+-    libgallium, libnine_st,
++    libgallium, libgalliumvl_stub, libnine_st,
+     libpipe_loader_static, libws_null, libwsw, libswdri,
+     libswkmsdri,
+ ]
+@@ -37,13 +37,6 @@ if with_ld_version_script
+   gallium_nine_link_depends += files('d3dadapter9.sym')
+ endif
+ 
+-if (with_gallium_va or with_gallium_vdpau or with_gallium_omx != 'disabled' or
+-    with_dri)
+-  gallium_nine_link_with += libgalliumvl
+-else
+-  gallium_nine_link_with += libgalliumvl_stub
+-endif
+-
+ libgallium_nine = shared_library(
+   'd3dadapter9',
+   files('description.c', 'getproc.c', 'drm.c'),
+-- 
+GitLab
+
+
+From 9d3192871d5038f73317fd2770118dc0ba08e6d4 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Thu, 14 Dec 2023 03:29:14 +0100
+Subject: [PATCH 5/7] dri: link against libgalliumvl_stub
+
+---
+ src/gallium/targets/dri/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gallium/targets/dri/meson.build b/src/gallium/targets/dri/meson.build
+index 83925248b17e6..e50581dc121e6 100644
+--- a/src/gallium/targets/dri/meson.build
++++ b/src/gallium/targets/dri/meson.build
+@@ -50,7 +50,7 @@ libgallium_dri = shared_library(
+   link_args : [ld_args_build_id, ld_args_gc_sections, gallium_dri_ld_args],
+   link_depends : gallium_dri_link_depends,
+   link_with : [
+-    libdri, libmesa, libgalliumvl,
++    libdri, libmesa, libgalliumvl_stub,
+     libgallium, libglapi, libpipe_loader_static, libws_null, libwsw, libswdri,
+     libswkmsdri,
+   ],
+-- 
+GitLab
+
+
+From 2039ab261c5fc7f41139514e969ac83e17731cbf Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Thu, 14 Dec 2023 03:29:20 +0100
+Subject: [PATCH 6/7] wgl: link against libgalliumvl_stub
+
+---
+ src/gallium/targets/wgl/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gallium/targets/wgl/meson.build b/src/gallium/targets/wgl/meson.build
+index eaca0aec86b50..6ec171b741a0d 100644
+--- a/src/gallium/targets/wgl/meson.build
++++ b/src/gallium/targets/wgl/meson.build
+@@ -38,7 +38,7 @@ libgallium_wgl = shared_library(
+   ],
+   link_whole : [libwgl],
+   link_with : [
+-    libgallium, libglsl, libmesa, libwsgdi, libglapi_static, libglapi, libgalliumvl
++    libgallium, libglsl, libmesa, libwsgdi, libglapi_static, libglapi, libgalliumvl_stub,
+   ],
+   dependencies : [
+     dep_ws2_32, idep_nir, idep_mesautil, driver_swrast,
+-- 
+GitLab
+
+
+From dac47334c7ae336854991ffb4f564b007abd8585 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Thu, 14 Dec 2023 03:20:25 +0100
+Subject: [PATCH 7/7] gallium/drivers: do not link against libgalliumvl
+ directly
+
+libgalliumvl_stub was added so not all frontends have to link in full
+video accleration support, shaving off around 100kB of binary size.
+---
+ src/gallium/drivers/d3d12/meson.build    | 2 +-
+ src/gallium/drivers/r600/meson.build     | 1 -
+ src/gallium/drivers/radeonsi/meson.build | 2 +-
+ 3 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/src/gallium/drivers/d3d12/meson.build b/src/gallium/drivers/d3d12/meson.build
+index aba1f3da056f8..c12e8f35267a1 100644
+--- a/src/gallium/drivers/d3d12/meson.build
++++ b/src/gallium/drivers/d3d12/meson.build
+@@ -133,5 +133,5 @@ libd3d12 = static_library(
+ 
+ driver_d3d12 = declare_dependency(
+   compile_args : '-DGALLIUM_D3D12',
+-  link_with : [libd3d12, libgalliumvl],
++  link_with : [libd3d12],
+ )
+diff --git a/src/gallium/drivers/r600/meson.build b/src/gallium/drivers/r600/meson.build
+index 023719a3a16f2..974b59d4594b9 100644
+--- a/src/gallium/drivers/r600/meson.build
++++ b/src/gallium/drivers/r600/meson.build
+@@ -185,7 +185,6 @@ libr600 = static_library(
+     inc_src, inc_mapi, inc_mesa, inc_include, inc_gallium, inc_gallium_aux, inc_amd_common,
+     inc_gallium_drivers,
+   ],
+-  link_with : [ libgalliumvl ],
+   dependencies: [dep_libdrm_radeon, dep_elf, dep_llvm, idep_nir, idep_nir_headers],
+ )
+ 
+diff --git a/src/gallium/drivers/radeonsi/meson.build b/src/gallium/drivers/radeonsi/meson.build
+index 29afa87c0b654..c89c417b02c08 100644
+--- a/src/gallium/drivers/radeonsi/meson.build
++++ b/src/gallium/drivers/radeonsi/meson.build
+@@ -168,7 +168,7 @@ libradeonsi = static_library(
+ driver_radeonsi = declare_dependency(
+   compile_args : '-DGALLIUM_RADEONSI',
+   link_with : radeonsi_gfx_libs + [
+-    libradeonsi, libradeonwinsys, libamdgpuwinsys, libamd_common, libamd_common_llvm, libgalliumvl
++    libradeonsi, libradeonwinsys, libamdgpuwinsys, libamd_common, libamd_common_llvm
+   ],
+   dependencies : idep_nir,
+ )
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a192562a7935..7cebe45fa2bc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,6 +18,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
+           file://26680.patch \
 "
 
 SRC_URI[sha256sum] = "6e48126d70fdb3f20ffeb246ca0c2e41ffdc835f0663a03d4526b8bf5db41de6"
-- 
2.39.2


