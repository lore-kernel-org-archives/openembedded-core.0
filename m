Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 669BA60746
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 22:36:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2015 14:36:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,319,1444719600"; d="scan'208";a="855244931"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga002.fm.intel.com with ESMTP; 19 Nov 2015 14:36:53 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 14:25:16 +0000
Message-Id: <dd8ab12d6d53a748e6fdb28a374018c70ed9a605.1447942163.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1447942163.git.mariano.lopez@linux.intel.com>
References: <cover.1447942163.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1447942163.git.mariano.lopez@linux.intel.com>
References: <cover.1447942163.git.mariano.lopez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCHv3 3/6] license.bbclass: Added get_boot_dependencies function
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
X-List-Received-Date: Thu, 19 Nov 2015 22:36:52 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This function gets the dependencies from the classes that
create a boot image, this is required because sometimes
the bootloader dependecy is in these classes. The current
classes covered are bootimg and bootdirectdisk because
these are the only clases that add dependencies.

[YOCTO #6772]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/license.bbclass | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 62222f2..afcc708 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -141,6 +141,42 @@ def write_license_files(d, license_manifest, pkg_dic):
                         os.link(pkg_license, pkg_rootfs_license)
 
 
+def get_boot_dependencies(d):
+    """
+    Return the dependencies from boot tasks
+    """
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
+        info_file = os.path.join(d.getVar("LICENSE_DIRECTORY", True),
+                dep, "recipeinfo")
+        # If the recipe and dependency name is the same
+        if os.path.exists(info_file):
+            depends = "%s %s" % (depends, dep)
+        # We need to search for the provider of the dependency
+        else:
+            for taskdep in taskdepdata.itervalues():
+                # The fifth field contains what the task provides
+                if dep in taskdep[4]:
+                    info_file = os.path.join(
+                            d.getVar("LICENSE_DIRECTORY", True),
+                            taskdep[0], "recipeinfo")
+                    if os.path.exists(info_file):
+                        depends = "%s %s" % (depends, taskdep[0])
+                        break
+    return depends
+
 python do_populate_lic() {
     """
     Populate LICENSE_DIRECTORY with licenses.
-- 
1.8.4.5


