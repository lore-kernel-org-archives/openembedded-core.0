Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4D6C6FD1A
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 09:11:23 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.29152.1678093877538486204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 01:11:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cBhn9TfM;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id k10so11604339edk.13
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 01:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678093875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glew41WDzydDVuqZTufyolFA3RDucG5JdUy/0rGVb/c=;
        b=cBhn9TfMtOfS0rC+oZEgX7czZHNNBWie0PuHdrVcNnopZ6efAuzEFpXLL5gMmcSEdV
         1+aV2iG985+3oaMeAu80kR8CtHcv9rqYVD/OUh7pSSyMF0ugkbCscCegJsgUjXZlPrEu
         qW7wV0NIDuojSBJFnEE4H0bkhOKjF/QPZfv3Za1C/IgjIrI/CLcv2eRkVrwJSQtGtlGd
         xzoeZ8011cxN920iifU7db1CeBQNiQPe3y/mujmsbeqkb2K1ngNGfXiWTwf5ehTVK5J5
         wBMg1jeQvliQ9sfqDlQlpIxLV08ESwHxyMDTcmUf3C+GRQLUq9vU9KuAyVsrVwqhdT0W
         kLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678093875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glew41WDzydDVuqZTufyolFA3RDucG5JdUy/0rGVb/c=;
        b=IdxD+0Cx0/4/PMEJya4VD/6/GhkUOrGJphOjKsObashGXS9HO9WUInlhF04+Xb2Q6x
         0sjFF9Vj2H2wrWzgkVKac+P+ff3J76Xtm1QLoTAaT1HaQ8gxn7ZPB//s4YnsOeD1/u3Q
         884vJOS74Lpeyeh+7m1TNjMdHn/GduEpF17pZ1HFJZ287mZxQjxE4bWLzdxMU/GpV2Eq
         KqyQ3tM3aLdT0UD+KMmBdig5I92SHox7cgaCGbthD8eQA3anWO9AVOdwBVmgS6SLB+T5
         kca0udKqd8OFWtoQQ+cusyj+pdnShtNJqF+nv5Q1BEFWkm6v+QdOmoIUJTxYw6H0jekh
         ESgw==
X-Gm-Message-State: AO0yUKX/TJvYSZJdv+OO4A/nwZ+ugfynXeOBEm5rLwlvL/Q4/Q0MZTgh
	LA4fwapvSeDOVHTUFKGGXKDgWctpNvB8Fw==
X-Google-Smtp-Source: AK7set/3wkFa6iT1m46TR5dRaN6/2AaLDvK8nSeYrUPGAzONoniN9ZXDgzdhkYKFX+0HBaCdyzk+UQ==
X-Received: by 2002:a17:906:3b92:b0:8d6:ed70:991b with SMTP id u18-20020a1709063b9200b008d6ed70991bmr13573202ejf.15.1678093875486;
        Mon, 06 Mar 2023 01:11:15 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id q2-20020a50cc82000000b004acbda55f6bsm4760953edi.27.2023.03.06.01.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 01:11:15 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Ross Burton <Ross.Burton@arm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alex Kiernan <alex.kiernan@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 1/3] mesa, mesa-gl: 23.0.0
