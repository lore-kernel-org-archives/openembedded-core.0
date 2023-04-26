Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C28C77B60
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 09:50:47 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.4086.1682502647254956684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 02:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PeApuaYS;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f1728c2a57so71454145e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 02:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682502646; x=1685094646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9O+wDU/fL0m2dm7FNEuNswV/O2rbclHrIFfEPHGT918=;
        b=PeApuaYSGOvHWIwd1hRTv8+kKflmEiol2Ops+P5CdtCI+uOcbi6Dem8YTwaoI+q3cH
         lP5ojorciCaD05y9vrd9i6br1khMSr7x40IoaZGL84aexjtB459aLkfDb/jIzKfPYNVS
         IxixrrPOlin6iy7yv49ZRqq8gLAOdF4T8VwAjZxMIahI1QioBEursGi0VYdq09I3oV04
         Vlc1DaxVJyMkDet4athTDZQeW4xGKCHyUhS6anDyQgBCSn58Bgf6190fHMPRKrQ+qt41
         GKQCOkfzz6E25Sey9QPLcIv2gmUsFrVobQWNAZ73VQH4ohShfo3BdK+Dj8ReZEhF3mXE
         j6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682502646; x=1685094646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9O+wDU/fL0m2dm7FNEuNswV/O2rbclHrIFfEPHGT918=;
        b=Z59zT1q2vB90u0Utmz6Tg0UPrqgfZ0rLiCHhqNortDZjflZWBIJ/4Q8zO7/TNBXqn8
         kWgEWDJVf3UmGbhnqovWsP8i1VgiEZR97NTTlNSqtpv+vR+AVATORHwtGlKHHoyDQkE4
         1CXNAci/Nk6gtVF4muuWl9QoMi5dMB5FlLHE5zI5AT7mUygxW5fSocr/OJ9ThoCI4o8L
         8vsfmsuQ/DwDdg54DCYERmzEA0a3t96JD2nQBTyMMJb0MJbTuAzYfeEw8p2h+HGIjXXn
         AfX7ZZV9Dl54A/nMYf6SLJF0MKAMYiKa6OZ3eKoItnTkkqlJjKdoBSd7H7B06ffHZPNS
         FQxA==
X-Gm-Message-State: AAQBX9cGTPVtDHZlt7p11SJSBTpezHLV3MBiTVOnP6xtSa/6G1KfhOVy
	VWmvzwJo5YNDG2gGf5aGcRPgjG96wiU=
X-Google-Smtp-Source: AKy350YdB18xFq0QgYpfcKx+u4vqI1DKGS1mcfgfh+h4YWzxgxZDNFchqSf6C3kDYKd0j+WnZvBnsw==
X-Received: by 2002:a05:600c:364c:b0:3f1:95af:172c with SMTP id y12-20020a05600c364c00b003f195af172cmr9639644wmq.41.1682502645736;
        Wed, 26 Apr 2023 02:50:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id o22-20020a1c7516000000b003f18372d540sm17242867wmc.14.2023.04.26.02.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:50:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/11] python3-pytest: add missing tomllib runtime dependency
Date: Wed, 26 Apr 2023 11:50:31 +0200
Message-Id: <20230426095036.2632847-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230426095036.2632847-1-alex@linutronix.de>
References: <20230426095036.2632847-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 09:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180424

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-pytest_7.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.3.1.bb b/meta/recipes-devtools/python/python3-pytest_7.3.1.bb
index 9965844d1ad..914ea553464 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.3.1.bb
@@ -26,6 +26,7 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-py \
     ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-six \
+    ${PYTHON_PN}-tomllib \
     ${PYTHON_PN}-wcwidth \
 "
 
-- 
2.30.2


