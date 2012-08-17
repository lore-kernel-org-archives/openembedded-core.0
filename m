Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1T2Dfh-0004uE-AH
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 05:56:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Aug 2012 20:44:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,782,1336374000"; d="scan'208";a="203251926"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 16 Aug 2012 20:44:30 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 06:44:22 +0300
Message-Id: <92d6de11744098c3431309c5abc2f3217e166dac.1345174354.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1345174354.git.laurentiu.palcu@intel.com>
References: <cover.1345174354.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1345174354.git.laurentiu.palcu@intel.com>
References: <cover.1345174354.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/3] adt-installer: add support for relocatable SDK
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
X-List-Received-Date: Fri, 17 Aug 2012 03:56:29 -0000

Since we made the SDK relocatable, we have to add this functionality to
adt-installer too.

Other:
 - Changed tabs to spaces in the recipe file too.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../installer/adt-installer/adt_installer          |   11 ++
 .../adt-installer/scripts/adt_installer_internal   |  111 ++++++++++++++++----
 .../installer/adt-installer_1.0.bb                 |   37 +++----
 3 files changed, 123 insertions(+), 36 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index 1a53eb9..2d252b7 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -332,6 +332,17 @@ if [ -f "$YOCTOADT_INSTALL_LOG_FILE" ]; then
   rm $YOCTOADT_INSTALL_LOG_FILE
 fi
 
+echo -n "Please enter the install location (default: $DEFAULT_INSTALL_FOLDER): "
+read INSTALL_FOLDER
+
+if [ "$INSTALL_FOLDER" = "" ]; then
+    INSTALL_FOLDER=$DEFAULT_INSTALL_FOLDER
+fi
+
+eval INSTALL_FOLDER=$INSTALL_FOLDER
+export INSTALL_FOLDER=$(readlink -m $INSTALL_FOLDER)
+
+clear
 
 usage
 
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 6201095..a540c0d 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -50,8 +50,8 @@ install_native_sdk()
 
 echo_info "\nStart installing selected native ADT for archs: $YOCTOADT_TARGETS..."
 
-# where the packages are installed. Currently only / is supported
-NATIVE_INSTALL_DIR="/"
+# where the packages are installed.
+NATIVE_INSTALL_DIR=$INSTALL_FOLDER
 
 if [ -d "$INSTALL_FOLDER" ]; then
   echo_info "\nNative ADT installation directory \"$INSTALL_FOLDER\" already exists! Continue installation will override its contents!"
@@ -59,28 +59,51 @@ if [ -d "$INSTALL_FOLDER" ]; then
 fi
 
 #Now begin to install native sdk and extract qemu rootfs which needs privilege rights
-echo_info "#######################################################################"
-echo_info "Please note from this point on installation requires sudo password ..."
-echo_info "#######################################################################"
-username='id -nu'
+#depending on the install location
+username=$(id -nu)
+
+# find the owner of the parent
+dir=$NATIVE_INSTALL_DIR
+while [ 1 ]; do
+    if [ -d $dir ]; then
+        owner=$(stat -c %U $dir)
+        break
+   else
+        dir=$(dirname $dir)
+   fi
+done
+
+if [ "$owner" = "$username" ]; then
+    SUDO=""
+else
+    echo_info "#######################################################################"
+    echo_info "Please note from this point on installation requires sudo password ..."
+    echo_info "#######################################################################"
+    SUDO=sudo
+fi
+
 #we need to make this directory firstly since opkg need to use it.
 OPKG_LOCK_DIR="$NATIVE_INSTALL_DIR/$OPKG_LIBDIR/opkg"
 if [ ! -d "$OPKG_LOCK_DIR" ]; then
-  sudo mkdir -p $OPKG_LOCK_DIR
+  $SUDO mkdir -p $OPKG_LOCK_DIR
   echo_info "Successfully create directory $OPKG_LOCK_DIR. "
 #if user delete /opt/xxx, while dangling folders there, report error
 elif [ ! -d "$INSTALL_FOLDER" ]; then
   echo_info "\nDangling opkg cache folder $OPKG_LOCK_DIR detected. Continue installation will remove the folder!"
   confirm_install $1
-  sudo rm -rf $OPKG_LOCK_DIR
-  sudo mkdir -p $OPKG_LOCK_DIR
+  $SUDO rm -rf $OPKG_LOCK_DIR
+  $SUDO mkdir -p $OPKG_LOCK_DIR
 #if user are updating installing, just let him/her go, give her/him prompt
 else
   echo_info "ADT has already been installed. Will update its contents..."
 fi
 
 #first update repository
