Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A948FA3748
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 11:47:51 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.8091.1667216866681127925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 04:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a49kdJGN;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id v1so15568598wrt.11
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 04:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sJmiFAFNfRKqGi9RMxoZ6Of49oVeQoeu89zCmJgU9A=;
        b=a49kdJGN4P4QvYToI6FJq0ycTWteF2ZFpFiQ/RlfjDQHqPkzFvEyKF8nk4JmvtfE7J
         JAtdAax9LWCiqH/x6fpTOoTBrlVpxzyX/kDhYo7tg75iOTbxRF8vkiCiRkooVVKA64su
         u91VA2WHBe4dweFGM2KbyuGdGKFIHfHBtcDfMADxk5j2Mp1bVXrXQeXLKHUGX4/vJTve
         dGayil3AXagilI31dsRHjgoHQEsRQLlA4SG9Ka0Winrb19kCTc1nYM6leu2jxCIaXg9P
         96ibPtqp31kYhm+LLfcs2FqJG4Z4uwKoHmOvNRORZ0gEW+ZVousMs95gmcIb+Yr096a6
         2YzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sJmiFAFNfRKqGi9RMxoZ6Of49oVeQoeu89zCmJgU9A=;
        b=1QNUqG9FI3z9coMrTqPddwtNimCST80T7ZAEbtOiVkRmUaoftjJNxMaXxJA7edh2V2
         sW+4oS7NDTXhpiWXaJ04OTTYjbhyFutsY4dQQBfo4SmgEbY/67/LhHkd3kDcMgnIopRV
         dvzGrt0SylBIUaUhQ0Oik6PZttTTUPt2flISJXQO+8oUU3KDTjcaeR8x2bsrl4yEKDgr
         /lp5sOxJHh7j4PqhLW1L4ln51aosuGUc5ReZNAI7ORIlxIbKJPjzPRMklSX4Cb/fkx1b
         OIjBtt0nTf8CZyMo5+nqfeo/SgLmTTheAeFZ5ZlcaypyTZ/aS5sV2XJvwoVTwDS1y9ip
         LZHg==
X-Gm-Message-State: ACrzQf033x40Mpsb2sm/PMsn85hwEjytCiKc2f8LNYBH0O+V4irr+ytJ
	xnasP/D6/TeZfpYnBPdzhpnaWshYEzo=
X-Google-Smtp-Source: AMsMyM4f18r9guxgruJNrf/0rWfdWDCdNV7IRD0t5nAq4MVU2GmqJlPPgorU6ylfPfRyqcRGRdUwKQ==
X-Received: by 2002:adf:e7c7:0:b0:236:6994:a0b4 with SMTP id e7-20020adfe7c7000000b002366994a0b4mr8147672wrn.610.1667216865090;
        Mon, 31 Oct 2022 04:47:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m11-20020adfa3cb000000b002366e3f1497sm7017965wrb.6.2022.10.31.04.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:47:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/13] argp-standalone: replace with a maintained fork
Date: Mon, 31 Oct 2022 12:47:16 +0100
Message-Id: <20221031114719.2725967-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031114719.2725967-1-alex@linutronix.de>
References: <20221031114719.2725967-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 11:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172312

Remove two patches as issues fixed upstream,
submit the third one.

License-Update: argp.h is an import from glibc and
has been refreshed to the latest version. It's still
lgpl 2.1.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...dalone_1.3.bb => argp-standalone_1.4.1.bb} | 12 ++-
 .../files/0001-throw-in-funcdef.patch         | 84 -------------------
 .../argp-standalone/files/0002-isprint.patch  | 51 -----------
 .../files/out_of_tree_build.patch             |  2 +-
 4 files changed, 6 insertions(+), 143 deletions(-)
 rename meta/recipes-support/argp-standalone/{argp-standalone_1.3.bb => argp-standalone_1.4.1.bb} (59%)
 delete mode 100644 meta/recipes-support/argp-standalone/files/0001-throw-in-funcdef.patch
 delete mode 100644 meta/recipes-support/argp-standalone/files/0002-isprint.patch

diff --git a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb b/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb
similarity index 59%
rename from meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
rename to meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb
index 8d8122612a..00b6036502 100644
--- a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
+++ b/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb
@@ -3,18 +3,16 @@
 
 SUMMARY = "Glibc hierarchical argument parsing standalone library"
 DESCRIPTION = "Standalone version of arguments parsing functions from GLIBC"
-HOMEPAGE = "http://www.lysator.liu.se/~nisse/misc/"
+HOMEPAGE = "https://github.com/ericonr/argp-standalone"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://argp.h;beginline=1;endline=20;md5=008b7e53dea6f9e1d9fdef0d9cf3184a"
+LIC_FILES_CHKSUM = "file://argp.h;beginline=1;endline=20;md5=464f2cfb1c35a5123f9e309d7afd79f8"
 SECTION = "libs"
 
-SRC_URI = "http://www.lysator.liu.se/~nisse/misc/argp-standalone-${PV}.tar.gz \
-           file://0001-throw-in-funcdef.patch \
-           file://0002-isprint.patch \
+SRC_URI = "git://github.com/ericonr/argp-standalone;branch=master;protocol=https \
            file://out_of_tree_build.patch \
           "
-SRC_URI[md5sum] = "720704bac078d067111b32444e24ba69"
-SRC_URI[sha256sum] = "dec79694da1319acd2238ce95df57f3680fea2482096e483323fddf3d818d8be"
+SRCREV = "e5fe9ad9e83e6765cf8fa787f903d4c6792338b5"
+S = "${WORKDIR}/git"
 
 inherit autotools
 
