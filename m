Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TDuCT-0003Nk-ER
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 11:34:37 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Sep 2012 02:21:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,441,1344236400"; d="scan'208";a="223464674"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2012 02:21:54 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 12:21:44 +0300
Message-Id: <df642742b4314899c7e80a326d53c50bf64a69fd.1347959838.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347959838.git.laurentiu.palcu@intel.com>
References: <cover.1347959838.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1347959838.git.laurentiu.palcu@intel.com>
References: <cover.1347959838.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/4] SDK: fix installation into symlinked directories
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
X-List-Received-Date: Tue, 18 Sep 2012 09:34:37 -0000

The SDK installation scripts should not canonicalize symlinked
directories because the entire relocation would be done to the directory
to which the symlink points. Instead, if the installation is a symlink,
use that path to relocate the binaries.

For example, if we have the following symlink: /opt/sdk -> ~/my/test/sdk
the binaries will be relocated to /opt/sdk not ~/my/test/sdk as it is
done now.

[YOCTO #3102]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_base.bbclass             |    8 ++++++--
 .../installer/adt-installer/adt_installer          |    6 +++++-
 .../adt-installer/scripts/adt_installer_internal   |    2 +-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 1c151d7..78669cf 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -126,7 +126,11 @@ if [ "$target_sdk_dir" = "" ]; then
 fi
 
 eval target_sdk_dir=$target_sdk_dir
-target_sdk_dir=$(readlink -m $target_sdk_dir)
+if [ -d $target_sdk_dir ]; then
+	target_sdk_dir=$(cd $target_sdk_dir; pwd)
+else
+	target_sdk_dir=$(readlink -m $target_sdk_dir)
+fi
 
 echo -n "You are about to install Poky SDK to \"$target_sdk_dir\". Proceed[Y/n]?"
 read answer
@@ -154,7 +158,7 @@ echo "done"
 
 echo -n "Setting it up..."
 # fix environment paths
-env_setup_script=$(find $target_sdk_dir -name "environment-setup-${REAL_MULTIMACH_TARGET_SYS}")
+env_setup_script=$(find $target_sdk_dir/ -name "environment-setup-${REAL_MULTIMACH_TARGET_SYS}")
 sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
 
 # fix dynamic loader paths in all ELF SDK binaries
diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index 2d252b7..0be5a1d 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -340,7 +340,11 @@ if [ "$INSTALL_FOLDER" = "" ]; then
 fi
 
 eval INSTALL_FOLDER=$INSTALL_FOLDER
-export INSTALL_FOLDER=$(readlink -m $INSTALL_FOLDER)
+if [ -d $INSTALL_FOLDER ]; then
+	export INSTALL_FOLDER=$(cd $INSTALL_FOLDER; pwd)
+else
+	export INSTALL_FOLDER=$(readlink -m $INSTALL_FOLDER)
+fi
 
 clear
 
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index f113aa4..76acaa7 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -207,7 +207,7 @@ $SUDO scripts/relocate_sdk_tmp.py $INSTALL_FOLDER $dl_path $executable_files
 check_result
 
 # replace /opt/${DISTRO}/${SDK_VERSION} with the install folder in all configs
-env_setup_script=$(find $NATIVE_INSTALL_DIR -name "environment-setup-*")
+env_setup_script=$(find $NATIVE_INSTALL_DIR/ -name "environment-setup-*")
 $SUDO sed -i -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:g" $env_setup_script
 
 find $OECORE_NATIVE_SYSROOT -type f -exec file '{}' \;|grep ":.*ASCII.*text"|cut -d':' -f1|\
-- 
1.7.9.5



