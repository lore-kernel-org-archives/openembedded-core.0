Return-Path: <Yash.Shinde.oss.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D944C5DF9D
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 16:45:46 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2072.1787589938013848963
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 09:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dm6aARA1;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: yash.shinde.oss.dev@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ccf2360620so33815895ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 09:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787589937; x=1788194737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e/+7JQ6peVrEd6mbxKJgTukKlgtwyD9OAUGbcgN+n7w=;
        b=dm6aARA1+N/+WKmJB7b++MqiYJs4vBwfLQHrqWJJL2UiTa0tDd2IIEMLMJ88LI8QkG
         coYYet0jUksLaGbSeENRzkPd22ePEcUiWhTyA13YhetUfRoGKiRfMegWuF0/mrqKj1bs
         HPMM9WZCaFqcjvKA3bFyeZRWC0qF1jTU3TO2TPzaFtDVkENHLJpKdSfUzJyArb/1LafR
         /PwAN89n+a/dFuCH2SiU1ClXdhHgBiyawPLSHgQhgzRAy/GX/SoNSzk9yh2/0VkNf+aT
         /rZTeY5F/Nqz3Q0DGvRV1xMKxmZOh/B47iLFYPQZmYgOhp5gbNY/7a7NQAzQx5nIgGS6
         x2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787589937; x=1788194737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/+7JQ6peVrEd6mbxKJgTukKlgtwyD9OAUGbcgN+n7w=;
        b=ijw830YBjev8WqltaLzCEH2l252jqKgri7KiTWXLo8/t738Pt20FIufNZVYVejq0gW
         Udt7LRBFADPT/2URnmSkl4E5ZfOWrZGFp1kFC5/Sx796aZlXMMX9Ru/dr6FZlsgi7ENi
         0tSRQ+MXyHm5yyqBwWNGtSrJjqL5u29gf8wKPxc6tMxyTWXjKdeq5/kjjTsojlsOSek1
         qrnevJAVrk88zrOaSoPyxqALGZTsH1kxJvB1Vd4qeWZvRpB4Sm8PEdux2IKA8WrwP3gc
         kaMrYTuc90ySf47kKT3wbSdo1hZDXza3IinM6Qjg+WaWzfX/TMb9z1W1QjZm/T0pLyD6
         z1Lw==
X-Gm-Message-State: AFuF++mFE5/JOXjPmmEd30uxx2ix79/Mu0h1GozGui5QGAha/krP3MyD
	Oo8fc+moZAjW0yHqjZc9bEBDCzOKCMFIuIfsm9vwN5rnbwkUeKtiQYxeUVtkrg==
X-Gm-Gg: AR+sD10WLdJWPRAHcr1vJy247x3MXwFpaZYAYDK71qP3Bf6+rz6C01ky+UPpOXtpc+R
	Z26UKy9jF1OgPbbZmKFdKg8H0GWU/TznI1fDEbivO9BEyiY3KSh7X/u0ErT8FYuZJRu+T4yKGXk
	nAtmUZQgDEovjphRx+NhiFh6QY8p0bJjigAFpTQxdVj5srvENOvfZbYlEqYNURBnVaDX6Wq98zf
	FVBsp3vUA8FNuth77cmdBqlrX4TM9EVQHFUTbdIqrozWUhxPSbpV0z8yX/8Te6IkKjSWmUyhc1j
	PXjVBuj7lh66lZe8TmQLiopA1EO2v7WVJaXl4I75zwdfPsFTrrGlm55hBlN07W91K8dSbhdr4co
	KugIPgHO4hEV+bJy+tTacYTF2LNtpjxHF+KBdD/JC8C8WI/ILBtekQD+e4xg/EM2LfJorWhiymb
	z+YXsX0PoKr9ju0kgF0qKW4HuTIM4Hm3pIIX+OzXJbSDTJ0Dl0vNvp0mxcs2zTXNO9VMZx/LG7O
	erhjw3xCGeslE2W4frz+eI=
X-Received: by 2002:a17:902:f790:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2d6dc6487a7mr12870745ad.0.1787589937356;
        Mon, 24 Aug 2026 09:45:37 -0700 (PDT)
Received: from QCOM-V9bhWph2GA.qualcomm.com ([103.172.209.30])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923f2c0sm41861615eec.30.2026.08.24.09.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 09:45:37 -0700 (PDT)
From: yash.shinde.oss.dev@gmail.com
X-Google-Original-From: Yash.Shinde.oss.dev@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
Subject: [PATCH 1/4] vim: upgrade 9.2.0843 -> 9.2.0993
Date: Mon, 24 Aug 2026 22:15:24 +0530
Message-ID: <20260824164527.296576-1-Yash.Shinde.oss.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 16:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244139

From: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>

Includes security fixes:
581a2f3ac patch 9.2.0847: [security]: vimball: code execution via .VimballRecord file
05c41c922 patch 9.2.0846: [security]: heap buffer overflow in set_sofo()
2f628d810 patch 9.2.0845: [security]: arbitrary Ex command execution during C omni-completion
f8126294a patch 9.2.0844: [security]: use-after-free on json decode error

For full comparison of changes, see:
https://github.com/vim/vim/compare/v9.2.0843...v9.2.0993

