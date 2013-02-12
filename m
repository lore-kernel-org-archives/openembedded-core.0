Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1U5DyO-0008K2-EQ
	for Openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 12:24:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1CB8U3D022604
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 03:08:30 -0800 (PST)
Received: from ord-lpggp2.wrs.com (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 12 Feb 2013 03:08:28 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Tue, 12 Feb 2013 05:08:22 -0600
Message-ID: <1360667303-3650-3-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1360667303-3650-1-git-send-email-jason.wessel@windriver.com>
References: <1360667303-3650-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v3 2/3] populate_sdk_base.bbclass: Improve debugging capabilities for SDK installer
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
X-List-Received-Date: Tue, 12 Feb 2013 11:24:36 -0000
Content-Type: text/plain

After having to debug the SDK installer a few times in
addition to the relocation code the following patch was created
to improve the capabilities around debugging the SDK installer.

1) Add a verbose mode -D which set a set -x to see what
   the SDK installer is doing.

2) Add a mode -S to save the relocation scripts for the purpose
   of debugging them in conjunction with -D

3) Add a mode -R to not execute the relocation scripts for the
   purpose of debugging the relocations.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass |   48 ++++++++++++++++++++++++++++----
 1 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index c025d40..923f925 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -136,7 +136,10 @@ DEFAULT_INSTALL_DIR="${SDKPATH}"
 SUDO_EXEC=""
 target_sdk_dir=""
 answer=""
-while getopts ":yd:" OPT; do
+relocate=1
+savescripts=0
+verbose=0
+while getopts ":yd:DRS" OPT; do
 	case $OPT in
 	y)
 		answer="Y"
@@ -145,15 +148,33 @@ while getopts ":yd:" OPT; do
 	d)
 		target_sdk_dir=$OPTARG
 		;;
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
 	*)
 		echo "Usage: $(basename $0) [-y] [-d <dir>]"
 		echo "  -y         Automatic yes to all prompts"
 		echo "  -d <dir>   Install the SDK to <dir>"
+		echo "======== Advanced DEBUGGING ONLY OPTIONS ========"
+		echo "  -S         Save relocation scripts"
+		echo "  -R         Do not relocate executables"
+		echo "  -D         use set -x to see what is going on"
 		exit 1
 		;;
 	esac
 done
 
+if [ $verbose = 1 ] ; then
+	set -x
+fi
+
 printf "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): "
 if [ "$target_sdk_dir" = "" ]; then
 	read target_sdk_dir
@@ -231,10 +252,23 @@ if [ "$dl_path" = "" ] ; then
 	exit 1
 fi
 executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm +111)
-$SUDO_EXEC ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files
-if [ $? -ne 0 ]; then
-	echo "SDK could not be set up. Relocate script failed. Abort!"
-	exit 1
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
 fi
 
 # replace ${SDKPATH} with the new prefix in all text files: configs/scripts/etc
@@ -249,7 +283,9 @@ echo done
 
 # delete the relocating script, so that user is forced to re-run the installer
 # if he/she wants another location for the sdk
-$SUDO_EXEC rm ${env_setup_script%/*}/relocate_sdk.py
+if [ $savescripts = 0 ] ; then
+	$SUDO_EXEC rm ${env_setup_script%/*}/relocate_sdk.py ${env_setup_script%/*}/relocate_sdk.sh
+fi
 
 echo "SDK has been successfully set up and is ready to be used."
 
-- 
1.7.1



