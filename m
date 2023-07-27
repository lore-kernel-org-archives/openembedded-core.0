Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259D2C41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:22 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.16716.1690487052799408894
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=tTSz8jmG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1bbd03cb7c1so8787255ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487052; x=1691091852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cl8fTeXoOvOfo6aF6zHgWT2JTnu7GV5OESC9lT6kToo=;
        b=tTSz8jmGS80SjQdLqTRyE2v7oUYCzvxMRmAPKYPlBUYA4/opFFKSoeh/pPVXcBk4eh
         bFPrQn6LAoF3hWG1je8Azi4gQpI3+sMJ2zsedp4iDDdBjqqvZ0MbmmE58krdn7xcGOmP
         aWa/wkIkpov/YB5urTy4jqwwpZQcubHGSkFjxZiwwd32y5tjpCbSGF5xnMwRKsQ/rLt4
         0RsDhUR3G9X4zfar1fuQQyqs9DiNosRJ8pzmthMkESyZfejs+gOAfZP7QBGG+ydrJHZu
         Idpg5Dv0b/OxHqvfnWtma2UftE5j8O/GnCuUkL7nd/SPh0vJS9xUnEfRPwKgl70Az62h
         86hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487052; x=1691091852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cl8fTeXoOvOfo6aF6zHgWT2JTnu7GV5OESC9lT6kToo=;
        b=UC0cZl0fmGiRQEEwN81kp+nYKTFHw4nU/S76jF+luBGQi8aw8K87Jxo8NkrvDSwwSC
         0FOuBgANhrzYdH4jMz6Lh1aluhilUDIui+niG+eLRI8P+c6LBbFzjXWjhFWBCOZrr/N9
         YUmYinMeLfis/RIWOKXFfOhuX4zlCqCLN7jjYpHWFIdwTpbIgPxR+ObxtBO27BbreCH1
         OwSu3TNZUvA25PR6uDjQZLtsyWu0sXSRY3bhAoWIvZa+4R+acIY+8OrQEVV3qedcmbHn
         GTjkECd8xL7BKy/1P0NU19qRwhVoFl9s/Jn92fsx9rqLgr+YF7OZWrkLAU86QgpAwemt
         BPRg==
X-Gm-Message-State: ABy/qLbgUmlkkoYqMlBCIioQ9vNpq06t57Ac+iopliNwrrMR9hG+t5Qp
	QVb1hJ+hHo79TIJTNcodvcW5BK6JvwO5B5Y5jeU=
X-Google-Smtp-Source: APBJJlFdXpR5WpKrQ+dKkV2RwLEWoTdEzQ3ENuqEP92j9PIilEbi0nPga4EStw1e7fQPye9NQhEB8A==
X-Received: by 2002:a17:90b:3682:b0:267:f329:947d with SMTP id mj2-20020a17090b368200b00267f329947dmr259331pjb.33.1690487051662;
        Thu, 27 Jul 2023 12:44:11 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/27] libwebp: upgrade 1.3.0 -> 1.3.1
Date: Thu, 27 Jul 2023 09:43:27 -1000
Message-Id: <6d6d103cfba013f54d567f96095a64034e568890.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184984

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2023-1999.patch
removed since it's included in 1.3.1

