Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0D85271C8A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 17:58:12 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP; 01 Feb 2017 09:58:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,321,1477983600"; d="scan'208";a="60701864"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by fmsmga006.fm.intel.com with ESMTP; 01 Feb 2017 09:58:12 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 12:05:23 -0600
Message-Id: <1485972323-9884-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] selftest/archiver: invalidate stamps instead of removing TMPDIR
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
X-List-Received-Date: Wed, 01 Feb 2017 17:58:13 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

There is no need to remove the whole TMPDIR, instead just invalidate
stamps and build again the targets. Local runs demostrate the patch reduces
the execution time considerably (see below), indicating the extra work done
by rmtree. In the other hand, the following checks after archiver were affected
because they started from a clean TMPDIR.

Before:
2017-01-31 17:39:39 -   test_archiver_allows_to_filter_on_recipe_name (oeqa.selftest.archiver.Archiver) ... OK (468.928s)

After:
2017-01-31 18:00:08 -   test_archiver_allows_to_filter_on_recipe_name (oeqa.selftest.archiver.Archiver) ... OK (297.524s)

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/archiver.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/archiver.py b/meta/lib/oeqa/selftest/archiver.py
index 97b6f5b..c8c4533 100644
--- a/meta/lib/oeqa/selftest/archiver.py
+++ b/meta/lib/oeqa/selftest/archiver.py
@@ -28,8 +28,8 @@ class Archiver(oeSelfTest):
         features += 'COPYLEFT_PN_EXCLUDE = "%s"\n' % exclude_recipe
         self.write_config(features)
 
-        shutil.rmtree(get_bb_var('TMPDIR'))
-        bitbake("%s %s" % (include_recipe, exclude_recipe))
+        bitbake("-C fetch %s" % include_recipe)
+        bitbake("-C fetch %s" % exclude_recipe)
 
         src_path = os.path.join(get_bb_var('DEPLOY_DIR_SRC'), get_bb_var('TARGET_SYS'))
 
-- 
2.1.4


