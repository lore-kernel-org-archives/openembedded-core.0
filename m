Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CABEC7EE2C
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:06:58 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.44473.1684310816550638521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=q5TjFncp;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.41, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-309382efe13so238830f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310815; x=1686902815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNhlvzG9l+oV1g5YhLFIqTVj2g2ni/dPXYwO5GKgA1I=;
        b=q5TjFncpernPIsbBjikUAxRnVd6DXxvIIX938Mx/XHK74wRLjbbiwERZuQGF8Hfrtm
         z8sfFx07BS6GkKxRl12dPBj92HSblWiozaEwXbsjXUJSbAmmuwXxUngGjNRMPIpdVEnw
         hlERwrycWI8GPWXccooygylvcibtHx1ACheAmU72d7Snx4v4sGAwUakREhNgI2zFw2W9
         gmuOVyJ8AO4iIgiGLOnzDbLdYqWA/m4bmK7vE1bWm7HSp5E1ibRY7pITeMxO0+rADX/d
         JrZqPCJHKdKvZIFbeutbinLDvT33wasOXFxCQVjaLU4ZzQ7aIOLpCBUHONmqd+cqwxtV
         YwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310815; x=1686902815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNhlvzG9l+oV1g5YhLFIqTVj2g2ni/dPXYwO5GKgA1I=;
        b=Q1cO+ZhOTyi9IpNO7plGFknVaI5E+iOi+fpbhG1FPY/lTL6jGZSZrsbJD479fiGzF1
         BZNfnWN9DMwX/2S1OAgsLQsPN+7TwwBEMmx+8k5kQDvGEQwPyNEdqkVzHzwg8sRoWo6P
         DSJbJDglMlmGtPwdJdimurDN+0haDrHcMqqamdOdRS+tnyS9Vyc8ytMj5BJaWgSZjfLA
         KsajZj6V5i6Vw80HN5XRL17zoJXA3c0c20Ktn/lm3V/IPjFaorL/3Yl4jYnyV6CuaGUC
         J8SojKhpp48ObP2Aeo36Bo31/cxkuRMbzcZeoAeL5U8GNZACTypaPWf9Gf2yTB7h8Etk
         Pehg==
X-Gm-Message-State: AC+VfDz7BG66liEgDe6QKAJOABZz9GpB/LAx234Dv+xHBhpCG5x6u6Q/
	PuioXdTEtDg9QY+5s9UyBVqXCQ==
X-Google-Smtp-Source: ACHHUZ58WOPBfNv1H4QXh8SlACkvh3la3q1s+BeUco1oCxog3/81Rcho3xRSNeYIdUNpvfsfxF2Yow==
X-Received: by 2002:a5d:6850:0:b0:306:34ae:6a23 with SMTP id o16-20020a5d6850000000b0030634ae6a23mr23768696wrw.5.1684310815151;
        Wed, 17 May 2023 01:06:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:06:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 12/20] python3-sphinx-rtd-theme: add missing run-time dependencies
Date: Wed, 17 May 2023 10:06:31 +0200
Message-Id: <20230517080639.9336-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181461

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Remove DEPENDS as this package doesn't really have any.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-sphinx-rtd-theme_1.2.0.bb                 | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.0.bb
index e8a422b2e7..d9cd18e0ed 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.0.bb
@@ -6,7 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a1db7d4ef426c2935227264e1d4ae8f9 \
                     file://OFL-License.txt;md5=4534c22e0147eadb6828bd9fe86d4868 \
                     file://Apache-License-2.0.txt;md5=8a75796f0ef19c3f601d69857f5a9a5b"
 
-DEPENDS = "python3-sphinx"
+RDEPENDS:${PN} += " \
+    python3-compile \
+    python3-sphinx \
+"
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
-- 
2.39.2


