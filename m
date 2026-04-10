Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDDAF36BB5
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 06:12:22 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150351.1775801533606101327
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 23:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k9EZc1O5;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d23305225so1129490f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775801532; x=1776406332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CWUUoZAC77BBVnc05CfRk2rHmZPHV+c0RBbstD7x9bc=;
        b=k9EZc1O5Ky1zKSip5R+jWIQbmWwDRT2HMIGiakHCMN9mv12qUEXk+K3MbWjRM5RCMb
         UVFrQ7KYnrMA2vVF4pzk/1A5wBrW6f0OGqRuH9KiBHnZ6YCCFoj+wcoQE2N/wPK16ldY
         IhVDEWbusVD3O0VLL8DQgx8aC1I8URi4h8/EPmi/N3SZZTLv+fenJTYzIt5d+6tClBUd
         VlBMdBeTI2duSGDqMLK8y2t+LKhjK5sETNvzJgYYvPJ60d0bYcjyqnuw952YwcBkrluO
         yGTkt0wBthxbFQWjPTIh6n60r//4PXZoImx+cyrb9SLGKSmWykD1rn2hrlN9c1DDZamI
         opJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775801532; x=1776406332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWUUoZAC77BBVnc05CfRk2rHmZPHV+c0RBbstD7x9bc=;
        b=nVcGUtjH3cViCHmWyr8FC6j6rZxaT1GL8cxwKmJohQTki5CouFUE8DIrA3ISrJBk+l
         ARmXetCE41bgrQtEr49UIV8j5BJigcfQNfEHppAe9Xk1MRyLtAp7Ejoahb+y09+5PeeA
         crXrSYYY8Wag4XauXd4A5iRf/0qLieMFO3sVmOLdjr0HjgY05eyzShGsD7IsLbcvdtFy
         0IaW+dX7g42w9VPd0HRwnvNFCLnr25bOvjzXb2+zXfB7xtYyFTs9+N1H7mxjad6/Y2dP
         koUzARt36yb5BI5vnjjsdwU6+oTZIOSCslbrsAK0ATSLVl2pZFPeVz4gOlFXSMnNqp4f
         2sew==
X-Gm-Message-State: AOJu0YxJs9pGxISjMOtZoY5aNpSGUziqGCeuHCKoe2McNC4aKkYIV6L6
	woulg3evI1vveq/ao3n5lBwIgs4VbBB4pbeZ0Tc/nBzaRdfQ6HrjbdiReeS5vg==
X-Gm-Gg: AeBDieslFUfZ7p+0b6P5KpuOIseJj1qpEbbGYFMd5AhrI2mNibDWmBCx0dVaC0k7UIR
	9UqSd4KgSXxdolob9swU1uE5yBk/1Aj/Ct2Y+HhDEHB0thCwTFRrCd0K6CvqPK8e99EOCj981tC
	OMMJd3/hhy6/Yg4bgv/DepFs0Nljkp7nLlPowUBPPrc//5uhmxuRThK1rq84kgzPHrk+U1qX3SY
	CYq2MQ/rxUhXEYjMZasfk5DjVpDCqJik8fXPWY8FemYM3sQKaca6pFwLDj8fcSTaWqWd8hpB6ES
	F1w3zFRvejGOs2ikaNyvw2toOYZnaK3m2dp2GQuuFNHKzA71GvTLTqskjAtM/N4oM8/T5MhGzwG
	UY7Z+L/AsA1BFd7MfQUhQ5odOu9xEFsQJC05w8qwyO9pb8YSYWdpICO3EyydZPAkPoZT8le6m23
	41SPk+bEJIwjGN5YxK+40ge/bNrkWULNCbfWB/
X-Received: by 2002:a05:6000:22c3:b0:43c:cf25:f29a with SMTP id ffacd0b85a97d-43d642979f4mr2430525f8f.8.1775801531384;
        Thu, 09 Apr 2026 23:12:11 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e462fdsm4581666f8f.22.2026.04.09.23.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 23:12:11 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [whinlatter][PATCH] virglrenderer: Fix build with glibc 2.43+
Date: Fri, 10 Apr 2026 08:12:05 +0200
Message-ID: <20260410061205.1473776-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 06:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234990

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 ...once_flag-ONCE_FLAG_INIT-when-presen.patch | 55 +++++++++++++++++++
 .../virglrenderer/virglrenderer_1.1.1.bb      |  1 +
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
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
index 89dd25de70..be4385ada6 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
@@ -12,6 +12,7 @@ DEPENDS = "libdrm libepoxy python3-pyyaml-native virtual/egl virtual/libgbm"
 SRCREV = "0f1f43929724a6a414c01a29bc51feccb445c2f0"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https;tag=${PV} \
            file://0001-meson.build-use-python3-directly-for-python.patch \
+           file://0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch \
            "
 
 inherit meson pkgconfig features_check

