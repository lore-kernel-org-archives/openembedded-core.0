Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76353C7EE2D
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:07:08 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.44373.1684310807057310413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=zi7TJh/W;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f50020e0f8so53205145e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310821; x=1686902821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8yohqozFWls04/RYmR/r3xY7nNOSzkY7XvFonhyF8A=;
        b=zi7TJh/WNLFN+leADSNinioYNqq+sNYgSasmKIGTqAXEJEfmS0UOdIUb9JyujsUIoc
         wmgYof1n0OY1PqGnn8gtU/27+gVk0D4DEKIAAuzkvMvzXZdkXEKeTI3RZZCE41pe0Ht1
         CxcUQYUMZ1z4LxL/ChzPHO5XFG677tGKqpXQom0bC/0JGutonnjTAjtHsM8BjMmANwIf
         Wto8eKUGi6B+onVgNGGZldEx/6t+ZG3m9sUlcC4QEWOf4NIqIIfkIo1ks9JGF72TmDaK
         E83amATG3ixJIparIbnmLEeYyQhqXbDAFkgHxQn8y3LrjvHArocVSXSw82lsut2vc3A9
         1tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310821; x=1686902821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8yohqozFWls04/RYmR/r3xY7nNOSzkY7XvFonhyF8A=;
        b=ItMevohU8O2t6GEzAaNWKqNGaS5g8QQD5tQjuTzFYKhu91UO01gUgO7kYoEeX+nGae
         9dnnDc/QZBUyxP40Y+A22NFTkAGR2KbZ3wIoWcD88dXsOz2baWKfsMHGFojunUd1tJXT
         QAaD60deB2NnZuf1/H1hsGwRBeNYsBiGN3ohpBsNojkuvAfyYRV/SK59GHoLLykZpBBR
         W3V8y+kIMLbjBT2OsVOz2lCHtSYjYB4MYE/acU7Zqv34t1/zilEwUa6xsR5Xzdv/J4L+
         lfsnBHePNyl5j5u+o1E3Tq3+tE93/AHiWJHqJGIj2ahpPIeEMxJSUT3xnr4yqje+HhVg
         L8+A==
X-Gm-Message-State: AC+VfDzGvL9u1eJWxCsSurH4fkSnvxI3XtTjYhZgHEXPrLy+K2xmfz+2
	Fmws0F8dVTrDuQMLXUPqke+O7Q==
X-Google-Smtp-Source: ACHHUZ4ulrrj44uJ7sMUvq1IBr5yRVjr8q7EBHkiiVd34WD6l3nLGHAcDMgjtU0nmn8Q7mnpnVx9ug==
X-Received: by 2002:adf:f5c2:0:b0:2fd:c315:bb2c with SMTP id k2-20020adff5c2000000b002fdc315bb2cmr877903wrp.22.1684310821541;
        Wed, 17 May 2023 01:07:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:07:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 18/20] python3-manifest: cgitb: new package
Date: Wed, 17 May 2023 10:06:37 +0200
Message-Id: <20230517080639.9336-19-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181467

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the manifest with definitions for the cgitb package from the
Python standard library. Currently this package cannot be imported at
run-time because python3-misc doesn't pull the required dependencies.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3/python3-manifest.json        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index f278b18775..f60c83d76b 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -152,6 +152,23 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/wave.*.pyc"
         ]
     },
+    "cgitb": {
+        "summary": "Special exception handler for Python scripts",
+        "rdepends": [
+            "core",
+            "crypt",
+            "html",
+            "io",
+            "math",
+            "pydoc"
+        ],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/cgitb.py"
+        ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cgitb.*.pyc"
+        ]
+    },
     "codecs": {
         "summary": "Python codec",
         "rdepends": [
-- 
2.39.2


