Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D977AC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 06:03:59 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.18586.1680156236380941946
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 23:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J2jDS38/;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: badganchipv@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id w4so17098857plg.9
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 23:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680156235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8Elc8x6kyPJ/+JUttWKMt/wb8XmRNYTOftEDhHy6YM=;
        b=J2jDS38/K0iOuOiFDj1vRL4ahEGEO0ZpmD5XkHuKJmL6kwasarM+02bq/X8ETQbtJE
         ymkMjdxPXrsfHU5kC8Q1QLkbeKU0LeQ4pheQ//jAoPuG6Rau1BsOTI8XdWfpUYfzfVNr
         luSyhM0NcSZA7fzIZ8oPeAyc08fXY42/PLpHFVAtjj4+0BlkIqq69daoftDHsZaHV12D
         6oMCPeOrBECeHODBI8vnDLwM5rfT/C1BEuFYr/NnbH8ejimavzNQcqoE6DpkmWpWYGAQ
         VXS7Vvhx6QY3guYAcf/5RSSbmkyVbGfN7cnu+t8MCZ/OulPJYoAeWzxnnpTDh1zasuYo
         8ANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680156235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8Elc8x6kyPJ/+JUttWKMt/wb8XmRNYTOftEDhHy6YM=;
        b=XecfOEj7tGJce+nqW+j2S8UJRdw/dlG4Vc5Ryko1169QUo+lbqi+ZwNF0khzpJM8qN
         bqO9zGCtK9rT+2u8c6uaKgaztDQUaCa1NvWH+MzPrT6xbl4FVO9WJWforFLFYpjihP5p
         KHU/V9OoONt8y2AXHwVNIlofrSAEKDR78ZpY41USvBnH/A2v4aYbUdM71lwYPpOg199L
         zsAPMpH6SNJxPc5IwtJlWsenSAxe5KBHL3miqsyQRj8yuNHRVrkO+7gDBfgnehLXgprn
         AjBgKfIQLcs/kH9/n/zQ9RmvcxV+g+6HqOS0Kvf55uYuOP0U3YG+Yaw0UfHRJPOKbMgC
         QQGA==
X-Gm-Message-State: AAQBX9dvutsizL1RVlBtVNHx030hchL0P5WdoWjITTjB0hMMJiVgar3y
	LY11dg2cNKKl/UXQh79TvZi0+l4BAIK60w==
X-Google-Smtp-Source: AKy350b4CnvI4LVH3CNYo7SzDpr6/yqX9JqdLjfWK3LOJj5LOi1yla38gi9fDXYhAVMKAvAC7nD3vQ==
X-Received: by 2002:a17:90b:3b45:b0:23f:86c2:54e2 with SMTP id ot5-20020a17090b3b4500b0023f86c254e2mr23293336pjb.16.1680156235491;
        Wed, 29 Mar 2023 23:03:55 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c2d:7ffa:ed57:edb6:bb36:e481])
        by smtp.gmail.com with ESMTPSA id g8-20020a1709026b4800b001a1f5dc64e5sm2406011plt.177.2023.03.29.23.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 23:03:55 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta][kirkstone][PATCH 2/2] rsync: Turn on -pedantic-errors at the end of 'configure'
Date: Thu, 30 Mar 2023 11:33:28 +0530
Message-Id: <20230330060328.8654-2-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230330060328.8654-1-badganchipv@gmail.com>
References: <20230330060328.8654-1-badganchipv@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 06:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179304

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


