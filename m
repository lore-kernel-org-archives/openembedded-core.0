Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAD5C41513
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:46:21 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.15469.1721310372611343028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 06:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ix0jo9C1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fc569440e1so8070545ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721310372; x=1721915172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=taojYMmopKFbFtoZnXIOurpQxIdLa7+0KAi0VAvC9eU=;
        b=ix0jo9C1TSU2ixP3xZ8XylOzPncBtTolcYrNYjWBYluNMB98hb6LykUTBtX52kl16y
         iE9MolaQRh3Hn6zex8NGG3o5wAxaZLYk7DLK3jxJwo6y6puZIt6ernRCfijj2xCChQk9
         SqG33GJwQQ0YozhstCyaI/8jgjgPlWcL0uftxulxWoB8gMQ+NZ+LnXLjRmn2QddC8+4H
         Xd0vMZBYT13/vCZ8TbdLjtrXprqf5JQq0DJ7yiVpa3zvZsVA2D2OadpfrUmfPziK0LKa
         ZdMvFvquCPymwwijZq4HWtlS/GgMvH35qFjhGX8Ry3nBg4f6OP/OrNXa3+jp/B9w3P+U
         allg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721310372; x=1721915172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=taojYMmopKFbFtoZnXIOurpQxIdLa7+0KAi0VAvC9eU=;
        b=icrfRXlR0znuHSexRmWHcBX7/1i9eaT/IJSq0M7SQ49z/7MyS/mRuCD/hLyqnbooBT
         c/AH+H9RRQAptacv7rOJo/e2x6ht+z5FWvuyiKPc7REVskbxt7DglVmd3YPqbxO0ioSd
         uZkvUoYQnxSCSj6/aMD48Eu3/LkQn1yCgj5jDMkI9e38QxOt9yMaW4T7JBQgc/ka7RlY
         Kfd/pp7GZDY+/ROx1v1pBy1z87WYNH370UW5bS8AoQy2qqhGTG+i9FgdrzIY91IHuWH5
         6GBLw84gxAaN/AdbLvk3nzwJLBWDPq5M8diDIoMT0FCzWdsWtoR5JqChi5RyUCz8RbRz
         F6Tw==
X-Gm-Message-State: AOJu0YytWIiWPYlP8ArrMve9aIZ1pbq6hHVSWgZH5KZZDTZV3B9/hMVy
	69vYwnA2YbQi2Wm/a08WtdClQSKyl6KTJ9EeNH9SOt26Dm317SyhLHwZ1XEnrkT+jCZ8AXk8M/N
	p
X-Google-Smtp-Source: AGHT+IEGYvO9RDkLDZGryp4+69F/bW3KDJe5D+v6Y+PROWXajCt9JkJw6PKUT4i3abCb5gBHAJ5vYg==
X-Received: by 2002:a17:902:e846:b0:1fb:5f82:6a5d with SMTP id d9443c01a7336-1fc4e55ccfbmr47686995ad.21.1721310371840;
        Thu, 18 Jul 2024 06:46:11 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb6ffbdsm93366985ad.60.2024.07.18.06.46.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:46:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/12] gettext: fix a parallel build issue
Date: Thu, 18 Jul 2024 06:45:39 -0700
Message-Id: <d6dfb80961762c2971172cb29fa6911d6a93e42f.1721310237.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721310237.git.steve@sakoman.com>
References: <cover.1721310237.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 13:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202223

From: Changqing Li <changqing.li@windriver.com>

Occasionally, gettext will build failed with error:
In file included from ../../../gettext-0.22.5/gettext-runtime/intl/gettextP.h:71,
                 from ../../../gettext-0.22.5/gettext-runtime/intl/log.c:24:
./libgnuintl.h:98:1: error: unterminated comment
   98 | /* The user can define _INTL_RE
      | ^
./libgnuintl.h:17: error: unterminated #ifndef
   17 | #ifndef _LIBINTL_H

In file included from ../../../gettext-0.22.5/gettext-runtime/intl/gettextP.h:71,
                 from ../../../gettext-0.22.5/gettext-runtime/intl/langprefs.c:25:
./libgnuintl.h:98:1: error: unterminated comment
   98 | /* The user can define _INTL_RE
      | ^
./libgnuintl.h:17: error: unterminated #ifndef
   17 | #ifndef _LIBINTL_H

It is a parallel build issue caused by missing dependencies, backport
patch to fix it.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e18fc96f9d4c0a0525c21371d3f36e8dfe008b35)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-intl-Fix-build-failure-with-make-j.patch | 35 +++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.22.5.bb   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch

diff --git a/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch b/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch
new file mode 100644
index 0000000000..144259dd3f
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with-make-j.patch
@@ -0,0 +1,35 @@
+From 97a6a63ad61949663283f5fad68c9d5fb9be1f15 Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Tue, 12 Sep 2023 11:33:41 +0200
+Subject: [PATCH] intl: Fix build failure with "make -j".
+
+Reported by Christian Weisgerber <naddy@mips.inka.de> at
+<https://lists.gnu.org/archive/html/bug-gettext/2023-09/msg00005.html>.
+
+* gettext-runtime/intl/Makefile.am (langprefs.lo, log.lo): Depend on gettextP.h
+and its subordinate includes.
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commit;h=97a6a63ad61949663283f5fad68c9d5fb9be1f15]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ gettext-runtime/intl/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gettext-runtime/intl/Makefile.am b/gettext-runtime/intl/Makefile.am
+index da7abb758..9e56978bc 100644
+--- a/gettext-runtime/intl/Makefile.am
++++ b/gettext-runtime/intl/Makefile.am
+@@ -387,8 +387,8 @@ dngettext.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo
+ ngettext.lo:         ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
+ plural.lo:           ../config.h $(srcdir)/plural-exp.h $(PLURAL_DEPS)
+ plural-exp.lo:       ../config.h $(srcdir)/plural-exp.h
+-langprefs.lo:        ../config.h
+-log.lo:              ../config.h
++langprefs.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
++log.lo:              ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
+ printf.lo:           ../config.h
+ setlocale.lo:        ../config.h $(srcdir)/gettextP.h libgnuintl.h $(srcdir)/gmo.h $(srcdir)/loadinfo.h
+ version.lo:          ../config.h libgnuintl.h
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/gettext/gettext_0.22.5.bb b/meta/recipes-core/gettext/gettext_0.22.5.bb
index 1a66d37916..7eeb1a86fd 100644
--- a/meta/recipes-core/gettext/gettext_0.22.5.bb
+++ b/meta/recipes-core/gettext/gettext_0.22.5.bb
@@ -28,6 +28,7 @@ SRC_URI += " \
            file://serial-tests-config.patch \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
            file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
+           file://0001-intl-Fix-build-failure-with-make-j.patch \
            "
 
 inherit autotools texinfo pkgconfig ptest
-- 
2.34.1


