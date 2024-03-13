Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23899C54E67
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:47 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.2038.1710351225963725469
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=haqlEk9T;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4132f37e170so664485e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351224; x=1710956024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2uyMsSuecQaiIVU/v3xWGYrQDForK97cJBlM/ysOCE=;
        b=haqlEk9TfjnxDhmxGUkZEp9lbqeHFFX8U6pef+hXV8fy58kunCDItw61Njt1QbUCb0
         JYXJLukTbTeP8D4MB4oli69LCtF1cc6PlrG4FeLfeJ/f2wm90yxRxm39LlQnt6HwM/gS
         odDNgHhtOdW568xO6UwBHSfTVkBtGi+fLeQpI5+R2y1OofjM67+4lN5S5/K0MqzvkbDW
         JlayHAYHB4KkSGi60X3CS5gup9wrz7fzgRLjnpK+SYkG0TOTjSJnZisH3suhCf+Nubm/
         hnMbnVPJg8hTJEsvlOuCbZ/8R7jBithvL+5lcB/fkYK1tckTy+W0LyRbf5++UUV3pYeP
         7aCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351224; x=1710956024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2uyMsSuecQaiIVU/v3xWGYrQDForK97cJBlM/ysOCE=;
        b=FpBFrxj0CEQkBKsMkNI2MVY6X7xAKUkNdFxu98WxWdhOoPkyCq3bLy9n918j1xQq1c
         u/Sgc0BN9O5mL3Y786R447PJ+Hnc1UxZTVk9DXpzeys0xAOJujMF88w7RuxiAgOvfpks
         so3xaK8eolUt7HCYip+I/XsMweVf48SenDg3cICO5CJnC4yFkYnzK9EM/LZ9RpxTnO1r
         TyVjJH/vl5QCmV2p5y9MmoO9Vm3UeG6QpkZDLersCn5u6QSu5Liof3M7s4MSJyinYDBm
         mXv9RHZYLYSLPfj4UZ5BaxYdGLUvK8DaIv70qi8SsZmH2E04vDF8qjoEn92ABQRzdV00
         UafQ==
X-Gm-Message-State: AOJu0YxSTwMdg+/WcxsQZAIOslabyUYA2lqcSMzv156elJN30+CQloba
	a8d+2+2EvgF1xtnyPyn7YL7TiFRHSdFTFbf3i/Zml9TQqlrV8EF/dOuJjeBM
X-Google-Smtp-Source: AGHT+IFRop19bPq0zZIcfhRR4blHqnAwFF8zz+7RzdOMXWSx1gRzp0bAV5PDP+PdeeJO5Qtfuks9Yg==
X-Received: by 2002:a05:600c:c1b:b0:413:3761:b1b7 with SMTP id fm27-20020a05600c0c1b00b004133761b1b7mr474210wmb.20.1710351224434;
        Wed, 13 Mar 2024 10:33:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/21] go-helloworld: update to latest revision
Date: Wed, 13 Mar 2024 18:33:23 +0100
Message-Id: <20240313173336.3900178-8-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197060

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 98cd4d81033..74f3520eaef 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https"
-SRCREV = "d9923f6970e9ba7e0d23aa9448ead71ea57235ae"
+SRCREV = "32022caedd6a177a7717aa8680cbe179e1045935"
 UPSTREAM_CHECK_COMMITS = "1"
 
 GO_IMPORT = "golang.org/x/example"
-- 
2.39.2


