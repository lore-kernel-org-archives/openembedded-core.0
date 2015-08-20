Return-Path: <brendan.le.foll@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7D50376A11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 21:38:23 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 20 Aug 2015 14:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,717,1432623600"; d="scan'208";a="545648680"
Received: from jupiter.iwi.intel.com ([172.28.33.51])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Aug 2015 14:38:24 -0700
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 22:38:21 +0100
Message-Id: <1440106702-23272-3-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1440106702-23272-1-git-send-email-brendan.le.foll@intel.com>
References: <1440106702-23272-1-git-send-email-brendan.le.foll@intel.com>
Subject: [PATCH V2 2/3] toolchain-shar-extract.sh: better default install path for extensible SDK
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
X-List-Received-Date: Thu, 20 Aug 2015 21:38:23 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

Extensible SDK cannot be installed as root so by default offer to install it in
user's home directory under distro/distro_version replacing the normal SDK
version '+' char with a '_' as that's a restricted character for bitbake

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 meta/classes/populate_sdk_base.bbclass |  2 ++
 meta/files/toolchain-shar-extract.sh   | 11 ++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

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
index 0a95aba..41b3f2c 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -73,6 +73,15 @@ fi
 
 @SDK_PRE_INSTALL_COMMAND@
 
+# SDK_EXTENSIBLE is exposed from the SDK_PRE_INSTALL_COMMAND above
+if [ "$SDK_EXTENSIBLE" = "1" ]; then
+	DEFAULT_INSTALL_DIR="@SDKEXTPATH@"
+	# reset target_sdk_dir in case of answer="Y"
+	if [ "$answer" = "Y" ]; then
+		target_sdk_dir="$DEFAULT_INSTALL_DIR"
+	fi
+fi
+
 if [ "$target_sdk_dir" = "" ]; then
 	read -e -p "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): " target_sdk_dir
 	[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
@@ -149,7 +158,7 @@ echo "done"
 printf "Setting it up..."
 # fix environment paths
 for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
-	$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
+	$SUDO_EXEC sed -e "s:@SDKPATH@:$target_sdk_dir:g" -i $env_setup_script
 done
 
 @SDK_POST_INSTALL_COMMAND@
-- 
2.5.0


