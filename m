Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 56BA76DD15
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 18:50:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Dec 2013 10:50:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,812,1378882800"; d="scan'208";a="445490174"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.184])
	by orsmga002.jf.intel.com with ESMTP; 02 Dec 2013 10:50:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2013 18:50:44 +0000
Message-Id: <5c8582469e2375c40961c44231b5765e05d13d95.1386009885.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386009885.git.paul.eggleton@linux.intel.com>
References: <cover.1386009885.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1386009885.git.paul.eggleton@linux.intel.com>
References: <cover.1386009885.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/8] classes/package: fix FILES_INFO serialisation in pkgdata
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
X-List-Received-Date: Mon, 02 Dec 2013 18:50:57 -0000

The FILES_INFO entry in each pkgdata file stores the list of files for
each package. Make the following improvements to how this is stored:
* Store paths as they would be seen on the target rather than
  erroneously including the full path to PKGDEST (which is specific to
  the build host the package was built on)
* For simplicity when loading the data, store complete paths for each
  entry instead of trying to break off the first part and use it as the
  dict key
* Record sizes for each file (as needed by Toaster)
* Serialise the value explicitly using json rather than just passing it
  through str().

Fixes [YOCTO #5443].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package.bbclass | 19 +++++++++----------
 meta/classes/toaster.bbclass | 28 +++++-----------------------
 scripts/oe-pkgdata-util      | 19 +++++++------------
 3 files changed, 21 insertions(+), 45 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 48bb982..cce2499 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1110,6 +1110,7 @@ PKGDESTWORK = "${WORKDIR}/pkgdata"
 
 python emit_pkgdata() {
     from glob import glob
+    import json
 
     def write_if_exists(f, pkg, var):
         def encode(str):
@@ -1173,22 +1174,20 @@ python emit_pkgdata() {
     workdir = d.getVar('WORKDIR', True)
 
     for pkg in packages.split():
-        items = {}
-        for files_list in pkgfiles[pkg]:
-             item_name = os.path.basename(files_list)
-             item_path = os.path.dirname(files_list)
-             if item_path not in items:
-                 items[item_path] = []
-             items[item_path].append(item_name)
-        subdata_file = pkgdatadir + "/runtime/%s" % pkg
-
         pkgval = d.getVar('PKG_%s' % pkg, True)
         if pkgval is None:
             pkgval = pkg
             d.setVar('PKG_%s' % pkg, pkg)
 
-        d.setVar('FILES_INFO', str(items))
+        pkgdestpkg = os.path.join(pkgdest, pkg)
+        files = {}
+        for f in pkgfiles[pkg]:
+            relpth = os.path.relpath(f, pkgdestpkg)
+            fstat = os.lstat(f)
+            files[os.sep + relpth] = fstat.st_size
+        d.setVar('FILES_INFO', json.dumps(files))
 
+        subdata_file = pkgdatadir + "/runtime/%s" % pkg
         sf = open(subdata_file, 'w')
         write_if_exists(sf, pkg, 'PN')
         write_if_exists(sf, pkg, 'PV')
diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 7dbb384..8dc1663 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -39,8 +39,7 @@ python toaster_package_dumpdata() {
 
 
     # scan and send data for each package
-    import ast
-    import fnmatch
+    import json
 
     lpkgdata = {}
     for pkg in packages.split():
@@ -54,28 +53,11 @@ python toaster_package_dumpdata() {
             (n, v) = line.rstrip().split(":", 1)
             if pkg in n:
                 n = n.replace("_" + pkg, "")
-            lpkgdata[n] = v.strip()
-            line = sf.readline()
-            pkgsplitname = os.path.join(pkgdest, pkg)
-            # replace FILES_INFO data with a dictionary of file name - file size
             if n == 'FILES_INFO':
-                filesizedata = {}
-                val = v.strip().replace('\\\'', '\'')
-                dictval = ast.literal_eval(val)
-                for parent, dirlist in dictval.items():
-                    idx = parent.find(pkgsplitname)
-                    if idx > -1:
-                        parent = parent[idx+len(pkgsplitname):]
-                    else:
-                        bb.error("Invalid path while looking for file ", parent)
-                    for basename in dirlist:
-                        fullpath = os.path.join(parent, basename)
-                        try:
-                            filesizedata[fullpath] = os.stat(pkgsplitname + fullpath).st_size
-                        except OSError:
-                            # we may hit a symlink that is not pointing correctly over package-split
-                            filesizedata[fullpath] = 0
-                lpkgdata[n] = filesizedata
+                lpkgdata[n] = json.loads(v)
+            else:
+                lpkgdata[n] = v.strip()
+            line = sf.readline()
 
         # Fire an event containing the pkg data
         bb.event.fire(bb.event.MetadataEvent("SinglePackageInfo", lpkgdata), d)
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 17e946e..03c8f95 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -262,25 +262,20 @@ def find_path(args, usage, debug=False):
         print('ERROR: Unable to find pkgdata directory %s' % pkgdata_dir)
         sys.exit(1)
 
-    import ast
+    import json
     import fnmatch
 
     for root, dirs, files in os.walk(os.path.join(pkgdata_dir, 'runtime')):
         for fn in files:
-            pkgsplitname = '/packages-split/%s' % fn
             with open(os.path.join(root,fn)) as f:
                 for line in f:
                     if line.startswith('FILES_INFO:'):
-                        val = line.split(':', 1)[1].strip().replace('\\\'', '\'')
-                        dictval = ast.literal_eval(val)
-                        for parent, dirlist in dictval.items():
-                            idx = parent.find(pkgsplitname)
-                            if idx > -1:
-                                parent = parent[idx+len(pkgsplitname):]
-                            for basename in dirlist:
-                                fullpth = os.path.join(parent, basename)
-                                if fnmatch.fnmatchcase(fullpth, targetpath):
-                                    print("%s: %s" % (fn, fullpth))
+                        val = line.split(':', 1)[1].strip()
+                        dictval = json.loads(val)
+                        for fullpth in dictval.keys():
+                            if fnmatch.fnmatchcase(fullpth, targetpath):
+                                print("%s: %s" % (fn, fullpth))
+                        break
 
 
 def main():
-- 
1.8.1.2


