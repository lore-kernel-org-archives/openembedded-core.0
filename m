Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id BE91671ACB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 08:56:54 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id 190so5388669itm.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 01:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mrDCAOPRtY7I3D1NUL098upCUZd9okovAHCMIUJO00Y=;
	b=QOrjP3qFyZzTkxhreyzg+w0R1eTOC4tlvZVzysBX7fZy9q965mo7lfA7KKbpnBTDX8
	nZflt81grmUSCAvia83AS3lI4Q68wABL3lS1r8lhIIF1y6pDIk7F5433e+yvkKFqXzn6
	nooXISYQTuOPFqFV5/3zNHPJ8EWV4tkqaMHdTd/VUhCt1rIUk9leI8PB1Et3ORD/4gBs
	1ObuPE6h07AscDYlSDoTdfGRd9fYgLbvzfM8JmuFZtXaQi95o3msPdBll/XUnlKHBPnY
	MmeukgEsM63DqfdKuMDaogddZ/YzHk9GrAeRIRFLsR4au2jWY14bUDwm7bunzRAyX/xY
	wVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mrDCAOPRtY7I3D1NUL098upCUZd9okovAHCMIUJO00Y=;
	b=f9oYal0cvggLH6KCKPFBnMgFKbfdj9Wmi9zOmDR3du+9bqfS3UvEhv+xtOMe4udmly
	ovzakI8KT20O1WVNzg8IUGq7vgPOXpgzGs3Djk9E1JaeOeMOsmBQSML1QyaO9Z14bdfW
	FjdbPUNwTrf3JOsxfnVrqVBtc76v6jA4JXvrxyJwRyq7T+a6T/kUta6TInBRrzq7612U
	q2ptYxGyvH5j6LGoTQmi66Tiz/5NDUI0YzLS8+CjXJVMmv49VwrS0YnDhHMOD+oSK8Zh
	GK5IJ7sV+BSlTsiZ4DvCqoLcBc+0pSYePduidKGQWLT/dJowfEeMgb/2ZB/rvA6/hLtI
	/ANg==
X-Gm-Message-State: AFeK/H2K967vMdAnujx5R8fzxVPd6lA6cpfHq24edyKWxIy6CmEnfbwVWA0IAYg2ohL0xDCd
X-Received: by 10.36.61.210 with SMTP id n201mr1430343itn.70.1490086615689;
	Tue, 21 Mar 2017 01:56:55 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D82C.dip0.t-ipconnect.de.
	[93.232.216.44])
	by smtp.gmail.com with ESMTPSA id p77sm9802770iod.4.2017.03.21.01.56.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Mar 2017 01:56:54 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 09:56:50 +0100
Message-Id: <789385f4751e6657d8ed8d458d49f824adc2b5d7.1490086265.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <1490086445.6396.214.camel@intel.com>
References: <1490086445.6396.214.camel@intel.com>
Cc: ricardo.neri@intel.com
Subject: [PATCH] ovmf: fix toolchain selection
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
X-List-Received-Date: Tue, 21 Mar 2017 08:56:57 -0000

For the native tools, a static patch inserted gcc/g++/ld/ar while later
adding BUILD_LDFLAGS and BUILD_CFLAGS with sed. Now it's all done with sed,
which has the advantage that it uses the actual compile variables. However,
in practice those are the same.

More importantly, picking the build tools for the target was
broken. ovmf-native tried to insert TARGET_PREFIX into the tools
definition file, but that variable is empty in a native recipe. As a
result, "gcc" was used instead of "${HOST_PREFIX}gcc", leading to an
undesirable dependency on the host compiler and potentially
(probably?!) causing some of the build issues that were seen for ovmf.

The new approach is to override the tool selection in ovmf-native so
that the HOST_PREFIX env variable is used, which then gets exported
during do_compile for the target.

While at it, Python code that gets appened to do_patch only to call
shell functions gets replaced with the do_patch[postfuncs] mechanism.

Incremental builds now always use the tools definition from the
current ovmf-native; previously, only the initial build copied the
template file.

Probably the entire split into ovmf-native and ovmf could be
removed. This merely hasn't been attempted yet.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch | 48 ------------------------------------------------
 meta/recipes-core/ovmf/ovmf_git.bb                                                       | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++------------------
 2 files changed, 50 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
