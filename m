Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD26786F8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 12:57:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2017 04:57:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,364,1508828400"; d="scan'208";a="1252099989"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2017 04:57:26 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:57:45 +0200
Message-Id: <ed1b8f1086e1653f5bb4704a1cb052c6cf194b4d.1512478515.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1512478515.git.alexander.kanavin@linux.intel.com>
References: <cover.1512478515.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/13] devtool: add a 'latest-version' command
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
X-List-Received-Date: Tue, 05 Dec 2017 12:57:25 -0000

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


