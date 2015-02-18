Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DD8E97182C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 10:26:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 18 Feb 2015 02:26:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,600,1418112000"; d="scan'208";a="687276198"
Received: from cbulfin-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.18.182])
	by orsmga002.jf.intel.com with ESMTP; 18 Feb 2015 02:26:39 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Feb 2015 10:26:33 +0000
Message-Id: <3b3a0f8178e8f6134aec01380679e73599ae7d5e.1424255146.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424255146.git.paul.eggleton@linux.intel.com>
References: <cover.1424255146.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424255146.git.paul.eggleton@linux.intel.com>
References: <cover.1424255146.git.paul.eggleton@linux.intel.com>
Subject: [daisy][PATCH 1/1] lib/oe/package_manager: support exclusion from complementary glob process by regex
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
X-List-Received-Date: Wed, 18 Feb 2015 10:26:47 -0000

Sometimes you do not want certain packages to be installed when
installing complementary packages, e.g. when using dev-pkgs in
IMAGE_FEATURES you may not want to install all packages from a
particular multilib. This introduces a new PACKAGE_EXCLUDE_COMPLEMENTARY
variable to allow specifying regexes to match packages to exclude.

(From OE-Core master rev: d4fe8f639d87d5ff35e50d07d41d0c1e9f12c4e3)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 meta/lib/oe/package_manager.py |  3 +++
 scripts/oe-pkgdata-util        | 12 +++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 1c64205..1c33b0f 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -519,6 +519,9 @@ class PackageManager(object):
         cmd = [bb.utils.which(os.getenv('PATH'), "oe-pkgdata-util"),
                "glob", self.d.getVar('PKGDATA_DIR', True), installed_pkgs_file,
                globs]
+        exclude = self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY', True)
+        if exclude:
+            cmd.extend(['-x', exclude])
         try:
             bb.note("Installing complementary packages ...")
             complementary_pkgs = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index a373116..4900955 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -28,7 +28,7 @@ import re
 import optparse
 from collections import defaultdict
 
-def glob(args, usage, debug=False):
+def glob(args, usage, debug=False, exclude=""):
     if len(args) < 3:
         usage()
         sys.exit(1)
@@ -45,7 +45,10 @@ def glob(args, usage, debug=False):
         print('ERROR: Unable to find package list file %s' % pkglist_file)
         sys.exit(1)
 
-    skipregex = re.compile("-locale-|^locale-base-|-dev$|-doc$|-dbg$|-staticdev$|^kernel-module-")
+    skipval = "-locale-|^locale-base-|-dev$|-doc$|-dbg$|-staticdev$|^kernel-module-"
+    if exclude:
+        skipval += "|" + exclude
+    skipregex = re.compile(skipval)
 
     mappedpkgs = set()
     with open(pkglist_file, 'r') as f:
@@ -305,6 +308,9 @@ Available commands:
     parser.add_option("-d", "--debug",
             help = "Report all SRCREV values, not just ones where AUTOREV has been used",
             action="store_true", dest="debug", default=False)
+    parser.add_option("-x", "--exclude",
+            help = "Exclude packages matching specified regex from the glob operation",
+            action="store", type="string", dest="exclude", default="")
 
     options, args = parser.parse_args(sys.argv)
     args = args[1:]
@@ -314,7 +320,7 @@ Available commands:
         sys.exit(1)
 
     if args[0] == "glob":
-        glob(args[1:], parser.print_help, options.debug)
+        glob(args[1:], parser.print_help, options.debug, options.exclude)
     elif args[0] == "lookup-pkg":
         lookup_pkg(args[1:], parser.print_help, options.debug)
     elif args[0] == "lookup-recipe":
-- 
1.9.3


