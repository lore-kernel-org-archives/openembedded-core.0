Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TxCW0-0002gO-5W
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 09:14:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0L7wWZ6028237
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jan 2013 23:58:33 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Sun, 20 Jan 2013 23:58:29 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Jan 2013 15:59:38 +0800
Message-ID: <36a8eaeb4853ea8ce5faa235e106e496b69bf356.1358754984.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1358754984.git.kai.kang@windriver.com>
References: <cover.1358754984.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/2] external-python-tarball: code refactoring
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 08:14:02 -0000
Content-Type: text/plain

external-python-tarball only can be built when inherit package_ipk now.
Update it and split the populate python operation to separated bbclass
according the value of PACKAGE_CLASSES, then it could be built for rpm
and deb too.

[Yocto 3006]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/classes/populate_python_deb.bbclass          |   42 ++++++++++++++
 meta/classes/populate_python_ipk.bbclass          |   43 +++++++++++++++
 meta/classes/populate_python_rpm.bbclass          |   59 ++++++++++++++++++++
 meta/recipes-core/meta/external-python-tarball.bb |   61 ++++-----------------
 4 files changed, 155 insertions(+), 50 deletions(-)
 create mode 100644 meta/classes/populate_python_deb.bbclass
 create mode 100644 meta/classes/populate_python_ipk.bbclass
 create mode 100644 meta/classes/populate_python_rpm.bbclass

