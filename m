Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA259C87FD5
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 08:27:28 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.56903.1753950444691824574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 01:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=k5gMf34G;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-455b00339c8so1134005e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 01:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753950443; x=1754555243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2L4vWGSA29NlOV7m5A9foDo+jjLHx7PlDN4jNYyt4aU=;
        b=k5gMf34G9HRXIaOnGDuO+r08YIisFbko2s7QfxhBUFe7BgedzKzGH2+yDpl6OUmsC9
         YqnICbWVzJ/I5A2VVajkhh1lXwcHxSFLFk09U8c33UzS+Pk2LfWo1yFw2dAVhNw8L9xx
         gdXGvoLB2CroFzYCLlKTmMEMCtYpLNhfwONA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753950443; x=1754555243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2L4vWGSA29NlOV7m5A9foDo+jjLHx7PlDN4jNYyt4aU=;
        b=pYDzepRQUn65ug0C4AqF0lMlOIjQzw1NvW69djUJY7nbO7pGI3qTR9hzKGEfvCbgwD
         gRMjaNbtvMB/v+RMG55kUagyeyMXdYy63mUD+3FNRiK7xcCK/wK+IdQ9pKDCVqXAbIGg
         c0EVufdL1bFsMLf786m9uYdcXINv8xJBnghrOaqb0rnb78gsxP+rz66XNA7qQqwBPNug
         zX5pIh/3zYvX879Z2Q2T4id7SdnhtwIh9bu3n2gMo0XVgJkvLufGXVK8C0Opcrd3jLO7
         EWam8JTQqrgqdeo/pjuo2y0XmZJayOJivVoNNRD4ly/a1oF1xp9af0kyu+nsgWsklyfe
         Oz2Q==
X-Gm-Message-State: AOJu0Yz2YFk5WHoDN64mfloUmhmaVhsAv62/FUlqx35vVjZDBy7OnNZq
	2ZDu+NjakybU42SNc0yXTv0X9Dpg/5oBPmB5YNf10uIqySUXsNCd8nWuw/jS3G/NnZc6GUstwAu
	Xo7CBDM9yzqbm
X-Gm-Gg: ASbGnctPXLu7IFV1XQCMcPN5IrmJAA972idiwAZ3UxwmdjUqY3h/8CGFWg9mk+344dn
	9cuYCynw7LOdyxVwOmW44fQyDsO/xmPpaZrouzZqRTnsIo0L+SLFHjEod76jrpHtcSciHW6+8hU
	k5B06Qw1iNlXt8EwcPVOt00f6SnmynPVLRsFS8TlaIPWJB8FG26Un4MYNxFEDCiC+2K7S7QxCdk
	qso/8prlknGTNlGOw+WkN6zHzSgPR7FvzOBHXOpyPjSh6ecnkm3RYx2fhD/iwCtfUFVFTThd7kv
	CYqMjUan5JMh2TTd0kjWeQ9Qng/Mwboh7LEXL2WK9lMdwmDwvvHnsZN8cPjzCuL1HYEUYqzd2x5
	LcRmLgVtSJliDmgUExYIrmf4f4li96cNjAbyGHbkhth42UD1DAAZN4Cgu04Fw1vxQg1ve5Cp20W
	NWXNcjbPT8wf2II1DUKsCeV+06J2CKgCt3UKA=
X-Google-Smtp-Source: AGHT+IEFopsO71ML6m2s+HMv+nwWexv/UU/cOlqLJqWeSm19DANlzPe66b4A1v/7Bk6BwRrxIteiGw==
X-Received: by 2002:a05:600c:3e0e:b0:455:f187:6203 with SMTP id 5b1f17b1804b1-458953e9f5bmr46621265e9.27.1753950442735;
        Thu, 31 Jul 2025 01:27:22 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47908esm1562672f8f.59.2025.07.31.01.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 01:27:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v3 2/4] selftest: runqemu: add tests for booting zst compressed image
Date: Thu, 31 Jul 2025 10:27:05 +0200
Message-Id: <20250731082707.3481718-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250731082707.3481718-1-yoann.congal@smile.fr>
References: <20250731082707.3481718-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 08:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221177

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

