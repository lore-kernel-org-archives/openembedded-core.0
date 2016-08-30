Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 20E41736B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 09:31:12 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 30 Aug 2016 02:31:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,255,1470726000"; 
   d="scan'208";a="2629220"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2016 02:31:13 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 01B426A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 02:30:53 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 12:29:41 +0300
Message-Id: <9a4ee6fc75f7cf6a235f44e4ac95dcc024696791.1472548574.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 08/18] populate_sdk_base.bbclass: deploy sdk artifacts to DEPLOYDIR
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
X-List-Received-Date: Tue, 30 Aug 2016 09:31:15 -0000

Changed deployment directory from SDK_DEPLOY to DEPLOYDIR
to make sstate machinery to do final deployment and generate
manifest.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 645a7f4..4d2bc9a 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -26,6 +26,8 @@ SDK_DIR = "${WORKDIR}/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
 SDK_DEPLOY = "${DEPLOY_DIR}/sdk"
 
+DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
+
 B_task-populate-sdk = "${SDK_DIR}"
 
 SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
@@ -58,8 +60,8 @@ SDK_RELOCATE_AFTER_INSTALL ?= "1"
 SDKEXTPATH ?= "~/${@d.getVar('DISTRO', True)}_sdk"
 SDK_TITLE ?= "${@d.getVar('DISTRO_NAME', True) or d.getVar('DISTRO', True)} SDK"
 
-SDK_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
-SDK_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
+SDK_TARGET_MANIFEST = "${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
+SDK_HOST_MANIFEST = "${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
 python write_target_sdk_manifest () {
     from oe.sdk import sdk_list_installed_packages
     from oe.utils import format_pkg_list
@@ -180,14 +182,14 @@ SDKTAROPTS = "--owner=root --group=root"
 
 fakeroot tar_sdk() {
 	# Package it up
-	mkdir -p ${SDK_DEPLOY}
+	mkdir -p ${DEPLOYDIR}
 	cd ${SDK_OUTPUT}/${SDKPATH}
-	tar ${SDKTAROPTS} -cf - . | pixz > ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
+	tar ${SDKTAROPTS} -cf - . | pixz > ${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
 }
 
 fakeroot create_shar() {
 	# copy in the template shar extractor script
-	cp ${COREBASE}/meta/files/toolchain-shar-extract.sh ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+	cp ${COREBASE}/meta/files/toolchain-shar-extract.sh ${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	rm -f ${T}/pre_install_command ${T}/post_install_command
 
@@ -203,7 +205,7 @@ ${SDK_POST_INSTALL_COMMAND}
 EOF
 	sed -i -e '/@SDK_PRE_INSTALL_COMMAND@/r ${T}/pre_install_command' \
 		-e '/@SDK_POST_INSTALL_COMMAND@/r ${T}/post_install_command' \
-		${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+		${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# substitute variables
 	sed -i -e 's#@SDK_ARCH@#${SDK_ARCH}#g' \
@@ -215,16 +217,16 @@ EOF
 		-e 's#@SDK_VERSION@#${SDK_VERSION}#g' \
 		-e '/@SDK_PRE_INSTALL_COMMAND@/d' \
 		-e '/@SDK_POST_INSTALL_COMMAND@/d' \
-		${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+		${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# add execution permission
-	chmod +x ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+	chmod +x ${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# append the SDK tarball
-	cat ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.xz >> ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+	cat ${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz >> ${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# delete the old tarball, we don't need it anymore
-	rm ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
+	rm ${DEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
 }
 
 populate_sdk_log_check() {
-- 
2.1.4


