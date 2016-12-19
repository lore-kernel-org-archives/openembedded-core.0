Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8431C731CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:21:32 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id t196so51734681lff.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=JrbetI/AE4MIozQMHicvhkSito4TBnyb2dDNdAf1dvo=;
	b=bIUqxum87/iGDGdZvRYp4IYvMFVpHSw2StH4N3HOYwGj0uACZWPVGsVgawR761Pqgr
	XA+m27snryS5Mz1L1HRloAhBWlVNVm8WlRmY767550ndCr8YhCojowRcvgnfiluSX5OH
	jZlb7boW0t085842zCMYZyBYQ8b7kzPKtHLqrCI90YWnhcTkkFQ2VN6MFSt8WatcZyo7
	Q8lPbipGS3PAkewAEWVaSFRNfJCGKU2BWN2EObEhxjmr1JvcUENLtb5VEs3Ilqr4a/ys
	GwtqmgOAsz0CFLyB+kQwcdqfOGek9W9dXhc5UbfTVV1094HMgskBgWyhoLCmK5YF3A/0
	ZD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=JrbetI/AE4MIozQMHicvhkSito4TBnyb2dDNdAf1dvo=;
	b=W7Z61wvz6jpWmcvZ4aGzPO/UxA1f+8OgNJmlTsAy8zn85g8AonXtSbNThRBxeyWxaK
	352TLlm0ZVOjvQPuhuGo/Xrt4b4tBUaad1IQCMlbQU3Aev4u9h9tPnIjUD8Buw5rUIR1
	0x7ZAJ4GGZcH9/afznSwIBJ543n3tAmA4og3ryk3BVhb0W/zpYHaN/8YMaxItndf2GOj
	hiuicgqnCNuz+o84j1V54Cxhlc2Ah6JNILlSmFcCTor1LwA/kjGOvDGyM4CX8syUZim2
	sFgCAvOG3klsoST4iCde8A5n2PzAKqrTardZa4tUqcGe+OYMTjZv2Szm3xSj+sxbwQ+1
	/+uQ==
X-Gm-Message-State: AKaTC00Q2nGZOiaTimxbLvNvHryPHlc4YDihNBQ5Bq9cExewJqHXmZ4mgzb0RXp8IUNmhQ==
X-Received: by 10.25.76.195 with SMTP id z186mr5440774lfa.104.1482146493024;
	Mon, 19 Dec 2016 03:21:33 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id c2sm3681892ljb.8.2016.12.19.03.21.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Dec 2016 03:21:32 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 12:20:59 +0100
Message-Id: <b24d9ead4dc6b25c7686381ac902ff12186b0a68.1482145354.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1482145354.git.maciej.borzecki@rndity.com>
References: <20161213185317.GA6550@linux.intel.com>
	<cover.1482145354.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1482145354.git.maciej.borzecki@rndity.com>
References: <cover.1482145354.git.maciej.borzecki@rndity.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v6 3/5] wic: selftest: avoid COMPATIBLE_HOST issues
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
X-List-Received-Date: Mon, 19 Dec 2016 11:21:33 -0000

wic tests will unconditionally attempt to build syslinux and add
configuration options that may not be compatible with current machine.

Resolve this by consulting HOST_ARCH (which defaults to TARGET_ARCH) and build
recipes, add configuration options or skip tests conditionally.

A convenience decorator onlyForArch() can be used to skip test cases for
specific architectures.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 53 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index e652fad24ab6dd7ab1b998b60a98a4052a2f1dd7..35cd14fb0c4a9b863a7a6324885f80da8e86d3eb 100644
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
 
@@ -41,16 +59,23 @@ class Wic(oeSelfTest):
 
     def setUpLocal(self):
         """This code is executed before each test method."""
-        self.write_config('IMAGE_FSTYPES += " hddimg"\n'
-                          'MACHINE_FEATURES_append = " efi"\n'
-                          'WKS_FILE = "wic-image-minimal"\n')
+        arch = get_bb_var('HOST_ARCH', 'core-image-minimal')
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
 
