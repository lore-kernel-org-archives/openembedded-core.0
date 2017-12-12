Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D16F378863
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 02:27:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2017 18:27:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,393,1508828400"; d="scan'208";a="183413065"
Received: from ktan48-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.42])
	by orsmga005.jf.intel.com with ESMTP; 11 Dec 2017 18:27:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Dec 2017 15:26:19 +1300
Message-Id: <b97da63db9ef2e00192b600b8720247a95878a4d.1513045482.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1513045482.git.paul.eggleton@linux.intel.com>
References: <cover.1513045482.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] oe-selftest: devtool: switch away from mkelfimage
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
X-List-Received-Date: Tue, 12 Dec 2017 02:27:16 -0000

mkelfimage is about to be removed, so test_devtool_modify_git needs to
use a different recipe. psplash is a reasonable choice given it uses a
git repository (and probably will forever), and doesn't have too many
dependencies, so change the test to use that recipe instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 8a1e685..6989de9 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -611,7 +611,7 @@ class DevtoolTests(DevtoolBase):
     @OETestID(1165)
     def test_devtool_modify_git(self):
         # Check preconditions
-        testrecipe = 'mkelfimage'
+        testrecipe = 'psplash'
         src_uri = get_bb_var('SRC_URI', testrecipe)
         self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
         # Clean up anything in the workdir/sysroot/sstate cache
@@ -623,9 +623,9 @@ class DevtoolTests(DevtoolBase):
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
         result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
-        self.assertExists(os.path.join(tempdir, 'Makefile'), 'Extracted source could not be found')
+        self.assertExists(os.path.join(tempdir, 'Makefile.am'), 'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created. devtool output: %s' % result.output)
-        matches = glob.glob(os.path.join(self.workspacedir, 'appends', 'mkelfimage_*.bbappend'))
+        matches = glob.glob(os.path.join(self.workspacedir, 'appends', 'psplash_*.bbappend'))
         self.assertTrue(matches, 'bbappend not created')
         # Test devtool status
         result = runCmd('devtool status')
-- 
2.9.5


