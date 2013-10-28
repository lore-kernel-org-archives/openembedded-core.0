Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5C76D456
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 17:12:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Oct 2013 10:12:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,587,1378882800"; d="scan'208";a="418613118"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.120.252])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2013 10:12:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 17:11:55 +0000
Message-Id: <feb317513fff638ad7abdba8ab34b8413f0ab055.1382980153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1382980153.git.paul.eggleton@linux.intel.com>
References: <cover.1382980153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1382980153.git.paul.eggleton@linux.intel.com>
References: <cover.1382980153.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/6] scripts/oe-pkgdata-util: improve help text and command line parsing
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
X-List-Received-Date: Mon, 28 Oct 2013 17:12:13 -0000

* Use optparse to parse command line
* Make help text actually helpful by describing what each command does
* Drop comment at the top listing the commands which is now superfluous

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-pkgdata-util | 78 ++++++++++++++++++++++++-------------------------
 1 file changed, 38 insertions(+), 40 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index c0fd50d..e34fcbe 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -4,7 +4,7 @@
 #
 # Written by: Paul Eggleton <paul.eggleton@linux.intel.com>
 #
-# Copyright 2012 Intel Corporation
+# Copyright 2012-2013 Intel Corporation
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -19,28 +19,16 @@
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 #
-#
-# Currently only has two functions:
-# 1) glob - mapping of packages to their dev/dbg/doc/locale etc. counterparts.
-# 2) read-value - mapping of packagenames to their location in
-#    pkgdata and then returns value of selected variable (e.g. PKGSIZE)
-# Could be extended in future to perform other useful querying functions on the
-# pkgdata though.
-#
 
 import sys
 import os
 import os.path
 import fnmatch
 import re
-
-def usage():
-    print("syntax: oe-pkgdata-util glob [-d] <pkgdatadir> <pkglist> \"<globs>\"\n \
-                    read-value [-d] <pkgdatadir> <value-name> \"<pkgs>\"");
-
+import optparse
 
 
-def glob(args):
+def glob(args, usage):
     if len(args) < 3:
         usage()
         sys.exit(1)
@@ -151,7 +139,7 @@ def glob(args):
 
     print("\n".join(mappedpkgs))
 
-def read_value(args):
+def read_value(args, usage):
     if len(args) < 3:
         usage()
         sys.exit(1)
@@ -186,28 +174,38 @@ def read_value(args):
                 qvar = "%s_%s" % (var, mappedpkg)
             print(readvar(revlink, qvar))
 
-# Too lazy to use getopt
-debug = False
-noopt = False
-args = []
-for arg in sys.argv[1:]:
-    if arg == "--":
-        noopt = True
+
+def main():
+    parser = optparse.OptionParser(
+        usage = '''%prog [options] <command> <arguments>
+
+Available commands:
+    glob <pkgdatadir> <pkglistfile> "<globs>"
+        expand one or more glob expressions over the packages listed in
+        pkglistfile (one package per line)
+    read-value <pkgdatadir> <value-name> "<pkgs>"
+        read the named value from the pkgdata files for the specified
+        packages''')
+
+    parser.add_option("-d", "--debug",
+            help = "Report all SRCREV values, not just ones where AUTOREV has been used",
+            action="store_true", dest="debug")
+
+    options, args = parser.parse_args(sys.argv)
+    args = args[1:]
+
+    if len(args) < 1:
+        parser.print_help()
+        sys.exit(1)
+
+    if args[0] == "glob":
+        glob(args[1:], parser.print_help)
+    elif args[0] == "read-value":
+        read_value(args[1:], parser.print_help)
     else:
-        if not noopt:
-            if arg == "-d":
-                debug = True
-                continue
-        args.append(arg)
-
-if len(args) < 1:
-    usage()
-    sys.exit(1)
-
-if args[0] == "glob":
-    glob(args[1:])
-elif args[0] == "read-value":
-    read_value(args[1:])
-else:
-    usage()
-    sys.exit(1)
+        parser.print_help()
+        sys.exit(1)
+
+
+if __name__ == "__main__":
+    main()
-- 
1.8.1.2


