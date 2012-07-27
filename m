Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SuinP-0002OY-MZ
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 13:33:27 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jul 2012 04:21:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="198893981"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2012 04:21:55 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2012 14:21:45 +0300
Message-Id: <99f589f5432e2d4954acdaaa247bce76bad0b53d.1343387245.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <144e38e3c5156ec33b2fa3da4de9adc17c04770e.1343387245.git.laurentiu.palcu@intel.com>
References: <144e38e3c5156ec33b2fa3da4de9adc17c04770e.1343387245.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1343387245.git.laurentiu.palcu@intel.com>
References: <cover.1343387245.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/6] populate_sdk_base.bbclass: create self-extracting archive
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
X-List-Received-Date: Fri, 27 Jul 2012 11:33:28 -0000

In order for the SDK to be relocatable, the user would need to call a
setup script to change the binaries acordingly. Having an auto-extracting
archive has the advantage of being more user friendly and the user does
not have to call the setup script separately after extracting the SDK.
It is called automatically.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_base.bbclass |   82 ++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 9483e93..4464cdd 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -55,6 +55,8 @@ fakeroot python do_populate_sdk() {
         bb.build.exec_func("create_sdk_files", localdata)
 
     bb.build.exec_func("tar_sdk", d)
+
+    bb.build.exec_func("create_shar", d)
 }
 
 fakeroot populate_sdk_image() {
@@ -94,6 +96,8 @@ fakeroot create_sdk_files() {
 
 	# Add version information
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${REAL_MULTIMACH_TARGET_SYS}
+
+	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
 }
 
 fakeroot tar_sdk() {
@@ -103,6 +107,84 @@ fakeroot tar_sdk() {
 	tar --owner=root --group=root -cj --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
 }
 
+fakeroot create_shar() {
+	cat << "EOF" > ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+#!/bin/bash
+
+DEFAULT_INSTALL_DIR="/opt/poky"
+
+echo -n "Enter target directory for Poky SDK (default: $DEFAULT_INSTALL_DIR): "
+read target_sdk_dir
+
+if [ "$target_sdk_dir" = "" ]; then
+	target_sdk_dir=$DEFAULT_INSTALL_DIR
+fi
+
+eval target_sdk_dir=$target_sdk_dir
+target_sdk_dir=$(readlink -m $target_sdk_dir)
+
+echo -n "You are about to install Poky SDK to \"$target_sdk_dir\". Proceed[Y/n]?"
+read answer
+
+if [ "$answer" = "" ]; then
+	answer="y"
+fi
+
+if [ "$answer" != "Y" -a "$answer" != "y" ]; then
+	echo "Installation aborted!"
+	exit 1
+fi
+
+mkdir -p $target_sdk_dir >/dev/null 2>&1
+if [ $? -ne 0 ]; then
+	echo "Error: Unable to create target directory. Do you have permissions?"
+	exit 1
+fi
+
+target_sdk_dir_absoulte_path=$(readlink -f $target_sdk_dir)
+
+payload_offset=$(($(grep -na -m1 "^MARKER:$" $(basename $0)|cut -d':' -f1) + 1))
+
+echo -n "Extracting SDK..."
+tail -n +$payload_offset $(basename $0) | tar xj --strip-components=3 -C $target_sdk_dir
+echo "done"
+
+echo -n "Setting it up..."
+# fix environment paths
+env_setup_script=$(find $target_sdk_dir_absoulte_path -name "environment-setup*")
+sed -e "s:/opt/poky:$target_sdk_dir_absoulte_path:g" -i $env_setup_script
+
+# fix dynamic loader paths in all ELF SDK binaries
+native_sysroot=$(cat $env_setup_script |grep OECORE_NATIVE_SYSROOT|cut -d'=' -f2|tr -d '"')
+dl_path=$(find $native_sysroot/lib -name "ld-linux*")
+executable_files=$(find $native_sysroot -type f -perm +111)
+${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir_absoulte_path $dl_path $executable_files
+if [ $? -ne 0 ]; then
+	echo "SDK could not be set up. Relocate script failed. Abort!"
+	exit 1
+fi
+
+# replace /opt/poky with the new prefix in all text files: configs/scripts/etc
+find $native_sysroot -type f -exec file '{}' \;|grep text|cut -d':' -f1|xargs sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
+
+echo done
+
+# delete the relocating script, so that user is forced to re-run the installer
+# if he/she wants another location for the sdk
+rm ${env_setup_script%/*}/relocate_sdk.py
+
+echo "SDK has been successfully set up and is ready to be used."
+
+exit 0
+
+MARKER:
+EOF
+	cat ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 >> ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+
+	# delete the old tarball, we don't need it anymore
+	rm ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2
+}
+
 populate_sdk_log_check() {
 	for target in $*
 	do
-- 
1.7.9.5