Signed-off-by: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
---
 .../0001-src-Makefile-improve-reproducibility.patch    |  6 +++---
 .../vim/files/disable_acl_header_check.patch           | 10 +++++-----
 meta/recipes-support/vim/files/no-path-adjust.patch    |  9 +++------
 meta/recipes-support/vim/vim.inc                       |  4 ++--
 4 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch b/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
index ae78059296..8fbce41d1d 100644
--- a/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
+++ b/meta/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
@@ -1,4 +1,4 @@
-From 133ab27cdb17ca20ef6b0304cf30621d2bcbe757 Mon Sep 17 00:00:00 2001
+From f8d147b328ae37a99b6804d5d127d91c905b7ca4 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Thu, 31 Jan 2019 21:32:26 -0800
 Subject: [PATCH] src/Makefile: improve reproducibility
@@ -17,10 +17,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 4 insertions(+), 10 deletions(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 32c0d97d1..97c754673 100644
+index 98baecf6f..ee64d987b 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -3143,16 +3143,10 @@ auto/pathdef.c: Makefile auto/config.mk
+@@ -3201,16 +3201,10 @@ auto/pathdef.c: Makefile auto/config.mk
  	-@echo '#include "vim.h"' >> $@
  	-@echo 'char_u *default_vim_dir = (char_u *)"$(VIMRCLOC)";' | $(QUOTESED) >> $@
  	-@echo 'char_u *default_vimruntime_dir = (char_u *)"$(VIMRUNTIMEDIR)";' | $(QUOTESED) >> $@
diff --git a/meta/recipes-support/vim/files/disable_acl_header_check.patch b/meta/recipes-support/vim/files/disable_acl_header_check.patch
index b34f91c9b6..85b916a10c 100644
--- a/meta/recipes-support/vim/files/disable_acl_header_check.patch
+++ b/meta/recipes-support/vim/files/disable_acl_header_check.patch
@@ -1,5 +1,5 @@
-From 5ed25c076a1fb1889a3c50dddf29f21850b59a13 Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com> 
+From a07692b142c757bb4547695d8f1fd77b87b43cd8 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Tue, 26 Jun 2018 17:29:09 +0800
 Subject: [PATCH] disable acl header check
 
@@ -14,10 +14,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/configure.ac b/src/configure.ac
-index cdb818519..dafb7d6ce 100644
+index a3d06d0e8..910c8ac48 100644
 --- a/src/configure.ac
 +++ b/src/configure.ac
-@@ -3440,7 +3440,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h string.h \
+@@ -3555,7 +3555,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h string.h \
  	sys/systeminfo.h locale.h sys/stream.h termios.h \
  	libc.h sys/statfs.h poll.h sys/poll.h pwd.h \
  	utime.h sys/param.h sys/ptms.h libintl.h libgen.h \
@@ -26,7 +26,7 @@ index cdb818519..dafb7d6ce 100644
  	sys/access.h sys/sysinfo.h wchar.h wctype.h)
  
  dnl sys/ptem.h depends on sys/stream.h on Solaris
-@@ -4182,6 +4182,7 @@ AC_ARG_ENABLE(acl,
+@@ -4297,6 +4297,7 @@ AC_ARG_ENABLE(acl,
  	, [enable_acl="yes"])
  if test "$enable_acl" = "yes"; then
    AC_MSG_RESULT(no)
diff --git a/meta/recipes-support/vim/files/no-path-adjust.patch b/meta/recipes-support/vim/files/no-path-adjust.patch
index 541f022863..b2e98a2955 100644
--- a/meta/recipes-support/vim/files/no-path-adjust.patch
+++ b/meta/recipes-support/vim/files/no-path-adjust.patch
@@ -1,4 +1,4 @@
-From 4125a1ccb82fd53d003acdc34e462f238f0c4f0d Mon Sep 17 00:00:00 2001
+From 58cbbb08f33f3718b599b967e6a028669b3cf67f Mon Sep 17 00:00:00 2001
 From: Joe Slater <joe.slater@windriver.com>
 Date: Fri, 8 Jul 2022 11:03:22 +0800
 Subject: [PATCH] vim: do not adjust script pathnames
@@ -15,10 +15,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index c9513a632..7a7cbdc43 100644
+index ee64d987b..653e21926 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -2531,11 +2531,7 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_prefix) $(DEST_BIN) \
+@@ -2589,11 +2589,7 @@ installtools: $(TOOLS) $(DESTDIR)$(exec_prefix) $(DEST_BIN) \
  		 rm -rf $$cvs; \
  	      fi
  	-chmod $(FILEMOD) $(DEST_TOOLS)/*
@@ -31,6 +31,3 @@ index c9513a632..7a7cbdc43 100644
  	-chmod $(SCRIPTMOD) `grep -l "^#!" $(DEST_TOOLS)/*`
  
  # install the language specific files for tools, if they were unpacked
--- 
-2.25.1
-
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 6f3ef9d6c8..29efe6fb0a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://no-path-adjust.patch \
            "
 
-PV .= ".0843"
-SRCREV = "975e191dc817d8d00abca7197c4529a417c2f805"
+PV .= ".0993"
+SRCREV = "ffce1ce58dd3d08110c35c8af61ad2555b344569"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.43.0


