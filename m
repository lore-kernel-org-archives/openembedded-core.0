Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8790C73041
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 12:44:48 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id a6so19675727lfa.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 05:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=H1YoJLt91uTvE5hwK23qgavjxYSskJZX2n/TqiP/P1s=;
	b=VK+bVQPnizupHLYmROiDZuv9poXBdGKoX9JcpFEzOYGg1pUKO0jHWUk9kYnxNwcIRj
	bLuuhsBHCjVVeWy9266/YuexETTaEJHYTe3gGWRs/m5go0EodTCmhlR32Xp6wa/WVQdH
	YvWG+rxp+r+lhI6FmbSXNnLd5HDVyR+AeFwV61ivvF8E+/c4CEURvieiKJWfrVX+kTua
	RZVEmlBKArwGn5Xx1ROCpcZlxuTfOUM1Q005B3H3eg7FfeeuxRG/N9gjWdHA28FL/Ifc
	nnO7If6iP3Rs0Zkwbhb6O2E59HODHgh1Ub+/IqARN585n5vRWHjW8LYtIRiiSQ2axR2T
	vsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=H1YoJLt91uTvE5hwK23qgavjxYSskJZX2n/TqiP/P1s=;
	b=hOkX727VbcTDnqBtl1/3wOwpw5y7Bq8a5hZWP1XAL0qLcTYSQdHPPI9r+L2s0asX23
	eKSjsjz67wVzm6XEm8QAQQfiwvMaRXvS0QM0lhCxSb+hsVg+OuAcjUXVkwLJE/3emnte
	39iA3FGxbkYhiPt2dwXrJNn83UM9rO23yhECmxpTXp/f4YLYZChYLQoYH6H30Hoj8O7k
	CDKNNxvoR9e/BwZjJI7R6RKl/k2W0EHeAUVNpiya1U0WjvkuGBH1OJBJz7tNoKIOjelz
	bTioGozL/pL2srhHVEdbjGUcfgpa9CHfixfftI8EXc4eviWQDcNOtZ1ok0NpTzVKy4GA
	sQvA==
X-Gm-Message-State: AFeK/H1HR5/j6+z+LOS6atcyf7nYi0QfYVvN/G+9bC8gwvTTPOYjj/Hj9t6fu0E6EQl+Jw==
X-Received: by 10.25.158.130 with SMTP id h124mr2701757lfe.172.1489668289289; 
	Thu, 16 Mar 2017 05:44:49 -0700 (PDT)
Received: from localhost.localdomain (staticline-31-182-60-238.toya.net.pl.
	[31.182.60.238])
	by smtp.gmail.com with ESMTPSA id n20sm893148lfb.53.2017.03.16.05.44.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Mar 2017 05:44:48 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 13:44:34 +0100
Message-Id: <7af8df96d2290dcd428cd4aefe862d0c88b42560.1489668133.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1489668133.git.maciej.borzecki@rndity.com>
References: <cover.1489668133.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1489668133.git.maciej.borzecki@rndity.com>
References: <cover.1489668133.git.maciej.borzecki@rndity.com>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v3 3/5] wic: selftest: avoid COMPATIBLE_HOST issues
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
X-List-Received-Date: Thu, 16 Mar 2017 12:44:49 -0000

Wic tests will unconditionally attempt to build images that may require
dependencies that are incompatible with current target.

Resolve this by consulting HOST_ARCH first (which defaults to TARGET_ARCH)
before proceeding to build images that may be incompatible.

A convenience decorator onlyForArch() can be used to skip test cases for
specific architectures.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 0fdd0e65eb4e5d6a2dc72c38a9597c187d82575c..1cf26ce44411362873b5fa0b57da9f5a77613134 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -24,15 +24,38 @@
 """Test cases for wic."""
 
 import os
+import unittest
 
 from glob import glob
 from shutil import rmtree
+from functools import wraps, lru_cache
 
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu
 from oeqa.utils.decorators import testcase
 
 
