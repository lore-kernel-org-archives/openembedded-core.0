Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CD6E7719E
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:50 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.14220.1736325761475542183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VKkKoM9M;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so1166388a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325760; x=1736930560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rP2cm6jNs/N33gLlaw19eZzj1sbUwIzUwOzTgW0plUI=;
        b=VKkKoM9Mcq5eRkcYdz84dzot4ig/8JT/dVsGo9SEkQ7iUYVH6Kh+eWZ+fNHop3hSQ8
         mUmNnnqXTI7psn9BmYXLMowCEiOqIWWLJ/WvymklMRx/EDCiseHC2CF44AiqW+q8Z525
         h/t4H8bcqs6f53aV97Hi3hFxBXI0Hc0XHT66zeNjDcVb2Enfj8ZW7FZ+adUZZQn5yvJF
         dUm79WY6l6s1UzVXSXH5bZCEEoavFQ1xPSwNtrD/iE+Aaw4cTdfE8I2p8KhQHQNp6Its
         l6GQ5P3Krxwz2X54sb9TUHDfX+pYK2XqcWnOAcP85qT6EbChn4PPa3//hLxg6RtU4Yz1
         2NMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325760; x=1736930560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rP2cm6jNs/N33gLlaw19eZzj1sbUwIzUwOzTgW0plUI=;
        b=dgiF5y73HpKkvzwUFSIYXUQ6lUf0nV669VuaW0PPpmT7ArXPVjpUyOmSLJvbDDIQGT
         nW7ruY8uL6YyFfLl2eRzg36SrLWXrFXO4xWnE2iVw1E9GKELJA7t9qBliRv8gnQ6SP1u
         +/Kky2QXBp7sMwWrn7wBAeo68hmB8hpGtv1Sk9QPOU8gl8NznIk4H0WvosXNj+IbGIyO
         6kJzsuzfP9OKBwxHnOxduoh5SOG2gchML8/FWUaF3VtnCXTkGvekMIb6EEipAoXPsrCW
         qXqY5RpS/owmoE+EW8NyO/qL1jPpSCMz7cnpoHa166qmlShpSM+6gB1WswamB3gACAI4
         OFDw==
X-Gm-Message-State: AOJu0YwAe+baTpsBD+oBm9hh2KrJVylp+o8HeIBg3p6EjOIVpy2OPtyk
	Rk2d9qxH+VPwAxCt1yLtt7dR4wxRF0QHoNUAt9wdyrGu1cjZGl40SGigNg==
X-Gm-Gg: ASbGncuYAq54UI4XXqBdDh2byfc2QDjXI6WqMshRil915WX19qm4c7is2P/VsOOJz9t
	togM29qnpaEL6HD2BtazK0ZaqADzusQq2x7CsDmwhFQHa6tpZNodIXJFqg4XvuqVc68xy2U2eP5
	LKWao54RrxVUoQZCfW0qUqSdsJdx53K8VACnVQPyZp5JeMzLs7IwRjGAOC/x5MO6Dz/1weRzPrC
	stimZW9e+BwhnVT4x0WHndwGT/g+TTTKRax1lsbkbXdv4pP/GC5LP53LZam54BjRERoLiBhXjEy
	+EpnnVHfaBg7rNqjiQ==
X-Google-Smtp-Source: AGHT+IGUCAfLGuOCDGlOFtlRtybBFRZyt7dYHKzDneOMN7d/uZQmDlUxt16d+1RHVC/CerJAii904g==
X-Received: by 2002:a17:907:7253:b0:aa6:68bc:160d with SMTP id a640c23a62f3a-ab29109bfc4mr511226666b.16.1736325759590;
        Wed, 08 Jan 2025 00:42:39 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/20] libxcrypt: update 4.4.36 -> 4.4.37
Date: Wed,  8 Jan 2025 09:42:20 +0100
Message-Id: <20250108084226.117178-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209536

