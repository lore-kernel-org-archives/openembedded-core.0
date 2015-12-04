Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2FC887002B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 02:43:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Dec 2015 18:43:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,378,1444719600"; d="scan'208";a="833968257"
Received: from cquah-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.135.68])
	by orsmga001.jf.intel.com with ESMTP; 03 Dec 2015 18:43:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Dec 2015 15:42:50 +1300
Message-Id: <fc92bbe259cfdb189399de322a9dca98d76d2ba3.1449196843.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1449196843.git.paul.eggleton@linux.intel.com>
References: <cover.1449196843.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1449196843.git.paul.eggleton@linux.intel.com>
References: <cover.1449196843.git.paul.eggleton@linux.intel.com>
Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH 1/1] toolchain-shar-extract.sh: proper fix for additional env setup scripts
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
X-List-Received-Date: Fri, 04 Dec 2015 02:43:18 -0000

buildtools-tarball uses a custom env setup script, which isn't named the
same as the default; thus unfortunately OE-Core revision
a36469c97c9cb335de1e95dea5141038f337df95 broke installation of
buildtools-tarball. Revert that and implement a more robust mechanism.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/files/toolchain-shar-extract.sh  | 11 +++++++++++
 meta/files/toolchain-shar-relocate.sh |  2 --
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 8ef2b77..ef47a6e 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -171,9 +171,20 @@ echo "done"
 
 printf "Setting it up..."
 # fix environment paths
+real_env_setup_script=""
 for env_setup_script in `ls $target_sdk_dir/environment-setup-*`; do
+	if grep -q 'OECORE_NATIVE_SYSROOT=' $env_setup_script; then
+		# Handle custom env setup scripts that are only named
+		# environment-setup-* so that they have relocation
+		# applied - what we want beyond here is the main one
+		# rather than the one that simply sorts last
+		real_env_setup_script="$env_setup_script"
+	fi
 	$SUDO_EXEC sed -e "s:@SDKPATH@:$target_sdk_dir:g" -i $env_setup_script
 done
+if [ -n "$real_env_setup_script" ] ; then
+	env_setup_script="$real_env_setup_script"
+fi
 
 @SDK_POST_INSTALL_COMMAND@
 
diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index d58e4ed..4ef2927 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -1,5 +1,3 @@
-#reset the env_setup_script value to the proper value
-env_setup_script=$target_sdk_dir/environment-setup-@REAL_MULTIMACH_TARGET_SYS@
 # fix dynamic loader paths in all ELF SDK binaries
 native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE_SYSROOT='|cut -d'=' -f2|tr -d '"')
 dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
-- 
2.5.0


