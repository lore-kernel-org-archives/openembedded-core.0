Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHVcT-0000u1-S0
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 09:36:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 00:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130584255"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2012 00:26:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 00:26:36 -0700
Message-Id: <0218f4d54e92eeef1d27afe7325be8a5b49bc894.1334042473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL [v2] 09/14] adt-installer: Fixed ppc kernel naming.
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
X-List-Received-Date: Tue, 10 Apr 2012 07:36:06 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

1. Fixed the ppc kernel naming.
2. Disabled opkg shared library to avoid runtime opkg-cl launching
error.
3. Adjusted the variable sequence in adt-installer.conf

Fixed bug [YOCTO #2233]

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../installer/adt-installer/adt_installer          |    4 ++--
 .../installer/adt-installer/adt_installer.conf     |   20 ++++++++++----------
 .../installer/adt-installer_1.0.bb                 |    2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index 1dd07b7..1a53eb9 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -170,7 +170,7 @@ if [ ! -x "$LOCAL_OPKG_LOC/bin/opkg-cl" ]; then
   check_result
 
   echo_info "Configure opkg ...\n"
-  ./autogen.sh --prefix=$parent_folder/$LOCAL_OPKG_LOC --with-opkglibdir=$OPKG_LIBDIR --disable-curl --disable-ssl-curl --disable-gpg --disable-shave >> $parent_folder/$YOCTOADT_INSTALL_LOG_FILE
+  ./autogen.sh --prefix=$parent_folder/$LOCAL_OPKG_LOC --with-opkglibdir=$OPKG_LIBDIR --enable-shared=no --disable-curl --disable-ssl-curl --disable-gpg --disable-shave >> $parent_folder/$YOCTOADT_INSTALL_LOG_FILE
   check_result
 
   echo_info "Make opkg ...\n"
@@ -241,7 +241,7 @@ get_qemu_image()
 
   if [ "$1" == "x86" ] || [ "$1" == "x86_64" ]; then
     qemu_kernel="bzImage-qemu$target.bin"
-  elif [ "$1" == "mips" ]; then
+  elif [ "$1" == "ppc" ] || [ "$1" == "mips" ]; then
     qemu_kernel="vmlinux-qemu$target.bin"
   else
     qemu_kernel="zImage-qemu$target.bin"
diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
index 275756e..afc69a4 100644
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
@@ -42,7 +42,7 @@ YOCTOADT_NFS_UTIL="Y"
 #YOCTOADT_ROOTFS_$arch is for specifying what root filesystem image files you want to download from the repository. The valid values to replace $arch are: arm, x86, x86_64, powerpc, mips.  The valid image files are: minimal, minimal-dev, sato, sato-dev, sato-sdk,lsb, lsb-dev, lsb-sdk.  If you want to download multiple images, the entries are space separated
 YOCTOADT_ROOTFS_arm="minimal sato-sdk"
 #Specify which root filesystem file to use to extract as target sysroot.  Please ensure the entry is in the list of downloaded root filesystem files that specified above in YOCTOADT_ROOTFS_$arch
-YOCTOADT_TARGET_SYSROOT_IMAGE_arm="minimal"
+YOCTOADT_TARGET_SYSROOT_IMAGE_arm="sato-sdk"
 #The location where the target sysroot will be setup
 YOCTOADT_TARGET_SYSROOT_LOC_arm="$HOME/test-yocto/arm"
 
@@ -52,14 +52,14 @@ YOCTOADT_TARGET_SYSROOT_LOC_arm="$HOME/test-yocto/arm"
 #YOCTOADT_TARGET_SYSROOT_LOC_x86="$HOME/test-yocto/x86"
 
 #Here's some template of other arches, which you need to change the value in ""
-#YOCTOADT_TARGET_SYSROOT_IMAGE_x86_64=""
-#YOCTOADT_TARGET_SYSROOT_LOC_x86_64=""
-#YOCTOADT_ROOTFS_x86_64=""
+#YOCTOADT_ROOTFS_x86_64="sato-sdk"
+#YOCTOADT_TARGET_SYSROOT_IMAGE_x86_64="sato-sdk"
+#YOCTOADT_TARGET_SYSROOT_LOC_x86_64="$HOME/test-yocto/x86_64"
 
-#YOCTOADT_TARGET_SYSROOT_IMAGE_ppc=""
-#YOCTOADT_TARGET_SYSROOT_LOC_ppc=""
-#YOCTOADT_ROOTFS_ppc=""
+#YOCTOADT_ROOTFS_ppc="sato-sdk"
+#YOCTOADT_TARGET_SYSROOT_IMAGE_ppc="sato-sdk"
+#YOCTOADT_TARGET_SYSROOT_LOC_ppc="$HOME/test-yocto/ppc"
 
-#YOCTOADT_TARGET_SYSROOT_IMAGE_mips=""
-#YOCTOADT_TARGET_SYSROOT_LOC_mips=""
-#YOCTOADT_ROOTFS_mips=""
+#YOCTOADT_ROOTFS_mips="sato-sdk"
+#YOCTOADT_TARGET_SYSROOT_IMAGE_mips="sato-sdk"
+#YOCTOADT_TARGET_SYSROOT_LOC_mips="$HOME/test-yocto/mips"
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 07bef88..5dc0896 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -30,7 +30,7 @@ ALLOW_EMPTY = "1"
 
 PACKAGES = ""
 
-PR = "r8"
+PR = "r9"
 
 ADT_DEPLOY = "${TMPDIR}/deploy/sdk/"
 ADT_DIR = "${WORKDIR}/adt-installer/"
-- 
1.7.7.6



