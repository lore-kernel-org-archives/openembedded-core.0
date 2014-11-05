Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E898D71FD4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 19:21:46 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 05 Nov 2014 11:19:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="484829099"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.47])
	by orsmga003.jf.intel.com with ESMTP; 05 Nov 2014 11:20:24 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Nov 2014 13:21:58 -0600
Message-Id: <1415215318-13465-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v6] image-buildinfo.bbclass: New class, writes
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
X-List-Received-Date: Wed, 05 Nov 2014 19:21:55 -0000

build information to target filesystem on /etc/build

such as enabled layers, their current status and commit

squashspaces was moved to oe/utils.py to make it available

to different classes and avoid code duplication.

[YOCTO #6770]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/buildhistory.bbclass    | 25 ++++++-------
 meta/classes/image-buildinfo.bbclass | 69 ++++++++++++++++++++++++++++++++++++
 meta/lib/oe/utils.py                 |  4 +++
 3 files changed, 83 insertions(+), 15 deletions(-)
 create mode 100644 meta/classes/image-buildinfo.bbclass

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 8b5d5c2..2b5f84a 100644
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
 
@@ -525,11 +525,6 @@ def buildhistory_get_metadata_revs(d):
             for i in layers]
     return '\n'.join(medadata_revs)
 
-
-def squashspaces(string):
-    import re
-    return re.sub("\s+", " ", string).strip()
-
 def outputvars(vars, listvars, d):
     vars = vars.split()
     listvars = listvars.split()
@@ -538,7 +533,7 @@ def outputvars(vars, listvars, d):
         value = d.getVar(var, True) or ""
         if var in listvars:
             # Squash out spaces
-            value = squashspaces(value)
+            value = oe.utils.squashspaces(value)
         ret += "%s = %s\n" % (var, value)
     return ret.rstrip('\n')
 
diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
new file mode 100644
index 0000000..aa17cc8
--- /dev/null
+++ b/meta/classes/image-buildinfo.bbclass
@@ -0,0 +1,69 @@
+#
+# Writes build information to target filesystem on /etc/build
+#
+# Copyright (C) 2014 Intel Corporation
+# Author: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@intel.com>
+#
+# Licensed under the MIT license, see COPYING.MIT for details
+#
+# Usage: add INHERIT += "image-buildinfo" to your conf file
+#
+
+# Desired variables to display 
+IMAGE_BUILDINFO_VARS ?= "DISTRO DISTRO_VERSION"
+
+# From buildhistory.bbclass
+def image_buildinfo_outputvars(vars, listvars, d): 
+    vars = vars.split()
+    listvars = listvars.split()
+    ret = ""
+    for var in vars:
+        value = d.getVar(var, True) or ""
+        if (d.getVarFlag(var, 'type') == "list"):
+            value = oe.utils.squashspaces(value)
+        ret += "%s = %s\n" % (var, value)
+    return ret.rstrip('\n')
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
+        vars = (d.getVar("IMAGE_BUILDINFO_VARS", True) or "")
+        listvars = (d.getVar("IMAGE_BUILDINFO_LVARS", True) or "")
+        return image_buildinfo_outputvars(vars, listvars, d)
+
+# Write build information to target filesystem
+buildinfo () {
+cat > ${IMAGE_ROOTFS}${sysconfdir}/build << END
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
+
+IMAGE_PREPROCESS_COMMAND += "buildinfo;"
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 3544256..1f84ba4 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -180,3 +180,7 @@ def multiprocess_exec(commands, function):
         pool.terminate()
         pool.join()
         raise
+
+def squashspaces(string):
+    import re
+    return re.sub("\s+", " ", string).strip()
-- 
1.9.1


