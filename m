Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC5FC87FD6
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 18:44:57 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.26649.1753469097031686536
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 11:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZJJZKWnv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so1916894b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753469096; x=1754073896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3z9SldFNgT4ZI6OK1LZ29TPpvD4+RmFlODYbOy5Yt4w=;
        b=ZJJZKWnvKjN4P5vEnQae9tu4eX/QBcz6yUqPBG/Xju8cVNBlfbPH5jBrK2i+HGQGPF
         ghDqULwxqGqtA5Br0OROBzqvVF/9VXxFcKm7UYsqVM9ckQfjWvUy1pIpT/OpYCxSOFG9
         gC8GpqwkIOEw/yqFAqqSprgm+WckskCoyb5o9/PooZQhafhVJ3xlsEENqDGk+9c4KFXC
         PPnH5FEit28Tju26FMSMZeTEb9EPl+6sY8hqOnjff+IptqewaN38y+ocZGUqXTgGDHyA
         IHuyiAhodxUoFu0pnLPriRCr+4vIfTzXEFT6TfZ3Hg4PGGCiofFvlOu1xSeCBybqSuZc
         bgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753469096; x=1754073896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3z9SldFNgT4ZI6OK1LZ29TPpvD4+RmFlODYbOy5Yt4w=;
        b=w0T6Pt3zwYXQGBIZOph7zVnNFGVYAFYS0clZI1hAuThZpZgKfBqydD4ncz7AHDiCfX
         VOP00eAWA5iAFgJGt4SapPg9P+z6Rdfw2ZorTAomk07nVX9HcuF31qBDrNZWCS7oKkBH
         zRWUx2MbVC0hmycuUlgXQJXDzV59ulZHRT8Uf4HDDeTDU+TqHbGnGNpJHFx1JL6RSAe5
         BFjaMt4KKtXU6XfKKJk+0+K1OJsBkBGgnj2Fgmb0wHOTBwjRwIZVDyoPrK9JRfr1vki2
         RNSGWK5LhexFFGmMYVfc+sJqIVnreX8vtdU3hDuzrKG5jAiME2aFFeaMCf40+aYcqUNe
         vVgw==
X-Gm-Message-State: AOJu0YzqHKbHhFCiHVksCfiGmRt1Ng0aP2zb1ZfV7dP8wFqFyRHgSU6r
	549eZITab8GPOjaSUN8OP/P4NKcYA7/Lo1/KtWG9go8zz50snRBNmnwSZKgHqVXxHkk976fIhHF
	rCiYI
X-Gm-Gg: ASbGncuScRTonX1mwhzwxehVl3If33p2PS/XWN+CZGu8T0Y4AD8jrN71aMZWJr6gzBw
	adTM0wMS082SCbFuSp44ifPcuv1Eit7RxLsi4aS6NfEtqJwZGNTrvUdvTKeG+APhIheudKrBHLc
	JuYtsr0QRv+jvo4CYmOjjtTQIQnIwlcFZK6xUmEUuj3djD36gr0wdbtrVqc798oNnYptNaTX18p
	AJ+1eAVU6H3GPjIyBQh9wK3dO8uSpyDDKZrTZEzsF2i1D8omH2/xX2Xce1YCFl3wiRz6aGA6n9j
	M5fOk3d2YUPL53Tgm/+sdBpO7FSFJUngXV0tjYl7OobSJA3yx11JnONStkjhY+K+ry/+CT9dt90
	IojpExrauWs4vbNqnnQW89nn9
X-Google-Smtp-Source: AGHT+IFaSj+bI0eTqNIVN37gx3fEdAmMfGZ+vnb+BQ30RB3cl5rKmrsbkcY/CLDrkMw7C3pDxMlclQ==
X-Received: by 2002:a17:903:2ac4:b0:232:609:86c9 with SMTP id d9443c01a7336-23fa5ceb006mr78184165ad.9.1753469096175;
        Fri, 25 Jul 2025 11:44:56 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b695:a542:567c:1988])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe537f8asm2451225ad.167.2025.07.25.11.44.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:44:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap V2 13/16] mtools: upgrade 4.0.45 -> 4.0.46
