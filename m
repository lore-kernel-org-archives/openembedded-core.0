Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E41C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:28:06 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.8907.1720096077691474417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2VGw2tTt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fa2782a8ccso2690635ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096077; x=1720700877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+Tyo91SPkBmbBMqYBwJVX08zjYs2Gt6VQq+xlzNR2k=;
        b=2VGw2tTta7i+PBWu6AOM/hbuBufF48A3uEHR4BrGkgPBt49dpqHNb/vMip2i2VD5F/
         ICjP3RJvW/AbY9ak6trSskxcieCTp5ds/ugB1u6U5zTpVKOfAgziKQnKKtFZ9to+sjGV
         NY9kP4IzWDnOYvKWyI7OBMNeczuT6AP8j9xB7fBtt/jVfhmRYQIoCIB9mIw9/C6zm6F+
         KDqHUQoOFVmu6Gd1NmXiw1WtX1iDjJwIfVc+/vZnibD98BWtMWdkTndXH055k6Cl3io8
         EET5fo4WiZm7DC+JG14FjQWvR8cnxVV50Aujru+LYsbzBHU6PWS234ygJO8YU9xywoGJ
         dohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096077; x=1720700877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+Tyo91SPkBmbBMqYBwJVX08zjYs2Gt6VQq+xlzNR2k=;
        b=XDOMUm9ZcxETn6GwBfDvbDsO0bjg1Yf4+sArCK5gXke7efoPwojCBmZ+dJ0D5365Hs
         nUrabqt8PdJqBD6a7w7nP6QrQHwUwfoVmWmFJx4Q97gI3FX4hnP4zTni21vEc/9Xl883
         JNBcnXvhGia8y+NSDCXUbbVMypq4i0tI9QNC5AxyqEuic7LzQn/kKTNSvIucVr/ZNX56
         66+IUtBjuPSq0HIM1w2UiLchbHgonLa/LhH1RWh7X6KwP5C+4i4nLTbw5H/qErMmFcYO
         LzkbK/RPibDZ9FUyr7j7aify5Zu7zvQWtF7FV/pyT8bMgS+4HFt3ixtUz1jhV07twmLy
         iadA==
X-Gm-Message-State: AOJu0Yw8NgE4ZtRWdoPGe6JF1eNWoSzeZLGGk1SQyJ4/s1VFC7dZpOn4
	RV+uXzDfnpzKk9cQlWTT7ThaI5gMEztCR3Sdc0DTp+AcoGNg2WIoUjSNyvBflN6coxHqqABEyrB
	C
X-Google-Smtp-Source: AGHT+IGa9LHvtsInB/fjinG44VY2QO8W8dYQ7VMNzWdNQa2A3aGSW9B630CfKsEerlbRIptJmaTWEg==
X-Received: by 2002:a17:902:680f:b0:1fb:2bed:6418 with SMTP id d9443c01a7336-1fb33f240c6mr9235015ad.57.1720096076946;
        Thu, 04 Jul 2024 05:27:56 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/21] python3-pyopenssl: drop python3-six from RDEPENDS
Date: Thu,  4 Jul 2024 05:27:12 -0700
Message-Id: <d7ad0495c543ec952817860595c047e5e4263978.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201563

From: Guðni Már Gilbert <gudnimar@noxmedical.com>

Python 2.7 support was dropped in version 22.0.0
python3-six was dropped as a dependency in 22.0.0

Signed-off-by: Guðni Már Gilbert <gudnimar@noxmedical.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6eab37a0cdcc6071f79aa5c8198df0b2ba23dd7a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
index 9ea3075482..116f214bfa 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
@@ -15,7 +15,6 @@ FILES:${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
 
 RDEPENDS:${PN}:class-target = " \
     python3-cryptography \
-    python3-six \
     python3-threading \
 "
 RDEPENDS:${PN}-tests = "${PN}"
-- 
2.34.1


