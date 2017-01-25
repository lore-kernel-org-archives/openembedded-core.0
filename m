Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E9D3560111
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 13:41:06 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2017 05:41:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,283,1477983600"; d="scan'208";a="57071907"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 25 Jan 2017 05:41:06 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 62ECB6A4080;
	Wed, 25 Jan 2017 05:40:08 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 15:18:36 +0200
Message-Id: <1485350316-4842-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] toolchain-shar-extract: compare SDK and host gcc versions
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
X-List-Received-Date: Wed, 25 Jan 2017 13:41:10 -0000

If ext sdk is built by gcc version higher than host gcc version
and host gcc version is 4.8 or 4.9 the installation is known to
fail due to the way uninative sstate package is built.

It's a known issue and we don't have a way to fix it for above
mentioned combinations of build and host gcc versions.

Detected non-installable combinations of gcc versions and
print an installation error.

[YOCTO #10881]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 1 +
 meta/files/toolchain-shar-extract.sh   | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 5ad08c6..588a3cb 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -226,6 +226,7 @@ EOF
 		-e 's#@SDK_VERSION@#${SDK_VERSION}#g' \
 		-e '/@SDK_PRE_INSTALL_COMMAND@/d' \
 		-e '/@SDK_POST_INSTALL_COMMAND@/d' \
+		-e 's#@SDK_GCC_VER@#${@oe.utils.host_gcc_version(d)}#g' \
 		${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# add execution permission
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 9295ddc..3f54c96 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -11,6 +11,9 @@ export PATH=`echo "$PATH" | sed -e 's/:\.//' -e 's/::/:/'`
 INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
 SDK_ARCH=$(echo @SDK_ARCH@ | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
 
+INST_GCC_VER=$(gcc --version | sed -ne 's/.* \([0-9]\+\.[0-9]\+\)\.[0-9]\+.*/\1/p')
+SDK_GCC_VER='@SDK_GCC_VER@'
+
 verlte () {
 	[  "$1" = "`printf "$1\n$2" | sort -V | head -n1`" ]
 }
@@ -112,6 +115,11 @@ fi
 # SDK_EXTENSIBLE is exposed from the SDK_PRE_INSTALL_COMMAND above
 if [ "$SDK_EXTENSIBLE" = "1" ]; then
 	DEFAULT_INSTALL_DIR="@SDKEXTPATH@"
+	if [ "$INST_GCC_VER" = '4.8' -a "$SDK_GCC_VER" = '4.9' ] || [ "$INST_GCC_VER" = '4.8' -a "$SDK_GCC_VER" = '' ] || \
+		[ "$INST_GCC_VER" = '4.9' -a "$SDK_GCC_VER" = '' ]; then
+		echo "Error: Incompatible SDK installer! Your host gcc version is $INST_GCC_VER and this SDK was built by gcc higher version."
+		exit 1
+	fi
 fi
 
 if [ "$target_sdk_dir" = "" ]; then
-- 
2.1.4


