Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EF76A6E274
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 19:07:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2013 11:03:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,859,1378882800"; d="scan'208";a="421821798"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.25])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2013 11:07:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2013 19:06:56 +0000
Message-Id: <7ff2d52486c187780303ce549b9dc50c7d6821b8.1386615914.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386615914.git.paul.eggleton@linux.intel.com>
References: <cover.1386615914.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1386615914.git.paul.eggleton@linux.intel.com>
References: <cover.1386615914.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] toaster.bbclass: read package and image information
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
X-List-Received-Date: Mon, 09 Dec 2013 19:07:04 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

In the process of removing the local system accesses
from toaster UI (which must be able to run remotely),
the code to read package information  is moved
from Bitbake Toaster UI to the server-side
toaster.bbclass

     [YOCTO #5604]

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/classes/toaster.bbclass | 91 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 74 insertions(+), 17 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 59c61c5..e1a93b5 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -92,6 +92,23 @@ python toaster_layerinfo_dumpdata() {
 
 # Dump package file info data
 
+def _toaster_load_pkgdatafile(dirpath, filepath):
+    import json
+    pkgdata = {}
+    with open(os.path.join(dirpath, filepath), "r") as fin:
+        for line in fin:
+            try:
+                kn, kv = line.strip().split(": ", 1)
+                kn = "_".join([x for x in kn.split("_") if x.isupper()])
+                pkgdata[kn] = kv.strip()
+                if kn == 'FILES_INFO':
+                    pkgdata[kn] = json.loads(kv)
+
+            except ValueError:
+                pass    # ignore lines without valid key: value pairs
+    return pkgdata
+
+
 python toaster_package_dumpdata() {
     """
     Dumps the data created by emit_pkgdata
@@ -103,27 +120,12 @@ python toaster_package_dumpdata() {
 
     pkgdatadir = d.getVar('PKGDESTWORK', True)
 
-
     # scan and send data for each package
-    import json
 
     lpkgdata = {}
     for pkg in packages.split():
 
-        subdata_file = pkgdatadir + "/runtime/%s" % pkg
-        lpkgdata = {}
-
-        sf = open(subdata_file, "r")
-        line = sf.readline()
-        while line:
-            (n, v) = line.rstrip().split(":", 1)
-            if pkg in n:
-                n = n.replace("_" + pkg, "")
-            if n == 'FILES_INFO':
-                lpkgdata[n] = json.loads(v)
-            else:
-                lpkgdata[n] = v.strip()
-            line = sf.readline()
+        lpkgdata = _toaster_load_pkgdatafile(pkgdatadir + "/runtime/", pkg)
 
         # Fire an event containing the pkg data
         bb.event.fire(bb.event.MetadataEvent("SinglePackageInfo", lpkgdata), d)
@@ -209,7 +211,7 @@ python toaster_collect_task_stats() {
         pass
 
 
-    if isinstance(e, bb.event.BuildCompleted):
+    if isinstance(e, bb.event.BuildCompleted) and os.path.exists(os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist")):
         events = []
         with open(os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist"), "r") as fin:
             for line in fin:
@@ -219,6 +221,58 @@ python toaster_collect_task_stats() {
         os.unlink(os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist"))
 }
 
+# dump relevant build history data as an event when the build is completed
+
+python toaster_buildhistory_dump() {
+    import re
+    BUILDHISTORY_DIR = e.data.expand("${TOPDIR}/buildhistory")
+    BUILDHISTORY_DIR_IMAGE_BASE = e.data.expand("%s/images/${MACHINE_ARCH}/${TCLIBC}/"% BUILDHISTORY_DIR)
+    pkgdata_dir = e.data.getVar("PKGDATA_DIR", True)
+
+
+    # scan the build targets for this build
+    images = {}
+    allpkgs = {}
+    for target in e._pkgs:
+        installed_img_path = e.data.expand(os.path.join(BUILDHISTORY_DIR_IMAGE_BASE, target))
+        if os.path.exists(installed_img_path):
+            images[target] = {}
+            with open("%s/installed-package-sizes.txt" % installed_img_path, "r") as fin:
+                for line in fin:
+                    line = line.rstrip(";")
+                    psize, px = line.split("\t")
+                    punit, pname = px.split(" ")
+                    # this size is "installed-size" as it measures how much space it takes on disk
+                    images[target][pname.strip()] = {'size':int(psize)*1024, 'depends' : []}
+
+            with open("%s/depends.dot" % installed_img_path, "r") as fin:
+                p = re.compile(r' -> ')
+                dot = re.compile(r'.*style=dotted')
+                for line in fin:
+                    line = line.rstrip(';')
+                    linesplit = p.split(line)
+                    if len(linesplit) == 2:
+                        pname = linesplit[0].rstrip('"').strip('"')
+                        dependsname = linesplit[1].split(" ")[0].strip().strip(";").strip('"').rstrip('"')
+                        deptype = "depends"
+                        if dot.match(line):
+                            deptype = "recommends"
+                        if not pname in images[target]:
+                            images[target][pname] = {'size': 0, 'depends' : []}
+                        if not dependsname in images[target]:
+                            images[target][dependsname] = {'size': 0, 'depends' : []}
+                        images[target][pname]['depends'].append((dependsname, deptype))
+
+            for pname in images[target]:
+                if not pname in allpkgs:
+                    allpkgs[pname] = _toaster_load_pkgdatafile("%s/runtime-reverse/" % pkgdata_dir, pname)
+
+
+    data = { 'pkgdata' : allpkgs, 'imgdata' : images }
+
+    bb.event.fire(bb.event.MetadataEvent("ImagePkgList", data), e.data)
+
+}
 
 # set event handlers
 addhandler toaster_layerinfo_dumpdata
@@ -226,6 +280,9 @@ toaster_layerinfo_dumpdata[eventmask] = "bb.event.TreeDataPreparationCompleted"
 
 addhandler toaster_collect_task_stats
 toaster_collect_task_stats[eventmask] = "bb.event.BuildCompleted bb.build.TaskSucceeded bb.build.TaskFailed"
+
+addhandler toaster_buildhistory_dump
+toaster_buildhistory_dump[eventmask] = "bb.event.BuildCompleted"
 do_package[postfuncs] += "toaster_package_dumpdata "
 
 do_rootfs[postfuncs] += "toaster_image_dumpdata "
-- 
1.8.1.2


