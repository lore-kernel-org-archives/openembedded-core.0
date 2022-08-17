Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278CBC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 13:10:45 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.28525.1660741841648180436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 06:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fhhkV4ef;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 z14-20020a7bc7ce000000b003a5db0388a8so1727828wmk.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 06:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=dWZG7x8uqpiiHdhATzrGEA5j9yTYd9rh+VKM7UKDey0=;
        b=fhhkV4efaxkwl6kqcZchvZ0KBX3NglcCfI5zu5UK5qE4zll7TWdjYGRac47g/yqRZq
         XxHyraqAksP9hxizWEHj3+RbrtY2mXqW70MTdvqNWFJMR7kz//PQwRokL46bDcz0SE+s
         2z6e2RnF4WtoodZ0AuXLd+BCsYIGwP+Pmvu7obCF7ltsG6DPTHC9hc1wnVWhaO9H361S
         7L944lhjnaMfaAmoslwj0Bd2mvKrbJ7XD7rDJMM1deQ39su5na/nexp625K/LNuc84Wv
         0ev6fC0DRKYpRp8ZXwdTmgPLyb273jkMICSaslY2CLDkBS2kZcm4ZpGofFw0eir9VIyN
         LJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=dWZG7x8uqpiiHdhATzrGEA5j9yTYd9rh+VKM7UKDey0=;
        b=lPMRNN/693fu7v3/mZMw118XPxP8Ny9zWKRsmHfSdv1peWxhyTRj+RyylC4qEyWPcu
         cqn6Ol042gPrYrbqdE4EgeOx+HKoLgOdCm6NtkdJNIJiU1M2d+ccWoSm0rf9wy1zWMXv
         hPpUP3REB2M+tAUOFdoBTprkvHmzt0KSj9LEQRZ30nCY6ilm6ihYF52mw+PL8HUXL+at
         whUsbAiuj7I1cd8W6y23P9AbpQ2hnigHngVTe9SZaRZsTVi6uS+H+9T4LhtVSKl5ithO
         BsEkL1sjnmz4CprVmdQlWEyPCFk0UqPJUnBByVG0SMrnbRfyF2zU3Bo7pee5QYcY80Wj
         ZU5Q==
X-Gm-Message-State: ACgBeo2QwSsx7vxU5VZRaaoTK2VojLb6ATv2241jksUz1ga+6foMZNYg
	EZV/6u0VypGt1H8vf9eOCZp02BpKcKs=
X-Google-Smtp-Source: 
 AA6agR7sjUwxnRbCn6N5nCxN+oHfkrRy1WZAzhJAQjzAnIQYGT1zRy0V8xsQSgxY65uSTcL8gXhglQ==
X-Received: by 2002:a05:600c:19c6:b0:3a5:ffb3:d527 with SMTP id
 u6-20020a05600c19c600b003a5ffb3d527mr2121810wmq.106.1660741840089;
        Wed, 17 Aug 2022 06:10:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 bj1-20020a0560001e0100b0021d6dad334bsm1462004wrb.4.2022.08.17.06.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:10:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/5] selftest/bblayers: add a test for creating a layer setup
 and using it to restore the layers
Date: Wed, 17 Aug 2022 15:10:23 +0200
Message-Id: <20220817131023.4093773-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220817131023.4093773-1-alex@linutronix.de>
References: <20220817131023.4093773-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 13:10:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169482

This does a basic run-through of the bitbake-layers plugin, and the resulting json layer config
and the layer setup script that uses it. Only poky is actually fetched by the script.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index c753a7b795..c6f3000c90 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -142,3 +142,25 @@ class BitbakeLayers(OESelftestTestCase):
     def test_validate_examplelayersjson(self):
         json = os.path.join(get_bb_var('COREBASE'), "meta/files/layers.example.json")
         self.validate_layersjson(json)
+
+    def test_bitbakelayers_setup(self):
+        result = runCmd('bitbake-layers create-layers-setup {}'.format(self.testlayer_path))
+        jsonfile = os.path.join(self.testlayer_path, "setup-layers.json")
+        self.validate_layersjson(jsonfile)
+
+        # The revision-under-test may not necessarily be available on the remote server,
+        # so replace it with a stable release tag.
+        import json
+        with open(jsonfile) as f:
+            data = json.load(f)
+        for s in data['sources']:
+            data['sources'][s]['git-remote']['rev'] = 'yocto-4.0'
+        with open(jsonfile, 'w') as f:
+            json.dump(data, f)
+
+        testcheckoutdir = os.path.join(self.builddir, 'test-layer-checkout')
+        result = runCmd('{}/setup-layers --destdir {}'.format(self.testlayer_path, testcheckoutdir))
+        # May not necessarily be named 'poky'
+        pokydir = os.listdir(testcheckoutdir)[0]
+        testcheckoutfile = os.path.join(testcheckoutdir, pokydir, "oe-init-build-env")
+        self.assertTrue(os.path.exists(testcheckoutfile), "File {} not found in test layer checkout".format(testcheckoutfile))
-- 
2.30.2


