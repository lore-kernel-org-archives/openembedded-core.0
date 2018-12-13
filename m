Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 640006D523
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:06 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id u6so1722835pfh.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JC6aycnjxnfQ2OOgpTMHGI0zpW0jb+Aw8X68LwxMnpk=;
	b=MotyXyA1RoDI02eeVlnmCWN4Ptp6V16rK9WNTVOzzpXrYmKLphSKsS7rQogGVTXMMq
	57btfQ2XMvLBU/p5cTYjb+ADwM0eIYfdtgbAzC16sCx9/asAh0k1cK+9acTVigSOdkkI
	z7A89CcoTSWGjFKsALYdIeo1zAzJbnSZManHWOwWZQ5/EeMH6zQhXB1Da5RHB0UxAwIc
	SlAe0wAImnTGFObuccJmSsE7fWtJd98J3zVZob6EZhOJALe7hmCqaAE88JntfFKb9pF0
	bwASYY85NkKyk/53otQ1lsHhOB53LbKEW/gK/Gcvz4VYsTMd7kntHEdIicVy3WIuHmlg
	MGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JC6aycnjxnfQ2OOgpTMHGI0zpW0jb+Aw8X68LwxMnpk=;
	b=CfjKdxg5l2yjfiWE/y7xlbaiETNEMlDjwzkBa1KUkTrsvXK8bi9BTL9+EhKMG5+HKw
	XXJhhUdfdPrqeOcQ0C1ttnvN7yf7/P15vnnRzxTZYFGBe748XP9il5OxsFGLbP2HAOY9
	wAwbxJVg8y1JjFmlf5wNLjQt3vaK9+NbsQ80rifXlGqtaY0eqf17k5veXCZ0CHpN3ov2
	Ww8odIICWeBphQActE+41s6ZgWFR9pG+LxA+5EykHPt2kEHcHNbcKW9I7IDTSVeQSCVm
	35MMlZNGVIRt5OQauZbTLb08jmljJccko53Y76oVK4nWq9d35LMtfOClNaFLYFp99S8p
	Qn+Q==
X-Gm-Message-State: AA+aEWblOVaShXXIPJAf0kB5MiLvcbzZsMlQSMbT/3rFLVrXVQoqk1IW
	dzZzW6BBh+viGkEz3sr4ipkBYBFD
X-Google-Smtp-Source: AFSGD/XpyT+H9BMGA+FSPyF1qdxkdL9z5YU0x9WB+qAnrng77HpnEpQrTonZPxLIrMmHTtEPRF3Gwg==
X-Received: by 2002:a63:ef04:: with SMTP id u4mr394570pgh.197.1544737147209;
	Thu, 13 Dec 2018 13:39:07 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:13 -0800
Message-Id: <a848838fe894565c7a20c42d2e398e5865b0dafb.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 05/45] oeqa/selftest/signing: Allow tests not to need gpg on the host
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:06 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We ideally don't want to use gpg from the host. This is straightforward for package
management but not for sstate.

For sstate, create a second build directory to run the test in using gnupg-native
from the original build directory.

(From OE-Core rev: 10afa94c3f0d7eb7524a26deda86949073d55fde)

(From OE-Core rev: c5d68a24b0c6df0a16f50075a690b3aab0e273ee)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/signing.py | 67 +++++++++++++++++++++++----------
 1 file changed, 48 insertions(+), 19 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 28afcdc..21849a1 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -1,10 +1,12 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 import os
+import oe
 import glob
 import re
 import shutil
 import tempfile
+from contextlib import contextmanager
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.ftools import write_file
 
@@ -16,9 +18,7 @@ class Signing(OESelftestTestCase):
     secret_key_path = ""
 
     def setup_gpg(self):
-        # Check that we can find the gpg binary and fail early if we can't
-        if not shutil.which("gpg"):
-            self.skipTest('gpg binary not found')
+        bitbake('gnupg-native -c addto_recipe_sysroot')
 
         self.gpg_dir = tempfile.mkdtemp(prefix="oeqa-signing-")
         self.track_for_cleanup(self.gpg_dir)
@@ -26,7 +26,30 @@ class Signing(OESelftestTestCase):
         self.pub_key_path = os.path.join(self.testlayer_path, 'files', 'signing', "key.pub")
         self.secret_key_path = os.path.join(self.testlayer_path, 'files', 'signing', "key.secret")
 
