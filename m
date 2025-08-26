Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54708CA0EFA
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:26 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.64600.1756215677940001765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l1/SzODb;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-324e6daaa39so5239472a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215677; x=1756820477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVWM5nvpRbK5Rk5kIa4HzE3NR3DfArEMZ17pUMBCKEU=;
        b=l1/SzODbRwIlaFREg2Odrm7NCIyY66RuHa1KbIwkvd4UPJ+uwKlb0Z5Oi049nKs/5z
         erZKUbb0KKpZP5NykU7m5L8BtsDaK2a2PKNJ8D+zQCSre5P5/xEkUbGyAhyDFTwq9j+n
         doVQFKndZtTQ5qvww3ZJgrPTJfryV/oQ55fyByM4liS0LC6QKOVq5JqyfmxMhUj2PcOt
         XfNyGeopXyEkYjKw0rUERN4QtvAq9RJzfDg+m02fZYHNjgAZso6nRYOL5Puh1pkOzzFG
         umP8RyXeG3viFDMapvbCOaojNSKwrzg7y81ZnmDenQLre6xZvuxjNlXUUIwoKo1CZA61
         oPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215677; x=1756820477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVWM5nvpRbK5Rk5kIa4HzE3NR3DfArEMZ17pUMBCKEU=;
        b=lv3Rww7UW7XyFn5vHUWeO4xe1/5zsdCeP/cxmpCMqOzqcG+dXDaUEa//OePTHOuLm8
         J4dWI9YVtOw3zt7kJUPtOyKkP2TeiH46eJCC/WCiNMI+hAYehkxZp03OD36DiHD+cWqP
         ibz/oK1XjNt4VkK4RVFh8nSijkVPhs7EJ5pfswRHj4H4zC5sBjPXIqy6TjT86XGxPRo+
         vg/56QLFS0Qs/jyiZneS6Uu0yzywc/OzZ3N47cYAngp5nZXd+BNoQJDtOIybEnh9zec7
         oHI2Vc/wuoDlnjqcOGuMC8imTzj6pf3OK7/h7mSrsx5xZw/B7IiW+9DeptsCMrmBIR0v
         sXcA==
X-Gm-Message-State: AOJu0YxvsJz/mofRlj2SzQ0XcYPYPDHxGAQ7EC0Xg6uUkrpwwwRAnkwv
	k9ok89fEvrSnvZabsyrhnbpeTlbr9PYKQUmvP8VhORhW+EVqNUrE1nIpXhAs+agv+GoaW9cL6iB
	wy0lg
X-Gm-Gg: ASbGncuylgRashVbkiG65D9RDI/cL/xLcIVTofVj1T4RK1kamsrsvMAovvMEVikuyfh
	nFLr1qWrMCiDeXim7o03d56EuDm7+rXsrOxRn2HaPPalbMvA+1qQFCuyQYhIUUfERYHWnhL2BPi
	bdQgFsh1TG6rCX4OhcUy+JV53uPBqHdInnm0S/sqpj2gpYOAN167FFj3Pjn5TBqLbHmyU/1F/ph
	oVYBzWB42IE3PdkQvgGvbP/WVvQE3wkfJJ2GCtHdx/Lf1A8mgwale373q8iZweHz1OHBq29oKHY
	SEydvR1hYXBgr+tVSS+g1907LP0TzuqCsWpCzy23OrHUdiLpDpzPQYQzOgiCva8UB8gYIZ+4Tw7
	+F8TEULn7YEzcWDOG+zebWyav
X-Google-Smtp-Source: AGHT+IEl4QkKMcxIWFMcCTpLNBBl5lvVAlpwUn83fRmIngnYewf2H6GAKXEWHmxYEbq0xlq1oou9XQ==
X-Received: by 2002:a17:90b:3c47:b0:31f:3c3:947c with SMTP id 98e67ed59e1d1-32515e412bdmr20603418a91.10.1756215676949;
        Tue, 26 Aug 2025 06:41:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 07/19] vim: upgrade 9.1.1198 -> 9.1.1652
Date: Tue, 26 Aug 2025 06:40:41 -0700
Message-ID: <99e24ba524157ed70ad05b0b1a14fcca8df52246.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222447

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
index b39cfadaad..c33cb09281 100644
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


