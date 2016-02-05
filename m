Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 63FE6773A2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 14:00:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Feb 2016 06:00:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,400,1449561600"; d="scan'208";a="906234830"
Received: from mwoodwar-mobl8.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.19.30])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2016 06:00:27 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 16:00:22 +0200
Message-Id: <1454680824-26075-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1454680824-26075-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1454680824-26075-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/3] package signing: do actual sanity checking in the signer class
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
X-List-Received-Date: Fri, 05 Feb 2016 14:00:30 -0000

The configuration needed for different signing backends may vary
(although we currently support only one backend). Thus, do the actual
sanity checking of the configuration there.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/sign_package_feed.bbclass | 14 ++++++++++----
 meta/classes/sign_rpm.bbclass          | 14 ++++++++++----
 meta/lib/oe/gpg_sign.py                | 22 ++++++++++++++++++----
 3 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
index d5df8af..3f6ff2d 100644
--- a/meta/classes/sign_package_feed.bbclass
+++ b/meta/classes/sign_package_feed.bbclass
@@ -23,10 +23,16 @@ PACKAGE_FEED_GPG_BACKEND ?= 'local'
 
 
 python () {
-    # Check sanity of configuration
-    for var in ('PACKAGE_FEED_GPG_NAME', 'PACKAGE_FEED_GPG_PASSPHRASE_FILE'):
-        if not d.getVar(var, True):
-            raise_sanity_error("You need to define %s in the config" % var, d)
+    # Check sanity of config
+    from oe.gpg_sign import get_signer_class
+    signer = get_signer_class(d.getVar('PACKAGE_FEED_GPG_BACKEND', True))
+    err_msg = signer.check_sanity(d,
+                                  d.getVar('PACKAGE_FEED_GPG_NAME', True),
+                                  d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True))
+    if err_msg:
+        raise_sanity_error(err_msg %{'keyid': 'PACKAGE_FEED_GPG_NAME',
+                                     'passphrase_file': 'PACKAGE_FEED_GPG_PASSPHRASE_FILE'},
+                           d)
 
     # Set expected location of the public key
     d.setVar('PACKAGE_FEED_GPG_PUBKEY',
diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index 8bcabee..79dc517 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -22,10 +22,16 @@ RPM_GPG_BACKEND ?= 'local'
 
 
 python () {
-    # Check configuration
-    for var in ('RPM_GPG_NAME', 'RPM_GPG_PASSPHRASE_FILE'):
-        if not d.getVar(var, True):
-            raise_sanity_error("You need to define %s in the config" % var, d)
+    # Check sanity of config
+    from oe.gpg_sign import get_signer_class
+    signer = get_signer_class(d.getVar('RPM_GPG_BACKEND', True))
+    err_msg = signer.check_sanity(d,
+                                  d.getVar('RPM_GPG_NAME', True),
+                                  d.getVar('RPM_GPG_PASSPHRASE_FILE', True))
+    if err_msg:
+        raise_sanity_error(err_msg %{'keyid': 'RPM_GPG_NAME',
+                                     'passphrase_file': 'RPM_GPG_PASSPHRASE_FILE'},
+                           d)
 
     # Set the expected location of the public key
     d.setVar('RPM_GPG_PUBKEY', os.path.join(d.getVar('STAGING_ETCDIR_NATIVE', False),
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 55abad8..8832ea9 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -14,6 +14,17 @@ class LocalSigner(object):
         self.gpg_path = d.getVar('GPG_PATH', True)
         self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpm")
 
+    @classmethod
+    def check_sanity(cls, d, keyid, passphrase_file):
+        """(Pre-)check the sanity of a configuration"""
+        msg = ""
+        missing_vars = ['%(keyid)s'] if not keyid else []
+        if not passphrase_file:
+            missing_vars.append('%(passphrase_file)s')
+        if missing_vars:
+            msg += "You need to define " + ' and '.join(missing_vars) + " in the config."
+        return msg
+
     def export_pubkey(self, output_file):
         """Export GPG public key to a file"""
         cmd = '%s --batch --yes --export --armor -o %s ' % \
@@ -66,11 +77,14 @@ class LocalSigner(object):
                                       (input_file, output))
 
 
-def get_signer(d, backend, keyid, passphrase_file):
-    """Get signer object for the specified backend"""
-    # Use local signing by default
+def get_signer_class(backend):
+    """Get signer class for the specified backend"""
     if backend == 'local':
-        return LocalSigner(d, keyid, passphrase_file)
+        return LocalSigner
     else:
         bb.fatal("Unsupported signing backend '%s'" % backend)
 
+
+def get_signer(d, backend, keyid, passphrase_file):
+    """Get signer object for the specified backend"""
+    return get_signer_class(backend)(keyid. passphrase_file)
-- 
2.6.2


