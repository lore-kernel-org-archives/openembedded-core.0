Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4E3A26DEE8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 18:50:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Dec 2013 10:50:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,812,1378882800"; d="scan'208";a="445490189"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.184])
	by orsmga002.jf.intel.com with ESMTP; 02 Dec 2013 10:50:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2013 18:50:45 +0000
Message-Id: <b33d68aa3de3851b63030c77d29d11f0d72db30a.1386009885.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386009885.git.paul.eggleton@linux.intel.com>
References: <cover.1386009885.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1386009885.git.paul.eggleton@linux.intel.com>
References: <cover.1386009885.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/8] classes/package: record PKGSIZE as total file size in pkgdata
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
X-List-Received-Date: Mon, 02 Dec 2013 18:50:58 -0000

We were using "du -sk" to collect the total size of all files in each
package for writing out to PKGSIZE in each pkgdata file; however this
reports the total space used on disk not the total size of all files,
which means it is dependent on the block size and filesystem being used
for TMPDIR on the build host. Instead, take the total of the size
reported by lstat() for each packaged file, which we are already
collecting for FILES_INFO in any case.

Note: this changes PKGSIZE to be reported in bytes instead of kilobytes
since this is what lstat reports, but this is really what we should be
storing anyway so that we have the precision if we need it.

Fixes [YOCTO #5334]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package.bbclass | 12 +++---------
 scripts/oe-pkgdata-util      |  6 +++++-
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index cce2499..2eb970d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1127,14 +1127,6 @@ python emit_pkgdata() {
             f.write('%s: %s\n' % (var, encode(val)))
         return
 
-    def get_directory_size(dir):
-        if os.listdir(dir):
-            with os.popen('du -sk %s' % dir) as f:
-                size = int(f.readlines()[0].split('\t')[0])
-        else:
-            size = 0
-        return size
-
     def write_extra_pkgs(variants, pn, packages, pkgdatadir):
         for variant in variants:
             with open("%s/%s-%s" % (pkgdatadir, variant, pn), 'w') as fd:
@@ -1181,9 +1173,11 @@ python emit_pkgdata() {
 
         pkgdestpkg = os.path.join(pkgdest, pkg)
         files = {}
+        total_size = 0
         for f in pkgfiles[pkg]:
             relpth = os.path.relpath(f, pkgdestpkg)
             fstat = os.lstat(f)
+            total_size += fstat.st_size
             files[os.sep + relpth] = fstat.st_size
         d.setVar('FILES_INFO', json.dumps(files))
 
@@ -1220,7 +1214,7 @@ python emit_pkgdata() {
         for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg, True) or "").split():
             write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
 
-        sf.write('%s_%s: %s\n' % ('PKGSIZE', pkg, get_directory_size(pkgdest + "/%s" % pkg)))
+        sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
         sf.close()
 
         # Symlinks needed for reverse lookups (from the final package name)
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 03c8f95..a373116 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -184,7 +184,11 @@ def read_value(args, usage, debug=False):
             if qvar == "PKGSIZE":
                 # append packagename
                 qvar = "%s_%s" % (var, mappedpkg)
-            print(readvar(revlink, qvar))
+                # PKGSIZE is now in bytes, but we we want it in KB
+                pkgsize = (int(readvar(revlink, qvar)) + 1024 // 2) // 1024
+                print("%d" % pkgsize)
+            else:
+                print(readvar(revlink, qvar))
 
 def lookup_pkg(args, usage, debug=False):
     if len(args) < 2:
-- 
1.8.1.2


