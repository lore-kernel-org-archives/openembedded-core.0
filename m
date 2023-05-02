Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB701C7EE25
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 17:35:05 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.285.1683048900551265752
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 10:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WpfUA4jP;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: ernstp@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2a8bae45579so40036061fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 10:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683048898; x=1685640898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4gimgxplfdzge2iiXykSqPtzhGI29m+wxZju5zPlHFQ=;
        b=WpfUA4jPUJxbvUr1LvD4N17ImNYpJchZGG8jP42/31zKrY70cAlSM+0pLkitUaN1zp
         wXHxJzCalYT3l6Pi2RVuSxGqWkI4HsHGZssK/LDvdalRqc7PP3HEixpQnrbwtE5BR+08
         GOSfGQ3rkGk9fKp9DlyEDZ83dnGWbXJ2tJhZJIhP6wlEk+spDx/heH1lWWxj4kGwWEPJ
         HuGQdP+6gRVAesugRV4nT4hDHvATUUVWI5HnXed6YOShsUv+jZxzQ3waZByBIQwrVw37
         lS2N+78FHAdpDe1r+iTrgmrw2HoK/RJKRjfC7D1n2kjQbnzVboXvrSXx2UtPRngu5Efw
         mm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683048898; x=1685640898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gimgxplfdzge2iiXykSqPtzhGI29m+wxZju5zPlHFQ=;
        b=jvq1+3H5TWeXaEca1zgMk+9ZXsvN8aQSdIO5Ofpy1a7edJA3hsxhBurlakFVKqsrT+
         vYVzeF6Onut2mhDHHvkq8szw9sSU/KYWM05HpiHhRuol8x7sKe3b1cVLjPaHxbxDpbYQ
         qjHXo6TlPwbclvLeRbLm4RDAj5kuPY/4Vw6Qlr2FEsF1L2LGW3ho0RXRQPGpRrvBYnzI
         2Ds9bS+2gkMcQ/lPzz+1HXIB1Ttv5uIm9eR+5OZdhQ6vUxQ/7IkA5e9V0+xPCQE2KG11
         eoJPmavXktFLSMu7xROD7CCxfLCb67W/9nACWwjOHNE8cA0Ck70eBVhTsXDaZUKHq7mY
         gNRQ==
X-Gm-Message-State: AC+VfDwDl1krK5fOWfwoStIfOEIgYJKuM8PyAHtN4kAYSTSa22SSorRF
	Mst1tviccK8U9Ip2rnwEYx6gH6h24K8uMQ==
X-Google-Smtp-Source: ACHHUZ5cFv9c8uhCIcEueS9OXVE4fx1FyJ74dOva/naCNIzT9AgKyfjYOYS1tMWWvA8t1rVUUatvvw==
X-Received: by 2002:a19:5211:0:b0:4f1:2236:6d2a with SMTP id m17-20020a195211000000b004f122366d2amr188960lfb.53.1683048898463;
        Tue, 02 May 2023 10:34:58 -0700 (PDT)
Received: from localhost.localdomain (c83-254-134-100.bredband.tele2.se. [83.254.134.100])
        by smtp.gmail.com with ESMTPSA id m23-20020ac24297000000b004edc3bd7fa4sm5507879lfh.287.2023.05.02.10.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 10:34:57 -0700 (PDT)
From: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
Subject: [PATCH 1/6] python3-hatchling: fix rdepends
Date: Tue,  2 May 2023 19:34:17 +0200
Message-Id: <20230502173422.1439794-1-ernstp@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 17:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180756

Signed-off-by: Ernst Sjöstrand <ernstp@gmail.com>
---
 meta/recipes-devtools/python/python3-hatchling_1.13.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.13.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.13.0.bb
index 17e7f86ba66..ac1e8cc9d0d 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.13.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.13.0.bb
@@ -14,4 +14,11 @@ do_compile:prepend() {
     export PYTHONPATH=src
 }
 
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-editables \
+    ${PYTHON_PN}-packaging \
+    ${PYTHON_PN}-pathspec \
+    ${PYTHON_PN}-pluggy \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


