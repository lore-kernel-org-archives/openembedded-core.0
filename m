Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1F6DB6011A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 22:36:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2015 14:36:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,319,1444719600"; d="scan'208";a="855244938"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga002.fm.intel.com with ESMTP; 19 Nov 2015 14:36:54 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 14:25:17 +0000
Message-Id: <ca40198fb5585fc85c38af2934b5f6966a26794a.1447942163.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1447942163.git.mariano.lopez@linux.intel.com>
References: <cover.1447942163.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1447942163.git.mariano.lopez@linux.intel.com>
References: <cover.1447942163.git.mariano.lopez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCHv3 4/6] license.bbclass: Added function get_deployed_dependencies
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
X-List-Received-Date: Thu, 19 Nov 2015 22:36:55 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This change introduce a new function to get the dependencies
that were deployed. It uses BB_TASKDEPDATAto get all the
dependencies of the current task, so it is possible to get
different packages depending at what point this function is
called.

[YOCTO #6772]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/license.bbclass | 48 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index afcc708..f012783 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -141,6 +141,54 @@ def write_license_files(d, license_manifest, pkg_dic):
                         os.link(pkg_license, pkg_rootfs_license)
 
 
+def get_deployed_dependencies(d):
+    """
+    Get all the deployed dependencies of an image
+    """
+
+    deploy = {}
+    # Get all the dependencies for the current task (rootfs).
+    # Also get EXTRA_IMAGEDEPENDS because the bootloader is
+    # usually in this var and not listed in rootfs.
+    # At last, get the dependencies from boot classes because
+    # it might contain the bootloader.
+    taskdata = d.getVar("BB_TASKDEPDATA", True)
+    depends = list(set([dep[0] for dep
+                    in taskdata.itervalues()
+                    if not dep[0].endswith("-native")]))
+    extra_depends = d.getVar("EXTRA_IMAGEDEPENDS", True)
+    boot_depends = get_boot_dependencies(d)
+    depends.extend(extra_depends.split())
+    depends.extend(boot_depends.split())
+    depends = list(set(depends))
+
+    # To verify what was deployed it checks the rootfs dependencies against
+    # the SSTATE_MANIFESTS for "deploy" task.
+    # The manifest file name contains the arch. Because we are not running
+    # in the recipe context it is necessary to check every arch used.
+    sstate_manifest_dir = d.getVar("SSTATE_MANIFESTS", True)
+    sstate_archs = d.getVar("SSTATE_ARCHS", True)
+    extra_archs = d.getVar("PACKAGE_EXTRA_ARCHS", True)
+    archs = list(set(("%s %s" % (sstate_archs, extra_archs)).split()))
+    for dep in depends:
+        # Some recipes have an arch on their own, so we try that first.
+        special_arch = d.getVar("PACKAGE_ARCH_pn-%s" % dep, True)
+        if special_arch:
+            sstate_manifest_file = os.path.join(sstate_manifest_dir,
+                    "manifest-%s-%s.deploy" % (special_arch, dep))
+            if os.path.exists(sstate_manifest_file):
+                deploy[dep] = sstate_manifest_file
+                continue
+
+        for arch in archs:
+            sstate_manifest_file = os.path.join(sstate_manifest_dir,
+                    "manifest-%s-%s.deploy" % (arch, dep))
+            if os.path.exists(sstate_manifest_file):
+                deploy[dep] = sstate_manifest_file
+                break
+
+    return deploy
+
 def get_boot_dependencies(d):
     """
     Return the dependencies from boot tasks
-- 
1.8.4.5


