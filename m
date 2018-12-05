Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id A878A7307F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 12:33:22 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r10so19478699wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2018 04:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=r3DtdAJdmsRicGgZDnWtWx+J9VoP2T7FIKHZ2ub+PEo=;
	b=ePharl3N36PH5GHFN7i3V31EAqeWPKULIP0W/15HGxuXw/cfskmSMMXCIlvkoMH2U4
	xXisYDnmcsYo/nykt8H5Wt7rFUqJSjIGyxpdDZsMb+MdalPFHhDyUaGow+EXUGuYlz40
	oTzL6SN5Fb0hdCDSSjH2PZbbzShCh27eZsrz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=r3DtdAJdmsRicGgZDnWtWx+J9VoP2T7FIKHZ2ub+PEo=;
	b=fbDikXhUdNNzZN7afWw+tCuKSNcl918jUJWi4B59GKZ62iU8FzFj2bslWUWVuDFDsR
	goiRtcdB/9YzZvFtohwW/bjQV/6lZhMTVkBCWOORvELqXW1aya3YcZIunOB/D5oICQM/
	CRAXC8FWAOIeHUofJ02ZNHYMQOsqD8sWDDsOYpSEt5gderuf7BH928l6/qkWVhbAPfZH
	0bpy7wGKp27ra0X0ATTTocT0ySix/KLItP8l9aONVeqF60sbE0pVwPUJcw92zRlgWQM4
	93Fy+OOCkXROsB1IBOi4T+OJz850KoGxycv2a/yvon3OI5qSWqAoLLH7MfWx6rBAPOiw
	u4og==
X-Gm-Message-State: AA+aEWYq8W7yclYPKWnzKDr0lthL2gYLMFpwBnpfusbeK+XQp1/DwiCe
	ZGe0baXXDm/xGPkHYid3hyuyMxu9Azw=
X-Google-Smtp-Source: AFSGD/VWJgAIGC6GIsM5ULUEEhn2R6j7qPHgIGWka+EmpufcOWGltX6b1kzqckmo/0KPcItCBc+9CQ==
X-Received: by 2002:adf:91a3:: with SMTP id 32mr19626941wri.99.1544013202779; 
	Wed, 05 Dec 2018 04:33:22 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r77sm18048674wmd.22.2018.12.05.04.33.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Dec 2018 04:33:22 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2018 12:33:18 +0000
Message-Id: <20181205123319.10452-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181205123319.10452-1-richard.purdie@linuxfoundation.org>
References: <20181205123319.10452-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/3] oeqa/selftest/runqemu: Improve testcase failure handling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2018 12:33:22 -0000
Content-Transfer-Encoding: 8bit

assertTrue doesn't give good debug information when things fail. Update
several to use assertIn which gives information upon failure, for the
others print the log information upon failure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 32 +++++++++++++++----------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index edc2e424e6e..4e35bb97e3a 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -42,7 +42,8 @@ SYSLINUX_TIMEOUT = "10"
         """Test runqemu machine"""
         cmd = "%s %s" % (self.cmd_common, self.machine)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
-            self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
+            with open(qemu.qemurunnerlog) as f:
+                self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
 
     @OETestID(2002)
     def test_boot_machine_ext4(self):
@@ -50,7 +51,7 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s %s ext4" % (self.cmd_common, self.machine)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertTrue('rootfs.ext4' in f.read(), "Failed: %s" % cmd)
+                self.assertIn('rootfs.ext4', f.read(), "Failed: %s" % cmd)
 
     @OETestID(2003)
     def test_boot_machine_iso(self):
@@ -58,14 +59,16 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s %s iso" % (self.cmd_common, self.machine)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertTrue('media=cdrom' in f.read(), "Failed: %s" % cmd)
+                self.assertIn('media=cdrom', f.read(), "Failed: %s" % cmd)
 
     @OETestID(2004)
     def test_boot_recipe_image(self):
         """Test runqemu recipe-image"""
         cmd = "%s %s" % (self.cmd_common, self.recipe)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
-            self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
+            with open(qemu.qemurunnerlog) as f:
+                self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
+
 
     @OETestID(2005)
     def test_boot_recipe_image_vmdk(self):
@@ -73,7 +76,7 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s %s wic.vmdk" % (self.cmd_common, self.recipe)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertTrue('format=vmdk' in f.read(), "Failed: %s" % cmd)
+                self.assertIn('format=vmdk', f.read(), "Failed: %s" % cmd)
 
     @OETestID(2006)
     def test_boot_recipe_image_vdi(self):
@@ -81,14 +84,16 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s %s wic.vdi" % (self.cmd_common, self.recipe)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertTrue('format=vdi' in f.read(), "Failed: %s" % cmd)
+                self.assertIn('format=vdi', f.read(), "Failed: %s" % cmd)
 
     @OETestID(2007)
     def test_boot_deploy(self):
         """Test runqemu deploy_dir_image"""
         cmd = "%s %s" % (self.cmd_common, self.deploy_dir_image)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
-            self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
+            with open(qemu.qemurunnerlog) as f:
+                self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
+
 
     @OETestID(2008)
     def test_boot_deploy_hddimg(self):
@@ -96,7 +101,7 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s %s hddimg" % (self.cmd_common, self.deploy_dir_image)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertTrue(re.search('file=.*.hddimg', f.read()), "Failed: %s" % cmd)
+                self.assertTrue(re.search('file=.*.hddimg', f.read()), "Failed: %s, %s" % (cmd, f.read()))
 
     @OETestID(2009)
     def test_boot_machine_slirp(self):
@@ -104,7 +109,7 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s slirp %s" % (self.cmd_common, self.machine)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertTrue(' -netdev user' in f.read(), "Failed: %s" % cmd)
+                self.assertIn(' -netdev user', f.read(), "Failed: %s" % cmd)
 
     @OETestID(2009)
     def test_boot_machine_slirp_qcow2(self):
@@ -112,7 +117,7 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s slirp wic.qcow2 %s" % (self.cmd_common, self.machine)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertTrue('format=qcow2' in f.read(), "Failed: %s" % cmd)
+                self.assertIn('format=qcow2', f.read(), "Failed: %s" % cmd)
 
     @OETestID(2010)
     def test_boot_qemu_boot(self):
@@ -123,7 +128,8 @@ SYSLINUX_TIMEOUT = "10"
             self.skipTest("%s not found" % qemuboot_conf)
         cmd = "%s %s" % (self.cmd_common, qemuboot_conf)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
-            self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
+            with open(qemu.qemurunnerlog) as f:
+                self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
 
     @OETestID(2011)
     def test_boot_rootfs(self):
@@ -134,7 +140,9 @@ SYSLINUX_TIMEOUT = "10"
             self.skipTest("%s not found" % rootfs)
         cmd = "%s %s" % (self.cmd_common, rootfs)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
-            self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
+            with open(qemu.qemurunnerlog) as f:
+                self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
+
 
 # This test was designed as a separate class to test that shutdown
 # command will shutdown qemu as expected on each qemu architecture
-- 
2.19.1


