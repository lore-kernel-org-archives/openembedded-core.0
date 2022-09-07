Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831B8C54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 08:56:13 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.5559.1662540963053818148
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 01:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tkoa1Z/N;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 r205-20020a1c44d6000000b003b2973dafb7so202461wma.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 01:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=/D0MMHvP7Xm3AhG94VVD1ki4iNexxVoH8ZSdFPTd85A=;
        b=Tkoa1Z/N6yqi6KchD9pb1m/hgmwpJU6BttFE0/ghFTmyGb9tcj0yU9C3Yfff0MxmV2
         SOHET94FnGG/bt9qZKW/utLiZrTSVhNkKEaub8AnTAlvF2E1rCej85jVHTItQ/VwiVr/
         oF7AxbLFCBin9ciwCQ49V+SjFR5ee7O9uyekQk0+VrLFh6e2VYRE7GkKdh1UD8ehQEjA
         RixiuvbaBaOi6tXIHQs8mCezq80SJORsml5zoEkb3lADkky9PCSpEwSkmtAzn2mlLWSH
         +o4VOPaK6Vt0m/rvZymCxdIc2MF12mGOT46RibbVqrbHreVpKcSyw5ckwsph1X21egsr
         GaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/D0MMHvP7Xm3AhG94VVD1ki4iNexxVoH8ZSdFPTd85A=;
        b=DAxV6nYNar6ds2axtfZcSiAaT2mXUEKwWlRxaB/rpQklXAO2NMkC7i6Fz1rLWvn+3R
         NQxlt8SgJjeU8GAW6SdHPmYTFhPngYProi9Ek1AvilZmGZJ1jID+Tg/DZ61wGX5zW2D8
         4Vi/iOtj0gaCLNVRhIugToB/eTFGYY1R4+zDkkbGR92S0KUsD74RqSDp8oaOJdjAewV1
         77tfbDwoiJWL97IiScsS9dOIbvLY3xLGITo/o6PtTq9qItEM2zriw03juaSeIBNv+O09
         pKcdCOMsowekC/6bwbyhB8694pEAsez5gVAsPxBL8xMjXMrLfNEhyi1NPqXpCo+qC1XN
         hCUg==
X-Gm-Message-State: ACgBeo2A2prdzwIcRSZ6GH8Jy5MWVshv3/d3bWvz1peis+6Ye8+qrMCN
	KOPKKq9XLWVbHyfO/qdvSV6Y+Hwe6/c=
X-Google-Smtp-Source: 
 AA6agR7S8yZHy4xozmwO2DVY+FdDHwLoItdvVoKDyVothMCW7aPJ3eu3xaU3bDB2DGvC1j3xsGjhrA==
X-Received: by 2002:a05:600c:444b:b0:3a6:6b99:239a with SMTP id
 v11-20020a05600c444b00b003a66b99239amr16382151wmn.41.1662540961282;
        Wed, 07 Sep 2022 01:56:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 l11-20020a05600c10cb00b003a5260b8392sm21498255wmd.23.2022.09.07.01.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 01:56:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 2/3] selftest/cases/bblayers.py: build python3-jsonschema
 only once
Date: Wed,  7 Sep 2022 10:55:51 +0200
Message-Id: <20220907085552.1171821-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220907085552.1171821-1-alex@linutronix.de>
References: <20220907085552.1171821-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 08:56:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170374

setUpLocal runs before every testcase, setUpClass runs only once in
the beginning.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 37b92f19c3..328af91532 100644
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


