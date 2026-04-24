Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5371FF884B
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:02 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32586.1777064215392917730
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BJkdh/Td;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso113586045e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064213; x=1777669013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jIwELe46Nf7KEte855mgXR45G9tM3rbNUwcA5o5fP8=;
        b=BJkdh/Tdyu4qrB4WyJeJj036eQStsCSSsqi8+HDmSLscd+NRDgxFHfXzuKzHGTo0rh
         wJYuM05E3hK0iBsOgFAPP4Iv0+SZXan2hW233zlKyeDCCF9VZz+vU8ikZe7MCgN5pWIC
         vZVsAWIdvgj8vcBMjbZOtgIf7PohVOTaCvpXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064213; x=1777669013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0jIwELe46Nf7KEte855mgXR45G9tM3rbNUwcA5o5fP8=;
        b=ENPVAjxrpIbaa/yrub1QcYd+MLv2xbqp9i49WdOE4njx3JDnQrFeeoAdInV0mb8Bk4
         KyPYFtb8m0STX2U4JNLEQubeqKbRsYZbE2cC9Mk+vPfZUZEKr7YKaZX8xRMnxAe67PEw
         DPcZNciPY/OsvsxCtqBX4/jiCADh/e35wUyPa7ihackzQ1x/hmRM2v/BhK25QAhHai/B
         CARpr7HtMkNmRNz3u6DjoqbDAIoo4BrY4ZZcqYJOPymOCJg7Lz+jn/YNnuXZwmWGxNlN
         RRU+cryoLwL2JPEuTq5dVZoSCff5uPHJHywg1eAMPP1cZZIyarKrMYIGWl/LBsnCDY61
         mikQ==
X-Gm-Message-State: AOJu0YxmU40JgubOHbEdDagujfZ4fSYgXEMRrJRLyZc7tk7UQbq4K73S
	Ocrw1bmBU1PMSy4QJ4tSX358KyBruveB/p7JZ2dcCyi4V2aK56nkU5EPk/QnhZ/JFgxggK7PhQl
	HuqOcU0ZMvFH0
X-Gm-Gg: AeBDies6PoIQyNQ61NXH13eJoOCbGHQqHNzPuVYmE39NSltP2mqTgg50TqrnCh6n4N+
	B13EWRCgid5y+l70CfuTCaVSXtI6IluS4HkJvvJbptVA8FRaQrRU6KiHhrSpHoKftq3BPMOdUQD
	0ux5G82eUH2z0YZsghENDLhcMysYXnQbmRi3UkkmfpCy04zLD/dHqgaJcfrk0RvEugr7MIsEw3v
	thKoTl7yQTGFv3MXbFBisnLFiYHEVezVbcjPEfJmuoCpn+Nzgeax+pkLBhUUyht59NWymrMzZPu
	j01YKgeJ4qXZShVjHKq5XQrdFggIThifybhOU+QyVQZb3p7Z2XRAeWh850wto6Hb5Xhmn4QfU9C
	bIWdr7I6ejOW5fHFzHA1/6lvOlzhu3GjVMDY87Fn8lIdPkfjpthILJ/Wokxfp6VDWUjdoLzBrQ8
	mit6qn3Qj93GBQc9aPk4371vKEpaz11xR6/GOtp++XXrdc8TMZqqQbQA/AM5Tg0HRpX6m0Vaa6a
	311hDK2f7Hj/V1YlnTdxFyRXuMaBvZ8KX8ddA==
X-Received: by 2002:a05:600c:3110:b0:488:8c89:cfaa with SMTP id 5b1f17b1804b1-488fb73841dmr482733415e9.3.1777064213567;
        Fri, 24 Apr 2026 13:56:53 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 29/66] virglrenderer: Fix build with glibc 2.43+
Date: Fri, 24 Apr 2026 22:55:28 +0200
Message-ID: <73be494b2586d8b73cc14dddebfc1753df233530.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235902

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
(cherry picked from commit 8e85dc6b7f5f7668a610b5fd3754c716f0af65b0)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...once_flag-ONCE_FLAG_INIT-when-presen.patch | 55 +++++++++++++++++++
 .../virglrenderer/virglrenderer_1.0.1.bb      |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
new file mode 100644
index 00000000000..1740d7605f8
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
index 87f25a34610..a6145c15f6d 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
@@ -13,6 +13,7 @@ SRCREV = "690680e5f0f952e22424fca1538c1b24457a0868"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            file://0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch \
+           file://0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch \
            "
 
 S = "${WORKDIR}/git"

