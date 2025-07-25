Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61937C87FD4
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 18:44:57 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.26648.1753469094908559977
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 11:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mLh2d7c3;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b34a78bb6e7so2190191a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753469094; x=1754073894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSsdKBra9mZkHSzcTEDb25tIoW0vzyYhkK/O+6KW4fU=;
        b=mLh2d7c3+0/gEExnMV8MvsTx0lHDbgnZFlC3Qr0TbmRSvZvbL+hoZZYqCqhjK+UAn4
         NO2RO0yYc8S590yOnnlq1bj5dRk7uf6v52OpZxmmPP+de956qi+Hkubv8i1gRRoKSvT0
         k4uD4nNEmJmcMcHIEKWWNKeDqqwqpOAJitDHJmbXoy1CgtiYdTUO3aEgv0w1f0UnNvvT
         8NqueITRWdJDYQFXWKiA4hs/1vFFTmURktRcOnZNfaM2Y86wXXFvusnHVSVeWeBdb1xR
         HD0LgiB+chPsZY3PAMP/JTJ/5V1RVjP64vDvA6yGe3NLBQ/a6L4le5OIfSZj26eGYJOU
         3ELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753469094; x=1754073894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSsdKBra9mZkHSzcTEDb25tIoW0vzyYhkK/O+6KW4fU=;
        b=mlfQDM31Grl7n3wyAqU/Un5iJUE5RFf/BNSVtupFbP3phjOjBEcoNcMyXW8l6uROL5
         U1Gr1ssj5cRL9V1KyNCL+XYOkjsUGWGGXUqfFPECO1xkg1Vxct8CjoY+NxTapsHwcxr7
         UY6W/ZUFonDMRCe9vKN0g9YnUnWTuia3W4tcVqiMUu51Lcq8MSHGwJ89vFN2l/Iz4FpQ
         lGG6h2Upg69cX548DePC6lBXGt9qj8h0I2oUgD96kD93lFuKrSVK5oUAfeXJjKc8uxnX
         OML3tnr341txr01IlWqYtsyWnhJUbTxnDIPeQ9YEbenEWLzoH4ZhEBJ5gJlJCkx+KGfX
         Xl5Q==
X-Gm-Message-State: AOJu0YyA568sUhB7KEkd6ejOH+pVhSI9oPm4DAgljzTL/rlz7PDz5Ust
	5MmvNCnqXuCO0HXYNd/yf8uICXtQD8NVnCcqHpMJ4N7cydws4jNpcGhfW+0ynJNRoPIKd87km3S
	RmmcC
X-Gm-Gg: ASbGncuoBVfEB0zl9g/jjCxnJdX2rjbF6UWs3n0hb1fzxmL+tdmGKAMEChAdsAjcVNn
	LwNtmrggsRjFQZmdejmlCbyanF5NpcxZHfCIh4zS43k0M8oKzldBH3RV8//zKiIabaPC5Z0JpAt
	LQHc7fj5tuDE7D/n3kmzdJqr75fg18lJM4WFb+fvTGiYZR2iPmDyHSDV4CDB+L+IwI3NENjlvgd
	VPm/K6aWYOdXN9izg6Ylw/93jdIQ6o2WZPfKi1dEahzR6L3vSDypinKjco9txK2LG3lA06x+8tE
	uxbhPkNGlxvmtrzk/dwowLTE0/aJS0rQ5tj6PbpZEgcR+FA8hfRtj1b3o3daeYVvdE+9pJuo/ma
	jQ1K1cSn7wDWFag==
X-Google-Smtp-Source: AGHT+IHwm38k+zACuSF7kL2E21HCqNsWsCH3aGt9+fjMjj9UmWhYEyo1+hBFtpyrj/aNtVj97RQulA==
X-Received: by 2002:a17:903:2f8a:b0:23f:8d03:c4ac with SMTP id d9443c01a7336-23fb2ff96ecmr46656795ad.2.1753469094077;
        Fri, 25 Jul 2025 11:44:54 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b695:a542:567c:1988])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe537f8asm2451225ad.167.2025.07.25.11.44.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:44:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap V2 11/16] mtools: upgrade 4.0.43 -> 4.0.44
Date: Fri, 25 Jul 2025 11:44:25 -0700
Message-ID: <b09b06ed6351685e5351f8bf80a88d2f42093ca4.1753468892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753468892.git.steve@sakoman.com>
References: <cover.1753468892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 18:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220927

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


