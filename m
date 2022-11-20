Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C839C3A5A1
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 13:31:40 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.12301.1668951090383054357
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 05:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XG2rz7Yd;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso10987590wme.5
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 05:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBYxeeswm9h8uvCIKcrMYsjVKOSb/qEO4anhCzNacvo=;
        b=XG2rz7YdpJFB+sIWKxuVszDDUT6PcyW85KNIuvRyPnI4iUa4LoDyaH1qjPS0L97XP2
         4LlwjnnL2dGkhA8L9apY8SLQDeeqdAor9sk3pxghrH3vYOtAsRe9fXPIZ6Ec0vzVZnSW
         ZjGwQfE20ePuZk5CKk8W9pKs5hL626aQWCk5I8osyk2ZHqvu6eYjnSnDK/NlBEECQV2d
         hoBjwiFu4W+7lydVMvQcA2GhQ08NsxsD2+WXO7hKTezyAUO0OwbCKLWGMrSz9KyRjkB5
         z1TQngEP9lL8Q4xu8SzkSyb+9zpTnTseswtRbbtOrBlTuEBCLQhSm7Tn2Kp/VwJF4yVx
         eLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBYxeeswm9h8uvCIKcrMYsjVKOSb/qEO4anhCzNacvo=;
        b=Y/L2GWMXEG2MZBWrw2QjYEAJn6WbCrW1TvwpcIERlOjr/RxKvDbGRCeOMwMzdFGkRm
         a2q7IkEZxyAGjlG9X6h3yAaYVvh4LajO+wIxc0HQUlpbrbSrmwB9NXA+WHpiD40y5FMW
         CjFnFDJxK75i2s+RxsptFxUk+SJJQj3apA2w3Pr5IbPHIKgs3nPOsFTZJ7KHrFAP1m9M
         LAYpIshfqqb3+BLvXoVeSx1hihuoKKaDqkfdw69PqFm8Sk1/v2XEf62FJh/h1uP09CAu
         8N6qncgv168jhaInAy6dw2RAC0VIuFGPnmu1XDtvt1d6QfM08HQutCJCdCVNym4jklGA
         w7rQ==
X-Gm-Message-State: ANoB5pmnT5+Ay70uHmfLiQv5C/I6H426hEyLAfcIddd1XO4aJTN6vx0G
	m/iJq0JofT+UBDA7rCiDGFdTqxbqkTw=
X-Google-Smtp-Source: AA0mqf5tiOGpB0D5UGUaLDq3tSknhq+ZHC6Dp/ChIYvtGOFF5HevNuz+b64s3Ln/VKnk7+udat9EbQ==
X-Received: by 2002:a1c:cc08:0:b0:3cf:63fd:cda8 with SMTP id h8-20020a1ccc08000000b003cf63fdcda8mr9935166wmb.46.1668951088607;
        Sun, 20 Nov 2022 05:31:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b003b47b80cec3sm16295551wms.42.2022.11.20.05.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:31:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/17] rsync: update 3.2.5 -> 3.2.7
Date: Sun, 20 Nov 2022 14:31:07 +0100
Message-Id: <20221120133122.2464634-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221120133122.2464634-1-alex@linutronix.de>
References: <20221120133122.2464634-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 13:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173583

Rebase patches.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-prototypes-to-function-declarations.patch | 28 +++++++--------
 ...antic-errors-at-the-end-of-configure.patch | 36 ++++---------------
 .../rsync/{rsync_3.2.5.bb => rsync_3.2.7.bb}  |  2 +-
 3 files changed, 20 insertions(+), 46 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.2.5.bb => rsync_3.2.7.bb} (97%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index 474d82db22..8895adad74 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 785c0072c80c2f6e0839478453cf65fdeac15da0 Mon Sep 17 00:00:00 2001
+From 651425fced0691d9063fe417388ba6ca1c38c40b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -15,6 +15,7 @@ Fixes errors like
 
 Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/032858.html]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  checksum.c       | 2 +-
  exclude.c        | 2 +-
@@ -29,23 +30,23 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  10 files changed, 12 insertions(+), 13 deletions(-)
 
 diff --git a/checksum.c b/checksum.c
-index fb8c0a0..174c28c 100644
+index 60de365..67a9e16 100644
 --- a/checksum.c
 +++ b/checksum.c
-@@ -629,7 +629,7 @@ int sum_end(char *sum)
- 	return csum_len_for_type(cursum_type, 0);
+@@ -778,7 +778,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
  }
+ #endif
  
 -void init_checksum_choices()
 +void init_checksum_choices(void)
  {
- #ifdef SUPPORT_XXH3
- 	char buf[32816];
+ #if defined SUPPORT_XXH3 || defined USE_OPENSSL
+ 	struct name_num_item *nni;
 diff --git a/exclude.c b/exclude.c
-index adc82e2..79f5a82 100644
+index ffe55b1..a85ea76 100644
 --- a/exclude.c
 +++ b/exclude.c
-@@ -358,7 +358,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
+@@ -363,7 +363,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
  	memcpy(partial_string_buf, s_start, partial_string_len);
  }
  
