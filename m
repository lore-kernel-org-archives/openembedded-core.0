Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3D08173627
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:40:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Feb 2015 08:40:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="680425613"
Received: from abarnicl-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.2.27])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2015 08:40:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 16:39:56 +0000
Message-Id: <79ea7048ae8046865e63c313c88d3569eadac84d.1424363815.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/15] devtool: add/modify: add option to build in same directory
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

The default behaviour is to build in a separate directory to the source,
however some projects can't be built this way, so add an option to do
that (or override the automatic behaviour in the case of modify).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index ae64840..d503111 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -77,6 +77,8 @@ def add(args, config, basepath, workspace):
     with open(appendfile, 'w') as f:
         f.write('inherit externalsrc\n')
         f.write('EXTERNALSRC = "%s"\n' % srctree)
+        if args.same_dir:
+            f.write('EXTERNALSRC_BUILD = "%s"\n' % srctree)
         if initial_rev:
             f.write('\n# initial_rev: %s\n' % initial_rev)
 
@@ -323,8 +325,11 @@ def modify(args, config, basepath, workspace):
         f.write('inherit externalsrc\n')
         f.write('# NOTE: We use pn- overrides here to avoid affecting multiple variants in the case where the recipe uses BBCLASSEXTEND\n')
         f.write('EXTERNALSRC_pn-%s = "%s"\n' % (args.recipename, srctree))
-        if bb.data.inherits_class('autotools-brokensep', rd):
-            logger.info('using source tree as build directory since original recipe inherits autotools-brokensep')
+        if args.same_dir or bb.data.inherits_class('autotools-brokensep', rd):
+            if args.same_dir:
+                logger.info('using source tree as build directory since --same-dir specified')
+            else:
+                logger.info('using source tree as build directory since original recipe inherits autotools-brokensep')
             f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (args.recipename, srctree))
         if initial_rev:
             f.write('\n# initial_rev: %s\n' % initial_rev)
@@ -503,6 +508,7 @@ def register_commands(subparsers, context):
                                        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
     parser_add.add_argument('recipename', help='Name for new recipe to add')
     parser_add.add_argument('srctree', help='Path to external source tree')
+    parser_add.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
     parser_add.add_argument('--version', '-V', help='Version to use within recipe (PV)')
     parser_add.set_defaults(func=add)
 
@@ -513,6 +519,7 @@ def register_commands(subparsers, context):
     parser_add.add_argument('srctree', help='Path to external source tree')
     parser_add.add_argument('--wildcard', '-w', action="store_true", help='Use wildcard for unversioned bbappend')
     parser_add.add_argument('--extract', '-x', action="store_true", help='Extract source as well')
+    parser_add.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
     parser_add.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (only when using -x)')
     parser_add.set_defaults(func=modify)
 
-- 
1.9.3


