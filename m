Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id ED8797355C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 17:57:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 16 Feb 2015 09:49:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,589,1418112000"; d="scan'208";a="667141852"
Received: from mmettala-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.7.57])
	by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2015 09:57:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Feb 2015 17:57:03 +0000
Message-Id: <aed7b486ae8b54b83e1c378b3c0e0c0c889891a4.1424109368.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424109368.git.paul.eggleton@linux.intel.com>
References: <cover.1424109368.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424109368.git.paul.eggleton@linux.intel.com>
References: <cover.1424109368.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] lib/oe/package_manager: support exclusion from complementary glob process by regex
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
X-List-Received-Date: Mon, 16 Feb 2015 17:57:20 -0000

Sometimes you do not want certain packages to be installed when
installing complementary packages, e.g. when using dev-pkgs in
IMAGE_FEATURES you may not want to install all packages from a
particular multilib. This introduces a new PACKAGE_EXCLUDE_COMPLEMENTARY
variable to allow specifying regexes to match packages to exclude.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/package_manager.py    | 3 +++
 meta/lib/oeqa/selftest/pkgdata.py | 5 +++++
 scripts/oe-pkgdata-util           | 6 +++++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index fcf05dc..986ae54 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -531,6 +531,9 @@ class PackageManager(object):
         cmd = [bb.utils.which(os.getenv('PATH'), "oe-pkgdata-util"),
                "-p", self.d.getVar('PKGDATA_DIR', True), "glob", installed_pkgs_file,
                globs]
+        exclude = self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY', True)
+        if exclude:
+            cmd.extend(['-x', exclude])
         try:
             bb.note("Installing complementary packages ...")
             complementary_pkgs = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
diff --git a/meta/lib/oeqa/selftest/pkgdata.py b/meta/lib/oeqa/selftest/pkgdata.py
index f689bf3..34eea46 100644
--- a/meta/lib/oeqa/selftest/pkgdata.py
+++ b/meta/lib/oeqa/selftest/pkgdata.py
@@ -207,6 +207,11 @@ class OePkgdataUtilTests(oeSelfTest):
         # The following should not error (because when we use this during rootfs construction, sometimes the complementary package won't exist)
         result = runCmd('oe-pkgdata-util glob %s "*-nonexistent"' % pkglistfile)
         self.assertEqual(result.output, '')
+        # Test exclude option
+        result = runCmd('oe-pkgdata-util glob %s "*-dev *-dbg" -x "^libz"' % pkglistfile)
+        resultlist = result.output.split()
+        self.assertNotIn('libz-dev', resultlist)
+        self.assertNotIn('libz-dbg', resultlist)
 
     def test_specify_pkgdatadir(self):
         result = runCmd('oe-pkgdata-util -p %s lookup-pkg glibc' % get_bb_var('PKGDATA_DIR'))
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 5a9f89b..b075775 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -55,7 +55,10 @@ def glob(args):
         logger.error('Unable to find package list file %s' % args.pkglistfile)
         sys.exit(1)
 
-    skipregex = re.compile("-locale-|^locale-base-|-dev$|-doc$|-dbg$|-staticdev$|^kernel-module-")
+    skipval = "-locale-|^locale-base-|-dev$|-doc$|-dbg$|-staticdev$|^kernel-module-"
+    if args.exclude:
+        skipval += "|" + args.exclude
+    skipregex = re.compile(skipval)
 
     mappedpkgs = set()
     with open(args.pkglistfile, 'r') as f:
@@ -466,6 +469,7 @@ def main():
                                           description='Expands one or more glob expressions over the packages listed in pkglistfile')
     parser_glob.add_argument('pkglistfile', help='File listing packages (one package name per line)')
     parser_glob.add_argument('glob', nargs="+", help='Glob expression for package names, e.g. *-dev')
+    parser_glob.add_argument('-x', '--exclude', help='Exclude packages matching specified regex from the glob operation')
     parser_glob.set_defaults(func=glob)
 
 
-- 
1.9.3


