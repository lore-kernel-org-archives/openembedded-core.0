Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA364C87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 10:23:19 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.58640.1753957393874513409
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 03:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yphn5ttg;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4589b3e3820so7136535e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 03:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753957392; x=1754562192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2L4vWGSA29NlOV7m5A9foDo+jjLHx7PlDN4jNYyt4aU=;
        b=yphn5ttgyAC/U9dfGc3eyQqMzwo3LESEAGQnbG9Yl5BJgRvfP0Jxs9G8kW01OCP7Ul
         tUA+oiyEBmXI7JX2SlslLS/kenQHxlSz/T82i+5N5iRKneQnlNi7UiCKYkoGbOmAu+Gp
         OwgrirQW8z4+LFaq2eF+NT0C4kq0Jbc6OEeKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753957392; x=1754562192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2L4vWGSA29NlOV7m5A9foDo+jjLHx7PlDN4jNYyt4aU=;
        b=mn8qmy9ezuw+h1X1Q0rR7q0fXGstR2Qbn5BK60FSTSgCyOJiAhRtQnnqiA9fwooem5
         JuQXigjtU+LNMl9Bk8N2rKv5cBH4DCIv8qhohxjN6hAbrGGKoPZTedIwC+c/1LNncSiZ
         xEdTPYz5seBMqjZMvmp/5rSEoPHTobLzsvj9zzKdCcKZpI9u/4kddr9S4VzD0nUL5bHt
         cFphUv0HUkS2OqwrZLwpshdJ6j7xVipCqamcyBILtzdZgZ8Af9LOT+kkf1sBgimYR+4E
         Sy9Ld8JpZtVqU4Tw0tXvdlICcKhoX9CEZ9D7VbEpW4UHupe+V9j2DJZoNxLrKmjNOcwz
         9BGg==
X-Gm-Message-State: AOJu0YwhlYhgAUXJ5dufjfOq9pbPp5h0Bp5gqHFhA9lsUJeiHjy2nBa0
	ykBP/aWena5hJ928h0ktaWPrAxMel86mE7PbsO2TmeTc8c5tYaQgO3QA+79i7jGDnCLZkV5n0fm
	R3prjU+q2tmeC
X-Gm-Gg: ASbGnct0demBpvEem9TWmVuFrIXOQ855DNCEtjLXoQPyVjWdlxUKZNdwqemTmCktfWZ
	BiWEcVc6z26gAtVyJHewXpbwN2+rY1UdgalzUeUpbSNBWw1gEI0f6R/2zJumNUWo8+gAAhAdgLZ
	UmcB3gkeRa5aY4xq3eipFwaS33Z3iZQDGhDBC4DsJA7RrG0OlaAHhItohzjLWKc+qXl8Ek3IJ8A
	EFA3pYhezOTddpYJLTyxGezvgZ8gy7/eBXEVLMkzm2qL7ztJrklpi6AHHCRPnQHAXS3LS8fBO6X
	ZR2m2IGeW1vGxnkeT/X32A6J53iqqn2eE6WQxMOEJ8JT5ZyQ2EZkM8VTzLiRQlRJlwIC6sXvxOg
	hkTQiZqKpNfbnTuVygc5YRAtf9ftQTotgm2iC1lJWZSGreNftmWJkeopsdhnqtkPk1YPlOeMjVe
	3QPWLsKrH35uFYukwYB9vwaggJI+O17Qwoync=
X-Google-Smtp-Source: AGHT+IFjLWyRQlSC4I14yjLxiut7Zwl9LuIMi/ds0rc1J7875e0XqCu296721+v6l80LtQs3ENCWxA==
X-Received: by 2002:a05:600c:8b71:b0:456:161c:3d61 with SMTP id 5b1f17b1804b1-458a4f945camr10418235e9.22.1753957391959;
        Thu, 31 Jul 2025 03:23:11 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589536abb1sm65169445e9.4.2025.07.31.03.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 03:23:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v4 2/4] selftest: runqemu: add tests for booting zst compressed image
Date: Thu, 31 Jul 2025 12:23:01 +0200
Message-Id: <20250731102303.3513121-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250731102303.3513121-1-yoann.congal@smile.fr>
References: <20250731102303.3513121-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 10:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221186

From: Yoann Congal <yoann.congal@smile.fr>

Add a simple tests booting a compressed image given to runqemu as path
and as image recipe name.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index f01e1eec66..46ca0b4480 100644
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
@@ -152,6 +152,23 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
 
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
+    def test_boot_compressed_wic_by_recipe(self):
+        """Test runqemu recipe-image wic.zst"""
+        cmd = "%s %s snapshot wic.zst" % (self.cmd_common, self.recipe)
+        with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
+            with open(qemu.qemurunnerlog) as f:
+                self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
 
 # This test was designed as a separate class to test that shutdown
 # command will shutdown qemu as expected on each qemu architecture