deleted file mode 100644
index 644b99d..0000000
--- a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 6e24bde1979c2d7149b37d142fb882dfde0e9770 Mon Sep 17 00:00:00 2001
-From: Matt Fleming <matt.fleming@intel.com>
-Date: Fri, 27 Jun 2014 11:12:18 +0100
-Subject: [PATCH] BaseTools: Force tools variables to host toolchain
-
-Signed-off-by: Matt Fleming <matt.fleming@intel.com>
----
- BaseTools/Source/C/Makefiles/app.makefile | 7 +++++++
- BaseTools/Source/C/VfrCompile/GNUmakefile | 5 +++++
- 2 files changed, 12 insertions(+)
-
-diff --git a/BaseTools/Source/C/Makefiles/app.makefile b/BaseTools/Source/C/Makefiles/app.makefile
-index 19269a1..62aad0f 100644
---- a/BaseTools/Source/C/Makefiles/app.makefile
-+++ b/BaseTools/Source/C/Makefiles/app.makefile
-@@ -16,6 +16,13 @@ include $(MAKEROOT)/Makefiles/header.makefile
- 
- APPLICATION = $(MAKEROOT)/bin/$(APPNAME)
- 
-+CC = gcc
-+CXX = g++
-+AS = gcc
-+AR = ar
-+LD = ld
-+LINKER = $(CC)
-+
- .PHONY:all
- all: $(MAKEROOT)/bin $(APPLICATION) 
- 
-diff --git a/BaseTools/Source/C/VfrCompile/GNUmakefile b/BaseTools/Source/C/VfrCompile/GNUmakefile
-index 82005e1..5ac5f7e 100644
---- a/BaseTools/Source/C/VfrCompile/GNUmakefile
-+++ b/BaseTools/Source/C/VfrCompile/GNUmakefile
-@@ -26,6 +26,11 @@ OBJECTS = AParser.o DLexerBase.o ATokenBuffer.o EfiVfrParser.o VfrLexer.o VfrSyn
- 
- VFR_CPPFLAGS = -DPCCTS_USE_NAMESPACE_STD $(CPPFLAGS)
- 
-+CC = gcc
-+CXX = g++
-+AS = gcc
-+AR = ar
-+LD = ld
- LINKER = $(BUILD_CXX)
- 
- EXTRA_CLEAN_OBJECTS = EfiVfrParser.cpp EfiVfrParser.h VfrParser.dlg VfrTokens.h VfrLexer.cpp VfrLexer.h VfrSyntax.cpp tokens.h
--- 
-1.9.0
-
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index a658c9d..898c5b7 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -11,7 +11,6 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[secureboot] = ",,,"
 
 SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
-	file://0001-BaseTools-Force-tools-variables-to-host-toolchain.patch \
 	file://0002-ovmf-update-path-to-native-BaseTools.patch \
 	file://0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
 	file://VfrCompile-increase-path-length-limit.patch \
@@ -51,31 +50,54 @@ COMPATIBLE_HOST='(i.86|x86_64).*'
 OVMF_SECURE_BOOT_EXTRA_FLAGS ??= ""
 OVMF_SECURE_BOOT_FLAGS = "-DSECURE_BOOT_ENABLE=TRUE ${OVMF_SECURE_BOOT_EXTRA_FLAGS}"
 
