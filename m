Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 419B8779B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 11:35:35 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id y193so65933480lfd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 04:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=PMHP9OUFLoO6qMLmoV1W/8pMAUufuf6K8mhrvDATcFE=;
	b=Q7bKhQwaNgEy6noEz3uBCZjomG8N48djpRJM+BiFt3eBUWJRsZ7gcFEum7ty4oxsJ/
	eb8bKhNrLPw1XnR6Ce+6meaIqp5xOE9w/+jhkHAsy2mIW+Zt890+MBUvLLbPNjKHsJ7m
	bb2ML34YlY91Lu21RwgCYEprhcUtP74og6orWX2Ieta7GljCBGQ0jR7ENPdskNNGxZui
	z7dXJIUMtkDcvSKhAOQ7VSwztgP5KZnIgC+liqZVHaF5R+pjmVU0YhMRbOI1tYCYFWU8
	3zx4FUVx7Kd/SIGq8Gk3rawFnX5KEYGefuuKD4YrdkqNFS9YW5rpefemA+jgk+apKAPp
	Dr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=PMHP9OUFLoO6qMLmoV1W/8pMAUufuf6K8mhrvDATcFE=;
	b=YOTHQTxpign/KfwPeqGKOy9HtGFFU3xCJacvxGZMgOfZKk1A5NiVFArQzCe3ziS4gR
	A6NOx5bIdhZe6qfUzCbekUcV/NA9rSfd0R+VRAg8bceHeGCOlD710v9zDWRb/X+lk7Yj
	jYCzzexr9rwx9Z+FxR1IZZZ6EAnGChe2h8aVJeiD4sgtPjWdtFgx1bdKkWmtRKSHviNv
	BF4XnHBHUJkw5NXJ7fNUl1EKHw+gLuk1VSPgNwo+LEM1pU7kkwa7Wy7Qr3tRbZ+t4RdH
	Q28jN42bHnagUeJNfM7Z5iHTQw50YuRCpk025hIhsQeuNKJiEt1H5wQQvUE3nXJSenLf
	VxOw==
X-Gm-Message-State: AFeK/H3PlqrRrmgxCo+1XeQfqi6inuhSwNIvfihgfsxteblSNk0um2yM2EnHhheLV0CYMA==
X-Received: by 10.25.26.133 with SMTP id a127mr9077068lfa.179.1490096136762;
	Tue, 21 Mar 2017 04:35:36 -0700 (PDT)
Received: from localhost.localdomain (staticline-31-182-60-238.toya.net.pl.
	[31.182.60.238]) by smtp.gmail.com with ESMTPSA id
	f28sm3516079lfi.52.2017.03.21.04.35.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Mar 2017 04:35:35 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 12:35:03 +0100
Message-Id: <d0ba949844055ef0d3a093c155584bfd171c149b.1490095649.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1490095649.git.maciej.borzecki@rndity.com>
References: <20170317144027.GA22297@linux.intel.com>
	<cover.1490095649.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1490095649.git.maciej.borzecki@rndity.com>
References: <cover.1490095649.git.maciej.borzecki@rndity.com>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v4 3/5] wic: selftest: avoid COMPATIBLE_HOST issues
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
X-List-Received-Date: Tue, 21 Mar 2017 11:35:36 -0000

Wic tests will unconditionally attempt to build images that may require
dependencies that are incompatible with current target.

Resolve this by consulting HOST_ARCH first (which defaults to TARGET_ARCH)
before proceeding to build images that may be incompatible.

