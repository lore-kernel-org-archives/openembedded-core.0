Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F67FC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:28:01 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.5663.1645406880318920753
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FEdlKtn+;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id z2so2968467plg.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CDXACuYlMBR1fSKPg1dU6e4wfDkWA19o0vQSLU/ZYeE=;
        b=FEdlKtn+76TFPdP9RwYRKxKsC0y7koqAQvhMnhThOb+sFt46E4qm7VQEe1QGJVAyQ3
         uSEm2OJH+kmZW1L0oCPf1l/gefXLv8gX/B/WuYE+HFxeLd4gVuJZ7dA4lQVHnpo/BgdY
         qrnMX/rRIIwWxRp9yYlIaRJvk6SX+UsGKZNa6T1hBWhugAQL583BBAetuCkDN+Ykk2th
         cDfvdN8UWlHI5kydaxcGsit3A9hpir2pc0H/aegz+R6SQp6WHx9TqvadQU1eJHdw2WPP
         5x30ATBknQTbELDjON18IMS6aNhsu0GqGUrCJc8Lg7iBkNuQqw4xGBqfrMNbK7dR4y6Z
         t92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CDXACuYlMBR1fSKPg1dU6e4wfDkWA19o0vQSLU/ZYeE=;
        b=gyMYsVWOgzzBXRSv+MCXdM7q1jeVPRrP5E2HBVG+OIVzYLivH8/RHFgVes9l/K5JD5
         V5wNZuxyZsR4bTyZmCpffS4sGiaXUChmFuQvmFRpK3JUVurP+QJZuGYPCB0CroZgwQq8
         kEdc5/9aiK/mnzMScUhiFv7x+ZuY8zX5Jvbyx1jhmrrG7bEZaMjsDljQbe2TYdRW17/7
         i4pvv0A3Wn28UFu5qQtWEPS+yaVnBwWRo8wPlVAZr14HCiKn7w7OpZM/LZ0g3qSEuKRR
         lOM9qtWwIvfkw3QmZRy6Cz62eYVyz0YsMoLPr1gvhzMBmIgTGmvWJzq6qaPNOcevJy5E
         tRnw==
X-Gm-Message-State: AOAM532IC1Ivffbf1H+ju8C9qwOeuz7YxAkb3cv6J33/fTZ/pqD0gju7
	DrcZAQoKKp58ADLZo11J6yMDzw3EIef9/A==
X-Google-Smtp-Source: 
 ABdhPJwtcK0zbzcOezJJUet62mHtMEKQXOhMov0TqcAx0TDww9ex9BURoq4CHbZ/5LMkd7rm07FZdw==
X-Received: by 2002:a17:90a:c706:b0:1b8:a942:3e36 with SMTP id
 o6-20020a17090ac70600b001b8a9423e36mr19044055pjt.40.1645406879410;
        Sun, 20 Feb 2022 17:27:59 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.27.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:27:58 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/19] python3-flit-core: simplify
Date: Sun, 20 Feb 2022 17:27:32 -0800
Message-Id: 
 <94ec7ed393b8d1eb8c0c6c2654e449e02e073131.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:28:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161995

Upstream provides a build_dists.py which can be used to bootstrap
building of the sdist and wheel.

Bootstrap -native by simply unzipping the wheel to
PYTHON_SITEPACKAGES_DIR.

Use pip to install the wheel for target.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-flit-core_3.6.0.bb                | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb b/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb
index 4221076bc73..d0b88c3fa50 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.6.0.bb
@@ -3,9 +3,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
 
 SRC_URI[sha256sum] = "b1464e006df4df4c8eeb37671c0e0ce66e1d04e4a36d91b702f180a25fde3c11"
 
-inherit python3native python3-dir pypi
+inherit python3native python3-dir pypi setuptools3-base
 
-DEPENDS += "python3 python3-pip-native"
+DEPENDS:append:class-target = " python3-pip-native"
+DEPENDS:append:class-native = " unzip-native"
 
 # We need the full flit tarball
 PYPI_PACKAGE = "flit"
@@ -17,7 +18,12 @@ do_compile () {
 do_install () {
     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
     PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
-    nativepython3 -m pip install -vvvv --no-index --target ${D}${PYTHON_SITEPACKAGES_DIR} ./flit_core/dist/flit_core-${PV}-py3-none-any.whl
+    nativepython3 -m pip install -vvvv --no-deps --no-index --target ${D}${PYTHON_SITEPACKAGES_DIR} ./flit_core/dist/flit_core-${PV}-py3-none-any.whl
+}
+
+do_install:class-native () {
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ./flit_core/dist/flit_core-${PV}-py3-none-any.whl
 }
 
 FILES:${PN} += "\
-- 
2.30.2


