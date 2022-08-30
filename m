Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC306ECAAD5
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 03:32:41 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web08.7426.1661830340272835675
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 20:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ld1ICq2m;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id s206so9511709pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 20:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=ZPx0QpOTcrGWsro2p9703zawCavGt9asAY3xLW2rMS4=;
        b=ld1ICq2mj9wN69Aahnpzm248YsEco1/A6B5M9tqmA9vYcIJAQByaiZQ043v8F21MvJ
         y60jaS3GRpiBxXPsbnDZqIJu1XslQT+hHy514Qt28GbqCvNMt/lHuFCBClORIOPM+POL
         Jvc0BtDZO3pD6naEnjiW87L1eb0wSdNo5R7ed+1ljqE9R3JM1bsP9a8n9/4z9zCvyyrm
         Op7wkHfxFvp4okFjx1S1l7d+3yBx23xBStoCe66mf868q8SlSo6t/EHv4MZEBv8Mib+p
         to6KZEpACGC+2QxXj7ATNpCJsocRF7DY0A/P0af+3gdkyN4TFdn0j6p3nBuVwD2yKYsC
         34zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=ZPx0QpOTcrGWsro2p9703zawCavGt9asAY3xLW2rMS4=;
        b=f6vy0g0yk9SQMYGGx/a8cIXi7BpvQXq0/HXdYHeU5sBMXJHorradgNtT+sBBo4DuXe
         mz6JtkYkrXVspc6bD/PzY0UZqzf3LW2NtWMTkPx69+w0Wo8jpX9QkGWuD0HuHbspxawy
         vw3+b5CkHLQd8/z01TiNXjPiJhtyko5bZ9t79RZJeczU8L3ijvvUFAGOMjaZ1Z5WkDsH
         k/kanYD1+nXo46A44s2kbbz0S4ZlnAYpHh/Mw/6+u9XuBrA1/N6BLijdVRbJJjHLutR3
         qle3Splo+XhRRqf061SdQaWJSHiaClGZeBOIHQyIxz3MRLOSe94tSQkjf5OZKXZo4iWA
         1FNQ==
X-Gm-Message-State: ACgBeo2MToyfUJyE5s972YAxR/K2CA/ThXD9AaIgznbka+4SxMQedkD3
	Auz9SXLbWjTRRj7sAL1KjNQCHjN8H686fQ==
X-Google-Smtp-Source: 
 AA6agR7vPkIkIsUp7GjetcepUETWV67lbCsLck5i/Je3vTM5c5LswgEuPp0FubZFPqtX+309NlklIg==
X-Received: by 2002:a62:be0e:0:b0:536:76fe:ee96 with SMTP id
 l14-20020a62be0e000000b0053676feee96mr19332090pff.44.1661830339262;
        Mon, 29 Aug 2022 20:32:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 f13-20020a170902ce8d00b001749dff717dsm2833573plg.227.2022.08.29.20.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 20:32:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rsync: Turn on -pedantic-errors at the end of 'configure'
Date: Mon, 29 Aug 2022 20:32:16 -0700
Message-Id: <20220830033216.2742587-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 03:32:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170046

This helps in building rsync without autoconf patch, since it will be a
while that the round trip is made, better to apply this patch here until
next release of autoconf.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
index 2c2dbc4600..0bbbac7ace 100644
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
2.37.2


