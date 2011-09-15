Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R42Uu-0001UW-E1
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 05:20:20 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2011 20:15:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,384,1312182000"; d="scan'208";a="17264346"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.252])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Sep 2011 20:15:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 20:14:51 -0700
Message-Id: <b15a8e267603eb96e1108f43465868a2002279ce.1316056194.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316056194.git.sgw@linux.intel.com>
References: <cover.1316056194.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316056194.git.sgw@linux.intel.com>
References: <cover.1316056194.git.sgw@linux.intel.com>
Subject: [RC2 PULL 02/13] package_deb.bbclass, populate_sdk_deb.bbclass: fix meta-toolchain-gmae build
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
X-List-Received-Date: Thu, 15 Sep 2011 03:20:20 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

[YOCTO #1070]

Currently with deb packaging, we have 2 issues when running
"bitbake meta-toolchain-gmae".

1) when MACHINE="qemux86", SDKMACHINE="i686", INSTALL_BASEARCH_DEB is "i686",
too. This causes the following ERROR:
| E: Couldn't find package task-sdk-host-nativesdk
NOTE: package meta-toolchain-gmae-1.0-r6: task do_populate_sdk: Failed

This is becasue: due to the DPKG_ARCH mapping, we create such a deb package
tmp/deploy/deb/i686-nativesdk/task-sdk-host-nativesdk_1.0-r10_i386.deb; dpkg
can't recoginze the package. We need to map INSTALL_BASEARCH_DEB in the same
way.

2) when MACHINE="qemux86", SDKMACHINE="x86_64", INSTALL_BASEARCH_DEB is
"x86_64", too.
We get such an ERROR:
| E: Couldn't find package task-cross-canadian-i586
NOTE: package meta-toolchain-gmae-1.0-r6: task do_populate_sdk: Failed

This is because: dpkg can't recognize the generated package
tmp/deploy/deb/x86_64-nativesdk/task-cross-canadian-i586_1.0-r0_i386.deb
Here the "i386" suffix is incorrect and should be "x86_64" -- the i386
comes from the line
DPKG_ARCH_i586 ?= "i386" in package_deb.bbclass.
However, for canadian package, actually here the overriding of DPKG (from
"x86-64" to "i386") should not happen -- it accidently happens just because
TARGET_ARCH exists in OVERRIDES. We can move the overriding logic to the
anonymous python function to work this around.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/classes/package_deb.bbclass      |   10 ++++------
 meta/classes/populate_sdk_deb.bbclass |    6 +++++-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 87e20da..5a32047 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -6,13 +6,7 @@ inherit package
 
 IMAGE_PKGTYPE ?= "deb"
 
-# Map TARGET_ARCH to Debian's ideas about architectures
 DPKG_ARCH ?= "${TARGET_ARCH}" 
-DPKG_ARCH_x86 ?= "i386"
-DPKG_ARCH_i486 ?= "i386"
-DPKG_ARCH_i586 ?= "i386"
-DPKG_ARCH_i686 ?= "i386"
-DPKG_ARCH_pentium ?= "i386"
 
 PKGWRITEDIRDEB = "${WORKDIR}/deploy-debs"
 
@@ -418,6 +412,10 @@ python () {
         bb.data.setVarFlag('do_package_write_deb', 'depends', " ".join(deps), d)
         bb.data.setVarFlag('do_package_write_deb', 'fakeroot', "1", d)
         bb.data.setVarFlag('do_package_write_deb_setscene', 'fakeroot', "1", d)
+
+    # Map TARGET_ARCH to Debian's ideas about architectures
+    if bb.data.getVar('DPKG_ARCH', d, True) in ["x86", "i486", "i586", "i686", "pentium"]:
+        bb.data.setVar('DPKG_ARCH', 'i386', d)
 }
 
 python do_package_write_deb () {
diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index 40516b8..2cff69e 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -2,6 +2,10 @@ do_populate_sdk[depends] += "dpkg-native:do_populate_sysroot apt-native:do_popul
 do_populate_sdk[recrdeptask] += "do_package_write_deb"
 
 
+DEB_SDK_ARCH = "${@[bb.data.getVar('SDK_ARCH', d, 1), "i386"]\
+                [bb.data.getVar('SDK_ARCH', d, 1) in \
+                ["x86", "i486", "i586", "i686", "pentium"]]}"
+
 populate_sdk_post_deb () {
 
 	local target_rootfs=$1
@@ -37,7 +41,7 @@ fakeroot populate_sdk_deb () {
 	## install nativesdk ##
 	echo "Installing NATIVESDK packages"
 	export INSTALL_ROOTFS_DEB="${SDK_OUTPUT}"
-	export INSTALL_BASEARCH_DEB="${SDK_ARCH}"
+	export INSTALL_BASEARCH_DEB="${DEB_SDK_ARCH}"
 	export INSTALL_ARCHS_DEB="${SDK_PACKAGE_ARCHS}"
 	export INSTALL_PACKAGES_NORMAL_DEB="${TOOLCHAIN_HOST_TASK}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_DEB=""
-- 
1.7.6



