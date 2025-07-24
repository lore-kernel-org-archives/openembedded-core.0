Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 818CCC83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 21:36:10 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.5252.1753392961639097813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 14:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TJ1t0XbB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747c2cc3419so1253526b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 14:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753392961; x=1753997761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSsdKBra9mZkHSzcTEDb25tIoW0vzyYhkK/O+6KW4fU=;
        b=TJ1t0XbBMOOXgTxty8jmoJFNvjIaTlD8xTjIiuiovaYTY+iWNRbUfoqAxyDVI3ZkwZ
         2M1AKR7Cln9R9fKwRhfVADjoIduh2Cf9rdwrSBka4i/bxBCLaJKXyYub5ohwAuQJmWIR
         Pb9CQwoXikYglQWd9MXbtCg9ybTA9R8j9hrV54IBEnrsDLAtzVWSalZBDs5vk0iANPIR
         sV87l5qhRLu8pY0H3c6nv1e/he1P1ChEyX3x7/Un+G9A/IGwmeWC1ObjYPPgtJPz08rR
         oHrQoENh8IMNFMAf4vMp1Md4sayurQxPsvr0Y77xuIXhyA2bPj6n6ZQBorivXNjp49q8
         8sqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392961; x=1753997761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSsdKBra9mZkHSzcTEDb25tIoW0vzyYhkK/O+6KW4fU=;
        b=dUe9qQgf8yAkcE3hVHYYJwndNam1Z+hN8Xv+RHVpp5MsGwI3oxq8i6kDNyLkMO6NSb
         R5JmFvzbRndOGWqOiXgq5FNkeFJDFVhjdQqxLfZeF/7NGyjkgKkOxHlwPEch7ZzMutK3
         4VlboLXgVJoQxHrQMo8ZO19SSFjbWNv/eJ7mF/1S0uHlhvLUPoBsvQVNZoprHL15czxe
         lHg1fXX/e3Pn4UbzE/Ae+1Vt+aijP5O0wzhafiW2uuDOOFDQnh3kqdABhum1w2EIaU0V
         YwSFoOxa1Mj4UvSelxDEkINUFA9ZS7V0CzVUi+4Gbsda2MtkfxQnt6KWEqSWAGj/OPQY
         Dbrg==
X-Gm-Message-State: AOJu0YzAkZkkq9ij/PcUISC4yddi8btfU+qoSuktKPzB6jVBSa49MCX+
	ngHbKKZx4DUUx5XnICbYgz61F0hrTGZv2VcmDKPBYzWQa+OypEMIOwZ3uoYQP5XoO5dX6MUnHmf
	2LeN+
X-Gm-Gg: ASbGnculBNBuahugciwPJjuUYexufGLtFK+qSn3/lk3gTG0k8hTcomiFf6KBlLQ6Oul
	aCuBQEOM/nMZnEzqkUt6RNeELWSHnsYDkELYvYiug9C8iykHiK/LatmkLOjGdh8MhXu4/iGlVGk
	SAUfuWQWITc7Tt8i1RSI2wbVBsPo9jmqnLv6Wqg4GQGCS8sT162mKXOJuZQJYVP9OHiwKqQFOnt
	FLMvogmI/v9vEjcW/9/7L1Eunw1hLNR2SFA864cAzWIES0fezMBpzrYN8V+woQaXwNcIgZJMeRT
	NBpRnxzh4TGN0o2W4sUuj6dAAWCCbVxgd7fx/x9pAXTcvSXCImxQxA84s1ZbtdPqRC3GEePfc4M
	ruz5G7euhkXFg
X-Google-Smtp-Source: AGHT+IFOQJb4l/RmWPs5aaESwSMHr35jaYmwfeGT93TVxro1AogkEd9vVti/hyvIkK2NPQCaRPJaoA==
X-Received: by 2002:a05:6a00:ad0:b0:748:fcfa:8bd5 with SMTP id d2e1a72fcca58-76034c002c7mr13449620b3a.3.1753392960777;
        Thu, 24 Jul 2025 14:36:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae158129sm2253735b3a.32.2025.07.24.14.35.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 14:36:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/16] mtools: upgrade 4.0.43 -> 4.0.44
