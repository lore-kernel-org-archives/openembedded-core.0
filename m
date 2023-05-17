Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE69C77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:06:48 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.44463.1684310806313546833
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=OdU27vKt;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f475366514so3022535e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310804; x=1686902804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cE3QAQNnMQ2tXH7HsKDV6A5AlfQblhLcbJlcyoy09Z4=;
        b=OdU27vKt8X7EP5BipbxWPQG4jZBq/shNAOTJ8VGYirSg4fDtp6Zyi2NSstqAzsORYx
         HwdNJQHIPwg22ZpObK+Bf4yRjhqnGju4cVV/AkVe7pXnWKCo/1ksfDKBEfaoPaU0Vtll
         qvIpgXZLHdjZVd6uMqxQB4kVcW3kjcMF2A7Y+x/1GSEYinKFmdmyFY57Eg7LquDPQdVm
         wk0efzw+PmhNABwqk2YCrI6DprhJd694VQRcqlMUf3oDCDFOe5MvkeaO5u5M41NWmhVp
         A5ST3YoXktpw0GUYqe1Kwx6IY2uFREPh7yjBE7OwAzxnQ1aLID92HXXNkS/RgOapIXlx
         dN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310804; x=1686902804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cE3QAQNnMQ2tXH7HsKDV6A5AlfQblhLcbJlcyoy09Z4=;
        b=WoUM53o5xIZHMF5sHo5vL2gtVy+Kx578lyLlbQ7+0q47fYVwNg6G1kgKWMfYHYbl+I
         eGrsfdkVQl5bdfACuwGgWHLG456Fm4DTijYmcXdmMj/TO399P1m9awZchyFQTfraYBrs
         c1FVtLJAx1Wi+jnnjgpyA76UlEAw8S+UEaZoR8rW8796VYLEzNifkiDm3ZKa/jLA7d8+
         g09Iduf/B2fIYXrXliAqmVKtQq7YYDLAtLuyULEO72VfSjuY/VLcs3bzkeIKyEbCMohW
         CiNc3ffKFqJknUfCZeQKJ3MgQwtKGbi5EF8QZpX2oC/aIPS/u8HL7lLKx9703wZT6OA3
         3Q+w==
X-Gm-Message-State: AC+VfDwM1syMQ2JiHgmABAHiEDA4FD9+5s398vMMrKrMtPFKrDrN97xs
	Rv/iBcDKBTmd4nzn1duBBKv3vQ==
X-Google-Smtp-Source: ACHHUZ7Pf03rNvbwbGrixS4wZHIiIonXgHdcGbb015EYSJUUPV7St2WdCDBa1/0Yg308WhVyMNqhHw==
X-Received: by 2002:adf:f981:0:b0:309:3698:8016 with SMTP id f1-20020adff981000000b0030936988016mr2898186wrr.18.1684310804540;
        Wed, 17 May 2023 01:06:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:06:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 02/20] python3-attrs: unify RDEPENDS
Date: Wed, 17 May 2023 10:06:21 +0200
Message-Id: <20230517080639.9336-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181451

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The nativesdk and target RDEPENDS are the same and there's nothing that
prohibits this package from build built for the native sysroot either.
Use the global RDEPENDS instead of per-class assignments.

While at it: order the dependencies alphabetically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-devtools/python/python3-attrs_23.1.0.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-attrs_23.1.0.bb b/meta/recipes-devtools/python/python3-attrs_23.1.0.bb
index c8e2e514a4..207636d62e 100644
--- a/meta/recipes-devtools/python/python3-attrs_23.1.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_23.1.0.bb
@@ -12,13 +12,9 @@ DEPENDS += " \
     ${PYTHON_PN}-hatch-fancy-pypi-readme-native \
 "
 
-RDEPENDS:${PN}:class-target += " \
-    ${PYTHON_PN}-crypt \
+RDEPENDS:${PN}+= " \
     ${PYTHON_PN}-ctypes \
-"
-RDEPENDS:${PN}:class-nativesdk += " \
     ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-ctypes \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


