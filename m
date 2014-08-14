Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8E563609BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 13:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7EDXa8j014126 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:33:36 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mmSJa9EbF-a8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:33:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7EDXXH3014121
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:33:34 +0100
Message-ID: <1408023213.22187.102.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Aug 2014 14:33:33 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] populate_sdk_base: Move toolchain installation script to a separate file
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
X-List-Received-Date: Thu, 14 Aug 2014 13:33:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It makes sense to move the script to a separate file, making the bbclass
clearer and allowing the end user to more easily customise or replace
it. There are no functionality changes, just the addition of some
substitution variables.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 8736942..f9e98a7 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -120,190 +120,15 @@ fakeroot tar_sdk() {
 }
 
 fakeroot create_shar() {
-	cat << "EOF" > ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
-#!/bin/bash
-
-INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
-SDK_ARCH=$(echo ${SDK_ARCH} | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
-
-if [ "$INST_ARCH" != "$SDK_ARCH" ]; then
-	# Allow for installation of ix86 SDK on x86_64 host
-	if [ "$INST_ARCH" != x86_64 -o "$SDK_ARCH" != ix86 ]; then
-		echo "Error: Installation machine not supported!"
-		exit 1
-	fi
-fi
-
-DEFAULT_INSTALL_DIR="${SDKPATH}"
-SUDO_EXEC=""
-target_sdk_dir=""
-answer=""
-relocate=1
-savescripts=0
-verbose=0
-while getopts ":yd:DRS" OPT; do
-	case $OPT in
-	y)
-		answer="Y"
-		[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
-		;;
-	d)
-		target_sdk_dir=$OPTARG
-		;;
-	D)
-		verbose=1
-		;;
-	R)
-		relocate=0
-		savescripts=1
-		;;
-	S)
-		savescripts=1
-		;;
-	*)
-		echo "Usage: $(basename $0) [-y] [-d <dir>]"
-		echo "  -y         Automatic yes to all prompts"
-		echo "  -d <dir>   Install the SDK to <dir>"
-		echo "======== Advanced DEBUGGING ONLY OPTIONS ========"
-		echo "  -S         Save relocation scripts"
-		echo "  -R         Do not relocate executables"
-		echo "  -D         use set -x to see what is going on"
-		exit 1
-		;;
-	esac
-done
-
-if [ $verbose = 1 ] ; then
-	set -x
-fi
-
-if [ "$target_sdk_dir" = "" ]; then
-	read -e -p "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): " target_sdk_dir
-	[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
-fi
-
-eval target_sdk_dir=$(echo "$target_sdk_dir"|sed 's/ /\\ /g')
-if [ -d "$target_sdk_dir" ]; then
-	target_sdk_dir=$(cd "$target_sdk_dir"; pwd)
-else
-	target_sdk_dir=$(readlink -m "$target_sdk_dir")
-fi
-
-if [ -n "$(echo $target_sdk_dir|grep ' ')" ]; then
-	echo "The target directory path ($target_sdk_dir) contains spaces. Abort!"
-	exit 1
-fi
-
-if [ -e "$target_sdk_dir/environment-setup-${REAL_MULTIMACH_TARGET_SYS}" ]; then
-	echo "The directory \"$target_sdk_dir\" already contains a SDK for this architecture."
-	printf "If you continue, existing files will be overwritten! Proceed[y/N]?"
-
-	default_answer="n"
-else
-	printf "You are about to install the SDK to \"$target_sdk_dir\". Proceed[Y/n]?"
-
-	default_answer="y"
-fi
-
-if [ "$answer" = "" ]; then
-	read answer
-	[ "$answer" = "" ] && answer="$default_answer"
-else
-	echo $answer
-fi
-
-if [ "$answer" != "Y" -a "$answer" != "y" ]; then
-	echo "Installation aborted!"
-	exit 1
-fi
-
-# Try to create the directory (this will not succeed if user doesn't have rights)
-mkdir -p $target_sdk_dir >/dev/null 2>&1
-
-# if don't have the right to access dir, gain by sudo 
-if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; then 
-	SUDO_EXEC=$(which "sudo")
-	if [ -z $SUDO_EXEC ]; then
-		echo "No command 'sudo' found, please install sudo first. Abort!"
-		exit 1
-	fi
-
-	# test sudo could gain root right
-	$SUDO_EXEC pwd >/dev/null 2>&1
-	[ $? -ne 0 ] && echo "Sorry, you are not allowed to execute as root." && exit 1
-
-	# now that we have sudo rights, create the directory
-	$SUDO_EXEC mkdir -p $target_sdk_dir >/dev/null 2>&1
-fi
-
-payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
-
-printf "Extracting SDK..."
-tail -n +$payload_offset $0| $SUDO_EXEC tar xj -C $target_sdk_dir
-echo "done"
-
-printf "Setting it up..."
-# fix environment paths
-for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
-	$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
-done
-
-# fix dynamic loader paths in all ELF SDK binaries
-native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE_SYSROOT='|cut -d'=' -f2|tr -d '"')
-dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
-if [ "$dl_path" = "" ] ; then
-	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
-	exit 1
-fi
-executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111 -printf "'%h/%f' ")
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
-# replace ${SDKPATH} with the new prefix in all text files: configs/scripts/etc
-$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\|source\).*text"|awk -F':' '{printf "%s\0", $1}'|$SUDO_EXEC xargs -0 sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
-
-# change all symlinks pointing to ${SDKPATH}
-for l in $($SUDO_EXEC find $native_sysroot -type l); do
-	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
-done
-
-# find out all perl scripts in $native_sysroot and modify them replacing the
-# host perl with SDK perl.
-for perl_script in $($SUDO_EXEC find $native_sysroot -type f -exec grep "^#!.*perl" -l '{}' \;); do
-	$SUDO_EXEC sed -i -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" -e \
-		"s: /usr/bin/perl: /usr/bin/env perl:g" $perl_script
-done
-
-echo done
-
-# delete the relocating script, so that user is forced to re-run the installer
-# if he/she wants another location for the sdk
-if [ $savescripts = 0 ] ; then
-	$SUDO_EXEC rm ${env_setup_script%/*}/relocate_sdk.py ${env_setup_script%/*}/relocate_sdk.sh
-fi
-
-echo "SDK has been successfully set up and is ready to be used."
-
-exit 0
-
-MARKER:
-EOF
+	# copy in the template shar extractor script
+	cp ${COREBASE}/files/toolchain-shar-template.sh ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+
+	# substitute variables
+	sed -i -e 's#@SDK_ARCH@#${SDK_ARCH}#g' \
+		-e 's#@SDKPATH@#${SDKPATH}#g' \
+		-e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
+		${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+
 	# add execution permission
 	chmod +x ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
 
diff --git a/meta/files/toolchain-shar-template.sh b/meta/files/toolchain-shar-template.sh
new file mode 100644
index 0000000..a6207bb
--- /dev/null
+++ b/meta/files/toolchain-shar-template.sh
@@ -0,0 +1,182 @@
+#!/bin/bash
+
+INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
+SDK_ARCH=$(echo @SDK_ARCH@ | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
+
+if [ "$INST_ARCH" != "$SDK_ARCH" ]; then
+	# Allow for installation of ix86 SDK on x86_64 host
+	if [ "$INST_ARCH" != x86_64 -o "$SDK_ARCH" != ix86 ]; then
+		echo "Error: Installation machine not supported!"
+		exit 1
+	fi
+fi
+
+DEFAULT_INSTALL_DIR="@SDKPATH@"
+SUDO_EXEC=""
+target_sdk_dir=""
+answer=""
+relocate=1
+savescripts=0
+verbose=0
+while getopts ":yd:DRS" OPT; do
+	case $OPT in
+	y)
+		answer="Y"
+		[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
+		;;
+	d)
+		target_sdk_dir=$OPTARG
+		;;
+	D)
+		verbose=1
+		;;
+	R)
+		relocate=0
+		savescripts=1
+		;;
+	S)
+		savescripts=1
+		;;
+	*)
+		echo "Usage: $(basename $0) [-y] [-d <dir>]"
+		echo "  -y         Automatic yes to all prompts"
+		echo "  -d <dir>   Install the SDK to <dir>"
+		echo "======== Advanced DEBUGGING ONLY OPTIONS ========"
+		echo "  -S         Save relocation scripts"
+		echo "  -R         Do not relocate executables"
+		echo "  -D         use set -x to see what is going on"
+		exit 1
+		;;
+	esac
+done
+
+if [ $verbose = 1 ] ; then
+	set -x
+fi
+
+if [ "$target_sdk_dir" = "" ]; then
+	read -e -p "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): " target_sdk_dir
+	[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
+fi
+
+eval target_sdk_dir=$(echo "$target_sdk_dir"|sed 's/ /\\ /g')
+if [ -d "$target_sdk_dir" ]; then
+	target_sdk_dir=$(cd "$target_sdk_dir"; pwd)
+else
+	target_sdk_dir=$(readlink -m "$target_sdk_dir")
+fi
+
+if [ -n "$(echo $target_sdk_dir|grep ' ')" ]; then
+	echo "The target directory path ($target_sdk_dir) contains spaces. Abort!"
+	exit 1
+fi
+
+if [ -e "$target_sdk_dir/environment-setup-@REAL_MULTIMACH_TARGET_SYS@" ]; then
+	echo "The directory \"$target_sdk_dir\" already contains a SDK for this architecture."
+	printf "If you continue, existing files will be overwritten! Proceed[y/N]?"
+
+	default_answer="n"
+else
+	printf "You are about to install the SDK to \"$target_sdk_dir\". Proceed[Y/n]?"
+
+	default_answer="y"
+fi
+
+if [ "$answer" = "" ]; then
+	read answer
+	[ "$answer" = "" ] && answer="$default_answer"
+else
+	echo $answer
+fi
+
+if [ "$answer" != "Y" -a "$answer" != "y" ]; then
+	echo "Installation aborted!"
+	exit 1
+fi
+
+# Try to create the directory (this will not succeed if user doesn't have rights)
+mkdir -p $target_sdk_dir >/dev/null 2>&1
+
+# if don't have the right to access dir, gain by sudo 
+if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; then 
+	SUDO_EXEC=$(which "sudo")
+	if [ -z $SUDO_EXEC ]; then
+		echo "No command 'sudo' found, please install sudo first. Abort!"
+		exit 1
+	fi
+
+	# test sudo could gain root right
+	$SUDO_EXEC pwd >/dev/null 2>&1
+	[ $? -ne 0 ] && echo "Sorry, you are not allowed to execute as root." && exit 1
+
+	# now that we have sudo rights, create the directory
+	$SUDO_EXEC mkdir -p $target_sdk_dir >/dev/null 2>&1
+fi
+
+payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
+
+printf "Extracting SDK..."
+tail -n +$payload_offset $0| $SUDO_EXEC tar xj -C $target_sdk_dir
+echo "done"
+
+printf "Setting it up..."
+# fix environment paths
+for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
+	$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
+done
+
+# fix dynamic loader paths in all ELF SDK binaries
+native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE_SYSROOT='|cut -d'=' -f2|tr -d '"')
+dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
+if [ "$dl_path" = "" ] ; then
+	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
+	exit 1
+fi
+executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111 -printf "'%h/%f' ")
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
+$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\|source\).*text"|awk -F':' '{printf "%s\0", $1}'|$SUDO_EXEC xargs -0 sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
+
+# change all symlinks pointing to @SDKPATH@
+for l in $($SUDO_EXEC find $native_sysroot -type l); do
+	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
+done
+
+# find out all perl scripts in $native_sysroot and modify them replacing the
+# host perl with SDK perl.
+for perl_script in $($SUDO_EXEC find $native_sysroot -type f -exec grep "^#!.*perl" -l '{}' \;); do
+	$SUDO_EXEC sed -i -e "s:^#! */usr/bin/perl.*:#! /usr/bin/env perl:g" -e \
+		"s: /usr/bin/perl: /usr/bin/env perl:g" $perl_script
+done
+
+echo done
+
+# delete the relocating script, so that user is forced to re-run the installer
+# if he/she wants another location for the sdk
+if [ $savescripts = 0 ] ; then
+	$SUDO_EXEC rm ${env_setup_script%/*}/relocate_sdk.py ${env_setup_script%/*}/relocate_sdk.sh
+fi
+
+echo "SDK has been successfully set up and is ready to be used."
+
+exit 0
+
+MARKER:



