Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 02E1971DDD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 20:21:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2017 12:21:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,326,1477983600"; d="scan'208";a="1102290928"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2017 12:21:39 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2017 14:28:48 -0600
Message-Id: <1486067328-17841-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2] selftest/archiver: invalidate stamps instead of removing TMPDIR
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
X-List-Received-Date: Thu, 02 Feb 2017 20:21:50 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

There is no need to remove the whole TMPDIR, instead just invalidate
stamps and build again the targets.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/archiver.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/archiver.py b/meta/lib/oeqa/selftest/archiver.py
index 97b6f5b..0af9634 100644
--- a/meta/lib/oeqa/selftest/archiver.py
+++ b/meta/lib/oeqa/selftest/archiver.py
@@ -28,8 +28,13 @@ class Archiver(oeSelfTest):
         features += 'COPYLEFT_PN_EXCLUDE = "%s"\n' % exclude_recipe
         self.write_config(features)
 
-        shutil.rmtree(get_bb_var('TMPDIR'))
-        bitbake("%s %s" % (include_recipe, exclude_recipe))
+        # build again include/exclude recipes
+        bitbake("-C fetch %s" % include_recipe)
+        bitbake("-C fetch %s" % exclude_recipe)
+
+        # clean output files and stamps
+        bitbake("-c clean %s" % include_recipe)
+        bitbake("-c clean %s" % exclude_recipe)
 
         src_path = os.path.join(get_bb_var('DEPLOY_DIR_SRC'), get_bb_var('TARGET_SYS'))
 
-- 
2.1.4


