Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TdxdA-0004Qu-6H
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 07:30:04 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAT6FaW1008287
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 22:15:36 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 28 Nov 2012 22:15:35 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Nov 2012 14:15:32 +0800
Message-ID: <e5340a75b4d8dcdc897814eb2620828498cb8328.1354169442.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354169442.git.hongxu.jia@windriver.com>
References: <cover.1354169442.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] populate_sdk_base:tarball installer:add sudo prompt
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
X-List-Received-Date: Thu, 29 Nov 2012 06:30:14 -0000
Content-Type: text/plain

1.Adds a sudo passwd prompt during installation if the
  user couldn't install on the dir.
2.Adds option -d <dir> to enter dir without prompt.
3.Adds option -y for automatic yes to all prompts, a non-
  interactive method.

[YOCTO# 3153]
[YOCTO# 3309]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass |   69 +++++++++++++++++++++++---------
 1 file changed, 51 insertions(+), 18 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index f1fcde6..4411077 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -128,12 +128,33 @@ fi
 
 DEFAULT_INSTALL_DIR="${SDKPATH}"
 COMPONENTS_LEN=$(echo ".${SDKPATH}" | sed "s/\// /g" | wc -w)
+SUDO_EXEC=""
+target_sdk_dir=""
+answer=""
+while getopts ":yd:" OPT; do
+	case $OPT in
+	y)
+		answer="Y"
+		[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
+		;;
+	d)
+		target_sdk_dir=$OPTARG
+		;;
+	*)
+		echo "Usage: $(basename $0) [-y] [-d <dir>]"
+		echo "  -y         Automatic yes to all prompts"
+		echo "  -d <dir>   Install the SDK to <dir>"
+		exit 1
+		;;
+	esac
+done
 
 printf "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): "
-read target_sdk_dir
-
 if [ "$target_sdk_dir" = "" ]; then
-	target_sdk_dir=$DEFAULT_INSTALL_DIR
+	read target_sdk_dir
+	[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
+else
+	echo "$target_sdk_dir"
 fi
 
 eval target_sdk_dir=$target_sdk_dir
@@ -153,10 +174,12 @@ else
 
 	default_answer="y"
 fi
-read answer
 
 if [ "$answer" = "" ]; then
-	answer="$default_answer"
+	read answer
+	[ "$answer" = "" ] && answer="$default_answer"
+else
+	echo $answer
 fi
 
 if [ "$answer" != "Y" -a "$answer" != "y" ]; then
@@ -164,47 +187,57 @@ if [ "$answer" != "Y" -a "$answer" != "y" ]; then
 	exit 1
 fi
 
+# create dir and don't care about the result. 
 mkdir -p $target_sdk_dir >/dev/null 2>&1
-if [ $? -ne 0 ]; then
-	echo "Error: Unable to create target directory. Do you have permissions?"
-	exit 1
+
+# if don't have the right to access dir, gain by sudo 
+if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; then 
+	SUDO_EXEC=$(which "sudo")
+	if [ -z $SUDO_EXEC ]; then
+		echo "No command 'sudo' found, please install sduo first. Abort!"
+		exit 1
+	fi
+
+	# test sudo could gain root right
+	$SUDO_EXEC pwd >/dev/null 2>&1
+	[ $? -ne 0 ] && echo "Sorry, you are not allowed to execute as root." && exit 1
 fi
 
 payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
 
 printf "Extracting SDK..."
-tail -n +$payload_offset $0| tar xj --strip-components=$COMPONENTS_LEN -C $target_sdk_dir
+tail -n +$payload_offset $0| $SUDO_EXEC tar xj --strip-components=$COMPONENTS_LEN -C $target_sdk_dir
 echo "done"
 
 printf "Setting it up..."
 # fix environment paths
 for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
-  sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
+	$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
 done
 
 # fix dynamic loader paths in all ELF SDK binaries
-native_sysroot=$(cat $env_setup_script |grep OECORE_NATIVE_SYSROOT|cut -d'=' -f2|tr -d '"')
-dl_path=$(find $native_sysroot/lib -name "ld-linux*")
-executable_files=$(find $native_sysroot -type f -perm +111)
-${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files
+native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep OECORE_NATIVE_SYSROOT|cut -d'=' -f2|tr -d '"')
+dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
+executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm +111)
+$SUDO_EXEC ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files
 if [ $? -ne 0 ]; then
 	echo "SDK could not be set up. Relocate script failed. Abort!"
 	exit 1
 fi
 
 # replace ${SDKPATH} with the new prefix in all text files: configs/scripts/etc
-find $native_sysroot -type f -exec file '{}' \;|grep ":.*ASCII.*text"|cut -d':' -f1|xargs sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
+$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|$SUDO_EXEC grep ":.*ASCII.*text"|cut -d':' -f1|$SUDO_EXEC xargs sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
 
 # change all symlinks pointing to ${SDKPATH}
-for l in $(find $native_sysroot -type l); do
-	ln -sfn $(readlink $l|sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
+for l in $($SUDO_EXEC find $native_sysroot -type l); do
+	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
 done
 
 echo done
 
 # delete the relocating script, so that user is forced to re-run the installer
 # if he/she wants another location for the sdk
-rm ${env_setup_script%/*}/relocate_sdk.py
+$SUDO_EXEC rm ${env_setup_script%/*}/relocate_sdk.py
 
 echo "SDK has been successfully set up and is ready to be used."
 
-- 
1.7.10.4