diff --git a/meta/classes/populate_python_deb.bbclass b/meta/classes/populate_python_deb.bbclass
new file mode 100644
index 0000000..5f2edb8
--- /dev/null
+++ b/meta/classes/populate_python_deb.bbclass
@@ -0,0 +1,42 @@
+do_populate_sdk[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot bzip2-native:do_populate_sysroot"
+do_populate_sdk[recrdeptask] += "do_package_write_deb"
+
+
+DEB_SDK_ARCH = "${@[d.getVar('SDK_ARCH', True), "i386"]\
+                [d.getVar('SDK_ARCH', True) in \
+                ["x86", "i486", "i586", "i686", "pentium"]]}"
+
+do_populate_sdk[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
+
+populate_sdk_post_deb () {
+
+	local target_rootfs=$1
+
+	mkdir -p ${target_rootfs}/etc
+	tar -cf - -C ${STAGING_ETCDIR_NATIVE} -ps apt | tar -xf - -C ${target_rootfs}/etc
+}
+
+populate_python_sdk () {
+
+	# update index
+	package_update_index_deb
+
+	## install nativesdk ##
+	echo "Installing NATIVESDK packages"
+	export INSTALL_ROOTFS_DEB="${SDK_OUTPUT}"
+	export INSTALL_BASEARCH_DEB="${DEB_SDK_ARCH}"
+	export INSTALL_ARCHS_DEB="${SDK_PACKAGE_ARCHS}"
+	export INSTALL_PACKAGES_NORMAL_DEB="${TOOLCHAIN_HOST_TASK}"
+	export INSTALL_PACKAGES_ATTEMPTONLY_DEB="${TOOLCHAIN_HOST_TASK_ATTEMPTONLY}"
+	export PACKAGES_LINGUAS_DEB=""
+	export INSTALL_TASK_DEB="populate_sdk-nativesdk"
+
+	package_install_internal_deb
+	populate_sdk_post_deb ${SDK_OUTPUT}/${SDKPATHNATIVE}
+
+	#move remainings
+	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}/var/lib/dpkg
+	mv ${SDK_OUTPUT}/var/lib/dpkg/* ${SDK_OUTPUT}/${SDKPATHNATIVE}/var/lib/dpkg
+	rm -rf ${SDK_OUTPUT}/var
+}
+
diff --git a/meta/classes/populate_python_ipk.bbclass b/meta/classes/populate_python_ipk.bbclass
new file mode 100644
index 0000000..dadd13f
--- /dev/null
+++ b/meta/classes/populate_python_ipk.bbclass
@@ -0,0 +1,43 @@
+
+DEPENDS += "opkg-native opkg-utils-native"
+
+IPKG_HOST = "opkg-cl -f ${IPKGCONF_SDK} -o ${SDK_OUTPUT}"
+
+populate_python_sdk() {
+	mkdir -p ${SDK_OUTPUT}${localstatedir}/lib/opkg/
+
+	rm -f ${IPKGCONF_TARGET}
+	touch ${IPKGCONF_TARGET}
+	rm -f ${IPKGCONF_SDK}
+	touch ${IPKGCONF_SDK}
+
+	package_update_index_ipk
+	package_generate_ipkg_conf
+
+	for arch in ${PACKAGE_ARCHS}; do
+		revipkgarchs="$arch $revipkgarchs"
+	done
+
+	${IPKG_HOST} update
+	${IPKG_HOST} install ${TOOLCHAIN_HOST_TASK}
+
+	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}${localstatedir_nativesdk}/lib/opkg
+	mv ${SDK_OUTPUT}/var/lib/opkg/* ${SDK_OUTPUT}/${SDKPATHNATIVE}${localstatedir_nativesdk}/lib/opkg/
+	rm -Rf ${SDK_OUTPUT}/var
+
+	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}/${sysconfdir}
+	install -m 0644 ${IPKGCONF_SDK} ${SDK_OUTPUT}/${SDKPATHNATIVE}/${sysconfdir}/
+
+	rm -f ${SDK_OUTPUT}/${SDKPATHNATIVE}${libdir_nativesdk}/*.la
+
+	# Link the ld.so.cache file into the hosts filesystem
+	ln -s /etc/ld.so.cache ${SDK_OUTPUT}/${SDKPATHNATIVE}/etc/ld.so.cache
+
+	# Add version information
+	versionfile=${SDK_OUTPUT}/${SDKPATH}/version-${MULTIMACH_TARGET_SYS}
+	touch $versionfile
+	echo 'Distro: ${DISTRO}' >> $versionfile
+	echo 'Distro Version: ${DISTRO_VERSION}' >> $versionfile
+	echo 'Metadata Revision: ${METADATA_REVISION}' >> $versionfile
+	echo 'Timestamp: ${DATETIME}' >> $versionfile
+}
diff --git a/meta/classes/populate_python_rpm.bbclass b/meta/classes/populate_python_rpm.bbclass
new file mode 100644
index 0000000..4eb9ce8
--- /dev/null
+++ b/meta/classes/populate_python_rpm.bbclass
@@ -0,0 +1,59 @@
+# Smart is python based, so be sure python-native is available to us.
+EXTRANATIVEPATH += "python-native"
+
+do_populate_sdk[depends] += "rpm-native:do_populate_sysroot"
+do_populate_sdk[depends] += "rpmresolve-native:do_populate_sysroot"
+do_populate_sdk[depends] += "python-smartpm-native:do_populate_sysroot"
+
+# Creating the repo info in do_rootfs
+do_populate_sdk[depends] += "createrepo-native:do_populate_sysroot"
+
+do_populate_sdk[recrdeptask] += "do_package_write_rpm"
+
+rpmlibdir = "/var/lib/rpm"
+RPMOPTS="--dbpath ${rpmlibdir}"
+RPM="rpm ${RPMOPTS}"
+
+do_populate_sdk[lockfiles] += "${DEPLOY_DIR_RPM}/rpm.lock"
+
+populate_sdk_post_rpm () {
+
+	local target_rootfs=$1
+
+	# remove lock files
+	rm -f ${target_rootfs}/__db.*
+
+	# Remove all remaining resolver files
+	rm -rf ${target_rootfs}/install
+	rm -rf ${target_rootfs}/var/lib/smart
+}
+
+populate_python_sdk () {
+
+	package_update_index_rpm
+
+	export INSTALL_ROOTFS_RPM="${SDK_OUTPUT}"
+	export INSTALL_PLATFORM_RPM="${SDK_ARCH}"
+    export INSTALL_PLATFORM_EXTRA_RPM="${SDK_ARCH}-nativesdk"
+	export INSTALL_PACKAGES_RPM="${TOOLCHAIN_HOST_TASK}"
+	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${TOOLCHAIN_TARGET_HOST_ATTEMPTONLY}"
+	export INSTALL_PACKAGES_LINGUAS_RPM=""
+	export INSTALL_PROVIDENAME_RPM="/bin/sh /bin/bash /usr/bin/env /usr/bin/perl pkgconfig libGL.so()(64bit) libGL.so"
+	export INSTALL_TASK_RPM="populate_sdk_rpm-nativesdk"
+	export INSTALL_COMPLEMENTARY_RPM=""
+
+	# Setup base system configuration
+	mkdir -p ${INSTALL_ROOTFS_RPM}/etc/rpm/
+
+	package_install_internal_rpm --sdk
+	populate_sdk_post_rpm ${INSTALL_ROOTFS_RPM}
+
+	# move host RPM library data
+	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}${localstatedir_nativesdk}/lib/rpm
+	mv ${SDK_OUTPUT}${rpmlibdir}/* ${SDK_OUTPUT}/${SDKPATHNATIVE}${localstatedir_nativesdk}/lib/rpm/
+	rm -Rf ${SDK_OUTPUT}/var
+
+	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}/${sysconfdir}
+	mv ${SDK_OUTPUT}/etc/* ${SDK_OUTPUT}/${SDKPATHNATIVE}/${sysconfdir}/
+	rm -rf ${SDK_OUTPUT}/etc
+}
diff --git a/meta/recipes-core/meta/external-python-tarball.bb b/meta/recipes-core/meta/external-python-tarball.bb
index 2085acc..d996bdf 100644
--- a/meta/recipes-core/meta/external-python-tarball.bb
+++ b/meta/recipes-core/meta/external-python-tarball.bb
@@ -3,18 +3,17 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-DEPENDS = "opkg-native opkg-utils-native virtual/fakeroot-native sed-native"
+DEPENDS = "virtual/fakeroot-native sed-native"
 
-PR = "r1"
+PR = "r2"
 
 inherit meta
+inherit populate_python_${IMAGE_PKGTYPE}
 
 SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
 SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 
-IPKG_HOST = "opkg-cl -f ${IPKGCONF_SDK} -o ${SDK_OUTPUT}"
-
 TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-python-core \
     nativesdk-python-textutils \
@@ -43,56 +42,18 @@ RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
 
 EXCLUDE_FROM_WORLD = "1"
 
-do_populate_sdk() {
-	rm -rf ${SDK_OUTPUT}
-	mkdir -p ${SDK_OUTPUT}
-	mkdir -p ${SDK_OUTPUT}${localstatedir}/lib/opkg/
-
-	rm -f ${IPKGCONF_TARGET}
-	touch ${IPKGCONF_TARGET}
-	rm -f ${IPKGCONF_SDK}
-	touch ${IPKGCONF_SDK}
-
-	package_update_index_ipk
-	package_generate_ipkg_conf
-
-	for arch in ${PACKAGE_ARCHS}; do
-		revipkgarchs="$arch $revipkgarchs"
-	done
-
-	${IPKG_HOST} update
-	${IPKG_HOST} install ${TOOLCHAIN_HOST_TASK}
-
-	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}${localstatedir_nativesdk}/lib/opkg
-	mv ${SDK_OUTPUT}/var/lib/opkg/* ${SDK_OUTPUT}/${SDKPATHNATIVE}${localstatedir_nativesdk}/lib/opkg/
-	rm -Rf ${SDK_OUTPUT}/var
+fakeroot do_populate_sdk() {
+    rm -rf ${SDK_OUTPUT}
+    mkdir -p ${SDK_OUTPUT}
 
-	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}/${sysconfdir}
-	install -m 0644 ${IPKGCONF_SDK} ${SDK_OUTPUT}/${SDKPATHNATIVE}/${sysconfdir}/
+    populate_python_sdk
 
-	rm -f ${SDK_OUTPUT}/${SDKPATHNATIVE}${libdir_nativesdk}/*.la
-
-	# Link the ld.so.cache file into the hosts filesystem
-	ln -s /etc/ld.so.cache ${SDK_OUTPUT}/${SDKPATHNATIVE}/etc/ld.so.cache
-
-	# Add version information
-	versionfile=${SDK_OUTPUT}/${SDKPATH}/version-${MULTIMACH_TARGET_SYS}
-	touch $versionfile
-	echo 'Distro: ${DISTRO}' >> $versionfile
-	echo 'Distro Version: ${DISTRO_VERSION}' >> $versionfile
-	echo 'Metadata Revision: ${METADATA_REVISION}' >> $versionfile
-	echo 'Timestamp: ${DATETIME}' >> $versionfile
-
-	# Package it up
-	mkdir -p ${SDK_DEPLOY}
-	cd ${SDK_OUTPUT}
-	tar  --owner=root --group=root -cj --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
+    # Package it up
+    mkdir -p ${SDK_DEPLOY}
+    cd ${SDK_OUTPUT}
+    tar  --owner=root --group=root -cj --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
 }
 
 do_populate_sdk[nostamp] = "1"
 do_populate_sdk[recrdeptask] = "do_package_write"
 addtask populate_sdk before do_build after do_install
-
-inherit blacklist
-
-PNBLACKLIST[external-python-tarball] = "${@base_contains('PACKAGE_CLASSES', 'package_ipk', '', 'This recipe requires \'package_ipk\' support to be enabled in PACKAGE_CLASSES.', d)}"
-- 
1.7.5.4



