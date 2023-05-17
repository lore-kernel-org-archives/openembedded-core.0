Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FABCC77B7F
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:06:58 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.44375.1684310811577597721
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=dRPWizpG;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f42b984405so2773215e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310810; x=1686902810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxpxZaqCtzg+o+JdYx0vcG0W9R1dG5My0hrTjx0zLAg=;
        b=dRPWizpGI8ajzsqp4BosaRwzS5cOyi7sn64vI593PhbOzmoHAsSLz0F7IlXGcsL6rT
         5wRQqOtC30F/qB7hxA2/2+uSsmrJVsYb2PUzpTCIsj6m9owwTfr+LZ0c8u+OU1Y8Idi0
         +zgYB8iyAK6cx3U6nIi/kjdJKvu5Yt6MDL5BfdYakPfocwNeY45syPPb/tALYIX03jiZ
         dBxgPfv9SvQ0BBnhf3NUfIsmuAKVoMYekVrcuXBzGoOStgsNogvpjvwL6yH1Yj+doZzm
         hOGpT/Swzu+VXgyzTTCBzUg6w0KPSwHNGYN0qzDXJTPwuVmRxz0FouftY8r05YkiW5/z
         mTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310810; x=1686902810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxpxZaqCtzg+o+JdYx0vcG0W9R1dG5My0hrTjx0zLAg=;
        b=eh4NM4YnSWaVKlS8QM+blfxGJW/ze/yAyqV+k3bh+Vl7hagn3qHUODJJejjBBuBWQG
         4dkZ4wqc1QF6X7RoUfzy2xRewvPxRPimIVb2Lpv2itCCtTzJ5KN0EE0YK9aCVDRuY+HM
         x7dz/7ksracL/UDM2nBdoG4nlrZan1p7KvGrqtxdhdhbgN5iMhTWIOgNtEnoC1v/bbTG
         R0jq1TcTcimVr9CTG3OZdLU8a1zc3Drdq6SHyP21MUVQnsV+rsgLYk5F1J0CNMjbJP1q
         EG9C5oc40ZF6GpN9YDk5icisFy9ACLBbB0aiCupcbYLLYi+RiHU8ahEqHpiM25we0TIj
         Ud8w==
X-Gm-Message-State: AC+VfDyYo07ygm5pawyjnewSa9DgsjtHB83W57KM4Tw+wTZ+HMSb5kb8
	klRmDLbZu14QcO/NThU9svgnCA==
X-Google-Smtp-Source: ACHHUZ4MiNoh+v6GFAh7D0HZoyjNwYEnpRnrrTK1LeOMks999iCqoxe79LFr4U5ZtTlCIQidzBg6gQ==
X-Received: by 2002:a5d:4cc1:0:b0:307:9b66:f4f6 with SMTP id c1-20020a5d4cc1000000b003079b66f4f6mr21018120wrt.35.1684310809899;
        Wed, 17 May 2023 01:06:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:06:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 07/20] python3-dtschema: add missing run-time dependencies
Date: Wed, 17 May 2023 10:06:26 +0200
Message-Id: <20230517080639.9336-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181456

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-devtools/python/python3-dtschema_2023.4.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.4.bb b/meta/recipes-devtools/python/python3-dtschema_2023.4.bb
index f87563facd..e5a18b0649 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.4.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.4.bb
@@ -10,6 +10,11 @@ PYPI_PACKAGE = "dtschema"
 SRC_URI[sha256sum] = "6daefb8f54403b4d82961b3346571200571747ab01950fd36c1f69950fa7a8cf"
 
 DEPENDS += "python3-setuptools-scm-native"
-RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
+RDEPENDS:${PN} += " \
+    python3-jsonschema \
+    python3-libfdt \
+    python3-rfc3987 \
+    python3-ruamel-yaml \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


