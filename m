Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17527E748E5
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 19:40:45 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.47635.1696102835841871788
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 12:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wsvx2vyl;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.44, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1a1fa977667so8162192fac.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696102835; x=1696707635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWtwE1WTgz7HOyZhdAyUMslRCCYpCO4P7QciZ/Y2s3w=;
        b=wsvx2vyl7T7nGbl3brKYbqX8vs7i1A1qXxDn0YEp9tVmS2QmCRusY02MuNkZr9SqCQ
         l6vFW1bvT2itfG0y95Vm2AR+xyZZyL3akS3844B2TDfZbcDeTTQqeSYbyXuLQ9+uVGKe
         hRcCPInlItkC+A1GhpRn/o3Cp86lLGRJL8fgNCnuNS4/Uvw6E4V4wktfgwuy3dS8lpma
         ILROUtn8E7qFxaiZi1R9MjkGppV71nlNdxMMSMWJl0L7o7f3+b00ZEIMW5FfJeGQ05Fq
         rbFldnh3RC0ftjiH1Kz2ldePQCCdGcv/L0KoMUXRiRDOs3Fqs9NqiNpeycgH9oLN4yF4
         KTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696102835; x=1696707635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWtwE1WTgz7HOyZhdAyUMslRCCYpCO4P7QciZ/Y2s3w=;
        b=jn+QtkcJ2oMGPezfoXnblDYXdCkn4DKvCihrnhofqQtXqO9jDOVwmqhBCJ9QfyKEIM
         +GA9Tw7S+Q6sfMjcVeQpp1rcGGK2JgizyKxkm8F/O0+4Wbi6ShtK2NOvYvCvkQqJK99r
         iNp1c+0JxKi/4FfUxqj6xazvLHnTukmcFUDVXA1Hfi29lLeOh2kKSe/XCyAM4xX67F9s
         93+Rr7OL4VPHw1EtX0w8fG0dc30xT8BqkWowqCDbjh/NvwpX73SoZ5f8VYQiRbtImJSD
         /qgHWQ9n/fbunN+KZjCwQ6puVhOSBOtsnJJxyuw+g+YVD6HA+wtUe7jDmA1Wsk69HXPx
         7jLQ==
X-Gm-Message-State: AOJu0YzpX2OgwzF8fmf6dSYzlcSc3jul1StqlH6kIrXVJfy0xQ7oXpdM
	+HCk31prBp5J2oub88yTtVxbWd9+m+c90hwvhKQ=
X-Google-Smtp-Source: AGHT+IE/wLm88dVfKlGAxtrakMkYxlDF4isZRruPd9YWmvEnFm7NUOSBE+70gAGJyNk+ZGdDjw1M+g==
X-Received: by 2002:a05:6870:9711:b0:1bf:61d1:a4d4 with SMTP id n17-20020a056870971100b001bf61d1a4d4mr9352908oaq.6.1696102834783;
        Sat, 30 Sep 2023 12:40:34 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id p2-20020a62ab02000000b006936d053677sm2880011pff.133.2023.09.30.12.40.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 12:40:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/13] nasm: update 2.15.03 -> 2.15.05
Date: Sat, 30 Sep 2023 09:40:06 -1000
Message-Id: <ed262f94b81cbf78e6a335912875bee8a65ca7c6.1696102675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696102675.git.steve@sakoman.com>
References: <cover.1696102675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 19:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188474

From: Alexander Kanavin <alex.kanavin@gmail.com>

Use autotools-brokensep as new version needs that.

upgrade include fix for CVE-2020-21686 and CVE-2022-29654

(cherry picked from commit c9c724ffa36757b56e70bc8d7b880c0c5777b153)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0002-Add-debug-prefix-map-option.patch    | 42 +++++++++----------
 .../nasm/{nasm_2.15.03.bb => nasm_2.15.05.bb} |  4 +-
 2 files changed, 22 insertions(+), 24 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.15.03.bb => nasm_2.15.05.bb} (85%)

diff --git a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
index f788e0fd43..9f4c8dc0bd 100644
--- a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
+++ b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
@@ -1,4 +1,4 @@
-From bb4e42ad3a0cdd23a1d1797e6299c76b474867c0 Mon Sep 17 00:00:00 2001
+From 81d6519499dcfebe7d21e65e002a8885a4e8d852 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Tue, 19 Nov 2019 13:12:17 -0600
 Subject: [PATCH] Add --debug-prefix-map option
@@ -11,7 +11,7 @@ Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392635]
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
 
 ---
- asm/nasm.c              | 26 +++++++++++++++++++++++++-
+ asm/nasm.c              | 24 ++++++++++++++++++++++++
  include/nasmlib.h       |  9 +++++++++
  nasm.txt                |  4 ++++
  nasmlib/filename.c      | 20 ++++++++++++++++++++
@@ -23,34 +23,32 @@ Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
  stdlib/strlcat.c        |  2 +-
  test/elfdebugprefix.asm |  6 ++++++
  test/performtest.pl     | 12 ++++++++++--
- 12 files changed, 83 insertions(+), 10 deletions(-)
+ 12 files changed, 82 insertions(+), 9 deletions(-)
  create mode 100644 test/elfdebugprefix.asm
 
 diff --git a/asm/nasm.c b/asm/nasm.c
-index a0e1719..fc6c62e 100644
+index e5ae89a..7a7f8b4 100644
 --- a/asm/nasm.c
 +++ b/asm/nasm.c
