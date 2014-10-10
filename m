Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 65EB070703
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 18:28:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Oct 2014 11:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,693,1406617200"; d="scan'208";a="586884599"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.60])
	by orsmga001.jf.intel.com with ESMTP; 10 Oct 2014 11:28:52 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Oct 2014 13:29:11 -0500
Message-Id: <1412965751-9778-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] buildinfo: Added buildinfo recipe
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
X-List-Received-Date: Fri, 10 Oct 2014 18:28:53 -0000

Writes build information to target filesystem to help developers

[YOCTO #6770]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-extended/buildinfo/buildinfo_0.1.bb | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/buildinfo/buildinfo_0.1.bb

diff --git a/meta/recipes-extended/buildinfo/buildinfo_0.1.bb b/meta/recipes-extended/buildinfo/buildinfo_0.1.bb
new file mode 100644
index 0000000..b299efb
--- /dev/null
+++ b/meta/recipes-extended/buildinfo/buildinfo_0.1.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Writing build information on target filesystem"
+SECTION = "MISC"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+PR = "r0"
+
+inherit buildhistory
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
+do_install() {
+        # Write info to file
+        cat > build <<END
+-----------------------
+Build Configuration:  |
+-----------------------
+${@buildinfo_target(d)}
+-----------------------
+Layer Revisions:      |
+-----------------------
+${@buildhistory_get_metadata_revs(d)}
+END
+
+        # Install file with right permissions
+	install -d ${D}${sysconfdir}
+	install -m 0444 build ${D}${sysconfdir}
+}
-- 
1.9.1


