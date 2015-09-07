Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8644F73232
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 12:42:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 07 Sep 2015 05:42:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,485,1437462000"; d="scan'208";a="556940057"
Received: from wmurray-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.6])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2015 05:42:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Sep 2015 13:42:25 +0100
Message-Id: <79dabd922152c4700893b16d05bd5bceb8cffa47.1441629547.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/11] Extensible SDK: allow for installation without preparing build system
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
X-List-Received-Date: Mon, 07 Sep 2015 12:42:49 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

When publishing SDK, what we want is basically its metadata and sstate
cache objects. We don't want the SDK to be prepared with running bitbake
as it takes time which reproduces meaningless output for the published SDK.

So this patch adds an option to allow for SDK to be extracted without
preparing the build system.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 12 +++++++-----
 meta/files/toolchain-shar-extract.sh  |  7 ++++++-
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index fc2d96f..0b012eb 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -228,11 +228,13 @@ sdk_ext_postinst() {
 	# For now this is where uninative.bbclass expects the tarball
 	mv *-nativesdk-libc.tar.* $target_sdk_dir/`dirname ${oe_init_build_env_path}`
 
-	printf "Preparing build system...\n"
-	# dash which is /bin/sh on Ubuntu will not preserve the
-	# current working directory when first ran, nor will it set $1 when
-	# sourcing a script. That is why this has to look so ugly.
-	sh -c ". buildtools/environment-setup* > preparing_build_system.log && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> preparing_build_system.log && bitbake ${SDK_TARGETS} >> preparing_build_system.log" || { echo "SDK preparation failed: see `pwd`/preparing_build_system.log" ; exit 1 ; }
+	if [ "$prepare_buildsystem" != "no" ]; then
+	    printf "Preparing build system...\n"
+	    # dash which is /bin/sh on Ubuntu will not preserve the
+	    # current working directory when first ran, nor will it set $1 when
+	    # sourcing a script. That is why this has to look so ugly.
+	    sh -c ". buildtools/environment-setup* > preparing_build_system.log && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> preparing_build_system.log && bitbake ${SDK_TARGETS} >> preparing_build_system.log" || { echo "SDK preparation failed: see `pwd`/preparing_build_system.log" ; exit 1 ; }
+	fi
 	echo done
 }
 
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 3624940..cd0a547 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -32,7 +32,7 @@ answer=""
 relocate=1
 savescripts=0
 verbose=0
-while getopts ":yd:DRS" OPT; do
+while getopts ":yd:nDRS" OPT; do
 	case $OPT in
 	y)
 		answer="Y"
@@ -40,6 +40,9 @@ while getopts ":yd:DRS" OPT; do
 	d)
 		target_sdk_dir=$OPTARG
 		;;
+	n)
+		prepare_buildsystem="no"
+		;;
 	D)
 		verbose=1
 		;;
@@ -54,6 +57,8 @@ while getopts ":yd:DRS" OPT; do
 		echo "Usage: $(basename $0) [-y] [-d <dir>]"
 		echo "  -y         Automatic yes to all prompts"
 		echo "  -d <dir>   Install the SDK to <dir>"
+		echo "======== Extensible SDK only options ============"
+		echo "  -n         Do not prepare the build system"
 		echo "======== Advanced DEBUGGING ONLY OPTIONS ========"
 		echo "  -S         Save relocation scripts"
 		echo "  -R         Do not relocate executables"
-- 
2.1.0


