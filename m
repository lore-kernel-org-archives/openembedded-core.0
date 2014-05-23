Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A14A36B8D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 18:13:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2014 11:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,895,1392192000"; d="scan'208";a="536721478"
Received: from bidesilv-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.159])
	by fmsmga001.fm.intel.com with ESMTP; 23 May 2014 11:13:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 May 2014 19:12:58 +0100
Message-Id: <ee1f176cce1dbd0ef94cd5863e5894278f4f2c44.1400868743.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1400868743.git.paul.eggleton@linux.intel.com>
References: <cover.1400868743.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1400868743.git.paul.eggleton@linux.intel.com>
References: <cover.1400868743.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] list-packageconfig-flags: improve option parsing
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
X-List-Received-Date: Fri, 23 May 2014 18:13:08 -0000

* Use optparse instead of getopt (less code & automatic help)
* Change help text / output to use "recipe" instead of "package"
* Print something to indicate the script is still gathering information

Note that the long options have been renamed as appropriate.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/list-packageconfig-flags.py | 81 +++++++++++------------------
 1 file changed, 29 insertions(+), 52 deletions(-)

diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
index 3db4298..598b5c3 100755
--- a/scripts/contrib/list-packageconfig-flags.py
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -14,13 +14,14 @@
 # along with this program; if not, write to the Free Software Foundation.
 #
 # Copyright (C) 2013 Wind River Systems, Inc.
+# Copyright (C) 2014 Intel Corporation
 #
-# - list available pkgs which have PACKAGECONFIG flags
-# - list available PACKAGECONFIG flags and all affected pkgs
-# - list all pkgs and PACKAGECONFIG information
+# - list available recipes which have PACKAGECONFIG flags
+# - list available PACKAGECONFIG flags and all affected recipes
+# - list all recipes and PACKAGECONFIG information
 
 import sys
-import getopt
+import optparse
 import os
 
 
@@ -41,27 +42,6 @@ import bb.cooker
 import bb.providers
 import bb.tinfoil
 
-usage_body = '''  list available pkgs which have PACKAGECONFIG flags
-
-OPTION:
-  -h, --help    display this help and exit
-  -f, --flag    list available PACKAGECONFIG flags and all affected pkgs
-  -a, --all     list all pkgs and PACKAGECONFIG information
-  -p, --prefer  list pkgs with preferred version
-
-EXAMPLE:
-list-packageconfig-flags.py
-list-packageconfig-flags.py -f
-list-packageconfig-flags.py -a
-list-packageconfig-flags.py -p
-list-packageconfig-flags.py -f -p
-list-packageconfig-flags.py -a -p
-'''
-
-def usage():
-    print 'Usage: %s [-f|-a] [-p]' % os.path.basename(sys.argv[0])
-    print usage_body
-
 def get_fnlist(bbhandler, pkg_pn, preferred):
     ''' Get all recipe file names '''
     if preferred:
@@ -119,13 +99,13 @@ def collect_flags(pkg_dict):
 
 def display_pkgs(pkg_dict):
     ''' Display available pkgs which have PACKAGECONFIG flags '''
-    pkgname_len = len("PACKAGE NAME") + 1
+    pkgname_len = len("RECIPE NAME") + 1
     for pkgname in pkg_dict:
         if pkgname_len < len(pkgname):
             pkgname_len = len(pkgname)
     pkgname_len += 1
 
-    header = '%-*s%s' % (pkgname_len, str("PACKAGE NAME"), str("PACKAGECONFIG FLAGS"))
+    header = '%-*s%s' % (pkgname_len, str("RECIPE NAME"), str("PACKAGECONFIG FLAGS"))
     print header
     print str("").ljust(len(header), '=')
     for pkgname in sorted(pkg_dict):
@@ -136,7 +116,7 @@ def display_flags(flag_dict):
     ''' Display available PACKAGECONFIG flags and all affected pkgs '''
     flag_len = len("PACKAGECONFIG FLAG") + 5
 
-    header = '%-*s%s' % (flag_len, str("PACKAGECONFIG FLAG"), str("PACKAGE NAMES"))
+    header = '%-*s%s' % (flag_len, str("PACKAGECONFIG FLAG"), str("RECIPE NAMES"))
     print header
     print str("").ljust(len(header), '=')
 
@@ -161,43 +141,40 @@ def display_all(data_dict):
         print ''
 
 def main():
-    listtype = 'pkgs'
-    preferred = False
     pkg_dict = {}
     flag_dict = {}
 
     # Collect and validate input
-    try:
-        opts, args = getopt.getopt(sys.argv[1:], "hfap", ["help", "flag", "all", "prefer"])
-    except getopt.GetoptError, err:
-        print >> sys.stderr,'%s' % str(err)
-        usage()
-        sys.exit(2)
-    for opt, value in opts:
-        if opt in ('-h', '--help'):
-            usage()
-            sys.exit(0)
-        elif opt in ('-f', '--flag'):
-            listtype = 'flags'
-        elif opt in ('-a', '--all'):
-            listtype = 'all'
-        elif opt in ('-p', '--prefer'):
-            preferred = True
-        else:
-            assert False, "unhandled option"
+    parser = optparse.OptionParser(
+        description = "Lists recipes and PACKAGECONFIG flags. Without -a or -f, recipes and their available PACKAGECONFIG flags are listed.",
+        usage = """
+    %prog [options]""")
+
+    parser.add_option("-f", "--flags",
+            help = "list available PACKAGECONFIG flags and affected recipes",
+            action="store_const", dest="listtype", const="flags", default="recipes")
+    parser.add_option("-a", "--all",
+            help = "list all recipes and PACKAGECONFIG information",
+            action="store_const", dest="listtype", const="all")
+    parser.add_option("-p", "--preferred-only",
+            help = "where multiple recipe versions are available, list only the preferred version",
+            action="store_true", dest="preferred", default=False)
+
+    options, args = parser.parse_args(sys.argv)
 
     bbhandler = bb.tinfoil.Tinfoil()
     bbhandler.prepare()
-    data_dict = get_recipesdata(bbhandler, preferred)
+    print("Gathering recipe data...")
+    data_dict = get_recipesdata(bbhandler, options.preferred)
 
-    if listtype == 'flags':
+    if options.listtype == 'flags':
         pkg_dict = collect_pkgs(data_dict)
         flag_dict = collect_flags(pkg_dict)
         display_flags(flag_dict)
-    elif listtype == 'pkgs':
+    elif options.listtype == 'recipes':
         pkg_dict = collect_pkgs(data_dict)
         display_pkgs(pkg_dict)
-    elif listtype == 'all':
+    elif options.listtype == 'all':
         display_all(data_dict)
 
 if __name__ == "__main__":
-- 
1.9.0


