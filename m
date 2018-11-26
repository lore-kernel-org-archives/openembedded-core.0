Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id DB74B6C5C0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 17:14:56 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y139so18977999wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 09:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CAHFk1ggvLoZfXnOiDNDE7RKCDSMtSFq4P7ohA4dNsc=;
	b=aEewTFLn+lEjn2yPpwrvYeTBlpFXjgZ9S3eYih3hNC5HD6OLLIaaUFs+fWgN/GR0vP
	pNLORQEBTfNyoyPuZCOdJ6XoQM+F3SK3/WM4t4FA8htlwpIOWJjXZ8uQamQSiyK+/cVL
	fHaFfAlEkF8Eno5CcUATALVaEk1A5Ig6RuG7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CAHFk1ggvLoZfXnOiDNDE7RKCDSMtSFq4P7ohA4dNsc=;
	b=sSu9MBts+2weMkcEfzJO0wJNpkAUOWsXW+KCXD862tbuQySYVekVoXk6JpNoGqbAEe
	Py5T5H6E+88obr5wO6uVNHOev1qvYxJDwT0SpYy2jdJdnD/1U96dxBf+4zhW/aVYNuX2
	lWC6NlT4Iyt1+60q/EUK7AcyjvlZ4T2efML/hnQPZ60iPw4E4gz5dU/BkcdjkF2b+Vr/
	TvBgh0nJds1AoVLPde1qDfE1lw5JyQoVmbYq5HvOJJgJ69gDHL5LFi5nXtRdho3zjhkv
	GktL/4nc+EeLd7zAnDP6N1bhqWJuORMzv6cTHXnKyq3BmR9z5G/A92cAPUyBlPUAVCNk
	xugw==
X-Gm-Message-State: AA+aEWbozWwrMHGnkXGG5CtGgf5S+zEHWPrccqB5ESqFJoOApvQ9n8sZ
	gp0zLckKsU5vOWWqLDs6X32nKV0T/bY=
X-Google-Smtp-Source: AJdET5dC5BWe593RfuyasrCkzchxWDei4RVDdPchniXJh4EjZ7A7e52mjJY7jpT1KDqJHzOY5ep02Q==
X-Received: by 2002:a1c:a05:: with SMTP id 5mr23430653wmk.49.1543252497075;
	Mon, 26 Nov 2018 09:14:57 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r196sm1583445wmd.40.2018.11.26.09.14.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 09:14:56 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Nov 2018 17:14:52 +0000
Message-Id: <20181126171453.21100-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181126171453.21100-1-richard.purdie@linuxfoundation.org>
References: <20181126171453.21100-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] oeqa/selftest/signing: Allow tests not to need gpg on the host
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
X-List-Received-Date: Mon, 26 Nov 2018 17:14:57 -0000

We ideally don't want to use gpg from the host. This is straightforward for package
management but not for sstate.

For sstate, create a second build directory to run the test in using gnupg-native
from the original build directory.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/signing.py | 67 ++++++++++++++++++-------
 1 file changed, 48 insertions(+), 19 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 97e9cfd44dc..76c587a5c27 100644
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
2.17.1


