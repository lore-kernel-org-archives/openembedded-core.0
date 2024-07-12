Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B173C2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 13:10:42 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.7395.1720789840362080977
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 06:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QdeSTYfH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4266fcb311cso13554135e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 06:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720789838; x=1721394638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDGeFR0R1ljTatUZYKpjQjDL2a3esV6VyHrXQbmDsZY=;
        b=QdeSTYfHpiCTtwXRecniAJrrj048gX2yCQiL+FHLndKO4xIYc9gkSAylYkY74dO7dy
         rHUUGqsO60DpR3VYIZmRxMAmv8OUNEdDz/yY7fPKv2g0Bn/Vm2F4BLgYCy5WHQ4I+Rv2
         LQ35SB2Yv8eYojzvRm/PIyxwZk2WRe5G27te4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720789838; x=1721394638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDGeFR0R1ljTatUZYKpjQjDL2a3esV6VyHrXQbmDsZY=;
        b=gms9wanTnhvsjOAOMBu8XNjyT51cCsZfT0n/xvrNu4JMqS8ptZkALfNljtc/MqBqQz
         bdRwgN4tVzwhCs/r5SFsBUlS0PTyuS/Ev32rPl3tkflmWf+89Xv6SOgvb/YOCqLIkix9
         v8K9DTlM0Tt+c4LqBnw1taZI1N7ByT0QJQUkiDrwuUZqnBz1GDovWy3hEBg9sR9xFzgf
         tE2a6GjRpa70IJHPPH8QIJ3Hs9cxvwmsSRuMlTA/9WbmL7WEGP95tluKgkvVPsGOM9hk
         dL5jLK7HE31K3oY4OiUQaJg/a53LqxbGzvoFx7wFgKn+3rs1Xorh5ZdeUyRGgY+bW0FU
         RQRA==
X-Gm-Message-State: AOJu0YxXSRE/O9xPzwp2tzmzX3mQ7S7Pw4Y+KpCYmreivJSqOW8gtaY/
	JVrZhpd1cXUfqLhvtyivk1lm3vuWus32QvyKVn1DgR3zHRwbQMpRtBkZs/3J93QoZi/xFqmkhaM
	O
X-Google-Smtp-Source: AGHT+IEb7WKgXaZBf7DTsD1PZf5zHNsd1ta7/O5XyH2UyWMPvgo7q17HfNoEUkbH+JpT2vX+pcS/Fw==
X-Received: by 2002:a05:600c:2d43:b0:426:5fcc:deb0 with SMTP id 5b1f17b1804b1-426707e38bemr75181375e9.24.1720789838534;
        Fri, 12 Jul 2024 06:10:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c138:9d7a:7e79:ba70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f23999csm23630235e9.8.2024.07.12.06.10.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 06:10:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] oeqa/selftest/locale: Ensure tests work with ERROR_QA changes
Date: Fri, 12 Jul 2024 14:10:35 +0100
Message-ID: <20240712131036.1598257-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712131036.1598257-1-richard.purdie@linuxfoundation.org>
References: <20240712131036.1598257-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 13:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201823

The recent ERROR_QA changes adding build_deps exposed what were warnings in thi
test as it restricts the locales, then builds recipes with locale requirements
that were not met (in bash, gawk and python3).

Increase the list of generated locales to ensure this patches the recipes
being built and hence allowing the build to succeed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/locales.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/selftest/cases/locales.py
index 4ca8ffb7aac..ac4888ef669 100644
--- a/meta/lib/oeqa/selftest/cases/locales.py
+++ b/meta/lib/oeqa/selftest/cases/locales.py
@@ -14,7 +14,7 @@ class LocalesTest(OESelftestTestCase):
         features = []
         features.append('EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login"')
         features.append('IMAGE_INSTALL:append = " glibc-utils localedef"')
-        features.append('GLIBC_GENERATE_LOCALES = "en_US.UTF-8 fr_FR.UTF-8"')
+        features.append('GLIBC_GENERATE_LOCALES = "en_US.UTF-8 fr_FR.UTF-8 en_US.ISO-8859-1 de_DE.UTF-8 fr_FR.ISO-8859-1 zh_HK.BIG5-HKSCS tr_TR.UTF-8"')
         features.append('IMAGE_LINGUAS:append = " en-us fr-fr"')
         if binary_enabled:
             features.append('ENABLE_BINARY_LOCALE_GENERATION = "1"')

