Return-Path: <juan.m.cruz.alcaraz@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 89DC477E0D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 16:24:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2017 09:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,375,1496127600"; d="scan'208";a="1196385101"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jul 2017 09:24:59 -0700
From: juan.m.cruz.alcaraz@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 09:24:58 -0700
Message-Id: <20170717162458.17623-1-juan.m.cruz.alcaraz@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] do_package: sources are packaged separately from debug.
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
X-List-Received-Date: Mon, 17 Jul 2017 16:24:59 -0000

From: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>

The configuration variable PACKAGE_DBG_SPLIT_SRC instructs the system
to remove the source files from the debug package but include them in
a separate package with a "-src" suffix in the name.

[YOCTO #9998]

Signed-off-by: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>
---
 meta/classes/package.bbclass | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index cc466bd1b2..7ce739bf30 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -886,6 +886,10 @@ python split_and_strip_files () {
         debuglibdir = ""
         debugsrcdir = "/usr/src/debug"
 
+    if d.getVar('PACKAGE_DBG_SPLIT_SRC') == '1':
+       # Set sources into an specific package
+        debugsrcdir  = "/usr/src/debug"
+
     sourcefile = d.expand("${WORKDIR}/debugsources.list")
     bb.utils.remove(sourcefile)
 
@@ -1092,6 +1096,15 @@ python populate_packages () {
     
     autodebug = not (d.getVar("NOAUTOPACKAGEDEBUG") or False)
 
+    split_source_package =  d.getVar('PACKAGE_DBG_SPLIT_SRC') or False
+
+    # If PACKAGE_DBG_SPLIT_SRC is enabled then the src package is added
+    # into the package list and the source directory as its main content
+    if split_source_package:
+        src_package_name = ('%s-src' % d.getVar('PN'))
+        packages += (' ' + src_package_name)
+        d.setVar('FILES_%s' % src_package_name, '/usr/src/debug')
+
     # Sanity check PACKAGES for duplicates
     # Sanity should be moved to sanity.bbclass once we have the infrastucture
     package_list = []
@@ -1100,7 +1113,12 @@ python populate_packages () {
         if pkg in package_list:
             msg = "%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg
             package_qa_handle_error("packages-list", msg, d)
-        elif autodebug and pkg.endswith("-dbg"):
+        # If PACKAGE_DBG_SPLIT_SRC is enabled then the src package will have
+        # priority over dbg package when assigning the files.
+        # This allows src package to include source files and remove them from dbg.
+        elif split_source_package and pkg.endswith("-src"):
+            package_list.insert(0, pkg)
+        elif autodebug and pkg.endswith("-dbg") and not split_source_package:
             package_list.insert(0, pkg)
         else:
             package_list.append(pkg)
@@ -1460,7 +1478,7 @@ python package_do_filedeps() {
     for pkg in packages.split():
         if d.getVar('SKIP_FILEDEPS_' + pkg) == '1':
             continue
-        if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or pkg.find('-gconv-') != -1 or pkg.find('-charmap-') != -1 or pkg.startswith('kernel-module-'):
+        if pkg.endswith('-dbg') or pkg.endswith('-doc') or pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or pkg.find('-gconv-') != -1 or pkg.find('-charmap-') != -1 or pkg.startswith('kernel-module-') or pkg.endswith('-src'):
             continue
         for files in chunks(pkgfiles[pkg], 100):
             pkglist.append((pkg, files, rpmdeps, pkgdest, magic))
@@ -1578,7 +1596,7 @@ python package_do_shlibs() {
                 combos.append("-".join(options[0:i]))
             return combos
 
-        if (file.endswith('.dylib') or file.endswith('.so')) and not pkg.endswith('-dev') and not pkg.endswith('-dbg'):
+        if (file.endswith('.dylib') or file.endswith('.so')) and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-src'):
             # Drop suffix
             name = os.path.basename(file).rsplit(".",1)[0]
             # Find all combinations
-- 
2.12.3