From: Alexander Kanavin <alex@linutronix.de>

Drop patch merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libxcrypt/files/configure-c99.patch       | 39 -------------------
 .../libxcrypt/files/fix_cflags_handling.patch |  3 +-
 ...t_4.4.36.bb => libxcrypt-compat_4.4.37.bb} |  1 +
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  9 ++---
 ...ibxcrypt_4.4.36.bb => libxcrypt_4.4.37.bb} |  0
 5 files changed, 6 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-core/libxcrypt/files/configure-c99.patch
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.36.bb => libxcrypt-compat_4.4.37.bb} (99%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.36.bb => libxcrypt_4.4.37.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/files/configure-c99.patch b/meta/recipes-core/libxcrypt/files/configure-c99.patch
deleted file mode 100644
index b77ea7af077..00000000000
--- a/meta/recipes-core/libxcrypt/files/configure-c99.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From cfe9f4d6b0a5d10a15e10e987d528c5c513a42f1 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Tue, 19 Dec 2023 11:00:11 +0100
-Subject: [PATCH] configure: Only text the makecontext signature we need
-
-The test/explicit-bzero.c test uses a start routine without any
-arguments.  There is no need for the multi-argument version.
-
-This avoids a build failure with glibc and future compilers.
-The GNU C library declares the makecontext callback of
-type void (*) (void), so no cast is needed.  On other systems,
-the type may be the (currently distinct) type void (*) (),
-but given that this only affects the ability to execute a test,
-no further machinery is added here to detect that different type.
-
-Upstream-Status: Submitted [https://github.com/besser82/libxcrypt/pull/178/]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 016997c..4b8afd8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -303,13 +303,11 @@ AS_IF([test $ac_cv_header_ucontext_h = yes],
- #include <ucontext.h>
- static int x;
- static void fn1(void) {}
--static void fn2(int a, int b) { x = a - b; }
- ]], [[
-   ucontext_t uc1, uc2;
-   if (getcontext(&uc1)) return 1;
-   if (setcontext(&uc1)) return 1;
-   makecontext(&uc1, fn1, 0);
--  makecontext(&uc2, fn2, 2, 1, 1);
-   if (swapcontext(&uc1, &uc2)) return 1;
-   return x;
- ]])],
diff --git a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
index 94aa3fed49c..879950bbe37 100644
--- a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
+++ b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
@@ -1,4 +1,4 @@
-From 7b2a0cdc281d94a5782c37ef87040c341447b4b4 Mon Sep 17 00:00:00 2001
+From 1e94a03541e35718dc1eaa8023e0ec3cf2de369b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 30 Apr 2021 10:35:02 +0100
 Subject: [PATCH] libxcrypt: Update to 4.4.19 release and fix symbol version
@@ -13,7 +13,6 @@ Avoid this by stripping empty elements out of CFLAGS.
 
 Upstream-Status: Submitted [https://github.com/besser82/libxcrypt/pull/126]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
 ---
  build-aux/scripts/compute-symver-floor | 2 ++
  1 file changed, 2 insertions(+)
diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.37.bb
similarity index 99%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.37.bb
index 30ec6a4674e..bb4e2032dd6 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.37.bb
@@ -16,3 +16,4 @@ do_install:append () {
 	rm -rf ${D}${libdir}/libcrypt.so
 	rm -rf ${D}${datadir}
 }
+
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index ee6875aa05d..9ecb333fb96 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -9,13 +9,12 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
-SRCREV = "f531a36aa916a22ef2ce7d270ba381e264250cbf"
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https \
+           file://fix_cflags_handling.patch \
+           "
+SRCREV = "e5714d1f0a477f91ce3986fa63651c7710f0e183"
 SRCBRANCH ?= "master"
 
-SRC_URI += "file://fix_cflags_handling.patch \
-            file://configure-c99.patch"
-
 PROVIDES = "virtual/crypt"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.36.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb
-- 
2.39.5


