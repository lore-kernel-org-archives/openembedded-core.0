Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF378C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 06:02:59 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.18574.1680156178414542778
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 23:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oEWET3u+;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: badganchipv@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so18545665pjz.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 23:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680156178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p8Elc8x6kyPJ/+JUttWKMt/wb8XmRNYTOftEDhHy6YM=;
        b=oEWET3u+z3tViaSSYd/7L9v1poV/ew1Pz1naJqhdTrQhRnFy2FQ6yCYnutmG76xSDn
         rZXrHS6GYkxd7oyWpJ8V9k7gMIMuLci00IHA+dInIuZ7j9Z7MTm7mHEzZL/Jtv2xF1D/
         p0qmXP4XWXme9uPTO8A+WQpbHJ9LMiBCCmFOziu3lc9dEvmq6RwrqmgOrPm8gCgmqDGS
         FXB+vAKsq/UuyHniW8UxPTStAMCAt82RMsLhzdeCbG2raLvbiFHritt9vukpuQbua8xu
         EBL/750WCTOuweBJ5sXqCQcCwsPUUbfe/83rpqiwl2AyYKhg2nMKzcdM/nvgtpZTgnKp
         d+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680156178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8Elc8x6kyPJ/+JUttWKMt/wb8XmRNYTOftEDhHy6YM=;
        b=5Vt5IgUtlnSgrsR3MNLvWM06WGFXCbQ+wNYSgMQPNHLvbdGAPQhmkoBL15/51bUc/p
         BwS7Oeff8+iSMBmip9yCSUQFzSn2R5Dl52NNoechwMd3hNHzVf9ncvLg3LL4bp5ZCvYr
         letqmrL9njNtTPqIgTjHWVgIGh6xi0XpHrIN4frXof6JW2aAQaJgwha4WfvcZbbVv21J
         hoIlnFD2zbK55V5H72x7vouOnfeiCnSY7HXFnunn4+lpNhUQuizFTV1zvuazBFXpYLz9
         0btc8ouDYfZnH6o8o3SWMLC0HkCjpikInPkZsrx3yLm1x/P9+o8BTZA7HIQzN3u0Bhji
         FKiQ==
X-Gm-Message-State: AAQBX9eQPXqAWGmP9s74wwQCX2LIQNcoNHB/8mpgVz4bepsbbbrbwt3G
	zwI51qXMS+V75LkhWtNUGaKGo+z8zmea0g==
X-Google-Smtp-Source: AKy350aBQyiuR6oMuPBWbdi3k5cuMHLNe0edpr20TZ6/cJIw9Y3w/Sad91qrjMLhlbXKHAQgBte+Cw==
X-Received: by 2002:a17:90a:4bca:b0:23d:2d91:ab71 with SMTP id u10-20020a17090a4bca00b0023d2d91ab71mr23809596pjl.6.1680156177507;
        Wed, 29 Mar 2023 23:02:57 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c2d:7ffa:ed57:edb6:bb36:e481])
        by smtp.gmail.com with ESMTPSA id q9-20020a17090ad38900b002340d317f3esm2378511pju.52.2023.03.29.23.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 23:02:57 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta][kirkstone][PATCH] rsync: Turn on -pedantic-errors at the end of 'configure'
Date: Thu, 30 Mar 2023 11:32:40 +0530
Message-Id: <20230330060240.8567-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 06:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179302

From: Khem Raj <raj.khem@gmail.com>

This helps in building rsync without autoconf patch, since it will be a
while that the round trip is made, better to apply this patch here until
next release of autoconf.

(From OE-Core rev: 11522b98697befcf13076a90cec4f8ade1fa0645)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8d6b8fb0863d81f60f8a8b53c3b5b4676d508965)
Signed-off-by: pawan <badganchipv@gmail.com>
---
 ...-prototypes-to-function-declarations.patch | 31 +++------
 ...antic-errors-at-the-end-of-configure.patch | 68 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.5.bb    |  1 +
 3 files changed, 80 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index 629b786d62..474d82db22 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,6 +1,6 @@
-From 704a240443ca5d8024cc3b01ae6c1440fa41f54a Mon Sep 17 00:00:00 2001
+From 785c0072c80c2f6e0839478453cf65fdeac15da0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 16 Aug 2022 23:42:24 -0700
+Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
 
 With Clang 15+ compiler -Wstrict-prototypes is triggering warnings which
@@ -18,8 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  checksum.c       | 2 +-
  exclude.c        | 2 +-
- hlink.c          | 2 +-
- lib/compat.c     | 1 +
+ hlink.c          | 3 +--
  lib/pool_alloc.c | 2 +-
  log.c            | 2 +-
  main.c           | 2 +-
@@ -27,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  zlib/crc32.c     | 2 +-
  zlib/trees.c     | 2 +-
  zlib/zutil.c     | 4 ++--
- 11 files changed, 13 insertions(+), 12 deletions(-)
+ 10 files changed, 12 insertions(+), 13 deletions(-)
 
 diff --git a/checksum.c b/checksum.c
 index fb8c0a0..174c28c 100644
