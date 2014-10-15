Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6E07180F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 23:05:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Oct 2014 15:58:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,728,1406617200"; d="scan'208";a="619502453"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.60])
	by orsmga002.jf.intel.com with ESMTP; 15 Oct 2014 16:03:43 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Oct 2014 18:03:59 -0500
Message-Id: <1413414239-12159-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] image.bbclass: Added buildinfo IMAGE_FEATURE
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
X-List-Received-Date: Wed, 15 Oct 2014 23:05:03 -0000

Writes build information to target filesystem to help developers

[YOCTO #6770]

Signed-off-by: Alejandro Hernandez  <alejandro.hernandez@linux.intel.com>
---
 meta/classes/image.bbclass | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 940bdb6..d7b54fe 100644
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
 
@@ -411,6 +414,30 @@ rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 }
 
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
+${@buildhistory_get_metadata_revs(d)}
+END
+}
+
 do_fetch[noexec] = "1"
 do_unpack[noexec] = "1"
 do_patch[noexec] = "1"
-- 
1.8.3.1


