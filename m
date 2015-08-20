Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D06D265CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 07:06:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7K76cBU025787
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 00:06:38 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Thu, 20 Aug 2015 00:06:37 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Aug 2015 15:07:00 +0800
Message-ID: <9930c73e672bd30e2a30a3d5746931707a3dbfe2.1440054343.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440054343.git.Qi.Chen@windriver.com>
References: <cover.1440054343.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 4/7] Extensible SDK: allow for installation without preparing build system
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
X-List-Received-Date: Thu, 20 Aug 2015 07:06:37 -0000
Content-Type: text/plain

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
index df87edb..d2ebcef 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -217,11 +217,13 @@ sdk_ext_postinst() {
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
index 3a50991..23cb69a 100644
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
@@ -41,6 +41,9 @@ while getopts ":yd:DRS" OPT; do
 	d)
 		target_sdk_dir=$OPTARG
 		;;
+	n)
+		prepare_buildsystem="no"
+		;;
 	D)
 		verbose=1
 		;;
@@ -55,6 +58,8 @@ while getopts ":yd:DRS" OPT; do
 		echo "Usage: $(basename $0) [-y] [-d <dir>]"
 		echo "  -y         Automatic yes to all prompts"
 		echo "  -d <dir>   Install the SDK to <dir>"
+		echo "======== Extensible SDK only options ============"
+		echo "  -n         Do not prepare the build system"
 		echo "======== Advanced DEBUGGING ONLY OPTIONS ========"
 		echo "  -S         Save relocation scripts"
 		echo "  -R         Do not relocate executables"
-- 
1.9.1


