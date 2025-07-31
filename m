Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35B7C87FD3
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 15:33:31 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.65325.1753976005261840880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 08:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PJgg4GJB;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3a54700a46eso685523f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753976003; x=1754580803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23/M0QmVpK1MxrRaY0iayZd0cU5Pjz9gebUBm6QFtA8=;
        b=PJgg4GJBVlqOD1vZZeytGU9C2qZ8pZtCSn0fyWBWkgprf8s4KFkSeMNrPdYkp7/9YC
         K8BmssO/gDpttfHNKvOZ70khBz6Ee3hOhCmC3IYOcNs5EG4K4u8LBQUVBBH/erovhzUn
         Y9wwOOo058uGswvnIZSG50o/FbQx2JJPo9Rzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753976003; x=1754580803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23/M0QmVpK1MxrRaY0iayZd0cU5Pjz9gebUBm6QFtA8=;
        b=a6VX7DZtTV4gA2hHitvPwCmEc0dlGn+XB1bYWK/lxPsPvdkqtyRH1mRXsk2F4OJCTr
         ITGCtWy+LK7/llm30kpNatMo8fENabKPbp8OTJZHCx71bVhIk1A3jWByyMHA4XbtYauA
         gKV5u04TwEETrsdVL2PXw7NpsgwEY/YUhYcVGJZH6qj1YGNy+42QQbOrr0+iYFpvxrJm
         t06QVeggrxIT0FczrIXO6CXxuc87EHxp93GSCOFP8/7qirmOKAHu3Q25FVS6PFXo8ZCB
         m2uwo24pS5zVT1u1On2QCuFvCm7T6CPKHIPiFHSomsJqnfSkKAin4PuDNkDG/7EMVGcA
         z8Dw==
X-Gm-Message-State: AOJu0Yx1U+rIpCP/npaGziD0ac52BFep4GXVkawbuLwjuHI7L/osqdTN
	tvhM8cdJ/Jqefom7hfg+PzIVIdwGlsiwrGA4DwBHQIs73f6d5enNadm2TtvxnFXsaXs/s7KG3Zu
	4ItaOLTncd1QM
X-Gm-Gg: ASbGncvfkvo+dC5zYee4qtOSgp5ZrY1pVbV8n6F+NvYvESrGFtyAeyfbiwiHQsN4ELZ
	2F/P9A3fam/wEManrsKwIFx2ffzmErk6mgbOHmw2UaZ0uUTXJcjrTZ85eQBPJeJLhPxoCd5E2eo
	l92d6WJn54UjPAP81lS5loEhn96wFCEzHRp2KNpdBb821DIqgVlAs3VXpOacz5bDaIIA/UpAGe5
	nYRGNIs5C+8old/UXajrlFTNc10muhUAmNYAOvbfT5Gdaf1/rj3QWDMl3GesgMxEZBQWrDqskkr
	jB9HcoKXwwR63dOlpdyQF7zC3eAdGdd8mkFvhDHK2zDZZOstm4LabU2PQCeoriPdtlQ6qU23pij
	FsG+UEURtF5OJfm3KW3glyAbCZtYpHIJhYKRgyjk7Y1HRvIwzjbBTzT9+1EIelC9zCEIXwNd7uE
	4z7e/Kh97uG+HwnCF/Nc+fGvJCYQP3iksR1I4=
X-Google-Smtp-Source: AGHT+IEzOZOQVizfo9q2rwe1/ZRuTYp+iakcWDo7JfV7RCxumnIWB9Ys+iCLhBj15zni+IVMB2CzwA==
X-Received: by 2002:adf:a316:0:b0:3b7:96c0:4172 with SMTP id ffacd0b85a97d-3b796c04259mr3852958f8f.11.1753976003253;
        Thu, 31 Jul 2025 08:33:23 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c475067sm2703727f8f.58.2025.07.31.08.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 08:33:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v5 2/4] selftest: runqemu: add tests for booting zst compressed image
Date: Thu, 31 Jul 2025 17:33:11 +0200
Message-Id: <20250731153313.3693397-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250731153313.3693397-1-yoann.congal@smile.fr>
References: <20250731153313.3693397-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 15:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221199

From: Yoann Congal <yoann.congal@smile.fr>

Add a simple tests booting a compressed image given to runqemu as path
and as image recipe name.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v5: make wic.zst tests qemux86-64 only (current setup is to build wic*
images on this machine only)
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index f01e1eec66..bedcf97548 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -31,7 +31,7 @@ class RunqemuTests(OESelftestTestCase):
         if self.td["HOST_ARCH"] in ('i586', 'i686', 'x86_64'):
             self.fstypes += " iso hddimg"
         if self.machine == "qemux86-64":
-            self.fstypes += " wic.vmdk wic.qcow2 wic.vdi"
+            self.fstypes += " wic.vmdk wic.qcow2 wic.vdi wic.zst"
 
         self.cmd_common = "runqemu nographic"
         kvm = oe.types.qemu_use_kvm(get_bb_var('QEMU_USE_KVM'), self.td["TARGET_ARCH"])
@@ -152,6 +152,25 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
 
+    @skipIfNotMachine("qemux86-64", "wic tests are qemux86-64 specific currently")
+    def test_boot_compressed_wic_by_path(self):
+        """Test runqemu /path/to/rootfs.wic.zst"""
+        rootfs = "%s.wic.zst" % (self.image_link_name)
+        rootfs = os.path.join(self.deploy_dir_image, rootfs)
+        if not os.path.exists(rootfs):
+            self.skipTest("%s not found" % rootfs)
+        cmd = "%s %s snapshot" % (self.cmd_common, rootfs)
+        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
+            with open(qemu.qemurunnerlog) as f:
+                self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
+
+    @skipIfNotMachine("qemux86-64", "wic tests are qemux86-64 specific currently")
+    def test_boot_compressed_wic_by_recipe(self):
+        """Test runqemu recipe-image wic.zst"""
+        cmd = "%s %s snapshot wic.zst" % (self.cmd_common, self.recipe)
+        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
+            with open(qemu.qemurunnerlog) as f:
+                self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
 
 # This test was designed as a separate class to test that shutdown
 # command will shutdown qemu as expected on each qemu architecture

