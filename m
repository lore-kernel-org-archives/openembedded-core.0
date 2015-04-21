Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7C03F60167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 14:52:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Apr 2015 07:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,616,1422950400"; d="scan'208";a="483717962"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2015 07:52:22 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 17:52:20 +0300
Message-Id: <1429627940-29049-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1429627940-29049-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1429627940-29049-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] devtool: modify: implement --no-same-dir
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
X-List-Received-Date: Tue, 21 Apr 2015 14:52:21 -0000

This option can be used to have a separate build directory, in order to
keep the srctree directory clean for packages that do not need to be
built in the source directory.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 1c1bce8..d7082d3 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -393,7 +393,10 @@ def modify(args, config, basepath, workspace):
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
@@ -670,7 +673,9 @@ def register_commands(subparsers, context):
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
2.1.4


