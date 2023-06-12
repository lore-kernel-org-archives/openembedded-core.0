Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA7AC7EE23
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 04:09:40 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.51542.1686542976333858165
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 21:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GIyy0618;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: nikhilar2410@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-38c35975545so2242868b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 21:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686542975; x=1689134975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U3pung81sk7XHEVPnhZnWm63+Izqw0KcIotgNQgawvs=;
        b=GIyy0618pvBL9Y1f2DG7RSP9k2+eKsZlGZvnzsYMIOjyiaFrAlflHUL2IkHXMfOMyB
         Ry+GKzki4a36+Oi5J093Cb/9aYPBYVUXDr44ZPFt+qdksmvBU3PBaolW0G7GtdOi2WUI
         GMIkfu8lJc+Myy2FkqYb7stnFkVpRK2iKBUFG5UQFjAmbnZtcsx6KbWTbYqC9QHeFpMM
         U+ZnLdNUKiyOMVq6YP8tVfm+58ALRKbpSnYe35NMKLarROUxZ4KBFXH6HVLMTiLHj4fs
         jFRBU/rmkpN5wjeDYLTg7gugsi02O1j53rJ4BQKXe73JIe3//WCPrMDVwA5HwBRPg3/r
         MIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686542975; x=1689134975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3pung81sk7XHEVPnhZnWm63+Izqw0KcIotgNQgawvs=;
        b=Dhhy+DTGo6Ze5t5oJJ2lccPaJ28EB/CUaQYvVNQA6bMcJeBEhuAATXOau9TpqUJgcC
         fTz/rTF8IN449IkllVUqyRYsVzeoQQe6vv6EqpRzgxrFQLGPjVZcWKqV+hJPtcLUUicX
         A7Tol6eyGIu6Drxl/MAbHUJ/kfhwQ7RKBV0A+zpJ6POd8aUXbPqAqL5ThAH/sVZS45w0
         4b1DLqOma+yGstmz8I1wE/U1WRUFzpZ3VsH0ZctFdDVJRtMJrlxvxsY6D8QFUeSiYpuD
         ktceLVMjn0HpXlyzTzy0Nzs9xfEwkYj7wziqsGZ5b+DTNSVtwsxCf7GezrWgFpNZnQLp
         PPjw==
X-Gm-Message-State: AC+VfDyi0Fx9haPhYm9M4p3cE/oqXxZhVHLUQYrVgIymOOZo74dYbrTB
	dU+tTSVdOI47EvutA7M5i6FeV6jdB+KW
X-Google-Smtp-Source: ACHHUZ7uNQT2GDaHN8kjsHR35RS5VdbKrmbv+Pu2WjGKE50JF2Zz8fl0T4bs+G9WWSZZNKOpjOsjqA==
X-Received: by 2002:a05:6808:2029:b0:39b:8f0c:3936 with SMTP id q41-20020a056808202900b0039b8f0c3936mr3967274oiw.27.1686542974712;
        Sun, 11 Jun 2023 21:09:34 -0700 (PDT)
Received: from localhost.localdomain ([103.146.224.243])
        by smtp.gmail.com with ESMTPSA id ne11-20020a17090b374b00b002555689006esm8144147pjb.47.2023.06.11.21.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 21:09:34 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-core@lists.openembedded.org,
	nikhil.r@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][dunfell][PATCH] libwebp: Fix CVE-2023-1999
Date: Mon, 12 Jun 2023 09:39:18 +0530
Message-Id: <20230612040918.13326-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 04:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182655

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


