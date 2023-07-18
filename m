Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F55C001DF
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:26:30 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.9097.1689690387892762612
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=RqdX+rqX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-66767d628e2so3733574b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690387; x=1692282387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9p0dKw7aC78ZrNl2J0zr4CVIAx/3bI2Xo0TxTfzgmo=;
        b=RqdX+rqXgWxbu1XAvdt2ZFxg7eZuWhjBRLLcgBgAu1ACIYPMlfvHOd8JN7Q0mUpBBw
         i0ZghMEl6ZzPL8s3mT4H/cMmWil6Gm6EI69oqKq8LH93HMEE+loz2zRUjd6nh9b9uEa4
         Aaq5uM/hEP0UJ8IPJhApQawq/Z899ILcs94d1U+CNF7Q77qcmomfmms6XOzaYBGQJF2n
         r4BdSiKp/5vpcGC7Z+bJXoSa3UWK2Nfivjkh7RZtIOrYj1VW9/I439sOvozDqRh45PLM
         bNLw3BlMT7BcrB/WW37n7UF/Xf6Fp7O9A6acsEOuSpvLhHlPScAB5xaAO5W0OyJP+hYn
         7fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690387; x=1692282387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9p0dKw7aC78ZrNl2J0zr4CVIAx/3bI2Xo0TxTfzgmo=;
        b=dKT2YJ8yRKVPZnWK5hjmplayOUpTtvkewD7DHEes7+CNKAikvcbu1tEMtpGHo+DRE4
         2ckMs9/qNP/qNL+tE0qgFnRZsSROPfRFrC86+RQcqDVs7yobd4oU72688DlDGtgtZN8V
         xWqUP6vITUMXhKqgPS3GEAPsukVE8XUJaqdlBlZshso3M/S15b6E2DCQrQlmcyq1flTf
         PCZQUN4r6Xc7hyW+A1il16lwlNDKRcx+zy/yPGtQozd/Psk+H+ZMqh1qDWqp3sH0PDzx
         G6oSWpGYHuHRo8nfek60e+BjdgmohTR5UWHU8nGf+8ELMd3qzB4uxIIXD8/g0rqCnirh
         9Yqg==
X-Gm-Message-State: ABy/qLZlAbsJWWxSKx+YK5nVUyemKg4eh6uCUU9oZmKq2MsCFZHcsKuT
	OUeq6x7B242jXHLre556z/lXnzWC9HroEWrg+SU=
X-Google-Smtp-Source: APBJJlFDo+lSZAJHpTs9QXrxG0ymeoKHHlRhw/6QUdp1XL9ytYwn9JEfGCfNl9X0k/DuiNO4rBfHDQ==
X-Received: by 2002:a05:6a20:7fa1:b0:11f:2714:f6f3 with SMTP id d33-20020a056a207fa100b0011f2714f6f3mr16483594pzj.11.1689690386950;
        Tue, 18 Jul 2023 07:26:26 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/27] libwebp: Fix CVE-2023-1999
Date: Tue, 18 Jul 2023 04:25:40 -1000
Message-Id: <a5d0f8734ca643c25f0952387b38edf8ffd70525.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:26:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184510

From: Soumya <soumya.sambu@windriver.com>

There exists a use after free/double free in libwebp. An attacker can
use the ApplyFiltersAndEncode() function and loop through to free
best.bw and assign best = trial pointer. The second loop will then
return 0 because of an Out of memory error in VP8 encoder, the pointer
is still assigned to trial and the AddressSanitizer will attempt a double free.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-1999

Upstream patch:
https://github.com/webmproject/libwebp/commit/a486d800b60d0af4cc0836bf7ed8f21e12974129

Signed-off-by: Soumya <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webp/files/CVE-2023-1999.patch            | 60 +++++++++++++++++++
 meta/recipes-multimedia/webp/libwebp_1.2.4.bb |  4 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-1999.patch

diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch b/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch
new file mode 100644
index 0000000000..895d01ea7d
--- /dev/null
+++ b/meta/recipes-multimedia/webp/files/CVE-2023-1999.patch
@@ -0,0 +1,60 @@
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
+
+Upstream-Status: Backport [https://github.com/webmproject/libwebp/commit/a486d800b60d0af4cc0836bf7ed8f21e12974129]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ src/enc/alpha_enc.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/enc/alpha_enc.c b/src/enc/alpha_enc.c
+index f7c0269..7d20558 100644
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
+
+--
+2.40.0
diff --git a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
index 263589846a..5d868b3b96 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
@@ -13,7 +13,9 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
-SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
+SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz \
+           file://CVE-2023-1999.patch \
+           "
 SRC_URI[sha256sum] = "7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d5480c205331d9494df"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
-- 
2.34.1


