Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E48FC87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 21:36:10 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.5256.1753392965053412240
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 14:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xRVJAAdj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-75ce8f8a3cdso1049950b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 14:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753392964; x=1753997764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3z9SldFNgT4ZI6OK1LZ29TPpvD4+RmFlODYbOy5Yt4w=;
        b=xRVJAAdjYT/1twDfX84eVLHlEHan/Uv+VkZd9P2uY1ua38XfbVLoFs15LUY+AGzqAc
         SastUqgOEZUwxiAf7Hze5TTI3+Xu4cRqJtIMUWQ1DWHAbsdX3BVkB5UMp5u0UHjS5fkj
         dLIShR2VJPWUT1qjrO6VNEjUqktkybu7YoOPcbJBtnVFTgWXoHVzdh8dvBHMs5KHJQK+
         cXQv/0ciBqPVxP7nfDqC50eLZWxVGIS8NU9D6KDJnKZst6LapR8mR4a5sQG9RzjhLP3+
         pTLh4+qipDCoBMwC3imQZ0jajRkmKC+66g25W4/ZLG15Vqx3ISwKM6yZif4VdFTiTJQt
         6J0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392964; x=1753997764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3z9SldFNgT4ZI6OK1LZ29TPpvD4+RmFlODYbOy5Yt4w=;
        b=TiSdxnVs577k2TFLYm9558jGFfq02NQtpqUrZ+GMrry/nZAat+UdgIpymnW/Gy4X/L
         w5gAM4xUIAJVLbSQVl4SXtoKYyZuuhxQRDbzO/+j/LOUtDak/jZpXLx/W8XSDwW8visW
         gqSSPgrHuTnSy3ZlEbQDd38FJOGSz1sb4QErH6L/mYpvzwPtJ1vnlun0F2D0XlpR4CG0
         qPzsSDOL+XpKLsDFRQ+HqTzGY52vgR0ZBKy87j8PuLRH9nyydArQSS6mXGkTcIcgG6HU
         Wz1FR+uxLlgj1fwkqffPRufQ17B1M7xs06RKhhqKnmWcSJR4DRU/TOFyDwBXeXSE8GsY
         UaPQ==
X-Gm-Message-State: AOJu0YzoitZas6pwljR9Ob1IVaTCmBkSL5vyogIiR91mEw66+lwmVXN+
	zmjcbevAXHKPj/W6ELG7Fh6eQxDfdqXgjpEEI4zR45tlV8bqiy5LfuIbnTxi1rT6ZrwMm09QOil
	2UNHD
X-Gm-Gg: ASbGncti14lyQOCR5iw3fFUhnvv6qDvadRLFB1dzMGLoJPpqoRRfVXhNmhg6WL91V8K
	UUhxP7l1I9q0HYw6OJ6YgR2WoklR0qxrJPu3Kj+DMz7Dyv13ObqaIBSU5hQYZJOTa5+HSo4MKJK
	m7zcxNudLtxfsVP0yjVxs4+UCPXlmTPCQTsGMj1L1+sgCR5AnUY9KccflZseDFunYwXNsRCAeG/
	kwM+Bwec3gqcCsOtQ+mm9gx2W2BgGxp7OvBtVs3Ka3rMaj9K8JCepT4oRzZ+m6VAhMtkpIcv5pm
	tFsYgG82FK9yd7raqZsmJMbpYGPxj2j+Gt9BOSO7ZQfRSbglAwnsmpdLmz16S3XeTQmnpRdKNb9
	PknjKpaoWio5+
X-Google-Smtp-Source: AGHT+IFE9N7wfIbcgpuGu8ARdLg8PISvCqbmMhcC9nCo8zoQj18TucMy5K3Iw6YaaYlN40i93y/cQA==
X-Received: by 2002:a05:6a21:1fc7:b0:239:23ef:41bc with SMTP id adf61e73a8af0-23d49146b88mr11999166637.41.1753392964221;
        Thu, 24 Jul 2025 14:36:04 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae158129sm2253735b3a.32.2025.07.24.14.36.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 14:36:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/16] mtools: upgrade 4.0.45 -> 4.0.46
Date: Thu, 24 Jul 2025 14:35:29 -0700
Message-ID: <57ce12a28781fa86ccf08df2b7da59d1b18a5295.1753392770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753392770.git.steve@sakoman.com>
References: <cover.1753392770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 21:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220886

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


