Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D1CC7EE2E
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:06:58 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.44468.1684310813607081532
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=f9TeEpGD;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-30935d343f7so379484f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310812; x=1686902812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cyylXjGwnmvtfaHo/07B0kU0HyqRyuff18+GsL56Ks=;
        b=f9TeEpGDRoAyg6yVKG5+yZlJzSpjxZ560NObYcdh3LQvKsL07DTGNNiEXuoK48C5FG
         P3BBlrZMoD+DXoN4k2Ftxl0RPrelNarUEjPp2MSWcV2zdZq36GajYh2y48onsqT68eAf
         MhYAV54Bf7ARbQpDKco2AicDRExPzTVs+x6Zg9LQQzFKruNjIozGYLraICDLq/+lPM7K
         iy3P8JuMWsSPqNQfmLpJZPV9HvTxfaVDg+/NERxgDydgs9k62RNumrgekvC/sTHUFUwR
         G8Efyk2JQwrIo7TOZfE9pbJ7fK/K0JjGd+82Xjsi854+nEIG6H48dvKquJePHHHfyxK8
         howQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310812; x=1686902812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cyylXjGwnmvtfaHo/07B0kU0HyqRyuff18+GsL56Ks=;
        b=ZyPTCYkktcN/LbB/J60maNEYJIFiEWMeyKWmi0fXDD4K62kCjNcGEZui4MXL8iTa7r
         K+x/Sec+46xjAX2Hlon/rWmMYQwFBL7IE7AIWM0hroKR9OHE5QHCVkeTfc9cZOfYflWk
         UIXT/JsSHzmYty7zsIl97NXNQ/Wws0WjdNz6AhYfEpACVhkDgcIvvWemZbdJkqbf009H
         JsClEGkEpR+C7KEgGKr+zbAVp6wlhh2zTS2nTWmZOjL6jz03I9mak+NJm8ixwSmsVdDc
         RvNvW8wbwmVWxxoarVqsfSw+g1n/GF4wC/lUo57Cr0JBFAPYo9Xp4nZ5qDjuRGJu48ac
         NCxg==
X-Gm-Message-State: AC+VfDwV60XjKgdd8EdXz6VsUszK7QceLdc3bFsoLZgZGmhQqcqk77/U
	D2NkQl5c0n0xCwKXwxuC3mOTpg==
X-Google-Smtp-Source: ACHHUZ680GWjim2EJujE+kxscXhMfFTX3Yw33Bmq7yOujRboUIQqZAu4evvF0j2fyLrL89hIlr0SWw==
X-Received: by 2002:adf:e448:0:b0:307:cb94:972f with SMTP id t8-20020adfe448000000b00307cb94972fmr16821673wrm.46.1684310812068;
        Wed, 17 May 2023 01:06:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:06:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 09/20] python3-tomli: add missing run-time dependencies
Date: Wed, 17 May 2023 10:06:28 +0200
Message-Id: <20230517080639.9336-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181458

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-devtools/python/python3-tomli_2.0.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-tomli_2.0.1.bb b/meta/recipes-devtools/python/python3-tomli_2.0.1.bb
index 6118a6a9c3..9401ed897f 100644
--- a/meta/recipes-devtools/python/python3-tomli_2.0.1.bb
+++ b/meta/recipes-devtools/python/python3-tomli_2.0.1.bb
@@ -11,3 +11,8 @@ inherit pypi python_flit_core
 SRC_URI[sha256sum] = "de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f"
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += " \
+    python3-datetime \
+    python3-stringold \
+"
-- 
2.39.2


