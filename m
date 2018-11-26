Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id A84C96C493
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 17:14:55 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y1so15787395wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 09:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=nnx07h7uRPwn++OoX5zpycmNS96L0L9nOqpzl+34Rt0=;
	b=BkfkRJ5IMobe871IN0q/E1Bw77O4aSAehkZZ46K5o6wgrAdQxNEmVu70OQMffptfC/
	hKQTNX2djsS3+xajcos07DlX5c2S2eWj8VQQt5QoBwU40szsIZxgPrSIG5+kFuXCq22y
	eCQj9t8McU7CQ3E73ZU5b93vOalbxU/mRsXb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nnx07h7uRPwn++OoX5zpycmNS96L0L9nOqpzl+34Rt0=;
	b=SuaQBywR0bxs8jeDE+lOyOgBiNhtSeDnm8ChecpgCTWmZXBrcNGvMUygSmNx3hRHPb
	Y64tXyE3n1NKKXW+hWEzD6KijH4Ru10dZOhWqKgmNgYszWd4cKpdRXxON60tT6sHsa9L
	iTjsRtWfm5eIrWwljffQeGWNzqtzq6xDTfBxUor/4e5Ls2e7B5ECbzCRPiDSROy0VH3r
	WaNNP9LcAvolzHOH6I/iWeyLsKrcFDJFxX3MEHsfhfjkazqcM0Q992q44VazASHG0Kge
	tRksHBmvPB+39gn9uQ6B+ZtuQesQ7D7CEvHY471QjwCucbpE5UgXnuPK39zCnqnsGmMM
	8LWQ==
X-Gm-Message-State: AA+aEWaIEzhOdGxdkB1mpglQ5eCzi4ymSPiV0rG0XkhG7vtpjtp3Z7aI
	I2VWLk/22RSrlXhuJA++emeqcuAgmLE=
X-Google-Smtp-Source: AFSGD/VYw3CI6XvgpyU2CrOlvY+d1g+RYG+fa1ALjC0I4x+xsHHBGlsPf3NNZL6Sna3tDAz6vXQYXg==
X-Received: by 2002:a7b:cb10:: with SMTP id u16mr19020403wmj.68.1543252495801; 
	Mon, 26 Nov 2018 09:14:55 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r196sm1583445wmd.40.2018.11.26.09.14.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 09:14:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Nov 2018 17:14:51 +0000
Message-Id: <20181126171453.21100-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] oeqa/selftest/signing: Skip tests if gpg isn't found
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
X-List-Received-Date: Mon, 26 Nov 2018 17:14:55 -0000

Raising an assertionError in the class setup isn't a particuarly good way to
indicate gpg isn't installed. Instead skip the tests if the required binary
isn't present. For the signing tests we do require it to be present and can't
use a prebuilt one.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/signing.py | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index a130ac96cf9..97e9cfd44dc 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -15,23 +15,18 @@ class Signing(OESelftestTestCase):
     pub_key_path = ""
     secret_key_path = ""
 
-    @classmethod
-    def setUpClass(cls):
-        super(Signing, cls).setUpClass()
+    def setup_gpg(self):
         # Check that we can find the gpg binary and fail early if we can't
         if not shutil.which("gpg"):
-            raise AssertionError("This test needs GnuPG")
+            self.skipTest('gpg binary not found')
 
-        cls.gpg_dir = tempfile.mkdtemp(prefix="oeqa-signing-")
+        self.gpg_dir = tempfile.mkdtemp(prefix="oeqa-signing-")
+        self.track_for_cleanup(self.gpg_dir)
 
-        cls.pub_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.pub")
-        cls.secret_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.secret")
+        self.pub_key_path = os.path.join(self.testlayer_path, 'files', 'signing', "key.pub")
+        self.secret_key_path = os.path.join(self.testlayer_path, 'files', 'signing', "key.secret")
 
-        runCmd('gpg --batch --homedir %s --import %s %s' % (cls.gpg_dir, cls.pub_key_path, cls.secret_key_path))
-
-    @classmethod
-    def tearDownClass(cls):
-        shutil.rmtree(cls.gpg_dir, ignore_errors=True)
+        runCmd('gpg --batch --homedir %s --import %s %s' % (self.gpg_dir, self.pub_key_path, self.secret_key_path))
 
     @OETestID(1362)
     def test_signing_packages(self):
@@ -46,6 +41,8 @@ class Signing(OESelftestTestCase):
         """
         import oe.packagedata
 
+        self.setup_gpg()
+
         package_classes = get_bb_var('PACKAGE_CLASSES')
         if 'package_rpm' not in package_classes:
             self.skipTest('This test requires RPM Packaging.')
@@ -111,6 +108,8 @@ class Signing(OESelftestTestCase):
         builddir = os.environ.get('BUILDDIR')
         sstatedir = os.path.join(builddir, 'test-sstate')
 
+        self.setup_gpg()
+
         self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
         self.add_command_to_tearDown('rm -rf %s' % sstatedir)
 
-- 
2.17.1


