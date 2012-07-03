Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SlxPs-0006xS-7F
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:20:56 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2012 00:09:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166158062"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2012 00:09:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 00:09:35 -0700
Message-Id: <bde224ba44c16edc1892cea1b33ab973ae971115.1341299168.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341299168.git.sgw@linux.intel.com>
References: <cover.1341299168.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341299168.git.sgw@linux.intel.com>
References: <cover.1341299168.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/17] populate_sdk.bbclass: Split into two parts
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

populate_sdk was renamed to populate_sdk_base in order to allow for changes
that may break existing SDK recipes.  Any such changes need an analog
in populate_sdk (new version) to restore previous desired behavior.

In addition to the rename, one minor change was made.  The _base version
only had the do_populate_sdk as an added task, but no before or after defined.

For compatibility, populate_sdk has do_populate_sdk defined as "after"
do_install and before do_build, this is identical to the original behavior.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/populate_sdk.bbclass      |   91 ++------------------------------
 meta/classes/populate_sdk_base.bbclass |   89 +++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+), 87 deletions(-)
 create mode 100644 meta/classes/populate_sdk_base.bbclass

diff --git a/meta/classes/populate_sdk.bbclass b/meta/classes/populate_sdk.bbclass
index 1131d68..e5bb540 100644
--- a/meta/classes/populate_sdk.bbclass
+++ b/meta/classes/populate_sdk.bbclass
@@ -1,89 +1,6 @@
-inherit meta toolchain-scripts
-inherit populate_sdk_${IMAGE_PKGTYPE}
+# The majority of populate_sdk is located in populate_sdk_base
+# This chunk simply facilitates compatibility with SDK only recipes.
 
-SDK_DIR = "${WORKDIR}/sdk"
-SDK_OUTPUT = "${SDK_DIR}/image"
-SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
+inherit populate_sdk_base
 
-SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${MULTIMACH_TARGET_SYS}"
-
-TOOLCHAIN_HOST_TASK ?= "task-sdk-host-nativesdk task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-TOOLCHAIN_TARGET_TASK ?= "task-core-standalone-sdk-target task-core-standalone-sdk-target-dbg"
-TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${DISTRO_VERSION}"
-
-RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
-DEPENDS = "virtual/fakeroot-native sed-native"
-
-PID = "${@os.getpid()}"
-
-EXCLUDE_FROM_WORLD = "1"
-
-python () {
-    # If we don't do this we try and run the mapping hooks while parsing which is slow
-    # bitbake should really provide something to let us know this...
-    if bb.data.getVar('BB_WORKERCONTEXT', d, True) is not None:
-        runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", d)
-}
-
-fakeroot do_populate_sdk() {
-	rm -rf ${SDK_OUTPUT}
-	mkdir -p ${SDK_OUTPUT}
-
-	# populate_sdk_<image> is required to construct two images:
-	#  SDK_ARCH-nativesdk - contains the cross compiler and associated tooling
-	#  target - contains a target rootfs configured for the SDK usage
-	#
-	# the output of populate_sdk_<image> should end up in ${SDK_OUTPUT} it is made
-	# up of:
-	#  ${SDK_OUTPUT}/<sdk_arch-nativesdk pkgs>
-	#  ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/<target pkgs>
-
-	populate_sdk_${IMAGE_PKGTYPE}
-
-	# Don't ship any libGL in the SDK
-	rm -rf ${SDK_OUTPUT}/${SDKPATHNATIVE}${libdir_nativesdk}/libGL*
-
-	# Can copy pstage files here
-	# target_pkgs=`cat ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/var/lib/opkg/status | grep Package: | cut -f 2 -d ' '`
-
-	# Fix or remove broken .la files
-	#rm -f ${SDK_OUTPUT}/${SDKPATHNATIVE}/lib/*.la
-	rm -f ${SDK_OUTPUT}/${SDKPATHNATIVE}${libdir_nativesdk}/*.la
-
-	# Link the ld.so.cache file into the hosts filesystem
-	ln -s /etc/ld.so.cache ${SDK_OUTPUT}/${SDKPATHNATIVE}/etc/ld.so.cache
-
-	# Setup site file for external use
-	toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${MULTIMACH_TARGET_SYS}
-
-	toolchain_create_sdk_env_script
-
-	# Add version information
-	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${MULTIMACH_TARGET_SYS}
-
-	# Package it up
-	mkdir -p ${SDK_DEPLOY}
-	cd ${SDK_OUTPUT}
-	tar --owner=root --group=root -cj --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
-}
-
-populate_sdk_log_check() {
-	for target in $*
-	do
-		lf_path="`dirname ${BB_LOGFILE}`/log.do_$target.${PID}"
-
-		echo "log_check: Using $lf_path as logfile"
-
-		if test -e "$lf_path"
-		then
-			${IMAGE_PKGTYPE}_log_check $target $lf_path
-		else
-			echo "Cannot find logfile [$lf_path]"
-		fi
-		echo "Logfile is clean"
-	done
-}
-
-do_populate_sdk[nostamp] = "1"
-do_populate_sdk[recrdeptask] = "do_package_write"
-addtask populate_sdk before do_build after do_install
+addtask populate_sdk after do_install before do_build
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
new file mode 100644
index 0000000..a3bf8c2
--- /dev/null
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -0,0 +1,89 @@
+inherit meta toolchain-scripts
+inherit populate_sdk_${IMAGE_PKGTYPE}
+
+SDK_DIR = "${WORKDIR}/sdk"
+SDK_OUTPUT = "${SDK_DIR}/image"
+SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
+
+SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${MULTIMACH_TARGET_SYS}"
+
+TOOLCHAIN_HOST_TASK ?= "task-sdk-host-nativesdk task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+TOOLCHAIN_TARGET_TASK ?= "task-core-standalone-sdk-target task-core-standalone-sdk-target-dbg"
+TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${DISTRO_VERSION}"
+
+RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
+DEPENDS = "virtual/fakeroot-native sed-native"
+
+PID = "${@os.getpid()}"
+
+EXCLUDE_FROM_WORLD = "1"
+
+python () {
+    # If we don't do this we try and run the mapping hooks while parsing which is slow
+    # bitbake should really provide something to let us know this...
+    if bb.data.getVar('BB_WORKERCONTEXT', d, True) is not None:
+        runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", d)
+}
+
+fakeroot do_populate_sdk() {
+	rm -rf ${SDK_OUTPUT}
+	mkdir -p ${SDK_OUTPUT}
+
+	# populate_sdk_<image> is required to construct two images:
+	#  SDK_ARCH-nativesdk - contains the cross compiler and associated tooling
+	#  target - contains a target rootfs configured for the SDK usage
+	#
+	# the output of populate_sdk_<image> should end up in ${SDK_OUTPUT} it is made
+	# up of:
+	#  ${SDK_OUTPUT}/<sdk_arch-nativesdk pkgs>
+	#  ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/<target pkgs>
+
+	populate_sdk_${IMAGE_PKGTYPE}
+
+	# Don't ship any libGL in the SDK
+	rm -rf ${SDK_OUTPUT}/${SDKPATHNATIVE}${libdir_nativesdk}/libGL*
+
+	# Can copy pstage files here
+	# target_pkgs=`cat ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/var/lib/opkg/status | grep Package: | cut -f 2 -d ' '`
+
+	# Fix or remove broken .la files
+	#rm -f ${SDK_OUTPUT}/${SDKPATHNATIVE}/lib/*.la
+	rm -f ${SDK_OUTPUT}/${SDKPATHNATIVE}${libdir_nativesdk}/*.la
+
+	# Link the ld.so.cache file into the hosts filesystem
+	ln -s /etc/ld.so.cache ${SDK_OUTPUT}/${SDKPATHNATIVE}/etc/ld.so.cache
+
+	# Setup site file for external use
+	toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${MULTIMACH_TARGET_SYS}
+
+	toolchain_create_sdk_env_script
+
+	# Add version information
+	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${MULTIMACH_TARGET_SYS}
+
+	# Package it up
+	mkdir -p ${SDK_DEPLOY}
+	cd ${SDK_OUTPUT}
+	tar --owner=root --group=root -cj --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
+}
+
+populate_sdk_log_check() {
+	for target in $*
+	do
+		lf_path="`dirname ${BB_LOGFILE}`/log.do_$target.${PID}"
+
+		echo "log_check: Using $lf_path as logfile"
+
+		if test -e "$lf_path"
+		then
+			${IMAGE_PKGTYPE}_log_check $target $lf_path
+		else
+			echo "Cannot find logfile [$lf_path]"
+		fi
+		echo "Logfile is clean"
+	done
+}
+
+do_populate_sdk[nostamp] = "1"
+do_populate_sdk[recrdeptask] = "do_package_write"
+addtask populate_sdk
-- 
1.7.7.6