diff --git a/meta/recipes-support/argp-standalone/files/0001-throw-in-funcdef.patch b/meta/recipes-support/argp-standalone/files/0001-throw-in-funcdef.patch
deleted file mode 100644
index a6e2759c5d..0000000000
--- a/meta/recipes-support/argp-standalone/files/0001-throw-in-funcdef.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-# --- T2-COPYRIGHT-NOTE-BEGIN ---
-# This copyright note is auto-generated by ./scripts/Create-CopyPatch.
-# 
-# T2 SDE: package/.../rng-tools/throw-in-funcdef.patch.argp-standalone
-# Copyright (C) 2006 The T2 SDE Project
-# 
-# More information can be found in the files COPYING and README.
-# 
-# This patch file is dual-licensed. It is available under the license the
-# patched project is licensed under, as long as it is an OpenSource license
-# as defined at http://www.opensource.org/ (e.g. BSD, X11) or under the terms
-# of the GNU General Public License as published by the Free Software
-# Foundation; either version 2 of the License, or (at your option) any later
-# version.
-# --- T2-COPYRIGHT-NOTE-END ---
-
-
-No __THROW in function implementation.
-	--jsaw
-
-Taken from buildroot
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- argp-standalone-1.4-test2/argp.h.orig	2006-01-06 02:29:59.000000000 +0100
-+++ argp-standalone-1.4-test2/argp.h	2006-01-06 02:41:10.000000000 +0100
-@@ -560,17 +560,17 @@
- # endif
- 
- # ifndef ARGP_EI
--#  define ARGP_EI extern __inline__
-+#  define ARGP_EI extern inline
- # endif
- 
- ARGP_EI void
--__argp_usage (__const struct argp_state *__state) __THROW
-+__argp_usage (__const struct argp_state *__state)
- {
-   __argp_state_help (__state, stderr, ARGP_HELP_STD_USAGE);
- }
- 
- ARGP_EI int
--__option_is_short (__const struct argp_option *__opt) __THROW
-+__option_is_short (__const struct argp_option *__opt)
- {
-   if (__opt->flags & OPTION_DOC)
-     return 0;
-@@ -582,7 +582,7 @@
- }
- 
- ARGP_EI int
--__option_is_end (__const struct argp_option *__opt) __THROW
-+__option_is_end (__const struct argp_option *__opt)
- {
-   return !__opt->key && !__opt->name && !__opt->doc && !__opt->group;
- }
---- argp-standalone-1.4-test2/argp-parse.c.orig	2006-01-06 02:47:48.000000000 +0100
-+++ argp-standalone-1.4-test2/argp-parse.c	2006-01-06 02:48:16.000000000 +0100
-@@ -1290,13 +1290,13 @@
- /* Defined here, in case a user is not inlining the definitions in
-  * argp.h */
- void
--__argp_usage (__const struct argp_state *__state) __THROW
-+__argp_usage (__const struct argp_state *__state)
- {
-   __argp_state_help (__state, stderr, ARGP_HELP_STD_USAGE);
- }
- 
- int
--__option_is_short (__const struct argp_option *__opt) __THROW
-+__option_is_short (__const struct argp_option *__opt) 
- {
-   if (__opt->flags & OPTION_DOC)
-     return 0;
-@@ -1310,7 +1310,7 @@
- }
- 
- int
--__option_is_end (__const struct argp_option *__opt) __THROW
-+__option_is_end (__const struct argp_option *__opt) 
- {
-   return !__opt->key && !__opt->name && !__opt->doc && !__opt->group;
- }
diff --git a/meta/recipes-support/argp-standalone/files/0002-isprint.patch b/meta/recipes-support/argp-standalone/files/0002-isprint.patch
deleted file mode 100644
index 1c07eea3c1..0000000000
--- a/meta/recipes-support/argp-standalone/files/0002-isprint.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Subject: restrict value range passed to isprint function
-
-According to C standards isprint argument shall be representable as an
-unsigned char or be equal to EOF, otherwise the behaviour is undefined.
-
-Passing arbitrary ints leads to segfault in nm program from elfutils.
-
-Restrict isprint argument range to values representable by unsigned char.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
-
-Taken from buildroot
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
-Index: b/argp.h
-===================================================================
---- a/argp.h
-+++ b/argp.h
-@@ -23,6 +23,7 @@
- 
- #include <stdio.h>
- #include <ctype.h>
-+#include <limits.h>
- 
- #define __need_error_t
- #include <errno.h>
-@@ -577,7 +578,7 @@
-   else
-     {
-       int __key = __opt->key;
--      return __key > 0 && isprint (__key);
-+      return __key > 0 && __key <= UCHAR_MAX && isprint (__key);
-     }
- }
- 
-Index: b/argp-parse.c
-===================================================================
---- a/argp-parse.c
-+++ b/argp-parse.c
-@@ -1292,7 +1292,7 @@
-       int __key = __opt->key;
-       /* FIXME: whether or not a particular key implies a short option
-        * ought not to be locale dependent. */
--      return __key > 0 && isprint (__key);
-+      return __key > 0 && __key <= UCHAR_MAX && isprint (__key);
-     }
- }
- 
diff --git a/meta/recipes-support/argp-standalone/files/out_of_tree_build.patch b/meta/recipes-support/argp-standalone/files/out_of_tree_build.patch
index b7777cbd91..c863104430 100644
--- a/meta/recipes-support/argp-standalone/files/out_of_tree_build.patch
+++ b/meta/recipes-support/argp-standalone/files/out_of_tree_build.patch
@@ -2,7 +2,7 @@ Fix the testsuite to built out of tree
 in OE S != B
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/ericonr/argp-standalone/pull/9]
 Index: argp-standalone-1.3/testsuite/Makefile.am
 ===================================================================
 --- argp-standalone-1.3.orig/testsuite/Makefile.am
-- 
2.30.2


