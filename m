Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 301E96BA0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 09:53:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0H9qs24006941
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 01:53:09 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 17 Jan 2019 01:52:44 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jan 2019 17:52:41 +0800
Message-ID: <1547718761-239575-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547718761-239575-1-git-send-email-changqing.li@windriver.com>
References: <CAJTo0LZbjMKrjDO-NgFkhv3FHPfoDxhXFCuBpiFnj8O+iAYpaw@mail.gmail.com>
	<1547718761-239575-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2] populate_sdk_base: provide options to set sdk type
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
X-List-Received-Date: Thu, 17 Jan 2019 09:53:18 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Current sdk type is tar.xz, but for mingw sdk, since we
have symlink under the sdk folder, 7zip which used to
extract tar.xz cannot handle it, refer 7zip upstream bug:
https://sourceforge.net/p/sevenzip/discussion/45797/thread/c71d6b96/
so add option for usr can select the sdk type.

Add override SDK_ARCHIVE_TYPE, default type is tar.xz, and also
support type zip. user want to use zip type can set SDK_ARCHIVE_TYPE
to zip.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 677ba3c..a41933f 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -44,8 +44,21 @@ TOOLCHAIN_TARGET_TASK ?= "${@multilib_pkg_extend(d, 'packagegroup-core-standalon
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
+# Archived SDK's suffix, also used as OVERRIDES to support multi types. eg, sdk is sdkfilename.yy.zz, then SDK_ARCHIVE_TYPE should be yy.zz
+# now support tar.gz and zip, if user set SDK_ARCHIVE_TYPE wrongly as maybe yy, generate sdk will suffix with .yy, but actually is tar.xz
+SDK_ARCHIVE_TYPE ?= "tar.xz"
+OVERRIDES_append = ":${SDK_ARCHIVE_TYPE}"
+
+SDK_ARCHIVE_DEPENDS ?= "xz-native"
+# SDK_ARCHIVE_CMD used to generate archived sdk ${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} from input dir ${SDK_OUTPUT}/${SDKPATH} to output dir ${SDKDEPLOYDIR}
+# recommand to cd into input dir first to avoid archive with buildpath 
+SDK_ARCHIVE_CMD ?= "cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}"
+
+SDK_ARCHIVE_DEPENDS_zip = "zip-native"
+SDK_ARCHIVE_CMD_zip = "cd ${SDK_OUTPUT}/${SDKPATH}; zip -r ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} ."
+
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
-SDK_DEPENDS = "virtual/fakeroot-native xz-native cross-localedef-native nativesdk-qemuwrapper-cross ${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross"
+SDK_DEPENDS = "virtual/fakeroot-native ${SDK_ARCHIVE_DEPENDS} cross-localedef-native nativesdk-qemuwrapper-cross ${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross"
 PATH_prepend = "${STAGING_DIR_HOST}${SDKPATHNATIVE}${bindir}/crossscripts:${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
 SDK_DEPENDS_append_libc-glibc = " nativesdk-glibc-locale"
 
@@ -103,7 +116,7 @@ POPULATE_SDK_POST_TARGET_COMMAND_append = " write_sdk_test_data ; "
 POPULATE_SDK_POST_TARGET_COMMAND_append_task-populate-sdk  = " write_target_sdk_manifest ; "
 POPULATE_SDK_POST_HOST_COMMAND_append_task-populate-sdk = " write_host_sdk_manifest; "
 SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC};' if '${SDK_PACKAGING_FUNC}' else ''}"
-SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; tar_sdk; ${SDK_PACKAGING_COMMAND} "
+SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; archive_sdk; ${SDK_PACKAGING_COMMAND} "
 
 def populate_sdk_common(d):
     from oe.sdk import populate_sdk
@@ -221,11 +234,10 @@ python check_sdk_sysroots() {
 
 SDKTAROPTS = "--owner=root --group=root"
 
-fakeroot tar_sdk() {
+fakeroot archive_sdk() {
 	# Package it up
 	mkdir -p ${SDKDEPLOYDIR}
-	cd ${SDK_OUTPUT}/${SDKPATH}
-	tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
+	${SDK_ARCHIVE_CMD}
 }
 
 TOOLCHAIN_SHAR_EXT_TMPL ?= "${COREBASE}/meta/files/toolchain-shar-extract.sh"
@@ -268,10 +280,10 @@ EOF
 	chmod +x ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# append the SDK tarball
-	cat ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz >> ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
+	cat ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} >> ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# delete the old tarball, we don't need it anymore
-	rm ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
+	rm ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}
 }
 
 populate_sdk_log_check() {
-- 
2.7.4


