Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id EEFFA72F30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:49:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 21 Feb 2017 06:49:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875855"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:49:01 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:50 +0200
Message-Id: <6ab615d3a56218f22a91a0a057b0b2ce29a35355.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 33/39] gpg_sign.py: fix signing of rpm files using gpg
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
X-List-Received-Date: Tue, 21 Feb 2017 14:49:01 -0000

This means
a) calling rpmkeys and rpmsign instead of rpm
b) instructing gpg to run non-interactively; otherwise on my machine
it pops up windows requesting a key passphrase

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/gpg_sign.py           | 4 ++--
 meta/lib/oeqa/selftest/signing.py | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index dcd19909302..4b87ddde57a 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -10,7 +10,7 @@ class LocalSigner(object):
         self.gpg_bin = d.getVar('GPG_BIN') or \
                   bb.utils.which(os.getenv('PATH'), 'gpg')
         self.gpg_path = d.getVar('GPG_PATH')
-        self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpm")
+        self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpmsign")
 
     def export_pubkey(self, output_file, keyid, armor=True):
         """Export GPG public key to a file"""
@@ -30,7 +30,7 @@ class LocalSigner(object):
         """Sign RPM files"""
 
         cmd = self.rpm_bin + " --addsign --define '_gpg_name %s'  " % keyid
-        cmd += "--define '_gpg_passphrase %s' " % passphrase
+        cmd += "--define '_gpg_sign_cmd_extra_args --batch --passphrase=%s --pinentry-mode=loopback' " % passphrase
         if self.gpg_bin:
             cmd += "--define '%%__gpg %s' " % self.gpg_bin
         if self.gpg_path:
diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index 70e8369876c..828dfccab42 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -27,7 +27,7 @@ class Signing(oeSelfTest):
         cls.pub_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.pub")
         cls.secret_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.secret")
 
-        runCmd('gpg --homedir %s --import %s %s' % (cls.gpg_dir, cls.pub_key_path, cls.secret_key_path))
+        runCmd('gpg --batch --homedir %s --import %s %s' % (cls.gpg_dir, cls.pub_key_path, cls.secret_key_path))
 
     @testcase(1362)
     def test_signing_packages(self):
@@ -73,13 +73,13 @@ class Signing(oeSelfTest):
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


