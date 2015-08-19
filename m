Return-Path: <brendan.le.foll@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6A96875E80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:32:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2015 06:32:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,710,1432623600"; d="scan'208";a="786789186"
Received: from jupiter.iwi.intel.com ([172.28.33.51])
	by fmsmga002.fm.intel.com with ESMTP; 19 Aug 2015 06:32:51 -0700
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Aug 2015 14:32:44 +0100
Message-Id: <1439991165-13121-3-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1439991165-13121-1-git-send-email-brendan.le.foll@intel.com>
References: <1439991165-13121-1-git-send-email-brendan.le.foll@intel.com>
Subject: [PATCH 2/3] toolchain-shar-extract.sh: better default install path for extensible SDK
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
X-List-Received-Date: Wed, 19 Aug 2015 13:32:51 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

Extensible SDK cannot be installed as root so by default offer to install it in
user's home directory under distro/distro_version replacing the normal SDK
version '+' char with a '_' as that's a restricted character for bitbake

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 meta/files/toolchain-shar-extract.sh | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 6984e11..c4c2a70 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -73,6 +73,19 @@ fi
 
 @SDK_PRE_INSTALL_COMMAND@
 
+# SDK_EXTENSIBLE is exposed from the SDK_PRE_INSTALL_COMMAND above
+if [ "$SDK_EXTENSIBLE" = "1" ]; then
+        if [ ! -w "$DEFAULT_INSTALL_DIR" ]; then
+		# if we can't write to dir then make a new default in /home/$(whoami)
+		# replace any illegal chars with a sensible one
+		DEFAULT_INSTALL_DIR="~/$(echo "@SDK_TITLE@" | cut -d " " -f1)/$(echo $(basename $DEFAULT_INSTALL_DIR) | tr "+ @" _)"
+		# reset target_sdk_dir in case of answer="Y"
+		if [ "$answer" = "Y" ]; then
+			target_sdk_dir="$DEFAULT_INSTALL_DIR"
+		fi
+	fi
+fi
+
 if [ "$target_sdk_dir" = "" ]; then
 	read -e -p "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): " target_sdk_dir
 	[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
@@ -149,7 +162,7 @@ echo "done"
 printf "Setting it up..."
 # fix environment paths
 for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
-	$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
+	$SUDO_EXEC sed -e "s:@SDKPATH@:$target_sdk_dir:g" -i $env_setup_script
 done
 
 @SDK_POST_INSTALL_COMMAND@
-- 
2.5.0


