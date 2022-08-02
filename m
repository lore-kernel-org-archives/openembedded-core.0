Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D7BC3F6B0
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:57:52 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.6427.1659448665639780460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oDQLyq35;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id m4so4287187ejr.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fv5EfvI5qxIjQnh7ixNMs3R4YsMVashWDi4a7VrUflg=;
        b=oDQLyq35QaoaoiH79y9BjYU8CBzuaVUYolgXBAzp9lQ1qAwNqL8yo61I/bk9xDpPX1
         uf8hBOSSAIiseGNgyEbhAukqC6Xo0WAV3v8lfkl1WXLeIYEHIoz0fWltczuDbWaa0cF0
         Ru8LXX9QAWVgGUDH0zvhpJe0Rt7UUj0skCxuHbtnCrJm7BTjLUNk7Gg/w9VtQ45HzTyU
         qL8Act1vsUXdPM9iT02D/3vlQS8GkoVe6jvRMGYD2hcS9pA4UxOIQwdgtPyKt/wOoFGs
         +gk+3ISSb4TkZIDJWdvndgxyxL7vAuQqTBR9tjdMeCwiTjYJQjLYHqSlzEl4zpqH9dzg
         BHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fv5EfvI5qxIjQnh7ixNMs3R4YsMVashWDi4a7VrUflg=;
        b=fO+KotHiVOmvdqI9Z0N5LIS7hewNPcc2GF3JBG68VpZp+3BsY3JagpPgfJSiH/yEqu
         LcvSoyLCdat9xk5D4EQqPIEmUkdhqtdz4fKZiKey5OzJrlZ8feaJrAub4iJagr5DBDnO
         dd5SYUZCXQCxozv4TUrAIfMFEcSa1M3F02jgHJBHTaJrntZap51FWEO9290R0ZMKZWq2
         X+20JHe2aIa7vJ/uxp4kqgN0EBUQJedogtZWO742Z6pg3sSYY/MhY7IqpdHKOq1qnl3F
         vb7020blzlA/j8Om0V24gSJpoP/Sq+2rsxi/YoIKoZVuf9n82b1iHnnzO7wrHZlGe7co
         fURQ==
X-Gm-Message-State: AJIora8Yi2ASRNk9dMbCi9PKlW4ZvYR2QYhglGh2sede8hBy6MAzBXpt
	eTuZhgOScNNUfbK2aLNjse3dXSC1K7o=
X-Google-Smtp-Source: 
 AGRyM1u8mv93ymHSTB6EsXJ83C8Z7eWwKceJMue6B8IQpgeULbNB87dKypves5koqIxCGfA8HUSVMA==
X-Received: by 2002:a17:906:6a21:b0:72f:2174:16e6 with SMTP id
 qw33-20020a1709066a2100b0072f217416e6mr16545678ejc.177.1659448664021;
        Tue, 02 Aug 2022 06:57:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 kx18-20020a170907775200b00722e50dab2csm6233731ejc.109.2022.08.02.06.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 06:57:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/5] selftest/bblayers: add a test for creating a layer setup
 and using it to restore the layers
Date: Tue,  2 Aug 2022 15:57:14 +0200
Message-Id: <20220802135714.2785052-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802135714.2785052-1-alex@linutronix.de>
References: <20220802135714.2785052-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 13:57:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168785

This does a basic run-through of the bitbake-layers plugin, and the resulting json layer config
and the layer setup script that uses it. Only poky is actually fetched by the script.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 4f4952f3eb..1f5c576356 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -140,3 +140,15 @@ class BitbakeLayers(OESelftestTestCase):
     def test_validate_examplelayersjson(self):
         json = os.path.join(get_bb_var('COREBASE'), "meta/files/layers.example.json")
         self.validate_layersjson(json)
+
+    def test_bitbakelayers_setup(self):
+        result = runCmd('bitbake-layers create-layers-setup {}'.format(self.testlayer_path))
+        jsonfile = os.path.join(self.testlayer_path, "setup-layers.json")
+        self.validate_layersjson(jsonfile)
+
+        testcheckoutdir = os.path.join(self.builddir, 'test-layer-checkout')
+        result = runCmd('{}/setup-layers --destdir {}'.format(self.testlayer_path, testcheckoutdir))
+        # May not necessarily be named 'poky'
+        pokydir = os.listdir(testcheckoutdir)[0]
+        testcheckoutfile = os.path.join(testcheckoutdir, pokydir, "oe-init-build-env")
+        self.assertTrue(os.path.exists(testcheckoutfile), "File {} not found in test layer checkout".format(testcheckoutfile))
-- 
2.30.2


