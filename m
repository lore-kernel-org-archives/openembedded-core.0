Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BC1C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:49 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.4669.1642588909424000863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gAUG314Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso6767601wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v6L8R3vObJelPY68OHBxA30FfpAPcGEMRut6SR7n6BA=;
        b=gAUG314QYOgjYb9EsJ2ZKl8x5GGYMDWpTM2KtT+YXfJfFImStDyfuiH7I9baxIfhM9
         4vmYjKNLpRr0wFeR/cUAzyuglMCfo4kaebW+Z8bZwrC1/P4QbxV3IgabF8azDP+zwNKE
         ti8ToUqIGUW++a4EAQOqRMXhCsXNa93R/dZ7PlM7CKmydZf+RttojiOgEWKKeln8QyjS
         Dkqx8B88/VS9TITXh9YdPp9CCKQ/JwYuIBBQ9GdWCbNkgeGfdKXADpPh1UxepWuAxQM2
         OAF14+oQ8RxtmG8CUDWPul2+oDmthurO5KOBNcgIwKU7bhM5/GbAHoh2FpcxHr35NVxX
         hLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v6L8R3vObJelPY68OHBxA30FfpAPcGEMRut6SR7n6BA=;
        b=YSVUMkwRV5P2manM4MEqRXbxEVQQEJBCbbjYU1wFLbDCfNO4/T3QQQw5Q0l17ewMmS
         mWCvStaMpZk6cczgvu27qs0mVKZeki6CbApLUxuaK3hf6fqNdCXq4PXPRueUL4u/AMDU
         Bkn7CTIcUfmetNvjX9+/oIpXlwktu6JFxU5ybtGybzZ0PY+dZwweTAtDash4fdy7QcnL
         OIOHQppcDa6+4/0dwPA3T7M+TKWxYCO+94ppCWESkG4LM6/RQn1DDzvGOfh25HaxX2ky
         74nxXl9oD1GBsVZbGngNzYmN/uNXGEjOckdhgZyO3NmoAFsoQYd35mZCoUtQIrm0g/5C
         /E+A==
X-Gm-Message-State: AOAM530mF3SZ7CdNjubcNZbBFH1XtwUKqLncNfmsC/ExtR0KxZHUTrMF
	ONKDKZiTAdYL2udgcPrw99Tlb0xoHvw=
X-Google-Smtp-Source: 
 ABdhPJyGw41u17lJlJF44JFa02j4vYHJxjrZNjVDbGYT+u5LE1/Yt43iIrmvIiHb8qb5D/wz9TbX0w==
X-Received: by 2002:adf:e291:: with SMTP id
 v17mr27550612wri.479.1642588908093;
        Wed, 19 Jan 2022 02:41:48 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 30/39] piglit: upgrade to latest revision
Date: Wed, 19 Jan 2022 11:41:08 +0100
Message-Id: <20220119104117.2120127-30-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160722

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 70c7529f91..08bbbac05a 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "f855ad1c8ab0a7b25437b1a48b9038f599f31691"
+SRCREV = "11ee10ba04a95d4b36ef844420f0a5838002b5a8"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.20.1


