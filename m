Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8206BC7EE30
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:07:08 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.44475.1684310819265146129
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=hY/FNXBX;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f417ea5252so3143585e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310818; x=1686902818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88hHRs8Mkn9CdCmQlJsR9QZpxShxaIuDw1JAT2IHCqQ=;
        b=hY/FNXBXLzMLdmQz0QoDtcRNWI/4uqbv46LNvkDz8U8jfrrTsn6vu8dwpm2T6Oj7+X
         118M+Od2Mcx8L2yDfWwuTHu4H3tkgSHHOVNNkXL1MoSJLqT2U10pDfMNOJmRGQ+tLaGj
         rbqhikKyUr5Qubl4Bqdl0mXUGi8t5rVd4cAKS+y/66yTNEkCtovIdesMG+C28hjF3t1U
         McrzShJZJV33I3sohEWPmLhFmCpM8Qcxk64RURfAhVcodNQlXVvh8E97FLIRLTPAGKUW
         JVhBCtC3nvEJze1UCbP6pnJRMCg+4K3cY6TqF7KXjUwdLXWErrwo1iYBg/uagfRThz2T
         /vvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310818; x=1686902818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88hHRs8Mkn9CdCmQlJsR9QZpxShxaIuDw1JAT2IHCqQ=;
        b=l3EO0gu4aiVXUxioUH4GE4wZ4pTKQdWJt+2H7aAEX8Obf6ZN7Afle0ENS1qygpf04d
         jAzpreeAUn8Q93AgPtvtYiWka40W0pUPvIZGa2j1BkkvvETKpLeK9IiZDtKAb8GywdML
         sgLXOkuys8lhQahTrEcCyPyP/R5pSu85ArDMQBueQoUjpNrWshK3BmeyGc+KCSnlkvjR
         qc+JHYV3IunbQTSyDpNImidaR+cbrStcpw6IqoDFOkNd3kdzBjYrDPrgkSCndyGNe057
         BLum7+47KYr403bEvw11nGb4vkHeh5z4pb1jQk2N7HS8InueCxD0tvKBxjkVQK772Pa/
         O2Sw==
X-Gm-Message-State: AC+VfDz77cuhcah+iZZIEMCU65gOpnRg7N8qblenOFw6hrktzhejI5nx
	KnvwhaRn792lUIoJACK9ie6o8w==
X-Google-Smtp-Source: ACHHUZ7k5sgwS+oSlZCtwWDihL3mAGSm1hX18ETmZPzJnIOr19ZouAv6SbHt0iDraE2xUBjsdg/EqA==
X-Received: by 2002:a5d:4004:0:b0:306:39e3:840e with SMTP id n4-20020a5d4004000000b0030639e3840emr27716496wrp.3.1684310817783;
        Wed, 17 May 2023 01:06:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:06:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 14/20] python3-pyproject-hooks: add missing run-time dependencies
Date: Wed, 17 May 2023 10:06:33 +0200
Message-Id: <20230517080639.9336-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181464

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb b/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
index e3893d51cb..c3f1fb75ed 100644
--- a/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
@@ -14,7 +14,10 @@ BBCLASSEXTEND = "native nativesdk"
 # Bootstrap the native build
 DEPENDS:remove:class-native = "python3-build-native"
 
-RDEPENDS:${PN} += "python3-json"
+RDEPENDS:${PN} += " \
+    python3-io \
+    python3-json \
+"
 
 do_compile:class-native () {
     python_flit_core_do_manual_build
-- 
2.39.2


