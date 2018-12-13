Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id B146471A36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:18 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id b7so1727498pfi.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=i9vRIZcxHLWY8cqOnMtCD3fj1ysaYPTtIvkcm2GqSac=;
	b=hmd38fcIOKbaZNI+F0h+LbyYUwGXCsUB6ecIXAN2udo8XwfFKc2epKHvr54hBfL6vF
	dSY3cisRfNkULLz+J4eeHXtGxlO+qfiJMJk1WQ+sWKPSJPyurGUSAf0UCMfkMIhKwgIn
	n3w1XyjWFfU+uymVLzH7syKnoZ7bzQ/XUBY24vwl7zc5Ga2d218c7kqK3FErh5DUOCk8
	dSDw3SruKT+YQW+D8ffZiNaN3RsmvOJqHShH+xroyFmNeqBamJb0g5sw8NOJ11rwlimB
	nVVcRcaDVUqLQ923tWeOnxX8hRm8Z8ABByDSHD5Z24tbGujiOH03BbsbZHjubEYP37it
	9EeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=i9vRIZcxHLWY8cqOnMtCD3fj1ysaYPTtIvkcm2GqSac=;
	b=r3iZLyWRYWgSSIUvyxcmcgseeH6F15ivnPkHecm+sgtcMcS3eiN6YzRdZ0czJ9kpQV
	WBZZl8oprfABfP5Ey8qU4ODDRLZGuOeKwKJQItWKaZHObkn2cqi/KlV/dD0Tx0cHbqjZ
	4YasI5m0ANTglyIbwRAzpoeUfQFaSktlnaGBG6gYLfsTT6ujse/0YJ6HPOaELv0NPRCA
	hlDqmxC0ovLOaEskI6tcQtvUd+grpqrfDKa4Q4qvY0UPiKgEMdeDAFI5gZsxe8FeYhvy
	z+3oIspJWBzcWH03PZfd5qCYBYAgLiWD3REops9mkOd8NrnxRDnsbg2ufy/lGcW9tkH3
	Rtlg==
X-Gm-Message-State: AA+aEWZV4sGOoeUc0bHVCd3tV9COp1voyEu+slJCEYlDlyapZ5gc5iRT
	YQeqg1Ze1/rqH4EiSndMrYJgbzrd
X-Google-Smtp-Source: AFSGD/UJJTty3SVzXUUHxKb/zv1CghwAPyUOScIBjVt/iDX27Oq9ZqkvZqZIYdnDoMBbxj5SBkVk2w==
X-Received: by 2002:a63:e950:: with SMTP id q16mr427636pgj.138.1544737159616; 
	Thu, 13 Dec 2018 13:39:19 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:24 -0800
Message-Id: <a26da622bff343dfc814d4db0fcbc381a3f45ef5.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 16/45] oeqa/selftest/runqemu: Improve testcase failure handling
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:18 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

assertTrue doesn't give good debug information when things fail. Update
several to use assertIn which gives information upon failure, for the
others print the log information upon failure.

(From OE-Core rev: c29cb75d5ce6b0873a934f4709b0c8824f7164d3)

(From OE-Core rev: 6f2bb2c12289422396deb793ae4b4e99cfa88c7b)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 5ebdd57..a758aaf 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -44,7 +44,8 @@ SYSLINUX_TIMEOUT = "10"
         """Test runqemu machine"""
         cmd = "%s %s" % (self.cmd_common, self.machine)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
-            self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
+            with open(qemu.qemurunnerlog) as f:
+                self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
 
     @OETestID(2002)
     def test_boot_machine_ext4(self):
@@ -52,7 +53,7 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s %s ext4" % (self.cmd_common, self.machine)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertTrue('rootfs.ext4' in f.read(), "Failed: %s" % cmd)
+                self.assertIn('rootfs.ext4', f.read(), "Failed: %s" % cmd)
 
     @OETestID(2003)
     def test_boot_machine_iso(self):
@@ -60,14 +61,16 @@ SYSLINUX_TIMEOUT = "10"
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
@@ -75,7 +78,7 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s %s wic.vmdk" % (self.cmd_common, self.recipe)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertTrue('format=vmdk' in f.read(), "Failed: %s" % cmd)
+                self.assertIn('format=vmdk', f.read(), "Failed: %s" % cmd)
 
     @OETestID(2006)
     def test_boot_recipe_image_vdi(self):
@@ -83,14 +86,16 @@ SYSLINUX_TIMEOUT = "10"
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
@@ -98,7 +103,7 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s %s hddimg" % (self.cmd_common, self.deploy_dir_image)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertTrue(re.search('file=.*.hddimg', f.read()), "Failed: %s" % cmd)
+                self.assertTrue(re.search('file=.*.hddimg', f.read()), "Failed: %s, %s" % (cmd, f.read()))
 
     @OETestID(2009)
     def test_boot_machine_slirp(self):
@@ -106,7 +111,7 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s slirp %s" % (self.cmd_common, self.machine)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertTrue(' -netdev user' in f.read(), "Failed: %s" % cmd)
+                self.assertIn(' -netdev user', f.read(), "Failed: %s" % cmd)
 
     @OETestID(2009)
     def test_boot_machine_slirp_qcow2(self):
@@ -114,7 +119,7 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s slirp wic.qcow2 %s" % (self.cmd_common, self.machine)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertTrue('format=qcow2' in f.read(), "Failed: %s" % cmd)
+                self.assertIn('format=qcow2', f.read(), "Failed: %s" % cmd)
 
     @OETestID(2010)
     def test_boot_qemu_boot(self):
@@ -125,7 +130,8 @@ SYSLINUX_TIMEOUT = "10"
             self.skipTest("%s not found" % qemuboot_conf)
         cmd = "%s %s" % (self.cmd_common, qemuboot_conf)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
-            self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
+            with open(qemu.qemurunnerlog) as f:
+                self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
 
     @OETestID(2011)
     def test_boot_rootfs(self):
@@ -136,7 +142,9 @@ SYSLINUX_TIMEOUT = "10"
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
2.7.4


