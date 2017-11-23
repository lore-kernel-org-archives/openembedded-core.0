Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8160978558
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 15:30:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 07:30:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,441,1505804400"; 
   d="scan'208";a="8699563"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 23 Nov 2017 07:30:24 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2017 17:30:45 +0200
Message-Id: <20171123153046.16997-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH 1/2] devtool: add a 'latest-version' command
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
X-List-Received-Date: Thu, 23 Nov 2017 15:30:24 -0000

This command queries the upstream server for what the latest release is and prints
the output; it is a much neater way to find out these things than fumbling with distrodata,
'bitbake -c checkpkg' and awkward to read csv output in a file.

Examples:

python3 (tarballs):
NOTE: Current version: 3.5.3
NOTE: Latest version: 3.6.3

rpm (git):
NOTE: Current version: 4.13.90
NOTE: Latest version: 4.14.0
NOTE: Latest version's commit: da3720f62e57648fb1dc2a632744d38866139971

puzzles (git without version tags):
NOTE: Latest commit: ee8ea9b9785964694cb2b3ad77c3fb2460f49510

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index f6141bfdc38..445e0642460 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -498,6 +498,26 @@ def upgrade(args, config, basepath, workspace):
         tinfoil.shutdown()
     return 0
 
+def latest_version(args, config, basepath, workspace):
+    """Entry point for the devtool 'latest_version' subcommand"""
+    tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
+    try:
+        rd = parse_recipe(config, tinfoil, args.recipename, True)
+        if not rd:
+            return 1
+        version_info = oe.recipeutils.get_recipe_upstream_version(rd)
+        # "new-commits-available" is an indication that upstream never issues version tags
+        if not version_info['version'].endswith("new-commits-available"):
+            logger.info("Current version: {}".format(version_info['current_version']))
+            logger.info("Latest version: {}".format(version_info['version']))
+            if version_info['revision']:
+                logger.info("Latest version's commit: {}".format(version_info['revision']))
+        else:
+            logger.info("Latest commit: {}".format(version_info['revision']))
+    finally:
+        tinfoil.shutdown()
+    return 0
+
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
 
@@ -519,3 +539,9 @@ def register_commands(subparsers, context):
     group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
     parser_upgrade.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_upgrade.set_defaults(func=upgrade, fixed_setup=context.fixed_setup)
+
+    parser_latest_version = subparsers.add_parser('latest-version', help='Report the latest version of an existing recipe',
+                                                  description='Queries the upstream server for what the latest upstream release is (for git, tags are checked, for tarballs, a list of them is obtained, and one with the highest version number is reported)',
+                                                  group='info')
+    parser_latest_version.add_argument('recipename', help='Name of recipe to query (just name - no version, path or extension)')
+    parser_latest_version.set_defaults(func=latest_version)
-- 
2.15.0


