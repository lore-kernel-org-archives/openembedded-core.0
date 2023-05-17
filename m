Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631B4C7EE23
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:07:08 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.44461.1684310804777859019
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=aMRgtd9P;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.44, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3063433fa66so236948f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310819; x=1686902819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P049dvU37PxX2+nr6pCNXMRqzVAuz6yCaSma380DtRo=;
        b=aMRgtd9P+tztusDtbAj7yZf6xKEvNxaW18pIK5i2st9qlAKI5AVmhTf8FXszJM/m5v
         8PH3WFsouUOM2XrbrPvOsPguxIGa4u2DUQ0J3UIgXUoWyL5Zetvg75zck1hS5R2IuIjO
         PAnewNkiCbOvPmagk7ErTT4tKksvt5rw0XKm2AWdUfIGvN6vL69ewL0t1/uVghRp+KBh
         YlBJ1661mMT+Qph0CAuAwuMzMbS60mzIMJAdocCWbf6xOSuie3FlmUpH6q2DWkwwSDFT
         2yzTy/ZU7nvVr0eG2T7zn01wh9Sgvr7a/W2W+KaTqFje9uNWz8oquUWQfq2QMAdoaeOk
         YE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310819; x=1686902819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P049dvU37PxX2+nr6pCNXMRqzVAuz6yCaSma380DtRo=;
        b=ANp1cljdcUToVEoQtk9btFFfnyr/tQ9sBfYHTypyroOMYNiEfXAhBW8SWdi0fbd/Ws
         7MYMAnxEJMhZZe7GWC90Ch2r86bimSOyUC74W4iekDURoxE38xDcof+fkhaLwOedqLfT
         89uOFHEJpwTVNcTm6ymm+lVXa1e58xUogu6PGyxwMpOwv78SZxnGbSoKMbQzFNxxqMmA
         Iuk8J6/l9IKxZ4wNHrWHp7TpCrrmDcWcBnsUd+tc0NqwX4NC3vfE3ttm7XOOwMlzU3Cb
         bHYW/wtUuPpinmFHbjT9d96JbZWstJDeggCHij4vNQv6Ku0g9iVdxvmk63Ci5qOi/HzH
         6iIw==
X-Gm-Message-State: AC+VfDxoW9AkxxMNpAVLQ7YByTMEJWl9rUn8aYBn/I724zcxCgCYPh81
	WXc6HTVcp4sRcXSLBAysKAZYTg==
X-Google-Smtp-Source: ACHHUZ7ftAQx1kkZAdSQL5kSulhb3+zyyBvyyffgMSQs0vNuspxEBtSk0S+O6eHe2WRSElVUKy4noQ==
X-Received: by 2002:adf:fc46:0:b0:2f4:9f46:6865 with SMTP id e6-20020adffc46000000b002f49f466865mr29464489wrs.30.1684310819761;
        Wed, 17 May 2023 01:06:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:06:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 16/20] python3-pycryptodome: add missing run-time dependencies
Date: Wed, 17 May 2023 10:06:35 +0200
Message-Id: <20230517080639.9336-17-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181465

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-devtools/python/python-pycryptodome.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/recipes-devtools/python/python-pycryptodome.inc
index 86d7f261af..8d9b6d911e 100644
--- a/meta/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta/recipes-devtools/python/python-pycryptodome.inc
@@ -10,6 +10,8 @@ inherit pypi
 PYPI_PACKAGE_EXT = "tar.gz"
 
 RDEPENDS:${PN} += " \
+    python3-cffi \
+    python3-ctypes \
     python3-io \
     python3-math \
 "
-- 
2.39.2


