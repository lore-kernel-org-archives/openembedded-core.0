Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A97CA0EFF
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:19 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.6637.1756330217254706579
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ChpHlang;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-770522b34d1so1070452b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330216; x=1756935016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaNPdGywvn6ijFgg0y4iRAF9cSHw986QheYSU6n/Bqs=;
        b=ChpHlang1u/nH6k0nvLaQIa7QZK/pzq93A8ZZd71Ns1Sr4GCtAPgPdfYN8Fyn/vdPv
         MiO8jah6hUYHtQ/dXpUx2ZN0YJVIuS/ry5a2TbolC/qfLtJzRNcmaTHWfJse60D4T1XY
         0624oHFOlknLc3VkYws8IjzzHsHEbPIb3f6Cm1HSlJlGSn9t7dC2HAEetvJBeFVTb79Z
         yF4+pxnC2giV2cCyD1z55F1jFtQt5lyt6OaJA7wuhSiYrk2sP60Cl3UivJz9PM5Cg094
         xNz7mw5ZFTet3upSkARjPaj7ubSn212e5bAE64Tt/ay1PB/VGyqXuNlNYoy/NQ2MRlo4
         Bijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330216; x=1756935016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaNPdGywvn6ijFgg0y4iRAF9cSHw986QheYSU6n/Bqs=;
        b=rldYwCeLMqGA5DO0USI2rRt3QmlluigJA3wRLhCb6z/QYKikJ2My54ARYw6+IToq0x
         k+46kJfkQmdjUfUayeQReC7dicwUTKpdP9ZeyYY4ItKJ1dSrIxnxWzmyIWxhDCZuLyPD
         z5c7cqhnAGeDjfY3UxNpO4MGypz/Po1guacm5JJeBkrYwhR560PY4ehgNSFYWhkRwoLK
         RsTn1xLgGelE9UMZ63hPByqM2ScL4I89ldBFn15hRY4Kp/0JwyJlHouYb36rSglgrFe+
         pHoePEM+KczFFbDZ7XDrVHSMeE/RW0VGiu2xKh4F7IPRMrJtLx11PzFLIkQWNP5FBAH6
         oReA==
X-Gm-Message-State: AOJu0Yzj1zuQWYXJBOW6u2rweMh6pHBUth/6whhGg9oWr6GlEOpdfZUv
	ARjLUWfn3Vci/q9D9G/eadkXhMtQvjZD5ty+2KDz/lMU0QGUwq/vWOlLb+w/Sbkj0BbMjEEThGv
	134kS
X-Gm-Gg: ASbGncvrtlxIyM9KIqEPX1NEAOVe9+omViMRurlrU+NIA007IiaH+uH9iPeOkPu4P/v
	24uq1P/SliP9hfGMyDFFQFtChmwwAMWiCpGzBgJFGuqBms/o2XDcPL9kwUOzCzqF6vIrronoVA3
	3fljHgqv17k9o7nVUMvQAiGsJU+pgC8YRZqsFQYvjD1XuUk0BxBuiNGIbkBAZoj940mr1b28Y34
	+0bFdqn1rqScybpUw81108zEPL5Oxzqbi49XpQcNHD8HXEIMLUbqsIGHGEu/STKB6Z7q5E9OvFH
	qMemA/zncQ4FJhfYUzNEY7DrWxqAyCTTw7xeW6XWnGkKZJ6XISWrUSOzp1t87I/D5Bcx8/PXOKy
	EBe5qBUGD1l3vpg==
X-Google-Smtp-Source: AGHT+IF6UoFGkwff5mQYqN4MvLkt9cH3E/nDjKLl9QPv+ja/JyK767aEsFED069z4J7uuxuWHfLSvQ==
X-Received: by 2002:a17:902:c408:b0:23f:fa47:f933 with SMTP id d9443c01a7336-248753a2734mr93280755ad.8.1756330216371;
        Wed, 27 Aug 2025 14:30:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/33] vim: upgrade 9.1.1198 -> 9.1.1652
Date: Wed, 27 Aug 2025 14:29:20 -0700
Message-ID: <052fd7e55d2c73f13f63267fbfb5e39fa504baa3.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222521

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-53905, CVE-2025-53906, CVE-2025-55157, CVE-2025-55158.

Changes between 9.1.1198 -> 9.1.1652
====================================
https://github.com/vim/vim/compare/v9.1.1198...v9.1.1652

Refresh patches.

Disable newly introduced wayland support (in patch version 1485).
To this belongs also adding recursion in delete command for dir auto
which was newly failing as there is wayland directory inside now.
If someone is interested, this can be probably enabled, but without
additional work it results in compilation error due to function
redefinition conflicts.

(From OE-Core rev: e87d427d928234ef0441f9ce1fe8631fbe471094)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-src-Makefile-improve-reproducibility.patch  | 10 +++++-----
 .../vim/files/disable_acl_header_check.patch         | 12 ++++++------
 meta/recipes-support/vim/files/no-path-adjust.patch  |  2 +-
 meta/recipes-support/vim/vim.inc                     |  7 ++++---
 4 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch b/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
