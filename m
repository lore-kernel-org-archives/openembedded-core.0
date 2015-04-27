Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8757D73D41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 09:53:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2015 02:53:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,656,1422950400"; d="scan'208";a="562337829"
Received: from dmoore26-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.219])
	by orsmga003.jf.intel.com with ESMTP; 27 Apr 2015 02:53:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Apr 2015 10:53:15 +0100
Message-Id: <6dba7eb976da619b0603efec083ca66583463d43.1430128109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430128109.git.paul.eggleton@linux.intel.com>
References: <cover.1430128109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1430128109.git.paul.eggleton@linux.intel.com>
References: <cover.1430128109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 3/9] oe-selftest: devtool: fix test_devtool_update_recipe_git
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
X-List-Received-Date: Mon, 27 Apr 2015 09:53:31 -0000

Make this test work after recent changes to the mtd-utils recipe, and
hopefully make it robust against any future changes.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index dc1cf21..1a5eecd 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -370,6 +370,11 @@ class DevtoolTests(oeSelfTest):
         recipefile = get_bb_var('FILE', testrecipe)
         src_uri = get_bb_var('SRC_URI', testrecipe)
         self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
+        patches = []
+        for entry in src_uri.split():
+            if entry.startswith('file://') and entry.endswith('.patch'):
+                patches.append(entry[7:].split(';')[0])
+        self.assertGreater(len(patches), 0, 'The %s recipe does not appear to contain any patches, so this test will not be effective' % testrecipe)
         result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
         self.assertEqual(result.output.strip(), "", '%s recipe is not clean' % testrecipe)
         # First, modify a recipe
@@ -397,19 +402,22 @@ class DevtoolTests(oeSelfTest):
         result = runCmd('git status . --porcelain', cwd=os.path.dirname(recipefile))
         self.assertNotEqual(result.output.strip(), "", '%s recipe should be modified' % testrecipe)
         status = result.output.splitlines()
-        self.assertEqual(len(status), 3, 'Less/more files modified than expected. Entire status:\n%s' % result.output)
         for line in status:
-            if line.endswith('add-exclusion-to-mkfs-jffs2-git-2.patch'):
-                self.assertEqual(line[:3], ' D ', 'Unexpected status in line: %s' % line)
-            elif line.endswith('fix-armv7-neon-alignment.patch'):
-                self.assertEqual(line[:3], ' D ', 'Unexpected status in line: %s' % line)
-            elif re.search('%s_[^_]*.bb$' % testrecipe, line):
-                self.assertEqual(line[:3], ' M ', 'Unexpected status in line: %s' % line)
+            for patch in patches:
+                if line.endswith(patch):
+                    self.assertEqual(line[:3], ' D ', 'Unexpected status in line: %s' % line)
+                    break
             else:
-                raise AssertionError('Unexpected modified file in status: %s' % line)
+                if re.search('%s_[^_]*.bb$' % testrecipe, line):
+                    self.assertEqual(line[:3], ' M ', 'Unexpected status in line: %s' % line)
+                else:
+                    raise AssertionError('Unexpected modified file in status: %s' % line)
         result = runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
         addlines = ['SRCREV = ".*"', 'SRC_URI = "git://git.infradead.org/mtd-utils.git"']
-        removelines = ['SRCREV = ".*"', 'SRC_URI = "git://git.infradead.org/mtd-utils.git \\\\', 'file://add-exclusion-to-mkfs-jffs2-git-2.patch \\\\', 'file://fix-armv7-neon-alignment.patch \\\\', '"']
+        srcurilines = src_uri.split()
+        srcurilines[0] = 'SRC_URI = "' + srcurilines[0]
+        srcurilines.append('"')
+        removelines = ['SRCREV = ".*"'] + srcurilines
         for line in result.output.splitlines():
             if line.startswith('+++') or line.startswith('---'):
                 continue
-- 
2.1.0


