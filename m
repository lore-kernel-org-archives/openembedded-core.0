Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qo2jD-0005dW-1s
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 02:20:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p720GbQr020011
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 17:16:38 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 1 Aug 2011 17:16:37 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Aug 2011 19:17:40 -0500
Message-ID: <3cb4f17be32799306933a6aee999d845785ea72d.1312243899.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312243899.git.mark.hatle@windriver.com>
References: <cover.1312243899.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 3/5] populate_sdk_*: Sync SDK and regular rootfs functions
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
X-List-Received-Date: Tue, 02 Aug 2011 00:20:59 -0000
Content-Type: text/plain

In order for things to be easier to maintain in the future, sync up
the sdk and rootfs versions.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/populate_sdk_deb.bbclass |   24 ++++++++----
 meta/classes/populate_sdk_rpm.bbclass |   68 ++++++++++++++++++++++++++++----
 meta/classes/rootfs_rpm.bbclass       |   15 +++----
 3 files changed, 82 insertions(+), 25 deletions(-)

diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index 25d90c7..1bf1b95 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -11,30 +11,38 @@ populate_sdk_post_deb () {
 
 fakeroot populate_sdk_deb () {
 
+	# update index
 	package_update_index_deb
 
-	export INSTALL_TASK_DEB="populate_sdk"
-	export INSTALL_PACKAGES_LINGUAS_DEB=""
-	export INSTALL_PACKAGES_ATTEMPTONLY_DEB=""
-
-	#install target
+	## install target ##
+	# This needs to work in the same way as rootfs_deb.bbclass
 	echo "Installing TARGET packages"
+
+	mkdir -p ${IMAGE_ROOTFS}/var/dpkg/alternatives
+
 	export INSTALL_ROOTFS_DEB="${SDK_OUTPUT}/${SDKTARGETSYSROOT}"
 	export INSTALL_BASEARCH_DEB="${DPKG_ARCH}"
 	export INSTALL_ARCHS_DEB="${PACKAGE_ARCHS}"
 	export INSTALL_PACKAGES_NORMAL_DEB="${TOOLCHAIN_TARGET_TASK}"
+	export INSTALL_PACKAGES_ATTEMPTONLY_DEB=""
+	export PACKAGES_LINGUAS_DEB=""
+	export INSTALL_TASK_DEB="populate_sdk-target"
 
 	package_install_internal_deb
+
 	populate_sdk_post_deb ${INSTALL_ROOTFS_DEB}
 
 	populate_sdk_log_check populate_sdk
 
-	#install host
-	echo "Installing HOST packages"
+	## install nativesdk ##
+	echo "Installing NATIVESDK packages"
 	export INSTALL_ROOTFS_DEB="${SDK_OUTPUT}"
 	export INSTALL_BASEARCH_DEB="${SDK_ARCH}"
-	export INSTALL_PACKAGES_NORMAL_DEB="${TOOLCHAIN_HOST_TASK}"
 	export INSTALL_ARCHS_DEB="${SDK_PACKAGE_ARCHS}"
+	export INSTALL_PACKAGES_NORMAL_DEB="${TOOLCHAIN_HOST_TASK}"
+	export INSTALL_PACKAGES_ATTEMPTONLY_DEB=""
+	export PACKAGES_LINGUAS_DEB=""
+	export INSTALL_TASK_DEB="populate_sdk-nativesdk"
 
 	package_install_internal_deb
 	populate_sdk_post_deb ${SDK_OUTPUT}/${SDKPATHNATIVE}
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index 560e40c..5fb0234 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -26,21 +26,49 @@ fakeroot populate_sdk_rpm () {
 	package_update_index_rpm
 	package_generate_rpm_conf
 
-	export INSTALL_PACKAGES_ATTEMPTONLY_RPM=""
-	export INSTALL_PACKAGES_LINGUAS_RPM=""
-	export INSTALL_PROVIDENAME_RPM="/bin/sh"
-	export INSTALL_TASK_RPM="populate_sdk"
-
-
-	#install target
+	## install target ##
+	# This needs to work in the same way as rootfs_rpm.bbclass!
+	#
 	export INSTALL_ROOTFS_RPM="${SDK_OUTPUT}/${SDKTARGETSYSROOT}"
 	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
 	export INSTALL_CONFBASE_RPM="${RPMCONF_TARGET_BASE}"
 	export INSTALL_PACKAGES_NORMAL_RPM="${TOOLCHAIN_TARGET_TASK}"
+	export INSTALL_PACKAGES_ATTEMPTONLY_RPM=""
+	export INSTALL_PACKAGES_LINGUAS_RPM=""
+	export INSTALL_PROVIDENAME_RPM=""
+	export INSTALL_TASK_RPM="populate_sdk-target"
+
+	# Setup base system configuration
+	mkdir -p ${INSTALL_ROOTFS_RPM}/etc/rpm/
+	mkdir -p ${INSTALL_ROOTFS_RPM}${rpmlibdir}
+	mkdir -p ${INSTALL_ROOTFS_RPM}${rpmlibdir}/log
+	cat > ${INSTALL_ROOTFS_RPM}${rpmlibdir}/DB_CONFIG << EOF
+# ================ Environment
+set_data_dir            .
+set_create_dir          .
+set_lg_dir              ./log
+set_tmp_dir             ./tmp
+
+# -- thread_count must be >= 8
+set_thread_count        64
+
+# ================ Logging
+
+# ================ Memory Pool
+set_mp_mmapsize         268435456
+
+# ================ Locking
+set_lk_max_locks        16384
+set_lk_max_lockers      16384
+set_lk_max_objects      16384
+mutex_set_max           163840
+
+# ================ Replication
+EOF
 
 	# List must be prefered to least preferred order
 	INSTALL_PLATFORM_EXTRA_RPM=""
-	for each_arch in ${PACKAGE_ARCHS} ; do
+	for each_arch in ${MULTILIB_PACKAGE_ARCHS} ${PACKAGE_ARCHS} ; do
 		INSTALL_PLATFORM_EXTRA_RPM="$each_arch $INSTALL_PLATFORM_EXTRA_RPM"
 	done
 	export INSTALL_PLATFORM_EXTRA_RPM
@@ -48,11 +76,16 @@ fakeroot populate_sdk_rpm () {
 	package_install_internal_rpm
 	populate_sdk_post_rpm ${INSTALL_ROOTFS_RPM}
 
-	#install host
+	## install nativesdk ##
+	echo "Installing NATIVESDK packages"
 	export INSTALL_ROOTFS_RPM="${SDK_OUTPUT}"
 	export INSTALL_PLATFORM_RPM="${SDK_ARCH}"
 	export INSTALL_CONFBASE_RPM="${RPMCONF_HOST_BASE}"
 	export INSTALL_PACKAGES_NORMAL_RPM="${TOOLCHAIN_HOST_TASK}"
+	export INSTALL_PACKAGES_ATTEMPTONLY_RPM=""
+	export INSTALL_PACKAGES_LINGUAS_RPM=""
+	export INSTALL_PROVIDENAME_RPM="/bin/sh"
+	export INSTALL_TASK_RPM="populate_sdk_rpm-nativesdk"
 
 	# List must be prefered to least preferred order
 	INSTALL_PLATFORM_EXTRA_RPM=""
@@ -80,3 +113,20 @@ fakeroot populate_sdk_rpm () {
 		resolve_package_rpm foo ${RPMCONF_TARGET_BASE}.conf || true
 	fi
 }
+
+python () {
+    ml_package_archs = ""
+    multilibs = d.getVar('MULTILIBS', True) or ""
+    for ext in multilibs.split():
+        eext = ext.split(':')
+        if len(eext) > 1 and eext[0] == 'multilib':
+            localdata = bb.data.createCopy(d)
+            overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + eext[1]
+            localdata.setVar("OVERRIDES", overrides)
+            # TEMP: OVERRIDES isn't working right
+            localdata.setVar("DEFAULTTUNE", localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False) or "")
+            ml_package_archs += localdata.getVar("PACKAGE_ARCHS", True) or ""
+            #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
+    bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs, d)
+}
+
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 4f627a5..7c06064 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -55,6 +55,13 @@ fakeroot rootfs_rpm_do_rootfs () {
 	# install packages
 	# This needs to work in the same way as populate_sdk_rpm.bbclass!
 	export INSTALL_ROOTFS_RPM="${IMAGE_ROOTFS}"
+	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
+	export INSTALL_CONFBASE_RPM="${RPMCONF_TARGET_BASE}"
+	export INSTALL_PACKAGES_NORMAL_RPM="${PACKAGE_INSTALL}"
+	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${PACKAGE_INSTALL_ATTEMPTONLY}"
+	export INSTALL_PACKAGES_LINGUAS_RPM="${LINGUAS_INSTALL}"
+	export INSTALL_PROVIDENAME_RPM=""
+	export INSTALL_TASK_RPM="rootfs_rpm_do_rootfs"
 
 	# Setup base system configuration
 	mkdir -p ${INSTALL_ROOTFS_RPM}/etc/rpm/
@@ -85,14 +92,6 @@ mutex_set_max           163840
 # ================ Replication
 EOF
 
-	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
-	export INSTALL_CONFBASE_RPM="${RPMCONF_TARGET_BASE}"
-	export INSTALL_PACKAGES_NORMAL_RPM="${PACKAGE_INSTALL}"
-	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${PACKAGE_INSTALL_ATTEMPTONLY}"
-	export INSTALL_PACKAGES_LINGUAS_RPM="${LINGUAS_INSTALL}"
-	export INSTALL_PROVIDENAME_RPM=""
-	export INSTALL_TASK_RPM="rootfs_rpm_do_rootfs"
-
 	# List must be prefered to least preferred order
 	INSTALL_PLATFORM_EXTRA_RPM=""
 	for each_arch in ${MULTILIB_PACKAGE_ARCHS} ${PACKAGE_ARCHS}; do
-- 
1.7.3.4



