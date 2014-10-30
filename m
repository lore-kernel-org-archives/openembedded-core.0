Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3CE9A65C87
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 19:19:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Oct 2014 12:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,288,1413270000"; d="scan'208";a="623684522"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.47])
	by fmsmga002.fm.intel.com with ESMTP; 30 Oct 2014 12:19:20 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Oct 2014 13:19:19 -0600
Message-Id: <1414696759-12871-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v3] buildinfo.bblass: Added buildinfo class
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
X-List-Received-Date: Thu, 30 Oct 2014 19:19:55 -0000

Writes build information to target filesystem to help developers

[YOCTO #6770]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/buildinfo.bbclass | 90 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 meta/classes/buildinfo.bbclass

diff --git a/meta/classes/buildinfo.bbclass b/meta/classes/buildinfo.bbclass
new file mode 100644
index 0000000..f00b073
--- /dev/null
+++ b/meta/classes/buildinfo.bbclass
@@ -0,0 +1,90 @@
+#
+# Writes build information to target filesystem
+#
+# Usage: add INHERIT += "buildinfo" to your conf file
+#
+# Based in part on buildhistory.bbclass
+#
+# Copyright (C) 2014 Intel Corporation
+# Author: Alejandro Enedino Hernandez Samaniego <alejandro.hernandez@intel.com>
+#
+# Licensed under the MIT license, see COPYING.MIT for details
+#
+
+# From buildhistory.bbclass
+def squashspaces(string):
+    import re
+    return re.sub("\s+", " ", string).strip()
+
+# From buildhistory.bbclass
+def outputvars(vars, listvars, d): 
+    vars = vars.split()
+    listvars = listvars.split()
+    ret = ""
+    for var in vars:
+        value = d.getVar(var, True) or ""
+        if var in listvars:
+            value = squashspaces(value)
+        ret += "%s = %s\n" % (var, value)
+    return ret.rstrip('\n')
+
+# From buildhistory.bbclass
+def base_get_metadata_git_branch(path, d): 
+    branch = os.popen('cd %s; git branch 2>&1 | grep "^* " | tr -d "* "' % path).read()
+    if len(branch) != 0:
+        return branch
+    return "<unknown>"
+
+# From buildhistory.bbclass
+def base_get_metadata_git_revision(path, d): 
+    f = os.popen("cd %s; git log -n 1 --pretty=oneline -- 2>&1" % path)
+    data = f.read()
+    if f.close() is None:
+        rev = data.split(" ")[0]
+        if len(rev) != 0:
+            return rev 
+    return "<unknown>"
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
+        return outputvars(vars, listvars, d)
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
+
+IMAGE_PREPROCESS_COMMAND += "buildinfo;"
-- 
1.9.1


