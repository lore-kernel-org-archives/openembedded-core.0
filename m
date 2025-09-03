Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FF7CA1015
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 16:15:23 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.17055.1756916117074101320
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 09:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xbGQH82g;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b4c29d2ea05so887511a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 09:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756916116; x=1757520916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaNPdGywvn6ijFgg0y4iRAF9cSHw986QheYSU6n/Bqs=;
        b=xbGQH82gKUfTRKpWCVNRUsqeAPkb9xq6wIr9g2OmdOZa2X8tpS3PLEAlTZDtfol1Y1
         gLEQwrPsgWtWMXqwfgNshN/4+KBnpIpYdT7kK4bLxxFDY0guKr3RrOU99LvKesAJcwqr
         37lvj6SuOC/RYZ/0bulCV0G8zkWyMuzvt08Q400Ewss/nTyBt9QpaDu+iqdHFMo3Iik6
         btIC5k2TTZWTaaxZhmZ/uCmVe1eidr76WrFdL6zO8vx/jyjrafoLsjRka91StgptHZIv
         Co2oW48PHt4NYLvB+LIZiXm0TPWbHq6MG+Svv1TcXYLaQBbiH3yOR6jJzfVDsc3O07c/
         KWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916116; x=1757520916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaNPdGywvn6ijFgg0y4iRAF9cSHw986QheYSU6n/Bqs=;
        b=c+TD/05SnnR/nQVKVaZNFeR8FPvjGN6Yu4hgg4ooogOnIYGW5VxsfEp8ZIPQ3UVF/t
         qHG3JMPcUv21OgsFo0oMXGpi6P9PL2JBrfq2VvlIHX+PcwODRLLKmbQY1DUQBKUM81+Q
         3mjCLLkUEnsbJZ9lFO/Ns1iuj9EPDpNqHJgqLA3a7glCSCuMoBlbfPLECUnqWFgGWVaa
         mQJZU/jRLdbWHPNfBXUaRHv1WemPM/AEIyMyGulshwulu40q1002AJiE2tcj93bbVBXt
         i+P8nlNu+sq1hrUzCPoEfw9C6NJxJwlxNFl8PbuiZGnoFYIcds0lH4PeVR6R7n3zTDHe
         SAYg==
X-Gm-Message-State: AOJu0YyYkjuLhjsQYqa1JnBCtXLqVxQ6mCjgAFa/lx+y/ORCq0cubO78
	x4W5UUpRvLHx7ESPSVLCIJ5gOl96HbPDVU35aoi6RaURjYZUV6xwLAR3lcIZcWJ/PmsF3nxXwVC
	HXxgI
X-Gm-Gg: ASbGncuoz30D7jd/3LW0rPJLP288YvARuHU8OWMnWKcllu2FnI23RAeH5zK0i3WWIh0
	aiqp3cxRsCOyUR4JWrEUAxrvdxWO285i7/W2zG/p7gM97g4Y7nnZQvf7HiU9BHir0rlCiEYQB3w
	5M/Er0zlaPSduGhljr/3UtXD47YMHHVMWRUMgIIu7hrOmPzKemEr8BpCs8vy/QVX1maj67NY4Ou
	na4+SFqe32V6wyvyJehYT+A/BUy57JMvq/re6OQc8y7AKCOlrZlLSMHM7c92+6mXqczy+AMnmjs
	P+DUjXtWgte9ccSPVld1ulWkl7wSWv7rnMeitT+oNENhd1XngSIcmEH2S8Tq8TbKBbP3FdHTz/D
	TRnTy7up3axTrASwam8mp6UdhIDX8Ems7ofw=
X-Google-Smtp-Source: AGHT+IFz0lilEJTstQcvqOhpe9pGE601g8V8bhT0+pjFnXBSzg/FVzvkVNB2IDGdnyKIwf2uDG+w3A==
X-Received: by 2002:a17:90b:2d8c:b0:32b:6132:5f99 with SMTP id 98e67ed59e1d1-32b61326264mr3470797a91.15.1756916115843;
        Wed, 03 Sep 2025 09:15:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:9ffe:4bb4:e2b3:4b1c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7724f079b88sm11027602b3a.40.2025.09.03.09.15.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:15:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/9] vim: upgrade 9.1.1198 -> 9.1.1652
Date: Wed,  3 Sep 2025 09:14:56 -0700
Message-ID: <bd2dc808baec7e940a09f80afa2c2997efe7cbfe.1756915922.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756915922.git.steve@sakoman.com>
References: <cover.1756915922.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 16:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222871

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


