Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62407C77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 13:50:19 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.8628.1750773016240468087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 06:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jcj0S98F;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45377776935so19935625e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 06:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773014; x=1751377814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u5+IPIVtpnOoWvhBKr4x6f1LKrs0sIyIdBqqfovmi8E=;
        b=Jcj0S98F+7gImhR3BJRcSkPfL+WShlX+a848AaMohrPvSOPIkb05mFZWLjpiUv8L6+
         gWIGBmLsOSIHTtpmJgapf0Laja8ilrUlnE3whN4jF51eARIZVyNAzUfIaAnfsZZBssX7
         sDim4Xu1IFkDsKm/90agDMfe2E5r1FbkpR2y8P2rAbsebnQgSRhUnv90s9hZulNPZZbV
         rLGorevZ5E1cS6HOdBdSOxeWOIPXEPd6sfS4JXtNssoBwrkzKwJSmpJ5TEkRy/7avZE6
         woaGpiHdQlcbzGVLekFEOvyrEkXgSz6AatQ42JKG5lf6AgM23hQdDbD7IWZdAlxoHppv
         9SRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773014; x=1751377814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5+IPIVtpnOoWvhBKr4x6f1LKrs0sIyIdBqqfovmi8E=;
        b=PtXD7yrnhn/nGB/Ohb8cSRkC845bAu9mfiem/3R/6l1sYqkcA0xF9he7zKSAW5IjMa
         P+ZIJcAe89X+Z7L52wYpHe7vZ6uhuUMDmXutu27aXM1rPc1BURT5BawzaOmWsqBZv2wH
         4w3g23DKovnpnzLtN1Du6WuUI1w+H3mVrbSUJA5iOqH0HaOaJOVHIUO40T2FLAVY/d9r
         0ZYuxG55uXxZLTO9ofxAO1FJIsRuF/Vq3WMI04LzWbwRiyOfPg88rOFSCcXwk9nl6oZe
         RcFBJXApBdMA5nBHIKdZa/p9xOF07SiW0i96gom8YhdZxUgFD8yd0ACRDkMV8BCOEhwF
         +o8g==
X-Gm-Message-State: AOJu0YwvWArzXScL2Qc9wnC4dkQ+f2Em54FP4DW1UYEZUaRedaxNYlN0
	jryZEPP06zjY7kfX3Xo9vJExDcgrI3r/cNzZbgGZRheJqQRmi43yc5gCjiKyww==
X-Gm-Gg: ASbGncuCEcbY1x2zPZsO6U2bYCWkO7Ci9ErkBJ6jVAgJOorccPb3K7iia6ondQvIaeg
	ptEOt3EQoyDUkcbGMa5HtwTttYzKzvZZn/ERT0+TMLh7mrRIsrumvwBWjXqBT59vmmIO+jBZQkB
	ytmb+x0brTiec4Lyo3cyaHuSsitSjJYFiJKD09B9EeuD3Ntka0w0VkqFBsXidvhQg6uAOn5jN0t
	AQo0w/TnDPgJgDJXO2l4Zz3Eq02yXMtSqvdp8pFf1mnrgl8hJEGXsjuJJ4Yl7EVRMfIi+4NaHc8
	WR7XJHVDL1tENwNVCXoyyMlhaxA7GbVUWBJTdMSlIxFXQheJ8Y6ELId5CKBD7IA6EcgjPSM3x4u
	A9KMiHQ/AaWSanwi1CAH5vjk=
X-Google-Smtp-Source: AGHT+IF2XhryqeJ0iT1zaGMfueArPQYXODMtIUvBHVY0CMGiwCHeQDkWx7TXYi3dWNda2xczRL1WLg==
X-Received: by 2002:a05:600c:1c11:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-453659dc8f2mr142478795e9.22.1750773014227;
        Tue, 24 Jun 2025 06:50:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb5ecsm147371865e9.8.2025.06.24.06.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:50:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] meta/lib/oeqa/selftest/cases/pokybleeding.py: move from meta-yocto
Date: Tue, 24 Jun 2025 15:50:05 +0200
Message-Id: <20250624135005.539199-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 13:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219269

Content of meta/ is maintained in oe-core, and so the file belongs
here.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/pokybleeding.py | 32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/pokybleeding.py

diff --git a/meta/lib/oeqa/selftest/cases/pokybleeding.py b/meta/lib/oeqa/selftest/cases/pokybleeding.py
new file mode 100644
index 0000000000..d0940d680d
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/pokybleeding.py
@@ -0,0 +1,32 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.utils.commands import bitbake, get_bb_var
+from oeqa.selftest.case import OESelftestTestCase
+
+class PokyBleeding(OESelftestTestCase):
+
+    def test_poky_bleeding_autorev(self):
+        """
+        Test that poky-bleeding.bbclass sets SRCREV to "AUTOINC" for recipe
+        with a single scm in SRC_URI and for recipe with two scm's in SRC_URI.
+        """
+
+        self.assertNotEqual( get_bb_var('SRCREV', 'pseudo'), "AUTOINC")
+
+        self.assertNotEqual( get_bb_var('SRCREV', 'hello-rs'), "AUTOINC")
+        self.assertNotEqual( get_bb_var('SRCREV_hello-lib', 'hello-rs'), "AUTOINC")
+        
+        features = '''
+INHERIT += "poky-bleeding"
+POKY_AUTOREV_RECIPES = "hello-rs pseudo"
+'''
+        self.write_config(features)
+
+        self.assertEqual( get_bb_var('SRCREV', 'pseudo'), "AUTOINC")
+
+        self.assertEqual( get_bb_var('SRCREV', 'hello-rs'), "AUTOINC")
+        self.assertEqual( get_bb_var('SRCREV_hello-lib', 'hello-rs'), "AUTOINC")
-- 
2.39.5


