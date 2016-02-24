Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB3776809
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:09:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 23 Feb 2016 21:09:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,492,1449561600"; d="scan'208";a="658305584"
Received: from sloi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.175])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2016 21:09:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 18:07:23 +1300
Message-Id: <404f0aa28866dbef1fdd2259f805cfb829bf16e4.1456290353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/14] devtool: upgrade: make source tree path optional
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
X-List-Received-Date: Wed, 24 Feb 2016 05:09:15 -0000

Make devtool upgrade consistent with devtool add/modify in defaulting to
sources/<recipename> under the workspace if no source tree path is
specified.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 0e53c82..a446c55 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -313,36 +313,44 @@ def upgrade(args, config, basepath, workspace):
     if pn in workspace:
         raise DevtoolError("recipe %s is already in your workspace" % pn)
 
+    if args.srctree:
+        srctree = os.path.abspath(args.srctree)
+    else:
+        srctree = standard.get_default_srctree(config, pn)
+
     standard._check_compatible_recipe(pn, rd)
     if rd.getVar('PV', True) == args.version and rd.getVar('SRCREV', True) == args.srcrev:
         raise DevtoolError("Current and upgrade versions are the same version" % version)
 
     rf = None
     try:
-        rev1 = standard._extract_source(args.srctree, False, 'devtool-orig', False, rd)
-        rev2, md5, sha256 = _extract_new_source(args.version, args.srctree, args.no_patch,
+        rev1 = standard._extract_source(srctree, False, 'devtool-orig', False, rd)
+        rev2, md5, sha256 = _extract_new_source(args.version, srctree, args.no_patch,
                                                 args.srcrev, args.branch, args.keep_temp,
                                                 tinfoil, rd)
         rf = _create_new_recipe(args.version, md5, sha256, args.srcrev, args.srcbranch, config.workspace_path, tinfoil, rd)
     except bb.process.CmdError as e:
-        _upgrade_error(e, rf, args.srctree)
+        _upgrade_error(e, rf, srctree)
     except DevtoolError as e:
-        _upgrade_error(e, rf, args.srctree)
+        _upgrade_error(e, rf, srctree)
     standard._add_md5(config, pn, os.path.dirname(rf))
 
-    af = _write_append(rf, args.srctree, args.same_dir, args.no_same_dir, rev2,
+    af = _write_append(rf, srctree, args.same_dir, args.no_same_dir, rev2,
                        config.workspace_path, rd)
     standard._add_md5(config, pn, af)
-    logger.info('Upgraded source extracted to %s' % args.srctree)
+    logger.info('Upgraded source extracted to %s' % srctree)
     return 0
 
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
+
+    defsrctree = standard.get_default_srctree(context.config)
+
     parser_upgrade = subparsers.add_parser('upgrade', help='Upgrade an existing recipe',
                                            description='Upgrades an existing recipe to a new upstream version. Puts the upgraded recipe file into the workspace along with any associated files, and extracts the source tree to a specified location (in case patches need rebasing or adding to as a result of the upgrade).',
                                            group='starting')
     parser_upgrade.add_argument('recipename', help='Name of recipe to upgrade (just name - no version, path or extension)')
-    parser_upgrade.add_argument('srctree', help='Path to where to extract the source tree')
+    parser_upgrade.add_argument('srctree',  nargs='?', help='Path to where to extract the source tree. If not specified, a subdirectory of %s will be used.' % defsrctree)
     parser_upgrade.add_argument('--version', '-V', help='Version to upgrade to (PV)')
     parser_upgrade.add_argument('--srcrev', '-S', help='Source revision to upgrade to (if fetching from an SCM such as git)')
     parser_upgrade.add_argument('--srcbranch', '-B', help='Branch in source repository containing the revision to use (if fetching from an SCM such as git)')
-- 
2.5.0