Date: Mon,  6 Mar 2023 10:11:06 +0100
Message-Id: <20230306091108.3347363-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306091108.3347363-1-zboszor@gmail.com>
References: <17474798FA156F5A.18951@lists.openembedded.org>
 <20230306091108.3347363-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 09:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178061

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...-backend-fix-gbm-compile-without-dri.patch | 65 -------------------
 ...ormat-Check-for-NEON-before-using-it.patch | 16 ++---
 .../{mesa-gl_22.3.5.bb => mesa-gl_23.0.0.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  3 +-
 .../mesa/{mesa_22.3.5.bb => mesa_23.0.0.bb}   |  0
 5 files changed, 9 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-without-dri.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_22.3.5.bb => mesa-gl_23.0.0.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.3.5.bb => mesa_23.0.0.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-without-dri.patch b/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-without-dri.patch
deleted file mode 100644
index 6541671b7a..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-without-dri.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 25946100e21cf2095bea334e8d7096798561d0b7 Mon Sep 17 00:00:00 2001
-From: Vincent Davis Jr <vince@underview.tech>
-Date: Wed, 28 Dec 2022 16:28:01 -0600
-Subject: [PATCH] gbm/backend: fix gbm compile without dri
-
-Upstream-Status: Backport
-
-https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20447
-https://gitlab.freedesktop.org/mesa/mesa/-/commit/842ca284650f066e58706741a7d22d67b5088e60
-
-At mesa version 22.2.3 patch wasn't introduced until after.
-
-Commit introduces a fix that allows for gbm to be built with an empty
-backend. There are situation especially in a Yocto/OE cross compilation
-environment where you want to build with an empty backend. The particular
-situation is as such:
-
-The mesa-gl recipe is the preferred provider for virtual/libgbm, virtual/libgl,
-virtual/mesa, etc... But the x11 DISTRO_FEATURE in't included this leads to build
-errors such as:
-
-| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: in function `find_backend':
-| backend.c:(.text.find_backend+0xa4): undefined reference to `gbm_dri_backend'
-| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(.data.rel.ro.builtin_backends+0x4):
-                undefined reference to `gbm_dri_backend'
-| collect2: error: ld returned 1 exit status
-
-Issue should be replicable by setting -Ddri3=disabled and -Dgbm=enabled
-
-Add fix to bypasses compilation issue by excluding gbm dri backend. If
-HAVE_DRI || HAVE_DRIX not specified.
-
-Acked-by: David Heidelberg <david.heidelberg@collabora.com>
-Signed-off-by: Vincent Davis Jr <vince@underview.tech>
----
- src/gbm/main/backend.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/gbm/main/backend.c b/src/gbm/main/backend.c
-index 974d0a76a4e..feee0703495 100644
---- a/src/gbm/main/backend.c
-+++ b/src/gbm/main/backend.c
-@@ -42,7 +42,9 @@
- #define ARRAY_SIZE(a) (sizeof(a)/sizeof((a)[0]))
- #define VER_MIN(a, b) ((a) < (b) ? (a) : (b))
- 
-+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
- extern const struct gbm_backend gbm_dri_backend;
-+#endif
- 
- struct gbm_backend_desc {
-    const char *name;
-@@ -51,7 +53,9 @@ struct gbm_backend_desc {
- };
- 
- static const struct gbm_backend_desc builtin_backends[] = {
-+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
-    { "dri", &gbm_dri_backend },
-+#endif
- };
- 
- #define BACKEND_LIB_SUFFIX "_gbm"
--- 
-2.34.1
-
diff --git a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch b/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
index d22ff3c8a8..0bbd518047 100644
--- a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
+++ b/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
@@ -23,12 +23,12 @@ diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c
 index c071250..0880984 100644
 --- a/src/util/format/u_format.c
 +++ b/src/util/format/u_format.c
-@@ -1184,7 +1184,7 @@ static void
+@@ -1187,7 +1187,7 @@
  util_format_unpack_table_init(void)
  {
     for (enum pipe_format format = PIPE_FORMAT_NONE; format < PIPE_FORMAT_COUNT; format++) {
--#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
-+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PIPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
+-#if (DETECT_ARCH_AARCH64 || DETECT_ARCH_ARM) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
++#if (DETECT_ARCH_AARCH64 || (DETECT_ARCH_ARM && defined(__ARM_NEON))) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
        const struct util_format_unpack_description *unpack = util_format_unpack_description_neon(format);
        if (unpack) {
           util_format_unpack_table[format] = unpack;
@@ -36,12 +36,12 @@ diff --git a/src/util/format/u_format_unpack_neon.c b/src/util/format/u_format_u
 index a4a5cb1..1e4f794 100644
 --- a/src/util/format/u_format_unpack_neon.c
 +++ b/src/util/format/u_format_unpack_neon.c
-@@ -23,7 +23,7 @@
+@@ -24,7 +24,7 @@
+ #include "util/detect_arch.h"
+ #include "util/format/u_format.h"
  
- #include <u_format.h>
- 
--#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
-+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PIPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
+-#if (DETECT_ARCH_AARCH64 || DETECT_ARCH_ARM) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
++#if (DETECT_ARCH_AARCH64 || (DETECT_ARCH_ARM && defined(__ARM_NEON))) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
  
  /* armhf builds default to vfp, not neon, and refuses to compile neon intrinsics
   * unless you tell it "no really".
diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.3.5.bb b/meta/recipes-graphics/mesa/mesa-gl_23.0.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.3.5.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.0.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8a8a057c6b..bbe8ca7875 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,10 +18,9 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
-           file://0001-gbm-backend-fix-gbm-compile-without-dri.patch \
            "
 
-SRC_URI[sha256sum] = "3eed2ecae2bc674494566faab9fcc9beb21cd804c7ba2b59a1694f3d7236e6a9"
+SRC_URI[sha256sum] = "01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4bae904fe918707d253e4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_22.3.5.bb b/meta/recipes-graphics/mesa/mesa_23.0.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.3.5.bb
rename to meta/recipes-graphics/mesa/mesa_23.0.0.bb
-- 
2.39.2


