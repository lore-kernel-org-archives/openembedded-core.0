Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SlxPs-0006tU-98
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:20:57 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2012 00:09:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166158066"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2012 00:09:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 00:09:36 -0700
Message-Id: <9b9efa96537f4977b158c29151e53d02600d2294.1341299168.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341299168.git.sgw@linux.intel.com>
References: <cover.1341299168.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341299168.git.sgw@linux.intel.com>
References: <cover.1341299168.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/17] populate_sdk: Allow for attempt only packages in the SDK
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
X-List-Received-Date: Tue, 03 Jul 2012 07:20:57 -0000

From: Mark Hatle <mark.hatle@windriver.com>

We want to be able to supply attempt only packages in the SDK in order to
support more advanced SDK images that more closely match specific image
recipes.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass |    2 ++
 meta/classes/populate_sdk_deb.bbclass  |    4 ++--
 meta/classes/populate_sdk_ipk.bbclass  |    3 ++-
 meta/classes/populate_sdk_rpm.bbclass  |    4 ++--
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index a3bf8c2..a0a0a80 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -8,7 +8,9 @@ SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${MULTIMACH_TARGET_SYS}"
 
 TOOLCHAIN_HOST_TASK ?= "task-sdk-host-nativesdk task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_TARGET_TASK ?= "task-core-standalone-sdk-target task-core-standalone-sdk-target-dbg"
+TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${DISTRO_VERSION}"
 
 RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index 920c89a..c3b3e0c 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -28,7 +28,7 @@ populate_sdk_deb () {
 	export INSTALL_BASEARCH_DEB="${DPKG_ARCH}"
 	export INSTALL_ARCHS_DEB="${PACKAGE_ARCHS}"
 	export INSTALL_PACKAGES_DEB="${TOOLCHAIN_TARGET_TASK}"
-	export INSTALL_PACKAGES_ATTEMPTONLY_DEB=""
+	export INSTALL_PACKAGES_ATTEMPTONLY_DEB="${TOOLCHAIN_TARGET_TASK_ATTEMPTONLY}"
 	export PACKAGES_LINGUAS_DEB=""
 	export INSTALL_TASK_DEB="populate_sdk-target"
 
@@ -44,7 +44,7 @@ populate_sdk_deb () {
 	export INSTALL_BASEARCH_DEB="${DEB_SDK_ARCH}"
 	export INSTALL_ARCHS_DEB="${SDK_PACKAGE_ARCHS}"
 	export INSTALL_PACKAGES_DEB="${TOOLCHAIN_HOST_TASK}"
-	export INSTALL_PACKAGES_ATTEMPTONLY_DEB=""
+	export INSTALL_PACKAGES_ATTEMPTONLY_DEB="${TOOLCHAIN_HOST_TASK_ATTEMPTONLY}"
 	export PACKAGES_LINGUAS_DEB=""
 	export INSTALL_TASK_DEB="populate_sdk-nativesdk"
 
diff --git a/meta/classes/populate_sdk_ipk.bbclass b/meta/classes/populate_sdk_ipk.bbclass
index c256c69..aa3efde 100644
--- a/meta/classes/populate_sdk_ipk.bbclass
+++ b/meta/classes/populate_sdk_ipk.bbclass
@@ -11,7 +11,6 @@ populate_sdk_ipk() {
 	package_update_index_ipk
 	package_generate_ipkg_conf
 
-	export INSTALL_PACKAGES_ATTEMPTONLY_IPK=""
 	export INSTALL_PACKAGES_LINGUAS_IPK=""
 	export INSTALL_TASK_IPK="populate_sdk"
 
@@ -19,6 +18,7 @@ populate_sdk_ipk() {
 	export INSTALL_ROOTFS_IPK="${SDK_OUTPUT}/${SDKTARGETSYSROOT}"
 	export INSTALL_CONF_IPK="${IPKGCONF_TARGET}"
 	export INSTALL_PACKAGES_IPK="${TOOLCHAIN_TARGET_TASK}"
+	export INSTALL_PACKAGES_ATTEMPTONLY_IPK="${TOOLCHAIN_TARGET_TASK_ATTEMPTONLY}"
 
 	export D=${INSTALL_ROOTFS_IPK}
 	export OFFLINE_ROOT=${INSTALL_ROOTFS_IPK}
@@ -31,6 +31,7 @@ populate_sdk_ipk() {
 	export INSTALL_ROOTFS_IPK="${SDK_OUTPUT}"
 	export INSTALL_CONF_IPK="${IPKGCONF_SDK}"
 	export INSTALL_PACKAGES_IPK="${TOOLCHAIN_HOST_TASK}"
+	export INSTALL_PACKAGES_ATTEMPTONLY_IPK="${TOOLCHAIN_HOST_TASK_ATTEMPTONLY}"
 
 	package_install_internal_ipk
 
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index e0adb8f..b115c27 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -33,7 +33,7 @@ populate_sdk_rpm () {
 	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
 	export INSTALL_CONFBASE_RPM="${RPMCONF_TARGET_BASE}"
 	export INSTALL_PACKAGES_RPM="${TOOLCHAIN_TARGET_TASK}"
-	export INSTALL_PACKAGES_ATTEMPTONLY_RPM=""
+	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${TOOLCHAIN_TARGET_TASK_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
 	export INSTALL_PROVIDENAME_RPM="/bin/sh /bin/bash /usr/bin/env /usr/bin/perl pkgconfig pkgconfig(pkg-config)"
 	export INSTALL_TASK_RPM="populate_sdk-target"
@@ -82,7 +82,7 @@ EOF
 	export INSTALL_PLATFORM_RPM="${SDK_ARCH}"
 	export INSTALL_CONFBASE_RPM="${RPMCONF_HOST_BASE}"
 	export INSTALL_PACKAGES_RPM="${TOOLCHAIN_HOST_TASK}"
-	export INSTALL_PACKAGES_ATTEMPTONLY_RPM=""
+	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${TOOLCHAIN_TARGET_HOST_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
 	export INSTALL_PROVIDENAME_RPM="/bin/sh /bin/bash /usr/bin/env /usr/bin/perl pkgconfig libGL.so()(64bit) libGL.so"
 	export INSTALL_TASK_RPM="populate_sdk_rpm-nativesdk"
-- 
1.7.7.6