Date: Fri, 25 Jul 2025 11:44:27 -0700
Message-ID: <daab05bc863611c83223a383dd83ff2134cae6f8.1753468892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753468892.git.steve@sakoman.com>
References: <cover.1753468892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 18:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220929

From: Wang Mingyu <wangmy@fujitsu.com>

clang_UNUSED.patch
mtools-makeinfo.patch
refreshed for 4.0.46

Changelog:
=============
- iconv buffer overflow fixes
- removed references to mread and mwrite (obsolete subcommands
from mcopy)
- documented mdoctorfat, and addressed 2 bugs/oversights
- removed references to obsolete mread and mwrite
- portability fixes (dietlibc and MacOS X) & simplification

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: f5a5b2372669d8be4ae3f19ed6892264ea3999d0)

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mtools/mtools/clang_UNUSED.patch             |  6 +++---
 .../mtools/mtools/mtools-makeinfo.patch          | 16 ++++++++--------
 .../{mtools_4.0.45.bb => mtools_4.0.46.bb}       |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.45.bb => mtools_4.0.46.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index 20a6d1b8b3..1420d84b86 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,4 +1,4 @@
-From c72d075cb0c3a65ef17621c7ed1ffac35ca3b68e Mon Sep 17 00:00:00 2001
+From 6654edfb1eee416b58bcb6490658f80071a353c2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 Sep 2018 11:55:41 -0700
 Subject: [PATCH] Undefine UNUSED macros with clang
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sysincludes.h b/sysincludes.h
-index e16ab45..8d285d4 100644
+index 6b322ff..48daecd 100644
 --- a/sysincludes.h
 +++ b/sysincludes.h
-@@ -98,7 +98,7 @@ typedef void *caddr_t;
+@@ -85,7 +85,7 @@ ac_cv_func_setpgrp_void=yes ../mtools/configure --build=i386-linux-gnu --host=i3
  #if defined __GNUC__ && defined __STDC__
  /* gcc -traditional doesn't have PACKED, UNUSED and NORETURN */
  # define PACKED __attribute__ ((packed))
diff --git a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
index 3771f94c59..8c80040f91 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,4 +1,4 @@
-From 184b76e9742ff89f90a066edb0f46b4a150351cf Mon Sep 17 00:00:00 2001
+From fd1e84c66852c2c906ee292aad942b4bfbd9e306 Mon Sep 17 00:00:00 2001
 From: Marcin Juszkiewicz <hrw@openedhand.com>
 Date: Fri, 8 Jun 2007 08:35:12 +0000
 Subject: [PATCH] mtools: imported from OE
@@ -6,11 +6,11 @@ Subject: [PATCH] mtools: imported from OE
 Upstream-Status: Inappropriate [licensing]
 ---
  Makefile.in  | 11 ++++++-----
- configure.in | 27 +++++++++++++++++++++++++++
+ configure.ac | 27 +++++++++++++++++++++++++++
  2 files changed, 33 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 5db50d7..92ad461 100644
+index 7b305b0..70c8c74 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -26,10 +26,11 @@ USERCFLAGS =
@@ -38,11 +38,11 @@ index 5db50d7..92ad461 100644
  
  pdf: mtools.pdf
  %.pdf: %.texi sysconfdir.texi
-diff --git a/configure.in b/configure.in
-index 1de916e..fd6cb08 100644
---- a/configure.in
-+++ b/configure.in
-@@ -32,6 +32,33 @@ AC_CANONICAL_TARGET
+diff --git a/configure.ac b/configure.ac
+index de108a8..0fd9ef0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -33,6 +33,33 @@ AC_CANONICAL_TARGET
  AC_C_CONST
  AC_C_INLINE
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.45.bb b/meta/recipes-devtools/mtools/mtools_4.0.46.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.45.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.46.bb
index 34040d7a0d..1173718662 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.45.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.46.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "0b008a96bd0efe0e542fa4383d469af66bc4a93394990b103730a8160a67d618"
+SRC_URI[sha256sum] = "9aad8dd859f88fb7787924ec47590192d3abf7bad6c840509c854290d6bc16c0"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.43.0