@@ -72,6 +97,7 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd('wic list --help').status)
 
     @testcase(1211)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_build_image_name(self):
         """Test wic create directdisk --image-name core-image-minimal"""
         self.assertEqual(0, runCmd("wic create directdisk "
@@ -79,6 +105,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1212)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
         bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
@@ -93,6 +120,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1157)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID boot"""
         self.assertEqual(0, runCmd("wic create directdisk-gpt "
@@ -126,6 +154,7 @@ class Wic(oeSelfTest):
         self.assertEqual(0, runCmd('wic help kickstart').status)
 
     @testcase(1264)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_compress_gzip(self):
         """Test compressing an image with gzip"""
         self.assertEqual(0, runCmd("wic create directdisk "
@@ -135,6 +164,7 @@ class Wic(oeSelfTest):
                                          "directdisk-*.direct.gz")))
 
     @testcase(1265)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_compress_bzip2(self):
         """Test compressing an image with bzip2"""
         self.assertEqual(0, runCmd("wic create directdisk "
@@ -144,6 +174,7 @@ class Wic(oeSelfTest):
                                          "directdisk-*.direct.bz2")))
 
     @testcase(1266)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_compress_xz(self):
         """Test compressing an image with xz"""
         self.assertEqual(0, runCmd("wic create directdisk "
@@ -153,6 +184,7 @@ class Wic(oeSelfTest):
                                          "directdisk-*.direct.xz")))
 
     @testcase(1267)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_wrong_compressor(self):
         """Test how wic breaks if wrong compressor is provided"""
         self.assertEqual(2, runCmd("wic create directdisk "
@@ -160,6 +192,7 @@ class Wic(oeSelfTest):
                                    "-c wrong", ignore_status=True).status)
 
     @testcase(1268)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
         wks = "directdisk-multi-rootfs"
@@ -171,6 +204,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "%s*.direct" % wks)))
 
     @testcase(1269)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
         bbvars = dict((var.lower(), get_bb_var(var, 'core-image-minimal')) \
@@ -189,6 +223,7 @@ class Wic(oeSelfTest):
                                      "%(wks)s-*.direct" % bbvars)))
 
     @testcase(1346)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
         self.assertEqual(0, runCmd("wic create mkhybridiso "
@@ -221,6 +256,7 @@ class Wic(oeSelfTest):
                 self.assertTrue(content[var])
 
     @testcase(1351)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_wic_image_type(self):
         """Test building wic images by bitbake"""
         self.assertEqual(0, bitbake('wic-image-minimal').status)
@@ -236,6 +272,7 @@ class Wic(oeSelfTest):
             self.assertTrue(os.path.isfile(os.path.realpath(path)))
 
     @testcase(1348)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_qemux86_directdisk(self):
         """Test creation of qemux-86-directdisk image"""
         image = "qemux86-directdisk"
@@ -244,6 +281,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1349)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_mkgummidisk(self):
         """Test creation of mkgummidisk image"""
         image = "mkgummidisk"
@@ -252,6 +290,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1350)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
         image = "mkefidisk"
@@ -260,6 +299,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1385)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_directdisk_bootloader_config(self):
         """Test creation of directdisk-bootloader-config image"""
         image = "directdisk-bootloader-config"
@@ -268,6 +308,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1422)
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_qemu(self):
         """Test wic-image-minimal under qemu"""
         self.assertEqual(0, bitbake('wic-image-minimal').status)
@@ -278,6 +319,7 @@ class Wic(oeSelfTest):
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (command, output))
             self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
 
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_bmap(self):
         """Test generation of .bmap file"""
         image = "directdisk"
@@ -286,6 +328,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct.bmap" % image)))
 
+    @onlyForArch('i586', 'i686', 'x86_64')
     def test_systemd_bootdisk(self):
         """Test creation of systemd-bootdisk image"""
         image = "systemd-bootdisk"
-- 
2.5.5


