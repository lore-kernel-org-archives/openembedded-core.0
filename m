Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A91CC0218F
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 17:51:25 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.42241.1737395477563402845
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 09:51:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cYbQ5cqR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21a7ed0155cso73325655ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 09:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737395477; x=1738000277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ttB9RYd4etyuN9fSjrMwqoPf0dqvdgXtVB7RyhHxVcg=;
        b=cYbQ5cqRHz7uRkY1FXDhsd0x8ANQ059M75MOjbrDFQu4zwnvV2BEJRh76cdv1zsWD2
         643SNCJ7hALFhd1YzAHeicM33jLt27eWDpBcY9kGB7HsyZVvUULfYVpagNM0Kqhvf1GE
         NCwm5PFWAljv7sqqWueh33gpuWb2nc8YcC7Byks+Wl8GKJ1dqNgPDERYjNqLkXpm+gZH
         MB7V+F9B1AsAZacqcK1+3RDy11isyKxNV48ZVI92cCLKe7Xwg5IllaO6OvFGOWxRCeZw
         cU6pvaphmGSjBk9GQBqeogRVx0WfEfNQTKh2s4KThm6htkphIDIqnEGVhYeOQ85P0k2Q
         Nl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737395477; x=1738000277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttB9RYd4etyuN9fSjrMwqoPf0dqvdgXtVB7RyhHxVcg=;
        b=iBm0UPARCfitAR8P5nR/wHCPRZq/MTDgcb+Ta8crFe51wRf4bcXtYhQ3Ax1FBJ9NZg
         BPq+LS9luTF4pwFRp3yvN0qfEW8seqbs9psbKTLuZhSke/dLNpGjweXJHlyhhTuxrTnI
         1/kLBvcJkX82O/iozagJvn9yMJyDYuGbfPW7XqaNNaEWCLXYFeSRPYo+69HUvni512Lq
         oN8alilVqK29NwEP/UtwIXcRlF8jrA/Vux7tsGdTA8ExJMH5R0QY4X/x8kvyIszOqf+6
         AMhyBiT02ZWiHTeyIlsK/AsbDCSEK4cUUi9r7BZ5Rla9VH2CWHo4bCW9JNwbv7RzrkzA
         auQQ==
X-Gm-Message-State: AOJu0Yxp+SoQ6MMXioRHxSHnadzgg93blKAq8ny33BowFxNbHjN7i9An
	7Io3jOEo11zpCDAiy/efgb+CL5R5ns/MnLpaOfFLRKrlXzsCgGi6LpSCtOygGw/gwKcuksTBATF
	UIzo=
X-Gm-Gg: ASbGncvuMoVT87m0Et4weCx8TwsXlY0M2pLE23nUEDQFrIh3BoiOkqTgpkD5IAoWd2A
	roPMlndM8IbDvuD8j55Tas2+7aay6+fSi5GWNutcB5gJD2/ajYRFp7W021X7DTQvP9abMRaQLXN
	HRkmE92PmMoZcw0uiqsHajfCo16WtW8q3klAg6nBIGJ4HiwAo1jh2lXBZK3ryzzoc0s0tpfr4Gx
	+ylGlffjTy7NhhENb877Gg/4O2BsqpMFrXNvbOCBLkH698sxqFZ3kPz0OU=
X-Google-Smtp-Source: AGHT+IEuqsyUBt15PhPnULeBk4YObEEV+1gH52K+oU1H+0ZvB9skbprmEVoU4M6dWo3xxdH0Ukj7Qg==
X-Received: by 2002:a17:903:2282:b0:21c:fb6:7c52 with SMTP id d9443c01a7336-21c356080e1mr208957335ad.45.1737395476776;
        Mon, 20 Jan 2025 09:51:16 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf643esm6155565a12.38.2025.01.20.09.51.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:51:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/16] rsync: update 3.2.5 -> 3.2.7
Date: Mon, 20 Jan 2025 09:50:49 -0800
Message-ID: <798009f46f2044aaa0bac753430cca1964677741.1737395091.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737395091.git.steve@sakoman.com>
References: <cover.1737395091.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 17:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210049

From: Alexander Kanavin <alex.kanavin@gmail.com>

Rebase patches.

(From OE-Core rev: 827c787893caa973c509acf7cac9e17fec5692a4)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 983bdd5ab0..84052d0ff1 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.5.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch \
            "
 
-SRC_URI[sha256sum] = "2ac4d21635cdf791867bc377c35ca6dda7f50d919a58be45057fd51600c69aba"
+SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 
 # -16548 required for v3.1.3pre1. Already in v3.1.3.
 CVE_CHECK_IGNORE += " CVE-2017-16548 "
-- 
2.43.0


