Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5AAFF731F1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 16:13:23 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 11 Jan 2016 08:13:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,553,1444719600"; d="scan'208";a="631703146"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2016 08:13:23 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jan 2016 18:13:19 +0200
Message-Id: <1452528799-11292-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1452528799-11292-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1452528799-11292-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/3] oe.gpg_sign: support obs-signd
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

Implement support for remote signing using obs-signd. It is now possible
to sign both RPM packages and package feeds with this method. The user
just needs to set RPM_GPG_BACKEND and/or PACKAGE_FEED_GPG_BACKEND
variables to 'obssign' in the bitbake config. Of course, in addition,
one needs to setup the signing server and the configure the 'sign'
client command on the build host. The *_PASSPHRASE_FILE settings are not
used when the obssign backend is enabled.

[YOCTO #8755]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/sign_package_feed.bbclass |  5 +++-
 meta/classes/sign_rpm.bbclass          |  5 +++-
 meta/lib/oe/gpg_sign.py                | 48 ++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
index d5df8af..953fa85 100644
--- a/meta/classes/sign_package_feed.bbclass
+++ b/meta/classes/sign_package_feed.bbclass
@@ -24,7 +24,10 @@ PACKAGE_FEED_GPG_BACKEND ?= 'local'
 
 python () {
     # Check sanity of configuration
-    for var in ('PACKAGE_FEED_GPG_NAME', 'PACKAGE_FEED_GPG_PASSPHRASE_FILE'):
+    required = ['PACKAGE_FEED_GPG_NAME']
+    if d.getVar('PACKAGE_FEED_GPG_BACKEND', True) != 'obssign':
+        required.append('PACKAGE_FEED_GPG_PASSPHRASE_FILE')
+    for var in required:
         if not d.getVar(var, True):
             raise_sanity_error("You need to define %s in the config" % var, d)
 
diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index 8bcabee..8be1c35 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -23,7 +23,10 @@ RPM_GPG_BACKEND ?= 'local'
 
 python () {
     # Check configuration
-    for var in ('RPM_GPG_NAME', 'RPM_GPG_PASSPHRASE_FILE'):
+    required = ['RPM_GPG_NAME']
+    if d.getVar('RPM_GPG_BACKEND', True) != 'obssign':
+        required.append('RPM_GPG_PASSPHRASE_FILE')
+    for var in required:
         if not d.getVar(var, True):
             raise_sanity_error("You need to define %s in the config" % var, d)
 
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 55abad8..d8ab816 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -66,11 +66,59 @@ class LocalSigner(object):
                                       (input_file, output))
 
 
+class ObsSigner(object):
+    """Class for handling signing with obs-signd"""
+    def __init__(self, keyid):
+        self.keyid = keyid
+        self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpm")
+
+    def export_pubkey(self, output_file):
+        """Export GPG public key to a file"""
+        cmd = "sign -u '%s' -p" % self.keyid
+        status, output = oe.utils.getstatusoutput(cmd)
+        if status:
+            raise bb.build.FuncFailed('Failed to export gpg public key (%s): %s' %
+                                      (self.keyid, output))
+        with open(output_file, 'w') as fobj:
+            fobj.write(output)
+            fobj.write('\n')
+
+    def sign_rpms(self, files):
+        """Sign RPM files"""
+        import pexpect
+
+        # Remove existing signatures
+        cmd = "%s --delsign %s" % (self.rpm_bin, ' '.join(files))
+        status, output = oe.utils.getstatusoutput(cmd)
+        if status:
+            raise bb.build.FuncFailed("Failed to remove RPM signatures: %s" %
+                                      output)
+        # Sign packages
+        cmd = "sign -u '%s' -r %s" % (self.keyid, ' '.join(files))
+        status, output = oe.utils.getstatusoutput(cmd)
+        if status:
+            raise bb.build.FuncFailed("Failed to sign RPM packages: %s" %
+                                      output)
+
+    def detach_sign(self, input_file):
+        """Create a detached signature of a file"""
+        cmd = "sign -u '%s' -d %s" % (self.keyid, input_file)
+        status, output = oe.utils.getstatusoutput(cmd)
+        if status:
+            raise bb.build.FuncFailed("Failed to create signature for '%s': %s" %
+                                      (input_file, output))
+
+
 def get_signer(d, backend, keyid, passphrase_file):
     """Get signer object for the specified backend"""
     # Use local signing by default
     if backend == 'local':
         return LocalSigner(d, keyid, passphrase_file)
+    elif backend == 'obssign':
+        if passphrase_file:
+            bb.note("GPG passphrase file setting not used when 'obssign' "
+                    "backend is used.")
+        return ObsSigner(keyid)
     else:
         bb.fatal("Unsupported signing backend '%s'" % backend)
 
-- 
2.1.4


