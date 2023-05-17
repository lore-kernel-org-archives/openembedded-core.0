Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BD9C7EE23
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:06:58 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.44464.1684310808962822730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=ODlfIuP8;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3093eb8cd1fso241765f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310807; x=1686902807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rC+DLWAWsbw/a85C9lGUeisehlHMgJrafaxRgh0g+7o=;
        b=ODlfIuP8fZvr7OcUZtcnyfeInE+2l0tgJdBwzj99iJSg0gbDaT9oyAjvlHzEJ6E12r
         mHQEinUR8JY9BlV20RR+xRhw8ecntN0z42lzQ2o8IpcBzUI/TWPIqj94KhVa5NTcQ6nA
         FN/NcvU1xQbMPMbmWt/dCULE5N0sfZbnXuNDk3IQzbmFNxrPVAnoTf3xqn1gEIWJ0MyZ
         7MKw9kcAolH9842sybqA4q6NWKpScRn4Un3Zlj56QT6JwMAQ5RZn0QEj/q4LUwZWqCCU
         FxUNSUBoa3Mv4vAKilzxnwEOA/ScXhbrANhmYUe8r8PQhzw4TTluUXVCmoqrNlVJNfrl
         OnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310807; x=1686902807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rC+DLWAWsbw/a85C9lGUeisehlHMgJrafaxRgh0g+7o=;
        b=X/y1XUKSyW88303q2vTvzpIsGtnqkyMyrsLsPJzETAk7GoOTRAMpyyK/n2253/uQkm
         gGKbFILml5HnOZdqnVGVB+KBb3gwSIxZh9mUJQ21+i25lIAj0kfZ4yKpnbKWR43jK21c
         gRPrIGr53POeMEvYwOSOgUqF127EJiahNJpt1RttGnyB1GGmpB3cpZBrG3O1yax4ocQt
         4I/JU2Bx151FNsuDerANkEJj6twIHCP0AlZErsUEUdFLgmHWJmrOM46T8ZkwfnYab2LO
         yKCVU0gCxrJ3meMs24L05LIJV/w6y2r7f7Xe+U3FmLOH/vwZZhcMP+qTQKzFPOAuhucq
         0kCQ==
X-Gm-Message-State: AC+VfDzZX0jxM1YmcGDSbaq9AUM63/dKfUXP7k1mES3cXXe+SLvzxeXr
	IsGLGyvL1XlSco1c5LEuVW+hWA==
X-Google-Smtp-Source: ACHHUZ5ld4ZNbkShNSMoO2To8bj6wRKWvnIU8IhSuVcbnwlVd8GEpsa6yEdw/+c4ge+Ix56ymXQlpw==
X-Received: by 2002:a5d:5404:0:b0:305:ed26:8576 with SMTP id g4-20020a5d5404000000b00305ed268576mr23476947wrv.9.1684310807502;
        Wed, 17 May 2023 01:06:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:06:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 05/20] python3-certifi: add missing run-time dependencies
Date: Wed, 17 May 2023 10:06:24 +0200
Message-Id: <20230517080639.9336-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181454

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-devtools/python/python3-certifi_2022.12.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb b/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb
index dca3d26811..b2e3ec125a 100644
--- a/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb
@@ -12,3 +12,5 @@ SRC_URI[sha256sum] = "35824b4c3a97115964b408844d64aa14db1cc518f6562e8d7261699d13
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += "python3-io"
-- 
2.39.2