+@lru_cache(maxsize=32)
+def get_host_arch(target='core-image-minimal'):
+    return get_bb_var('HOST_ARCH', target)
+
+
+class onlyForArch(object):
+
+    def __init__(self, *args):
+        self.archs = args
+
+    def __call__(self,f):
+        @wraps(f)
+        def wrapped_f(*args, **kwargs):
+            arch = get_host_arch()
+            if self.archs and arch not in self.archs :
+                raise unittest.SkipTest("Testcase arch dependency not met: %s" % arch)
+            return f(*args, **kwargs)
+        wrapped_f.__name__ = f.__name__
+        return wrapped_f
+
+
 class Wic(oeSelfTest):
     """Wic test class."""
 
@@ -42,13 +65,13 @@ class Wic(oeSelfTest):
 
     def setUpLocal(self):
         """This code is executed before each test method."""
-        self.write_config('MACHINE_FEATURES_append = " efi"\n')
 
         # Do this here instead of in setUpClass as the base setUp does some
         # clean up which can result in the native tools built earlier in
         # setUpClass being unavailable.
         if not Wic.image_is_ready:
             bitbake('wic-tools')
+
             bitbake('core-image-minimal')
             Wic.image_is_ready = True
 
@@ -141,6 +164,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @testcase(1157)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID boot"""
         cmd = "wic create directdisk-gpt --image-name core-image-minimal -o %s" % self.resultdir
@@ -148,6 +172,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1346)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
         config = 'INITRAMFS_IMAGE = "core-image-minimal-initramfs"\n'\
@@ -161,6 +186,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
 
     @testcase(1348)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_qemux86_directdisk(self):
         """Test creation of qemux-86-directdisk image"""
         cmd = "wic create qemux86-directdisk -e core-image-minimal -o %s" % self.resultdir
@@ -168,6 +194,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "qemux86-directdisk-*direct")))
 
     @testcase(1350)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
         cmd = "wic create mkefidisk -e core-image-minimal -o %s" % self.resultdir
@@ -175,6 +202,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "mkefidisk-*direct")))
 
     @testcase(1385)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_directdisk_bootloader_config(self):
         """Test creation of directdisk-bootloader-config image"""
         cmd = "wic create directdisk-bootloader-config -e core-image-minimal -o %s" % self.resultdir
@@ -182,6 +210,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-bootloader-config-*direct")))
 
     @testcase(1560)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_systemd_bootdisk(self):
         """Test creation of systemd-bootdisk image"""
         config = 'MACHINE_FEATURES_append = " efi"\n'
@@ -201,6 +230,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
 
     @testcase(1562)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_default_output_dir(self):
         """Test default output location"""
         for fname in glob("directdisk-*.direct"):
@@ -210,6 +240,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob("directdisk-*.direct")))
 
     @testcase(1212)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
         bb_vars = get_bb_vars(['STAGING_DATADIR', 'RECIPE_SYSROOT_NATIVE'],
@@ -307,6 +338,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @testcase(1268)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
         status = runCmd("wic create directdisk-multi-rootfs "
@@ -318,6 +350,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-multi-rootfs*.direct")))
 
     @testcase(1269)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
         bb_vars = get_bb_vars(['STAGING_DATADIR', 'RECIPE_SYSROOT_NATIVE'],
@@ -531,6 +564,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
 
     @testcase(1351)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_wic_image_type(self):
         """Test building wic images by bitbake"""
         config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "wic-image-minimal"\n'\
@@ -551,6 +585,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             self.assertTrue(os.path.isfile(os.path.realpath(path)))
 
     @testcase(1422)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_qemu(self):
         """Test wic-image-minimal under qemu"""
         config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "wic-image-minimal"\n'\
@@ -565,6 +600,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
 
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_qemu_efi(self):
         """Test core-image-minimal efi image under qemu"""
         config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "mkefidisk.wks"\n'
-- 
2.9.3


