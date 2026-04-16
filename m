Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26B7F8DFEF
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:26 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28260.1776378797219993210
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Vh9KlQP+;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so731135e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378795; x=1776983595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJb1Dlh4BL8yr9dAzwUZYcUbujXbwXURbUU05zFLT60=;
        b=Vh9KlQP+g72xUz0HXpP4ohxlJqTWzLbcXN04Xnp+kcOO0FoibUUtCPMZT+NeHinFHQ
         +lS4QindWcuZtKYV7V2pmLL2ZDkg9efgJbLFnmhkZ0mLi+sZBSyW1Kq+/xisLpKdzirK
         wlCo+oFgd/ZSnbsixjbRomb8Y9QKc3BmENyMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378795; x=1776983595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KJb1Dlh4BL8yr9dAzwUZYcUbujXbwXURbUU05zFLT60=;
        b=FH0dhikPJHmPKGe3rcyqDgxtvGBCp8i/BlSJ1LlA3cf81BLlIQBUgWRkUAaMRay7ZF
         Z50YWiHWN2aLhy0cI9bxl+BO6FIfrwD5SDhkkqe+s7egIXDmaeEBjYtzGGb25v65uOla
         5WVd92uJcPh2pzWTZoH/ExyW+EIxbvT0jq/YT6b9jkdGRV7gfEBP55AFzZvm17bOZu7K
         mEfYpi86UemaEaurJmgciwUtx7DZP2WG9n1Rbh7a9GXxJcMZ53mVLXkzZbeo6CXSZsfg
         Aju506fYgKp0938kPkWl3Vxs/7ihqzGH1b9aqFYyXb72qs2kOi7JhcDTAB0F15zd/GvP
         DBbg==
X-Gm-Message-State: AOJu0YwCjUr6qdgoNGSCNjhfxxjRillVDBOq2MRtNRxZTby0eub8cyrK
	qnvFr/7r+ghagG0xI7OSDV002pJxrjE/XSDRPqb03JOtyee4IrKyTqEu/ZNc6RyrUrIrcLUB4Kp
	P5p1UGux6QEEG
X-Gm-Gg: AeBDiesdkSBzf3p3yFJRwuMA4OCrMZJSKB0qWF0JRLn/nQCwvoRik0DmMuMZS1ltxQI
	qThP2yPFWoQkdXrE4V3VVAgApdxAIzaC1mUNlFDA/DwAcA2+KERJ992MVrLAXKwwJ+DZNruHHZQ
	oWG4ZTxEpJ9wl4PYR42gWC/lg9K/KTD1Wxzf2iVfL2WxMYqNppcc7MJi7BQtDpOU6iEmfSPhY40
	HeAxQw5HnabXSv9NPgdNBShwJyaCFtqk1H68XIcF4GRKlzRbJD1iqgQvERNjPfgePA/9huXHp3o
	V7w9pg5/J+95d+d3vE6YIoU7a/fxCLpA0eIYBvC7f6XQRBl+6j8LdfFSuWROlQyXEonWH1j79uv
	NPXHRMBpZQq1+gZt0yusmkhujd45+HZLmcxBxEArnIk/0lRfQbkfX/HGrKEmTYolWw4loS4ZrhP
	RAWBjTpmeugBgSi5DVDsEUjfxw+N/C7zFPZG2xhyWMxpO5SKchUwymAyz14lpfAhozIEBpDz5Qh
	yrHDSqGQ2rkLxH4b9xwMp1Ac/cbn/8fiS2+iw==
X-Received: by 2002:a05:600c:8183:b0:488:ab26:8fe0 with SMTP id 5b1f17b1804b1-488fb765b1dmr5027835e9.15.1776378795354;
        Thu, 16 Apr 2026 15:33:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 25/51] virglrenderer: Fix build with glibc 2.43+
Date: Fri, 17 Apr 2026 00:30:08 +0200
Message-ID: <a8f9417908eae1e91693178870a2abcfcf6f5cec.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235454

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

