Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AE1C433EF
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 09:41:59 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.14950.1658655711445569677
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 02:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=br8e84df;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id v5so5131201wmj.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 02:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J5kjlmTfq+diHlebZAhc4iVPPZZj085tknfMGa9HVpQ=;
        b=br8e84df3pP915jVWuNmc8dLfPQ7UMdpNO8m5PnTlH29EFHxQAFrRP+IE6L53vVmH3
         zo3OMuTiQmH+Ov7FbhyrC6TZVFBbf1bB7QeKT8zANLt+VhwICpn8h/IIo34oENq2yEX6
         TeWnURpAsV6UohV3ntMdL/xsDqGK9Q1e4RWnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J5kjlmTfq+diHlebZAhc4iVPPZZj085tknfMGa9HVpQ=;
        b=yDFqAxkhmxx1s3EdKakvfLHHrblcF0PRznWXvj0kk4/tdGS+cx68SbvU1bLsoIhLow
         9rmFKkRzAPEVRp/MSHSeeijyCa1Ny+8qENZiHXevuVPD96Tx2yCm6RTfv/8lmSQYlPNX
         a56527FZUg9NxTYwW+9GLWPBY4nzlXF7fAkehfQEjDq9SOAGA2SZdF6DgTfzKFIREH99
         FXc1lvOOiu0sCIvUK/UCoeyaNUz3kuNw27+gJbGZ+LF6V6pv/qqpbi62UFj07oW+eotR
         2blCUqXO/5XxpV2usR3UuE/ojaFh013o+GN02aCrwTJ1n0khB5HoIAMRRwArnCU3E4rj
         C2XA==
X-Gm-Message-State: AJIora89Z5PD6amVDh0jepDH7hvB27jQeUE1BHIxhgrbkZDf+5T3NbkL
	eFCacTXXlnm5mBwGjZJl5K4Pu3+fazpzVA==
X-Google-Smtp-Source: 
 AGRyM1v57XARs1eS0ZrPxhD84eTHW5XOce1r0iHHXkwg6qAHowNhSedO+iXGqFQqtQTwPsfRNZg6cg==
X-Received: by 2002:a05:600c:a4c:b0:39c:6517:1136 with SMTP id
 c12-20020a05600c0a4c00b0039c65171136mr5185210wmq.12.1658655708915;
        Sun, 24 Jul 2022 02:41:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a49:d7f2:fe29:16f8])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b003a2d6f26babsm11013551wms.3.2022.07.24.02.41.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 02:41:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: Upgrade 9.0.0021 -> 9.0.0063
Date: Sun, 24 Jul 2022 10:41:45 +0100
Message-Id: <20220724094145.1926740-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Jul 2022 09:41:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168449

Pulls in several CVE fixes.
Added a patch to avoid timer_create cross compile issue (and submitted upstream).
Also submit the race fix upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../vim/files/crosscompile.patch              | 51 +++++++++++++++++++
 meta/recipes-support/vim/files/racefix.patch  | 12 +++--
 meta/recipes-support/vim/vim.inc              |  6 ++-
 3 files changed, 63 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-support/vim/files/crosscompile.patch

