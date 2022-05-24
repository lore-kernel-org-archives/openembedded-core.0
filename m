Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77678C4332F
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 17:18:18 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.12136.1653412695664617946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 10:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OvDWCnV0;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id rs12so24960309ejb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 10:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BFJqXWdUi5mT85SRqAXdDZs9sVVR6Uc17Kqp1u9gFss=;
        b=OvDWCnV0nvRNyvmIDVIfDevShgQw+fQRvvWuzAkfhQBPn4NQVlwCv0Dxe/7vxSnTL7
         p82jXpXBHpGRBU9IgaWvPH8SYw5kuRYOsgKEBMDvg4DTmMB7Zj9oMaxp5hxcY1oMykPG
         Z6kOyft9KIxYt3YS58DVdWy6ZjfpdWDvvFnFCial4gSq438StcTsN+rwcJaQgd6tg74m
         qTo1qW9++zfJpbToS1R0tlxo6C+xaeJmySl0BMh8o5L7LFIVPLMrXyPSBU53oz26/6kv
         prShp4+xw1dvFjS0Nz5xCtEu7q+th0fB0zM7/ZW1lGtfHVg18EB5YcR9JfuCKqSf3GAA
         1YGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BFJqXWdUi5mT85SRqAXdDZs9sVVR6Uc17Kqp1u9gFss=;
        b=j10SgZIVqJaplAg6oU0h7Ih2bhOSALxelRBJfttstwtEkXP1T9sMfZHVEbn7il7gNJ
         Ai+9zHzkNaOyNB2ha19FOw5V9UL6hwqhhIYJd/+yZSqvxfVeg/o8/+MQwB8KqOi2MjcX
         4qUmljABPsHCicl6dBaJS+PtWVunyA8gpmFDW0pX66G9ImbttjjLTJJX6OnVb7BZK6t7
         fI8g1XfMqMnTGf3vMDXLwxzVClxm+8EH1267yHAyfLkH2QB2kQHqhmgPMYVTWnHenaKk
         SldL6HAcpGrqX2K//iiHSaHldMXM3eyCvBTaDGuww9gMkzNqU3I1DrLuoUAAdG1ur5n1
         kWKw==
X-Gm-Message-State: AOAM530hhrWm3iTn1zNsQf0gZFeEVanoJugmgipPcBNgIntRrBa8ZG6t
	Ak339TfGDKzG/TUtpmMShY0HxsKW17w=
X-Google-Smtp-Source: 
 ABdhPJwvVgvFfahEGLziwkZM6p3//Bt0l9IxPVIqfGiLliiJSjGeK7uxtfVhTvehQb5oV81cnwtfSw==
X-Received: by 2002:a17:907:7f8a:b0:6fe:ec18:e9fe with SMTP id
 qk10-20020a1709077f8a00b006feec18e9femr8886816ejc.93.1653412694060;
        Tue, 24 May 2022 10:18:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a056402164700b0042617ba63b3sm9775578edx.61.2022.05.24.10.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 10:18:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] valgrind: submit arm patches upstream
Date: Tue, 24 May 2022 19:18:07 +0200
Message-Id: <20220524171807.4029924-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220524171807.4029924-1-alex@linutronix.de>
References: <20220524171807.4029924-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 17:18:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166084

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch | 2 +-
 .../avoid-neon-for-targets-which-don-t-support-it.patch         | 2 +-
 .../use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
index 9f1da7bac6..073713c139 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
@@ -10,7 +10,7 @@ implementation.
 Fixes
 | cc1: warning: switch -mcpu=cortex-a8 conflicts with -march=armv7ve switch
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=454346]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
index 5fcfec0015..82b8344279 100644
--- a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
@@ -8,7 +8,7 @@ test 64-bit float copies when building for ARM. Allow it to do so if
 possible, but fallback to C when building for ARM targets which don't
 support neon.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=454346]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 ---
diff --git a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
index adea405213..f15d04b173 100644
--- a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
@@ -15,7 +15,7 @@ over-ride that).
 
 See similar cases in none/tests/arm/Makefile.am
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=454346]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 ---
-- 
2.30.2


