Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EA70F76DEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:21:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520219"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:21:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:16 +0100
Message-Id: <1a44d4d30c08be4577b6ed84fe48677e1dc0d5a9.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/27] classes/populate_sdk_ext: fix missing environment settings if running installer with sh
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:12 -0000

If you ran the extensible SDK installer file with sh (instead of bash),
then the additional call to buildtools environment setup, extension of
PATH to support running devtool, and setting of OE_SKIP_SDK_CHECK
weren't being added to the end of the script. This is because apparently
bash is happy to expand wildcards in the target of a redirection, but
bash running in POSIX sh mode won't (although it apparently does work on
the sh command line rather than within a script run as an argument to
sh). In any case using a wildcard here is a bit of a crutch which we
don't need, so replace it with the proper path to the environment setup
script.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 4ef8838..15cae71 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -222,14 +222,15 @@ sdk_ext_postinst() {
 
 	# Make sure when the user sets up the environment, they also get
 	# the buildtools-tarball tools in their path.
-	echo ". $target_sdk_dir/buildtools/environment-setup*" >> $target_sdk_dir/environment-setup*
+	env_setup_script="$target_sdk_dir/environment-setup-${REAL_MULTIMACH_TARGET_SYS}"
+	echo ". $target_sdk_dir/buildtools/environment-setup*" >> $env_setup_script
 
 	# Allow bitbake environment setup to be ran as part of this sdk.
-	echo "export OE_SKIP_SDK_CHECK=1" >> $target_sdk_dir/environment-setup*
+	echo "export OE_SKIP_SDK_CHECK=1" >> $env_setup_script
 
 	# A bit of another hack, but we need this in the path only for devtool
 	# so put it at the end of $PATH.
-	echo "export PATH=\$PATH:$target_sdk_dir/sysroots/${SDK_SYS}/${bindir_nativesdk}" >> $target_sdk_dir/environment-setup*
+	echo "export PATH=\$PATH:$target_sdk_dir/sysroots/${SDK_SYS}/${bindir_nativesdk}" >> $env_setup_script
 
 	# For now this is where uninative.bbclass expects the tarball
 	mv *-nativesdk-libc.tar.* $target_sdk_dir/`dirname ${oe_init_build_env_path}`
-- 
2.1.0


