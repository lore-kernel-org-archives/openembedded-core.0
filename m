Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FBCC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:59 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.86.1667835433406239769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=UQGPFYjo;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id gw22so10933652pjb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGWnOcIGlxkY8WX5KQ7IU/nHnqmCHk790/B7O1AsJGI=;
        b=UQGPFYjo0Udh6T/8aljZVF+eTZ1h1XGCg1Ez7A6uU/eUlSYqTg1S5m7DkZ3NmMwoWp
         UGLYphbV7pVQXuHKtaupgxmdLdnbV4hYV/w9HzN7PqAol/FXaFbABgo61oa4MBEOkwC8
         x2vP7DPLksQD1nMVDkZaNlvSaLUQmwkyK8vvz2+cbY/nJ4Ey2rpBXB3CaDMS992ylliR
         +pvfV8yKKKJsrA7rB6qplApTwMIU/3J50gRFpEJFeqiGDttT6tKyoBVM0MjNVZmmBqEU
         XM4A3br/38ge2ZtlO1YfsTThG8OaZhAEn582HC5hZYz9812W00z9tA6q5eVKLvd5y989
         3hOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGWnOcIGlxkY8WX5KQ7IU/nHnqmCHk790/B7O1AsJGI=;
        b=5Yb9EaNhmxgP8fpTeqYc2y7cN/Ixtj8s5xFzkuudhkQILoNmi/3Vrwiyw83oeRkN4p
         Np04JKN3wGbBaqfSnfpIAkSWC/NLm9U87nQ4sibn0yfo8qN6WmkS9mzcnvgZcPljOx2Y
         P6iNrvhNh6RRTxPENIj8Fv+5SrBPZ1/Jq6KWNwYvDiG3cKr+OZ4wmlTpeRLDhVQW3qZe
         KG5bJUJZs3JoIX7w/lBvDX+tQNLoSdrQvZYyxtK2G6ST/L5u9V3LCUwS5eUO1u/d4bxQ
         wCHctLGkuW3ZOgo/XpZ1tVIGlPOxuFO4x1PfkSyT15BSW3eCQ3jKP2mMSvHRMFIHy9Li
         J4bg==
X-Gm-Message-State: ACrzQf2rvbVcN188r8yJq2wQqrEGG8Urowt9UzXgiNvj5B625rn+vVfg
	YlVKCA6MG4QR95vpsaeWKADjWXol2+rjN7eG
X-Google-Smtp-Source: AMsMyM4jUrcCU9RY3g3b/0IR/xufxB2o+Ffi03K4R/wLvwc0y1tEnsg+0c7tqClj1nlwWye9uXkB3A==
X-Received: by 2002:a17:903:2308:b0:186:95bd:dc21 with SMTP id d8-20020a170903230800b0018695bddc21mr51105200plh.135.1667835457967;
        Mon, 07 Nov 2022 07:37:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/25] externalsrc.bbclass: Remove a trailing slash from ${B}
Date: Mon,  7 Nov 2022 05:36:40 -1000
Message-Id: <e29509d855374995034d89b381e6ad9ffed90c23.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172920

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The trailing slash in ${B} caused -fdebug-prefix-map=${B}=... to not
match as intended, resulting in ${TMPDIR} ending up in files in
${PN}-dbg when externalsrc was in use, which in turn triggered buildpath
QA warnings.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9b5031ed5a0d102905fa75acc418246c23df6eef)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 880556b834..d87363a88c 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -60,7 +60,7 @@ python () {
         if externalsrcbuild:
             d.setVar('B', externalsrcbuild)
         else:
-            d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
+            d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
 
         local_srcuri = []
         fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
-- 
2.25.1


