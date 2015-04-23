Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6656271144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 16:19:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 23 Apr 2015 09:18:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,632,1422950400"; d="scan'208";a="484753682"
Received: from kreynold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.159])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2015 09:18:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 17:18:26 +0100
Message-Id: <7a8541c7b74968fde9386b2edd7e974e7309ad49.1429805738.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429805738.git.paul.eggleton@linux.intel.com>
References: <cover.1429805738.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1429805738.git.paul.eggleton@linux.intel.com>
References: <cover.1429805738.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/8] oe-selftest: devtool: fix update-recipe test after bd1aa28
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
X-List-Received-Date: Thu, 23 Apr 2015 16:19:08 -0000

From: Markus Lehtonen <markus.lehtonen@linux.intel.com>

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
2.1.0


