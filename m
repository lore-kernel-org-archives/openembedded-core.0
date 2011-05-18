Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1QMYFD-0001DU-2t
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 06:20:23 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 May 2011 21:17:24 -0700
X-ExtLoop1: 1
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.78])
	by orsmga002.jf.intel.com with ESMTP; 17 May 2011 21:17:24 -0700
Message-Id: <5c1f50ae46527002ddeaf776683c1e58adf8b121.1305693096.git.jessica.zhang@intel.com>
In-Reply-To: <cover.1305693096.git.jessica.zhang@intel.com>
References: <cover.1305693096.git.jessica.zhang@intel.com>
Old-Date: Tue, 17 May 2011 20:50:43 -0700
Date: Tue, 17 May 2011 21:36:25 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Jessica Zhang <jessica.zhang@intel.com>
Subject: [PATCH 1/2] extract bitbake config setting into data_define, use more variables replacing hardcoded values
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
X-List-Received-Date: Wed, 18 May 2011 04:20:23 -0000

From: Jessica Zhang <jessica.zhang@intel.com>

Signed-off-by: Jessica Zhang <jessica.zhang@intel.com>
---
 .../installer/adt-installer/adt_installer          |    2 +-
 .../installer/adt-installer/adt_installer.conf     |    2 +-
 .../adt-installer/scripts/adt_installer_internal   |    4 ++--
 .../installer/adt-installer/scripts/data_define    |    1 -
 .../installer/adt-installer_1.0.bb                 |    4 +++-
 5 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index ea36674..9336b9e 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -48,7 +48,7 @@ usage ()
   echo_info "# Install Qemu:\t\t\t$YOCTOADT_QEMU"
   echo_info "# Install NFS utilities:\t$YOCTOADT_NFS_UTIL"
   #echo_info "# Install bitbake + UI:\t\t$YOCTOADT_BITBAKE"
-  #echo_info "# Install poky metadata:\t$YOCTOADT_METADATA"
+  #echo_info "# Install metadata:\t$YOCTOADT_METADATA"
   #echo_info "############################################################################\n"
 
     echo_info "\n##############################################################################"
diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
index d2af70d..b518c53 100644
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
@@ -23,7 +23,7 @@
 
 # Your yocto distro repository, this should include IPKG based packages and root filesystem files where the installation is based on
 
-YOCTOADT_IPKG_REPO="http://adtrepo.yoctoproject.org/1.0/rootfs"
+YOCTOADT_IPKG_REPO="http://adtrepo.yoctoproject.org/$YOCTOADT_VERSION/rootfs"
 
 # The following are for system wide setup
 # Target architectures that you want to setup host cross dev environment for
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 8d4e01b..870931e 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -29,11 +29,11 @@ parse_config()
   case $INST_ARCH in 
   i[3-6]86)
     OPKG_CONFIG_FILE=$YOCTOADT_OPKG_CONF_FILE_32
-    OECORE_NATIVE_SYSROOT="$INSTALL_FOLDER/sysroots/$INST_ARCH-${SDK_VENDOR}-linux/"
+    OECORE_NATIVE_SYSROOT="$INSTALL_FOLDER/sysroots/$INST_ARCH$SDK_VENDOR-linux/"
     ;;
   x86_64)
     OPKG_CONFIG_FILE=$YOCTOADT_OPKG_CONF_FILE_64
-    OECORE_NATIVE_SYSROOT="$INSTALL_FOLDER/sysroots/x86_64-${SDK_VENDOR}-linux/"
+    OECORE_NATIVE_SYSROOT="$INSTALL_FOLDER/sysroots/x86_64$SDK_VENDOR-linux/"
     ;;
   *)
     echo_info "[ADT_INST] Error: Installation Machine is not supported!"
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/data_define b/meta/recipes-devtools/installer/adt-installer/scripts/data_define
index ca1d47c..2781e77 100644
--- a/meta/recipes-devtools/installer/adt-installer/scripts/data_define
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/data_define
@@ -37,4 +37,3 @@ YOCTOADT_SUPPORTED_TARGETS="x86 x86_64 arm ppc mips"
 # configuration files
 YOCTOADT_OPKG_CONF_FILE_32="./opkg/conf/opkg-sdk-i686.conf"
 YOCTOADT_OPKG_CONF_FILE_64="./opkg/conf/opkg-sdk-x86_64.conf"
-INSTALL_FOLDER=/opt/poky/$YOCTOADT_VERSION
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 4a3e4de..8f6e91f 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -31,7 +31,7 @@ ALLOW_EMPTY = "1"
 PACKAGES = ""
 PACKAGE_ARCH = "all"
 
-PR = "r0"
+PR = "r3"
 
 ADT_DEPLOY = "${TMPDIR}/deploy/sdk/"
 ADT_DIR = "${WORKDIR}/adt-installer/"
@@ -69,6 +69,8 @@ fakeroot do_deploy () {
 	echo 'YOCTOADT_VERSION=${SDK_VERSION}' > ${ADT_DIR}/temp.conf
         cat ${ADT_DIR}/adt_installer.conf >> ${ADT_DIR}/temp.conf
         mv ${ADT_DIR}/temp.conf ${ADT_DIR}/adt_installer.conf
+        echo 'SDK_VENDOR=${SDK_VENDOR}' >> ${ADT_DIR}/scripts/data_define
+        echo 'INSTALL_FOLDER=${SDKPATH}' >> ${ADT_DIR}/scripts/data_define
 	tar cfj adt_installer.tar.bz2 adt-installer
 	cp ${WORKDIR}/adt_installer.tar.bz2 ${ADT_DEPLOY}
 }
-- 
1.7.0.4