A convenience decorator only_for_arch() can be used to skip test cases for
specific architectures.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 0fdd0e65eb4e5d6a2dc72c38a9597c187d82575c..224610c9d79467a5cb39e703854b76c55fd7e632 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -24,15 +24,41 @@
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
+def get_host_arch(recipe):
+    """A cached call to get_bb_var('HOST_ARCH', <recipe>)"""
+    return get_bb_var('HOST_ARCH', recipe)
+
+
+def only_for_arch(archs, image='core-image-minimal'):
+    """Decorator for wrapping test cases that can be run only for specific target
+    architectures. A list of compatible architectures is passed in `archs`.
+    Current architecture will be determined by parsing bitbake output for
+    `image` recipe.
+    """
+    def wrapper(func):
+        @wraps(func)
+        def wrapped_f(*args, **kwargs):
+            arch = get_host_arch(image)
+            if archs and arch not in archs:
+                raise unittest.SkipTest("Testcase arch dependency not met: %s" % arch)
+            return func(*args, **kwargs)
+        wrapped_f.__name__ = func.__name__
+        return wrapped_f
+    return wrapper
+
+
 class Wic(oeSelfTest):
     """Wic test class."""
 
@@ -42,13 +68,13 @@ class Wic(oeSelfTest):
 
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
 
@@ -141,6 +167,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @testcase(1157)
+    @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_gpt_image(self):
         """Test creation of core-image-minimal with gpt table and UUID boot"""
         cmd = "wic create directdisk-gpt --image-name core-image-minimal -o %s" % self.resultdir
@@ -148,6 +175,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     @testcase(1346)
+    @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
         config = 'INITRAMFS_IMAGE = "core-image-minimal-initramfs"\n'\
@@ -161,6 +189,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.iso")))
 
     @testcase(1348)
+    @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_qemux86_directdisk(self):
         """Test creation of qemux-86-directdisk image"""
         cmd = "wic create qemux86-directdisk -e core-image-minimal -o %s" % self.resultdir
@@ -168,6 +197,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "qemux86-directdisk-*direct")))
 
     @testcase(1350)
+    @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
         cmd = "wic create mkefidisk -e core-image-minimal -o %s" % self.resultdir
@@ -175,6 +205,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "mkefidisk-*direct")))
 
     @testcase(1385)
+    @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_directdisk_bootloader_config(self):
         """Test creation of directdisk-bootloader-config image"""
         cmd = "wic create directdisk-bootloader-config -e core-image-minimal -o %s" % self.resultdir
@@ -182,6 +213,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-bootloader-config-*direct")))
 
     @testcase(1560)
+    @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_systemd_bootdisk(self):
         """Test creation of systemd-bootdisk image"""
         config = 'MACHINE_FEATURES_append = " efi"\n'
@@ -201,6 +233,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
 
     @testcase(1562)
+    @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_default_output_dir(self):
         """Test default output location"""
         for fname in glob("directdisk-*.direct"):
@@ -210,6 +243,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob("directdisk-*.direct")))
 
     @testcase(1212)
+    @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
         bb_vars = get_bb_vars(['STAGING_DATADIR', 'RECIPE_SYSROOT_NATIVE'],
@@ -307,6 +341,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*.direct")))
 
     @testcase(1268)
+    @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_rootfs_indirect_recipes(self):
         """Test usage of rootfs plugin with rootfs recipes"""
         status = runCmd("wic create directdisk-multi-rootfs "
@@ -318,6 +353,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-multi-rootfs*.direct")))
 
     @testcase(1269)
+    @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
         bb_vars = get_bb_vars(['STAGING_DATADIR', 'RECIPE_SYSROOT_NATIVE'],
@@ -531,6 +567,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
         self.assertEqual(1, len(glob(self.resultdir + "wictestdisk-*direct")))
 
     @testcase(1351)
+    @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_wic_image_type(self):
         """Test building wic images by bitbake"""
         config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "wic-image-minimal"\n'\
@@ -551,6 +588,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             self.assertTrue(os.path.isfile(os.path.realpath(path)))
 
     @testcase(1422)
+    @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_qemu(self):
         """Test wic-image-minimal under qemu"""
         config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "wic-image-minimal"\n'\
@@ -565,6 +603,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
 
+    @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_qemu_efi(self):
         """Test core-image-minimal efi image under qemu"""
         config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "mkefidisk.wks"\n'
-- 
2.9.3


