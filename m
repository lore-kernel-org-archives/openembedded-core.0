Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 25EFF731E9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 16:13:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 11 Jan 2016 08:13:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,553,1444719600"; d="scan'208";a="631703137"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2016 08:13:22 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jan 2016 18:13:18 +0200
Message-Id: <1452528799-11292-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1452528799-11292-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1452528799-11292-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/3] New lib module for handling GPG signing
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
X-List-Received-Date: Mon, 11 Jan 2016 16:13:23 -0000

Add a new Python module (oe.gpg_sign) for handling GPG signing
operations, i.e. currently package and package feed signing. The
purpose is to be able to more easily support various signing backends.
Currently, only local on-the-build-host signing is implemented.

[YOCTO #8755]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/sign_package_feed.bbclass |  6 +++
 meta/classes/sign_rpm.bbclass          | 47 +++++----------------
 meta/lib/oe/gpg_sign.py                | 76 ++++++++++++++++++++++++++++++++++
 meta/lib/oe/package_manager.py         | 31 +++++---------
 meta/recipes-core/meta/signing-keys.bb | 26 ++++++------
 5 files changed, 116 insertions(+), 70 deletions(-)
 create mode 100644 meta/lib/oe/gpg_sign.py

diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
index d89bc0b..d5df8af 100644
--- a/meta/classes/sign_package_feed.bbclass
+++ b/meta/classes/sign_package_feed.bbclass
@@ -6,6 +6,10 @@
 #           Path to a file containing the passphrase of the signing key.
 # PACKAGE_FEED_GPG_NAME
 #           Name of the key to sign with. May be key id or key name.
+# PACKAGE_FEED_GPG_BACKEND
+#           Optional variable for specifying the backend to use for signing.
+#           Currently the only available option is 'local', i.e. local signing
+#           on the build host.
 # GPG_BIN
 #           Optional variable for specifying the gpg binary/wrapper to use for
 #           signing.
@@ -15,6 +19,8 @@
 inherit sanity
 
 PACKAGE_FEED_SIGN = '1'
+PACKAGE_FEED_GPG_BACKEND ?= 'local'
+
 
 python () {
     # Check sanity of configuration
diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index 7906b64..8bcabee 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -5,6 +5,10 @@
 #           Path to a file containing the passphrase of the signing key.
 # RPM_GPG_NAME
 #           Name of the key to sign with. May be key id or key name.
+# RPM_GPG_BACKEND
+#           Optional variable for specifying the backend to use for signing.
+#           Currently the only available option is 'local', i.e. local signing
+#           on the build host.
 # GPG_BIN
 #           Optional variable for specifying the gpg binary/wrapper to use for
 #           signing.
@@ -14,6 +18,7 @@
 inherit sanity
 
 RPM_SIGN_PACKAGES='1'
+RPM_GPG_BACKEND ?= 'local'
 
 
 python () {
@@ -27,47 +32,17 @@ python () {
                                             'RPM-GPG-PUBKEY'))
 }
 
-
-def rpmsign_wrapper(d, files, passphrase, gpg_name=None):
-    import pexpect
-
-    # Find the correct rpm binary
-    rpm_bin_path = d.getVar('STAGING_BINDIR_NATIVE', True) + '/rpm'
-    cmd = rpm_bin_path + " --addsign --define '_gpg_name %s' " % gpg_name
-    if d.getVar('GPG_BIN', True):
-        cmd += "--define '%%__gpg %s' " % d.getVar('GPG_BIN', True)
-    if d.getVar('GPG_PATH', True):
-        cmd += "--define '_gpg_path %s' " % d.getVar('GPG_PATH', True)
-    cmd += ' '.join(files)
-
-    # Need to use pexpect for feeding the passphrase
-    proc = pexpect.spawn(cmd)
-    try:
-        proc.expect_exact('Enter pass phrase:', timeout=15)
-        proc.sendline(passphrase)
-        proc.expect(pexpect.EOF, timeout=900)
-        proc.close()
-    except pexpect.TIMEOUT as err:
-        bb.warn('rpmsign timeout: %s' % err)
-        proc.terminate()
-    else:
-        if os.WEXITSTATUS(proc.status) or not os.WIFEXITED(proc.status):
-            bb.warn('rpmsign failed: %s' % proc.before.strip())
-    return proc.exitstatus
-
-
 python sign_rpm () {
     import glob
+    from oe.gpg_sign import get_signer
 
-    with open(d.getVar("RPM_GPG_PASSPHRASE_FILE", True)) as fobj:
-        rpm_gpg_passphrase = fobj.readlines()[0].rstrip('\n')
-
-    rpm_gpg_name = (d.getVar("RPM_GPG_NAME", True) or "")
-
+    signer = get_signer(d,
+                        d.getVar('RPM_GPG_BACKEND', True),
+                        d.getVar('RPM_GPG_NAME', True),
+                        d.getVar('RPM_GPG_PASSPHRASE_FILE', True))
     rpms = glob.glob(d.getVar('RPM_PKGWRITEDIR', True) + '/*')
 
-    if rpmsign_wrapper(d, rpms, rpm_gpg_passphrase, rpm_gpg_name) != 0:
-        raise bb.build.FuncFailed("RPM signing failed")
+    signer.sign_rpms(rpms)
 }
 
 do_package_index[depends] += "signing-keys:do_export_public_keys"
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
new file mode 100644
index 0000000..55abad8
--- /dev/null
+++ b/meta/lib/oe/gpg_sign.py
@@ -0,0 +1,76 @@
+"""Helper module for GPG signing"""
+import os
+
+import bb
+import oe.utils
+
+class LocalSigner(object):
+    """Class for handling local (on the build host) signing"""
+    def __init__(self, d, keyid, passphrase_file):
+        self.keyid = keyid
+        self.passphrase_file = passphrase_file
+        self.gpg_bin = d.getVar('GPG_BIN', True) or \
+                  bb.utils.which(os.getenv('PATH'), 'gpg')
+        self.gpg_path = d.getVar('GPG_PATH', True)
+        self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpm")
+
+    def export_pubkey(self, output_file):
+        """Export GPG public key to a file"""
+        cmd = '%s --batch --yes --export --armor -o %s ' % \
+                (self.gpg_bin, output_file)
+        if self.gpg_path:
+            cmd += "--homedir %s " % self.gpg_path
+        cmd += self.keyid
+        status, output = oe.utils.getstatusoutput(cmd)
+        if status:
+            raise bb.build.FuncFailed('Failed to export gpg public key (%s): %s' %
+                                      (self.keyid, output))
+
+    def sign_rpms(self, files):
+        """Sign RPM files"""
+        import pexpect
+
+        cmd = self.rpm_bin + " --addsign --define '_gpg_name %s' " % self.keyid
+        if self.gpg_bin:
+            cmd += "--define '%%__gpg %s' " % self.gpg_bin
+        if self.gpg_path:
+            cmd += "--define '_gpg_path %s' " % self.gpg_path
+        cmd += ' '.join(files)
+
+        # Need to use pexpect for feeding the passphrase
+        proc = pexpect.spawn(cmd)
+        try:
+            proc.expect_exact('Enter pass phrase:', timeout=15)
+            with open(self.passphrase_file) as fobj:
+                proc.sendline(fobj.readline().rstrip('\n'))
+            proc.expect(pexpect.EOF, timeout=900)
+            proc.close()
+        except pexpect.TIMEOUT as err:
+            bb.error('rpmsign timeout: %s' % err)
+            proc.terminate()
+        if os.WEXITSTATUS(proc.status) or not os.WIFEXITED(proc.status):
+            bb.error('rpmsign failed: %s' % proc.before.strip())
+            raise bb.build.FuncFailed("Failed to sign RPM packages")
+
+    def detach_sign(self, input_file):
+        """Create a detached signature of a file"""
+        cmd = "%s --detach-sign --armor --batch --no-tty --yes " \
+                  "--passphrase-file '%s' -u '%s' " % \
+                  (self.gpg_bin, self.passphrase_file, self.keyid)
+        if self.gpg_path:
+            gpg_cmd += "--homedir %s " % self.gpg_path
+        cmd += input_file
+        status, output = oe.utils.getstatusoutput(cmd)
+        if status:
+            raise bb.build.FuncFailed("Failed to create signature for '%s': %s" %
+                                      (input_file, output))
+
+
+def get_signer(d, backend, keyid, passphrase_file):
+    """Get signer object for the specified backend"""
+    # Use local signing by default
+    if backend == 'local':
+        return LocalSigner(d, keyid, passphrase_file)
+    else:
+        bb.fatal("Unsupported signing backend '%s'" % backend)
+
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 32afeaf..c7df4bc 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -9,6 +9,7 @@ import bb
 import tempfile
 import oe.utils
 import string
+from oe.gpg_sign import get_signer
 
 # this can be used by all PM backends to create the index files in parallel
 def create_index(arg):
@@ -109,16 +110,14 @@ class RpmIndexer(Indexer):
 
         rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
         if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
-            pkgfeed_gpg_name = self.d.getVar('PACKAGE_FEED_GPG_NAME', True)
-            pkgfeed_gpg_pass = self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True)
+            signer = get_signer(self.d,
+                                self.d.getVar('PACKAGE_FEED_GPG_BACKEND', True),
+                                self.d.getVar('PACKAGE_FEED_GPG_NAME', True),
+                                self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True))
         else:
