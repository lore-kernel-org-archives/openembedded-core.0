Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C85EC736FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 17:00:52 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2015 09:00:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,631,1418112000"; d="scan'208";a="531537411"
Received: from afedko-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.4.45])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2015 08:51:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Feb 2015 17:00:40 +0000
Message-Id: <e6ea5bb90fcf40db8b16eacec7ab193641e3fc95.1424709353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424709353.git.paul.eggleton@linux.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424709353.git.paul.eggleton@linux.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/9] toolchain-shar-template.sh: Make relocation optional.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Feb 2015 17:00:53 -0000

From: Randy Witt <randy.e.witt@linux.intel.com>

If the buildsystem is copied into the sdk and its toolchain is to
be used, then the relocation provided in toolchain-shar-template.sh
isn't needed and will actually fail.

So break the relocation aspect out and essentially make it another
SDK_POST_INSTALL_COMMAND script.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass             | 10 +++-
 ...-shar-template.sh => toolchain-shar-extract.sh} | 53 +---------------------
 meta/files/toolchain-shar-relocate.sh              | 50 ++++++++++++++++++++
 3 files changed, 59 insertions(+), 54 deletions(-)
 rename meta/files/{toolchain-shar-template.sh => toolchain-shar-extract.sh} (64%)
 create mode 100644 meta/files/toolchain-shar-relocate.sh

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index e3adacb..5c07693 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -52,6 +52,7 @@ EXCLUDE_FROM_WORLD = "1"
 
 SDK_PACKAGING_FUNC ?= "create_shar"
 SDK_POST_INSTALL_COMMAND ?= ""
