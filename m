Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A6DEE7710D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 18:35:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 09 Nov 2015 10:35:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,266,1444719600"; d="scan'208";a="681579012"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga003.jf.intel.com with ESMTP; 09 Nov 2015 10:35:07 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 10:23:47 +0000
Message-Id: <94f00319ebc710b27356de8c8ce8b7f48f1ad2c8.1447063562.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1447063562.git.mariano.lopez@linux.intel.com>
References: <cover.1447063562.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1447063562.git.mariano.lopez@linux.intel.com>
References: <cover.1447063562.git.mariano.lopez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 2/6] license.bbclass: Added get_boot_dependencies function
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
X-List-Received-Date: Mon, 09 Nov 2015 18:35:07 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This function gets the dependencies from the classes that
create a boot image, this is required because sometimes
the bootloader dependecy is in these classes. The current
classes covered are bootimg and bootdirectdisk because
these are the only clases that add dependencies.

[YOCTO #6772]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/license.bbclass | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 98f1733..d1bfe61 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -49,6 +49,37 @@ python license_create_manifest() {
     write_license_files(d, rootfs_license_manifest, pkg_dic)
 }
 
+def get_boot_dependencies(d):
+    """ Return the dependencies from boot tasks """
+
+    depends = ""
+    boot_depends_string = ""
+    taskdepdata = d.getVar("BB_TASKDEPDATA", True)
+    # Only bootimg and bootdirectdisk include the depends flag
+    boot_tasks = ["do_bootimg", "do_bootdirectdisk",]
+
+    for task in boot_tasks:
+        boot_depends_string = "%s %s" % (boot_depends_string,
+                d.getVarFlag(task, "depends", True) or "")
+    boot_depends = [dep.split(":")[0] for dep
+                in boot_depends_string.split()
+                if not dep.split(":")[0].endswith("-native")]
+    for dep in boot_depends:
+        pkgs_file = os.path.join(d.getVar('PKGDATA_DIR', True), dep)
+        # If the package and dependency name is the same
+        if os.path.exists(pkgs_file):
+            depends = "%s %s" % (depends, dep)
+        # We need to search for the provider of the dependency
+        else:
+            for taskdep in taskdepdata.itervalues():
+                # The fifth field contains what the task provides
+                if dep in taskdep[4]:
+                    pkgs_file = os.path.join(d.getVar('PKGDATA_DIR', True), taskdep[0])
+                    if os.path.isfile(pkgs_file):
+                        depends = "%s %s" % (depends, taskdep[0])
+                        break
+    return depends
+
 def write_license_files(d, license_manifest, pkg_dic):
     import re
 
-- 
1.8.4.5