@@ -56,30 +55,19 @@ index adc82e2..79f5a82 100644
  	if (partial_string_buf) {
  		free(partial_string_buf);
 diff --git a/hlink.c b/hlink.c
-index 66810a3..aea142b 100644
+index 66810a3..6511dfb 100644
 --- a/hlink.c
 +++ b/hlink.c
-@@ -117,7 +117,7 @@ static void match_gnums(int32 *ndx_list, int ndx_count)
+@@ -117,8 +117,7 @@ static void match_gnums(int32 *ndx_list, int ndx_count)
  	struct ht_int32_node *node = NULL;
  	int32 gnum, gnum_next;
  
 -	qsort(ndx_list, ndx_count, sizeof ndx_list[0], (int (*)()) hlink_compare_gnum);
+-
 +	qsort(ndx_list, ndx_count, sizeof ndx_list[0], (int (*)(const void *, const void *)) hlink_compare_gnum);
- 
  	for (from = 0; from < ndx_count; from++) {
  		file = hlink_flist->sorted[ndx_list[from]];
-diff --git a/lib/compat.c b/lib/compat.c
-index 513d79b..89b337e 100644
---- a/lib/compat.c
-+++ b/lib/compat.c
-@@ -19,6 +19,7 @@
-  * with this program; if not, visit the http://fsf.org website.
-  */
- 
-+#include <sys/time.h>
- #include "rsync.h"
- #include "itypes.h"
- 
+ 		gnum = F_HL_GNUM(file);
 diff --git a/lib/pool_alloc.c b/lib/pool_alloc.c
 index a1a7245..4eae062 100644
 --- a/lib/pool_alloc.c
@@ -180,3 +168,6 @@ index bbba7b2..61f8dc9 100644
  {
      uLong flags;
  
+-- 
+2.37.2
+
diff --git a/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch b/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
new file mode 100644
index 0000000000..1d9c4bfe48
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
@@ -0,0 +1,68 @@
+From e64a58387db46239902b610871a0eb81626e99ff Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 18 Aug 2022 07:46:28 -0700
+Subject: [PATCH] Turn on -pedantic-errors at the end of 'configure'
+
+Problem reported by Khem Raj in:
+https://lists.gnu.org/r/autoconf-patches/2022-08/msg00009.html
+Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/032862.html]
+---
+ configure.ac | 35 ++++++++++++++++++++---------------
+ 1 file changed, 20 insertions(+), 15 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d185b2d3..7e9514f7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1071,21 +1071,6 @@ elif test x"$ac_cv_header_popt_h" != x"yes"; then
+     with_included_popt=yes
+ fi
+ 
+-if test x"$GCC" = x"yes"; then
+-    if test x"$with_included_popt" != x"yes"; then
+-	# Turn pedantic warnings into errors to ensure an array-init overflow is an error.
+-	CFLAGS="$CFLAGS -pedantic-errors"
+-    else
+-	# Our internal popt code cannot be compiled with pedantic warnings as errors, so try to
+-	# turn off pedantic warnings (which will not lose the error for array-init overflow).
+-	# Older gcc versions don't understand -Wno-pedantic, so check if --help=warnings lists
+-	# -Wpedantic and use that as a flag.
+-	case `$CC --help=warnings 2>/dev/null | grep Wpedantic` in
+-	    *-Wpedantic*) CFLAGS="$CFLAGS -pedantic-errors -Wno-pedantic" ;;
+-	esac
+-    fi
+-fi
+-
+ AC_MSG_CHECKING([whether to use included libpopt])
+ if test x"$with_included_popt" = x"yes"; then
+     AC_MSG_RESULT($srcdir/popt)
+@@ -1444,6 +1429,26 @@ case "$CC" in
+     ;;
+ esac
+ 
++# Enable -pedantic-errors last, so that it doesn't mess up other
++# 'configure' tests.  For example, Autoconf uses empty function
++# prototypes like 'int main () {}' which Clang 15's -pedantic-errors
++# would reject.  Generally it's not a good idea to try to run
++# 'configure' itself with strict compiler checking.
++if test x"$GCC" = x"yes"; then
++    if test x"$with_included_popt" != x"yes"; then
++	# Turn pedantic warnings into errors to ensure an array-init overflow is an error.
++	CFLAGS="$CFLAGS -pedantic-errors"
++    else
++	# Our internal popt code cannot be compiled with pedantic warnings as errors, so try to
++	# turn off pedantic warnings (which will not lose the error for array-init overflow).
++	# Older gcc versions don't understand -Wno-pedantic, so check if --help=warnings lists
++	# -Wpedantic and use that as a flag.
++	case `$CC --help=warnings 2>/dev/null | grep Wpedantic` in
++	    *-Wpedantic*) CFLAGS="$CFLAGS -pedantic-errors -Wno-pedantic" ;;
++	esac
++    fi
++fi
++
+ AC_CONFIG_FILES([Makefile lib/dummy zlib/dummy popt/dummy shconfig])
+ AC_OUTPUT
+ 
+-- 
+2.37.1
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.5.bb b/meta/recipes-devtools/rsync/rsync_3.2.5.bb
index 6a7e6e559f..983bdd5ab0 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.5.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.5.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
+           file://0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch \
            "
 
 SRC_URI[sha256sum] = "2ac4d21635cdf791867bc377c35ca6dda7f50d919a58be45057fd51600c69aba"
-- 
2.38.1


