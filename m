Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8FC7A65D4F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 00:25:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Oct 2014 17:25:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,290,1413270000"; d="scan'208";a="614439655"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.47])
	by fmsmga001.fm.intel.com with ESMTP; 30 Oct 2014 17:25:08 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Oct 2014 18:25:06 -0600
Message-Id: <1414715106-4840-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v4] buildinfo.bblass: Added buildinfo class
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
X-List-Received-Date: Fri, 31 Oct 2014 00:25:12 -0000

Writes build information to target filesystem on /etc/build, such as 

enabled layers, their current status and commit, squashspaces and outputvars 

functions moved from buidlhistory.bbclass to oe/utils.py, to be used by 

different classes and avoid code duplication.

[YOCTO #6770]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 39 ++++++++--------------------
 meta/classes/buildinfo.bbclass    | 53 +++++++++++++++++++++++++++++++++++++++
 meta/lib/oe/utils.py              | 16 ++++++++++++
 3 files changed, 80 insertions(+), 28 deletions(-)
 create mode 100644 meta/classes/buildinfo.bbclass

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 8b5d5c2..3f87f08 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -155,7 +155,7 @@ python buildhistory_emit_pkghistory() {
         with open(os.path.join(pkgdata_dir, pn)) as f:
             for line in f.readlines():
                 if line.startswith('PACKAGES: '):
-                    packages = squashspaces(line.split(': ', 1)[1])
+                    packages = oe.utils.squashspaces(line.split(': ', 1)[1])
                     break
     except IOError as e:
         if e.errno == errno.ENOENT:
@@ -181,7 +181,7 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.pe = pe
     rcpinfo.pv = pv
     rcpinfo.pr = pr
-    rcpinfo.depends = sortlist(squashspaces(d.getVar('DEPENDS', True) or ""))
+    rcpinfo.depends = sortlist(oe.utils.squashspaces(d.getVar('DEPENDS', True) or ""))
     rcpinfo.packages = packages
     write_recipehistory(rcpinfo, d)
 
@@ -222,13 +222,13 @@ python buildhistory_emit_pkghistory() {
         pkginfo.pkge = pkge
         pkginfo.pkgv = pkgv
         pkginfo.pkgr = pkgr
-        pkginfo.rprovides = sortpkglist(squashspaces(pkgdata.get('RPROVIDES', "")))
-        pkginfo.rdepends = sortpkglist(squashspaces(pkgdata.get('RDEPENDS', "")))
-        pkginfo.rrecommends = sortpkglist(squashspaces(pkgdata.get('RRECOMMENDS', "")))
-        pkginfo.rsuggests = sortpkglist(squashspaces(pkgdata.get('RSUGGESTS', "")))
-        pkginfo.rreplaces = sortpkglist(squashspaces(pkgdata.get('RREPLACES', "")))
-        pkginfo.rconflicts = sortpkglist(squashspaces(pkgdata.get('RCONFLICTS', "")))
-        pkginfo.files = squashspaces(pkgdata.get('FILES', ""))
+        pkginfo.rprovides = sortpkglist(oe.utils.squashspaces(pkgdata.get('RPROVIDES', "")))
+        pkginfo.rdepends = sortpkglist(oe.utils.squashspaces(pkgdata.get('RDEPENDS', "")))
+        pkginfo.rrecommends = sortpkglist(oe.utils.squashspaces(pkgdata.get('RRECOMMENDS', "")))
+        pkginfo.rsuggests = sortpkglist(oe.utils.squashspaces(pkgdata.get('RSUGGESTS', "")))
+        pkginfo.rreplaces = sortpkglist(oe.utils.squashspaces(pkgdata.get('RREPLACES', "")))
+        pkginfo.rconflicts = sortpkglist(oe.utils.squashspaces(pkgdata.get('RCONFLICTS', "")))
+        pkginfo.files = oe.utils.squashspaces(pkgdata.get('FILES', ""))
         for filevar in pkginfo.filevars:
             pkginfo.filevars[filevar] = pkgdata.get(filevar, "")
 
@@ -525,36 +525,19 @@ def buildhistory_get_metadata_revs(d):
             for i in layers]
     return '\n'.join(medadata_revs)
 
-
-def squashspaces(string):
-    import re
-    return re.sub("\s+", " ", string).strip()
-
-def outputvars(vars, listvars, d):
-    vars = vars.split()
-    listvars = listvars.split()
-    ret = ""
-    for var in vars:
-        value = d.getVar(var, True) or ""
-        if var in listvars:
-            # Squash out spaces
-            value = squashspaces(value)
-        ret += "%s = %s\n" % (var, value)
-    return ret.rstrip('\n')
-
 def buildhistory_get_imagevars(d):
     if d.getVar('BB_WORKERCONTEXT', True) != '1':
         return ""
     imagevars = "DISTRO DISTRO_VERSION USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES IMAGE_LINGUAS IMAGE_INSTALL BAD_RECOMMENDATIONS NO_RECOMMENDATIONS PACKAGE_EXCLUDE ROOTFS_POSTPROCESS_COMMAND IMAGE_POSTPROCESS_COMMAND"
     listvars = "USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES IMAGE_LINGUAS IMAGE_INSTALL BAD_RECOMMENDATIONS PACKAGE_EXCLUDE"
-    return outputvars(imagevars, listvars, d)
+    return oe.utils.outputvars(imagevars, listvars, d)
 
 def buildhistory_get_sdkvars(d):
     if d.getVar('BB_WORKERCONTEXT', True) != '1':
         return ""
     sdkvars = "DISTRO DISTRO_VERSION SDK_NAME SDK_VERSION SDKMACHINE SDKIMAGE_FEATURES BAD_RECOMMENDATIONS NO_RECOMMENDATIONS PACKAGE_EXCLUDE"
     listvars = "SDKIMAGE_FEATURES BAD_RECOMMENDATIONS PACKAGE_EXCLUDE"
-    return outputvars(sdkvars, listvars, d)
+    return oe.utils.outputvars(sdkvars, listvars, d)
 
 
 def buildhistory_get_cmdline(d):
diff --git a/meta/classes/buildinfo.bbclass b/meta/classes/buildinfo.bbclass
new file mode 100644
index 0000000..a0220b2
--- /dev/null
+++ b/meta/classes/buildinfo.bbclass
@@ -0,0 +1,53 @@
+#
+# Writes build information to target filesystem
+#
+# Usage: add INHERIT += "buildinfo" to your conf file
+#
+# Copyright (C) 2014 Intel Corporation
+# Author: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@intel.com>
+#
+# Licensed under the MIT license, see COPYING.MIT for details
+#
+
+# Gets git branch's status (clean or dirty)
+def get_layer_git_status(path):
+    f = os.popen("cd %s; git diff --stat 2>&1 | tail -n 1" % path)
+    data = f.read()
+    if f.close() is None:
+        if len(data) != 0:
+            return "-- modified"
+    return ""
+
+# Returns layer revisions along with their respective status
+def get_layer_revs(d):
+    layers = (d.getVar("BBLAYERS", True) or "").split()
+    medadata_revs = ["%-17s = %s:%s %s" % (os.path.basename(i), \
+        base_get_metadata_git_branch(i, None).strip(), \
+        base_get_metadata_git_revision(i, None), \
+        get_layer_git_status(i)) \
+            for i in layers]
+    return '\n'.join(medadata_revs)
+
+def buildinfo_target(d):
+        # Get context
+        if d.getVar('BB_WORKERCONTEXT', True) != '1':
+                return ""
+        # Single and list variables to be read
+        vars = "DISTRO DISTRO_VERSION BB_VERSION BUILD_SYS TARGET_SYS MACHINE USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES IMAGE_LINGUAS IMAGE_INSTALL PACKAGE_EXCLUDE"
+        listvars = "USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES IMAGE_LINGUAS IMAGE_INSTALL PACKAGE_EXCLUDE"
+        return oe.utils.outputvars(vars, listvars, d)
+
+# Write build information to target filesystem
+buildinfo () {
+cat > ${IMAGE_ROOTFS}${sysconfdir}/build <<END
+-----------------------
+Build Configuration:  |
+-----------------------
+${@buildinfo_target(d)}
+-----------------------
+Layer Revisions:      |   
+-----------------------
+${@get_layer_revs(d)}
+END
+}
+IMAGE_PREPROCESS_COMMAND += "buildinfo;"
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 3544256..cbdee4d 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -180,3 +180,19 @@ def multiprocess_exec(commands, function):
         pool.terminate()
         pool.join()
         raise
+
+def squashspaces(string):
+    import re
+    return re.sub("\s+", " ", string).strip()
+
+def outputvars(vars, listvars, d):
+    vars = vars.split()
+    listvars = listvars.split()
+    ret = ""
+    for var in vars:
+        value = d.getVar(var, True) or ""
+        if var in listvars:
+            # Squash out spaces
+            value = squashspaces(value)
+        ret += "%s = %s\n" % (var, value)
+    return ret.rstrip('\n')
-- 
1.9.1


