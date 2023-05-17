Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945B2C7EE2F
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:07:08 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.44481.1684310824894791119
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=IoGXf93J;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3078a3f3b5fso407118f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310823; x=1686902823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAJTCY4khoNB6dfnEaykgtSvO+BImtcHn6qABZkYwqI=;
        b=IoGXf93J5hh5pmSr7TM0IgYfK5HZ/mJpNnomW62gi1qyB3M840rWJ+zYC+u4K0p5sF
         fm81ed2jvl7qkq4LWaB6vvLabzPXkbHpJJ7SCblkVjSPtOPtZBr6HjfHmLgOqRmzSae4
         LXOvhh1wanNK8gp+THGOCEKw+Lexkygi/v47zH+dEnZtAlIopEC0CN5ulw4pdPoDkTaR
         xVJ2uCFmrn4jCB/TjNxw5uKa4zkuY2EmpD4g86mn7I/iCVExSrgmAj1C/3Ww5u2Psw5e
         V+02unz83Ptdz/K7Af2seK2lbWMhZiKbqT8k/Knu+5ZL+xKEHqbpp99a31L7VTXOWKg/
         RBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310823; x=1686902823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAJTCY4khoNB6dfnEaykgtSvO+BImtcHn6qABZkYwqI=;
        b=fwCXrc0dajxtVEeT0ywS7kQHLYLaxx+htt3nvu9M+EZk07Kx4/YHB4glxLtsAQaztY
         e+Jb8CNWfQAZu+TVhu3kxD5kzcoXOvi9RimtkdnKlQ8OGdyoPnCw4tunCT/aP/gU/x05
         gTmVK63qJ/V/QRHPPRM4N305Z0bgwr5SUlLtKh1o86dk6z1BiLaPGGriK4cY3i0qpDNi
         gOMQWNEKyaq2bGOG6hbQYVZzvQtU4onFnZWJRBQhU9uGg7CkAiw5NopLsRGzQ39E0Z1o
         uV04ApbMAfAEyc/uChI4cjicDNqHO/WtVA4bJ5dV9pUUQa6eg537olSOlTGjOlRcrYFK
         QoTQ==
X-Gm-Message-State: AC+VfDwuRwunQVJLybU9M8BTsUlih6N35aCrDUptACQbBd9HUphrc/2h
	6cJktcd4gL//YwB09rtFfVnyXg==
X-Google-Smtp-Source: ACHHUZ6bmeWN30qraZsz4SCWdUpe9PeszqNVKihIXRfo3c4J774sfkKaPDwVcjbt1akI96r/0oHhHQ==
X-Received: by 2002:adf:e948:0:b0:306:2aac:4b84 with SMTP id m8-20020adfe948000000b003062aac4b84mr30501308wrn.30.1684310823430;
        Wed, 17 May 2023 01:07:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:07:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 20/20] python3-manifest: turtle: new package
Date: Wed, 17 May 2023 10:06:39 +0200
Message-Id: <20230517080639.9336-21-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181469

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the manifest with definitions for the turtle package from the
Python standard library. Currently this package cannot be imported at
run-time because python3-misc doesn't pull the required dependencies.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3/python3-manifest.json             | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index d368b162bd..766f083ae4 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1236,6 +1236,18 @@
             "${libdir}/python${PYTHON_MAJMIN}/tomllib/_parser.*.pyc"
         ]
     },
+    "turtle": {
+        "summary": "Turtle graphics is a popular way for introducing programming to kids.",
+        "rdepends": [
+            "tkinter"
+        ],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/turtle.py"
+        ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/turtle.*.pyc"
+        ]
+     },
     "unittest": {
         "summary": "Python unit testing framework",
         "rdepends": [
-- 
2.39.2


