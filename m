Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA56BE98FA2
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 06:42:42 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150631.1775803355206626522
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 23:42:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MxXK5DXt;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfb723793so1098016f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775803354; x=1776408154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXRkOvNpf4GFYUmtVwYxxzPPnzZiJ1vtvsad8hSs1oQ=;
        b=MxXK5DXtJizs47cwP+tDsCMv/qTcW44fZ26IH8Ek7YbP5lvEKhJ0dzoyZAhxbjrXTx
         /brlC2E+9yPK2RnVCFDCMvyNWKAYQ0quhqVkr6KFz6Db8Yq5pMst8ZI0XMZ5WFigYtUJ
         oHFJ+K6eKeQrNtEUVloO8wu90qJOuR6I79vyBSRKgwQ26pBgfbZetfT/4TobgF3flU5w
         H5Mg9oyHeMYljBnSrfoIvgaXGDHUHQK8cNbVtxZ3xFMc7bWx6ilwbZC8JXlkdfz9s1jx
         3AiWTuu6aItPWbhT0tPK6NkXqmTiDs2+EQQ749RUoY0EKv8e7IxyEypuEAva0Om7VqUr
         A7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775803354; x=1776408154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cXRkOvNpf4GFYUmtVwYxxzPPnzZiJ1vtvsad8hSs1oQ=;
        b=S9l1s7dgUxfUkLn0MrMneVGYAUJoAwk9oysI1YXeLiAKPaoBQfQIG7flWqBWRn00Yf
         2fsBZJqG/Y7bOuVaCtbBoo2lbqKAVgkg0uCRFjVlnYLskZTZa4AxLXELMd/NL8Dhg9Ei
         0vlA+SUXaGga2WwuOKWv7MChFi7DBiYZSVEbwX+hMSz8Xar1/Wkvq+VtrLsxsZRnfk7v
         y0wssdp2F61T22nqSEFqHASnlK/PKFGiA1qJxfb+RQMkpyzhepCJVtkWZeUQDODFnxFv
         hmChz3UOEUTP0wxVwbLdWyqNrh4xZsCc12mzQ0fuQ+xE36tYNnCzKssC/6/4tcLfLEea
         +hOw==
X-Gm-Message-State: AOJu0YwFnEMwls13zntqFbIBJQ72A5ekhRc/gzKzWVLXbkSvyM7F0gue
	zEcaqdxsX++2U7RAXVkOtHq0Hm4GvUMS9dLK4x0geODzu+qv44J3aI5KXWX49Q==
X-Gm-Gg: AeBDietZhlCkZQ0ES1PHSBiHZQXmD+q04GWMeKawes0JXEhsAXsUF34ilks23k0TFxm
	OYkNbjiPq0/zSWC16o7uXbO0ml3ARyj5vZtQSWQnolZ365w2RB5IVahsIzd04GL3oQ2EDYEOEE9
	dsNlraoL/U367O6Bq0oJHByZXBdjsCRY4QeunFafCKt6+R+tEE0Oz/B379DmURC6K6b1jGoqGE8
	dkoi7xq62pK1cHedbkEKNbbUUlwayOJmV73sVmN96BAG3VO6snjjWG7aN35Upa95jNVyZYAKNlu
	SHIggnCzylvtTkDTxy460Ss5g7pAV/AcoDxEG7tda7ikPK83/nMiKAcvdJ5Re/ZTElCLJgl1dm9
	sPDHRCfyQ4a7FbfAzQCKKW7DN2wHanmHdoxN9Oxdo32W20i7Fg+dGbn04k903UBDTd7nA6vB/Wh
	D3mcdCyOrn506pgOppo/aEeiWdxcHizr5f5x5+uo0wZjSas4Vh9SbxA0pvv/IH47wypFREy7ZUo
	RnNau4XYg==
X-Received: by 2002:a05:6000:4284:b0:439:d242:e8fe with SMTP id ffacd0b85a97d-43d64289c7emr2587841f8f.11.1775803353486;
        Thu, 09 Apr 2026 23:42:33 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e46881sm5330595f8f.23.2026.04.09.23.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 23:42:33 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 2/2] virglrenderer: Fix build with glibc 2.43+
Date: Fri, 10 Apr 2026 08:42:27 +0200
Message-ID: <20260410064227.1596281-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410064227.1596281-1-martin.jansa@gmail.com>
References: <20260410064227.1596281-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 06:42:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234993

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...once_flag-ONCE_FLAG_INIT-when-presen.patch | 55 +++++++++++++++++++
 .../virglrenderer/virglrenderer_1.0.1.bb      |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
new file mode 100644
index 0000000000..1740d7605f
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
@@ -0,0 +1,55 @@
+From 179e744f7577d98df7c79d7324c22acfb32a0154 Mon Sep 17 00:00:00 2001
+From: Dave Airlie <airlied@redhat.com>
+Date: Fri, 7 Nov 2025 13:14:56 +1000
+Subject: [PATCH] c11/threads: fix build on c23
+
+C23/glibc is now including once_init in stdlib.h
+
+https://patchwork.sourceware.org/project/glibc/patch/78061085-f04a-0c45-107b-5a8a15521083@redhat.com/#213088
+
+Just fix up our use of it.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1567]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mesa/compat/c11/impl/threads_posix.c | 3 ++-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+--- a/src/mesa/compat/c11/threads_posix.h
++++ b/src/mesa/compat/c11/threads_posix.h
+@@ -51,7 +51,9 @@ Configuration macro:
+ #include <pthread.h>
+
+ /*---------------------------- macros ----------------------------*/
++#ifndef __once_flag_defined
+ #define ONCE_FLAG_INIT PTHREAD_ONCE_INIT
++#endif
+ #ifdef INIT_ONCE_STATIC_INIT
+ #define TSS_DTOR_ITERATIONS PTHREAD_DESTRUCTOR_ITERATIONS
+ #else
+@@ -66,8 +68,9 @@ typedef pthread_cond_t  cnd_t;
+ typedef pthread_t       thrd_t;
+ typedef pthread_key_t   tss_t;
+ typedef pthread_mutex_t mtx_t;
++#ifndef __once_flag_defined
+ typedef pthread_once_t  once_flag;
+-
++#endif
+
+ /*
+ Implementation limits:
+@@ -90,12 +93,13 @@ impl_thrd_routine(void *p)
+
+ /*--------------- 7.25.2 Initialization functions ---------------*/
+ // 7.25.2.1
++#ifndef __once_flag_defined
+ static inline void
+ call_once(once_flag *flag, void (*func)(void))
+ {
+     pthread_once(flag, func);
+ }
+-
++#endif
+
+ /*------------- 7.25.3 Condition variable functions -------------*/
+ // 7.25.3.1
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
index 87f25a3461..a6145c15f6 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
@@ -13,6 +13,7 @@ SRCREV = "690680e5f0f952e22424fca1538c1b24457a0868"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            file://0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch \
+           file://0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch \
            "
 
 S = "${WORKDIR}/git"