-            pkgfeed_gpg_name = None
-            pkgfeed_gpg_pass = None
-        gpg_bin = self.d.getVar('GPG_BIN', True) or \
-                  bb.utils.which(os.getenv('PATH'), "gpg")
-
+            signer = None
         index_cmds = []
-        repo_sign_cmds = []
+        repomd_files = []
         rpm_dirs_found = False
         for arch in archs:
             dbpath = os.path.join(self.d.getVar('WORKDIR', True), 'rpmdb', arch)
@@ -130,15 +129,7 @@ class RpmIndexer(Indexer):
 
             index_cmds.append("%s --dbpath %s --update -q %s" % \
                              (rpm_createrepo, dbpath, arch_dir))
-            if pkgfeed_gpg_name:
-                repomd_file = os.path.join(arch_dir, 'repodata', 'repomd.xml')
-                gpg_cmd = "%s --detach-sign --armor --batch --no-tty --yes " \
-                          "--passphrase-file '%s' -u '%s' " % \
-                          (gpg_bin, pkgfeed_gpg_pass, pkgfeed_gpg_name)
-                if self.d.getVar('GPG_PATH', True):
-                    gpg_cmd += "--homedir %s " % self.d.getVar('GPG_PATH', True)
-                gpg_cmd += repomd_file
-                repo_sign_cmds.append(gpg_cmd)
+            repomd_files.append(os.path.join(arch_dir, 'repodata', 'repomd.xml'))
 
             rpm_dirs_found = True
 
