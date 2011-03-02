Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PuqNy-00071U-BV
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 19:02:55 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Mar 2011 10:00:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,254,1297065600"; d="scan'208";a="715282178"
Received: from unknown (HELO localhost) ([10.255.12.100])
	by orsmga001.jf.intel.com with ESMTP; 02 Mar 2011 10:00:17 -0800
Message-Id: <231fcc8b5bbdab0ce5be552039a29c4d4400d996.1299088354.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299088353.git.sgw@linux.intel.com>
References: <cover.1299088353.git.sgw@linux.intel.com>
Old-Date: Wed, 2 Mar 2011 01:24:22 +0800
Date: Wed, 02 Mar 2011 10:00:17 -0800
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 02 Mar 2011 19:07:48 +0100
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Liping Ke <liping.ke@intel.com>, Dongxiao Xu <dongxiao.xu@intel.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH 04/26] ADT: Fix several bugs for adt installer
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
X-List-Received-Date: Wed, 02 Mar 2011 18:02:55 -0000

From: Liping Ke <liping.ke@intel.com>

Two bugs are found
1) image download file path is not correct. So even if file is downloaded
   already, it can't be detected.
2) several images now are renamed, such as sato-dev, sato-sdk, we need to change the name
   accordingly.

Signed-off-by: Liping Ke <liping.ke@intel.com>
---
 .../installer/adt-installer/adt_installer          |    9 +++++----
 .../installer/adt-installer/adt_installer.conf     |    8 ++++----
 .../installer/adt-installer/scripts/data_define    |    2 +-
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index 1f481de..cca576f 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -216,17 +216,18 @@ done
 
 download_file()
 {
-if [ -f "$LOCAL_DOWNLOAD/$1" ]; then
-  confirm_download $1
+local filename=`echo ${1##*/}`
+if [ -f "$LOCAL_DOWNLOAD/$filename" ]; then
+  confirm_download $filename
   result="$?"
   if [ ! "$result" == "0" ]; then
     return
   else
     echo "Removing old file [$1]"
-    rm -rf "$LOCAL_DOWNLOAD/$1" 
+    rm -rf "$LOCAL_DOWNLOAD/$filename" 
   fi
 fi
-echo_info "Downloading file: $1..."
+echo_info "Downloading file: $filename..."
 wget "$YOCTOADT_IPKG_REPO/$1" -P $LOCAL_DOWNLOAD --progress=bar:force 2>&1 | tee -a "$YOCTOADT_INSTALL_LOG_FILE" 
 }
 
diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
index db602f6..d2af70d 100644
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
@@ -39,14 +39,14 @@ YOCTOADT_NFS_UTIL="Y"
 #YOCTOADT_METADATA="Y"
 
 #The followings are for setting up specific target architecture
-#YOCTOADT_ROOTFS_$arch is for specifying what root filesystem image files you want to download from the repository. The valid values to replace $arch are: arm, x86, x86_64, powerpc, mips.  The valid image files are: minimal, sato, sdk and lsb.  If you want to download multiple images, the entries are space separated
-YOCTOADT_ROOTFS_arm="minimal sato"
+#YOCTOADT_ROOTFS_$arch is for specifying what root filesystem image files you want to download from the repository. The valid values to replace $arch are: arm, x86, x86_64, powerpc, mips.  The valid image files are: minimal, minimal-dev, sato, sato-dev, sato-sdk,lsb, lsb-dev, lsb-sdk.  If you want to download multiple images, the entries are space separated
+YOCTOADT_ROOTFS_arm="minimal sato-sdk"
 #Specify which root filesystem file to use to extract as target sysroot.  Please ensure the entry is in the list of downloaded root filesystem files that specified above in YOCTOADT_ROOTFS_$arch
 YOCTOADT_TARGET_SYSROOT_IMAGE_arm="minimal"
 #The location where the target sysroot will be setup
 YOCTOADT_TARGET_SYSROOT_LOC_arm="$HOME/test-yocto/arm"
 
 #Here's another example for setting up target arch of x86, by uncommenting it will trigger the installer to download and setup 2 sysroot environment for 2 target arches: arm and x86.  If you want to add more target arch support, you can append more entries by following these samples
-#YOCTOADT_ROOTFS_x86="sdk"
-#YOCTOADT_TARGET_SYSROOT_IMAGE_x86="sdk"
+#YOCTOADT_ROOTFS_x86="sato-sdk"
+#YOCTOADT_TARGET_SYSROOT_IMAGE_x86="sato-sdk"
 #YOCTOADT_TARGET_SYSROOT_LOC_x86="$HOME/test-yocto/x86"
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/data_define b/meta/recipes-devtools/installer/adt-installer/scripts/data_define
index 2895c4f..77f8b38 100644
--- a/meta/recipes-devtools/installer/adt-installer/scripts/data_define
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/data_define
@@ -31,7 +31,7 @@ OPKG_LIBDIR="/var/lib"
 
 # List all supported root fs types and target types,
 # it will be used in user configuration validity checking
-YOCTOADT_SUPPORTED_ROOTFS="minimal sato sdk lsb"
+YOCTOADT_SUPPORTED_ROOTFS="minimal minimal-dev sato sato-dev sato-sdk lsb lsb-dev lsb-sdk"
 YOCTOADT_SUPPORTED_TARGETS="x86 x86_64 arm powerpc mips"
 # Different host (32 bit or 64 bit) will have different opkg
 # configuration files
-- 
1.7.1



