Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748E0FF884A
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:02 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32585.1777064214910721876
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dZ3g5kmb;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488b0046078so74970595e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064213; x=1777669013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dZxuKNIF9OjfCPgFvZFUTmJOkl7uhIEw/mjDjCckxE=;
        b=dZ3g5kmbGS9VmZ0YNyh0pHgRSjBfELGPr1ugyOHAtNj5xnMN8Xz6QduWcGAS55UtVL
         MG5JvXhCLgieCYNzN3kzHuAqq2tlySVeI+Z2dUDAJRGNGGCMQsDvEAaNU8Q4cKGcw2I9
         nnvURoy003gsJiEn/fbfefdvs0NM6sCPiMaGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064213; x=1777669013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1dZxuKNIF9OjfCPgFvZFUTmJOkl7uhIEw/mjDjCckxE=;
        b=VeJUAEGS4x/GyN2aMvS5AcsyrsFRCsOw+6ndVHrLzdwmiu2/8YG/VRtxZF2l7YLoDi
         W5sOZ/KGA7bMYbJG6KOTxcLE7TufuDav9/gYzMGJ58hbH4ec+G6/rqu16GWv8N0+gKJV
         FoI3O3HjsTi2rnRqWZV1SSEgSkUMpWZykfVumO5xS3Lca8uN7TGVBzJQag7pwceoKYBr
         zU5YuvWhhFLmTcsWRarLZrhSq689S1ErjRdU+7L/q0gFkFfDquSt5nBFOvXBHxIYgdyT
         lGgGiOTy3fRD8GDJkLsZR11VLNiqbyitEYHsIw6mlUSDenDNhjpSKbOTfr6Kp/9Ahkne
         WtZw==
X-Gm-Message-State: AOJu0Yyc12Jo6CeZRLipoqjDERQWPv9ovDZlnb4kGZhJk+g9qyUsBCF5
	4rxq+TuQ+sv1Zo62iv9AVJuOyPHshtGd8OvXmqw+c/rI4ZbawuCYxwqr4FDwd79/Xe1vP4+IO+g
	RFHEGYwslQZKD
X-Gm-Gg: AeBDievcaiWFLQsbP1UWGQuA3k7abF3nTKrxT9KGW96XmDf/4kAV0gLAK2qBDEMdASJ
	UYfYGyd6f4rEd59WvRirFYmBOUUxHvxAVR3UWb0+6PbC8j13gGbUGGvRXuAC4ho+NtrUfEsfBck
	Zpu4dkbm/cyLfDu+0jFXVsBW12I0mdolpMJcrXQOGA8RK9vbIHA0w4Vv1By0SdFpLfRpU0pByoM
	MKKNG4KBUEMFLvMOWKLnNpbtGH9mt751nLlPuRgeykyZVeG2HUD4i/JA3g5QRhryOyhab94BN9D
	bZk+l9jbqZK4EsJp08YyH0DlCu4xEpLAmotofdQ5XLSnfo/9jGGnASwOvLYEPN/q95tbbvYnrkg
	Le9XA3OlF/v7Hu/MI2P13F5Qif0kDV7GLHqKblz5ViOZJRg3mHs5VAsMpZCxDkcIYmBTGyQ8zan
	qlCICkjOx03t7XhljDooN2MO2tBKpal5wv+qTs7/Tu7Zb6ZJBblYtOEPdLRTPljXggWeLjsQmkH
	+Mvnxt2nAjY8/C/7Y8kB/uIFX0x0sFe0FPGH6b4nGHSl/Yq
X-Received: by 2002:a05:600c:b90:b0:488:b99b:4177 with SMTP id 5b1f17b1804b1-488fb78ee4emr463744785e9.25.1777064212997;
        Fri, 24 Apr 2026 13:56:52 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 28/66] mesa: fix build on host with glibc-2.43
Date: Fri, 24 Apr 2026 22:55:27 +0200
Message-ID: <ee8ff68e508e7e57a999a4008c8eeaa8e2d4563f.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235901

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0001-c11-threads-fix-build-on-c23.patch   | 56 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-c11-threads-fix-build-on-c23.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-c11-threads-fix-build-on-c23.patch b/meta/recipes-graphics/mesa/files/0001-c11-threads-fix-build-on-c23.patch
new file mode 100644
index 00000000000..f4de5e61a9b
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-c11-threads-fix-build-on-c23.patch
@@ -0,0 +1,56 @@
+From 3f007af78283aea2e8c1a3addff7aeae862d8b28 Mon Sep 17 00:00:00 2001
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
+Cc: mesa-stable
+Reviewed-by: Yonggang Luo <luoyonggang@gmail.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38298>
+
+Upstream-Status: Backport [v26.0.0 179e744f7577d98df7c79d7324c22acfb32a0154]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ src/c11/impl/threads_posix.c | 3 ++-
+ src/c11/threads.h            | 2 ++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/c11/impl/threads_posix.c b/src/c11/impl/threads_posix.c
+index 2540e3e0c49..f75774fc51d 100644
+--- a/src/c11/impl/threads_posix.c
++++ b/src/c11/impl/threads_posix.c
+@@ -70,12 +70,13 @@ impl_thrd_routine(void *p)
+ 
+ /*--------------- 7.25.2 Initialization functions ---------------*/
+ // 7.25.2.1
++#ifndef __once_flag_defined
+ void
+ call_once(once_flag *flag, void (*func)(void))
+ {
+     pthread_once(flag, func);
+ }
+-
++#endif
+ 
+ /*------------- 7.25.3 Condition variable functions -------------*/
+ // 7.25.3.1
+diff --git a/src/c11/threads.h b/src/c11/threads.h
+index dbcb3459a9b..c849f385e30 100644
+--- a/src/c11/threads.h
++++ b/src/c11/threads.h
+@@ -118,8 +118,10 @@ typedef pthread_cond_t  cnd_t;
+ typedef pthread_t       thrd_t;
+ typedef pthread_key_t   tss_t;
+ typedef pthread_mutex_t mtx_t;
++#ifndef __once_flag_defined
+ typedef pthread_once_t  once_flag;
+ #  define ONCE_FLAG_INIT PTHREAD_ONCE_INIT
++#endif
+ #  ifdef PTHREAD_DESTRUCTOR_ITERATIONS
+ #    define TSS_DTOR_ITERATIONS PTHREAD_DESTRUCTOR_ITERATIONS
+ #  else
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9157fe9c3f2..eb23a3f82c3 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-drisw-fix-build-without-dri3.patch \
            file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
+           file://0001-c11-threads-fix-build-on-c23.patch \
 "
 
 SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"

