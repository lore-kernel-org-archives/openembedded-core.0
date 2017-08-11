Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8847F785D6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 15:35:33 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Aug 2017 08:35:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,358,1498546800"; d="scan'208";a="299051666"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2017 08:35:34 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 18:35:24 +0300
Message-Id: <893ed5f67475f1a7925a1dcbd2eb357f1f6bc1da.1502465021.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1502465021.git.markus.lehtonen@linux.intel.com>
References: <cover.1502465021.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 1/7] lib/oe/package_manager: re-implement rpm feed signing
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
X-List-Received-Date: Fri, 11 Aug 2017 15:35:33 -0000

[YOCTO #11209]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 518cf8dbe3..942f2dd903 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -104,13 +104,25 @@ class Indexer(object, metaclass=ABCMeta):
 class RpmIndexer(Indexer):
     def write_index(self):
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
-            raise NotImplementedError('Package feed signing not yet implementd for rpm')
+            signer = get_signer(self.d, self.d.getVar('PACKAGE_FEED_GPG_BACKEND'))
+        else:
+            signer = None
 
         createrepo_c = bb.utils.which(os.environ['PATH'], "createrepo_c")
         result = create_index("%s --update -q %s" % (createrepo_c, self.deploy_dir))
         if result:
             bb.fatal(result)
 
+        # Sign repomd
+        if signer:
+            sig_type = self.d.getVar('PACKAGE_FEED_GPG_SIGNATURE_TYPE')
+            is_ascii_sig = (sig_type.upper() != "BIN")
+            signer.detach_sign(os.path.join(self.deploy_dir, 'repodata', 'repomd.xml'),
+                               self.d.getVar('PACKAGE_FEED_GPG_NAME'),
+                               self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
+                               armor=is_ascii_sig)
+
+
 class OpkgIndexer(Indexer):
     def write_index(self):
         arch_vars = ["ALL_MULTILIB_PACKAGE_ARCHS",
-- 
2.12.3


