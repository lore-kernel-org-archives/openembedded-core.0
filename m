Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B17AC4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 19:02:02 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.127125.1669662118912989965
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 11:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B2CXBf38;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso10163183wmb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 11:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BRwjHSgEGx4HjyQ6lmO5IdYGO95vhOtYVPjbGRIguqE=;
        b=B2CXBf389hRrSGaVKqpDmJgY+bbmBv/M8GG8nfaSnmFMfEzhBgsZ8woOl66iG7vvK1
         mMVdcS9AbB8C+kUTLYAzZFYP+n858raqkwqYkN2JKKOAmWMm35yJbBiPcsVMn9A9m6Bw
         rxcltToF6i+T5O2JQfJ99PnTr0nTsMdIAeO36r1ytXFz99no4xR74llPTy18mu8kzULQ
         0kANZ0sP7kUc0bDchUKqOOhuvEoZbUb9rtQur7agPoVpC5WKYQXQw00A5FfYqbhf0vGk
         q0nj0dj74TsN+BuYFwGOrEE6mpRmREGerg5wDI5N9FYPJBo0zQQUUrwkBFMnVx+72o7m
         T41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRwjHSgEGx4HjyQ6lmO5IdYGO95vhOtYVPjbGRIguqE=;
        b=svjt+TibUqlScS6TwOr//jAIrlnjxO2RxTK6DLSm2HrcAqwGmO3SKEdslyYzoSlJIf
         kNljuE2/P+pZW+EpLA4lnIAooJsA6DLhnY8sDuQPYlGvXU501dbJjGs3xiDVAH2IYnFL
         xcsxzzVZm40iLMF93E0bEyf9epF/E5BdJ5apiELd4vdYG0k2WSCvAMwFtiGKNuqdaRPg
         K5rnQQUHhakYez7Ml12Rqnwy7CYFivX2WaZiDD7V2t+3BvuRICqzaWkcCh1W3Zx4qGb+
         ndPYsnB0hlnEugdPgJX8rUDAbZIY5PFfCqPfdnJOyzDyvkqeNvAtG/lZjnKwdyaqxPRC
         1paQ==
X-Gm-Message-State: ANoB5plEJhyWFhBYo1v2pqHVZtGxkCboJmlHM+uqBVSLtzYRfictmqly
	QACGg8sCnhgZAtLPECqrV93xp83dfiE=
X-Google-Smtp-Source: AA0mqf5iC9VS8XVGksAy3CG9XlliqyNfwxwl4pQpU2A0rLg/KX0Ko77BDIFHt/gTu9to/e05w+ktCw==
X-Received: by 2002:a1c:4b0f:0:b0:3cf:735c:9d5a with SMTP id y15-20020a1c4b0f000000b003cf735c9d5amr32231395wma.113.1669662116909;
        Mon, 28 Nov 2022 11:01:56 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c458800b003cf4d99fd2asm6001639wmo.6.2022.11.28.11.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 11:01:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH][kirkstone 1/3] tiff: refresh with devtool
Date: Mon, 28 Nov 2022 20:01:51 +0100
Message-Id: <20221128190153.2155592-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 19:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173939

