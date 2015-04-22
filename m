Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C79BB71144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 13:27:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2015 06:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,623,1422950400"; d="scan'208";a="484177544"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Apr 2015 06:27:39 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Apr 2015 16:27:38 +0300
Message-Id: <1429709258-19542-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH] devtool: tests: fix update-recipe test after bd1aa28
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
X-List-Received-Date: Wed, 22 Apr 2015 13:27:59 -0000

Number of patches in mtd-utils changed in changeset bd1aa28.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index dc1cf21..aa5bd76 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -397,19 +397,26 @@ class DevtoolTests(oeSelfTest):
         result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
         self.assertNotEqual(result.output.strip(), "", '%s recipe should be modified' % testrecipe)
         status = result.output.splitlines()
-        self.assertEqual(len(status), 3, 'Less/more files modified than expected. Entire status:\n%s' % result.output)
+        self.assertEqual(len(status), 4, 'Less/more files modified than expected. Entire status:\n%s' % result.output)
         for line in status:
             if line.endswith('add-exclusion-to-mkfs-jffs2-git-2.patch'):
                 self.assertEqual(line[:3], ' D ', 'Unexpected status in line: %s' % line)
             elif line.endswith('fix-armv7-neon-alignment.patch'):
                 self.assertEqual(line[:3], ' D ', 'Unexpected status in line: %s' % line)
+            elif line.endswith('-duplicate-hashtable_iterator_value-.patch'):
+                self.assertEqual(line[:3], ' D ', 'Unexpected status in line: %s' % line)
             elif re.search('%s_[^_]*.bb$' % testrecipe, line):
                 self.assertEqual(line[:3], ' M ', 'Unexpected status in line: %s' % line)
             else:
                 raise AssertionError('Unexpected modified file in status: %s' % line)
         result = runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
         addlines = ['SRCREV = ".*"', 'SRC_URI = "git://git.infradead.org/mtd-utils.git"']
-        removelines = ['SRCREV = ".*"', 'SRC_URI = "git://git.infradead.org/mtd-utils.git \\\\', 'file://add-exclusion-to-mkfs-jffs2-git-2.patch \\\\', 'file://fix-armv7-neon-alignment.patch \\\\', '"']
+        removelines = ['SRCREV = ".*"',
+                       'SRC_URI = "git://git.infradead.org/mtd-utils.git \\\\',
+                       'file://add-exclusion-to-mkfs-jffs2-git-2.patch \\\\',
+                       'file://fix-armv7-neon-alignment.patch \\\\',
+                       'file://0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch \\\\',
+                       '"']
         for line in result.output.splitlines():
             if line.startswith('+++') or line.startswith('---'):
                 continue
-- 
2.1.4