diff --git a/meta/recipes-support/vim/files/crosscompile.patch b/meta/recipes-support/vim/files/crosscompile.patch
new file mode 100644
index 00000000000..583d3fc7b01
--- /dev/null
+++ b/meta/recipes-support/vim/files/crosscompile.patch
@@ -0,0 +1,51 @@
+configure.ac: Fix create_timer solaris test for cross compiling
+
+A runtime test was added for create_timer however this meant cross compiling
+would no longer work. Allow a cache value to be specified to allow cross
+compiling again.
+
+Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
+
+Upstream-Status: Submitted [https://github.com/vim/vim/pull/10777]
+
+Index: git/src/configure.ac
+===================================================================
+--- git.orig/src/configure.ac
++++ git/src/configure.ac
+@@ -3814,7 +3814,7 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
+ dnl Check for timer_create. It probably requires the 'rt' library.
+ dnl Run the program to find out if timer_create(CLOCK_MONOTONIC) actually
+ dnl works, on Solaris timer_create() exists but fails at runtime.
+-AC_MSG_CHECKING([for timer_create])
++AC_CACHE_CHECK([for timer_create], [vim_cv_timer_create],
+ save_LIBS="$LIBS"
+ LIBS="$LIBS -lrt"
+ AC_RUN_IFELSE([AC_LANG_PROGRAM([
+@@ -3831,7 +3831,7 @@ static void set_flag(union sigval sv) {}
+   if (timer_create(CLOCK_MONOTONIC, &action, &timer_id) < 0)
+     exit(1);  // cannot create a monotonic timer
+   ])],
+-  AC_MSG_RESULT(yes; with -lrt); AC_DEFINE(HAVE_TIMER_CREATE),
++  AC_MSG_NOTICE(timer_create with -lrt); vim_cv_timer_create=yes,
+   LIBS="$save_LIBS"
+   AC_RUN_IFELSE([AC_LANG_PROGRAM([
+ #include<signal.h>
+@@ -3847,8 +3847,16 @@ static void set_flag(union sigval sv) {}
+     if (timer_create(CLOCK_MONOTONIC, &action, &timer_id) < 0)
+       exit(1);  // cannot create a monotonic timer
+     ])],
+-    AC_MSG_RESULT(yes); AC_DEFINE(HAVE_TIMER_CREATE),
+-    AC_MSG_RESULT(no)))
++    vim_cv_timer_create=yes,
++    vim_cv_timer_create=no),
++    AC_MSG_ERROR(cross-compiling: please set 'vim_cv_timer_create')
++    )
++)
++
++if test "x$vim_cv_timer_create" = "xyes" ; then
++  AC_DEFINE(HAVE_TIMER_CREATE)
++fi
++
+ 
+ AC_CACHE_CHECK([whether stat() ignores a trailing slash], [vim_cv_stat_ignores_slash],
+   [
diff --git a/meta/recipes-support/vim/files/racefix.patch b/meta/recipes-support/vim/files/racefix.patch
index 1cb8fb442ff..34bd37d650d 100644
--- a/meta/recipes-support/vim/files/racefix.patch
+++ b/meta/recipes-support/vim/files/racefix.patch
@@ -1,9 +1,13 @@
+po/Makefile: Avoid race over LINGUAS file
+
 The creation of the LINGUAS file is duplicated for each desktop file
-which can lead the commands to race against each other. Rework
-the makefile to avoid this as the expense of leaving the file on disk.
+which can lead the commands to race against each other. One target might
+remove it before another has been able to use it. Rework the makefile to
+avoid this as the expense of leaving the file on disk.
+
+Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
 
-Upstream-Status: Pending
-RP 2021/2/15
+Upstream-Status: Submitted [https://github.com/vim/vim/pull/10776]
 
 Index: git/src/po/Makefile
 ===================================================================
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 7e2c624bc11..1e86306ce92 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,10 +19,11 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
            file://racefix.patch \
+           file://crosscompile.patch \
            "
 
-PV .= ".0021"
-SRCREV = "5e59ea54c0c37c2f84770f068d95280069828774"
+PV .= ".0063"
+SRCREV = "d61efa50f8f5b9d9dcbc136705cc33874f0fdcb3"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
@@ -88,6 +89,7 @@ EXTRA_OECONF = " \
     vim_cv_getcwd_broken=no \
     vim_cv_memmove_handles_overlap=yes \
     vim_cv_stat_ignores_slash=no \
+    vim_cv_timer_create=yes \
     vim_cv_terminfo=yes \
     vim_cv_tgetent=non-zero \
     vim_cv_toupper_broken=no \
-- 
2.34.1


