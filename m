Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79892CDB465
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 21:45:41 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.75728.1697319941148343732
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 14:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xvwkHoIk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c87a85332bso28665005ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 14:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697319940; x=1697924740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3FLqWxw+03EfvuQ4zlM1g1tOEHRO1XdQiU6pkPDMc0=;
        b=xvwkHoIkTefL3niVzbTtIWtef4xxdfKgEfSo0v3klmSxlBetjN475dXM3UoHDUkJPh
         C9BHuqYIlJ4zBeLxmq+K7YqRaqsipLmN9ywo+rIjK+W7mQLNryTAJJkU+B5q4BYVbj66
         AwlHKBqWh1zlDi8xWqZ9LQgLTcOia36/8xuWLIBfX1AEjwyFthBQMCz4Zxbb7mBKmGWl
         5k1C7rKRT9gBfx3TLAobhJLYCyrU8nHhdqr/JvZJHAFuSm8mbb0fbynFgopbEMyhtX8I
         NYfb7RhWjoOCMT3Z8FDyi9Lx1h9Hxlap1sRDb+9/skZRPMrdhZiTIre8V2dD6k7+CSA3
         0vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697319940; x=1697924740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3FLqWxw+03EfvuQ4zlM1g1tOEHRO1XdQiU6pkPDMc0=;
        b=mcUBfxp5g9oAJLGVi7plQv0cQACEHntCiWGn6mwvcXH24ek30XLfQoi3sXJisiTHJ7
         46jUahb+pqabl+ofVmAgcRTARXcKSKHA9amvLXnze6MlEkXm5UkmVZDBXCB1YXdZ93b6
         pmOn+cvi6odt+J5ClBB5lgojRce6lS3HQIBDTA+mEAP5tCX+x+X97lg1X1+DlX8jARaM
         9xcWteyz18G0ijfdXyieeIDKvIIyfnSaCE/1ed+hJz/nxh8j/723H4bIL7qL/hzfC5jj
         CLRvCRN6FZXGA9hyKVaY0LwJ4sGO2xlj8uzEcPSMQ0Rn5mYWVV70VRPDxzoIyKmYF8uf
         YFwg==
X-Gm-Message-State: AOJu0YzpA/Q/xF8wMUA4HcsCpVx7a82OW4rM7uxRLazSwngGieFke0SH
	wLM+1aGPqdVStFgZvH0+7+tdlQmUyufz9gCvcgQ=
X-Google-Smtp-Source: AGHT+IFNYd65AqZs5Zi8ZxySQ/X1ehGYmXApWvQk3C1fLIrjKpIRFrww373SInR7DK7aE6YETvB6xg==
X-Received: by 2002:a17:902:ba8c:b0:1c6:28f6:954a with SMTP id k12-20020a170902ba8c00b001c628f6954amr28645488pls.64.1697319940217;
        Sat, 14 Oct 2023 14:45:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jf9-20020a170903268900b001c898328289sm5943411plb.158.2023.10.14.14.45.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 14:45:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/13] apt: add missing <cstdint> for uint16_t
Date: Sat, 14 Oct 2023 11:44:58 -1000
Message-Id: <2572b32e729831762790ebfbf930a1140657faea.1697319777.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697319777.git.steve@sakoman.com>
References: <cover.1697319777.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 21:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189137

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8c46ded67df2d830c8bbf5f7b82d75db81d797e2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...001-add-missing-cstdint-for-uint16_t.patch | 35 +++++++++++++++++++
 meta/recipes-devtools/apt/apt_2.4.5.bb        |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-add-missing-cstdint-for-uint16_t.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-add-missing-cstdint-for-uint16_t.patch b/meta/recipes-devtools/apt/apt/0001-add-missing-cstdint-for-uint16_t.patch
new file mode 100644
index 0000000000..44aa8a5873
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-add-missing-cstdint-for-uint16_t.patch
@@ -0,0 +1,35 @@
+From 960d10e89cf60d39998dae6fdcd4f0866b753a79 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Jan 2023 12:31:35 -0800
+Subject: [PATCH] add missing <cstdint> for uint16_t
+
+This fixes build problems with gcc 13 snapshot [1]
+
+Fixes
+| include/apt-pkg/pkgcache.h:257:23: warning: cast from 'char*' to 'const uint16_t*' {aka 'const short unsigned int*'} increases required alignment of target type [-Wcast-align]
+|   257 |       uint16_t len = *reinterpret_cast<const uint16_t*>(name - sizeof(uint16_t));
+|       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
+
+Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/merge_requests/276]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ apt-pkg/contrib/mmap.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/apt-pkg/contrib/mmap.cc b/apt-pkg/contrib/mmap.cc
+index 642e20473..0568e1cd0 100644
+--- a/apt-pkg/contrib/mmap.cc
++++ b/apt-pkg/contrib/mmap.cc
+@@ -23,6 +23,7 @@
+ #include <apt-pkg/macros.h>
+ #include <apt-pkg/mmap.h>
+ 
++#include <cstdint>
+ #include <cstring>
+ #include <string>
+ #include <errno.h>
+-- 
+2.39.1
+
diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
index 9ebcdfd527..9ceabcc186 100644
--- a/meta/recipes-devtools/apt/apt_2.4.5.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -13,6 +13,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-cmake-Do-not-build-po-files.patch \
            file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch \
            file://0001-aptwebserver.cc-Include-array.patch \
+           file://0001-add-missing-cstdint-for-uint16_t.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.34.1


