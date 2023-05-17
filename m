Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF95C7EE2E
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:07:08 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.44467.1684310812517465587
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=fqMYn62D;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-307d20548adso248017f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310818; x=1686902818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0q4642vKrhQaJh2Ne8pATNVFIMv3+eb70mHfgR9smWE=;
        b=fqMYn62DdPKoMI2Q66OrKk8c0llhdXJSQV2M5TXh7L7AZMXAiLT61wzfR8jB+1ZVrC
         Mq7LmbDkD803FcQ9iTevz20vaOwqvjNkXkf4Nwd0nSZy/eJ3bt3IzlXqJr72to/A9wfL
         KTVb6k+R48n8CNSzK3g9wPqQMlRMerOEkVJxgFQBS+th5m/lg6bjGNzODAl4y+9KXDrA
         ZXXer8jKe6XpxEJJH0MfEC3k6bmgGIT4wtAoesz/SwhDeuKwru/NoVYoe3bgknclrWBP
         emEAq1vaiP+V5fPauEgdUeKT4dPgjctYM3+8GSUnVvNa0lU1YUhOlt05fUozYkqKNKI9
         iRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310818; x=1686902818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0q4642vKrhQaJh2Ne8pATNVFIMv3+eb70mHfgR9smWE=;
        b=DfEyR0jIgTxreJgeB+0kSp4atj/0jiZbFAKcg+9aaJ4UMLO2C/X6FZdHpzQa/WSXy6
         Hotsp+O/dASOxscg7tRHRZwyowDG6/b7Z6Tn8Nu6MpCzTc+sIIQR5cUXn8k7xAtdpfJA
         J6O0WuUNoeSY1KmPZGeeC7WSbbjQjowHGAz5OKlng06th75Nh7oucrVzJnxlQgaFcdTX
         9a8++vleI+s8iwxfKk1znN8vsB2/yZP9a2D46ju2PE57kFnUwWb8UrPSqpaZHelvPxw/
         pLqsMg/PKK/GZFXh2lfuEPMT5xJde1ykGkRfTUGJktL4+vXVupGd+/vpk8HOUnERSyZ+
         Mxcw==
X-Gm-Message-State: AC+VfDyKum3bPV1S+Y1C22YXdS3ZEteIZkB9Buf0SaA9Ose9twtPNisV
	Ta//H1LZuNOunDbII5iw1t2biA==
X-Google-Smtp-Source: ACHHUZ5uZjDoqGGeLVV5qsLrSxEfUbql1jH58NbE6uO2YnefDgBs1uR3RA7hMkYzwVQdS94SQqp2eA==
X-Received: by 2002:adf:f3c2:0:b0:306:370e:6b13 with SMTP id g2-20020adff3c2000000b00306370e6b13mr28688777wrp.13.1684310818596;
        Wed, 17 May 2023 01:06:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:06:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 15/20] python3-pycryptodome: don't use PYTHON_PN
Date: Wed, 17 May 2023 10:06:34 +0200
Message-Id: <20230517080639.9336-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181463

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2. Drop PYTHON_PN and use python3 explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-devtools/python/python-pycryptodome.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/recipes-devtools/python/python-pycryptodome.inc
index 29fe80d224..86d7f261af 100644
--- a/meta/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta/recipes-devtools/python/python-pycryptodome.inc
@@ -10,12 +10,12 @@ inherit pypi
 PYPI_PACKAGE_EXT = "tar.gz"
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-math \
+    python3-io \
+    python3-math \
 "
 
 RDEPENDS:${PN}-tests += " \
-    ${PYTHON_PN}-unittest \
+    python3-unittest \
 "
 
 PACKAGES =+ "${PN}-tests"
-- 
2.39.2


