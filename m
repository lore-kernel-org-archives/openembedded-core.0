Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 70B08731BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:15:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBS7F7pU025237
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:15:07 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:15:07 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:35 -0800
Message-ID: <feefaceb8a2bce8129aba82d4d93e725656ee075.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 27/40] toolchain-shar-extract.sh: proper fix for additional env setup scripts
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
X-List-Received-Date: Mon, 28 Dec 2015 07:15:06 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

buildtools-tarball uses a custom env setup script, which isn't named the
same as the default; thus unfortunately OE-Core revision
a36469c97c9cb335de1e95dea5141038f337df95 broke installation of
buildtools-tarball. Revert that and implement a more robust mechanism.

(From OE-Core master rev: 00e081b81ba8118959b724269ba9d18d42aba8a4)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/files/toolchain-shar-extract.sh  |   11 +++++++++++
 meta/files/toolchain-shar-relocate.sh |    2 --
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 98b9f1c..6af37b7 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -169,9 +169,20 @@ echo "done"
 
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
1.7.9.5


