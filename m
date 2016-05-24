Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A4EFA73177
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:54:14 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:54:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498205"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:54:16 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:54:25 +0300
Message-Id: <1e03855f9ddbd433f8ab8b6515a273cf03e8584d.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 36/45] lttng-tools: move to Python 3
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
X-List-Received-Date: Tue, 24 May 2016 11:54:14 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...d-look-for-python-3.0-when-building-pytho.patch | 30 ----------------------
 meta/recipes-kernel/lttng/lttng-tools_git.bb       |  7 +++--
 2 files changed, 3 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/Revert-Build-look-for-python-3.0-when-building-pytho.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/Revert-Build-look-for-python-3.0-when-building-pytho.patch b/meta/recipes-kernel/lttng/lttng-tools/Revert-Build-look-for-python-3.0-when-building-pytho.patch
deleted file mode 100644
index d05c04c..0000000
--- a/meta/recipes-kernel/lttng/lttng-tools/Revert-Build-look-for-python-3.0-when-building-pytho.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Fri, 4 Dec 2015 16:11:41 +0000
-Subject: [PATCH] Revert "Build: look for python >= 3.0 when building python bindings"
-Organization: O.S. Systems Software LTDA.
-
-This reverts commit 227703a2ceada3c104edd56756d48455ca4c271a.
-
-Upstream-Status: Pending
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4dee4b4..6608bcd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -339,7 +339,7 @@ AM_CONDITIONAL([PYTHON_BINDING], [test "x${enable_python_binding:-yes}" = xyes])
- 
- if test "x${enable_python_binding:-yes}" = xyes; then
-   AX_PKG_SWIG($swig_version, [], [ AC_MSG_ERROR([SWIG $swig_version or newer is needed]) ])
--  AM_PATH_PYTHON([3.0])
-+  AM_PATH_PYTHON
- 
-   AC_ARG_VAR([PYTHON_INCLUDE], [Include flags for python, bypassing python-config])
-   AC_ARG_VAR([PYTHON_CONFIG], [Path to python-config])
--- 
-2.1.4
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
index 8ef267c..da2b685 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
@@ -18,16 +18,15 @@ PV = "2.7.1+git${SRCPV}"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
                  am_cv_python_pythondir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
-                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}' \
+                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
 "
 PACKAGECONFIG ??= "lttng-ust"
-PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python swig-native"
+PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig-native"
 PACKAGECONFIG[lttng-ust] = "--enable-lttng-ust, --disable-lttng-ust, lttng-ust"
 PACKAGECONFIG[kmod] = "--enable-kmod, --disable-kmod, kmod"
 PACKAGECONFIG_remove_libc-musl = "lttng-ust"
 
 SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.7 \
-           file://Revert-Build-look-for-python-3.0-when-building-pytho.patch \
            file://stop-using-SIGUNUSED.patch \
            file://runtest-2.4.0.patch \
            file://0001-lttng-tools-filter-random-filename-of-tests-output.patch \
@@ -35,7 +34,7 @@ SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.7 \
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep ptest pkgconfig useradd python-dir
+inherit autotools-brokensep ptest pkgconfig useradd python3-dir
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "tracing"
-- 
2.8.1


