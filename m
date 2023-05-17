Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D93C7EE2F
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:06:58 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.44465.1684310809993557081
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=O47X7DIz;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.50, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-30786c87cdaso380860f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310808; x=1686902808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyqwuBjvb3fdVX4wsXqsAHEgpLapNRmh70fUFY7wL/w=;
        b=O47X7DIzwoFZoKOdTnoQ/xOtxoc0t8bNqKTp14IL6g/Z34SmfQTMACQ0iGfFRHcNkI
         nrG6RCxmVYfP0f4hxVXhJ/crS5bxkjmLULJ/2Q0HNYPTXfEKRtJhVZCK859TI4SJSW4h
         /N3sV2yMz9PlNeL9GCPDD79aXG0EenV3rCFBXPUVrj2SB/JS3MlNbtjHBHI3PZHcaJT4
         jj+l237EDp5AEcwFnIROzvGvpPnxqEI/U93MUMBOIW7xrZprdwxiQBq5ALdct0q7drHv
         nZE3W2Ik4YX/INlFYxmrjNKFBSYGhbF+iUkyHK6DthpkloUx3W1j74OmvYDaC8emnJiv
         PGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310808; x=1686902808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyqwuBjvb3fdVX4wsXqsAHEgpLapNRmh70fUFY7wL/w=;
        b=RpKXMwXo43zEdER6ayMvB5Pq6eEDVIURD8nPfIRogMhLYtlQwLPgM8edls9cW8gGiN
         U/gmBl7APArEfFCMF7CD+OpULpJnQG4SWdHi+pS+b2LpE2qLK4nAj7OQpDDFBevXW3VN
         FZM9pdVTdeYPhEOv0JK7Tw7//2uNUx2OVwYjoTlilXfxsO4J2JEGbUSMlJsb1rcj7eRp
         qVEC8k532t3KlIf0xS9iwfdBjKvZuMCxBmiHZ0fnEXsJfgtWr2sGuGJ7EBWQYnKGoO+Y
         jw0kPxgmtvOBJYwRevvvnH2EUsvYIas+yjYfNYrX0p+W/xoC+9aXSyTfDrlO+QR3bJxy
         CqCA==
X-Gm-Message-State: AC+VfDwUM0TJWvdjck+vMwEAKOeJW+jWjNQ5h1u1hHJENKzHlbgBcZdF
	3F70cNZoBEf1kHrtaxj5DDlbgA==
X-Google-Smtp-Source: ACHHUZ4r7ec/BpfNiJZ1Xq8JKEh2sp+cpkv0HOzrEmIj2laIRleuG6ya7WS25AoY63u6c/oB3x4OMw==
X-Received: by 2002:a5d:43c2:0:b0:309:42d0:4c2d with SMTP id v2-20020a5d43c2000000b0030942d04c2dmr408833wrr.28.1684310808476;
        Wed, 17 May 2023 01:06:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:06:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 06/20] python3-libfdt: new package
Date: Wed, 17 May 2023 10:06:25 +0200
Message-Id: <20230517080639.9336-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181455

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a recipe for python bindings for libfdt (spun out of upstream dtc)
fetched from pypi.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-libfdt_1.7.0.post1.bb      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb

diff --git a/meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb b/meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb
new file mode 100644
index 0000000000..1ff3decbb9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Python bindings for libfdt."
+LICENSE = "GPL-2.0-only | BSD-2-Clause"
+LIC_FILES_CHKSUM = " \
+    file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927 \
+    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "pylibfdt"
+
+SRC_URI[sha256sum] = "2d048f9f8ce9a0527d497f423dea1f1135f9811c05b009cc5d5753771c1f9ba1"
+
+BBCLASSEXTEND = "native nativesdk"
+
+DEPENDS += " \
+    python3-pip-native \
+    python3-setuptools-scm-native \
+    swig-native \
+"
-- 
2.39.2


