Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 330066D159
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 15:21:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 29 Oct 2013 08:18:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,593,1378882800"; d="scan'208";a="419166475"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.13])
	by fmsmga001.fm.intel.com with ESMTP; 29 Oct 2013 08:21:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2013 15:21:52 +0000
Message-Id: <1383060112-7835-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] scripts/oe-pkgdata-util: fix global name 'debug' is not defined
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
X-List-Received-Date: Tue, 29 Oct 2013 15:21:56 -0000

This global variable is no longer present, so pass in the value
specified via the command line.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-pkgdata-util | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 80cacc5..17e946e 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -28,8 +28,7 @@ import re
 import optparse
 from collections import defaultdict
 
-
-def glob(args, usage):
+def glob(args, usage, debug=False):
     if len(args) < 3:
         usage()
         sys.exit(1)
@@ -148,7 +147,7 @@ def glob(args, usage):
 
     print("\n".join(mappedpkgs))
 
-def read_value(args, usage):
+def read_value(args, usage, debug=False):
     if len(args) < 3:
         usage()
         sys.exit(1)
@@ -187,7 +186,7 @@ def read_value(args, usage):
                 qvar = "%s_%s" % (var, mappedpkg)
             print(readvar(revlink, qvar))
 
-def lookup_pkg(args, usage):
+def lookup_pkg(args, usage, debug=False):
     if len(args) < 2:
         usage()
         sys.exit(1)
@@ -219,7 +218,7 @@ def lookup_pkg(args, usage):
         items.extend(mappings.get(pkg, []))
     print '\n'.join(items)
 
-def lookup_recipe(args, usage):
+def lookup_recipe(args, usage, debug=False):
     if len(args) < 2:
         usage()
         sys.exit(1)
@@ -251,7 +250,7 @@ def lookup_recipe(args, usage):
         items.extend(mappings.get(pkg, []))
     print '\n'.join(items)
 
-def find_path(args, usage):
+def find_path(args, usage, debug=False):
     if len(args) < 2:
         usage()
         sys.exit(1)
@@ -306,7 +305,7 @@ Available commands:
 
     parser.add_option("-d", "--debug",
             help = "Report all SRCREV values, not just ones where AUTOREV has been used",
-            action="store_true", dest="debug")
+            action="store_true", dest="debug", default=False)
 
     options, args = parser.parse_args(sys.argv)
     args = args[1:]
@@ -316,15 +315,15 @@ Available commands:
         sys.exit(1)
 
     if args[0] == "glob":
-        glob(args[1:], parser.print_help)
+        glob(args[1:], parser.print_help, options.debug)
     elif args[0] == "lookup-pkg":
-        lookup_pkg(args[1:], parser.print_help)
+        lookup_pkg(args[1:], parser.print_help, options.debug)
     elif args[0] == "lookup-recipe":
-        lookup_recipe(args[1:], parser.print_help)
+        lookup_recipe(args[1:], parser.print_help, options.debug)
     elif args[0] == "find-path":
-        find_path(args[1:], parser.print_help)
+        find_path(args[1:], parser.print_help, options.debug)
     elif args[0] == "read-value":
-        read_value(args[1:], parser.print_help)
+        read_value(args[1:], parser.print_help, options.debug)
     else:
         parser.print_help()
         sys.exit(1)
-- 
1.8.1.2