* so that they can be easily and cleanly applied with "git am"
* manually fix CVE-2022-2953.patch commit message not to use UTF-8
  quotes and replace it with human readable text from original commit:
  https://gitlab.com/libtiff/libtiff/-/commit/8fe3735942ea1d90d8cef843b55b3efe8ab6feaf

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-the-FPE-in-tiffcrop-415-427-and-428.patch |  2 +-
 ...rash-when-reading-a-file-with-multip.patch | 14 ++-
 ...ue-330-and-some-more-from-320-to-349.patch | 86 +++++++++----------
 ...al-buffer-overflow-for-ASCII-tags-wh.patch | 13 ++-
 ...ue-380-and-382-heap-buffer-overflow-.patch | 14 ++-
 ...-for-return-value-of-limitMalloc-392.patch | 15 ++--
 ...ag-avoid-calling-memcpy-with-a-null-.patch | 16 ++--
 .../0005-fix-the-FPE-in-tiffcrop-393.patch    | 15 ++--
 ...x-heap-buffer-overflow-in-tiffcp-278.patch | 15 ++--
 ...99c99f987dc32ae110370cfdd7df7975586b.patch |  9 +-
 .../libtiff/tiff/CVE-2022-1354.patch          |  8 +-
 .../libtiff/tiff/CVE-2022-1355.patch          |  8 +-
 .../libtiff/tiff/CVE-2022-2867.patch          |  2 +-
 .../libtiff/tiff/CVE-2022-2869.patch          |  2 +-
 .../libtiff/tiff/CVE-2022-2953.patch          | 30 +++----
 .../libtiff/tiff/CVE-2022-34526.patch         |  6 +-
 ...ed69a485a9cfb299d9f060eb2a46c54e5903.patch |  2 +-
 ...0712f4c3a5b449f70c57988260a667ddbdef.patch |  9 +-
 18 files changed, 118 insertions(+), 148 deletions(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch b/meta/recipes-multimedia/libtiff/tiff/0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch
index a28df6ed8c..a9dd42d755 100644
--- a/meta/recipes-multimedia/libtiff/tiff/0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch
@@ -1,4 +1,4 @@
-From 029da2cf70e8e38f10d62d4b0be440fb9d145af0 Mon Sep 17 00:00:00 2001
+From 6cfe933df4dbac5479801b2bd10103ef7db815ee Mon Sep 17 00:00:00 2001
 From: 4ugustus <wangdw.augustus@qq.com>
 Date: Sat, 11 Jun 2022 09:31:43 +0000
 Subject: [PATCH] fix the FPE in tiffcrop (#415, #427, and #428)
diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch b/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch
index f1a4ab4251..a4d8bebe8c 100644
--- a/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch
@@ -1,11 +1,12 @@
+From adfd6be615635705c2f4eb8dfe49e2f463786361 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Thu, 24 Feb 2022 22:26:02 +0100
+Subject: [PATCH] tif_jbig.c: fix crash when reading a file with multiple
+
 CVE: CVE-2022-0865
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-From 88da11ae3c4db527cb870fb1017456cc8fbac2e7 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Thu, 24 Feb 2022 22:26:02 +0100
-Subject: [PATCH 1/6] tif_jbig.c: fix crash when reading a file with multiple
  IFD in memory-mapped mode and when bit reversal is needed (fixes #385)
 
 ---
@@ -13,7 +14,7 @@ Subject: [PATCH 1/6] tif_jbig.c: fix crash when reading a file with multiple
  1 file changed, 10 insertions(+)
 
 diff --git a/libtiff/tif_jbig.c b/libtiff/tif_jbig.c
-index 74086338..8bfa4cef 100644
+index 7408633..8bfa4ce 100644
 --- a/libtiff/tif_jbig.c
 +++ b/libtiff/tif_jbig.c
 @@ -209,6 +209,16 @@ int TIFFInitJBIG(TIFF* tif, int scheme)
@@ -33,6 +34,3 @@ index 74086338..8bfa4cef 100644
  
  	/* Setup the function pointers for encode, decode, and cleanup. */
  	tif->tif_setupdecode = JBIGSetupDecode;
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch b/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch
index 07acf5eb90..7c4feabc38 100644
--- a/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch
@@ -1,7 +1,8 @@
-From e319508023580e2f70e6e626f745b5b2a1707313 Mon Sep 17 00:00:00 2001
+From 0ab805f46f68500da3b49d6f89380bab169bf6bb Mon Sep 17 00:00:00 2001
 From: Su Laus <sulau@freenet.de>
 Date: Tue, 10 May 2022 20:03:17 +0000
 Subject: [PATCH] tiffcrop: Fix issue #330 and some more from 320 to 349
+
 Upstream-Status: Backport
 Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
 ---
@@ -9,7 +10,7 @@ Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
  1 file changed, 210 insertions(+), 72 deletions(-)
 
 diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
-index 77cf6ed1..791ec5e7 100644
+index 99e4208..b596f9e 100644
 --- a/tools/tiffcrop.c
 +++ b/tools/tiffcrop.c
 @@ -63,20 +63,24 @@
@@ -67,7 +68,7 @@ index 77cf6ed1..791ec5e7 100644
  ;
  
  /* This function could be modified to pass starting sample offset 
-@@ -2121,6 +2131,15 @@ void  process_command_opts (int argc, char *argv[], char *mp, char *mode, uint32
+@@ -2123,6 +2133,15 @@ void  process_command_opts (int argc, char *argv[], char *mp, char *mode, uint32
  		/*NOTREACHED*/
        }
      }
@@ -83,7 +84,7 @@ index 77cf6ed1..791ec5e7 100644
    }  /* end process_command_opts */
  
  /* Start a new output file if one has not been previously opened or
-@@ -2746,7 +2765,7 @@ extractContigSamplesBytes (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -2748,7 +2767,7 @@ extractContigSamplesBytes (uint8_t *in, uint8_t *out, uint32_t cols,
                             tsample_t count, uint32_t start, uint32_t end)
    {
    int i, bytes_per_sample, sindex;
@@ -92,7 +93,7 @@ index 77cf6ed1..791ec5e7 100644
    uint32_t src_byte /*, src_bit */;
    uint8_t *src = in;
    uint8_t *dst = out;
