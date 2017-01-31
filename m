Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EA4E6772BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 22:43:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 31 Jan 2017 14:43:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,316,1477983600"; d="scan'208";a="1101358192"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2017 14:43:48 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 16:50:52 -0600
Message-Id: <145a8e75b8b595f8fde55fbde5d6329745869f0d.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 4/4] selftest/archiver: invalidate stamps instead of removing TMPDIR
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
X-List-Received-Date: Tue, 31 Jan 2017 22:43:48 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

There is no need to remove the whole TMPDIR, instead just invalidate
stamps and build again the targets.

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