Date: Thu, 24 Jul 2025 14:35:27 -0700
Message-ID: <972b82b816a0a9cc51b2a7c8f6a96e66e15ae2fa.1753392770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753392770.git.steve@sakoman.com>
References: <cover.1753392770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 21:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220884

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: dd8c333576d7ebb8abab3a62b3451439519a0caa)

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mtools/mtools/clang_UNUSED.patch          | 19 +++++++++++++------
 .../mtools/disable-hardcoded-configs.patch    |  7 +++----
 .../mtools/mtools/mtools-makeinfo.patch       | 11 +++++------
 .../{mtools_4.0.43.bb => mtools_4.0.44.bb}    |  2 +-
 4 files changed, 22 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.43.bb => mtools_4.0.44.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index 6bb9d6a3da..20a6d1b8b3 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,12 +1,19 @@
-Undefine UNUSED macros with clang
+From c72d075cb0c3a65ef17621c7ed1ffac35ca3b68e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Sep 2018 11:55:41 -0700
+Subject: [PATCH] Undefine UNUSED macros with clang
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: mtools-4.0.18/sysincludes.h
-===================================================================
---- mtools-4.0.18.orig/sysincludes.h
-+++ mtools-4.0.18/sysincludes.h
-@@ -101,7 +101,7 @@ typedef void *caddr_t;
+---
+ sysincludes.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysincludes.h b/sysincludes.h
+index e16ab45..8d285d4 100644
+--- a/sysincludes.h
++++ b/sysincludes.h
+@@ -98,7 +98,7 @@ typedef void *caddr_t;
  #if defined __GNUC__ && defined __STDC__
  /* gcc -traditional doesn't have PACKED, UNUSED and NORETURN */
  # define PACKED __attribute__ ((packed))
diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 57be935487..1bed4e7614 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 2ef9b371a5cc44e730143e694d71665831fac216 Mon Sep 17 00:00:00 2001
+From 0953b744b0257e26c170fb6d6b4c0f6210e4ae43 Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -6,16 +6,15 @@ Subject: [PATCH] Disabled reading host configs.
 Upstream-Status: Inappropriate [native]
 
 Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
-
 ---
  config.c | 8 --------
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index 2f6a297..3181ed7 100644
+index 358282b..8ebafb4 100644
 --- a/config.c
 +++ b/config.c
-@@ -844,14 +844,6 @@ void read_config(void)
+@@ -868,14 +868,6 @@ void read_config(void)
  	memcpy(devices, const_devices,
  	       nr_const_devices*sizeof(struct device));
  
diff --git a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
index 6ae91d6cb9..3771f94c59 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,17 +1,16 @@
-From 3cf56b36db78679273f61ba78fbbf7f3fab52f68 Mon Sep 17 00:00:00 2001
+From 184b76e9742ff89f90a066edb0f46b4a150351cf Mon Sep 17 00:00:00 2001
 From: Marcin Juszkiewicz <hrw@openedhand.com>
 Date: Fri, 8 Jun 2007 08:35:12 +0000
 Subject: [PATCH] mtools: imported from OE
 
 Upstream-Status: Inappropriate [licensing]
-
 ---
  Makefile.in  | 11 ++++++-----
  configure.in | 27 +++++++++++++++++++++++++++
  2 files changed, 33 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 616d59f..85b5b1d 100644
+index 5db50d7..92ad461 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -26,10 +26,11 @@ USERCFLAGS =
@@ -30,7 +29,7 @@ index 616d59f..85b5b1d 100644
  
  
  # do not edit below this line
-@@ -199,7 +200,7 @@ dvi: mtools.dvi
+@@ -185,7 +186,7 @@ dvi: mtools.dvi
  
  ps: mtools.ps
  %.ps: %.dvi
@@ -40,10 +39,10 @@ index 616d59f..85b5b1d 100644
  pdf: mtools.pdf
  %.pdf: %.texi sysconfdir.texi
 diff --git a/configure.in b/configure.in
-index 5ff75c1..c0f7440 100644
+index 1de916e..fd6cb08 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -35,6 +35,33 @@ AC_CANONICAL_SYSTEM
+@@ -32,6 +32,33 @@ AC_CANONICAL_TARGET
  AC_C_CONST
  AC_C_INLINE
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.43.bb b/meta/recipes-devtools/mtools/mtools_4.0.44.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.43.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.44.bb
index 859103979e..d8dd671be2 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.43.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.44.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "541e179665dc4e272b9602f2074243591a157da89cc47064da8c5829dbd2b339"
+SRC_URI[sha256sum] = "37dc4df022533c3d4b2ec1c78973c27c7e8b585374c2d46ab64c6a3db31eddb8"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.43.0


