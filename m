Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2691C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 10:33:51 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.5621.1655894029141564040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 03:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HySAZUTD;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id ge10so1715346ejb.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 03:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NdJGN94sJgMEjCZ5+UXG6f7F/CjelYO96tsB7flNPJA=;
        b=HySAZUTDHqIexPYenoMTr61lgKxiUq6+jt2ohS64KFrg+M80tz+hvh7v+REKH83YcB
         nGOO3Ys46Oa5McW3TkN/mGevuwEAFeIIGyDg4LUR0plAOOP7x6Pm5EPb6zHsmCtCS26+
         BSkoGsYV7RyHejgLlbNHs20Q8UYOYCCu4jdvopBBuCcVhXa6Ac+MJ83azasNS2/d3F+4
         96vRADKVVjMmnI8QXOlYxGGTdbDCN+tBtMzM7K+VcbVxk80REK5/vqj4AjzsApSSkZzy
         gmnEEPnZz/vBJR9fGnSbC4zIpj9M6HCyoZE7+wrcrZoB08V8jru3/89VZTbv/GhYS7wM
         Tmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NdJGN94sJgMEjCZ5+UXG6f7F/CjelYO96tsB7flNPJA=;
        b=JZ8WPDUiL8XX4bV40IECkwAOBiKwumiu7nWDMidVrAExGDhXdROf9un2ayIHV6w4IH
         9xawS06ow24ylkR0lGEZuk6r3F/Gr4LF6G8Y9MgSwTbr1M5ns1ggLrteOKf/4Bxu2bT4
         ipSXIP6citWK3j3NuawzSyV3S4YMuOJhus94UQJDsWyNnGrf9F9tsFn0Douk0i7dnXUZ
         c9t6ixqGiRCj3gKn7o/Nm2P0YjqHVS1WKSkx7E3DFW40ya7xKtSyL7g+56Wttq9NHgjB
         HdBGVSKJ7NqehxcNJToI7+rt9nMyWYScJQXzEQFXKuefiuDph95zR2AXXW4XNFaMNWoc
         TmIQ==
X-Gm-Message-State: AJIora/rVXjMJD2m1N7s5j1Gk0xRgegNHGPvlCkrFfqQDiYfF2au/9Pc
	o7Kl44iWPXz76l6+P2LLxda4nqCHjajz1Q==
X-Google-Smtp-Source: 
 AGRyM1tPkcJysFqtWO6rJP2qTaVKJcg7apiSMCdx57L7C/m8Oc4lrr5bhaGCRA33waTKwcLQ9IW8Zg==
X-Received: by 2002:a17:907:94c2:b0:722:e542:12 with SMTP id
 dn2-20020a17090794c200b00722e5420012mr2461275ejc.119.1655894027779;
        Wed, 22 Jun 2022 03:33:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 lb21-20020a170907785500b007219c20dcd8sm6315826ejc.196.2022.06.22.03.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 03:33:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 6/6] oeqa/sdk: drop the nativesdk-python 2.x test
Date: Wed, 22 Jun 2022 12:33:12 +0200
Message-Id: <20220622103312.1098389-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622103312.1098389-1-alex@linutronix.de>
References: <20220622103312.1098389-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 10:33:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167232

Python 2.x has been EOL for a while, and so this test
never runs.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/sdk/cases/python.py | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/python.py
index a334abce5f..d43354c32a 100644
--- a/meta/lib/oeqa/sdk/cases/python.py
+++ b/meta/lib/oeqa/sdk/cases/python.py
@@ -8,17 +8,6 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
-class Python2Test(OESDKTestCase):
-    def setUp(self):
-        if not (self.tc.hasHostPackage("nativesdk-python-core") or
-                self.tc.hasHostPackage("python-core-native")):
-            raise unittest.SkipTest("No python package in the SDK")
-
-    def test_python2(self):
-        cmd = "python -c \"import codecs; print(codecs.encode('Uryyb, jbeyq', 'rot13'))\""
-        output = self._run(cmd)
-        self.assertEqual(output, "Hello, world\n")
-
 class Python3Test(OESDKTestCase):
     def setUp(self):
         if not (self.tc.hasHostPackage("nativesdk-python3-core") or
-- 
2.30.2


