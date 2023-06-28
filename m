Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A07EB64D9
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:04 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.7274.1687919398136515662
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=02kpO2S6;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.54, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-558a79941c6so3566724eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919397; x=1690511397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENNCjuvIMA+NvHnQZnN7YBu25hD5a3JlxBgnqSaarsU=;
        b=02kpO2S6awwj5zhgtlTzs6uGE+PWT3QAJFeBK3ABff4tll5CfLKuwLES1YXstIxrm/
         rzFynhhyo7lBkSMg/GtiVDTeLEA96X5WR+bjOphAXoykO/B5lb+bi+R/JjFPNGEzGA1Z
         U0uEIhvPqOCW8J4troZlJpdV01WBmrFtUH9NX7Utl8XghAoeKeTE9bP9ix5iuFJyq8I3
         EsrU79tpVii3Ajl9KR9s1OxqIPJ1BZS/SB23eKtDuSsosu0uAIt19e+PZsFpDaiwFCTp
         1I5v5xPfLSMBTWTOdVO/tv1Zl9+OxwUZN1/wWoMsWg/Dpl2NIGUpWN4xnJ67FrPKGo1X
         XpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919397; x=1690511397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENNCjuvIMA+NvHnQZnN7YBu25hD5a3JlxBgnqSaarsU=;
        b=PtR8YdS1ROWAqz+0NVCeyp9SdQtm91A9Nx2j+3+2I3QSZNR0eFtIn72pUydwChKlml
         8Cd/PvBa6XWDSErFwGnX9t2yUnt650ESXhxLtaC4HdkDnBzeWxhwZoFL5CZQufuhFs2s
         UOK+fpyNnazwm5MIGwo4bbYL6XcpdXcs2vp27GppkOa7DrL5LdOVZ9HFMCyX7vYr867L
         T30ppCqfu0MKeDToR5UMf8Rcatmkb3CtZF4sXVHB98IFTUJVV71Ivs8PYDsO7Nsmtvrs
         ww155RBiiOwuH2LCKI9Glid6MF03vTA3IEykyEm+mcZeG0CPjUPp4FKcVT0ivgvd9jxw
         TePw==
X-Gm-Message-State: AC+VfDxKVwmj5mpo6FNfjunc0Rk+GoP8UUOCOelLQivCqPC9GwpUNU7r
	YGbJJukRX77m1aIRaeHwYo0y5c0wHlfXqTeYw/xyQA==
X-Google-Smtp-Source: ACHHUZ7YDML8QFVovhu77QXJeWFx4zHNEjRVXDh8IXfDvNwH2+jpIzeAZWC/h3aW9Ga4fWu0RsLSsA==
X-Received: by 2002:a05:6808:624a:b0:39a:bd0e:449 with SMTP id dt10-20020a056808624a00b0039abd0e0449mr36984688oib.26.1687919397002;
        Tue, 27 Jun 2023 19:29:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.29.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:29:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/30] libwebp: Fix CVE-2023-1999
Date: Tue, 27 Jun 2023 16:29:18 -1000
Message-Id: <ff726a731d06aa8c6490176e9a539fd59ec2159e.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183511

From: nikhil <nikhilar2410@gmail.com>

Add patch to fix CVE-2023-1999

Link: https://github.com/webmproject/libwebp/commit/a486d800b60d0af4cc0836bf7ed8f21e12974129

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8f6fcbe2d64e998be934b5b2e0ab65c159bfb807)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webp/files/CVE-2023-1999.patch            | 55 +++++++++++++++++++
 meta/recipes-multimedia/webp/libwebp_1.3.0.bb |  4 ++
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
diff --git a/meta/recipes-multimedia/webp/libwebp_1.3.0.bb b/meta/recipes-multimedia/webp/libwebp_1.3.0.bb
index 7b4d138d2c..58a91d5077 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.3.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.3.0.bb
@@ -18,6 +18,10 @@ SRC_URI[sha256sum] = "64ac4614db292ae8c5aa26de0295bf1623dbb3985054cb656c55e67431
 
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


