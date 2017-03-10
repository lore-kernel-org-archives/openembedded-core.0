Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 900787772A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:25:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:26:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988236"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:26:00 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:24:10 +0200
Message-Id: <fa253aa3da241cd2df800131c25cb1096c75fb8b.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 31/44] gpg_sign.py: fix signing of rpm files using gpg
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
X-List-Received-Date: Fri, 10 Mar 2017 11:26:00 -0000

This means
a) calling rpmkeys and rpmsign instead of rpm
b) instructing gpg to run non-interactively; otherwise on my machine
it pops up windows requesting a key passphrase

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/gpg_sign.py           | 7 ++++---
 meta/lib/oeqa/selftest/signing.py | 8 ++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index f7f96c6d5e3..7ce767ee0a0 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -11,7 +11,7 @@ class LocalSigner(object):
                   bb.utils.which(os.getenv('PATH'), 'gpg')
         self.gpg_path = d.getVar('GPG_PATH')
         self.gpg_version = self.get_gpg_version()
-        self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpm")
+        self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpmsign")
 
     def export_pubkey(self, output_file, keyid, armor=True):
         """Export GPG public key to a file"""
@@ -31,9 +31,10 @@ class LocalSigner(object):
         """Sign RPM files"""
 
         cmd = self.rpm_bin + " --addsign --define '_gpg_name %s'  " % keyid
-        cmd += "--define '_gpg_passphrase %s' " % passphrase
+        gpg_args = '--batch --passphrase=%s' % passphrase
         if self.gpg_version > (2,1,):
-            cmd += "--define '_gpg_sign_cmd_extra_args --pinentry-mode=loopback' "
+            gpg_args += ' --pinentry-mode=loopback'
+        cmd += "--define '_gpg_sign_cmd_extra_args %s' " % gpg_args
         if self.gpg_bin:
             cmd += "--define '%%__gpg %s' " % self.gpg_bin
         if self.gpg_path:
diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index 006afbef15a..a9b135aab44 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -27,7 +27,7 @@ class Signing(oeSelfTest):
         cls.pub_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.pub")
         cls.secret_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.secret")
 
-        runCmd('gpg --homedir %s --import %s %s' % (cls.gpg_dir, cls.pub_key_path, cls.secret_key_path))
+        runCmd('gpg --batch --homedir %s --import %s %s' % (cls.gpg_dir, cls.pub_key_path, cls.secret_key_path))
 
     @testcase(1362)
     def test_signing_packages(self):
@@ -76,13 +76,13 @@ class Signing(oeSelfTest):
         # Use a temporary rpmdb
         rpmdb = tempfile.mkdtemp(prefix='oeqa-rpmdb')
 
-        runCmd('%s/rpm --define "_dbpath %s" --import %s' %
+        runCmd('%s/rpmkeys --define "_dbpath %s" --import %s' %
                (staging_bindir_native, rpmdb, self.pub_key_path))
 
-        ret = runCmd('%s/rpm --define "_dbpath %s" --checksig %s' %
+        ret = runCmd('%s/rpmkeys --define "_dbpath %s" --checksig %s' %
                      (staging_bindir_native, rpmdb, pkg_deploy))
         # tmp/deploy/rpm/i586/ed-1.9-r0.i586.rpm: rsa sha1 md5 OK
-        self.assertIn('rsa sha1 md5 OK', ret.output, 'Package signed incorrectly.')
+        self.assertIn('rsa sha1 (md5) pgp md5 OK', ret.output, 'Package signed incorrectly.')
         shutil.rmtree(rpmdb)
 
     @testcase(1382)
-- 
2.11.0


