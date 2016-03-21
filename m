Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E75F26FFFB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 09:25:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2L9Ps9J020345
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 02:25:54 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 21 Mar 2016 02:25:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Mar 2016 02:25:50 -0700
Message-ID: <3e08bc0ed0e3b0fa239b53e1ef6aca422d87e036.1458551516.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1458551516.git.liezhi.yang@windriver.com>
References: <cover.1458551516.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] gpg_sign.py: get rid of pexpect
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
X-List-Received-Date: Mon, 21 Mar 2016 09:25:54 -0000
Content-Type: text/plain

The python-expect is not installed on the distro such as Ubuntu by
default, and we can get rid of it.

Use RPM_GPG_PASSPHRASE to replace of RPM_GPG_PASSPHRASE_FILE which is
more straightforward.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sign_rpm.bbclass |   10 ++++++----
 meta/lib/oe/gpg_sign.py       |   24 ++++++------------------
 2 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index c21e3f0..a8ea75f 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -1,8 +1,8 @@
 # Class for generating signed RPM packages.
 #
 # Configuration variables used by this class:
-# RPM_GPG_PASSPHRASE_FILE
-#           Path to a file containing the passphrase of the signing key.
+# RPM_GPG_PASSPHRASE
+#           The passphrase of the signing key.
 # RPM_GPG_NAME
 #           Name of the key to sign with. May be key id or key name.
 # RPM_GPG_BACKEND
@@ -22,8 +22,10 @@ RPM_GPG_BACKEND ?= 'local'
 
 
 python () {
+    if d.getVar('RPM_GPG_PASSPHRASE_FILE', True):
+        raise_sanity_error('RPM_GPG_PASSPHRASE_FILE is replaced by RPM_GPG_PASSPHRASE', d)
     # Check configuration
-    for var in ('RPM_GPG_NAME', 'RPM_GPG_PASSPHRASE_FILE'):
+    for var in ('RPM_GPG_NAME', 'RPM_GPG_PASSPHRASE'):
         if not d.getVar(var, True):
             raise_sanity_error("You need to define %s in the config" % var, d)
 
@@ -44,7 +46,7 @@ python sign_rpm () {
 
     signer.sign_rpms(rpms,
                      d.getVar('RPM_GPG_NAME', True),
-                     d.getVar('RPM_GPG_PASSPHRASE_FILE', True))
+                     d.getVar('RPM_GPG_PASSPHRASE', True))
 }
 
 do_package_index[depends] += "signing-keys:do_deploy"
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index e738397..b83ee86 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -26,32 +26,20 @@ class LocalSigner(object):
             raise bb.build.FuncFailed('Failed to export gpg public key (%s): %s' %
                                       (keyid, output))
 
-    def sign_rpms(self, files, keyid, passphrase_file):
+    def sign_rpms(self, files, keyid, passphrase):
         """Sign RPM files"""
-        import pexpect
 
-        cmd = self.rpm_bin + " --addsign --define '_gpg_name %s' " % keyid
+        cmd = self.rpm_bin + " --addsign --define '_gpg_name %s'  " % keyid
+        cmd += "--define '_gpg_passphrase %s' " % passphrase
         if self.gpg_bin:
             cmd += "--define '%%__gpg %s' " % self.gpg_bin
         if self.gpg_path:
             cmd += "--define '_gpg_path %s' " % self.gpg_path
         cmd += ' '.join(files)
 
-        # Need to use pexpect for feeding the passphrase
-        proc = pexpect.spawn(cmd)
-        try:
-            proc.expect_exact('Enter pass phrase:', timeout=15)
-            with open(passphrase_file) as fobj:
-                proc.sendline(fobj.readline().rstrip('\n'))
-            proc.expect(pexpect.EOF, timeout=900)
-            proc.close()
-        except pexpect.TIMEOUT as err:
-            bb.error('rpmsign timeout: %s' % err)
-            proc.terminate()
-        if os.WEXITSTATUS(proc.status) or not os.WIFEXITED(proc.status):
-            bb.error('rpmsign failed: %s' % proc.before.strip())
-            raise bb.build.FuncFailed("Failed to sign RPM packages")
-
+        status, output = oe.utils.getstatusoutput(cmd)
+        if status:
+            raise bb.build.FuncFailed("Failed to sign RPM packages: %s" % output)
 
     def detach_sign(self, input_file, keyid, passphrase_file, passphrase=None, armor=True):
         """Create a detached signature of a file"""
-- 
1.7.9.5