@@ -53,9 +54,9 @@ index adc82e2..79f5a82 100644
 +void free_implied_include_partial_string(void)
  {
  	if (partial_string_buf) {
- 		free(partial_string_buf);
+ 		if (partial_string_len)
 diff --git a/hlink.c b/hlink.c
-index 66810a3..6511dfb 100644
+index 20291f2..5c26a6b 100644
 --- a/hlink.c
 +++ b/hlink.c
 @@ -117,8 +117,7 @@ static void match_gnums(int32 *ndx_list, int ndx_count)
@@ -82,7 +83,7 @@ index a1a7245..4eae062 100644
  
  	/* statistical data */
 diff --git a/log.c b/log.c
-index 44344e2..991e359 100644
+index e4ba1cc..8482b71 100644
 --- a/log.c
 +++ b/log.c
 @@ -131,7 +131,7 @@ static void logit(int priority, const char *buf)
@@ -95,7 +96,7 @@ index 44344e2..991e359 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index 9ebfbea..affa244 100644
+index d2a7b9b..c50af45 100644
 --- a/main.c
 +++ b/main.c
 @@ -244,7 +244,7 @@ void read_del_stats(int f)
@@ -168,6 +169,3 @@ index bbba7b2..61f8dc9 100644
  {
      uLong flags;
  
--- 
-2.37.2
-
diff --git a/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch b/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
index 1d9c4bfe48..f11f13dd48 100644
--- a/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
@@ -1,4 +1,4 @@
-From e64a58387db46239902b610871a0eb81626e99ff Mon Sep 17 00:00:00 2001
+From e6321b0b456fca987b48d5ec7aba7e2826128e5f Mon Sep 17 00:00:00 2001
 From: Paul Eggert <eggert@cs.ucla.edu>
 Date: Thu, 18 Aug 2022 07:46:28 -0700
 Subject: [PATCH] Turn on -pedantic-errors at the end of 'configure'
@@ -6,37 +6,16 @@ Subject: [PATCH] Turn on -pedantic-errors at the end of 'configure'
 Problem reported by Khem Raj in:
 https://lists.gnu.org/r/autoconf-patches/2022-08/msg00009.html
 Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/032862.html]
+
 ---
- configure.ac | 35 ++++++++++++++++++++---------------
- 1 file changed, 20 insertions(+), 15 deletions(-)
+ configure.ac | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index d185b2d3..7e9514f7 100644
+index a2c9955..afabef0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1071,21 +1071,6 @@ elif test x"$ac_cv_header_popt_h" != x"yes"; then
-     with_included_popt=yes
- fi
- 
--if test x"$GCC" = x"yes"; then
--    if test x"$with_included_popt" != x"yes"; then
--	# Turn pedantic warnings into errors to ensure an array-init overflow is an error.
--	CFLAGS="$CFLAGS -pedantic-errors"
--    else
--	# Our internal popt code cannot be compiled with pedantic warnings as errors, so try to
--	# turn off pedantic warnings (which will not lose the error for array-init overflow).
--	# Older gcc versions don't understand -Wno-pedantic, so check if --help=warnings lists
--	# -Wpedantic and use that as a flag.
--	case `$CC --help=warnings 2>/dev/null | grep Wpedantic` in
--	    *-Wpedantic*) CFLAGS="$CFLAGS -pedantic-errors -Wno-pedantic" ;;
--	esac
--    fi
--fi
--
- AC_MSG_CHECKING([whether to use included libpopt])
- if test x"$with_included_popt" = x"yes"; then
-     AC_MSG_RESULT($srcdir/popt)
-@@ -1444,6 +1429,26 @@ case "$CC" in
+@@ -1437,6 +1437,26 @@ case "$CC" in
      ;;
  esac
  
@@ -63,6 +42,3 @@ index d185b2d3..7e9514f7 100644
  AC_CONFIG_FILES([Makefile lib/dummy zlib/dummy popt/dummy shconfig])
  AC_OUTPUT
  
--- 
-2.37.1
-
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.5.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
similarity index 97%
rename from meta/recipes-devtools/rsync/rsync_3.2.5.bb
rename to meta/recipes-devtools/rsync/rsync_3.2.7.bb
index 0bbbac7ace..e52699d24f 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.5.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            file://0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch \
            "
-SRC_URI[sha256sum] = "2ac4d21635cdf791867bc377c35ca6dda7f50d919a58be45057fd51600c69aba"
+SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 
 # -16548 required for v3.1.3pre1. Already in v3.1.3.
 CVE_CHECK_IGNORE += " CVE-2017-16548 "
-- 
2.30.2