-OPKG_CMD="sudo -E $LOCAL_OPKG_LOC/bin/opkg-cl"
+if [ "x$SUDO" = "x" ]; then
+    OPKG_CMD="$LOCAL_OPKG_LOC/bin/opkg-cl"
+else
+    OPKG_CMD="sudo -E $LOCAL_OPKG_LOC/bin/opkg-cl"
+fi
 
 echo_info "Updating opkg..."
 $OPKG_CMD -f $OPKG_CONFIG_FILE -o $NATIVE_INSTALL_DIR update &>> $YOCTOADT_INSTALL_LOG_FILE
@@ -117,13 +140,6 @@ for native_target_type in $YOCTOADT_TARGETS; do
 
 done
 
-# Link the ld.so.cache file into the hosts filesystem
-if [ ! -f "$OECORE_NATIVE_SYSROOT/etc/ld.so.cache" ]; then 
-echo_info "Link the ld.so.cache file into the host filesystem"
-sudo ln -s /etc/ld.so.cache $OECORE_NATIVE_SYSROOT/etc/ld.so.cache
-check_result
-fi
-
 if [ "$YOCTOADT_QEMU" == "Y" ] || [ "$YOCTOADT_QEMU" = "y" ]; then
   echo_info "\nInstalling qemu native ..."
   $OPKG_INSTALL_NATIVE_CMD qemu-nativesdk &>> $YOCTOADT_INSTALL_LOG_FILE
@@ -138,6 +154,65 @@ if [ "$YOCTOADT_NFS_UTIL" == "Y" ] || [ "$YOCTOADT_NFS_UTIL" == "y" ]; then
   check_result
 fi
 