Changelog:
==========
  This is a binary compatible release.
  * security fixes for lossless encoder (#603, chromium: #1420107, #1455619,
    CVE-2023-1999)
  * improve error reporting through WebPPicture error codes
  * fix upsampling for RGB565 and RGBA4444 in NEON builds
  * img2webp: add -sharp_yuv & -near_lossless
  * Windows builds:
    - fix compatibility with clang-cl (#607)
    - improve Arm64 performance with cl.exe
    - add Arm64EC support
  * fix webp_js with emcc >= 3.1.27 (stack size change, #614)
  * CMake fixes (#592, #610, #612)
  * further updates to the container and lossless bitstream docs (#581, #611)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 15411fb32b5a3c0ac9c06ff89db5664799f55d77)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webp/files/CVE-2023-1999.patch            | 55 -------------------
 .../{libwebp_1.3.0.bb => libwebp_1.3.1.bb}    |  6 +-
 2 files changed, 1 insertion(+), 60 deletions(-)
 delete mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-1999.patch
 rename meta/recipes-multimedia/webp/{libwebp_1.3.0.bb => libwebp_1.3.1.bb} (93%)

diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch b/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch
deleted file mode 100644
index d293ab93ab..0000000000
--- a/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From a486d800b60d0af4cc0836bf7ed8f21e12974129 Mon Sep 17 00:00:00 2001
-From: James Zern <jzern@google.com>
-Date: Wed, 22 Feb 2023 22:15:47 -0800
-Subject: [PATCH] EncodeAlphaInternal: clear result->bw on error
-
-This avoids a double free should the function fail prior to
-VP8BitWriterInit() and a previous trial result's buffer carried over.
-Previously in ApplyFiltersAndEncode() trial.bw (with a previous
-iteration's buffer) would be freed, followed by best.bw pointing to the
-same buffer.
-
-Since:
-187d379d add a fallback to ALPHA_NO_COMPRESSION
-
-In addition, check the return value of VP8BitWriterInit() in this
-function.
-
-Bug: webp:603
-Change-Id: Ic258381ee26c8c16bc211d157c8153831c8c6910
-
-CVE: CVE-2023-1999
-Upstream-Status: Backport [https://github.com/webmproject/libwebp/commit/a486d800b60d0af4cc0836bf7ed8f21e12974129]
-Signed-off-by: Nikhil R <nikhil.r@kpit.com>
----
- src/enc/alpha_enc.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/enc/alpha_enc.c b/src/enc/alpha_enc.c
-index f7c02690e3..7d205586fe 100644
---- a/src/enc/alpha_enc.c
-+++ b/src/enc/alpha_enc.c
-@@ -13,6 +13,7 @@
- 
- #include <assert.h>
- #include <stdlib.h>
-+#include <string.h>
- 
- #include "src/enc/vp8i_enc.h"
- #include "src/dsp/dsp.h"
-@@ -148,6 +149,7 @@ static int EncodeAlphaInternal(const uint8_t* const data, int width, int height,
-       }
-     } else {
-       VP8LBitWriterWipeOut(&tmp_bw);
-+      memset(&result->bw, 0, sizeof(result->bw));
-       return 0;
-     }
-   }
-@@ -162,7 +164,7 @@ static int EncodeAlphaInternal(const uint8_t* const data, int width, int height,
-   header = method | (filter << 2);
-   if (reduce_levels) header |= ALPHA_PREPROCESSED_LEVELS << 4;
- 
--  VP8BitWriterInit(&result->bw, ALPHA_HEADER_LEN + output_size);
-+  if (!VP8BitWriterInit(&result->bw, ALPHA_HEADER_LEN + output_size)) ok = 0;
-   ok = ok && VP8BitWriterAppend(&result->bw, &header, ALPHA_HEADER_LEN);
-   ok = ok && VP8BitWriterAppend(&result->bw, output, output_size);
diff --git a/meta/recipes-multimedia/webp/libwebp_1.3.0.bb b/meta/recipes-multimedia/webp/libwebp_1.3.1.bb
similarity index 93%
rename from meta/recipes-multimedia/webp/libwebp_1.3.0.bb
rename to meta/recipes-multimedia/webp/libwebp_1.3.1.bb
index 58a91d5077..0a345498c1 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.3.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.3.1.bb
@@ -14,14 +14,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[sha256sum] = "64ac4614db292ae8c5aa26de0295bf1623dbb3985054cb656c55e67431def17c"
+SRC_URI[sha256sum] = "b3779627c2dfd31e3d8c4485962c2efe17785ef975e2be5c8c0c9e6cd3c4ef66"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-SRC_URI += " \
-    file://CVE-2023-1999.patch \
-"
-
 EXTRA_OECONF = " \
     --disable-wic \
     --enable-libwebpmux \
-- 
2.34.1


