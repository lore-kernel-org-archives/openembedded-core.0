Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3D392770AB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 15:21:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 06 Jun 2016 08:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,427,1459839600"; d="scan'208";a="714707622"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Jun 2016 08:21:10 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 07:15:43 +0000
Message-Id: <a8b52bf902ebca764fff66454b0978aa5fea33e9.1465196934.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1465196934.git.mariano.lopez@linux.intel.com>
References: <cover.1465196934.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1465196934.git.mariano.lopez@linux.intel.com>
References: <cover.1465196934.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 5/7] testexport-tarball.bb: Add recipe
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
X-List-Received-Date: Mon, 06 Jun 2016 15:21:09 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This new recipe is used when exporting runtime test outside
packages that won't be installed in the testing system but
are required for the runtime testing.

This new recipe is almost identical to buildtools-tarball,
but is able to define the SDK packages in local.conf.

[YOCTO #7850]

(From OE-Core rev: fbcd1f9ed6144a76ff6a556d23af30f04c39bfa0)

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/recipes-core/meta/testexport-tarball.bb | 56 ++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 meta/recipes-core/meta/testexport-tarball.bb

diff --git a/meta/recipes-core/meta/testexport-tarball.bb b/meta/recipes-core/meta/testexport-tarball.bb
new file mode 100644
index 0000000..951d3be
--- /dev/null
+++ b/meta/recipes-core/meta/testexport-tarball.bb
@@ -0,0 +1,56 @@
+DESCRIPTION = "SDK type target for standalone tarball containing packages defined by TEST_EXPORT_TOOLS. The \
+               tarball can be used to run missing programs on testing systems which don't have such tools.\
+               This recipe is almost the same as buildtools-tarball"
+SUMMARY = "Standalone tarball for test systems with missing software"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+TOOLCHAIN_TARGET_TASK ?= ""
+
+TOOLCHAIN_HOST_TASK ?= "${TEST_EXPORT_SDK_PACKAGES}"
+
+SDK_PACKAGE_ARCHS += "tesexport-tools-${SDKPKGSUFFIX}"
+
+TOOLCHAIN_OUTPUTNAME ?= "${TEST_EXPORT_SDK_NAME}"
+
+SDK_TITLE = "Testexport tools"
+
+RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
+
+EXCLUDE_FROM_WORLD = "1"
+
+inherit meta
+inherit populate_sdk
+inherit toolchain-scripts
+
+create_sdk_files_append () {
+	rm -f ${SDK_OUTPUT}/${SDKPATH}/site-config-*
+	rm -f ${SDK_OUTPUT}/${SDKPATH}/environment-setup-*
+	rm -f ${SDK_OUTPUT}/${SDKPATH}/version-*
+
+	# Generate new (mini) sdk-environment-setup file
+	script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${SDK_SYS}}
+	touch $script
+	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:$PATH' >> $script
+	# In order for the self-extraction script to correctly extract and set up things,
+	# we need a 'OECORE_NATIVE_SYSROOT=xxx' line in environment setup script.
+	# However, testexport-tarball is inherently a tool set instead of a fully functional SDK,
+	# so instead of exporting the variable, we use a comment here.
+	echo '#OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
+	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
+
+	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+
+	if [ "${SDKMACHINE}" = "i686" ]; then
+		echo 'export NO32LIBS="0"' >>$script
+		echo 'echo "$BB_ENV_EXTRAWHITE" | grep -q "NO32LIBS"' >>$script
+		echo '[ $? != 0 ] && export BB_ENV_EXTRAWHITE="NO32LIBS $BB_ENV_EXTRAWHITE"' >>$script
+	fi
+}
+
+# testexport-tarball doesn't need config site
+TOOLCHAIN_NEED_CONFIGSITE_CACHE = ""
+
+# The recipe doesn't need any default deps
+INHIBIT_DEFAULT_DEPS = "1"
-- 
2.6.6


