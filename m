Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3CB017016E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 10:03:26 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2AA3QFB006373; Thu, 10 Mar 2016 04:03:26 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016031004032636-1226952 ;
	Thu, 10 Mar 2016 04:03:26 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 12:03:00 +0200
Message-Id: <3724d4688c55f5a3f7b85235374f9d432c965f04.1457603028.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <cover.1457603028.git.adrian.ratiu@ni.com>
References: <cover.1457603028.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/10/2016 04:03:26 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/10/2016 04:03:26 AM,
	Serialize complete at 03/10/2016 04:03:26 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-10_07:, , signatures=0
Subject: [PATCH v8 6/6] sign_package_feed: add feed signature type
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
X-List-Received-Date: Thu, 10 Mar 2016 10:03:26 -0000

Signing package feeds will default to ascii armored signatures (ASC) the
other option being binary (BIN). This is for both rpm and ipk backends.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/classes/sign_package_feed.bbclass | 12 +++++++++++-
 meta/lib/oe/package_manager.py         | 10 ++++++++--
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
index e1ec82e..31a6e9b 100644
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
@@ -20,13 +26,17 @@ inherit sanity
 
 PACKAGE_FEED_SIGN = '1'
 PACKAGE_FEED_GPG_BACKEND ?= 'local'
-
+PACKAGE_FEED_GPG_SIGNATURE_TYPE ?= 'ASC'
 
 python () {
     # Check sanity of configuration
     for var in ('PACKAGE_FEED_GPG_NAME', 'PACKAGE_FEED_GPG_PASSPHRASE_FILE'):
         if not d.getVar(var, True):
             raise_sanity_error("You need to define %s in the config" % var, d)
+
+    sigtype = d.getVar("PACKAGE_FEED_GPG_SIGNATURE_TYPE", True)
+    if sigtype.upper() != "ASC" and sigtype.upper() != "BIN":
+        raise_sanity_error("Bad value for PACKAGE_FEED_GPG_SIGNATURE_TYPE (%s), use either ASC or BIN" % sigtype)
 }
 
 do_package_index[depends] += "signing-keys:do_deploy"
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index dc49903..83f8de4 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -141,9 +141,12 @@ class RpmIndexer(Indexer):
         # Sign repomd
         if signer:
             for repomd in repomd_files:
+                feed_sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE', True)
+                is_ascii_sig = (feed_sig_type.upper() != "BIN")
                 signer.detach_sign(repomd,
                                    self.d.getVar('PACKAGE_FEED_GPG_NAME', True),
-                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True))
+                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True),
+                                   armor=is_ascii_sig)
 
 
 class OpkgIndexer(Indexer):
@@ -192,10 +195,13 @@ class OpkgIndexer(Indexer):
             bb.fatal('%s' % ('\n'.join(result)))
 
         if signer:
+            feed_sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE', True)
+            is_ascii_sig = (feed_sig_type.upper() != "BIN")
             for f in index_sign_files:
                 signer.detach_sign(f,
                                    self.d.getVar('PACKAGE_FEED_GPG_NAME', True),
-                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True))
+                                   self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True),
+                                   armor=is_ascii_sig)
 
 
 class DpkgIndexer(Indexer):
-- 
2.7.2


