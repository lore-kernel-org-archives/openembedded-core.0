Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 110BF71A8C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:47:21 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id t79so10013891wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=hxOGpxmlc32MSm8Z3SSXqL1NyPbjF1HeTbgO1mslNt0=;
	b=qsNA91xTsZbzGsFXbToe6kRX87THAqORvnjnNwAT7VNOP0kcacL1T9YzqPQTigRgz2
	ovzaA0y+Lym7JaMrHdCVQ/RJLYsNeOxHL7mpd8hYC2KLulfjUBEllQziv4+vqoteVkT+
	vjoLAYKi++U941keV76vwKv8eXVzvDlujYimKcvt+YxewhIW2zpl4EqTOj8ZbHzR7Zh1
	SzQ++z+UwLXVfTmwJpCHA7JvaRSKlaRNRMi48n6bSZNKkBfmMlDc/foG4CcFqiJ/5rvA
	59i37eD0zT/wv//3MBTv9xYJMsC4qHemZDfVa/estzGbCDjKJNBP6PZ7Re5SqusvstFl
	63/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=hxOGpxmlc32MSm8Z3SSXqL1NyPbjF1HeTbgO1mslNt0=;
	b=ld7qCRKebX52cu/iYuu+j1hnm3HEIkOcMBsVxG51LTTHF4R2wGK3jll0L7FHyxSI9Z
	sfNWAkyHPtdY62hzjD1QR2uKoGVWwJ7scPkfH9fZ0UzSR1EOrLVyo0S3Dlin13BL9j3S
	d0u602cMKNMsonq2C/zSOrC/84c/BATu7i7jXjoEpKEMEK2m9nbzVRpECUzh303YMLsb
	RdIQyjM+SfSxZKvj5j48Cvjwpf9MPk1auFZJ9xRPaqxE+RaNS8heB3KJvR6ZlaQL/kko
	HMuctPattmKmrbc2t/BJ75aGv8WgWZUIhiwao1qCktExNuQ8+IoFHbMo0oAGbzsW4b8B
	ajCg==
X-Gm-Message-State: AKaTC01r4Wq0Aw9GN+jnM+DC6a5quUOHCiEzaDL8efhMC3a6hyMwuc32po+IWdlP3UjX1g==
X-Received: by 10.46.76.10 with SMTP id z10mr554807lja.48.1479887242930;
	Tue, 22 Nov 2016 23:47:22 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	f25sm6988635lji.47.2016.11.22.23.47.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 23:47:21 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2016 08:46:30 +0100
Message-Id: <29db9138069a225017d2f688272fbbe46be306ae.1479887010.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479887010.git.maciej.borzecki@rndity.com>
References: <cover.1479887010.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1479887010.git.maciej.borzecki@rndity.com>
References: <cover.1479887010.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v4 4/7] wic: selftest: avoid COMPATIBLE_HOST issues
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
X-List-Received-Date: Wed, 23 Nov 2016 07:47:23 -0000

wic tests will unconditionally attempt to build syslinux and add
configuration options that may not be compatible with current machine.

Resolve this by consulting HOST_ARCH (which defaults to TARGET_ARCH) and build
recipes, add configuration options or skip tests conditionally.

A convenience decorator onlyForArch() can be used to skip test cases for
specific architectures.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 51 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index faac11e21643e4c32a83b649b6ae986fead498f1..2db14445956bc5adcf1e755844bbdb69edcb468f 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -24,15 +24,33 @@
 """Test cases for wic."""
 
 import os
+import unittest
 
 from glob import glob
 from shutil import rmtree
+from functools import wraps
 
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 from oeqa.utils.decorators import testcase
 
 
+class onlyForArch(object):
+
+    def __init__(self, *args):
+        self.archs = args
+
+    def __call__(self,f):
+        @wraps(f)
+        def wrapped_f(*args, **kwargs):
+            arch = get_bb_var('HOST_ARCH', 'core-image-minimal')
+            if self.archs and arch not in self.archs :
+                raise unittest.SkipTest("Testcase arch dependency not met: %s" % arch)
+            return f(*args, **kwargs)
+        wrapped_f.__name__ = f.__name__
+        return wrapped_f
+
+
 class Wic(oeSelfTest):
     """Wic test class."""
 
@@ -41,15 +59,22 @@ class Wic(oeSelfTest):
 
     def setUpLocal(self):
         """This code is executed before each test method."""
