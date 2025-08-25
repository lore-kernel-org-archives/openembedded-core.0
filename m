Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FD7C8303F
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 19:32:50 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.47699.1756150361709610118
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 12:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=UiCDfHTu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202508251932394213ef40ef2345fe32-w0ojbn@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202508251932394213ef40ef2345fe32
        for <openembedded-core@lists.openembedded.org>;
        Mon, 25 Aug 2025 21:32:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=PNAPbuQtUyyWWndEy0FFt5mQk8rht4DZ1Lxf2VIayBg=;
 b=UiCDfHTuNQ9H/MlupNbrlsgb+FmaAqzrLm9kHmvdbZWKz1kQ6R2wEKK0Gf1/V02A6hqhxk
 EHLjMcem2lHkuyb+Lv2Veep0i12JWLVkX7sZ+TYUoRrLZWm1o6nC3NJKAt4qJY1pynfDINil
 F5bTFRvwmX6dKMV4r3Mkh0CFvlddbYXFAJzz+5w7LWoVcHlmWv/Op6yPZzLrwa+iSx3fOLTt
 5VbH8eJegDEGWfhuLDjbP6l7qSCLJ10KKXgC+prMnACEPLkQeQFfTrpXlpBIlIyRfyllXD9k
 RE0j/dPgWVGpusS0b7FWP4hDwEHPtOpEt6GDczdQ7SPnElllsEFBksvA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH] vim: upgrade 9.1.1198 -> 9.1.1652
Date: Mon, 25 Aug 2025 21:31:51 +0200
Message-Id: <20250825193151.813751-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 19:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222420

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

