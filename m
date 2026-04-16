Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866EEF88073
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:42 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7724.1776322116563941500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FQ1KUH5U;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so116627685e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322115; x=1776926915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJb1Dlh4BL8yr9dAzwUZYcUbujXbwXURbUU05zFLT60=;
        b=FQ1KUH5UUiLBWUXZzwd8DFrzki7FDdLse/YThiE4poCwnIzgzTo+n5BMbcq/bHrkgw
         3fJ/PlkcVDOKFvMZ5lt68spEiviidxQg4AxiWC4FONUp3pdKEYeX8dtj4U9RCu9yfxbm
         s5MFt9Y9uL3Kesb3NINRYnkJSa/B7hrKnEgLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322115; x=1776926915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KJb1Dlh4BL8yr9dAzwUZYcUbujXbwXURbUU05zFLT60=;
        b=sNudxa7eJRYT8mWCyeVUmNqtOrq6Yt7vnFARBk4AXq6b6YnZ1feQQnqMOt9YHFYbQ2
         5WyWby79Zk96K57AJZKYNz0EYUABdo0/GTPZbtZYehiIHOqyNu8PerayiEeX8lzJpj9P
         HnDF09swoFnOFUC1hz+TS1O0Wem0uJBgvPyiEvq9epC0+AmgR9xwC1bxBnniJgykllBS
         8hEY7Ulh7L4kaAIZCJEcA3kOx1t2U9e6Ci+vvJzB5SZ2pD9M4X+S5Hwqo/IhAK/RKAuL
         xVRfN/gJt7d49vKVPNbClP9i497GVs6w3IEYyZCTyQDbJ29tLmacVHUge2AVC5wkyyRW
         QS5g==
X-Gm-Message-State: AOJu0YzqCx6TEMphzVwPLNsvnmsv7hFUDlLQ1sM6ucbYklJjtC6jP+85
	5JjN72Z0fErzMR/T9AHVRrdnY3spml6h1Gt2nb/m9YKlCykqEDVn/qmtFOqsnFrin0owwogpXF9
	iCY1t+4pM54iz
X-Gm-Gg: AeBDietC75qmqZguiyBJkn0S0lwPJtWUzXc88aoGjD8MPuWeepiwZfZeTE9Rb5mm0Q4
	1LHpjP0iEakoWEM53jwry+ke3D/8CHAvM5+TvnXBxWBSP0RR7fAKIjPbxX5qrSaQkIA63xbFaxa
	avAFDkKa7hTzStzS/4bUWfTpNYe+VwQB2PNYVGOjsSVEOVPaXNRCE4DXpC6SMTmjhbpS24Y5mML
	6z9gULVnhU8PX8HbUNUyKdXbX7IDWTXDwDjNiE62J7mDVqpYl7Luoa24Fwq3cxCi58RY9mJauql
	8QeWA9XTx7EE1ygRc57ZtHtfJ8Y9T71Vorsp+eHbi8PugYfpSTw7GKeWidZMff1zrzFCj03cv9r
	4TNJvOBWVdyvYjg56xdkwaOrHmCxN0lNrEUr9LAqzl8XCnVSL4oNGumlYT/u0dlJ+jZH0X2JS5L
	fOjfZtQ5/pgTClFtfSypuTkAHT5goV7bP1ICFMsTs26qvF7WXuHFcf4VawESw39oqkjr+m7kmP5
	4D7DqxbcyljcX8u/QukdRR6Vq7FFzUshTv2rg==
X-Received: by 2002:a05:600c:4e45:b0:488:8c89:cfaa with SMTP id 5b1f17b1804b1-488d67bf6e0mr361225695e9.3.1776322114683;
        Wed, 15 Apr 2026 23:48:34 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 25/47] virglrenderer: Fix build with glibc 2.43+
Date: Thu, 16 Apr 2026 08:47:26 +0200
Message-ID: <a8f9417908eae1e91693178870a2abcfcf6f5cec.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235367

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 8e85dc6b7f5f7668a610b5fd3754c716f0af65b0)
[YC: Fixed patch format and Submitted->Backport]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...once_flag-ONCE_FLAG_INIT-when-presen.patch | 55 +++++++++++++++++++
 .../virglrenderer/virglrenderer_1.1.1.bb      |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
new file mode 100644
index 00000000000..2fa7245371d
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
+Upstream-Status: Backport [https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/3f0f775edb2df5ea54c37863286ad565ccddb276]
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
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
index 89dd25de70e..be4385ada61 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
@@ -12,6 +12,7 @@ DEPENDS = "libdrm libepoxy python3-pyyaml-native virtual/egl virtual/libgbm"
 SRCREV = "0f1f43929724a6a414c01a29bc51feccb445c2f0"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https;tag=${PV} \
            file://0001-meson.build-use-python3-directly-for-python.patch \
+           file://0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch \
            "
 
 inherit meson pkgconfig features_check

