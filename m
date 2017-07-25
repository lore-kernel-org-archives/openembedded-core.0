Return-Path: <juan.m.cruz.alcaraz@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6FFEE7825B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 23:07:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 25 Jul 2017 16:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,412,1496127600"; d="scan'208";a="882783852"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jul 2017 16:07:54 -0700
From: juan.m.cruz.alcaraz@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 16:07:52 -0700
Message-Id: <20170725230753.27065-1-juan.m.cruz.alcaraz@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH v2] package/bbclass: sources are packaged separately from debug.
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
X-List-Received-Date: Tue, 25 Jul 2017 23:07:53 -0000

From: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>

The configuration variable PACKAGE_DEBUG_SPLIT_STYLE includes
the new mode debug-with-srcpkg that instructs the system to
remove the source files from the debug package but include them in
a separate package with a "-src" suffix in the name.

[YOCTO #9998]

Signed-off-by: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>
---
 meta/classes/package.bbclass | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index cc466bd1b2..d2fa6175e6 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -879,6 +879,11 @@ python split_and_strip_files () {
         debugdir = "/.debug"
         debuglibdir = ""
         debugsrcdir = ""
+    elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-with-srcpkg':
+        debugappend = ""
+        debugdir = "/.debug"
+        debuglibdir = ""
+        debugsrcdir = "/usr/src/debug"
     else:
         # Original OE-core, a.k.a. ".debug", style debug info
         debugappend = ""
@@ -1092,6 +1097,15 @@ python populate_packages () {
     
     autodebug = not (d.getVar("NOAUTOPACKAGEDEBUG") or False)
 
+    split_source_package = (d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-with-srcpkg')
+
+    # If debug-with-srcpkg mode is enabled then the src package is added
+    # into the package list and the source directory as its main content
+    if split_source_package:
+        src_package_name = ('%s-src' % d.getVar('PN'))
+        packages += (' ' + src_package_name)
+        d.setVar('FILES_%s' % src_package_name, '/usr/src/debug')
+
     # Sanity check PACKAGES for duplicates
     # Sanity should be moved to sanity.bbclass once we have the infrastucture
     package_list = []
@@ -1100,7 +1114,12 @@ python populate_packages () {
         if pkg in package_list:
             msg = "%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg
             package_qa_handle_error("packages-list", msg, d)
-        elif autodebug and pkg.endswith("-dbg"):
+        # If debug-with-srcpkg mode is enabled then the src package will have
+        # priority over dbg package when assigning the files.
+        # This allows src package to include source files and remove them from dbg.
+        elif split_source_package and pkg.endswith("-src"):
+            package_list.insert(0, pkg)
+        elif autodebug and pkg.endswith("-dbg") and not split_source_package:
             package_list.insert(0, pkg)
         else:
             package_list.append(pkg)
@@ -1460,7 +1479,7 @@ python package_do_filedeps() {
     for pkg in packages.split():
         if d.getVar('SKIP_FILEDEPS_' + pkg) == '1':
             continue
-        if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or pkg.find('-gconv-') != -1 or pkg.find('-charmap-') != -1 or pkg.startswith('kernel-module-'):
+        if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or pkg.find('-gconv-') != -1 or pkg.find('-charmap-') != -1 or pkg.startswith('kernel-module-') or pkg.endswith('-src'):
             continue
         for files in chunks(pkgfiles[pkg], 100):
             pkglist.append((pkg, files, rpmdeps, pkgdest, magic))
@@ -1578,7 +1597,7 @@ python package_do_shlibs() {
                 combos.append("-".join(options[0:i]))
             return combos
 
-        if (file.endswith('.dylib') or file.endswith('.so')) and not pkg.endswith('-dev') and not pkg.endswith('-dbg'):
+        if (file.endswith('.dylib') or file.endswith('.so')) and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-src'):
             # Drop suffix
             name = os.path.basename(file).rsplit(".",1)[0]
             # Find all combinations
-- 
2.12.3


