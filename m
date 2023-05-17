Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58907C7EE2D
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:06:58 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.44467.1684310812517465587
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=WI79fBKl;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-307d20548adso247935f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310811; x=1686902811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcSrecUKeRfSub+OGnnnTQxld6zmhlJMS9FwspvO4AM=;
        b=WI79fBKlaW1ONFZo3br28xAOCnNbRZyRftJSJGgz0Ya5n626QrBDjCKe2TkqvMWym4
         dKk7HQbSpbcYpKyuijOqZocqZVsgGD5C1aJ0C96EqNB4RCxiZOaKgVqpVfcxJ0h2axgJ
         tf3OmNNj/KHDLQ/nCG9gPmn52MB3GXe0uF3SoRoYK5X+OR6AigFOIyaYNAUEn6ztoa6I
         iTNgNISyxceVmQfPtBWDN1bx4e9TBm/jZ4ZM4dxP8wa5klij/AFZCicNHWi5CK9csUoB
         8b+plCZY8IgiruEElnH3pZZ568XmAMN30MgFIBhxjGcK49OvmSlaHSxtm+7VK3n6e4dS
         p3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310811; x=1686902811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcSrecUKeRfSub+OGnnnTQxld6zmhlJMS9FwspvO4AM=;
        b=dDqWRk/IiulkF/g2R5w/5qONb8pAUb+LlexSmKSZ2KPFvB6AL6RL4lWO+OFCBraMXH
         oufE62Pd/ETaXw3B0KtcWvqrZpB2vQVawGR+uYjG7uTrJXQFZuDe9CE7icWjCkxXYf67
         oPIq14kfMYStIvAAG/vNoOcl0RGhjvTPdL5vmYu4/fiUExtEjVhbtFR2d/v5IXT01w1v
         f+ZQ0/qyJtGiMkIppMHyfL0yDdjnMAolqSmLIF8419r28dM6ULB9eP1WDQQb6RPy1g0D
         /+qNdOgp7fy4ri8Q/Wr06GyLivdE1BQvat++hulS5TSRr/NPHgv8RrZu9j5PYulQQYSN
         MVzg==
X-Gm-Message-State: AC+VfDxsLuIjyj19w8VyXU6d6cY3ZvhaKkG0EjwqJjugwIJ7ZyDg9aTh
	QCa2gtccetIiUGxXZGaZhVomSw==
X-Google-Smtp-Source: ACHHUZ49M13cn4e0pUymT/+YNdJzR9WcHc3VeGmVm4YZbOQsXmR/s/m3x6DCdh05cMiRcDQ7rvQRLA==
X-Received: by 2002:a5d:522b:0:b0:309:3a83:cf3a with SMTP id i11-20020a5d522b000000b003093a83cf3amr22801wra.0.1684310811039;
        Wed, 17 May 2023 01:06:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:06:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 08/20] python3-hypothesis: fix run-time dependencies
Date: Wed, 17 May 2023 10:06:27 +0200
Message-Id: <20230517080639.9336-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181457

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The main hypothesis module depends on pytest already so move it to
global RDEPENDS from ptest-specific ones.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb
index 8ec885fabf..15f4090c6d 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb
@@ -20,13 +20,13 @@ RDEPENDS:${PN} += " \
     python3-compression \
     python3-core \
     python3-json \
+    python3-pytest \
     python3-sortedcontainers \
     python3-statistics \
     python3-unittest \
     "
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
     ${PYTHON_PN}-unittest-automake-output \
     "
 
-- 
2.39.2


