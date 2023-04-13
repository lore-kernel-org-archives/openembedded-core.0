Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40CEC77B61
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 09:16:21 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.8224.1681377374438276775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 02:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=oh8ArINa;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id q6so2046341wrc.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 02:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681377373; x=1683969373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e70GyXyT5rR+Y7WS9BWUzz7W3/z1ndNr4Fv4KAWNvX8=;
        b=oh8ArINavz1+ad933muL4y6S8wD2R711g7yo35P7OH9phNx6qs4FGqoto2ll6jsjyK
         sBGlf5VMvembVy7KPgeThFEVcBAhfXxVyQXlM7v4oURQKvwq4HHeH3pNDUmDX1q8YRVL
         BUE+7HU9I2CmrozevVFdnMZPAy9Bs2zhYkfD7/BHQy9m7fD4/tIk9pDLtGsYObLyDcoJ
         ++F7aovmS2yJlG+CW4bLZOr+ncKZALF/69acZ0UUkl1KmQJqgkT5ZqOD0+FZSMPYu+9J
         BrQaG6IcaiNq8pbCYgFUH6ut83+vEw5PH4xgIcTP+inhJmXcK5mNpkaScm2O+4etTEjC
         Zmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681377373; x=1683969373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e70GyXyT5rR+Y7WS9BWUzz7W3/z1ndNr4Fv4KAWNvX8=;
        b=DUVp/wUOL0IWeIEGpZr+U7lLpjD+GyyNTfo6VWq+nUyRumxKyb0IK9a/oDVaa+pteM
         DOLh45uEAxBF3NgfyEId5+eCwTL3o0h7BImf30qQJIkkD4vsidUyqWBw5EmdNqHW1HfZ
         Hkpwd0yW/dcVlUjDKYDImB48T8WluNtEJVTYNkFByVouRhNqy/w1ZIDnB14h0wjtbFgS
         Q1kzsuYj0SQCAFKmULSBf6Fj/5IQiRzWv4NF2Xwu3S6k4EnkD/4q3wCHBq2APUW2C659
         NdyEuuDjdn4uo/eHcFMdzDNTQrTpMTD22NLLLWUyMAXydgt/NqILnRPbB/Kz+spjyzUc
         W4Sg==
X-Gm-Message-State: AAQBX9dAiB6iRvgJDbIef1BKmxpWQKZPuT2P+jD6+CZ0VJexhOdDerEA
	8i8cq1DQvUeDOndUU+aGRqyWxHzCGqE4BXjWhH8=
X-Google-Smtp-Source: AKy350bpzdZ7dN5qQLilmF4A9WjWKGZsB+Q1tc81umdGLp4hrK1S1YnAOGS0Fn0LNFQHLlmXDvjiHA==
X-Received: by 2002:adf:dc8d:0:b0:2f5:83a8:a9a9 with SMTP id r13-20020adfdc8d000000b002f583a8a9a9mr1056948wrj.16.1681377373033;
        Thu, 13 Apr 2023 02:16:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:814c:fc8a:da02:39ad])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm851479wru.20.2023.04.13.02.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 02:16:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 4/5] python3-manifest: add ensurepip
Date: Thu, 13 Apr 2023 11:15:56 +0200
Message-Id: <20230413091557.10659-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230413091557.10659-1-brgl@bgdev.pl>
References: <20230413091557.10659-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 09:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179965

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the pip bootstrapping module from the standard library to the
manifest. This module is a run-time requirement of python3-build.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3/python3-manifest.json      | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 9e91270a50..f278b18775 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -610,6 +610,28 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imaplib.*.pyc"
         ]
     },
+    "ensurepip": {
+        "summary": "Support for bootstrapping the pip installer",
+        "rdepends": [
+            "asyncio",
+            "compile",
+            "core",
+            "ctypes",
+            "image",
+            "io",
+            "mmap",
+            "plistlib",
+            "pprint",
+            "unixadmin",
+            "xmlrpc"
+        ],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/ensurepip/"
+        ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/ensurepip/_uninstall.*.pyc"
+        ]
+    },
     "fcntl": {
         "summary": "Python's fcntl interface",
         "rdepends": [
@@ -800,6 +822,7 @@
             "distutils",
             "doctest",
             "email",
+            "ensurepip",
             "fcntl",
             "html",
             "idle",
-- 
2.37.2


