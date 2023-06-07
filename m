Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C65FC7EE23
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 05:23:25 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.1935.1686115404788425590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 22:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LyZI3Ttp;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-65299178ac5so6677297b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 22:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686115404; x=1688707404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U3pung81sk7XHEVPnhZnWm63+Izqw0KcIotgNQgawvs=;
        b=LyZI3TtpOaKOg0SDEEw3oSMJ8S45uyPfzYyzo+BT59y/byUHfqvIPY6tAxLfgTwF3m
         hpJCeKSYNdS7XLfPZdUSaOCuUnJJWM/VjjPODRBsr8E0rKF6qxYhJ0sc10U/Ou/Gdrw5
         GcFW8ok4kVCj/jf/FRdYBl0/2hN70e+aHg1JYtotLuUucEtQOkuugGElMUVO848semED
         sFOL5SeMcz1UxkPmjx/7ck1A4KjwGkUyEZHLUqwTBkI1LHombMv5MeD0WoIzNtQBlHcK
         E+dJznyh4d/Ku9W3VOUsEh2ACWvk4U+b9hJ6r5/u0Xg9XbtrVENLxaJxXxhUPrI+EE3z
         hySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686115404; x=1688707404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3pung81sk7XHEVPnhZnWm63+Izqw0KcIotgNQgawvs=;
        b=ZyUUcAjGyz2TIPD7aGzC6MfD3OsM2v4Gcib6xIunMO2Jwuql+p4/TyWH7OpVRRF8Ax
         dCtvTqIPDp9O+yf3v7h/FL5bdhDUcMHbq2Uym9PNGIUTVre+liTFqBe1lVafUgoHd+NL
         suf+0yjOzAbVKCBtO5vTw2UKnFpvKXvoWuf0LZ+0v9SFrGffh46tNuqgH7/oER4gZRRt
         wpLIos17HAjkxYfYTZy35v70/IORxX/YwvjlZNQCafNBNjG7feZsntRC2gWDlGWBut/e
         TcSkQ76+XeUDfgxOjje2FT3UrjXAZUqKENB2xDNzgZmNibEdOw9QBV4C5wW2X0ccL2u/
         N8Dg==
X-Gm-Message-State: AC+VfDwSDqW7i4Pc1xR4dC8i0UASeSSm+O6bmQh0iMhHtmW5MAujNsFX
	K7VGj1cE09Mq4sMo1FwULYhgXBCF8p7bDWM=
X-Google-Smtp-Source: ACHHUZ6/YHbepYVLIIsiQUvxWyDOkkTag1K9qDCJxPwltluy3yx8D+bVfI4VJ9iqq+RYpTFVToLRsA==
X-Received: by 2002:a05:6a00:1302:b0:64b:f03b:2642 with SMTP id j2-20020a056a00130200b0064bf03b2642mr4981350pfu.23.1686115403577;
        Tue, 06 Jun 2023 22:23:23 -0700 (PDT)
Received: from localhost.localdomain ([103.171.59.28])
        by smtp.gmail.com with ESMTPSA id j25-20020aa78d19000000b0065dd1e7c2c1sm166025pfe.63.2023.06.06.22.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 22:23:23 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-core@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Nikhil R <nikhil.r@kpit.com>
Subject: [OE-core][master][mickledore][PATCH] libwebp: Fix CVE-2023-1999
Date: Wed,  7 Jun 2023 10:53:16 +0530
Message-Id: <20230607052316.97944-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 05:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182454

Add patch to fix CVE-2023-1999

Link: https://github.com/webmproject/libwebp/commit/a486d800b60d0af4cc0836bf7ed8f21e12974129

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
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
2.25.1