+SDK_RELOCATE_AFTER_INSTALL ?= "1"
 
 SDK_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.manifest"
 python write_target_sdk_manifest () {
@@ -116,9 +117,14 @@ fakeroot tar_sdk() {
 
 fakeroot create_shar() {
 	# copy in the template shar extractor script
-	cp ${COREBASE}/meta/files/toolchain-shar-template.sh ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+	cp ${COREBASE}/meta/files/toolchain-shar-extract.sh ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
 
-	cat << "EOF" > ${T}/post_install_command
+	rm -f ${T}/post_install_command
+
+	if [ ${SDK_RELOCATE_AFTER_INSTALL} -eq 1 ] ; then
+		cp ${COREBASE}/meta/files/toolchain-shar-relocate.sh ${T}/post_install_command
+	fi
+	cat << "EOF" >> ${T}/post_install_command
 ${SDK_POST_INSTALL_COMMAND}
 EOF
 	sed -i -e '/@SDK_POST_INSTALL_COMMAND@/r ${T}/post_install_command' ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
diff --git a/meta/files/toolchain-shar-template.sh b/meta/files/toolchain-shar-extract.sh
similarity index 64%
rename from meta/files/toolchain-shar-template.sh
rename to meta/files/toolchain-shar-extract.sh
index 151b973..516aa3a 100644
--- a/meta/files/toolchain-shar-template.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -139,63 +139,12 @@ for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
 	$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
 done
 
-# fix dynamic loader paths in all ELF SDK binaries
-native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE_SYSROOT='|cut -d'=' -f2|tr -d '"')
-dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
-if [ "$dl_path" = "" ] ; then
-	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
-	exit 1
-fi
-executable_files=$($SUDO_EXEC find $native_sysroot -type f \
-	\( -perm -0100 -o -perm -0010 -o -perm -0001 \) -printf "'%h/%f' ")
-
-tdir=`mktemp -d`
-if [ x$tdir = x ] ; then
-   echo "SDK relocate failed, could not create a temporary directory"
-   exit 1
-fi
-echo "#!/bin/bash" > $tdir/relocate_sdk.sh
-echo exec ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files >> $tdir/relocate_sdk.sh
-$SUDO_EXEC mv $tdir/relocate_sdk.sh ${env_setup_script%/*}/relocate_sdk.sh
-$SUDO_EXEC chmod 755 ${env_setup_script%/*}/relocate_sdk.sh
-rm -rf $tdir
-if [ $relocate = 1 ] ; then
-	$SUDO_EXEC ${env_setup_script%/*}/relocate_sdk.sh
-	if [ $? -ne 0 ]; then
-		echo "SDK could not be set up. Relocate script failed. Abort!"
-		exit 1
-	fi
-fi
-
-# replace @SDKPATH@ with the new prefix in all text files: configs/scripts/etc
-for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
-	$SUDO_EXEC find $replace -type f -exec file '{}' \; | \
-		grep ":.*\(ASCII\|script\|source\).*text" | \
-		awk -F':' '{printf "\"%s\"\n", $1}' | \
-		grep -v "$target_sdk_dir/environment-setup-*" | \
-		$SUDO_EXEC xargs -n32 sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
-done
-
-# change all symlinks pointing to @SDKPATH@
-for l in $($SUDO_EXEC find $native_sysroot -type l); do
-	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
-done
-
-# find out all perl scripts in $native_sysroot and modify them replacing the
-# host perl with SDK perl.
-for perl_script in $($SUDO_EXEC find $native_sysroot -type f -exec grep -l "^#!.*perl" '{}' \;); do
-	$SUDO_EXEC sed -i -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" -e \
-		"s: /usr/bin/perl: /usr/bin/env perl:g" $perl_script
-done
-
-echo done
-
 @SDK_POST_INSTALL_COMMAND@
 
 # delete the relocating script, so that user is forced to re-run the installer
 # if he/she wants another location for the sdk
 if [ $savescripts = 0 ] ; then
-	$SUDO_EXEC rm ${env_setup_script%/*}/relocate_sdk.py ${env_setup_script%/*}/relocate_sdk.sh
+	$SUDO_EXEC rm -f ${env_setup_script%/*}/relocate_sdk.py ${env_setup_script%/*}/relocate_sdk.sh
 fi
 
 echo "SDK has been successfully set up and is ready to be used."
diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
new file mode 100644
index 0000000..dfb8e16
--- /dev/null
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -0,0 +1,50 @@
+# fix dynamic loader paths in all ELF SDK binaries
+native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE_SYSROOT='|cut -d'=' -f2|tr -d '"')
+dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
+if [ "$dl_path" = "" ] ; then
+	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
+	exit 1
+fi
+executable_files=$($SUDO_EXEC find $native_sysroot -type f \
+	\( -perm -0100 -o -perm -0010 -o -perm -0001 \) -printf "'%h/%f' ")
+
+tdir=`mktemp -d`
+if [ x$tdir = x ] ; then
+   echo "SDK relocate failed, could not create a temporary directory"
+   exit 1
+fi
+echo "#!/bin/bash" > $tdir/relocate_sdk.sh
+echo exec ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files >> $tdir/relocate_sdk.sh
+$SUDO_EXEC mv $tdir/relocate_sdk.sh ${env_setup_script%/*}/relocate_sdk.sh
+$SUDO_EXEC chmod 755 ${env_setup_script%/*}/relocate_sdk.sh
+rm -rf $tdir
+if [ $relocate = 1 ] ; then
+	$SUDO_EXEC ${env_setup_script%/*}/relocate_sdk.sh
+	if [ $? -ne 0 ]; then
+		echo "SDK could not be set up. Relocate script failed. Abort!"
+		exit 1
+	fi
+fi
+
+# replace @SDKPATH@ with the new prefix in all text files: configs/scripts/etc
+for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
+	$SUDO_EXEC find $replace -type f -exec file '{}' \; | \
+		grep ":.*\(ASCII\|script\|source\).*text" | \
+		awk -F':' '{printf "\"%s\"\n", $1}' | \
+		grep -v "$target_sdk_dir/environment-setup-*" | \
+		$SUDO_EXEC xargs -n32 sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
+done
+
+# change all symlinks pointing to @SDKPATH@
+for l in $($SUDO_EXEC find $native_sysroot -type l); do
+	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
+done
+
+# find out all perl scripts in $native_sysroot and modify them replacing the
+# host perl with SDK perl.
+for perl_script in $($SUDO_EXEC find $native_sysroot -type f -exec grep -l "^#!.*perl" '{}' \;); do
+	$SUDO_EXEC sed -i -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" -e \
+		"s: /usr/bin/perl: /usr/bin/env perl:g" $perl_script
+done
+
+echo done
-- 
1.9.3