-do_patch_append_class-native() {
-    bb.build.exec_func('do_fix_iasl', d)
-    bb.build.exec_func('do_fix_toolchain', d)
+do_patch[postfuncs] += "fix_basetools_location"
+fix_basetools_location () {
 }
-
-do_fix_basetools_location() {
+fix_basetools_location_class-target() {
+    # Replaces the fake path inserted by 0002-ovmf-update-path-to-native-BaseTools.patch.
+    # Necessary for finding the actual BaseTools from ovmf-native.
     sed -i -e 's#BBAKE_EDK_TOOLS_PATH#${STAGING_BINDIR_NATIVE}/${EDK_TOOLS_DIR}#' ${S}/OvmfPkg/build.sh
 }
 
-do_patch_append_class-target() {
-    bb.build.exec_func('do_fix_basetools_location', d)
+do_patch[postfuncs] += "fix_iasl"
+fix_iasl() {
 }
-
-
-do_fix_iasl() {
+fix_iasl_class-native() {
+    # iasl is not installed under /usr/bin when building with OE.
     sed -i -e 's#/usr/bin/iasl#${STAGING_BINDIR_NATIVE}/iasl#' ${S}/BaseTools/Conf/tools_def.template
 }
 
-do_fix_toolchain(){
-    sed -i -e 's#DEF(ELFGCC_BIN)/#${TARGET_PREFIX}#' ${S}/BaseTools/Conf/tools_def.template
-    sed -i -e 's#DEF(GCC.*PREFIX)#${TARGET_PREFIX}#' ${S}/BaseTools/Conf/tools_def.template
-    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nLFLAGS += ${BUILD_LDFLAGS}#" ${S}/BaseTools/Source/C/Makefiles/app.makefile
-    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nCFLAGS += ${BUILD_CFLAGS}#" ${S}/BaseTools/Source/C/Makefiles/app.makefile
-    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nLFLAGS += ${BUILD_LDFLAGS}#" ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
-    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nCFLAGS += ${BUILD_CFLAGS}#" ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
+# Inject CC and friends into the build. LINKER already is in GNUmakefile.
+# Must be idempotent and thus remove old assignments that were inserted
+# earlier.
+do_patch[postfuncs] += "fix_toolchain"
+fix_toolchain() {
+    sed -i \
+        -e '/^\(CC\|CXX\|AS\|AR\|LD\|LINKER\) =/d' \
+        -e '/^APPLICATION/a CC = ${CC}\nCXX = ${CXX}\nAS = ${AS}\nAR = ${AR}\nLD = ${LD}\nLINKER = $(CC)' \
+        ${S}/BaseTools/Source/C/Makefiles/app.makefile
+    sed -i \
+        -e '/^\(CC\|CXX\|AS\|AR\|LD\)/d' \
+        -e '/^VFR_CPPFLAGS/a CC = ${CC}\nCXX = ${CXX}\nAS = ${AS}\nAR = ${AR}\nLD = ${LD}' \
+        ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
+}
+fix_toolchain_append_class-native() {
+    # This tools_def.template is going to be used by the target ovmf and
+    # defines which compilers to use. For the GCC toolchain definitions,
+    # that will be ${HOST_PREFIX}gcc. However, "make" doesn't need that
+    # prefix.
+    #
+    # Injecting ENV(HOST_PREFIX) matches exporting that value as env
+    # variable in do_compile_class-target.
+    sed -i \
+        -e 's#\(ENV\|DEF\)(GCC.*_PREFIX)#ENV(HOST_PREFIX)#' \
+        -e 's#ENV(HOST_PREFIX)make#make#' \
+        ${S}/BaseTools/Conf/tools_def.template
+    sed -i \
+        -e '/^\(LFLAGS\|CFLAGS\) +=/d' \
+        -e '/^LINKER/a LFLAGS += ${BUILD_LDFLAGS}\nCFLAGS += ${BUILD_CFLAGS}' \
+        ${S}/BaseTools/Source/C/Makefiles/app.makefile \
+        ${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
 }
 
 GCC_VER="$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}')"
@@ -119,6 +141,16 @@ do_compile_class-target() {
         OVMF_ARCH="IA32"
     fi
 
+    # The build for the target uses BaseTools/Conf/tools_def.template
+    # from ovmf-native to find the compiler, which depends on
+    # exporting HOST_PREFIX.
+    export HOST_PREFIX="${HOST_PREFIX}"
+
+    # BaseTools/Conf gets copied to Conf, but only if that does not
+    # exist yet. To ensure that an updated template gets used during
+    # incremental builds, we need to remove the copy before we start.
+    rm -f `ls ${S}/Conf/*.txt | grep -v ReadMe.txt`
+
     # ${WORKDIR}/ovmf is a well-known location where do_install and
     # do_deploy will be able to find the files.
     rm -rf ${WORKDIR}/ovmf

base-commit: 30bea167e7c204be52b3f5af24e43d5f339e98b7
-- 
git-series 0.9.1