-@@ -2757,6 +2776,10 @@ extractContigSamplesBytes (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -2759,6 +2778,10 @@ extractContigSamplesBytes (uint8_t *in, uint8_t *out, uint32_t cols,
      return (1);
      }
  
@@ -103,7 +104,7 @@ index 77cf6ed1..791ec5e7 100644
    if ((start > end) || (start > cols))
      {
      TIFFError ("extractContigSamplesBytes", 
-@@ -2769,6 +2792,9 @@ extractContigSamplesBytes (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -2771,6 +2794,9 @@ extractContigSamplesBytes (uint8_t *in, uint8_t *out, uint32_t cols,
                 "Invalid end column value %"PRIu32" ignored", end);
      end = cols;
      }
@@ -113,7 +114,7 @@ index 77cf6ed1..791ec5e7 100644
  
    dst_rowsize = (bps * (end - start) * count) / 8;
  
-@@ -2812,7 +2838,7 @@ extractContigSamples8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -2814,7 +2840,7 @@ extractContigSamples8bits (uint8_t *in, uint8_t *out, uint32_t cols,
                             tsample_t count, uint32_t start, uint32_t end)
    {
    int    ready_bits = 0, sindex = 0;
@@ -122,7 +123,7 @@ index 77cf6ed1..791ec5e7 100644
    uint8_t  maskbits = 0, matchbits = 0;
    uint8_t  buff1 = 0, buff2 = 0;
    uint8_t *src = in;
-@@ -2824,6 +2850,10 @@ extractContigSamples8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -2826,6 +2852,10 @@ extractContigSamples8bits (uint8_t *in, uint8_t *out, uint32_t cols,
      return (1);
      }
  
@@ -133,7 +134,7 @@ index 77cf6ed1..791ec5e7 100644
    if ((start > end) || (start > cols))
      {
      TIFFError ("extractContigSamples8bits", 
-@@ -2836,7 +2866,10 @@ extractContigSamples8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -2838,7 +2868,10 @@ extractContigSamples8bits (uint8_t *in, uint8_t *out, uint32_t cols,
                 "Invalid end column value %"PRIu32" ignored", end);
      end = cols;
      }
@@ -145,7 +146,7 @@ index 77cf6ed1..791ec5e7 100644
    ready_bits = 0;
    maskbits =  (uint8_t)-1 >> (8 - bps);
    buff1 = buff2 = 0;
-@@ -2889,7 +2922,7 @@ extractContigSamples16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -2891,7 +2924,7 @@ extractContigSamples16bits (uint8_t *in, uint8_t *out, uint32_t cols,
                              tsample_t count, uint32_t start, uint32_t end)
    {
    int    ready_bits = 0, sindex = 0;
@@ -154,7 +155,7 @@ index 77cf6ed1..791ec5e7 100644
    uint16_t maskbits = 0, matchbits = 0;
    uint16_t buff1 = 0, buff2 = 0;
    uint8_t  bytebuff = 0;
-@@ -2902,6 +2935,10 @@ extractContigSamples16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -2904,6 +2937,10 @@ extractContigSamples16bits (uint8_t *in, uint8_t *out, uint32_t cols,
      return (1);
      }
  
@@ -165,7 +166,7 @@ index 77cf6ed1..791ec5e7 100644
    if ((start > end) || (start > cols))
      {
      TIFFError ("extractContigSamples16bits", 
-@@ -2914,6 +2951,9 @@ extractContigSamples16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -2916,6 +2953,9 @@ extractContigSamples16bits (uint8_t *in, uint8_t *out, uint32_t cols,
                 "Invalid end column value %"PRIu32" ignored", end);
      end = cols;
      }
@@ -175,7 +176,7 @@ index 77cf6ed1..791ec5e7 100644
  
    ready_bits = 0;
    maskbits = (uint16_t)-1 >> (16 - bps);
-@@ -2978,7 +3018,7 @@ extractContigSamples24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -2980,7 +3020,7 @@ extractContigSamples24bits (uint8_t *in, uint8_t *out, uint32_t cols,
                              tsample_t count, uint32_t start, uint32_t end)
    {
    int    ready_bits = 0, sindex = 0;
@@ -184,7 +185,7 @@ index 77cf6ed1..791ec5e7 100644
    uint32_t maskbits = 0, matchbits = 0;
    uint32_t buff1 = 0, buff2 = 0;
    uint8_t  bytebuff1 = 0, bytebuff2 = 0;
-@@ -2991,6 +3031,10 @@ extractContigSamples24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -2993,6 +3033,10 @@ extractContigSamples24bits (uint8_t *in, uint8_t *out, uint32_t cols,
      return (1);
      }
  
@@ -195,7 +196,7 @@ index 77cf6ed1..791ec5e7 100644
    if ((start > end) || (start > cols))
      {
      TIFFError ("extractContigSamples24bits", 
-@@ -3003,6 +3047,9 @@ extractContigSamples24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -3005,6 +3049,9 @@ extractContigSamples24bits (uint8_t *in, uint8_t *out, uint32_t cols,
                 "Invalid end column value %"PRIu32" ignored", end);
      end = cols;
      }
@@ -205,7 +206,7 @@ index 77cf6ed1..791ec5e7 100644
  
    ready_bits = 0;
    maskbits =  (uint32_t)-1 >> (32 - bps);
-@@ -3087,7 +3134,7 @@ extractContigSamples32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -3089,7 +3136,7 @@ extractContigSamples32bits (uint8_t *in, uint8_t *out, uint32_t cols,
                              tsample_t count, uint32_t start, uint32_t end)
    {
    int    ready_bits = 0, sindex = 0 /*, shift_width = 0 */;
@@ -214,7 +215,7 @@ index 77cf6ed1..791ec5e7 100644
    uint32_t longbuff1 = 0, longbuff2 = 0;
    uint64_t maskbits = 0, matchbits = 0;
    uint64_t buff1 = 0, buff2 = 0, buff3 = 0;
-@@ -3102,6 +3149,10 @@ extractContigSamples32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -3104,6 +3151,10 @@ extractContigSamples32bits (uint8_t *in, uint8_t *out, uint32_t cols,
      }
  
  
@@ -225,7 +226,7 @@ index 77cf6ed1..791ec5e7 100644
    if ((start > end) || (start > cols))
      {
      TIFFError ("extractContigSamples32bits", 
-@@ -3114,6 +3165,9 @@ extractContigSamples32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -3116,6 +3167,9 @@ extractContigSamples32bits (uint8_t *in, uint8_t *out, uint32_t cols,
                 "Invalid end column value %"PRIu32" ignored", end);
      end = cols;
      }
@@ -235,7 +236,7 @@ index 77cf6ed1..791ec5e7 100644
  
    /* shift_width = ((bps + 7) / 8) + 1; */ 
    ready_bits = 0;
-@@ -3193,7 +3247,7 @@ extractContigSamplesShifted8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -3195,7 +3249,7 @@ extractContigSamplesShifted8bits (uint8_t *in, uint8_t *out, uint32_t cols,
                                    int shift)
    {
    int    ready_bits = 0, sindex = 0;
@@ -244,7 +245,7 @@ index 77cf6ed1..791ec5e7 100644
    uint8_t  maskbits = 0, matchbits = 0;
    uint8_t  buff1 = 0, buff2 = 0;
    uint8_t *src = in;
-@@ -3205,6 +3259,10 @@ extractContigSamplesShifted8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -3207,6 +3261,10 @@ extractContigSamplesShifted8bits (uint8_t *in, uint8_t *out, uint32_t cols,
      return (1);
      }
  
@@ -255,7 +256,7 @@ index 77cf6ed1..791ec5e7 100644
    if ((start > end) || (start > cols))
      {
      TIFFError ("extractContigSamplesShifted8bits", 
-@@ -3217,6 +3275,9 @@ extractContigSamplesShifted8bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -3219,6 +3277,9 @@ extractContigSamplesShifted8bits (uint8_t *in, uint8_t *out, uint32_t cols,
                 "Invalid end column value %"PRIu32" ignored", end);
      end = cols;
      }
@@ -265,7 +266,7 @@ index 77cf6ed1..791ec5e7 100644
  
    ready_bits = shift;
    maskbits =  (uint8_t)-1 >> (8 - bps);
-@@ -3273,7 +3334,7 @@ extractContigSamplesShifted16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -3275,7 +3336,7 @@ extractContigSamplesShifted16bits (uint8_t *in, uint8_t *out, uint32_t cols,
                                     int shift)
    {
    int    ready_bits = 0, sindex = 0;
@@ -274,7 +275,7 @@ index 77cf6ed1..791ec5e7 100644
    uint16_t maskbits = 0, matchbits = 0;
    uint16_t buff1 = 0, buff2 = 0;
    uint8_t  bytebuff = 0;
-@@ -3286,6 +3347,10 @@ extractContigSamplesShifted16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -3288,6 +3349,10 @@ extractContigSamplesShifted16bits (uint8_t *in, uint8_t *out, uint32_t cols,
      return (1);
      }
  
@@ -285,7 +286,7 @@ index 77cf6ed1..791ec5e7 100644
    if ((start > end) || (start > cols))
      {
      TIFFError ("extractContigSamplesShifted16bits", 
-@@ -3298,6 +3363,9 @@ extractContigSamplesShifted16bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -3300,6 +3365,9 @@ extractContigSamplesShifted16bits (uint8_t *in, uint8_t *out, uint32_t cols,
                 "Invalid end column value %"PRIu32" ignored", end);
      end = cols;
      }
@@ -295,7 +296,7 @@ index 77cf6ed1..791ec5e7 100644
  
    ready_bits = shift;
    maskbits = (uint16_t)-1 >> (16 - bps);
-@@ -3363,7 +3431,7 @@ extractContigSamplesShifted24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -3365,7 +3433,7 @@ extractContigSamplesShifted24bits (uint8_t *in, uint8_t *out, uint32_t cols,
                                     int shift)
    {
    int    ready_bits = 0, sindex = 0;
@@ -304,7 +305,7 @@ index 77cf6ed1..791ec5e7 100644
    uint32_t maskbits = 0, matchbits = 0;
    uint32_t buff1 = 0, buff2 = 0;
    uint8_t  bytebuff1 = 0, bytebuff2 = 0;
-@@ -3376,6 +3444,16 @@ extractContigSamplesShifted24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -3378,6 +3446,16 @@ extractContigSamplesShifted24bits (uint8_t *in, uint8_t *out, uint32_t cols,
      return (1);
      }
  
@@ -321,7 +322,7 @@ index 77cf6ed1..791ec5e7 100644
    if ((start > end) || (start > cols))
      {
      TIFFError ("extractContigSamplesShifted24bits", 
-@@ -3388,6 +3466,9 @@ extractContigSamplesShifted24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -3390,6 +3468,9 @@ extractContigSamplesShifted24bits (uint8_t *in, uint8_t *out, uint32_t cols,
                 "Invalid end column value %"PRIu32" ignored", end);
      end = cols;
      }
@@ -331,7 +332,7 @@ index 77cf6ed1..791ec5e7 100644
  
    ready_bits = shift;
    maskbits =  (uint32_t)-1 >> (32 - bps);
-@@ -3449,7 +3530,7 @@ extractContigSamplesShifted24bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -3451,7 +3532,7 @@ extractContigSamplesShifted24bits (uint8_t *in, uint8_t *out, uint32_t cols,
      buff2 = (buff2 << 8);
      bytebuff2 = bytebuff1;
      ready_bits -= 8;
@@ -340,7 +341,7 @@ index 77cf6ed1..791ec5e7 100644
     
    return (0);
    } /* end extractContigSamplesShifted24bits */
-@@ -3461,7 +3542,7 @@ extractContigSamplesShifted32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -3463,7 +3544,7 @@ extractContigSamplesShifted32bits (uint8_t *in, uint8_t *out, uint32_t cols,
                                     int shift)
    {
    int    ready_bits = 0, sindex = 0 /*, shift_width = 0 */;
@@ -349,7 +350,7 @@ index 77cf6ed1..791ec5e7 100644
    uint32_t longbuff1 = 0, longbuff2 = 0;
    uint64_t maskbits = 0, matchbits = 0;
    uint64_t buff1 = 0, buff2 = 0, buff3 = 0;
-@@ -3476,6 +3557,10 @@ extractContigSamplesShifted32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -3478,6 +3559,10 @@ extractContigSamplesShifted32bits (uint8_t *in, uint8_t *out, uint32_t cols,
      }
  
  
@@ -360,7 +361,7 @@ index 77cf6ed1..791ec5e7 100644
    if ((start > end) || (start > cols))
      {
      TIFFError ("extractContigSamplesShifted32bits", 
-@@ -3488,6 +3573,9 @@ extractContigSamplesShifted32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+@@ -3490,6 +3575,9 @@ extractContigSamplesShifted32bits (uint8_t *in, uint8_t *out, uint32_t cols,
                 "Invalid end column value %"PRIu32" ignored", end);
      end = cols;
      }
@@ -370,7 +371,7 @@ index 77cf6ed1..791ec5e7 100644
  
    /* shift_width = ((bps + 7) / 8) + 1; */ 
    ready_bits = shift;
-@@ -5429,7 +5517,7 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+@@ -5431,7 +5519,7 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
    {
    struct offset offsets;
    int    i;
@@ -379,7 +380,7 @@ index 77cf6ed1..791ec5e7 100644
    uint32_t seg, total, need_buff = 0;
    uint32_t buffsize;
    uint32_t zwidth, zlength;
-@@ -5510,8 +5598,13 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+@@ -5512,8 +5600,13 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
      seg = crop->zonelist[j].position;
      total = crop->zonelist[j].total;
  
@@ -394,7 +395,7 @@ index 77cf6ed1..791ec5e7 100644
          continue;
      }
  
-@@ -5524,17 +5617,23 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+@@ -5526,17 +5619,23 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
  
             crop->regionlist[i].x1 = offsets.startx + 
                                    (uint32_t)(offsets.crop_width * 1.0 * (seg - 1) / total);
@@ -428,7 +429,7 @@ index 77cf6ed1..791ec5e7 100644
             zwidth = crop->regionlist[i].x2 - crop->regionlist[i].x1  + 1;
  
  	   /* This is passed to extractCropZone or extractCompositeZones */
-@@ -5549,22 +5648,27 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+@@ -5551,22 +5650,27 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
  	   crop->regionlist[i].x1 = offsets.startx;
             crop->regionlist[i].x2 = offsets.endx;
  
@@ -471,7 +472,7 @@ index 77cf6ed1..791ec5e7 100644
             zlength = crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
  
  	   /* This is passed to extractCropZone or extractCompositeZones */
-@@ -5575,32 +5679,42 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+@@ -5577,32 +5681,42 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
             crop->combined_width = (uint32_t)zwidth;
             break;
        case EDGE_RIGHT: /* zones from right to left, length from top */
@@ -539,7 +540,7 @@ index 77cf6ed1..791ec5e7 100644
        case EDGE_TOP: /* width from left, zones from top to bottom */
        default:
             zwidth = offsets.crop_width;
-@@ -5608,6 +5722,14 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+@@ -5610,6 +5724,14 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
             crop->regionlist[i].x2 = offsets.endx;
  
             crop->regionlist[i].y1 = offsets.starty + (uint32_t)(offsets.crop_length * 1.0 * (seg - 1) / total);
@@ -554,7 +555,7 @@ index 77cf6ed1..791ec5e7 100644
             test = offsets.starty + (uint32_t)(offsets.crop_length * 1.0 * seg / total);
             if (test < 1 )
               crop->regionlist[i].y2 = 0;
-@@ -5618,6 +5740,18 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+@@ -5620,6 +5742,18 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
               else
  	       crop->regionlist[i].y2 = test - 1;
  	     }
@@ -573,7 +574,7 @@ index 77cf6ed1..791ec5e7 100644
             zlength = crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
  
  	   /* This is passed to extractCropZone or extractCompositeZones */
-@@ -7551,7 +7685,8 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+@@ -7543,7 +7677,8 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
      total_width = total_length = 0;
      for (i = 0; i < crop->selections; i++)
        {
@@ -583,7 +584,7 @@ index 77cf6ed1..791ec5e7 100644
        crop_buff = seg_buffs[i].buffer; 
        if (!crop_buff)
          crop_buff = (unsigned char *)limitMalloc(cropsize);
-@@ -7640,6 +7775,9 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+@@ -7632,6 +7767,9 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
  
        if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can reallocate the buffer */
          {
@@ -593,7 +594,7 @@ index 77cf6ed1..791ec5e7 100644
  	if (rotateImage(crop->rotation, image, &crop->regionlist[i].width, 
  			&crop->regionlist[i].length, &crop_buff))
            {
-@@ -7655,8 +7793,8 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+@@ -7647,8 +7785,8 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
          seg_buffs[i].size = (((crop->regionlist[i].width * image->bps + 7 ) / 8)
                                 * image->spp) * crop->regionlist[i].length; 
          }
@@ -604,6 +605,3 @@ index 77cf6ed1..791ec5e7 100644
    return (0);
    } /* end processCropSelections */
  
--- 
-2.33.0
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch b/meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
index 72776f09ba..e79964de55 100644
--- a/meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch
@@ -1,11 +1,12 @@
+From bc71e64b6f4477ed69064802b1252bab904a89b4 Mon Sep 17 00:00:00 2001
+From: 4ugustus <wangdw.augustus@qq.com>
+Date: Tue, 25 Jan 2022 16:25:28 +0000
+Subject: [PATCH] tiffset: fix global-buffer-overflow for ASCII tags where
+
 CVE: CVE-2022-22844
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-From b12a0326e6064b6e0b051d1184a219877472f69b Mon Sep 17 00:00:00 2001
-From: 4ugustus <wangdw.augustus@qq.com>
-Date: Tue, 25 Jan 2022 16:25:28 +0000
-Subject: [PATCH] tiffset: fix global-buffer-overflow for ASCII tags where
  count is required (fixes #355)
 
 ---
@@ -13,7 +14,7 @@ Subject: [PATCH] tiffset: fix global-buffer-overflow for ASCII tags where
  1 file changed, 13 insertions(+), 3 deletions(-)
 
 diff --git a/tools/tiffset.c b/tools/tiffset.c
-index 8c9e23c5..e7a88c09 100644
+index 8c9e23c..e7a88c0 100644
 --- a/tools/tiffset.c
 +++ b/tools/tiffset.c
 @@ -146,9 +146,19 @@ main(int argc, char* argv[])
@@ -39,5 +40,3 @@ index 8c9e23c5..e7a88c09 100644
              } else if (TIFFFieldWriteCount(fip) > 0
  		       || TIFFFieldWriteCount(fip) == TIFF_VARIABLE) {
                  int     ret = 1;
--- 
-2.25.1
diff --git a/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch b/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
index 812ffb232d..2becf53806 100644
--- a/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
@@ -1,12 +1,13 @@
+From 9b2645d830b4ad004824cf28d81f3b974faf0037 Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Tue, 8 Mar 2022 17:02:44 +0000
+Subject: [PATCH] tiffcrop: fix issue #380 and #382 heap buffer overflow in
+
 CVE: CVE-2022-0891
 CVE: CVE-2022-1056
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-From e46b49e60fddb2e924302fb1751f79eb9cfb2253 Mon Sep 17 00:00:00 2001
-From: Su Laus <sulau@freenet.de>
-Date: Tue, 8 Mar 2022 17:02:44 +0000
-Subject: [PATCH 2/6] tiffcrop: fix issue #380 and #382 heap buffer overflow in
  extractImageSection
 
 ---
@@ -14,7 +15,7 @@ Subject: [PATCH 2/6] tiffcrop: fix issue #380 and #382 heap buffer overflow in
  1 file changed, 36 insertions(+), 56 deletions(-)
 
 diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
-index b85c2ce7..302a7e91 100644
+index b85c2ce..302a7e9 100644
 --- a/tools/tiffcrop.c
 +++ b/tools/tiffcrop.c
 @@ -105,8 +105,8 @@
@@ -214,6 +215,3 @@ index b85c2ce7..302a7e91 100644
      /* allocate a buffer if we don't have one already */
      if (createImageSection(sectsize, sect_buff_ptr))
        {
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch b/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch
index a0b856b9e1..b48a3df1a9 100644
--- a/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-value-of-limitMalloc-392.patch
@@ -1,18 +1,18 @@
+From b4743cc69d2f506e1f1c4db9adc8e58d75805e4d Mon Sep 17 00:00:00 2001
+From: Augustus <wangdw.augustus@qq.com>
+Date: Mon, 7 Mar 2022 18:21:49 +0800
+Subject: [PATCH] add checks for return value of limitMalloc (#392)
+
 CVE: CVE-2022-0907
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-From a139191cc86f4dc44c74a0f22928e0fb38ed2485 Mon Sep 17 00:00:00 2001
-From: Augustus <wangdw.augustus@qq.com>
-Date: Mon, 7 Mar 2022 18:21:49 +0800
-Subject: [PATCH 3/6] add checks for return value of limitMalloc (#392)
-
 ---
  tools/tiffcrop.c | 33 +++++++++++++++++++++------------
  1 file changed, 21 insertions(+), 12 deletions(-)
 
 diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
-index 302a7e91..e407bf51 100644
+index 302a7e9..e407bf5 100644
 --- a/tools/tiffcrop.c
 +++ b/tools/tiffcrop.c
 @@ -7357,7 +7357,11 @@ createImageSection(uint32_t sectsize, unsigned char **sect_buff_ptr)
@@ -88,6 +88,3 @@ index 302a7e91..e407bf51 100644
   * End:
   */
 +
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch b/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch
index 719dabaecc..6f2df44bd5 100644
--- a/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch
@@ -1,11 +1,12 @@
+From 0343619094bfc7b8e23814f672411b008db2aa66 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Thu, 17 Feb 2022 15:28:43 +0100
+Subject: [PATCH] TIFFFetchNormalTag(): avoid calling memcpy() with a null
+
 CVE: CVE-2022-0908
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-From ef5a0bf271823df168642444d051528a68205cb0 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Thu, 17 Feb 2022 15:28:43 +0100
-Subject: [PATCH 4/6] TIFFFetchNormalTag(): avoid calling memcpy() with a null
  source pointer and size of zero (fixes #383)
 
 ---
@@ -13,10 +14,10 @@ Subject: [PATCH 4/6] TIFFFetchNormalTag(): avoid calling memcpy() with a null
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index d84147a0..4e8ce729 100644
+index d654a1c..a31109a 100644
 --- a/libtiff/tif_dirread.c
 +++ b/libtiff/tif_dirread.c
-@@ -5079,7 +5079,10 @@ TIFFFetchNormalTag(TIFF* tif, TIFFDirEntry* dp, int recover)
+@@ -5080,7 +5080,10 @@ TIFFFetchNormalTag(TIFF* tif, TIFFDirEntry* dp, int recover)
  								_TIFFfree(data);
  							return(0);
  						}
@@ -28,6 +29,3 @@ index d84147a0..4e8ce729 100644
  						o[(uint32_t)dp->tdir_count]=0;
  						if (data!=0)
  							_TIFFfree(data);
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch b/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch
index 64dbe9ef92..21dc552036 100644
--- a/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-393.patch
@@ -1,18 +1,18 @@
+From e56d66a033b533f26872a20cb2052473962a0f2e Mon Sep 17 00:00:00 2001
+From: 4ugustus <wangdw.augustus@qq.com>
+Date: Tue, 8 Mar 2022 16:22:04 +0000
+Subject: [PATCH] fix the FPE in tiffcrop (#393)
+
 CVE: CVE-2022-0909
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-From 4768355a074d562177e0a8b551c561d1af7eb74a Mon Sep 17 00:00:00 2001
-From: 4ugustus <wangdw.augustus@qq.com>
-Date: Tue, 8 Mar 2022 16:22:04 +0000
-Subject: [PATCH 5/6] fix the FPE in tiffcrop (#393)
-
 ---
  libtiff/tif_dir.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libtiff/tif_dir.c b/libtiff/tif_dir.c
-index a6c254fc..77da6ea4 100644
+index a6c254f..77da6ea 100644
 --- a/libtiff/tif_dir.c
 +++ b/libtiff/tif_dir.c
 @@ -335,13 +335,13 @@ _TIFFVSetField(TIFF* tif, uint32_t tag, va_list ap)
@@ -31,6 +31,3 @@ index a6c254fc..77da6ea4 100644
              goto badvaluedouble;
  		td->td_yresolution = _TIFFClampDoubleToFloat( dblval );
  		break;
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch b/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch
index afd5e59960..337b84d992 100644
--- a/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-in-tiffcp-278.patch
@@ -1,18 +1,18 @@
+From 2dd282a54e5fccf9b501973e6da5f83ebde8e980 Mon Sep 17 00:00:00 2001
+From: 4ugustus <wangdw.augustus@qq.com>
+Date: Thu, 10 Mar 2022 08:48:00 +0000
+Subject: [PATCH] fix heap buffer overflow in tiffcp (#278)
+
 CVE: CVE-2022-0924
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-From 1074b9691322b1e3671cd8ea0b6b3509d08978fb Mon Sep 17 00:00:00 2001
-From: 4ugustus <wangdw.augustus@qq.com>
-Date: Thu, 10 Mar 2022 08:48:00 +0000
-Subject: [PATCH 6/6] fix heap buffer overflow in tiffcp (#278)
-
 ---
  tools/tiffcp.c | 17 ++++++++++++++++-
  1 file changed, 16 insertions(+), 1 deletion(-)
 
 diff --git a/tools/tiffcp.c b/tools/tiffcp.c
-index 1f889516..552d8fad 100644
+index 1f88951..552d8fa 100644
 --- a/tools/tiffcp.c
 +++ b/tools/tiffcp.c
 @@ -1661,12 +1661,27 @@ DECLAREwriteFunc(writeBufferToSeparateStrips)
@@ -52,6 +52,3 @@ index 1f889516..552d8fad 100644
  			if (TIFFWriteEncodedStrip(out, strip++, obuf, stripsize) < 0) {
  				TIFFError(TIFFFileName(out),
  				    "Error, can't write strip %"PRIu32,
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch b/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
index 0b41dde606..e5b34fd258 100644
--- a/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
@@ -1,4 +1,4 @@
-From 561599c99f987dc32ae110370cfdd7df7975586b Mon Sep 17 00:00:00 2001
+From 7b91458541769f3d7eddc55a39d01730af2489fc Mon Sep 17 00:00:00 2001
 From: Even Rouault <even.rouault@spatialys.com>
 Date: Sat, 5 Feb 2022 20:36:41 +0100
 Subject: [PATCH] TIFFReadDirectory(): avoid calling memcpy() with a null
@@ -12,10 +12,10 @@ CVE: CVE-2022-0562
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index 2bbc4585..23194ced 100644
+index d84147a..ae52ad4 100644
 --- a/libtiff/tif_dirread.c
 +++ b/libtiff/tif_dirread.c
-@@ -4177,7 +4177,8 @@ TIFFReadDirectory(TIFF* tif)
+@@ -4173,7 +4173,8 @@ TIFFReadDirectory(TIFF* tif)
                      goto bad;
                  }
  
@@ -25,6 +25,3 @@ index 2bbc4585..23194ced 100644
                  _TIFFsetShortArray(&tif->tif_dir.td_sampleinfo, new_sampleinfo, tif->tif_dir.td_extrasamples);
                  _TIFFfree(new_sampleinfo);
          }
--- 
-GitLab
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
index 71b85cac10..989ccbfa50 100644
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
@@ -1,4 +1,4 @@
-From 87881e093691a35c60b91cafed058ba2dd5d9807 Mon Sep 17 00:00:00 2001
+From 281fa3cf0e0e8a44b93478c63d90dbfb64359e88 Mon Sep 17 00:00:00 2001
 From: Even Rouault <even.rouault@spatialys.com>
 Date: Sun, 5 Dec 2021 14:37:46 +0100
 Subject: [PATCH] TIFFReadDirectory: fix OJPEG hack (fixes #319)
@@ -16,12 +16,13 @@ Upstream-Status: Backport
 [https://gitlab.com/libtiff/libtiff/-/commit/87f580f39011109b3bb5f6eca13fac543a542798]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
 ---
  libtiff/tif_dirread.c | 162 ++++++++++++++++++++++--------------------
  1 file changed, 83 insertions(+), 79 deletions(-)
 
 diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index 8f434ef5..14c031d1 100644
+index a31109a..d7cccbe 100644
 --- a/libtiff/tif_dirread.c
 +++ b/libtiff/tif_dirread.c
 @@ -3794,50 +3794,7 @@ TIFFReadDirectory(TIFF* tif)
@@ -207,6 +208,3 @@ index 8f434ef5..14c031d1 100644
  	/*
  	 * Make sure all non-color channels are extrasamples.
  	 * If it's not the case, define them as such.
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch
index e59f5aad55..19ce68dfbc 100644
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch
@@ -1,4 +1,4 @@
-From fb1db384959698edd6caeea84e28253d272a0f96 Mon Sep 17 00:00:00 2001
+From 19d775e058bf6bb0b0e9c56f406b775f9e725355 Mon Sep 17 00:00:00 2001
 From: Su_Laus <sulau@freenet.de>
 Date: Sat, 2 Apr 2022 22:33:31 +0200
 Subject: [PATCH] tiffcp: avoid buffer overflow in "mode" string (fixes #400)
@@ -9,12 +9,13 @@ Upstream-Status: Backport
 [https://gitlab.com/libtiff/libtiff/-/commit/c1ae29f9ebacd29b7c3e0c7db671af7db3584bc2]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
 ---
  tools/tiffcp.c | 25 ++++++++++++++++++++-----
  1 file changed, 20 insertions(+), 5 deletions(-)
 
 diff --git a/tools/tiffcp.c b/tools/tiffcp.c
-index fd129bb7..8d944ff6 100644
+index 552d8fa..57eef90 100644
 --- a/tools/tiffcp.c
 +++ b/tools/tiffcp.c
 @@ -274,19 +274,34 @@ main(int argc, char* argv[])
@@ -57,6 +58,3 @@ index fd129bb7..8d944ff6 100644
  			break;
  		case 'x':
  			pageInSeq = 1;
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2867.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2867.patch
index ae33a3b4e7..73905acb17 100644
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2867.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2867.patch
@@ -1,4 +1,4 @@
-From 6ad097dac1d4908705f5a9d43dea76b7f2de89eb Mon Sep 17 00:00:00 2001
+From cca32f0d4f3dd2bd73d044bd6991ab3c764fc718 Mon Sep 17 00:00:00 2001
 From: Su_Laus <sulau@freenet.de>
 Date: Sun, 6 Feb 2022 17:53:53 +0100
 Subject: [PATCH] tiffcrop.c: This update fixes also issues #350 and #351.
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2869.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2869.patch
index 9a23e23fed..bda3427c0f 100644
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2869.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2869.patch
@@ -1,4 +1,4 @@
-From 0ec36342df880f5ad41576cb1b03061b8697dabd Mon Sep 17 00:00:00 2001
+From b4cf40182c865db554c6e67034afa6ea12c5554d Mon Sep 17 00:00:00 2001
 From: Su_Laus <sulau@freenet.de>
 Date: Sun, 6 Feb 2022 10:53:45 +0100
 Subject: [PATCH] tiffcrop.c: Fix issue #352 heap-buffer-overflow by correcting
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
index 3a3a915688..92906521b0 100644
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
@@ -1,16 +1,18 @@
+From 05ef5e05a0b8d18ab075e09b1ea349acc0035e67 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Mon, 15 Aug 2022 22:11:03 +0200
+Subject: [PATCH] tiffcrop: disable incompatibility of -S
+
 CVE: CVE-2022-2953
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
 
-From 8fe3735942ea1d90d8cef843b55b3efe8ab6feaf Mon Sep 17 00:00:00 2001
-From: Su_Laus <sulau@freenet.de>
-Date: Mon, 15 Aug 2022 22:11:03 +0200
-Subject: [PATCH] =?UTF-8?q?According=20to=20Richard=20Nolde=20https://gitl?=
- =?UTF-8?q?ab.com/libtiff/libtiff/-/issues/401#note=5F877637400=20the=20ti?=
- =?UTF-8?q?ffcrop=20option=20=E2=80=9E-S=E2=80=9C=20is=20also=20mutually?=
- =?UTF-8?q?=20exclusive=20to=20the=20other=20crop=20options=20(-X|-Y),=20-?=
- =?UTF-8?q?Z=20and=20-z.?=
+According to Richard Nolde
+https://gitlab.com/libtiff/libtiff/-/issues/401#note_877637400 the
+tiffcrop option "-S" is also mutually exclusive to the other crop
+options (-X|-Y), -Z and -z.
+
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -18,12 +20,13 @@ Content-Transfer-Encoding: 8bit
 This is now checked and ends tiffcrop if those arguments are not mutually exclusive.
 
 This MR will fix the following tiffcrop issues: #349, #414, #422, #423, #424
+
 ---
- tools/tiffcrop.c | 31 ++++++++++++++++---------------
- 1 file changed, 16 insertions(+), 15 deletions(-)
+ tools/tiffcrop.c | 25 +++++++++++++------------
+ 1 file changed, 13 insertions(+), 12 deletions(-)
 
 diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
-index 90286a5e..c3b758ec 100644
+index b596f9e..8af85c9 100644
 --- a/tools/tiffcrop.c
 +++ b/tools/tiffcrop.c
 @@ -173,12 +173,12 @@ static   char tiffcrop_rev_date[] = "02-09-2022";
@@ -63,7 +66,7 @@ index 90286a5e..c3b758ec 100644
  "             In no case should the options be applied to a given selection successively.\n"
  "\n"
  ;
-@@ -2131,13 +2131,14 @@ void  process_command_opts (int argc, char *argv[], char *mp, char *mode, uint32
+@@ -2133,13 +2133,14 @@ void  process_command_opts (int argc, char *argv[], char *mp, char *mode, uint32
  		/*NOTREACHED*/
        }
      }
@@ -82,6 +85,3 @@ index 90286a5e..c3b758ec 100644
          exit(EXIT_FAILURE);
      }
    }  /* end process_command_opts */
--- 
-2.34.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-34526.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-34526.patch
index 48ca56982f..f3f8121735 100644
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-34526.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-34526.patch
@@ -1,4 +1,4 @@
-From 3fc1fdda0068981340cc7ae136173731275e2c5e Mon Sep 17 00:00:00 2001
+From 786a8b6fd1384c6e20c17729822d1f61ed569320 Mon Sep 17 00:00:00 2001
 From: Hitendra Prajapati <hprajapati@mvista.com>
 Date: Thu, 18 Aug 2022 10:46:30 +0530
 Subject: [PATCH] CVE-2022-34526
@@ -6,6 +6,7 @@ Subject: [PATCH] CVE-2022-34526
 Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/275735d0354e39c0ac1dc3c0db2120d6f31d1990]
 CVE: CVE-2022-34526
 Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
 ---
  libtiff/tif_dirinfo.c | 3 +++
  1 file changed, 3 insertions(+)
@@ -24,6 +25,3 @@ index 8565dfb..0f722a5 100644
  	/* Check if codec specific tags are allowed for the current
  	 * compression scheme (codec) */
  	switch (tif->tif_dir.td_compression) {
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch b/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch
index 1fa6a11104..272dd3d713 100644
--- a/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch
@@ -1,4 +1,4 @@
-From 740111312ca6ae718f233d914662a9969e6820ee Mon Sep 17 00:00:00 2001
+From fb89eab3ed46bbb0276bdee05b570455f6a27d2f Mon Sep 17 00:00:00 2001
 From: Su_Laus <sulau@freenet.de>
 Date: Sun, 6 Feb 2022 19:52:17 +0100
 Subject: [PATCH] Move the crop_width and crop_length computation after the
diff --git a/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch b/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
index 74f9649fdf..5a84491711 100644
--- a/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch
@@ -1,4 +1,4 @@
-From eecb0712f4c3a5b449f70c57988260a667ddbdef Mon Sep 17 00:00:00 2001
+From 895867b72bd6c46da79de1a07d0993cd104e92cd Mon Sep 17 00:00:00 2001
 From: Even Rouault <even.rouault@spatialys.com>
 Date: Sun, 6 Feb 2022 13:08:38 +0100
 Subject: [PATCH] TIFFFetchStripThing(): avoid calling memcpy() with a null
@@ -12,10 +12,10 @@ CVE: CVE-2022-0561
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index 23194ced..50ebf8ac 100644
+index ae52ad4..d654a1c 100644
 --- a/libtiff/tif_dirread.c
 +++ b/libtiff/tif_dirread.c
-@@ -5777,8 +5777,9 @@ TIFFFetchStripThing(TIFF* tif, TIFFDirEntry* dir, uint32_t nstrips, uint64_t** l
+@@ -5766,8 +5766,9 @@ TIFFFetchStripThing(TIFF* tif, TIFFDirEntry* dir, uint32_t nstrips, uint64_t** l
  			_TIFFfree(data);
  			return(0);
  		}
@@ -27,6 +27,3 @@ index 23194ced..50ebf8ac 100644
  		_TIFFfree(data);
  		data=resizeddata;
  	}
--- 
-GitLab
-
-- 
2.38.1