-        runCmd('gpg --batch --homedir %s --import %s %s' % (self.gpg_dir, self.pub_key_path, self.secret_key_path))
+        nsysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native")
+        runCmd('gpg --batch --homedir %s --import %s %s' % (self.gpg_dir, self.pub_key_path, self.secret_key_path), native_sysroot=nsysroot)
+        return nsysroot + get_bb_var("bindir_native")
+
+
+    @contextmanager
+    def create_new_builddir(self, builddir, newbuilddir):
+        bb.utils.mkdirhier(newbuilddir)
+        oe.path.copytree(builddir + "/conf", newbuilddir + "/conf")
+        oe.path.copytree(builddir + "/cache", newbuilddir + "/cache")
+
+        origenv = os.environ.copy()
+
+        for e in os.environ:
+            if builddir in os.environ[e]:
+                os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
+
+        os.chdir(newbuilddir)
+        try:
+            yield
+        finally:
+            for e in origenv:
+                os.environ[e] = origenv[e]
+            os.chdir(builddir)
 
     @OETestID(1362)
     def test_signing_packages(self):
@@ -105,13 +128,12 @@ class Signing(OESelftestTestCase):
 
         test_recipe = 'ed'
 
-        builddir = os.environ.get('BUILDDIR')
+        # Since we need gpg but we can't use gpg-native for sstate signatures, we 
+        # build gpg-native in our original builddir then run the tests in a second one.
+        builddir = os.environ.get('BUILDDIR') + "-testsign"
         sstatedir = os.path.join(builddir, 'test-sstate')
 
-        self.setup_gpg()
-
-        self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
-        self.add_command_to_tearDown('rm -rf %s' % sstatedir)
+        nsysroot = self.setup_gpg()
 
         feature = 'SSTATE_SIG_KEY ?= "testuser"\n'
         feature += 'SSTATE_SIG_PASSPHRASE ?= "test123"\n'
@@ -123,19 +145,26 @@ class Signing(OESelftestTestCase):
 
         self.write_config(feature)
 
-        bitbake('-c clean %s' % test_recipe)
-        bitbake(test_recipe)
+        with self.create_new_builddir(os.environ['BUILDDIR'], builddir):
+
+            os.environ["PATH"] = nsysroot + ":" + os.environ["PATH"]
+            self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
+            self.add_command_to_tearDown('rm -rf %s' % sstatedir)
+            self.add_command_to_tearDown('rm -rf %s' % builddir)
+
+            bitbake('-c clean %s' % test_recipe)
+            bitbake(test_recipe)
 
-        recipe_sig = glob.glob(sstatedir + '/*/*:ed:*_package.tgz.sig')
-        recipe_tgz = glob.glob(sstatedir + '/*/*:ed:*_package.tgz')
+            recipe_sig = glob.glob(sstatedir + '/*/*:ed:*_package.tgz.sig')
+            recipe_tgz = glob.glob(sstatedir + '/*/*:ed:*_package.tgz')
 
-        self.assertEqual(len(recipe_sig), 1, 'Failed to find .sig file.')
-        self.assertEqual(len(recipe_tgz), 1, 'Failed to find .tgz file.')
+            self.assertEqual(len(recipe_sig), 1, 'Failed to find .sig file.')
+            self.assertEqual(len(recipe_tgz), 1, 'Failed to find .tgz file.')
 
-        ret = runCmd('gpg --homedir %s --verify %s %s' % (self.gpg_dir, recipe_sig[0], recipe_tgz[0]))
-        # gpg: Signature made Thu 22 Oct 2015 01:45:09 PM EEST using RSA key ID 61EEFB30
-        # gpg: Good signature from "testuser (nocomment) <testuser@email.com>"
-        self.assertIn('gpg: Good signature from', ret.output, 'Package signed incorrectly.')
+            ret = runCmd('gpg --homedir %s --verify %s %s' % (self.gpg_dir, recipe_sig[0], recipe_tgz[0]))
+            # gpg: Signature made Thu 22 Oct 2015 01:45:09 PM EEST using RSA key ID 61EEFB30
+            # gpg: Good signature from "testuser (nocomment) <testuser@email.com>"
+            self.assertIn('gpg: Good signature from', ret.output, 'Package signed incorrectly.')
 
 
 class LockedSignatures(OESelftestTestCase):
-- 
2.7.4


