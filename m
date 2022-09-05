Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A423AECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 18:21:54 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.27933.1662402110019988464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 11:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YhG1k0fi;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id j26so5666650wms.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 11:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=kPTE+L7nLrcDhSJ/+M5GWjgNAM/pUSldB7Xy9n/+bF0=;
        b=YhG1k0fiT9TYmBwLtq1TSKmIYSTnpdSRJiYFq+7ldRM0exzlmxtQqlRx1i1KpJiBVb
         28ATWuR6ObTra53Zl1F4nW/hTJaF5N+F2qF2reqmdVPS19gPw2j1VaBMJEriR5SYAlzh
         GeC2aqy1mL/FlNrEK70Q8ntL4Km2R6qo6gJzHA5dJWDV8laFLnc7gj9hM1qzrkiad4vY
         pRlIf5NPBCN8vdMUeB2cExfUBmUbb1xY5az/64zDsgKkZfFKsBtns/HV+y3w0QopM00v
         4nqtQJXqxCD9SzMZCu9rypa7/JARDgeewAy08O3GRpW0yo7Zp22cFxbUN2vTEcIxd8hF
         DglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kPTE+L7nLrcDhSJ/+M5GWjgNAM/pUSldB7Xy9n/+bF0=;
        b=LhECehBxJkvf7VeaXf18xVQ/WQV6ZFRvbjiileFYryVb1MCTF4gvsCT8pB8+TlVrRP
         d8D1KovXDz9KDtnm2TcgJlnXpuX+dZl6BaMfB4nDSh0qQ4EBfcG9v6/tJytX6jaZLBWi
         aVdXLG/R2kK3sbXYZok92R22W7yyYZxdOKklNv4TlFK4cbRDODisnsX2vfH8iwp1zwHO
         prgFIuXtzpPzx4GhEtJBBses3ETPTrI0brywjYKei3Sl1LYNykne5bMQ58Cn7FTdZeBU
         2dggf8q0G3NoD0skNu88JoGAPVx9hB9gR4toK3OKHv8lboRSRRRCxSJylvse9iWw6MvH
         98pw==
X-Gm-Message-State: ACgBeo3wGRninUrJ6rrs8j/OVOYcPR4S+uGCWOypcWqMm+sYkjmp8Gh1
	sQNleenLgpuVprMil1YJT8uCW5nC80zfrQ==
X-Google-Smtp-Source: 
 AA6agR7HkNNQ0x5dtmZKezmo2epGLvBOg6FeC0JT3I3qlX882YpFQiFHUjJXekQOA85DtdA0dOtj6g==
X-Received: by 2002:a1c:f20d:0:b0:3a8:4176:139b with SMTP id
 s13-20020a1cf20d000000b003a84176139bmr11103311wmc.177.1662402108510;
        Mon, 05 Sep 2022 11:21:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 l12-20020a5d560c000000b0021ef34124ebsm9686031wrv.11.2022.09.05.11.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 11:21:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] selftest/cases/bblayers.py: build python3-jsonschema only
 once
Date: Mon,  5 Sep 2022 20:21:41 +0200
Message-Id: <20220905182141.1091053-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220905182141.1091053-1-alex@linutronix.de>
References: <20220905182141.1091053-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 18:21:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170323

setUpLocal runs before every testcase, setUpClass runs only once in
the beginning.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 1dd3046aa6..7321e52472 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -14,7 +14,9 @@ from oeqa.selftest.case import OESelftestTestCase
 
 class BitbakeLayers(OESelftestTestCase):
 
-    def setUpLocal(self):
+    @classmethod
+    def setUpClass(cls):
+        super(BitbakeLayers, cls).setUpClass()
         bitbake("python3-jsonschema-native")
         bitbake("-c addto_recipe_sysroot python3-jsonschema-native")
 
-- 
2.30.2


