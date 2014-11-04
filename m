Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1485260E49
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 18:09:18 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 04 Nov 2014 10:07:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="484475539"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.47])
	by orsmga003.jf.intel.com with ESMTP; 04 Nov 2014 10:07:45 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Nov 2014 12:09:13 -0600
Message-Id: <1415124553-9122-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v5] image-buildinfo.bbclass: New class, writes
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
X-List-Received-Date: Tue, 04 Nov 2014 18:09:25 -0000

build information to target filesystem on /etc/build

such as enabled layers, their current status and commit.

[YOCTO #6770]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/image-buildinfo.bbclass | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 meta/classes/image-buildinfo.bbclass

diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
new file mode 100644
index 0000000..d695d24
--- /dev/null
+++ b/meta/classes/image-buildinfo.bbclass
@@ -0,0 +1,76 @@
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
+# Desired variables to display 
+# * If it is a list if values it must be present in both (e.g. IMAGE_FEATURES)
+
+IMAGE_BUILDINFO_VARS ?= "DISTRO DISTRO_VERSION IMAGE_FEATURES IMAGE_INSTALL"
+IMAGE_BUILDINFO_LVARS ?= "IMAGE_FEATURES IMAGE_INSTALL"
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
+        return outputvars(vars, listvars, d)
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
-- 
1.9.1


