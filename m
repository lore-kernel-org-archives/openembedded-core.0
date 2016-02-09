Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 23F256FFDA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 14:22:42 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u19EMhbN029241 for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Feb 2016 08:22:43 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020908224309-790916 ;
	Tue, 9 Feb 2016 08:22:43 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 9 Feb 2016 16:22:26 +0200
Message-Id: <63b585477825b24809430439c86fcc78555ad6a2.1455027565.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1455027565.git.adrian.ratiu@ni.com>
References: <cover.1455027565.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/09/2016 08:22:43 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/09/2016 08:22:43 AM,
	Serialize complete at 02/09/2016 08:22:43 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-09_09:, , signatures=0
Subject: [PATCH v4 1/3] gpg_sign: add support for gpg signature types
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
X-List-Received-Date: Tue, 09 Feb 2016 14:22:43 -0000

ASC = ascii armoured, BIN = binary

Create new variables + parameters to the gpg signer module to specify
which type of gpg signature to generate (ASC or BIN).

The rpm backend has already implemented signatures which default to
binary, so its behaviour is unchanged by this.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/classes/sign_package_feed.bbclass | 10 +++++++++-
 meta/classes/sign_rpm.bbclass          | 12 +++++++++++-
 meta/lib/oe/gpg_sign.py                | 13 +++++++++----
 meta/lib/oe/package_manager.py         |  3 ++-
 meta/recipes-core/meta/signing-keys.bb |  6 ++++--
 5 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
index d5df8af..4e703f2 100644
--- a/meta/classes/sign_package_feed.bbclass
+++ b/meta/classes/sign_package_feed.bbclass
@@ -10,6 +10,10 @@
 #           Optional variable for specifying the backend to use for signing.
 #           Currently the only available option is 'local', i.e. local signing
 #           on the build host.
+# PACKAGE_FEED_GPG_SIGNATURE_TYPE
+#           Optional variable for specifying the type of gpg signature, can be:
+#               1. Ascii armored (ASC), default if not set
+#               2. Binary (BIN)
 # GPG_BIN
 #           Optional variable for specifying the gpg binary/wrapper to use for
 #           signing.
@@ -20,7 +24,7 @@ inherit sanity
 
 PACKAGE_FEED_SIGN = '1'
 PACKAGE_FEED_GPG_BACKEND ?= 'local'
