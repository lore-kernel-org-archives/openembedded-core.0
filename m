Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228FFEB64DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 14:05:16 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.13054.1686751512451550303
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 07:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=e6IdtwCH;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-39ce64700cbso2219132b6e.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 07:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686751511; x=1689343511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNPjcm2amAA9/mQB69KW+5tetJpo7JTIN9qOMJEN2Y4=;
        b=e6IdtwCHcOJqNB3Td6oQXpvFY0EKxxs4umJ0z7h9enNsRiegZLTnS0EyyrIZLEYksJ
         YnsUfdOAzFJEj6RMbFU2+hHKyThS5ByogLnJotmx0KPVGNFMXiiz5bZ75m43kkAl46dd
         pFZY22MJzumZiwi0CH8nTIkWdCIALDqtTt9mr2KvaJ7hOmqsB8OasudFRUV5CzcGhrwD
         xWwAQTC1hegSACLugsdPURjveEcFNmThwPs6CQ1DMoGKx5rkFvTd+WT7bK47Fht7Iku0
         ecYqN8+1c6GbGxFuCp8PAqQF2ecBoQYeUE/olOGn62jnoKOwdBYF6VlnjX71nUddfDGi
         KQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686751511; x=1689343511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNPjcm2amAA9/mQB69KW+5tetJpo7JTIN9qOMJEN2Y4=;
        b=cj2raXZcAXZ0KaoRGg30n8F4F/Re5FYphN2S84Tr6CCQj0yEWW/FWNv4vCziZ/Fp+k
         8QAawjc9XD9MF9/4Tt8F5h5lRffXtNVDqKiXr8ouJ0UIL+4e6so2Z/CAdhDYcFLV9GK+
         bpQjuLDu3vNTRJ96ohBTrIkmD03bTGDDD2WIId7F4PXn0uc8x/A/mQRl9JTXG2dg4BsI
         yoJvKKWJr7bjrATqYZeuuk7hFFNLNyLTB1FWOBUGgHoM8omkZ/5R/XhN0fnSH1rVLuTV
         ZmWUSzbFyl/Pr07V+csmJ/+LSRZVp0uCQSCVU/HB34CfFZjZd/TQ1t9kHjamcZVrd6zM
         aVag==
X-Gm-Message-State: AC+VfDyDvFJcH/tpiIOnhsqLL1FzSyjn3RW2xtYfykecl4fnuv2f1TOc
	wsZc4dMLpYbPt+xkjDKw7dd6KJNXykYebCNVMRI=
X-Google-Smtp-Source: ACHHUZ7Pt1oDaWlxg2HjjZbykhQ9H893TLmWZWpYE4POwnJ2gmeNQ3ZP9KwO0uOYQUtz+ypjVuL0dw==
X-Received: by 2002:a05:6808:2196:b0:396:cd:829c with SMTP id be22-20020a056808219600b0039600cd829cmr13585222oib.3.1686751511223;
        Wed, 14 Jun 2023 07:05:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 187-20020a6306c4000000b005439aaf0301sm703757pgg.64.2023.06.14.07.05.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 07:05:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/5] libwebp: Fix CVE-2023-1999
Date: Wed, 14 Jun 2023 04:04:52 -1000
Message-Id: <c1f8a40b65d72c8fdd2f4ae77fa4e682184c8891.1686751371.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686751371.git.steve@sakoman.com>
References: <cover.1686751371.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 14:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182809

From: Nikhil R <nikhilar2410@gmail.com>

Add patch to fix CVE-2023-1999

Link: https://github.com/webmproject/libwebp/commit/a486d800b60d0af4cc0836bf7ed8f21e12974129

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webp/files/CVE-2023-1999.patch            | 55 +++++++++++++++++++
 meta/recipes-multimedia/webp/libwebp_1.1.0.bb |  4 ++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-1999.patch

diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch b/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch
new file mode 100644
index 0000000000..d293ab93ab
--- /dev/null
+++ b/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch
@@ -0,0 +1,55 @@
+From a486d800b60d0af4cc0836bf7ed8f21e12974129 Mon Sep 17 00:00:00 2001
+From: James Zern <jzern@google.com>
+Date: Wed, 22 Feb 2023 22:15:47 -0800
+Subject: [PATCH] EncodeAlphaInternal: clear result->bw on error
+
+This avoids a double free should the function fail prior to
+VP8BitWriterInit() and a previous trial result's buffer carried over.
+Previously in ApplyFiltersAndEncode() trial.bw (with a previous
+iteration's buffer) would be freed, followed by best.bw pointing to the
+same buffer.
+
+Since:
+187d379d add a fallback to ALPHA_NO_COMPRESSION
+
+In addition, check the return value of VP8BitWriterInit() in this
+function.
+
+Bug: webp:603
+Change-Id: Ic258381ee26c8c16bc211d157c8153831c8c6910
+
+CVE: CVE-2023-1999
+Upstream-Status: Backport [https://github.com/webmproject/libwebp/commit/a486d800b60d0af4cc0836bf7ed8f21e12974129]
+Signed-off-by: Nikhil R <nikhil.r@kpit.com>
+---
+ src/enc/alpha_enc.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/enc/alpha_enc.c b/src/enc/alpha_enc.c
+index f7c02690e3..7d205586fe 100644
+--- a/src/enc/alpha_enc.c
++++ b/src/enc/alpha_enc.c
+@@ -13,6 +13,7 @@
+ 
+ #include <assert.h>
+ #include <stdlib.h>
++#include <string.h>
+ 
+ #include "src/enc/vp8i_enc.h"
+ #include "src/dsp/dsp.h"
+@@ -148,6 +149,7 @@ static int EncodeAlphaInternal(const uint8_t* const data, int width, int height,
+       }
+     } else {
+       VP8LBitWriterWipeOut(&tmp_bw);
++      memset(&result->bw, 0, sizeof(result->bw));
+       return 0;
+     }
+   }
+@@ -162,7 +164,7 @@ static int EncodeAlphaInternal(const uint8_t* const data, int width, int height,
+   header = method | (filter << 2);
+   if (reduce_levels) header |= ALPHA_PREPROCESSED_LEVELS << 4;
+ 
+-  VP8BitWriterInit(&result->bw, ALPHA_HEADER_LEN + output_size);
++  if (!VP8BitWriterInit(&result->bw, ALPHA_HEADER_LEN + output_size)) ok = 0;
+   ok = ok && VP8BitWriterAppend(&result->bw, &header, ALPHA_HEADER_LEN);
+   ok = ok && VP8BitWriterAppend(&result->bw, output, output_size);
diff --git a/meta/recipes-multimedia/webp/libwebp_1.1.0.bb b/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
index 68e5ae2b3c..f449ae750b 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
@@ -19,6 +19,10 @@ SRC_URI[sha256sum] = "98a052268cc4d5ece27f76572a7f50293f439c17a98e67c4ea0c7ed6f5
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
+SRC_URI += " \
+    file://CVE-2023-1999.patch \
+"
+
 EXTRA_OECONF = " \
     --disable-wic \
     --enable-libwebpmux \
-- 
2.34.1


