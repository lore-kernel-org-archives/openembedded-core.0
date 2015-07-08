Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0C92D75D9A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 16:25:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2015 09:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,432,1432623600"; d="scan'208";a="602437084"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga003.jf.intel.com with ESMTP; 08 Jul 2015 09:25:13 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jul 2015 08:20:26 +0000
Message-Id: <f81ba427469fb04550efe6431284a0c0b2c1a546.1436343270.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1436343270.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1436343270.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1436343270.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1436343270.git.leonardo.sandoval.gonzalez@linux.intel.com>
Cc: matt.fleming@intel.com, ricardo.neri@intel.com
Subject: [PATCH V2 1/2] ovmf: Recipe taken from luv-yocto repository
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
X-List-Received-Date: Wed, 08 Jul 2015 16:25:21 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

OVMF metadata taken from the luv-yocto[1] repository and copied into
OE-Core meta/recipes-core folder.

[1] https://github.com/01org/luv-yocto/tree/master/meta-luv/recipes-core/ovmf

[YOCTO #5654]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 ...s-Force-tools-variables-to-host-toolchain.patch | 50 ++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb                 | 61 ++++++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf_git.bb

diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
new file mode 100644
index 0000000..94c4d4c
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
@@ -0,0 +1,50 @@
+From 6e24bde1979c2d7149b37d142fb882dfde0e9770 Mon Sep 17 00:00:00 2001
+From: Matt Fleming <matt.fleming@intel.com>
+Date: Fri, 27 Jun 2014 11:12:18 +0100
+Subject: [PATCH] BaseTools: Force tools variables to host toolchain
+
+Upstream-Status: Pending
+
+Signed-off-by: Matt Fleming <matt.fleming@intel.com>
+---
+ BaseTools/Source/C/Makefiles/app.makefile | 7 +++++++
+ BaseTools/Source/C/VfrCompile/GNUmakefile | 5 +++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/BaseTools/Source/C/Makefiles/app.makefile b/BaseTools/Source/C/Makefiles/app.makefile
+index 19269a1..62aad0f 100644
+--- a/BaseTools/Source/C/Makefiles/app.makefile
++++ b/BaseTools/Source/C/Makefiles/app.makefile
+@@ -16,6 +16,13 @@ include $(MAKEROOT)/Makefiles/header.makefile
+ 
+ APPLICATION = $(MAKEROOT)/bin/$(APPNAME)
+ 
++CC = gcc
++CXX = g++
++AS = gcc
++AR = ar
++LD = ld
++LINKER = $(CC)
++
+ .PHONY:all
+ all: $(MAKEROOT)/bin $(APPLICATION) 
+ 
+diff --git a/BaseTools/Source/C/VfrCompile/GNUmakefile b/BaseTools/Source/C/VfrCompile/GNUmakefile
+index 82005e1..5ac5f7e 100644
+--- a/BaseTools/Source/C/VfrCompile/GNUmakefile
++++ b/BaseTools/Source/C/VfrCompile/GNUmakefile
+@@ -26,6 +26,11 @@ OBJECTS = AParser.o DLexerBase.o ATokenBuffer.o EfiVfrParser.o VfrLexer.o VfrSyn
+ 
+ VFR_CPPFLAGS = -DPCCTS_USE_NAMESPACE_STD $(CPPFLAGS)
+ 
++CC = gcc
++CXX = g++
++AS = gcc
++AR = ar
++LD = ld
+ LINKER = $(CXX)
+ 
+ EXTRA_CLEAN_OBJECTS = EfiVfrParser.cpp EfiVfrParser.h VfrParser.dlg VfrTokens.h VfrLexer.cpp VfrLexer.h VfrSyntax.cpp tokens.h
+-- 
+1.9.0
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
new file mode 100644
index 0000000..ce7e4f8
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -0,0 +1,61 @@
+DESCRIPTION = "OVMF - UEFI firmware for Qemu and KVM"
+HOMEPAGE = "http://sourceforge.net/apps/mediawiki/tianocore/index.php?title=OVMF"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://OvmfPkg/License.txt;md5=ffd52cf9a8e0e036b9a61a0de2dc87ed"
+
+SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
+	file://0001-BaseTools-Force-tools-variables-to-host-toolchain.patch"
+
+SRCREV="dc4ad1532e59fd1a185d6b90d1c2a92cf8713f40"
+
+S = "${WORKDIR}/git"
+
+DEPENDS_class-native="util-linux-native iasl-native"
+
+# OVMF has trouble building with the default optimization of -O2.
+BUILD_OPTIMIZATION="-pipe"
+
+# OVMF supports IA only, although it could conceivably support ARM someday.
+COMPATIBLE_HOST='(i.86|x86_64).*'
+
+do_patch_append() {
+    bb.build.exec_func('do_fix_iasl', d)
+    bb.build.exec_func('do_fix_toolchain', d)
+}
+
+do_fix_iasl() {
+    sed -i -e 's#/usr/bin/iasl#${STAGING_BINDIR_NATIVE}/iasl#' ${S}/BaseTools/Conf/tools_def.template
+}
+
+do_fix_toolchain(){
+    sed -i -e 's#DEF(ELFGCC_BIN)/#${TARGET_PREFIX}#' ${S}/BaseTools/Conf/tools_def.template
+    sed -i -e 's#DEF(GCC.*PREFIX)#${TARGET_PREFIX}#' ${S}/BaseTools/Conf/tools_def.template
+    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nLFLAGS += ${BUILD_LDFLAGS}#" ${S}/BaseTools/Source/C/Makefiles/app.makefile
+    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nCFLAGS += ${BUILD_CFLAGS}#" ${S}/BaseTools/Source/C/Makefiles/app.makefile
+    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nLFLAGS += ${BUILD_LDFLAGS}#" ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
+    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nCFLAGS += ${BUILD_CFLAGS}#" ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
+}
+
+GCC_VER="$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}' | awk -F. '{print $1$2}')"
+
+do_compile() {
+    export LFLAGS="${LDFLAGS}"
+    OVMF_ARCH="X64"
+    if [ "${TARGET_ARCH}" != "x86_64" ] ; then
+        OVMF_ARCH="IA32"
+    fi
+    ${S}/OvmfPkg/build.sh -a $OVMF_ARCH -b RELEASE -t GCC${GCC_VER}
+}
+
+do_install() {
+    OVMF_DIR_SUFFIX="X64"
+    if [ "${TARGET_ARCH}" != "x86_64" ] ; then
+        OVMF_DIR_SUFFIX="Ia32" # Note the different capitalization
+    fi
+    install -d ${D}${datadir}/ovmf
+    build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/RELEASE_GCC${GCC_VER}"
+    install -m 0755 ${build_dir}/FV/OVMF.fd \
+	${D}${datadir}/ovmf/bios.bin
+}
+
+BBCLASSEXTEND = "native"
-- 
1.8.4.5


