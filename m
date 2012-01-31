Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1Rs6Sv-0002LO-4t
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 06:41:13 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Jan 2012 21:33:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="102128419"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.178])
	by orsmga001.jf.intel.com with ESMTP; 30 Jan 2012 21:33:05 -0800
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 21:36:30 -0800
Message-Id: <446e83a11aea146ef19b58d2de57bc5f3a22b067.1327987354.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1327987354.git.jessica.zhang@intel.com>
References: <cover.1327987354.git.jessica.zhang@intel.com>
In-Reply-To: <cover.1327987354.git.jessica.zhang@intel.com>
References: <cover.1327987354.git.jessica.zhang@intel.com>
Subject: [PATCH 1/1] Fix the issue that adt-installer tar ball is not regenerated if sstate is on, and other minor bug fixes
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
X-List-Received-Date: Tue, 31 Jan 2012 05:41:13 -0000

Signed-off-by: Jessica Zhang <jessica.zhang@intel.com>
---
 .../installer/adt-installer/adt_installer.conf     |    2 +-
 .../installer/adt-installer_1.0.bb                 |   13 ++++++-------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
index 2038b09..275756e 100644
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
@@ -23,7 +23,7 @@
 
 # Your yocto distro repository, this should include IPKG based packages and root filesystem files where the installation is based on
 
-YOCTOADT_REPO="http://adtrepo.yoctoproject.org/$YOCTOADT_VERSION"
+YOCTOADT_REPO="http://adtrepo.yoctoproject.org/YOCTOADT_VERSION"
 
 # The following are for system wide setup
 # Target architectures that you want to setup host cross dev environment for
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 39e53c1..5e76067 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -30,15 +30,13 @@ ALLOW_EMPTY = "1"
 
 PACKAGES = ""
 
-PR = "r5"
+PR = "r6"
 
 ADT_DEPLOY = "${TMPDIR}/deploy/sdk/"
 ADT_DIR = "${WORKDIR}/adt-installer/"
 YOCTOADT_VERSION = "${SDK_VERSION}"
 S = "${WORKDIR}/trunk"
 
-inherit deploy allarch
-
 SRCREV = "596"
 PV = "0.1.8+svnr${SRCPV}"
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
@@ -55,9 +53,9 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
 
 ADTREPO = "http://adtrepo.yoctoproject.org/${SDK_VERSION}"
 
-do_deploy[umask] = 022
+do_populate_adt[umask] = 022
 
-fakeroot do_deploy () {
+fakeroot do_populate_adt () {
 	cd ${WORKDIR}
 	mkdir -p ${ADT_DEPLOY}
 	rm -f ${ADT_DEPLOY}/adt-installer.tar.bz2
@@ -73,13 +71,14 @@ fakeroot do_deploy () {
 	echo 'YOCTOADT_VERSION=${SDK_VERSION}' > ${ADT_DIR}/temp.conf
         cat ${ADT_DIR}/adt_installer.conf >> ${ADT_DIR}/temp.conf
         mv ${ADT_DIR}/temp.conf ${ADT_DIR}/adt_installer.conf
+	sed -i -e 's#YOCTOADT_VERSION#${SDK_VERSION}#' ${ADT_DIR}/adt_installer.conf
         echo 'SDK_VENDOR=${SDK_VENDOR}' >> ${ADT_DIR}/scripts/data_define
         echo 'INSTALL_FOLDER=${SDKPATH}' >> ${ADT_DIR}/scripts/data_define
 	tar cfj adt_installer.tar.bz2 adt-installer
 	cp ${WORKDIR}/adt_installer.tar.bz2 ${ADT_DEPLOY}
 }
 
-do_install[noexec] = "1"
+do_populate_adt[nostamp] = "1"
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 do_package[noexec] = "1"
@@ -89,4 +88,4 @@ do_package_write_rpm[noexec] = "1"
 do_package_write_deb[noexec] = "1"
 do_poplulate_sysroot[noexec] = "1"
 
-addtask deploy before do_populate_sysroot after do_patch
+addtask populate_adt before do_build after do_install
-- 
1.7.0.4



