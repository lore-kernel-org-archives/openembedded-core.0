Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id E72A577250
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 15:46:07 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u1JFk3YR022629; Fri, 19 Feb 2016 09:46:07 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016021909460728-1165579 ;
	Fri, 19 Feb 2016 09:46:07 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 17:45:49 +0200
Message-Id: <c9edf12f0fbd436aa5dfa68aa787dd3955a846ad.1455895912.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1455895912.git.adrian.ratiu@ni.com>
References: <cover.1455895912.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/19/2016 09:46:07 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/19/2016 09:46:08 AM,
	Serialize complete at 02/19/2016 09:46:08 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-19_08:, , signatures=0
Subject: [PATCH v6 4/4] package_manager: sign IPK package feeds
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
X-List-Received-Date: Fri, 19 Feb 2016 15:46:08 -0000

Create gpg signed ipk package feeds using the gpg backend if configured.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/classes/sign_package_feed.bbclass | 12 +++++++++++-
 meta/lib/oe/package_manager.py         | 17 +++++++++++++++--
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
index 63ca02f..85c37f3 100644
--- a/meta/classes/sign_package_feed.bbclass
+++ b/meta/classes/sign_package_feed.bbclass
@@ -10,6 +10,12 @@
 #           Optional variable for specifying the backend to use for signing.
 #           Currently the only available option is 'local', i.e. local signing
 #           on the build host.
+# PACKAGE_FEED_GPG_SIGNATURE_TYPE
+#           Optional variable for specifying the type of gpg signature, can be:
+#               1. Ascii armored (ASC), default if not set
+#               2. Binary (BIN)
+#           This variable is only available for IPK feeds. It is ignored on
+#           other packaging backends.
 # GPG_BIN
 #           Optional variable for specifying the gpg binary/wrapper to use for
 #           signing.
@@ -20,7 +26,7 @@ inherit sanity
 
 PACKAGE_FEED_SIGN = '1'
 PACKAGE_FEED_GPG_BACKEND ?= 'local'
-
+PACKAGE_FEED_GPG_SIGNATURE_TYPE ?= 'ASC'
 
 python () {
     # Check sanity of configuration
@@ -28,6 +34,10 @@ python () {
         if not d.getVar(var, True):
             raise_sanity_error("You need to define %s in the config" % var, d)
 
+    sigtype = d.getVar("PACKAGE_FEED_GPG_SIGNATURE_TYPE", True)
+    if sigtype.upper() != "ASC" and sigtype.upper() != "BIN":
+        raise_sanity_error("Bad value for PACKAGE_FEED_GPG_SIGNATURE_TYPE (%s), use either ASC or BIN" % sigtype)
+
     # Set expected location of the public key
     d.setVar('PACKAGE_FEED_GPG_PUBKEY',
              os.path.join(d.getVar('STAGING_ETCDIR_NATIVE', False),
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index b30a4da..606ba24 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -163,11 +163,16 @@ class OpkgIndexer(Indexer):
                      "MULTILIB_ARCHS"]
 
         opkg_index_cmd = bb.utils.which(os.getenv('PATH'), "opkg-make-index")
+        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
+            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND', True))
+        else:
+            signer = None
 
         if not os.path.exists(os.path.join(self.deploy_dir, "Packages")):
             open(os.path.join(self.deploy_dir, "Packages"), "w").close()
 
         index_cmds = []
+        index_sign_files = []
         for arch_var in arch_vars:
             archs = self.d.getVar(arch_var, True)
             if archs is None:
@@ -186,6 +191,8 @@ class OpkgIndexer(Indexer):
                 index_cmds.append('%s -r %s -p %s -m %s' %
                                   (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
 
+                index_sign_files.append(pkgs_file)
+
         if len(index_cmds) == 0:
             bb.note("There are no packages in %s!" % self.deploy_dir)
             return
@@ -193,9 +200,15 @@ class OpkgIndexer(Indexer):
         result = oe.utils.multiprocess_exec(index_cmds, create_index)
         if result:
             bb.fatal('%s' % ('\n'.join(result)))
-        if self.d.getVar('PACKAGE_FEED_SIGN', True) == '1':
-            raise NotImplementedError('Package feed signing not implementd for ipk')
 
+        if signer:
+            feed_sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE', True)
+            is_ascii_sig = (feed_sig_type.upper() != "BIN")
+            for f in index_sign_files:
+                signer.detach_sign(f,
+                                   self.d.getVar('PACKAGE_FEED_GPG_NAME', True),
+                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True),
+                                   armor=is_ascii_sig)
 
 
 class DpkgIndexer(Indexer):
-- 
2.7.1


