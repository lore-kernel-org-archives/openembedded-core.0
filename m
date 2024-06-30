Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B624C3065B
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:59 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.4389.1719778132534808600
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=plwIOUoq;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.172, mailfrom: steve@sakoman.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-376243a112cso8196055ab.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778132; x=1720382932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3s0ispC1egkMUicVUz2M27P2NVC99gKYWOb1KzDkv4w=;
        b=plwIOUoq5wTTocRs+MfR2TVZNOTbuQwKWMXf3EU4BPnd0Tx0YKFqTnnz5/PNLoh7pW
         sgbziRKg+Cd22MzHnqnf3rZHlkCapLSh3xRX/nJt9GVss+QxOzI+eK7wSYQ/69RnAfln
         79ryBbOZI8jUFyuT6r+BumBQ7Bil+0qUl6zjvXGQsy9kD5PjRTGjF2yV3sF2Nyxo1AEL
         wwenjZxK6wqlK4XOPa5gBn5Y0G/bOk0Oo6lplv/S63zgjLXfHPTZbDbVtPESjtBOsznv
         XYwZJa3gWpnDSMk/dr01R8d+b8kb9mH2aelYgMbLAfK/5OhkBhBFzxTeq2HaPIEN5OqY
         2wQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778132; x=1720382932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3s0ispC1egkMUicVUz2M27P2NVC99gKYWOb1KzDkv4w=;
        b=iV2i0egCo0bV95fp+jlhh+2tHpEaZoV4rl+U0Ypi2OPXU0XgPybaFmVOCKeiausEMa
         +5PVUtCN2eIm6NGxGT5E4MsbclN3yCGYFL/5BCIGE3e8pML0sFqj474CKBUU/WiAK1UZ
         u1NI6DT9sWQOA6ewY37e0PYISYPWYXCqFkZ+6yhj8fiTMt92l7nkQgAtdAsx8sAebzHW
         iCiWiBuZSjcyxmySNSIJzmTJUnc3VCN+yj7MtAuydVRVpI+WJHViC4xpGRPb8SoHx9UV
         mpfJtViZ6XN3Bndo/MmHI5dZ4xuSu/SA1jmgBNhXNNF2U6fhdnuVhm6ClbaoU1AxORS0
         qxmQ==
X-Gm-Message-State: AOJu0YxgGMfeEOAbVzNznLZeNlx5wxy2a3yJ4lCIp46sc2l32AvQ8/e9
	7L1ZlrPQiQBUBwuMLL7WH2dNvbmT5z3pxYda2dQdYFc367oucxW6Zt2JiNWyb32J2SrzZWnJwQg
	KJnY=
X-Google-Smtp-Source: AGHT+IFkVSZUzfjJPyxYIJGzZh2XVeS7Xsb1SaaSSDFzhZ07ftSf/7bkoBW3WfgKDJmfAOdkBPctRg==
X-Received: by 2002:a05:6e02:194b:b0:378:1508:65a4 with SMTP id e9e14a558f8ab-37ccdc9ec3emr39768465ab.0.1719778131692;
        Sun, 30 Jun 2024 13:08:51 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 32/35] libxcrypt: correct the check for a working libucontext.h
Date: Sun, 30 Jun 2024 13:07:44 -0700
Message-Id: <367730034a65b5063092f5859f0164331f386f32.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201269

From: Ross Burton <ross.burton@arm.com>

The test fails with GCC 14.1 due to an incompatible pointer assignment,
take a patch submitted upstream to fix this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 054304ecb3a8a8ed523bd149f70ed468cf613178)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxcrypt/files/configure-c99.patch       | 39 +++++++++++++++++++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libxcrypt/files/configure-c99.patch

diff --git a/meta/recipes-core/libxcrypt/files/configure-c99.patch b/meta/recipes-core/libxcrypt/files/configure-c99.patch
new file mode 100644
index 0000000000..b77ea7af07
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/files/configure-c99.patch
@@ -0,0 +1,39 @@
+From cfe9f4d6b0a5d10a15e10e987d528c5c513a42f1 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Tue, 19 Dec 2023 11:00:11 +0100
+Subject: [PATCH] configure: Only text the makecontext signature we need
+
+The test/explicit-bzero.c test uses a start routine without any
+arguments.  There is no need for the multi-argument version.
+
+This avoids a build failure with glibc and future compilers.
+The GNU C library declares the makecontext callback of
+type void (*) (void), so no cast is needed.  On other systems,
+the type may be the (currently distinct) type void (*) (),
+but given that this only affects the ability to execute a test,
+no further machinery is added here to detect that different type.
+
+Upstream-Status: Submitted [https://github.com/besser82/libxcrypt/pull/178/]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ configure.ac | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 016997c..4b8afd8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -303,13 +303,11 @@ AS_IF([test $ac_cv_header_ucontext_h = yes],
+ #include <ucontext.h>
+ static int x;
+ static void fn1(void) {}
+-static void fn2(int a, int b) { x = a - b; }
+ ]], [[
+   ucontext_t uc1, uc2;
+   if (getcontext(&uc1)) return 1;
+   if (setcontext(&uc1)) return 1;
+   makecontext(&uc1, fn1, 0);
+-  makecontext(&uc2, fn2, 2, 1, 1);
+   if (swapcontext(&uc1, &uc2)) return 1;
+   return x;
+ ]])],
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index ba93d91aef..ee6875aa05 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -13,7 +13,8 @@ SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=
 SRCREV = "f531a36aa916a22ef2ce7d270ba381e264250cbf"
 SRCBRANCH ?= "master"
 
-SRC_URI += "file://fix_cflags_handling.patch"
+SRC_URI += "file://fix_cflags_handling.patch \
+            file://configure-c99.patch"
 
 PROVIDES = "virtual/crypt"
 
-- 
2.34.1


