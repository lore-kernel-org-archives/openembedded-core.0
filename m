Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C373B6D1BB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 16:09:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Nov 2013 09:09:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="402213578"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.91])
	by orsmga001.jf.intel.com with ESMTP; 01 Nov 2013 09:09:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Nov 2013 16:09:44 +0000
Message-Id: <2d88a672d9c4e0ed7c12de01eeca61b72aa9bb4d.1383322030.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383322030.git.paul.eggleton@linux.intel.com>
References: <cover.1383322030.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1383322030.git.paul.eggleton@linux.intel.com>
References: <cover.1383322030.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] toaster: add class to dump toaster-tracked data
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
X-List-Received-Date: Fri, 01 Nov 2013 16:09:50 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Adding a new bbclass that will collect and send relevant
data from the task context to the Toaster UI.

This bbclass consists of postfuncs that get executed
right after the main task func, and in the same context.
This allows data gathering in a synchronous manner during
the build, guaranteeing data integrity. This approach also
preserves the task signatures.

The data is moved to the UI through the event system.

There is no performance impact if the class is disabled.

License is MIT.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/toaster.bbclass | 110 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 meta/classes/toaster.bbclass

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
new file mode 100644
index 0000000..7dbb384
--- /dev/null
+++ b/meta/classes/toaster.bbclass
@@ -0,0 +1,110 @@
+#
+# Toaster helper class
+#
+# Copyright (C) 2013 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+#
+# This bbclass is designed to extract data used by OE-Core during the build process,
+# for recording in the Toaster system.
+# The data access is synchronous, preserving the build data integrity across
+# different builds.
+#
+# The data is transferred through the event system, using the MetadataEvent objects.
+#
+# The model is to enable the datadump functions as postfuncs, and have the dump
+# executed after the real taskfunc has been executed. This prevents task signature changing
+# is toaster is enabled or not. Build performance is not affected if Toaster is not enabled.
+#
+# To enable, use INHERIT in local.conf:
+#
+#       INHERIT += "toaster"
+#
+#
+#
+#
+
+# 1. Dump package file info data
+
+python toaster_package_dumpdata() {
+    """
+    Dumps the data created by emit_pkgdata
+    """
+    # replicate variables from the package.bbclass
+
+    packages = d.getVar('PACKAGES', True)
+    pkgdest = d.getVar('PKGDEST', True)
+
+    pkgdatadir = d.getVar('PKGDESTWORK', True)
+
+
+    # scan and send data for each package
+    import ast
+    import fnmatch
+
+    lpkgdata = {}
+    for pkg in packages.split():
+
+        subdata_file = pkgdatadir + "/runtime/%s" % pkg
+        lpkgdata = {}
+
+        sf = open(subdata_file, "r")
+        line = sf.readline()
+        while line:
+            (n, v) = line.rstrip().split(":", 1)
+            if pkg in n:
+                n = n.replace("_" + pkg, "")
+            lpkgdata[n] = v.strip()
+            line = sf.readline()
+            pkgsplitname = os.path.join(pkgdest, pkg)
+            # replace FILES_INFO data with a dictionary of file name - file size
+            if n == 'FILES_INFO':
+                filesizedata = {}
+                val = v.strip().replace('\\\'', '\'')
+                dictval = ast.literal_eval(val)
+                for parent, dirlist in dictval.items():
+                    idx = parent.find(pkgsplitname)
+                    if idx > -1:
+                        parent = parent[idx+len(pkgsplitname):]
+                    else:
+                        bb.error("Invalid path while looking for file ", parent)
+                    for basename in dirlist:
+                        fullpath = os.path.join(parent, basename)
+                        try:
+                            filesizedata[fullpath] = os.stat(pkgsplitname + fullpath).st_size
+                        except OSError:
+                            # we may hit a symlink that is not pointing correctly over package-split
+                            filesizedata[fullpath] = 0
+                lpkgdata[n] = filesizedata
+
+        # Fire an event containing the pkg data
+        bb.event.fire(bb.event.MetadataEvent("SinglePackageInfo", lpkgdata), d)
+}
+
+# 2. Dump output image files information
+
+python toaster_image_dumpdata() {
+    """
+    Image filename for output images is not standardized.
+    image_types.bbclass will spell out IMAGE_CMD_xxx variables that actually
+    have hardcoded ways to create image file names in them.
+    So we look for files starting with the set name.
+    """
+
+    deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE', True);
+    image_name = d.getVar('IMAGE_NAME', True);
+
+    image_info_data = {}
+
+    for dirpath, dirnames, filenames in os.walk(deploy_dir_image):
+        for fn in filenames:
+            if fn.startswith(image_name):
+                image_info_data[dirpath + fn] = os.stat(os.path.join(dirpath, fn)).st_size
+
+    bb.event.fire(bb.event.MetadataEvent("ImageFileSize",image_info_data), d)
+}
+
+
+do_package[postfuncs] += "toaster_package_dumpdata "
+
+do_rootfs[postfuncs] += "toaster_image_dumpdata "
-- 
1.8.1.2


