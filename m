Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98C227D5FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 09:08:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3U98Mbe014698
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 02:08:23 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 30 Apr 2019 02:08:22 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Apr 2019 17:08:21 +0800
Message-ID: <1556615301-328879-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V4] populate_sdk_base: provide options to set sdk type
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
X-List-Received-Date: Tue, 30 Apr 2019 09:08:22 -0000
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
 meta/classes/populate_sdk_base.bbclass | 29 ++++++++++++++++++++++-------
 meta/files/toolchain-shar-extract.sh   | 22 ++++++++++++++++++++--
 2 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index efaa5b9..a7f0fe7 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -45,8 +45,23 @@ TOOLCHAIN_TARGET_TASK ?= "${@multilib_pkg_extend(d, 'packagegroup-core-standalon
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
+# Default archived SDK's suffix
+SDK_ARCHIVE_TYPE ?= "tar.xz"
+
+# To support different sdk type according to SDK_ARCHIVE_TYPE, now support zip and tar.xz
+python () {
+    if d.getVar('SDK_ARCHIVE_TYPE') == 'zip':
+       d.setVar('SDK_ARCHIVE_DEPENDS', 'zip-native')
+       # SDK_ARCHIVE_CMD used to generate archived sdk ${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} from input dir ${SDK_OUTPUT}/${SDKPATH} to output dir ${SDKDEPLOYDIR}
+       # recommand to cd into input dir first to avoid archive with buildpath
+       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
+    else:
+       d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
+       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
+}
+
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
-SDK_DEPENDS = "virtual/fakeroot-native xz-native cross-localedef-native nativesdk-qemuwrapper-cross ${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross"
+SDK_DEPENDS = "virtual/fakeroot-native ${SDK_ARCHIVE_DEPENDS} cross-localedef-native nativesdk-qemuwrapper-cross ${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross"
 PATH_prepend = "${STAGING_DIR_HOST}${SDKPATHNATIVE}${bindir}/crossscripts:${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
 SDK_DEPENDS_append_libc-glibc = " nativesdk-glibc-locale"
 
@@ -104,7 +119,7 @@ POPULATE_SDK_POST_TARGET_COMMAND_append = " write_sdk_test_data ; "
 POPULATE_SDK_POST_TARGET_COMMAND_append_task-populate-sdk  = " write_target_sdk_manifest ; "
 POPULATE_SDK_POST_HOST_COMMAND_append_task-populate-sdk = " write_host_sdk_manifest; "
 SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC};' if '${SDK_PACKAGING_FUNC}' else ''}"
-SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; tar_sdk; ${SDK_PACKAGING_COMMAND} "
+SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; archive_sdk; ${SDK_PACKAGING_COMMAND} "
 
 def populate_sdk_common(d):
     from oe.sdk import populate_sdk
@@ -222,11 +237,10 @@ python check_sdk_sysroots() {
 
 SDKTAROPTS = "--owner=root --group=root"
 
-fakeroot tar_sdk() {
+fakeroot archive_sdk() {
 	# Package it up
 	mkdir -p ${SDKDEPLOYDIR}
-	cd ${SDK_OUTPUT}/${SDKPATH}
-	tar ${SDKTAROPTS} -cf - . | xz -9 ${XZ_DEFAULTS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
+	${SDK_ARCHIVE_CMD}
 }
 
 TOOLCHAIN_SHAR_EXT_TMPL ?= "${COREBASE}/meta/files/toolchain-shar-extract.sh"
@@ -263,16 +277,17 @@ EOF
 		-e '/@SDK_PRE_INSTALL_COMMAND@/d' \
 		-e '/@SDK_POST_INSTALL_COMMAND@/d' \
 		-e 's#@SDK_GCC_VER@#${@oe.utils.host_gcc_version(d, taskcontextonly=True)}#g' \
+		-e 's#@SDK_ARCHIVE_TYPE@#${SDK_ARCHIVE_TYPE}#g' \
 		${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# add execution permission
 	chmod +x ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# append the SDK tarball
-	cat ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz >> ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
+	cat ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} >> ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# delete the old tarball, we don't need it anymore
-	rm ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
+	rm ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}
 }
 
 populate_sdk_log_check() {
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 156085b..ccc4f4e 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -113,7 +113,16 @@ done
 
 payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
 if [ "$listcontents" = "1" ] ; then
-    tail -n +$payload_offset $0| tar tvJ || exit 1
+    if [ @SDK_ARCHIVE_TYPE@ = "zip" ]; then
+        tail -n +$payload_offset $0 > sdk.zip
+        if unzip -l sdk.zip;then
+            rm sdk.zip
+        else
+            rm sdk.zip && exit 1
+        fi
+    else
+        tail -n +$payload_offset $0| tar tvJ || exit 1
+    fi
     exit
 fi
 
@@ -232,7 +241,16 @@ if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; the
 fi
 
 printf "Extracting SDK..."
-tail -n +$payload_offset $0| $SUDO_EXEC tar xJ -C $target_sdk_dir --checkpoint=.2500 $EXTRA_TAR_OPTIONS || exit 1
+if [ @SDK_ARCHIVE_TYPE@ = "zip" ]; then
+    tail -n +$payload_offset $0 > sdk.zip
+    if $SUDO_EXEC unzip $EXTRA_TAR_OPTIONS sdk.zip -d $target_sdk_dir;then
+        rm sdk.zip
+    else
+        rm sdk.zip && exit 1
+    fi
+else
+    tail -n +$payload_offset $0| $SUDO_EXEC tar xJ -C $target_sdk_dir --checkpoint=.2500 $EXTRA_TAR_OPTIONS || exit 1
+fi
 echo "done"
 
 printf "Setting it up..."
-- 
2.7.4


