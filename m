Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4F50178519
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 17:12:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Aug 2017 10:12:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,388,1498546800"; d="scan'208";a="1004894550"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga003.jf.intel.com with ESMTP; 17 Aug 2017 10:12:29 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Aug 2017 10:12:27 -0700
Message-Id: <20170817171227.78098-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] sign_rpm: Allow pkg signing by chunks through RPM_GPG_SIGN_CHUNK
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
X-List-Received-Date: Thu, 17 Aug 2017 17:12:28 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Commit d58b1d196 moved from chunk to serial signing, but neither of both approaches
allowed the user to select the chunks size. This patch allows the user to select
a chunk size through RPM_GPG_SIGN_CHUNK defaulting to BB_NUMBER_THREADS, considered
a good default. Indirectly, this change reduces the number of processes spawn
to number-of-packages/RPM_GPG_SIGN_CHUNK.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/sign_rpm.bbclass | 7 ++++++-
 meta/lib/oe/gpg_sign.py       | 8 ++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index c49406c74d..6796780ee4 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -19,9 +19,12 @@
 # GPG_BIN
 #           Optional variable for specifying the gpg binary/wrapper to use for
 #           signing.
+# RPM_GPG_SIGN_CHUNK
+#           Optional variable indicating the number of packages used per gpg
+#           invocation
 # GPG_PATH
 #           Optional variable for specifying the gnupg "home" directory:
-#
+
 inherit sanity
 
 RPM_SIGN_PACKAGES='1'
@@ -29,6 +32,7 @@ RPM_SIGN_FILES ?= '0'
 RPM_GPG_BACKEND ?= 'local'
 # SHA-256 is used by default
 RPM_FILE_CHECKSUM_DIGEST ?= '8'
+RPM_GPG_SIGN_CHUNK ?= "${BB_NUMBER_THREADS}"
 
 
 python () {
@@ -56,6 +60,7 @@ python sign_rpm () {
                      d.getVar('RPM_GPG_NAME'),
                      d.getVar('RPM_GPG_PASSPHRASE'),
                      d.getVar('RPM_FILE_CHECKSUM_DIGEST'),
+                     int(d.getVar('RPM_GPG_SIGN_CHUNK')),
                      d.getVar('RPM_FSK_PATH'),
                      d.getVar('RPM_FSK_PASSWORD'))
 }
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 5c7985a856..008478dfeb 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -27,7 +27,7 @@ class LocalSigner(object):
             raise bb.build.FuncFailed('Failed to export gpg public key (%s): %s' %
                                       (keyid, output))
 
-    def sign_rpms(self, files, keyid, passphrase, digest, fsk=None, fsk_password=None):
+    def sign_rpms(self, files, keyid, passphrase, digest, sign_chunk, fsk=None, fsk_password=None):
         """Sign RPM files"""
 
         cmd = self.rpm_bin + " --addsign --define '_gpg_name %s'  " % keyid
@@ -45,9 +45,9 @@ class LocalSigner(object):
             if fsk_password:
                 cmd += "--define '_file_signing_key_password %s' " % fsk_password
 
-        # Sign packages
-        for f in files:
-            status, output = oe.utils.getstatusoutput(cmd + ' ' + f)
+        # Sign in chunks
+        for i in range(0, len(files), sign_chunk):
+            status, output = oe.utils.getstatusoutput(cmd + ' '.join(files[i:i+sign_chunk]))
             if status:
                 raise bb.build.FuncFailed("Failed to sign RPM packages: %s" % output)
 
-- 
2.12.3


