Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423D9C77B62
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 16:43:09 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.48724.1680453784488971392
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 09:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0ng2NYDx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so28222581pjb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 09:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680453783; x=1683045783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hqKJ48uaDr2STEeZ8gtfIfbSk9xWX0LUiq88zMFpEY=;
        b=0ng2NYDxG8UgENkQWEOsfLch2XSZB07qJTTfvzySmLySfMBbVwAX/DivqyooPcIaS6
         ekuO94RCp1jK5gjnXuua7NexgvOe05Zb0t1t2lqp2XeFE439ip+Y4p6o4md6V8FzBzna
         j1qwVdk4/NAg8th+CRKMISq9Bo3lJgbff739312EIwW64zbqiiyLKeQw3IFWzy0std4R
         5M+nvpaKuvxheiFQ08WLx7RE9tHojuOU89sL85rLzWWgQ76y76ZgThHwBQODzSxwf+tS
         DdEsNZTY5Yw9t3ZG7XkZnFF42W3u+qVxBeHvNmnkpG2b+WdnYFNg31hm2Bc6oxdOK7wG
         RfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680453783; x=1683045783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hqKJ48uaDr2STEeZ8gtfIfbSk9xWX0LUiq88zMFpEY=;
        b=ZNIiIgxp1bBkEo8F3FV2HbYuZ6Z8cDmDitLFi8DvJzMHYySyjWVD1BUCZJUYFrTinK
         O2b5mjYibrBJBMzvOp9m5rWvSlg2VC80pnHwFLw+Kf03saR6t0BD8QShmnXkVZInSIdX
         +sBuzYhG6F4webyq/fTjLZwHyH/STaoyUe6W4FVtNTo8E8lBPUg20g4+SF4HjfmFjyL4
         FL+NM800BlxNz8tSE3qCruVr3B8bKKd6eb53T47mLtIgAjX4QQL+p2XX+kVcsvFm5NjR
         qHgYH+hlutXu3ax4yWE5pFJP/FxBrOUR0/ApBvuLBv3AZcAmYqXm4fd+PzoLzcRcxCfr
         MFMw==
X-Gm-Message-State: AAQBX9f3oY60EfXBExLjH8D66S7Cb4qNdRKRzbFsiJgKyKuBSThkA85U
	NEtO2K8iubUgwKH+vNNXf7H+Az5DPlI4SGaXaNw=
X-Google-Smtp-Source: AKy350ad/Mb6Xk0tLutgquCmGWGL/0+BYveO/6iPoVmZzm1DZ8/mRGf2PaOGieQ40wjDr/3yjRsNXQ==
X-Received: by 2002:a17:902:c403:b0:1a2:7356:1ecd with SMTP id k3-20020a170902c40300b001a273561ecdmr24136807plk.5.1680453783393;
        Sun, 02 Apr 2023 09:43:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001a1ddd224desm5042079plb.89.2023.04.02.09.43.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 09:43:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/21] rsync: Turn on -pedantic-errors at the end of 'configure'
Date: Sun,  2 Apr 2023 06:42:16 -1000
Message-Id: <3eeab90fd45a1e8de6d9d16dfdec79c72639614b.1680453201.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680453201.git.steve@sakoman.com>
References: <cover.1680453201.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 16:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179602

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