-@@ -938,7 +938,8 @@ enum text_options {
-     OPT_LIMIT,
+@@ -939,6 +939,7 @@ enum text_options {
      OPT_KEEP_ALL,
      OPT_NO_LINE,
--    OPT_DEBUG
-+    OPT_DEBUG,
-+    OPT_DEBUG_PREFIX_MAP
+     OPT_DEBUG,
++    OPT_DEBUG_PREFIX_MAP,
+     OPT_REPRODUCIBLE
  };
  enum need_arg {
-     ARG_NO,
-@@ -970,6 +971,7 @@ static const struct textargs textopts[] = {
+@@ -971,6 +972,7 @@ static const struct textargs textopts[] = {
      {"keep-all", OPT_KEEP_ALL, ARG_NO, 0},
      {"no-line",  OPT_NO_LINE, ARG_NO, 0},
      {"debug",    OPT_DEBUG, ARG_MAYBE, 0},
 +    {"debug-prefix-map", OPT_DEBUG_PREFIX_MAP, true, 0},
+     {"reproducible", OPT_REPRODUCIBLE, ARG_NO, 0},
      {NULL, OPT_BOGUS, ARG_NO, 0}
  };
- 
-@@ -1332,6 +1334,26 @@ static bool process_arg(char *p, char *q, int pass)
-                 case OPT_DEBUG:
-                     debug_nasm = param ? strtoul(param, NULL, 10) : debug_nasm+1;
+@@ -1337,6 +1339,26 @@ static bool process_arg(char *p, char *q, int pass)
+                 case OPT_REPRODUCIBLE:
+                     reproducible = true;
                      break;
 +                case OPT_DEBUG_PREFIX_MAP: {
 +                    struct debug_prefix_list *d;
@@ -75,7 +73,7 @@ index a0e1719..fc6c62e 100644
                  case OPT_HELP:
                      help(stdout);
                      exit(0);
-@@ -2297,6 +2319,8 @@ static void help(FILE *out)
+@@ -2304,6 +2326,8 @@ static void help(FILE *out)
          "    -w-x          disable warning x (also -Wno-x)\n"
          "    -w[+-]error   promote all warnings to errors (also -Werror)\n"
          "    -w[+-]error=x promote warning x to errors (also -Werror=x)\n"
@@ -85,7 +83,7 @@ index a0e1719..fc6c62e 100644
  
      fprintf(out, "       %-20s %s\n",
 diff --git a/include/nasmlib.h b/include/nasmlib.h
-index e9bfbcc..98fc653 100644
+index 438178d..4c3e90d 100644
 --- a/include/nasmlib.h
 +++ b/include/nasmlib.h
 @@ -250,10 +250,19 @@ int64_t readstrnum(char *str, int length, bool *warn);
@@ -181,10 +179,10 @@ index 54b22f8..c4a412c 100644
  
  static void as86_cleanup(void)
 diff --git a/output/outcoff.c b/output/outcoff.c
-index bcd9ff3..15bfcf3 100644
+index 58fa024..14baf7b 100644
 --- a/output/outcoff.c
 +++ b/output/outcoff.c
-@@ -1095,14 +1095,14 @@ static void coff_symbol(char *name, int32_t strpos, int32_t value,
+@@ -1072,14 +1072,14 @@ static void coff_symbol(char *name, int32_t strpos, int32_t value,
  
  static void coff_write_symbols(void)
  {
@@ -215,7 +213,7 @@ index 61af020..1292958 100644
      nsects = sectlen = 0;
      syms = saa_init((int32_t)sizeof(struct elf_symbol));
 diff --git a/output/outieee.c b/output/outieee.c
-index 4cc0f0f..2468724 100644
+index 6d6d4b2..cdb8333 100644
 --- a/output/outieee.c
 +++ b/output/outieee.c
 @@ -207,7 +207,7 @@ static void ieee_unqualified_name(char *, char *);
@@ -228,10 +226,10 @@ index 4cc0f0f..2468724 100644
      fpubhead = NULL;
      fpubtail = &fpubhead;
 diff --git a/output/outobj.c b/output/outobj.c
-index 0d4d311..d8dd6a0 100644
+index 56b43f9..fefea94 100644
 --- a/output/outobj.c
 +++ b/output/outobj.c
-@@ -638,7 +638,7 @@ static enum directive_result obj_directive(enum directive, char *);
+@@ -644,7 +644,7 @@ static enum directive_result obj_directive(enum directive, char *);
  
  static void obj_init(void)
  {
diff --git a/meta/recipes-devtools/nasm/nasm_2.15.03.bb b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
similarity index 85%
rename from meta/recipes-devtools/nasm/nasm_2.15.03.bb
rename to meta/recipes-devtools/nasm/nasm_2.15.05.bb
index 6a8c57827d..c5638debdd 100644
--- a/meta/recipes-devtools/nasm/nasm_2.15.03.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
@@ -11,11 +11,11 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://CVE-2022-44370.patch \
            "
 
-SRC_URI[sha256sum] = "04e7343d9bf112bffa9fda86f6c7c8b120c2ccd700b882e2db9f57484b1bd778"
+SRC_URI[sha256sum] = "3c4b8339e5ab54b1bcb2316101f8985a5da50a3f9e504d43fa6f35668bee2fd0"
 
 EXTRA_AUTORECONF_append = " -I autoconf/m4"
 
-inherit autotools
+inherit autotools-brokensep
 
 BBCLASSEXTEND = "native"
 
-- 
2.34.1


