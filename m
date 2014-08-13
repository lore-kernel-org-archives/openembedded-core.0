Return-Path: <matt@console-pimps.org>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id AC6CC65D5E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 13:03:56 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u57so11232693wes.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 06:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pKI0eJvp4z2jVH5wN5cDeX4lb8VXflL/KnoC3OaoTKQ=;
	b=TB01u3bcnv+FQ+HGPoKwh4WtDTTqxmn4o/6VqIKji8n8buBG2QujUGnu1Er4oJVo6X
	qcpxq1d6EPm7eQKphEmhf72xVo5DXHga9earMF2PWUS5FLSm2fUG+evfFPStYiMIKehp
	JJGdOfRZ5VG9vz+HaBfvesyICGVQJ2/5Np9aHaT+qx7Kz2mujZSenL/cii5t+ptbCat8
	pua/9LjWQS4DX4Y7qZBgsBrccvnLTJvDAulrrHbrmpHbMbMNL8O55hLu8lS5GPBawQ6w
	+rFPr/FPVA8TVZToY4DoW7UZcjXv+f7rOiBoLl23vMTtBJV9IsIDU4KWUpW4kbPEjE8p
	KvXQ==
X-Gm-Message-State: ALoCoQl4N1U9R58kPaWtLWAfKvjjWz882joE/7qjGduVNp+3O5GYxmux7vwQnvDQOJNdS88qc1gv
X-Received: by 10.180.94.134 with SMTP id dc6mr5142266wib.22.1407935036606;
	Wed, 13 Aug 2014 06:03:56 -0700 (PDT)
Received: from localhost (05428d07.skybroadband.com. [5.66.141.7])
	by mx.google.com with ESMTPSA id es9sm4337206wjd.1.2014.08.13.06.03.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Aug 2014 06:03:55 -0700 (PDT)
From: Matt Fleming <matt@console-pimps.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 14:03:43 +0100
Message-Id: <1407935023-9284-3-git-send-email-matt@console-pimps.org>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1407935023-9284-1-git-send-email-matt@console-pimps.org>
References: <1407935023-9284-1-git-send-email-matt@console-pimps.org>
Cc: Darren Hart <dvhart@linux.intel.com>, Matt Fleming <matt.fleming@intel.com>
Subject: [PATCH v2 2/2] recipes-devtools: Add OVMF recipe
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
X-List-Received-Date: Wed, 13 Aug 2014 13:03:58 -0000

From: Matt Fleming <matt.fleming@intel.com>

The EDK2 project provides a UEFI firmware image for Qemu.

Import the OVMF recipe from the meta-luv layer.

Partial solution for [YOCTO #5654]

Cc: Max Eliaser <max.eliaser@intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Cc: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Signed-off-by: Matt Fleming <matt.fleming@intel.com>
---

v2: Put spaces around assignments and do config variable futzing in
do_configure_prepend() instead of do_patch_append().

 ...s-Force-tools-variables-to-host-toolchain.patch | 48 ++++++++++++++++++++
 meta/recipes-devtools/ovmf/ovmf_git.bb             | 52 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-devtools/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
 create mode 100644 meta/recipes-devtools/ovmf/ovmf_git.bb

diff --git a/meta/recipes-devtools/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch b/meta/recipes-devtools/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
new file mode 100644
index 0000000..c0cc633
--- /dev/null
+++ b/meta/recipes-devtools/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
@@ -0,0 +1,48 @@
+From 6e24bde1979c2d7149b37d142fb882dfde0e9770 Mon Sep 17 00:00:00 2001
+From: Matt Fleming <matt.fleming@intel.com>
+Date: Fri, 27 Jun 2014 11:12:18 +0100
+Subject: [PATCH] BaseTools: Force tools variables to host toolchain
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
diff --git a/meta/recipes-devtools/ovmf/ovmf_git.bb b/meta/recipes-devtools/ovmf/ovmf_git.bb
new file mode 100644
index 0000000..b70142c
--- /dev/null
+++ b/meta/recipes-devtools/ovmf/ovmf_git.bb
@@ -0,0 +1,52 @@
+DESCRIPTION = "OVMF - UEFI firmware for Qemu and KVM"
+HOMEPAGE = "http://sourceforge.net/apps/mediawiki/tianocore/index.php?title=OVMF"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://OvmfPkg/License.txt;md5=ffd52cf9a8e0e036b9a61a0de2dc87ed"
+
+SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
+           file://0001-BaseTools-Force-tools-variables-to-host-toolchain.patch"
+
+SRCREV = "dc4ad1532e59fd1a185d6b90d1c2a92cf8713f40"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "util-linux-native iasl-native"
+
+# OVMF has trouble building with the default optimization of -O2.
+BUILD_OPTIMIZATION = "-pipe"
+
+# OVMF supports IA only, although it could conceivably support ARM someday.
+COMPATIBLE_HOST = '(i.86|x86_64).*'
+
+do_configure_prepend() {
+    sed -i -e 's#/usr/bin/iasl#${STAGING_BINDIR_NATIVE}/iasl#' ${S}/BaseTools/Conf/tools_def.template
+
+    sed -i -e 's#DEF(ELFGCC_BIN)/#${TARGET_PREFIX}#' ${S}/BaseTools/Conf/tools_def.template
+    sed -i -e 's#DEF(GCC.*PREFIX)#${TARGET_PREFIX}#' ${S}/BaseTools/Conf/tools_def.template
+    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nLFLAGS += ${BUILD_LDFLAGS}#" ${S}/BaseTools/Source/C/Makefiles/app.makefile
+    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nCFLAGS += ${BUILD_CFLAGS}#" ${S}/BaseTools/Source/C/Makefiles/app.makefile
+    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nLFLAGS += ${BUILD_LDFLAGS}#" ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
+    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nCFLAGS += ${BUILD_CFLAGS}#" ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
+}
+
+GCC_VER = "$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}' | awk -F. '{print $1$2}')"
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
-- 
1.9.3


