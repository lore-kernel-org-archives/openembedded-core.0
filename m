Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37060C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:11:14 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.8434.1659103863962244586
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QbMqoKTV;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id m8so5959300edd.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fv5EfvI5qxIjQnh7ixNMs3R4YsMVashWDi4a7VrUflg=;
        b=QbMqoKTVWcsTgoTOy8Pv9WJqQrhqlduWwhRdYzU7GMizLO1jlub3n9BCrNT9UIXt+H
         roc5Fi++4cpfnVMdg+SQUUsFYtCq6i18MlvGj4I75ufvJFTrbXBgSIEE94rvvMSgBf92
         wcRumlZU4XcOPDM+zTuOivNlV5zITgdTeu1FaCX29N2cZHHGNC/wMHWrT+G1M5ADDRp1
         nmCLPHIwqdMlsppU1t92kH/WAKx3HvixZQXtPy5T6r+NjCx6Jseu8eanSZ+wsFCJqB7W
         3v7kYgs2OFOzSZk+FQw+Oq+4gpa2LV2ggInLjqtIze9RbAy9OPTTA93y3aMWZqQ8qZvb
         Gmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fv5EfvI5qxIjQnh7ixNMs3R4YsMVashWDi4a7VrUflg=;
        b=dxzbeAzWxb7ucI630rdi0zwXtQeWttxO8sxdFcz8jsM83iFvsWhcpD08B8l8/idkGH
         K9mF8MBGquNefduoC88ellK/ePHxC7t9t2Cidiuz3MwtZvOGz/n6Uh0MRLCoVAmX4K7q
         i/UYJeo97cNw6+SX0QFGpRtXajRjomCTFPKom3t6QleRqa2bWccS022jXBIyb7wMQtu4
         5SiA3IkHleO3O8oRSlMhLQZdfon/0a/tlvmzNGiODNQ9Odnx3RwoCYh7VBGMoCau34fU
         iu5rwFZXFVe/mqpDkz3KRNJEGzCGI5bztg0dxVaJHENaNRJitBySDe57VFAkQBJF89xF
         gHAw==
X-Gm-Message-State: AJIora8Tk9gFRyvspAgfF2wPdeF56Jt6iKfpUTwmQstkTYToF8jxMi92
	kBohMyjiW18rpr59pQMXFxAvjfCDnSY=
X-Google-Smtp-Source: 
 AGRyM1tuCgu3c1Ekk5n1j9u7qHEOwAmVbwKkb0C6C9RhXSdyHIg+s/W+ePgQWm9St3arS/6zW115fg==
X-Received: by 2002:a50:ec0c:0:b0:43c:fd26:404d with SMTP id
 g12-20020a50ec0c000000b0043cfd26404dmr3787769edr.359.1659103862535;
        Fri, 29 Jul 2022 07:11:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 fm15-20020a1709072acf00b0072b14836087sm1744227ejc.103.2022.07.29.07.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:11:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/6] selftest/bblayers: add a test for creating a layer setup
 and using it to restore the layers
Date: Fri, 29 Jul 2022 16:10:49 +0200
Message-Id: <20220729141049.835733-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729141049.835733-1-alex@linutronix.de>
References: <20220729141049.835733-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:11:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168633

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


