Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C41C25B74
	for <webhook@archiver.kernel.org>; Sat, 18 May 2024 09:49:10 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.16004.1716025747421883357
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 May 2024 02:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K6LObPe9;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-351dc6aa900so991824f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 May 2024 02:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716025745; x=1716630545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B0/cuXW1WcAuMCBckdYKAZoh930lOIGLjyqhVEtGC5A=;
        b=K6LObPe9yxExFM16LcUBJ8hIDdsdCZr5w4PY0rAULDKGbttp7QqxUawJoH5rNR+gni
         tbSCny/q/HqWVx/84QdkUguZak3Q6TR8tRYBLcTpstK9rsifu4K2O7ElKLPF7mP3y3ft
         mLhw3ldhTKGks83bXnWOOMc2aKjHP/cxZXIAdtP7lZ9qCvuwfBbKEoA+xdM9ohgARV9R
         Abo3x9ltN0E0Qh2+0PRSaVo/8c2EOZXIqkonboBUkrHDYcHBz8RINjWGbxbkyUYkjg/Z
         jUO9wF/AQSyZjkwg8Q9QpDKR6t3ARIrQmV0y2Ol1hgto7NFbmIwlwkW94MUCbe1uy5Vs
         NG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716025745; x=1716630545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0/cuXW1WcAuMCBckdYKAZoh930lOIGLjyqhVEtGC5A=;
        b=cRcBR2PkNmZc1W/GIWYUb5KDaKK52Q+YfHL+WTAQMbqh1gHo2ybfEnUqAAFYyRhC0m
         N9sl9FE8OpY0/co3SmrAaHAeso5CfwOMzGLQHiB28e18GJQdZ28bpyJ06JV6Slvj82Ut
         fCY5n+j81yYXv9mK7XdqG6Gjvd6+8omGPYfoV0qjZZ8H5fcK2hrjtCVkmpimY1Cfpgcs
         hhBsAvnLfq1OjC4bE8im+7o9rvnWgwFf+MAV0wzObdXbWqJEvuNN5WmVICGYrevZuzFs
         sT8rNc5BNKMMEgl7noSIwJHXwLrdBCayjaApRbhhQuGKUYhl0Cw3XYOr8uFvYm0VcZ6A
         XkEg==
X-Gm-Message-State: AOJu0YzIhOAiX6jv4YwhWvGFg8z79CaX6Mbk8c9vaYvgOz9KRN1cCTOg
	KlS8hWJzReKOMk52T7rWcVe1VigPGgcDCNEuf4UuSPKCEPn8ntXxowO2Bw==
X-Google-Smtp-Source: AGHT+IGqy0MOicmH24pmOwuZAOn6HMnXgFvii8EHN5A2eP7Wi2LS+2Qfv8IQF4DDAyX6mRYkjZ+wPA==
X-Received: by 2002:adf:f289:0:b0:34a:d19:d553 with SMTP id ffacd0b85a97d-3504a6332ccmr15258158f8f.5.1716025745069;
        Sat, 18 May 2024 02:49:05 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baad074sm24036745f8f.70.2024.05.18.02.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 May 2024 02:49:04 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] python3-requests: cleanup RDEPENDS
Date: Sat, 18 May 2024 09:48:33 +0000
Message-Id: <20240518094833.1036611-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 May 2024 09:49:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199531

Drop the following dependencies from RDEPENDS:
- python3-ndg-httpsclient
- python3-pyasn1
- python3-pyopenssl

Add a missing dependency into RDEPENDS:
- python3-certifi

Additional fix HOMEPAGE, the old link doesn't work

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-devtools/python/python3-requests_2.31.0.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-requests_2.31.0.bb b/meta/recipes-devtools/python/python3-requests_2.31.0.bb
index df48cd54c3..287b4f8eee 100644
--- a/meta/recipes-devtools/python/python3-requests_2.31.0.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.31.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Python HTTP for Humans."
-HOMEPAGE = "http://python-requests.org"
+HOMEPAGE = "https://requests.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
@@ -8,12 +8,10 @@ SRC_URI[sha256sum] = "942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d2791656dbd
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
+    python3-certifi \
     python3-email \
     python3-json \
-    python3-ndg-httpsclient \
     python3-netserver \
-    python3-pyasn1 \
-    python3-pyopenssl \
     python3-pysocks \
     python3-urllib3 \
     python3-chardet \
-- 
2.34.1