@@ -151,9 +142,9 @@ class RpmIndexer(Indexer):
         if result:
             bb.fatal('%s' % ('\n'.join(result)))
         # Sign repomd
-        result = oe.utils.multiprocess_exec(repo_sign_cmds, create_index)
-        if result:
-            bb.fatal('%s' % ('\n'.join(result)))
+        if signer:
+            for repomd in repomd_files:
+                signer.detach_sign(repomd)
         # Copy pubkey(s) to repo
         distro_version = self.d.getVar('DISTRO_VERSION', True) or "oe.0"
         if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index cc401f3..d7aa79d 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -20,26 +20,24 @@ do_populate_sysroot[noexec] = "1"
 
 EXCLUDE_FROM_WORLD = "1"
 
-def export_gpg_pubkey(d, keyid, path):
-    import bb
-    gpg_bin = d.getVar('GPG_BIN', True) or \
-              bb.utils.which(os.getenv('PATH'), "gpg")
-    cmd = '%s --batch --yes --export --armor -o %s %s' % \
-          (gpg_bin, path, keyid)
-    status, output = oe.utils.getstatusoutput(cmd)
-    if status:
-        raise bb.build.FuncFailed('Failed to export gpg public key (%s): %s' %
-                                  (keyid, output))
 
 python do_export_public_keys () {
+    from oe.gpg_sign import get_signer
+
     if d.getVar("RPM_SIGN_PACKAGES", True):
         # Export public key of the rpm signing key
-        export_gpg_pubkey(d, d.getVar("RPM_GPG_NAME", True),
-                          d.getVar('RPM_GPG_PUBKEY', True))
+        signer = get_signer(d,
+                            d.getVar('RPM_GPG_BACKEND', True),
+                            d.getVar('RPM_GPG_NAME', True),
+                            d.getVar('RPM_GPG_PASSPHRASE_FILE', True))
+        signer.export_pubkey(d.getVar('RPM_GPG_PUBKEY', True))
 
     if d.getVar('PACKAGE_FEED_SIGN', True) == '1':
         # Export public key of the feed signing key
-        export_gpg_pubkey(d, d.getVar("PACKAGE_FEED_GPG_NAME", True),
-                          d.getVar('PACKAGE_FEED_GPG_PUBKEY', True))
+        signer = get_signer(d,
+                            d.getVar('PACKAGE_FEED_GPG_BACKEND', True),
+                            d.getVar('PACKAGE_FEED_GPG_NAME', True),
+                            d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True))
+        signer.export_pubkey(d.getVar('PACKAGE_FEED_GPG_PUBKEY', True))
 }
 addtask do_export_public_keys before do_build
-- 
2.1.4


