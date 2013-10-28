Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B84DB6D45E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 17:12:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Oct 2013 10:12:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,587,1378882800"; d="scan'208";a="418613123"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.120.252])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2013 10:12:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 17:11:57 +0000
Message-Id: <0824f2f5cf4e05f82b6986ce6fb22fa1392b7776.1382980153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1382980153.git.paul.eggleton@linux.intel.com>
References: <cover.1382980153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1382980153.git.paul.eggleton@linux.intel.com>
References: <cover.1382980153.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/6] scripts/oe-pkgdata-util: add ability to search for a target path
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

Add ability to search for a target path in produced packages, in order
to find which package provides a specific file.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-pkgdata-util | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 01fccd2..2d896d0 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -186,6 +186,38 @@ def read_value(args, usage):
                 qvar = "%s_%s" % (var, mappedpkg)
             print(readvar(revlink, qvar))
 
+def find_path(args, usage):
+    if len(args) < 2:
+        usage()
+        sys.exit(1)
+
+    pkgdata_dir = args[0]
+    targetpath = args[1]
+
+    if not os.path.exists(pkgdata_dir):
+        print('ERROR: Unable to find pkgdata directory %s' % pkgdata_dir)
+        sys.exit(1)
+
+    import ast
+    import fnmatch
+
+    for root, dirs, files in os.walk(os.path.join(pkgdata_dir, 'runtime')):
+        for fn in files:
+            pkgsplitname = '/packages-split/%s' % fn
+            with open(os.path.join(root,fn)) as f:
+                for line in f:
+                    if line.startswith('FILES_INFO:'):
+                        val = line.split(':', 1)[1].strip().replace('\\\'', '\'')
+                        dictval = ast.literal_eval(val)
+                        for parent, dirlist in dictval.items():
+                            idx = parent.find(pkgsplitname)
+                            if idx > -1:
+                                parent = parent[idx+len(pkgsplitname):]
+                            for basename in dirlist:
+                                fullpth = os.path.join(parent, basename)
+                                if fnmatch.fnmatchcase(fullpth, targetpath):
+                                    print("%s: %s" % (fn, fullpth))
+
 
 def main():
     parser = optparse.OptionParser(
@@ -195,6 +227,8 @@ Available commands:
     glob <pkgdatadir> <pkglistfile> "<globs>"
         expand one or more glob expressions over the packages listed in
         pkglistfile (one package per line)
+    find-path <pkgdatadir> <path>
+        find the package providing the specified path (wildcards * ? allowed)
     read-value <pkgdatadir> <value-name> "<pkgs>"
         read the named value from the pkgdata files for the specified
         packages''')
@@ -212,6 +246,8 @@ Available commands:
 
     if args[0] == "glob":
         glob(args[1:], parser.print_help)
+    elif args[0] == "find-path":
+        find_path(args[1:], parser.print_help)
     elif args[0] == "read-value":
         read_value(args[1:], parser.print_help)
     else:
-- 
1.8.1.2


