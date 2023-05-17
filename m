Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C284C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:06:58 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.44470.1684310814640912217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=Jxb984r9;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-307a8386946so255444f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310813; x=1686902813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kt9WpfNyBdryV5Prm9lhf/u9TF9kdEfLieR9cT2ZvA=;
        b=Jxb984r9MoyEUIDXNQvPsKV16ZrLCpocOQxNyGzdbuJBYmP9Gu387qndDSPbllTDlF
         +KpNfdSLfMeWd6FO7gvzS7jX6tHMquQzG2GlmJeeCeKY5uNa4PHDUdVXLIQ7PcUmz5+R
         s49H6pSaDnAXfRGFRWMCGasYnR7jRCGuSP9vrGnLsrOpeir3vPik5YX/2ZiWxKdvYVT0
         qcU09yb7AT3QfsMlJP7kkXjaMA2XnVvPi0HzjhPyvaVRo+8n03gELPzVrUWfJMfuzHz4
         88+kyv+zMuuRDjaTrt05ivdGNNLvO7tbcEq3WOGGvaiuBXFQH3Ljy+cxWhNIl0MZUTtW
         tMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310813; x=1686902813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2kt9WpfNyBdryV5Prm9lhf/u9TF9kdEfLieR9cT2ZvA=;
        b=YLPx9TdbqxRqEsVkM/KzAyKVhZw8RZNlRM2nRSybNQ325PTMqfqavSgVSQXZGy7Zmd
         u1BxDBro3GB56nEZ+qVKXp1dKp3jqovZx1kMSCSHOk7b7a7nEtv4GeUu/Qir5jD/Xeb0
         liWycmisVQO86h68dingFVM0q2rH5UFbeMamUemAVniKUhoYAfz3MpZzCl0Ux+5uFfTa
         80zTpsKWqJoAvQGmrRMssYB2sazXjy6qImVcdQlNZa9myMMNNrzCL+VFEvEOMryGK0Jm
         Bc8pEmzUVwwLBn9+GSwr0J5HOiDNVNT8e4aSS/jBxp4I+/pl5JvH42Z6qV4cZl4tfYND
         jwRA==
X-Gm-Message-State: AC+VfDyMydk+AdvYj+2i9S7Jm9LYUVD6Qqb86JUykqGiBzvb44yCXiYq
	TFKqrcN/YVoo7FKE8yY6b21d88QJktFMK58d/OU=
X-Google-Smtp-Source: ACHHUZ5+SL9uX8LbF6phWz/DIwnsAgT1SO/X8Ad8cFVp9T+rO49U3Qiwa1tHL8y9PyoqDvuPITnasg==
X-Received: by 2002:a5d:4ac8:0:b0:309:3df4:54c3 with SMTP id y8-20020a5d4ac8000000b003093df454c3mr1201604wrs.37.1684310813125;
        Wed, 17 May 2023 01:06:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:06:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 10/20] python3-pathspec: add missing run-time dependencies
Date: Wed, 17 May 2023 10:06:29 +0200
Message-Id: <20230517080639.9336-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181459

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-devtools/python/python3-pathspec_0.11.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pathspec_0.11.1.bb b/meta/recipes-devtools/python/python3-pathspec_0.11.1.bb
index f49bf080e9..79f03da984 100644
--- a/meta/recipes-devtools/python/python3-pathspec_0.11.1.bb
+++ b/meta/recipes-devtools/python/python3-pathspec_0.11.1.bb
@@ -9,3 +9,5 @@ SRC_URI[sha256sum] = "2798de800fa92780e33acca925945e9a19a133b715067cf165b8866c15
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += "python3-profile"
-- 
2.39.2


