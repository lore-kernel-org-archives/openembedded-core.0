Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E37C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:31 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.15089.1634673270640871899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=retMpApn;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 136so592189pgc.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MuAdHSc9mXTI5tEO1ntwi/fK+vGYjCUpMG2ZiqITHAI=;
        b=retMpApnun2XannUK/YEvC4FD5ed5bvCAhgQ5JvwFKdhaWsrcGY7F2LH0dUFSSVBEt
         84yMIXyS//3derzgHxhV3mwuOcEDjVZ9ruCr2E+UGxMxyMBt1PF/fUp9bGZxDEGWU4Fd
         zRq2b9GLT8XeJ0yc8Zvwrd/NUJUzr6eRnWeRiNdp0iJIOQFPYhHevQO4JPAsH5Cxxtjt
         2ZMEpN/whrXHfWI95PdjaQnEyiQiCOXGaXgvxoA4Ycgg+det2IJd5IzLo+hVrb0slscT
         74KrnoXgtxBJyAxaC5AP55GKmLFgrAZWGy/+qFg/fKvAfeUAdfB7IX6jM0w+iEF3BKh4
         BEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MuAdHSc9mXTI5tEO1ntwi/fK+vGYjCUpMG2ZiqITHAI=;
        b=aw8Tv/8CPjDH8T3A6kFgwwcZ3Znarv2FdnghlGGT6PsUUVw9mUrJxe8ntihvm3TCvX
         4yvI+PKURYWVRmEO+e2ybwJ2qo2iw8bGVKFuTcCsn0YotR4u/gfqYfHwS/lngfvD8GzZ
         De/30v07N19T2cfYCQeRGcSYDskV93O+WhTCM916FY6whohJ1i1X99d/yzYGgIHkhIci
         qV8ogw4MVM4bgoz482Q3eWrjPpdTq8VlxyBtrcccMjmqJTYfE2LmFxeztaAkj+Nek9ox
         ipRMZQLHhYPvdPpkrObI6gjuK5jijboXlkMGZS31WQYBXVSPNqM2DBlXfOQVSt/3BUGw
         mUmw==
X-Gm-Message-State: AOAM531a18QrLLdLGU8p0hdsEsMrzyZij3B5z7Gqs8Hl4Kt07MfxLOSB
	7xlW82KZoOWm3V5YV9v84MqIpjJlu+X5oeV8OJw=
X-Google-Smtp-Source: 
 ABdhPJwVuvYmYL50vqtsyXhNDRXpnbcw0/gsrihB1f+os0gsHBixImn0C8aZkW7DO7PjDxG4ocj2ow==
X-Received: by 2002:a63:4d56:: with SMTP id
 n22mr30478653pgl.414.1634673269740;
        Tue, 19 Oct 2021 12:54:29 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/38] binutils: Fix a missing break in case
 statement
Date: Tue, 19 Oct 2021 09:53:21 -1000
Message-Id: 
 <a4983b98782122e097c3597248f69db3e858c0d2.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157215

From: Christian Eggers <ceggers@arri.de>

This was missed during patch forward porting
its only effective when printing options

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-system-directories-when-cross-linki.patch | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
index 11a8110d40..88cce49e46 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -1,4 +1,4 @@
-From 7b24f81e04c9d00d96de7dbd250beade6d2c6e44 Mon Sep 17 00:00:00 2001
+From 12b658c0fe5771d16067baef933b7f34ed455def Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Jan 2016 06:31:09 +0000
 Subject: [PATCH] warn for uses of system directories when cross linking
@@ -59,8 +59,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ld/ldfile.c     | 17 +++++++++++++++++
  ld/ldlex.h      |  2 ++
  ld/ldmain.c     |  2 ++
- ld/lexsup.c     | 15 +++++++++++++++
- 9 files changed, 85 insertions(+)
+ ld/lexsup.c     | 16 ++++++++++++++++
+ 9 files changed, 86 insertions(+)
 
 diff --git a/ld/config.in b/ld/config.in
 index d93c9b0830..5da2742bea 100644
@@ -77,10 +77,10 @@ index d93c9b0830..5da2742bea 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index 811134a503..f8c17c19ae 100755
+index f432f4637d..a9da3c115e 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -826,6 +826,7 @@ with_lib_path
+@@ -830,6 +830,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -88,7 +88,7 @@ index 811134a503..f8c17c19ae 100755
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1491,6 +1492,8 @@ Optional Features:
+@@ -1495,6 +1496,8 @@ Optional Features:
    --disable-largefile     omit support for large files
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -97,7 +97,7 @@ index 811134a503..f8c17c19ae 100755
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -15788,6 +15791,19 @@ fi
+@@ -16624,6 +16627,19 @@ fi
  
  
  
@@ -222,10 +222,10 @@ index 5287f19a7f..55096e4fc9 100644
  
  /* The initial parser states.  */
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index da1ad17763..12d0b07d8a 100644
+index c4af10f4e9..95b56b2d2d 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -274,6 +274,8 @@ main (int argc, char **argv)
+@@ -273,6 +273,8 @@ main (int argc, char **argv)
    command_line.warn_mismatch = TRUE;
    command_line.warn_search_mismatch = TRUE;
    command_line.check_section_addresses = -1;
@@ -235,7 +235,7 @@ index da1ad17763..12d0b07d8a 100644
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 3d15cc491d..0e8b4f2b7a 100644
+index 3d15cc491d..6478821443 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
 @@ -550,6 +550,14 @@ static const struct ld_option ld_options[] =
@@ -253,10 +253,10 @@ index 3d15cc491d..0e8b4f2b7a 100644
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -1603,6 +1611,13 @@ parse_args (unsigned argc, char **argv)
- 
+@@ -1604,6 +1612,14 @@ parse_args (unsigned argc, char **argv)
  	case OPTION_PRINT_MAP_DISCARDED:
  	  config.print_map_discarded = TRUE;
+ 	  break;
 +
 +	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
 +	  command_line.poison_system_directories = FALSE;
@@ -264,6 +264,6 @@ index 3d15cc491d..0e8b4f2b7a 100644
 +
 +	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
 +	  command_line.error_poison_system_directories = TRUE;
- 	  break;
++	  break;
  	}
      }
-- 
2.25.1


