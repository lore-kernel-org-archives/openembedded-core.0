Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A65C7EE2C
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:07:08 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.44379.1684310824005131377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=Vfbdi9tk;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3078fa679a7so391148f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310822; x=1686902822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Omn9quP+JDOZwlOH869MG6Ku346rVOa1TZMslQaRSU4=;
        b=Vfbdi9tkE42hm35b4W5kdAnc1ceYxvEYqJrugTAoI0tOJRp7C3IFCMKVjP7IXRQwvy
         ZjXVxkgf/f9dCiqbGyQpy4xhH5fX82kw6dRZE+o3aZ3iQs2uDpMN2jNLfW7yVH9RYyqE
         PlSeiD4o2BzHl0Px2ayW3CjVoPMwffoYnpqUoLeCEd6p5/Mhkmk317xlARk1y91icpDj
         XhB6j9O+HGM/EDzq84fzkjUW5DZo07t2KQ1o4bFnB+61rNbgmo9kHdUGi8Kk6SJBJFzE
         LFiYJUY8GN8WquQ9ECdCuKjKg9hMd3OYz8qFhIGHKFfKidbVf5n+p2d+RzhN4QqGjq1s
         5QaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310822; x=1686902822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Omn9quP+JDOZwlOH869MG6Ku346rVOa1TZMslQaRSU4=;
        b=JrB1OOdk5JPFXUdE9Myl7uCQB3fRQafeKr71/nsC6Ka+t3l54RZlNuquCHz+a2Qfnc
         Q4HYHOuHZNCz+aelwzg6Hsbw8s1ihgutTyCvSucdofViiLRKiGBqpckko/MUCgrnMLuz
         7tMTw2yVkhRUAU6cXnRP7LswBBA93a0Q4Un1UrX4hivhixyAqBtlGUq3zY3EmOuKQM76
         gPBQ8XNKGgneyfD5uXyES5JOu5KfLpyWJMFImny15Y2rJ4BGEdRWLsWofDJuaYG297Kv
         zpVYn4T+L78loDQ8l3pMCW3g3G3Guxp5X1/Gv7zD5VhEqVncTG8GqxhqcXMRJavcb9Xw
         Tzig==
X-Gm-Message-State: AC+VfDxQjTaxuQumHdzu1HVy7Td6wfOvhIbGkah97UBnHJXXBQGvmrMZ
	MKBml3D5ftbN7fGSYnvRN/QH8w==
X-Google-Smtp-Source: ACHHUZ7thm5DkHSk5t9Ie3baCE/lA8fGYDka9zNEnH+dlKIhs+38iK5tr+5LAiWY++wOktscBnZCTw==
X-Received: by 2002:a5d:604e:0:b0:2f6:9bc4:76f1 with SMTP id j14-20020a5d604e000000b002f69bc476f1mr29129008wrt.1.1684310822549;
        Wed, 17 May 2023 01:07:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:07:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 19/20] python3-manifest: zipapp: new package
Date: Wed, 17 May 2023 10:06:38 +0200
Message-Id: <20230517080639.9336-20-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181468

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the manifest with definitions for the zipapp package from the
Python standard library. Currently this package cannot be imported at
run-time because python3-misc doesn't pull the required dependencies.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3/python3-manifest.json            | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index f60c83d76b..d368b162bd 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1321,6 +1321,19 @@
         ],
         "cached": []
     },
+    "zipapp": {
+        "summary": "Tools to manage the creation of zip files containing Python code",
+        "rdepends": [
+            "compression",
+            "core"
+        ],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/zipapp.py"
+        ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/zipapp.*.pyc"
+        ]
+    },
     "zoneinfo": {
         "summary": "IANA time zone support",
         "rdepends": [
-- 
2.39.2


