Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8E68B71A50
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 12:51:00 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id m78so93470973lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 04:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=PfGM/kQHXYKCSqDtzEJalcOP9wLEo25MX8SyCWNtRRg=;
	b=NVs7N75ehD5d3CsGtvrgmIMzJREmHeW+qEFY9VcSLWKkImSifHsdYAPnuj1HrEQa1A
	85of3ZokIAlF1RszmX6LAlxH2JUBpBKIIPABGfMmX3q93IOTyl2p3MkYF5rdAzGmZ7kB
	GVpDhdIK1i0VJtGoRI6AD9F70nTZ8kkUUX7vSlDmZjeIHdWx0uDARhqay2vJXNb+JO40
	Nl1Dk1Gbnc5p0gcihX3YbjB7OcqwRNSI1L2pPgUvO3yG48qHkKZyeXaLqt6JiPr6/DBP
	ILj+lSuynm6mbMnN0/cNv4VrPk3M1ZXIb63jeren4aeDMddfeS/t0InB5eiMt1hQPIpV
	AzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=PfGM/kQHXYKCSqDtzEJalcOP9wLEo25MX8SyCWNtRRg=;
	b=QrNKT5FBAetP98EEyQAbXhZJlqow4hhP/KTsYBrYnpcTv26zSYEyQGPde3GbEEceyE
	779Vi/xk4yBSVRCFISulx/yy7kSB0q6KdxfdLFWQqncAd82gT5GhhB5q8bm5hCjvc+Gk
	ZIYE93tvoPteLrskkK9cJVtCnK81Ku4oUSfWbmwEMjNDYKWniL55kcvvQ8pI8UX3hr5i
	OrWacNegnb+NLj1uHjfNrV7MsWt5PnES8CQcKKn3/2u96VuNSizpgeK85KmObayK7wjt
	jM/MyXWCXjRoyOXJa/7HWmdW++WPDhgFrdqMecpExU4+nXs1jLadeYTYFh1K4uuj09Gh
	/2Ew==
X-Gm-Message-State: AIkVDXINUy8QvK8Ua72zGzaOfA9OOHA1G9IvvPFwGV2biX9AEUADdJI7yAIMrsaU7mq7lg==
X-Received: by 10.25.22.104 with SMTP id m101mr957447lfi.17.1484052660335;
	Tue, 10 Jan 2017 04:51:00 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id c75sm450711lfe.28.2017.01.10.04.50.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jan 2017 04:50:58 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 13:50:13 +0100
Message-Id: <a74215b11c5a556cd813ba0063a1b48a8aa858d7.1484051596.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1484051596.git.maciej.borzecki@rndity.com>
References: <cover.1484051596.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1484051596.git.maciej.borzecki@rndity.com>
References: <cover.1484051596.git.maciej.borzecki@rndity.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 3/5] wic: selftest: avoid COMPATIBLE_HOST issues
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
X-List-Received-Date: Tue, 10 Jan 2017 12:51:01 -0000

wic tests will unconditionally attempt to build syslinux and add
configuration options that may not be compatible with current machine.

Resolve this by consulting HOST_ARCH (which defaults to TARGET_ARCH) and build
recipes, add configuration options or skip tests conditionally.

A convenience decorator onlyForArch() can be used to skip test cases for
specific architectures.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 51 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 1a5c6a7e88bf2c4194f2da87cfe36078848fa397..f7aac44a9ae91e8287f868540b8ca2e9ecf3409c 100644
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
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
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
 
@@ -43,16 +66,23 @@ class Wic(oeSelfTest):
 
     def setUpLocal(self):
         """This code is executed before each test method."""
-        self.write_config('IMAGE_FSTYPES += " hddimg"\n'
-                          'MACHINE_FEATURES_append = " efi"\n'
-                          'WKS_FILE = "wic-image-minimal"\n')
+        arch = get_host_arch()
+        is_x86 = arch in ['i586', 'i686', 'x86_64']
+        if is_x86:
+            self.write_config('IMAGE_FSTYPES += " hddimg"\n' \
+                              'MACHINE_FEATURES_append = " efi"\n'
+                              'WKS_FILE = "wic-image-minimal"\n')
 
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
 
@@ -141,6 +171,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @testcase(1157)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID boot"""
         cmd = "wic create directdisk-gpt --image-name core-image-minimal"
@@ -148,6 +179,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1346)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
         cmd = "wic create mkhybridiso --image-name core-image-minimal"
@@ -156,6 +188,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
 
     @testcase(1348)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_qemux86_directdisk(self):
         """Test creation of qemux-86-directdisk image"""
         cmd = "wic create qemux86-directdisk -e core-image-minimal"
@@ -163,6 +196,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "qemux86-directdisk-*direct")))
 
     @testcase(1350)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
         cmd = "wic create mkefidisk -e core-image-minimal"
@@ -170,6 +204,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "mkefidisk-*direct")))
 
     @testcase(1385)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_directdisk_bootloader_config(self):
         """Test creation of directdisk-bootloader-config image"""
         cmd = "wic create directdisk-bootloader-config -e core-image-minimal"
@@ -177,6 +212,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-bootloader-config-*direct")))
 
     @testcase(1560)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_systemd_bootdisk(self):
         """Test creation of systemd-bootdisk image"""
         cmd = "wic create systemd-bootdisk -e core-image-minimal"
@@ -192,6 +228,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
 
     @testcase(1562)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_alternate_output_dir(self):
         """Test alternate output directory"""
         self.assertEqual(0, runCmd("wic create directdisk "
@@ -289,6 +326,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @testcase(1268)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
         status = runCmd("wic create directdisk-multi-rootfs "
@@ -299,6 +337,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-multi-rootfs*.direct")))
 
     @testcase(1269)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
         bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal'))
@@ -375,6 +414,7 @@ class Wic(oeSelfTest):
                                    % (image, imgenvdir)).status)
 
     @testcase(1351)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_wic_image_type(self):
         """Test building wic images by bitbake"""
         self.assertEqual(0, bitbake('wic-image-minimal').status)
@@ -390,6 +430,7 @@ class Wic(oeSelfTest):
             self.assertTrue(os.path.isfile(os.path.realpath(path)))
 
     @testcase(1422)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_qemu(self):
         """Test wic-image-minimal under qemu"""
         self.assertEqual(0, bitbake('wic-image-minimal').status)
-- 
2.5.5