index 2fc11dbdc2..0741745adc 100644
--- a/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
+++ b/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
@@ -16,11 +16,11 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  src/Makefile | 14 ++++----------
  1 file changed, 4 insertions(+), 10 deletions(-)
 
-Index: git/src/Makefile
-===================================================================
---- git.orig/src/Makefile
-+++ git/src/Makefile
-@@ -3101,16 +3101,10 @@ auto/pathdef.c: Makefile auto/config.mk
+diff --git a/src/Makefile b/src/Makefile
+index 32c0d97d1..97c754673 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -3138,16 +3138,10 @@ auto/pathdef.c: Makefile auto/config.mk
  	-@echo '#include "vim.h"' >> $@
  	-@echo 'char_u *default_vim_dir = (char_u *)"$(VIMRCLOC)";' | $(QUOTESED) >> $@
  	-@echo 'char_u *default_vimruntime_dir = (char_u *)"$(VIMRUNTIMEDIR)";' | $(QUOTESED) >> $@
diff --git a/meta/recipes-support/vim/files/disable_acl_header_check.patch b/meta/recipes-support/vim/files/disable_acl_header_check.patch
index ee1ea0f390..2a5487e685 100644
--- a/meta/recipes-support/vim/files/disable_acl_header_check.patch
+++ b/meta/recipes-support/vim/files/disable_acl_header_check.patch
@@ -13,11 +13,11 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  src/configure.ac | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
-Index: git/src/configure.ac
-===================================================================
---- git.orig/src/configure.ac
-+++ git/src/configure.ac
-@@ -3292,7 +3292,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h strin
+diff --git a/src/configure.ac b/src/configure.ac
+index cdb818519..dafb7d6ce 100644
+--- a/src/configure.ac
++++ b/src/configure.ac
+@@ -3400,7 +3400,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h string.h \
  	sys/systeminfo.h locale.h sys/stream.h termios.h \
  	libc.h sys/statfs.h poll.h sys/poll.h pwd.h \
  	utime.h sys/param.h sys/ptms.h libintl.h libgen.h \
@@ -26,7 +26,7 @@ Index: git/src/configure.ac
  	sys/access.h sys/sysinfo.h wchar.h wctype.h)
  
  dnl sys/ptem.h depends on sys/stream.h on Solaris
-@@ -3974,6 +3974,7 @@ AC_ARG_ENABLE(acl,
+@@ -4137,6 +4137,7 @@ AC_ARG_ENABLE(acl,
  	, [enable_acl="yes"])
  if test "$enable_acl" = "yes"; then
    AC_MSG_RESULT(no)
diff --git a/meta/recipes-support/vim/files/no-path-adjust.patch b/meta/recipes-support/vim/files/no-path-adjust.patch
index 908459a95e..1b380393d8 100644
--- a/meta/recipes-support/vim/files/no-path-adjust.patch
+++ b/meta/recipes-support/vim/files/no-path-adjust.patch
@@ -18,7 +18,7 @@ diff --git a/src/Makefile b/src/Makefile
 index c9513a632..7a7cbdc43 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -2534,11 +2534,7 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_prefix) $(DEST_BIN) \
+@@ -2552,11 +2552,7 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_prefix) $(DEST_BIN) \
  		 rm -rf $$cvs; \
  	      fi
  	-chmod $(FILEMOD) $(DEST_TOOLS)/*
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index c7f3987134..2a9fda5376 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1198"
-SRCREV = "f209dcd3defb95bae21b2740910e6aa7bb940531"
+PV .= ".1652"
+SRCREV = "3e152c76adb9542af86760786d42a0beffe5354b"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
@@ -37,7 +37,7 @@ CLEANBROKEN = "1"
 # vim configure.in contains functions which got 'dropped' by autotools.bbclass
 do_configure () {
     cd src
-    rm -f auto/*
+    rm -rf auto/*
     touch auto/config.mk
     # git timestamps aren't reliable, so touch the shipped .po files so they aren't regenerated
     touch -c po/cs.cp1250.po po/ja.euc-jp.po po/ja.sjis.po po/ko.po po/pl.UTF-8.po po/pl.cp1250.po po/ru.cp1251.po po/sk.cp1250.po po/uk.cp1251.po po/zh_CN.po po/zh_CN.cp936.po po/zh_TW.po
@@ -76,6 +76,7 @@ EXTRA_OECONF = " \
     --disable-desktop-database-update \
     --with-tlib=ncurses \
     --with-modified-by='${MAINTAINER}' \
+    --with-wayland=no \
     ac_cv_small_wchar_t=no \
     ac_cv_path_GLIB_COMPILE_RESOURCES=no \
     vim_cv_getcwd_broken=no \
-- 
2.43.0


