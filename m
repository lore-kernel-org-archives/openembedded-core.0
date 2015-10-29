Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A2639770E3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 14:48:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 29 Oct 2015 07:48:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,214,1444719600"; d="scan'208";a="822351628"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 29 Oct 2015 07:48:19 -0700
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id A93116A4005;
	Thu, 29 Oct 2015 07:47:16 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Oct 2015 16:50:10 +0200
Message-Id: <1446130211-14862-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCHv2 1/2] oeqa/selftest/signing: New test for Signing packages in the package feeds.
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
X-List-Received-Date: Thu, 29 Oct 2015 14:48:39 -0000

[YOCTO # 8134] This test verifies features introduced in bug 8134.

It requires as resources the files from meta-selftest/files/signing:
For 'gpg --gen-key' the used input was:
key: RSA
key-size: 2048
key-valid: 0
realname: testuser
email: testuser@email.com
comment: nocomment
passphrase: test123

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta-selftest/files/signing/key.pub    | 30 ++++++++++++++
 meta-selftest/files/signing/key.secret | 59 ++++++++++++++++++++++++++
 meta-selftest/files/signing/secret.txt |  1 +
 meta/lib/oeqa/selftest/signing.py      | 76 ++++++++++++++++++++++++++++++++++
 4 files changed, 166 insertions(+)
 create mode 100644 meta-selftest/files/signing/key.pub
 create mode 100644 meta-selftest/files/signing/key.secret
 create mode 100644 meta-selftest/files/signing/secret.txt
 create mode 100644 meta/lib/oeqa/selftest/signing.py

diff --git a/meta-selftest/files/signing/key.pub b/meta-selftest/files/signing/key.pub
new file mode 100644
index 0000000..e197bb3
--- /dev/null
+++ b/meta-selftest/files/signing/key.pub
@@ -0,0 +1,30 @@
+-----BEGIN PGP PUBLIC KEY BLOCK-----
+Version: GnuPG v1
+
+mQENBFYeMycBCADISkEj+u+3SkGbmC4b09StA3Fk4J8bKZrTTpQqUhOH4QFIQpso
+q96Q907h/ABAgB+IV0SGIeN866E7BqToqoXZ74X6EoyXWdndaMaFZSj+oNqqg6Gi
+hVsuGNpvRyyXSCYW8w9H2lFx09UufFrUxoSeP2iVdJJaUAmb8e00PCwkYrS2BZEa
+tO2VgllbaqczldmlUGnkIZt8YUSQSI/xZBDYUvbcZYBaOnDH1SDQl26f+bgyeIyS
+TW5TZb96o4tMfiifgPoqAapAxQLahG0WtjF/n1yNV5wUNQYsEQf6/h6W2rHGsCP5
+6FVFnr/ZPVam9iHUxL4lvJSI8dEH37s9GmarABEBAAG0LXRlc3R1c2VyIChub2Nv
+bW1lbnQpIDx0ZXN0dXNlckB0ZXN0ZW1haWwuY29tPokBOAQTAQIAIgUCVh4zJwIb
+AwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQezExa11krVLM2wf/fW1C8DPx
+tZEyl6iPXFjNotslo+t2TL6jPefC22KmbokJCtCnxcopBjQRuhUSNDTkXkUdVagy
+TaaYILV8XGajTmcVGQTaKeh+j6TM6CBGApQB5KhHvZCyvNBrGcNyuiex0Sm/rIhS
+fZre6ptZM/026W2kLwwJESXzHJEqCoFmU6aSOUCVyiDgMfcNw6c4NmEoqZtLdnxU
+B7Nac98o933AIvaaQMGtKIOcyOM7P/dyv8eMc38z2ew5bEB8E9aSdg5koXb3zIt5
+IKea631k4INAsFFyLMQNSmmKV7RK0miF5b4hGyekrYZRtiic5+dq5aWnVka4hBfi
+x31euxwQE87gQLkBDQRWHjMnAQgAt7C9QCFPWzLGQuQ/YaQub+8s2lYNQnmfwDHm
+5PuON+Wj/f5GyQhHKsbdUAPZ7GsjFIQnva7xNYYF/IvpC+0saB5NLMkBzjfIsg92
+6MkadAKlOR2o9gKlF59mulsJmJqNFTXiRcVXvpUnU8WB9ECmm321XfYHhk+4EMay
+H3OUZ0k6dEmvrWBTKNTR7M0z6j/jW+8J3vP3L9k1H+OV0EZwAKXfbh1lN4H467jY
+3gA7FU1WDmA06HphoSaFUEGTuXGtrRP0eksCUj3BtVygXnyQb379dISDOWcs/9Ke
+v3KMrZWgDnA4pH1eQpjycBhwKOCHYyhSSVOwCS3DGkaaklmQZwARAQABiQEfBBgB
+AgAJBQJWHjMnAhsMAAoJEHsxMWtdZK1SoPsIAKadG/tvS5COCyF8FuriL89Ysfov
+kMRKeb9hsMDbKX2lm3UtoS5ErmpkEUO/SbazQYm6/vYc8noQquqhkIdCljIvpWDv
+17tXEFfTGA493dlTTEWFt5bvzbQN6OhBu3904lAE4JGtlOOa9OKDeguwXbneLOyl
+dnlj2f7rw05cB9t/RDu7T11dTI39BMTUUm1lpWxYJk41o59b9g+fpJZkiIAJwnN3
+MwM1u9/AWfTqjNRgMAO5dIYceceTwGogujG+xz93flt+NjQhILG0T9jd0DFBgIAX
+Zq4PzX5aFDKjGoFaOOZ6r+kppBLH/HN6okMGIcfqaPPdnJI1MXFQvFzUNpo=
+=2cSJ
+-----END PGP PUBLIC KEY BLOCK-----
diff --git a/meta-selftest/files/signing/key.secret b/meta-selftest/files/signing/key.secret
new file mode 100644
index 0000000..d30d7cd
--- /dev/null
+++ b/meta-selftest/files/signing/key.secret
@@ -0,0 +1,59 @@
+-----BEGIN PGP PRIVATE KEY BLOCK-----
+Version: GnuPG v1
+
+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
+=b+vR
+-----END PGP PRIVATE KEY BLOCK-----
diff --git a/meta-selftest/files/signing/secret.txt b/meta-selftest/files/signing/secret.txt
new file mode 100644
index 0000000..5271a52
--- /dev/null
+++ b/meta-selftest/files/signing/secret.txt
@@ -0,0 +1 @@
+test123
diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
new file mode 100644
index 0000000..fd8a52c
--- /dev/null
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -0,0 +1,76 @@
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+import os
+import glob
+from oeqa.utils.decorators import testcase
+
+
+class Signing(oeSelfTest):
+
+    gpg_dir = ""
+    pub_key_name = 'key.pub'
+    secret_key_name = 'key.secret'
+
+    @classmethod
+    def setUpClass(cls):
+        # Import the gpg keys
+
+        cls.gpg_dir = os.path.join(cls.testlayer_path, 'files/signing/')
+
+        # key.secret key.pub are located in gpg_dir
+        pub_key_location = cls.gpg_dir + cls.pub_key_name
+        secret_key_location = cls.gpg_dir + cls.secret_key_name
+        runCmd('gpg --homedir %s --import %s %s' % (cls.gpg_dir, pub_key_location, secret_key_location))
+
+    @classmethod
+    def tearDownClass(cls):
+        # Delete the files generated by 'gpg --import'
+
+        gpg_files = glob.glob(cls.gpg_dir + '*.gpg*')
+        random_seed_file = cls.gpg_dir + 'random_seed'
+        gpg_files.append(random_seed_file)
+
+        for gpg_file in gpg_files:
+            runCmd('rm -f ' + gpg_file)
+
+    @testcase(1362)
+    def test_signing_packages(self):
+        """
+        Summary:     Test that packages can be signed in the package feed
+        Expected:    Package should be signed with the correct key
+        Product:     oe-core
+        Author:      Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        """
+
+        package_classes = get_bb_var('PACKAGE_CLASSES')
+        if 'package_rpm' not in package_classes:
+            self.skipTest('This test requires RPM Packaging.')
+
+        test_recipe = 'ed'
+
+        feature = 'INHERIT += "sign_rpm"\n'
+        feature += 'RPM_GPG_PASSPHRASE_FILE = "%ssecret.txt"\n' % self.gpg_dir
+        feature += 'RPM_GPG_NAME = "testuser"\n'
+        feature += 'RPM_GPG_PUBKEY = "%s%s"\n' % (self.gpg_dir, self.pub_key_name)
+        feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
+
+        self.write_config(feature)
+
+        bitbake('-c cleansstate %s' % test_recipe)
+        bitbake('-c clean %s' % test_recipe)
+        bitbake(test_recipe)
+        self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
+
+        pf = get_bb_var('PF', test_recipe)
+        deploy_dir_rpm = get_bb_var('DEPLOY_DIR_RPM', test_recipe)
+        package_arch = get_bb_var('PACKAGE_ARCH', test_recipe)
+        staging_bindir_native = get_bb_var('STAGING_BINDIR_NATIVE')
+
+        pkg_deploy = os.path.join(deploy_dir_rpm, package_arch, '.'.join((pf, package_arch, 'rpm')))
+
+        runCmd('%s/rpm --import %s%s' % (staging_bindir_native, self.gpg_dir, self.pub_key_name))
+
+        ret = runCmd('%s/rpm --checksig %s' % (staging_bindir_native, pkg_deploy))
+        # tmp/deploy/rpm/i586/ed-1.9-r0.i586.rpm: rsa sha1 md5 OK
+        self.assertIn('rsa sha1 md5 OK', ret.output, 'Package signed incorrectly.')
-- 
2.1.0


