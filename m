Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E6405731FA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 05:03:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Apr 2016 22:03:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,439,1455004800"; d="scan'208";a="951008499"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.142.238])
	by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2016 22:03:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Apr 2016 17:02:19 +1200
Message-Id: <3beb294522bdfe088aa99f2d7aaafa79853e6a2e.1459746060.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1459746060.git.paul.eggleton@linux.intel.com>
References: <cover.1459746060.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1459746060.git.paul.eggleton@linux.intel.com>
References: <cover.1459746060.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] classes/buildhistory: optimise getting package size list
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
X-List-Received-Date: Mon, 04 Apr 2016 05:03:14 -0000

Invoking oe-pkgdata-util in turn for every package in the list was slow
with a large image. Modify oe-pkgdata-util's read-value command to take
an option to read the list of packages from a file, as well as prefix
the value with the package name; we can then use this to get all of the
package sizes at once. This reduces the time to gather this information
from minutes to just a second or two.

Fixes [YOCTO #7339].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 13 +++----------
 scripts/oe-pkgdata-util           | 26 +++++++++++++++++++++-----
 2 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 108275a..8af36c5 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -3,7 +3,7 @@
 #
 # Based in part on testlab.bbclass and packagehistory.bbclass
 #
-# Copyright (C) 2011-2014 Intel Corporation
+# Copyright (C) 2011-2016 Intel Corporation
 # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
 #
 
@@ -416,15 +416,8 @@ buildhistory_get_installed() {
 	rm $1/depends.tmp
 
 	# Produce installed package sizes list
-	printf "" > $1/installed-package-sizes.tmp
-	cat $pkgcache | while read pkg pkgfile pkgarch
-	do
-		size=`oe-pkgdata-util -p ${PKGDATA_DIR} read-value "PKGSIZE" ${pkg}_${pkgarch}`
-		if [ "$size" != "" ] ; then
-			echo "$size $pkg" >> $1/installed-package-sizes.tmp
-		fi
-	done
-	cat $1/installed-package-sizes.tmp | sort -n -r | awk '{print $1 "\tKiB " $2}' > $1/installed-package-sizes.txt
+	oe-pkgdata-util -p ${PKGDATA_DIR} read-value "PKGSIZE" -n -f $pkgcache > $1/installed-package-sizes.tmp
+	cat $1/installed-package-sizes.tmp | awk '{print $2 "\tKiB " $1}' | sort -n -r > $1/installed-package-sizes.txt
 	rm $1/installed-package-sizes.tmp
 
 	# We're now done with the cache, delete it
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 8e22e02..a04e44d 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -161,8 +161,18 @@ def glob(args):
 def read_value(args):
     # Handle both multiple arguments and multiple values within an arg (old syntax)
     packages = []
-    for pkgitem in args.pkg:
-        packages.extend(pkgitem.split())
+    if args.file:
+        with open(args.file, 'r') as f:
+            for line in f:
+                splitline = line.split()
+                if splitline:
+                    packages.append(splitline[0])
+    else:
+        for pkgitem in args.pkg:
+            packages.extend(pkgitem.split())
+        if not packages:
+            logger.error("No packages specified")
+            sys.exit(1)
 
     def readvar(pkgdata_file, valuename):
         val = ""
@@ -187,9 +197,13 @@ def read_value(args):
                 qvar = "%s_%s" % (args.valuename, mappedpkg)
                 # PKGSIZE is now in bytes, but we we want it in KB
                 pkgsize = (int(readvar(revlink, qvar)) + 1024 // 2) // 1024
-                print("%d" % pkgsize)
+                value = "%d" % pkgsize
+            else:
+                value = readvar(revlink, qvar)
+            if args.prefix_name:
+                print('%s %s' % (pkg_name, value))
             else:
-                print(readvar(revlink, qvar))
+                print(value)
 
 def lookup_pkglist(pkgs, pkgdata_dir, reverse):
     if reverse:
@@ -465,7 +479,9 @@ def main():
                                           help='Read any pkgdata value for one or more packages',
                                           description='Reads the named value from the pkgdata files for the specified packages')
     parser_read_value.add_argument('valuename', help='Name of the value to look up')
-    parser_read_value.add_argument('pkg', nargs='+', help='Runtime package name to look up')
+    parser_read_value.add_argument('pkg', nargs='*', help='Runtime package name to look up')
+    parser_read_value.add_argument('-f', '--file', help='Read package names from the specified file (one per line, first field only)')
+    parser_read_value.add_argument('-n', '--prefix-name', help='Prefix output with package name', action='store_true')
     parser_read_value.set_defaults(func=read_value)
 
     parser_glob = subparsers.add_parser('glob',
-- 
2.5.5


