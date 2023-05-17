Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70555C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:06:48 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.44462.1684310805185202451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=JVVibSVf;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f42d937d61so4323305e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310803; x=1686902803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPvO1wY6aQ8r0ed3NcFxu7kRvgCER6hwONgex11mb+U=;
        b=JVVibSVfzCCZevgBIZplPOJK9vnRzBB+dk1Fds/LcdAq+3hS/0EEexXt2o5VWkVQfj
         z/UXaCeYkik5ZU60vKppv8fsgbEhk5w6Y2OVsdeKBzv9QaXO8YJ2xokkI2ThliljnQBR
         LHiqzvi6XuBgVw9bGi4MU4u6S/Pta34/VaxEBwPKla5bkaNsNZcE5Pq7vFDb/8+z4Hav
         +Nk8AMMfl5sDi9QS+3XJ6ayezMedpjR1Y5So7rGkHp0hmffFWdgY3JQPTiPSllifSRnv
         Ex5QB5gUSoX8IofibKTFZma46LzdmTg4sHyGADRxdYLT7dixtWfGiPtN4SkI935mtvl+
         gxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310803; x=1686902803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPvO1wY6aQ8r0ed3NcFxu7kRvgCER6hwONgex11mb+U=;
        b=U/DCNn+oLKDaM5pka3o9AHQjs+IrEvhMaw+RlVtCqPV5GxFKbdrDB6eir4Y30aFTcM
         Ekw87yU5CYFvrOhrPWG0x1DwQJf+WH0UzZfya/RT3mu+Ynh3AohfWVpUepIP87NoIL5s
         y3tHwgCiX2Hbk0XLJe135f1tNmkSprHTW9JMTRYdJSxMqUTGWJvmdv2ltWtX1FdwDou9
         8dXVIbi48iDKEaoh1cAI4NavhK1sg2O37sCo/WY4B2NQPDYzx61NdkfklrM1Lc4+vV8o
         nqOlBlTLNMNzcjbnIuXcRpErJ4mOEA9lDZfbA0mdqBnSGQxzBNnUOnztvd+kG3tCFDyA
         /HcQ==
X-Gm-Message-State: AC+VfDweYF3be6VyOXIiKa00Lpiy6ywjlCT986AycN5q887AIg7D4ISC
	dxl+KdnHGqLWZ06K7TqGZLMbCw==
X-Google-Smtp-Source: ACHHUZ5irY2IR14h1/yXMJmAa/yqjvzc9Z7LddpdCmEpeLQ5odc888DRE3DvKeUfhJif306fxekmCQ==
X-Received: by 2002:a5d:440a:0:b0:2f9:a798:602f with SMTP id z10-20020a5d440a000000b002f9a798602fmr32257286wrq.48.1684310803665;
        Wed, 17 May 2023 01:06:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:06:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 01/20] python3-async: add missing run-time dependencies
Date: Wed, 17 May 2023 10:06:20 +0200
Message-Id: <20230517080639.9336-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181450

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-devtools/python/python-async.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-async.inc b/meta/recipes-devtools/python/python-async.inc
index fde864601c..53f8d79361 100644
--- a/meta/recipes-devtools/python/python-async.inc
+++ b/meta/recipes-devtools/python/python-async.inc
@@ -9,6 +9,9 @@ inherit pypi
 SRC_URI[md5sum] = "9b06b5997de2154f3bc0273f80bcef6b"
 SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-threading"
+RDEPENDS:${PN} += " \
+    python3-logging \
+    python3-threading \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


