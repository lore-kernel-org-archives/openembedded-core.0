Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E2DB173232
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 12:42:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 07 Sep 2015 05:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,485,1437462000"; d="scan'208";a="556940025"
Received: from wmurray-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.6])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2015 05:42:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Sep 2015 13:42:18 +0100
Message-Id: <9f2d826750fa29287d8b8a6936fff200c366dc45.1441629547.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/11] toolchain-shar-extract.sh: better default install path for extensible SDK
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
X-List-Received-Date: Mon, 07 Sep 2015 12:42:44 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

Extensible SDK cannot be installed as root so by default offer to install it in
user's home directory under distro/distro_version replacing the normal SDK
version '+' char with a '_' as that's a restricted character for bitbake

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass |  2 ++
 meta/files/toolchain-shar-extract.sh   | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index a9e9bd7..b015bf0 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -55,6 +55,7 @@ SDK_PRE_INSTALL_COMMAND ?= ""
 SDK_POST_INSTALL_COMMAND ?= ""
 SDK_RELOCATE_AFTER_INSTALL ?= "1"
 
+SDKEXTPATH ?= "~/${@d.getVar('DISTRO', True)}_sdk"
 SDK_TITLE ?= "${@d.getVar('DISTRO_NAME', True) or d.getVar('DISTRO', True)} SDK"
 
 SDK_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
@@ -154,6 +155,7 @@ EOF
 	# substitute variables
 	sed -i -e 's#@SDK_ARCH@#${SDK_ARCH}#g' \
 		-e 's#@SDKPATH@#${SDKPATH}#g' \
+		-e 's#@SDKEXTPATH@#${SDKEXTPATH}#g' \
 		-e 's#@OLDEST_KERNEL@#${OLDEST_KERNEL}#g' \
 		-e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
 		-e 's#@SDK_TITLE@#${SDK_TITLE}#g' \
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 85719fa..27a1607 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -36,7 +36,6 @@ while getopts ":yd:DRS" OPT; do
 	case $OPT in
 	y)
 		answer="Y"
-		[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
 		;;
 	d)
 		target_sdk_dir=$OPTARG
@@ -73,9 +72,18 @@ fi
 
 @SDK_PRE_INSTALL_COMMAND@
 
+# SDK_EXTENSIBLE is exposed from the SDK_PRE_INSTALL_COMMAND above
+if [ "$SDK_EXTENSIBLE" = "1" ]; then
+	DEFAULT_INSTALL_DIR="@SDKEXTPATH@"
+fi
+
 if [ "$target_sdk_dir" = "" ]; then
-	read -e -p "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): " target_sdk_dir
-	[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
+	if [ "$answer" = "Y" ]; then
+		target_sdk_dir="$DEFAULT_INSTALL_DIR"
+	else
+		read -e -p "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): " target_sdk_dir
+		[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
+	fi
 fi
 
 eval target_sdk_dir=$(echo "$target_sdk_dir"|sed 's/ /\\ /g')
@@ -155,7 +163,7 @@ echo "done"
 printf "Setting it up..."
 # fix environment paths
 for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
-	$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
+	$SUDO_EXEC sed -e "s:@SDKPATH@:$target_sdk_dir:g" -i $env_setup_script
 done
 
 @SDK_POST_INSTALL_COMMAND@
-- 
2.1.0


