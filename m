Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 54DD27142F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 17:20:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Sep 2014 10:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,500,1406617200"; d="scan'208";a="571260068"
Received: from tmediriw-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.16])
	by orsmga001.jf.intel.com with ESMTP; 10 Sep 2014 10:19:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Sep 2014 18:19:31 +0100
Message-Id: <a6f93ae9bba678a6e1e1dbb151e0811058fb8365.1410369386.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1410369386.git.paul.eggleton@linux.intel.com>
References: <cover.1410369386.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1410369386.git.paul.eggleton@linux.intel.com>
References: <cover.1410369386.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/populate_sdk_base: enable adding custom commands to SDK install script
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
X-List-Received-Date: Wed, 10 Sep 2014 17:20:13 -0000

Add an SDK_POST_INSTALL_COMMAND variable which allows additional
commands to be added towards the end of the SDK install script, for e.g.
additional processing that needs to be done as part of installing the
SDK.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 7 +++++++
 meta/files/toolchain-shar-template.sh  | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index abfcdc7..946a1d4 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -51,6 +51,7 @@ PID = "${@os.getpid()}"
 EXCLUDE_FROM_WORLD = "1"
 
 SDK_PACKAGING_FUNC ?= "create_shar"
+SDK_POST_INSTALL_COMMAND ?= ""
 
 SDK_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.manifest"
 python write_target_sdk_manifest () {
@@ -142,10 +143,16 @@ fakeroot create_shar() {
 	# copy in the template shar extractor script
 	cp ${COREBASE}/meta/files/toolchain-shar-template.sh ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
 
+	cat << "EOF" > ${T}/post_install_command
+${SDK_POST_INSTALL_COMMAND}
+EOF
+	sed -i -e '/@SDK_POST_INSTALL_COMMAND@/r ${T}/post_install_command' ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+
 	# substitute variables
 	sed -i -e 's#@SDK_ARCH@#${SDK_ARCH}#g' \
 		-e 's#@SDKPATH@#${SDKPATH}#g' \
 		-e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
+		-e '/@SDK_POST_INSTALL_COMMAND@/d' \
 		${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# add execution permission
diff --git a/meta/files/toolchain-shar-template.sh b/meta/files/toolchain-shar-template.sh
index a37d6ff..02035d4 100644
--- a/meta/files/toolchain-shar-template.sh
+++ b/meta/files/toolchain-shar-template.sh
@@ -169,6 +169,8 @@ done
 
 echo done
 
+@SDK_POST_INSTALL_COMMAND@
+
 # delete the relocating script, so that user is forced to re-run the installer
 # if he/she wants another location for the sdk
 if [ $savescripts = 0 ] ; then
-- 
1.9.3