-
+PACKAGE_FEED_GPG_SIGNATURE_TYPE ?= 'ASC'
 
 python () {
     # Check sanity of configuration
@@ -28,6 +32,10 @@ python () {
         if not d.getVar(var, True):
             raise_sanity_error("You need to define %s in the config" % var, d)
 
+    sigtype = d.getVar("PACKAGE_FEED_GPG_SIGNATURE_TYPE", True)
+    if sigtype.upper() != "ASC" and sigtype.upper() != "BIN":
+        raise_sanity_error("Bad value for PACKAGE_FEED_GPG_SIGNATURE_TYPE (%s), use either ASC or BIN" % sigtype)
+
     # Set expected location of the public key
     d.setVar('PACKAGE_FEED_GPG_PUBKEY',
              os.path.join(d.getVar('STAGING_ETCDIR_NATIVE', False),
diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index 8bcabee..840b6ca 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -9,6 +9,10 @@
 #           Optional variable for specifying the backend to use for signing.
 #           Currently the only available option is 'local', i.e. local signing
 #           on the build host.
+# RPM_GPG_SIGNATURE_TYPE
+#           Optional variable for specifying the type of gpg signatures, can be:
+#                     1. Ascii armored (ASC), default if not set
+#                     2. Binary (BIN)
 # GPG_BIN
 #           Optional variable for specifying the gpg binary/wrapper to use for
 #           signing.
@@ -19,6 +23,7 @@ inherit sanity
 
 RPM_SIGN_PACKAGES='1'
 RPM_GPG_BACKEND ?= 'local'
+RPM_GPG_SIGNATURE_TYPE ?= 'BIN'
 
 
 python () {
@@ -27,6 +32,10 @@ python () {
         if not d.getVar(var, True):
             raise_sanity_error("You need to define %s in the config" % var, d)
 
+    sigtype = d.getVar("RPM_GPG_SIGNATURE_TYPE", True)
+    if sigtype.upper() != "ASC" and sigtype.upper() != "BIN":
+        raise_sanity_error("Bad value for RPM_GPG_SIGNATURE_TYPE (%s), use either ASC or BIN" % sigtype)
+
     # Set the expected location of the public key
     d.setVar('RPM_GPG_PUBKEY', os.path.join(d.getVar('STAGING_ETCDIR_NATIVE', False),
                                             'RPM-GPG-PUBKEY'))
@@ -39,7 +48,8 @@ python sign_rpm () {
     signer = get_signer(d,
                         d.getVar('RPM_GPG_BACKEND', True),
                         d.getVar('RPM_GPG_NAME', True),
-                        d.getVar('RPM_GPG_PASSPHRASE_FILE', True))
+                        d.getVar('RPM_GPG_PASSPHRASE_FILE', True),
+                        d.getVar('RPM_GPG_SIGNATURE_TYPE', True))
     rpms = glob.glob(d.getVar('RPM_PKGWRITEDIR', True) + '/*')
 
     signer.sign_rpms(rpms)
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 55abad8..d971d32 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -6,9 +6,10 @@ import oe.utils
 
 class LocalSigner(object):
     """Class for handling local (on the build host) signing"""
-    def __init__(self, d, keyid, passphrase_file):
+    def __init__(self, d, keyid, passphrase_file, signature_type):
         self.keyid = keyid
         self.passphrase_file = passphrase_file
+        self.gpg_sig_type = signature_type
         self.gpg_bin = d.getVar('GPG_BIN', True) or \
                   bb.utils.which(os.getenv('PATH'), 'gpg')
         self.gpg_path = d.getVar('GPG_PATH', True)
@@ -16,10 +17,12 @@ class LocalSigner(object):
 
     def export_pubkey(self, output_file):
         """Export GPG public key to a file"""
-        cmd = '%s --batch --yes --export --armor -o %s ' % \
+        cmd = '%s --batch --yes --export -o %s ' % \
                 (self.gpg_bin, output_file)
         if self.gpg_path:
             cmd += "--homedir %s " % self.gpg_path
+        if self.gpg_sig_type == "ASC":
+            cmd += "-a "
         cmd += self.keyid
         status, output = oe.utils.getstatusoutput(cmd)
         if status:
@@ -59,6 +62,8 @@ class LocalSigner(object):
                   (self.gpg_bin, self.passphrase_file, self.keyid)
         if self.gpg_path:
             gpg_cmd += "--homedir %s " % self.gpg_path
+        if self.gpg_sig_type == "ASC":
+            cmd += "-a "
         cmd += input_file
         status, output = oe.utils.getstatusoutput(cmd)
         if status:
@@ -66,11 +71,11 @@ class LocalSigner(object):
                                       (input_file, output))
 
 
-def get_signer(d, backend, keyid, passphrase_file):
+def get_signer(d, backend, keyid, passphrase_file, signature_type):
     """Get signer object for the specified backend"""
     # Use local signing by default
     if backend == 'local':
-        return LocalSigner(d, keyid, passphrase_file)
+        return LocalSigner(d, keyid, passphrase_file, signature_type)
     else:
         bb.fatal("Unsupported signing backend '%s'" % backend)
 
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 26f6466..7ea523a 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -113,7 +113,8 @@ class RpmIndexer(Indexer):
             signer = get_signer(self.d,
                                 self.d.getVar('PACKAGE_FEED_GPG_BACKEND', True),
                                 self.d.getVar('PACKAGE_FEED_GPG_NAME', True),
-                                self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True))
+                                self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True),
+                                self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE', True))
         else:
             signer = None
         index_cmds = []
diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index d7aa79d..82c8c59 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -29,7 +29,8 @@ python do_export_public_keys () {
         signer = get_signer(d,
                             d.getVar('RPM_GPG_BACKEND', True),
                             d.getVar('RPM_GPG_NAME', True),
-                            d.getVar('RPM_GPG_PASSPHRASE_FILE', True))
+                            d.getVar('RPM_GPG_PASSPHRASE_FILE', True),
+                            d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE', True))
         signer.export_pubkey(d.getVar('RPM_GPG_PUBKEY', True))
 
     if d.getVar('PACKAGE_FEED_SIGN', True) == '1':
@@ -37,7 +38,8 @@ python do_export_public_keys () {
         signer = get_signer(d,
                             d.getVar('PACKAGE_FEED_GPG_BACKEND', True),
                             d.getVar('PACKAGE_FEED_GPG_NAME', True),
-                            d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True))
+                            d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True),
+                            d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE', True))
         signer.export_pubkey(d.getVar('PACKAGE_FEED_GPG_PUBKEY', True))
 }
 addtask do_export_public_keys before do_build
-- 
2.7.0