+# Lose the ./opt/${DISTRO}/${SDK_VERSION} part, we don't really need to keep
+# the entire directory structure. We could patch opkg to do that but it's far
+# simpler to do that here and achieve the same result.
+# This is done in two steps:
+# Step 1: copy ./opt/${DISTRO}/${SDK_VERSION} contents to $NATIVE_INSTALL_DIR.
+# We cannot use move if $NATIVE_INSTALL_DIR is not empty (for example: contains
+# another SDK)
+$SUDO cp -r $NATIVE_INSTALL_DIR/$DEFAULT_INSTALL_FOLDER/* $NATIVE_INSTALL_DIR
+
+# delete the source directory now
+$SUDO rm -rf $NATIVE_INSTALL_DIR/$DEFAULT_INSTALL_FOLDER/*
+
+# Step 2: Delete the ./opt/${DISTRO}/${SDK_VERSION} directories too, they should be empty
+dir=$NATIVE_INSTALL_DIR/$DEFAULT_INSTALL_FOLDER
+while [ "$dir" != "$NATIVE_INSTALL_DIR" ]; do
+    # if the user chose / as the install folder, then we should leave /opt in place
+    if [ "$dir" = "/opt" ]; then
+        break
+    fi
+
+    # try to delete the directory, only if it's empty
+    $SUDO rmdir $dir
+    if [ $? -ne 0 ]; then
+        break
+    fi
+
+    # go to the next directory
+    dir=$(dirname $dir)
+done
+
+# Link the ld.so.cache file into the hosts filesystem
+if [ ! -f "$OECORE_NATIVE_SYSROOT/etc/ld.so.cache" ]; then
+echo_info "Link the ld.so.cache file into the host filesystem"
+$SUDO ln -s /etc/ld.so.cache $OECORE_NATIVE_SYSROOT/etc/ld.so.cache
+check_result
+fi
+
+# relocate binaries
+echo_info "\nRelocating binaries ..."
+escaped_sdkpath=$(echo $DEFAULT_INSTALL_FOLDER |sed -e "s:[\+\.]:\\\\\\\\\0:g")
+
+# We don't change the script in-place since we may want the user to re-run
+# adt-installer script
+$SUDO sed -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" scripts/relocate_sdk.py > scripts/relocate_sdk_tmp.py
+$SUDO chmod +x scripts/relocate_sdk_tmp.py
+
+dl_path=$(find $OECORE_NATIVE_SYSROOT/lib -name "ld-linux*")
+executable_files=$(find $OECORE_NATIVE_SYSROOT -type f -perm +111)
+
+$SUDO scripts/relocate_sdk_tmp.py $INSTALL_FOLDER $dl_path $executable_files
+check_result
+
+# replace /opt/${DISTRO}/${SDK_VERSION} with the install folder in all configs
+env_setup_script=$(find $NATIVE_INSTALL_DIR -name "environment-setup-*")
+$SUDO sed -i -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:g" $env_setup_script
+
+find $OECORE_NATIVE_SYSROOT -type f -exec file '{}' \;|grep ":.*ASCII.*text"|cut -d':' -f1|\
+    xargs $SUDO sed -i -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:g"
+
 echo_info "\nSuccessfully installed selected native ADT!"
 }
 
@@ -180,7 +255,7 @@ else
 fi
 
 if [ ! -z "$env_filename" ]; then
-  sudo sed -i -e "s%##SDKTARGETSYSROOT##%$target_sysroot%g" $env_filename
+  $SUDO sed -i -e "s%##SDKTARGETSYSROOT##%$target_sysroot%g" $env_filename
 else
   echo_info "[ADT_INST] Error: Failed to find environment script for arch: $1"
   return 1 
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index e1edf2f..d5d0da5 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -30,7 +30,7 @@ ALLOW_EMPTY = "1"
 
 PACKAGES = ""
 
-PR = "r9"
+PR = "r10"
 
 ADT_DEPLOY = "${TMPDIR}/deploy/sdk/"
 ADT_DIR = "${WORKDIR}/adt-installer/"
@@ -56,23 +56,24 @@ ADTREPO = "http://adtrepo.yoctoproject.org/${SDK_VERSION}"
 do_populate_adt[umask] = "022"
 
 fakeroot do_populate_adt () {
-	cd ${WORKDIR}
-	mkdir -p ${ADT_DEPLOY}
-	rm -f ${ADT_DEPLOY}/adt-installer.tar.bz2
-	rm -rf ${ADT_DIR}
-	mkdir -p ${ADT_DIR}/opkg/build
-	cp -r opkg ${ADT_DIR}/
-	sed -i -e 's#ADTREPO_URL#${ADTREPO}#' ${ADT_DIR}/opkg/conf/*.conf
-	cp -r trunk ${ADT_DIR}/opkg/build/
-	mv ${ADT_DIR}/opkg/build/trunk ${ADT_DIR}/opkg/build/opkg-svn
-	cp -r scripts ${ADT_DIR}/
-	cp adt_installer ${ADT_DIR}
-	cp adt_installer.conf ${ADT_DIR}
-	sed -i -e 's#YOCTOADT_VERSION#${SDK_VERSION}#' ${ADT_DIR}/adt_installer.conf
-        echo 'SDK_VENDOR=${SDK_VENDOR}' >> ${ADT_DIR}/scripts/data_define
-        echo 'INSTALL_FOLDER=${SDKPATH}' >> ${ADT_DIR}/scripts/data_define
-	tar cfj adt_installer.tar.bz2 adt-installer
-	cp ${WORKDIR}/adt_installer.tar.bz2 ${ADT_DEPLOY}
+    cd ${WORKDIR}
+    mkdir -p ${ADT_DEPLOY}
+    rm -f ${ADT_DEPLOY}/adt-installer.tar.bz2
+    rm -rf ${ADT_DIR}
+    mkdir -p ${ADT_DIR}/opkg/build
+    cp -r opkg ${ADT_DIR}/
+    sed -i -e 's#ADTREPO_URL#${ADTREPO}#' ${ADT_DIR}/opkg/conf/*.conf
+    cp -r trunk ${ADT_DIR}/opkg/build/
+    mv ${ADT_DIR}/opkg/build/trunk ${ADT_DIR}/opkg/build/opkg-svn
+    cp -r scripts ${ADT_DIR}/
+    cp adt_installer ${ADT_DIR}
+    cp adt_installer.conf ${ADT_DIR}
+    sed -i -e 's#YOCTOADT_VERSION#${SDK_VERSION}#' ${ADT_DIR}/adt_installer.conf
+    echo 'SDK_VENDOR=${SDK_VENDOR}' >> ${ADT_DIR}/scripts/data_define
+    echo 'DEFAULT_INSTALL_FOLDER=${SDKPATH}' >> ${ADT_DIR}/scripts/data_define
+    cp ${COREBASE}/scripts/relocate_sdk.py ${ADT_DIR}/scripts/
+    tar cfj adt_installer.tar.bz2 adt-installer
+    cp ${WORKDIR}/adt_installer.tar.bz2 ${ADT_DEPLOY}
 }
 
 do_populate_adt[nostamp] = "1"
-- 
1.7.9.5



