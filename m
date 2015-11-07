Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E2E8877109
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Nov 2015 17:53:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 07 Nov 2015 09:53:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,258,1444719600"; d="scan'208";a="814235990"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2015 09:53:53 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Nov 2015 09:46:42 -0800
Message-Id: <1446918402-432-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446918402-432-1-git-send-email-juro.bystricky@intel.com>
References: <6E51916E4A1F32428260031F4C7CD2B610D4B8C6@ORSMSX110.amr.corp.intel.com>
	<1446918402-432-1-git-send-email-juro.bystricky@intel.com>
Cc: richard.purdie@intel.com
Subject: [PATCH] gcc-4.9: Fix various _FOR_BUILD and related variables
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
X-List-Received-Date: Sat, 07 Nov 2015 17:53:54 -0000

This patch is based on the patch for gcc-5.2 (41cbfd7af60f93a4bd496b7b6bf477215a286950)

When doing a FOR_BUILD thing, you have to override CFLAGS with
CFLAGS_FOR_BUILD. And if you use C++, you also have to override
CXXFLAGS with CXXFLAGS_FOR_BUILD.
Without this, when building for mingw, you end up trying to use
the mingw headers for a host build.

The same goes for other variables as well, such as CPPFLAGS,
CPP, and GMPINC.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   1 +
 .../gcc/gcc-4.9/0066-cxxflags-for-build.patch      | 123 +++++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0066-cxxflags-for-build.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 95b553c..6ac3685 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -81,6 +81,7 @@ SRC_URI = "\
     file://0063-nativesdk-gcc-support.patch \
     file://0064-handle-target-sysroot-multilib.patch \
     file://0065-gcc-483-universal-initializer-no-warning.patch \
+    file://0066-cxxflags-for-build.patch \
 "
 SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
 SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0066-cxxflags-for-build.patch b/meta/recipes-devtools/gcc/gcc-4.9/0066-cxxflags-for-build.patch
new file mode 100644
index 0000000..1105e29
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0066-cxxflags-for-build.patch
@@ -0,0 +1,123 @@
+Fix various _FOR_BUILD and related variables
+
+When doing a FOR_BUILD thing, you have to override CFLAGS with
+CFLAGS_FOR_BUILD. And if you use C++, you also have to override
+CXXFLAGS with CXXFLAGS_FOR_BUILD.
+Without this, when building for mingw, you end up trying to use
+the mingw headers for a host build.
+
+The same goes for other variables as well, such as CPPFLAGS,
+CPP, and GMPINC.
+
+Upstream-Status: Pending
+
+Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff --git a/Makefile.in b/Makefile.in
+index 9370174..011c29a 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -152,6 +152,7 @@ BUILD_EXPORTS = \
+ 	CPP="$(CC_FOR_BUILD) -E"; export CPP; \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
+ 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
+ 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
+ 	GCJ="$(GCJ_FOR_BUILD)"; export GCJ; \
+@@ -170,6 +171,9 @@ BUILD_EXPORTS = \
+ # built for the build system to override those in BASE_FLAGS_TO_PASS.
+ EXTRA_BUILD_FLAGS = \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
++	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
++	CPP="$(CC_FOR_BUILD) -E" \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)" \
+ 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
+ 
+ # This is the list of directories to built for the host system.
+@@ -187,6 +191,7 @@ HOST_SUBDIR = @host_subdir@
+ HOST_EXPORTS = \
+ 	$(BASE_EXPORTS) \
+ 	CC="$(CC)"; export CC; \
++	CPP="$(CC) -E"; export CPP; \
+ 	ADA_CFLAGS="$(ADA_CFLAGS)"; export ADA_CFLAGS; \
+ 	CFLAGS="$(CFLAGS)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
+@@ -711,6 +715,7 @@ BASE_FLAGS_TO_PASS = \
+ 	"CC_FOR_BUILD=$(CC_FOR_BUILD)" \
+ 	"CFLAGS_FOR_BUILD=$(CFLAGS_FOR_BUILD)" \
+ 	"CXX_FOR_BUILD=$(CXX_FOR_BUILD)" \
++	"CXXFLAGS_FOR_BUILD=$(CXXFLAGS_FOR_BUILD)" \
+ 	"EXPECT=$(EXPECT)" \
+ 	"FLEX=$(FLEX)" \
+ 	"INSTALL=$(INSTALL)" \
+diff --git a/Makefile.tpl b/Makefile.tpl
+index 1ea1954..78a59c3 100644
+--- a/Makefile.tpl
++++ b/Makefile.tpl
+@@ -154,6 +154,7 @@ BUILD_EXPORTS = \
+ 	CC="$(CC_FOR_BUILD)"; export CC; \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
+ 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
+ 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
+ 	GCJ="$(GCJ_FOR_BUILD)"; export GCJ; \
+@@ -172,6 +173,9 @@ BUILD_EXPORTS = \
+ # built for the build system to override those in BASE_FLAGS_TO_PASS.
+ EXTRA_BUILD_FLAGS = \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
++	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
++	CPP="$(CC_FOR_BUILD) -E" \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)" \
+ 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
+ 
+ # This is the list of directories to built for the host system.
+@@ -189,6 +193,7 @@ HOST_SUBDIR = @host_subdir@
+ HOST_EXPORTS = \
+ 	$(BASE_EXPORTS) \
+ 	CC="$(CC)"; export CC; \
++	CPP="$(CC) -E"; export CPP; \
+ 	ADA_CFLAGS="$(ADA_CFLAGS)"; export ADA_CFLAGS; \
+ 	CFLAGS="$(CFLAGS)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index cd5bc4a..98ae4f4 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -762,7 +762,7 @@ BUILD_LINKERFLAGS = $(BUILD_CXXFLAGS)
+ # Native linker and preprocessor flags.  For x-fragment overrides.
+ BUILD_LDFLAGS=@BUILD_LDFLAGS@
+ BUILD_CPPFLAGS= -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
+-		-I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS)
++		-I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS_FOR_BUILD)
+ 
+ # Actual name to use when installing a native compiler.
+ GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
+diff --git a/gcc/configure b/gcc/configure
+index c7ac14b..5ac63e4 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -11521,7 +11521,7 @@ else
+ 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
+ 	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
+ 	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
+-	GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
++	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
+ 	${realsrcdir}/configure \
+ 		--enable-languages=${enable_languages-all} \
+ 		--target=$target_alias --host=$build_alias --build=$build_alias
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index 50856e6..17a4dfd 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -1633,7 +1633,7 @@ else
+ 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
+ 	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
+ 	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
+-	GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
++	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
+ 	${realsrcdir}/configure \
+ 		--enable-languages=${enable_languages-all} \
+ 		--target=$target_alias --host=$build_alias --build=$build_alias
-- 
1.9.1