-        self.write_config('IMAGE_FSTYPES += " hddimg"\n'
-                          'MACHINE_FEATURES_append = " efi"\n')
+        arch = get_bb_var('HOST_ARCH', 'core-image-minimal')
+        is_x86 = arch in ['i586', 'i686', 'x86_64']
+        if is_x86:
+            self.write_config('IMAGE_FSTYPES += " hddimg"\n' \
+                              'MACHINE_FEATURES_append = " efi"\n')
 
         # Do this here instead of in setUpClass as the base setUp does some
         # clean up which can result in the native tools built earlier in
         # setUpClass being unavailable.
         if not Wic.image_is_ready:
-            bitbake('syslinux syslinux-native parted-native gptfdisk-native '
-                    'dosfstools-native mtools-native bmap-tools-native')
+            tools = 'parted-native gptfdisk-native ' \
+                    'dosfstools-native mtools-native bmap-tools-native'
+            if is_x86:
+                tools += ' syslinux syslinux-native'
+            bitbake(tools)
+
             bitbake('core-image-minimal')
             Wic.image_is_ready = True
 
@@ -71,6 +96,7 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd('wic list --help').status)
 
     @testcase(1211)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_build_image_name(self):
         """Test wic create directdisk --image-name core-image-minimal"""
         self.assertEqual(0, runCmd("wic create directdisk "
@@ -78,6 +104,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1212)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
         bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
@@ -92,6 +119,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1157)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID boot"""
         self.assertEqual(0, runCmd("wic create directdisk-gpt "
@@ -125,6 +153,7 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd('wic help kickstart').status)
 
     @testcase(1264)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_compress_gzip(self):
         """Test compressing an image with gzip"""
         self.assertEqual(0, runCmd("wic create directdisk "
@@ -134,6 +163,7 @@ class Wic(oeSelfTest):
                                          "directdisk-*.direct.gz")))
 
     @testcase(1265)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_compress_bzip2(self):
         """Test compressing an image with bzip2"""
         self.assertEqual(0, runCmd("wic create directdisk "
@@ -143,6 +173,7 @@ class Wic(oeSelfTest):
                                          "directdisk-*.direct.bz2")))
 
     @testcase(1266)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_compress_xz(self):
         """Test compressing an image with xz"""
         self.assertEqual(0, runCmd("wic create directdisk "
@@ -152,6 +183,7 @@ class Wic(oeSelfTest):
                                          "directdisk-*.direct.xz")))
 
     @testcase(1267)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_wrong_compressor(self):
         """Test how wic breaks if wrong compressor is provided"""
         self.assertEqual(2, runCmd("wic create directdisk "
@@ -159,6 +191,7 @@ class Wic(oeSelfTest):
                                    "-c wrong", ignore_status=True).status)
 
     @testcase(1268)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
         wks = "directdisk-multi-rootfs"
@@ -170,6 +203,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "%s*.direct" % wks)))
 
     @testcase(1269)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
         bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
@@ -188,6 +222,7 @@ class Wic(oeSelfTest):
                                      "%(wks)s-*.direct" % bbvars)))
 
     @testcase(1346)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
         self.assertEqual(0, runCmd("wic create mkhybridiso "
@@ -220,6 +255,7 @@ class Wic(oeSelfTest):
                 self.assertTrue(content[var])
 
     @testcase(1351)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_wic_image_type(self):
         """Test building wic images by bitbake"""
         self.assertEqual(0, bitbake('wic-image-minimal').status)
@@ -235,6 +271,7 @@ class Wic(oeSelfTest):
             self.assertTrue(os.path.isfile(os.path.realpath(path)))
 
     @testcase(1348)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_qemux86_directdisk(self):
         """Test creation of qemux-86-directdisk image"""
         image = "qemux86-directdisk"
@@ -243,6 +280,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1349)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_mkgummidisk(self):
         """Test creation of mkgummidisk image"""
         image = "mkgummidisk"
@@ -251,6 +289,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1350)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
         image = "mkefidisk"
@@ -259,6 +298,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1385)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_directdisk_bootloader_config(self):
         """Test creation of directdisk-bootloader-config image"""
         image = "directdisk-bootloader-config"
@@ -267,6 +307,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1422)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_qemu(self):
         """Test wic-image-minimal under qemu"""
         self.assertEqual(0, bitbake('wic-image-minimal').status)
@@ -277,6 +318,7 @@ class Wic(oeSelfTest):
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (command, output))
             self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
 
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_bmap(self):
         """Test generation of .bmap file"""
         image = "directdisk"
@@ -285,6 +327,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct.bmap" % image)))
 
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_systemd_bootdisk(self):
         """Test creation of systemd-bootdisk image"""
         image = "systemd-bootdisk"
-- 
2.5.0


