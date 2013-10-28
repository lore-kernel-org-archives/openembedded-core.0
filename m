Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EF38F6D45E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 17:12:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Oct 2013 10:12:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,587,1378882800"; d="scan'208";a="418613141"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.120.252])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2013 10:12:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 17:11:59 +0000
Message-Id: <4ab561ac3df105b4b6487271b6ccc29445518d52.1382980153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1382980153.git.paul.eggleton@linux.intel.com>
References: <cover.1382980153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1382980153.git.paul.eggleton@linux.intel.com>
References: <cover.1382980153.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/6] scripts/oe-pkgdata-util: add ability to find a recipe from a target package
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
X-List-Received-Date: Mon, 28 Oct 2013 17:12:14 -0000

Add a "lookup-recipe" command to show which recipe produced a particular
package.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-pkgdata-util | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 08773e9..80cacc5 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -219,6 +219,38 @@ def lookup_pkg(args, usage):
         items.extend(mappings.get(pkg, []))
     print '\n'.join(items)
 
+def lookup_recipe(args, usage):
+    if len(args) < 2:
+        usage()
+        sys.exit(1)
+
+    pkgdata_dir = args[0]
+    pkgs = args[1].split()
+
+    if not os.path.exists(pkgdata_dir):
+        print('ERROR: Unable to find pkgdata directory %s' % pkgdata_dir)
+        sys.exit(1)
+
+    mappings = defaultdict(list)
+    for pkg in pkgs:
+        pkgfile = os.path.join(pkgdata_dir, 'runtime-reverse', pkg)
+        if os.path.exists(pkgfile):
+            with open(pkgfile, 'r') as f:
+                for line in f:
+                    fields = line.rstrip().split(': ')
+                    if fields[0] == 'PN':
+                        mappings[pkg].append(fields[1])
+                        break
+    if len(mappings) < len(pkgs):
+        missing = list(set(pkgs) - set(mappings.keys()))
+        sys.stderr.write("ERROR: the following packages could not be found: %s\n" % ', '.join(missing))
+        sys.exit(1)
+
+    items = []
+    for pkg in pkgs:
+        items.extend(mappings.get(pkg, []))
+    print '\n'.join(items)
+
 def find_path(args, usage):
     if len(args) < 2:
         usage()
@@ -263,6 +295,9 @@ Available commands:
     lookup-pkg <pkgdatadir> "<recipe-pkgs>"
         look up the specified recipe-space package name(s) to see what the
         final runtime package name is (e.g. eglibc becomes libc6)
+    lookup-recipe <pkgdatadir> "<pkgs>"
+        look up the specified package(s) to see which recipe they were
+        produced by
     find-path <pkgdatadir> <path>
         find the package providing the specified path (wildcards * ? allowed)
     read-value <pkgdatadir> <value-name> "<pkgs>"
@@ -284,6 +319,8 @@ Available commands:
         glob(args[1:], parser.print_help)
     elif args[0] == "lookup-pkg":
         lookup_pkg(args[1:], parser.print_help)
+    elif args[0] == "lookup-recipe":
+        lookup_recipe(args[1:], parser.print_help)
     elif args[0] == "find-path":
         find_path(args[1:], parser.print_help)
     elif args[0] == "read-value":
-- 
1.8.1.2


