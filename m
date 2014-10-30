Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 184BE65D59
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 01:08:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Oct 2014 18:08:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,281,1413270000"; d="scan'208";a="627996790"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.47])
	by orsmga002.jf.intel.com with ESMTP; 29 Oct 2014 18:08:06 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Oct 2014 19:07:54 -0600
Message-Id: <1414631274-12001-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] image.bbclass: Added buildinfo IMAGE_FEATURE
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
X-List-Received-Date: Thu, 30 Oct 2014 01:08:13 -0000

Writes build information to target filesystem to help developers

[YOCTO #6770]

Signed-off-by: Alejandro Hernandez  <alejandro.hernandez@linux.intel.com>
---
 meta/classes/image.bbclass | 46 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 940bdb6..fe7cd43 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -22,7 +22,7 @@ inherit ${TESTIMAGECLASS}
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
-IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs"
+IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs buildinfo"
 
 # rootfs bootstrap install
 ROOTFS_BOOTSTRAP_INSTALL = "${@bb.utils.contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
@@ -181,6 +181,9 @@ POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
 SYSTEMD_DEFAULT_TARGET ?= '${@bb.utils.contains("IMAGE_FEATURES", "x11-base", "graphical.target", "multi-user.target", d)}'
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; ", "", d)}'
 
+# Write build information to target FS
+IMAGE_PREPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "buildinfo", "buildinfo; ", "",d)}'
+
 # some default locales
 IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
 
@@ -411,6 +414,47 @@ rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 }
 
+def get_layer_git_status(path):
+    f = os.popen("cd %s; git diff --stat 2>&1 | tail -n 1" % path)
+    data = f.read()
+    if f.close() is None:
+        if len(data) != 0:
+            return "-- modified"
+    return ""
+
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
+inherit buildhistory
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
 do_fetch[noexec] = "1"
 do_unpack[noexec] = "1"
 do_patch[noexec] = "1"
-- 
1.9.1


