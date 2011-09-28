Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8oJ9-00041r-LG
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 09:11:56 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 00:06:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="21360974"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.219])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 00:06:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 00:05:58 -0700
Message-Id: <319ee35b892b3df0880673e616a9106515ecedb2.1317193251.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 22/29] multilib: add MLPREFIX to deploy folder
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Sep 2011 07:11:59 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Add MLPREFIX to multilib deploy forlder to avoid the confliction between
multilib and normal package deploy directory.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/multilib.bbclass    |    5 -----
 meta/classes/package_rpm.bbclass |   10 ++++++++--
 meta/classes/rootfs_rpm.bbclass  |    2 +-
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 6c0dd37..1aed2a9 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -92,9 +92,4 @@ python __anonymous () {
     multilib_map_variable("PACKAGES_DYNAMIC", variant, d)
     multilib_map_variable("PACKAGE_INSTALL", variant, d)
     multilib_map_variable("INITSCRIPT_PACKAGES", variant, d)
-
-    package_arch = d.getVar("PACKAGE_ARCH", True)
-    machine_arch = d.getVar("MACHINE_ARCH", True)
-    if package_arch == machine_arch:
-        d.setVar("PACKAGE_ARCH", variant + "_" + package_arch)
 }
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 775d525..45de0f8 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -903,8 +903,14 @@ python do_package_rpm () {
 	rpmbuild = bb.data.getVar('RPMBUILD', d, True)
 	targetsys = bb.data.getVar('TARGET_SYS', d, True)
 	targetvendor = bb.data.getVar('TARGET_VENDOR', d, True)
-	pkgwritedir = bb.data.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH}', d)
-	pkgarch = bb.data.expand('${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}', d)
+	package_arch = bb.data.getVar('PACKAGE_ARCH', d, True) or ""
+	if package_arch not in "all any noarch".split():
+		ml_prefix = (bb.data.getVar('MLPREFIX', d, True) or "").replace("-", "_")
+		bb.data.setVar('PACKAGE_ARCH_EXTEND', ml_prefix + package_arch, d)
+	else:
+		bb.data.setVar('PACKAGE_ARCH_EXTEND', package_arch, d)
+	pkgwritedir = bb.data.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}', d)
+	pkgarch = bb.data.expand('${PACKAGE_ARCH_EXTEND}${TARGET_VENDOR}-${TARGET_OS}', d)
 	magicfile = bb.data.expand('${STAGING_DIR_NATIVE}/usr/share/misc/magic.mgc', d)
 	bb.mkdirhier(pkgwritedir)
 	os.chmod(pkgwritedir, 0755)
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 5ac6bca..dd370b2 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -220,8 +220,8 @@ python () {
             default_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False)
             if default_tune:
                 localdata.setVar("DEFAULTTUNE", default_tune)
-            localdata.setVar("MACHINE_ARCH", eext[1] + "_" + localdata.getVar("MACHINE_ARCH", False))
             package_archs = localdata.getVar("PACKAGE_ARCHS", True) or ""
+            package_archs = " ".join([i in "all noarch any".split() and i or eext[1]+"_"+i for i in package_archs.split()])
             ml_package_archs += " " + package_archs
             ml_prefix_list += " " + eext[1]
             #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
-- 
1.7.6



