Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4DB996B6B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:40:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Feb 2015 08:40:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="680425620"
Received: from abarnicl-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.2.27])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2015 08:40:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 16:39:57 +0000
Message-Id: <931e329e01021f6b397a250f54b3a34c60f6cdc2.1424363815.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/15] devtool: reset: run bitbake -c clean on recipe
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
X-List-Received-Date: Thu, 19 Feb 2015 16:40:29 -0000

If you've added a new recipe, you want the output cleaned when you do
devtool reset, otherwise cruft from building the recipe may remain which
could interfere with future builds.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 4 ++++
 scripts/lib/devtool/standard.py   | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 74fb325..33f2e91 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -179,9 +179,13 @@ class DevtoolTests(oeSelfTest):
                 if line.startswith('.TH'):
                     self.assertEqual(line.rstrip(), '.TH MDADM 8 "" v9.999-custom', 'man file not modified')
         # Test devtool reset
+        stampprefix = get_bb_var('STAMP', 'mdadm')
         result = runCmd('devtool reset mdadm')
         result = runCmd('devtool status')
         self.assertNotIn('mdadm', result.output)
+        self.assertTrue(stampprefix, 'Unable to get STAMP value for recipe mdadm')
+        matches = glob.glob(stampprefix + '*')
+        self.assertFalse(matches, 'Stamp files exist for recipe mdadm that should have been cleaned')
 
     def test_devtool_update_recipe(self):
         # Check preconditions
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d503111..763177d 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -475,6 +475,11 @@ def reset(args, config, basepath, workspace):
     if not args.recipename in workspace:
         logger.error("no recipe named %s in your workspace" % args.recipename)
         return -1
+
+    if not args.no_clean:
+        logger.info('Cleaning sysroot for recipe %s...' % args.recipename)
+        exec_build_env_command(config.init_path, basepath, 'bitbake -c clean %s' % args.recipename)
+
     _check_preserve(config, args.recipename)
 
     preservepath = os.path.join(config.workspace_path, 'attic', args.recipename)
@@ -555,5 +560,6 @@ def register_commands(subparsers, context):
                                          description='Removes the specified recipe from your workspace (resetting its state)',
                                          formatter_class=argparse.ArgumentDefaultsHelpFormatter)
     parser_reset.add_argument('recipename', help='Recipe to reset')
+    parser_reset.add_argument('--no-clean', '-n', action="store_true", help='Don\'t clean the sysroot to remove recipe output')
     parser_reset.set_defaults(func=reset)
 
-- 
1.9.3


