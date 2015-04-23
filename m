Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EAB8773D0F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 16:19:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 23 Apr 2015 09:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,632,1422950400"; d="scan'208";a="484753679"
Received: from kreynold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.159])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2015 09:18:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 17:18:25 +0100
Message-Id: <28d47e5fbeedd5710bebc7d7d24176ca2830fa29.1429805738.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429805738.git.paul.eggleton@linux.intel.com>
References: <cover.1429805738.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1429805738.git.paul.eggleton@linux.intel.com>
References: <cover.1429805738.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/8] devtool: modify: implement --no-same-dir
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

This option can be used to have a separate build directory, in order to
keep the srctree directory clean for packages that do not need to be
built in the source directory.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index fbac34e..aa30a98 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -386,7 +386,10 @@ def modify(args, config, basepath, workspace):
         f.write('EXTERNALSRC_pn-%s = "%s"\n' % (args.recipename, srctree))
 
         b_is_s = True
-        if args.same_dir:
+        if args.no_same_dir:
+            logger.info('using separate build directory since --no-same-dir specified')
+            b_is_s = False
+        elif args.same_dir:
             logger.info('using source tree as build directory since --same-dir specified')
         elif bb.data.inherits_class('autotools-brokensep', rd):
             logger.info('using source tree as build directory since original recipe inherits autotools-brokensep')
@@ -664,7 +667,9 @@ def register_commands(subparsers, context):
     parser_modify.add_argument('srctree', help='Path to external source tree')
     parser_modify.add_argument('--wildcard', '-w', action="store_true", help='Use wildcard for unversioned bbappend')
     parser_modify.add_argument('--extract', '-x', action="store_true", help='Extract source as well')
-    parser_modify.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
+    group = parser_modify.add_mutually_exclusive_group()
+    group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
+    group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
     parser_modify.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (only when using -x)')
     parser_modify.set_defaults(func=modify)
 
-- 
2.1.0


