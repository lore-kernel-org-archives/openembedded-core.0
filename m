Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9ABE77893C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 09:45:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 02:45:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,330,1517904000"; d="scan'208";a="209440004"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 19 Mar 2018 02:45:20 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2018 11:38:27 +0200
Message-Id: <20180319093827.1299-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH] package-index: index also subdirectories when using rpm
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
X-List-Received-Date: Mon, 19 Mar 2018 09:45:20 -0000

Previously only the top-level index was created, which did not
work if PACKAGE_FEED_ARCHS whitelisting (or explicitly listing
architectures in dnf repo files by hand) was in use:
https://lists.yoctoproject.org/pipermail/yocto/2018-March/040327.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12419

[YOCTO #12419]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 0c5cf3cf7f3..b0c1ff5471b 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -101,13 +101,16 @@ class Indexer(object, metaclass=ABCMeta):
 
 class RpmIndexer(Indexer):
     def write_index(self):
+        self.do_write_index(self.deploy_dir)
+
+    def do_write_index(self, deploy_dir):
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
             signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
         else:
             signer = None
 
         createrepo_c = bb.utils.which(os.environ['PATH'], "createrepo_c")
-        result = create_index("%s --update -q %s" % (createrepo_c, self.deploy_dir))
+        result = create_index("%s --update -q %s" % (createrepo_c, deploy_dir))
         if result:
             bb.fatal(result)
 
@@ -115,11 +118,22 @@ class RpmIndexer(Indexer):
         if signer:
             sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE')
             is_ascii_sig = (sig_type.upper() != "BIN")
-            signer.detach_sign(os.path.join(self.deploy_dir, 'repodata', 'repomd.xml'),
+            signer.detach_sign(os.path.join(deploy_dir, 'repodata', 'repomd.xml'),
                                self.d.getVar('PACKAGE_FEED_GPG_NAME'),
                                self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
                                armor=is_ascii_sig)
 
+class RpmSubdirIndexer(RpmIndexer):
+    def write_index(self):
+        bb.note("Generating package index for %s" %(self.deploy_dir))
+        self.do_write_index(self.deploy_dir)
+        for entry in os.walk(self.deploy_dir):
+            if os.path.samefile(self.deploy_dir, entry[0]):
+                for dir in entry[1]:
+                    if dir != 'repodata':
+                        dir_path = oe.path.join(self.deploy_dir, dir)
+                        bb.note("Generating package index for %s" %(dir_path))
+                        self.do_write_index(dir_path)
 
 class OpkgIndexer(Indexer):
     def write_index(self):
@@ -1688,7 +1702,7 @@ def generate_index_files(d):
     classes = d.getVar('PACKAGE_CLASSES').replace("package_", "").split()
 
     indexer_map = {
-        "rpm": (RpmIndexer, d.getVar('DEPLOY_DIR_RPM')),
+        "rpm": (RpmSubdirIndexer, d.getVar('DEPLOY_DIR_RPM')),
         "ipk": (OpkgIndexer, d.getVar('DEPLOY_DIR_IPK')),
         "deb": (DpkgIndexer, d.getVar('DEPLOY_DIR_DEB'))
     }
-- 
2.16.1


