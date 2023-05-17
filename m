Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB25C77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:06:58 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.44374.1684310808224033800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=tYoupF76;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3078c092056so259226f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310806; x=1686902806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZY1ZSUGCwX6ROtlAlIOfbGN0dTEskFoK3iAlbwG008=;
        b=tYoupF76Xv2MX+h9P53OwjRgFJY/oRwwtmzxhUlPkLygPH8bQFTaQ6FJbW6L1C0ekn
         BLxx9a1vS6T/nAd1U/jX2lt0ySb53l1o6BgZckuX1Nch1ok3eft5o9nDq0U6y7TGNouR
         eCLF6CihO/anTEfegi1Ktzqz7dq2zmyg7Uim+qa18O6vxhYtkrfUBsNM0Zb0W7STB2Wt
         tmKEetUo6C4kJWO6ywR3rmupXDUOex/iEYdePyStdy1oAzueJx0xRBZQZXIgLOqQYkS5
         Hu7utv3wfBxe9+khSD2RiXZ4WcQoYSuEPOy4lmc56fGtbvSKKHow7rLsNENzJtwJ/Twl
         sxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310806; x=1686902806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZY1ZSUGCwX6ROtlAlIOfbGN0dTEskFoK3iAlbwG008=;
        b=BBOMexeNLT/f9mgSGxGJ1lvbyjPU9JGvlQLA+aj3kWKW0FgKRXvy8M8l5CmIRRBHv0
         3PXNSAsmzJ8cn07GWoL1uP/clD+0GAW7r2lNQ7bkg6vsfN3PT5ZY6zlh4NV4gEJGNr71
         BhNpjvAWPSsN9Zx5Ws/pXFpoxYidz2uVbHkT+SQ79kjua9hZUmiHOiXM8vQCoX/Uf63u
         wdRSEe3+mbWlnnt1Gl7vLJkKBoJRz7xv/jwBmCHXwmoXAZOllCFZ8tsFD+Bwh9kumr7l
         KV71YXcUY5M2cvho9xBMgfwPHzkm9mnHoHLgOy7IRmfPUPWRB6q/xAAjdIkLqs/vuOB3
         th7g==
X-Gm-Message-State: AC+VfDxQDYYLPS7BmqDQNakzESkKaCK3gkM/s1wl8uB1pXV06Up5pR9f
	LYfxe3gazVcInlwwfSglrnE7/w==
X-Google-Smtp-Source: ACHHUZ56MlHPSPG95w8AM2mGW0XqGOqHFo+a6kwUEqIKBjgo5Au3WG53e0p07yHnlAA7xM85Li/cqA==
X-Received: by 2002:a5d:4d92:0:b0:306:26d6:dd7a with SMTP id b18-20020a5d4d92000000b0030626d6dd7amr28007653wru.32.1684310806701;
        Wed, 17 May 2023 01:06:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:06:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 04/20] python3-attrs: add missing run-time dependencies
Date: Wed, 17 May 2023 10:06:23 +0200
Message-Id: <20230517080639.9336-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181453

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-devtools/python/python3-attrs_23.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-attrs_23.1.0.bb b/meta/recipes-devtools/python/python3-attrs_23.1.0.bb
index ab3a08073d..314053de08 100644
--- a/meta/recipes-devtools/python/python3-attrs_23.1.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_23.1.0.bb
@@ -13,6 +13,7 @@ DEPENDS += " \
 "
 
 RDEPENDS:${PN}+= " \
+    python3-compression \
     python3-ctypes \
     python3-crypt \
 "
-- 
2.39.2


