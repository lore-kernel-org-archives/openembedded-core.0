Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A1315731C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 14:16:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 10 Feb 2016 06:16:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,426,1449561600"; d="scan'208";a="650101588"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2016 06:16:03 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 16:15:57 +0200
Message-Id: <1455113759-3692-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1455113759-3692-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1455113759-3692-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/5] sign_rpm.bbclass: do not store key details in signer instance
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
X-List-Received-Date: Wed, 10 Feb 2016 14:16:06 -0000

Refactor the LocalSigner class. Do not store keyid or passphrase file in
the signer object as they are only needed for some of the methods. For
example, the newly added verify() method does not need any key
parameters and export_pubkey only uses keyid.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/sign_rpm.bbclass          |  9 ++++-----
 meta/lib/oe/gpg_sign.py                | 24 +++++++++++-------------
 meta/lib/oe/package_manager.py         |  9 ++++-----
 meta/recipes-core/meta/signing-keys.bb | 16 ++++++----------
 4 files changed, 25 insertions(+), 33 deletions(-)

diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index 8bcabee..8b59bac 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -36,13 +36,12 @@ python sign_rpm () {
     import glob
     from oe.gpg_sign import get_signer
 
-    signer = get_signer(d,
-                        d.getVar('RPM_GPG_BACKEND', True),
-                        d.getVar('RPM_GPG_NAME', True),
-                        d.getVar('RPM_GPG_PASSPHRASE_FILE', True))
+    signer = get_signer(d, d.getVar('RPM_GPG_BACKEND', True))
     rpms = glob.glob(d.getVar('RPM_PKGWRITEDIR', True) + '/*')
 
-    signer.sign_rpms(rpms)
+    signer.sign_rpms(rpms,
+                     d.getVar('RPM_GPG_NAME', True),
+                     d.getVar('RPM_GPG_PASSPHRASE_FILE', True))
 }
 
 do_package_index[depends] += "signing-keys:do_export_public_keys"
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 16a2364..c4cadd6 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -6,31 +6,29 @@ import oe.utils
 
 class LocalSigner(object):
     """Class for handling local (on the build host) signing"""
-    def __init__(self, d, keyid, passphrase_file):
-        self.keyid = keyid
-        self.passphrase_file = passphrase_file
+    def __init__(self, d):
         self.gpg_bin = d.getVar('GPG_BIN', True) or \
                   bb.utils.which(os.getenv('PATH'), 'gpg')
         self.gpg_path = d.getVar('GPG_PATH', True)
         self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpm")
 
-    def export_pubkey(self, output_file):
+    def export_pubkey(self, output_file, keyid):
         """Export GPG public key to a file"""
         cmd = '%s --batch --yes --export --armor -o %s ' % \
                 (self.gpg_bin, output_file)
         if self.gpg_path:
             cmd += "--homedir %s " % self.gpg_path
-        cmd += self.keyid
+        cmd += keyid
         status, output = oe.utils.getstatusoutput(cmd)
         if status:
             raise bb.build.FuncFailed('Failed to export gpg public key (%s): %s' %
-                                      (self.keyid, output))
+                                      (keyid, output))
 
-    def sign_rpms(self, files):
+    def sign_rpms(self, files, keyid, passphrase_file):
         """Sign RPM files"""
         import pexpect
 
-        cmd = self.rpm_bin + " --addsign --define '_gpg_name %s' " % self.keyid
+        cmd = self.rpm_bin + " --addsign --define '_gpg_name %s' " % keyid
         if self.gpg_bin:
             cmd += "--define '%%__gpg %s' " % self.gpg_bin
         if self.gpg_path:
@@ -41,7 +39,7 @@ class LocalSigner(object):
         proc = pexpect.spawn(cmd)
         try:
             proc.expect_exact('Enter pass phrase:', timeout=15)
-            with open(self.passphrase_file) as fobj:
+            with open(passphrase_file) as fobj:
                 proc.sendline(fobj.readline().rstrip('\n'))
             proc.expect(pexpect.EOF, timeout=900)
             proc.close()
@@ -52,11 +50,11 @@ class LocalSigner(object):
             bb.error('rpmsign failed: %s' % proc.before.strip())
             raise bb.build.FuncFailed("Failed to sign RPM packages")
 
-    def detach_sign(self, input_file, armor=True):
+    def detach_sign(self, input_file, keyid, passphrase_file, armor=True):
         """Create a detached signature of a file"""
         cmd = "%s --detach-sign --batch --no-tty --yes " \
                   "--passphrase-file '%s' -u '%s' " % \
-                  (self.gpg_bin, self.passphrase_file, self.keyid)
+                  (self.gpg_bin, passphrase_file, keyid)
         if self.gpg_path:
             cmd += "--homedir %s " % self.gpg_path
         if armor:
@@ -78,11 +76,11 @@ class LocalSigner(object):
         return ret
 
 
-def get_signer(d, backend, keyid, passphrase_file):
+def get_signer(d, backend):
     """Get signer object for the specified backend"""
     # Use local signing by default
     if backend == 'local':
-        return LocalSigner(d, keyid, passphrase_file)
+        return LocalSigner(d)
     else:
         bb.fatal("Unsupported signing backend '%s'" % backend)
 
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 26f6466..b30a4da 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -110,10 +110,7 @@ class RpmIndexer(Indexer):
 
         rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
         if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
-            signer = get_signer(self.d,
-                                self.d.getVar('PACKAGE_FEED_GPG_BACKEND', True),
-                                self.d.getVar('PACKAGE_FEED_GPG_NAME', True),
-                                self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True))
+            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND', True))
         else:
             signer = None
         index_cmds = []
@@ -144,7 +141,9 @@ class RpmIndexer(Indexer):
         # Sign repomd
         if signer:
             for repomd in repomd_files:
-                signer.detach_sign(repomd)
+                signer.detach_sign(repomd,
+                                   self.d.getVar('PACKAGE_FEED_GPG_NAME', True),
+                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True))
         # Copy pubkey(s) to repo
         distro_version = self.d.getVar('DISTRO_VERSION', True) or "oe.0"
         if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index d7aa79d..d7763c6 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -26,18 +26,14 @@ python do_export_public_keys () {
 
     if d.getVar("RPM_SIGN_PACKAGES", True):
         # Export public key of the rpm signing key
-        signer = get_signer(d,
-                            d.getVar('RPM_GPG_BACKEND', True),
-                            d.getVar('RPM_GPG_NAME', True),
-                            d.getVar('RPM_GPG_PASSPHRASE_FILE', True))
-        signer.export_pubkey(d.getVar('RPM_GPG_PUBKEY', True))
+        signer = get_signer(d, d.getVar('RPM_GPG_BACKEND', True))
+        signer.export_pubkey(d.getVar('RPM_GPG_PUBKEY', True),
+                             d.getVar('RPM_GPG_NAME', True))
 
     if d.getVar('PACKAGE_FEED_SIGN', True) == '1':
         # Export public key of the feed signing key
-        signer = get_signer(d,
-                            d.getVar('PACKAGE_FEED_GPG_BACKEND', True),
-                            d.getVar('PACKAGE_FEED_GPG_NAME', True),
-                            d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True))
-        signer.export_pubkey(d.getVar('PACKAGE_FEED_GPG_PUBKEY', True))
+        signer = get_signer(d, d.getVar('PACKAGE_FEED_GPG_BACKEND', True))
+        signer.export_pubkey(d.getVar('PACKAGE_FEED_GPG_PUBKEY', True),
+                             d.getVar('PACKAGE_FEED_GPG_NAME', True))
 }
 addtask do_export_public_keys before do_build
-- 
2.6.2


