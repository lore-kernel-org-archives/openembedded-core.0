Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32B396AC3C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 10:22:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tARAMthN009908
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 02:22:55 -0800
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 27 Nov 2015 02:22:54 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Nov 2015 18:22:52 +0800
Message-ID: <ae4cb235f053c6295def3b0c697078f1d32cb6fc.1448619641.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1448619641.git.jackie.huang@windriver.com>
References: <cover.1448619641.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python3: Fix cross compiling issue
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
X-List-Received-Date: Fri, 27 Nov 2015 10:22:55 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

If the target and host have the same type, the system
may try to execute the instructions from the target
version.  This can lead to illegal instructions
as well as the wrong copy of the code running.

This was fixed by python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
but it broke _ctypes build and then the CROSSPYTHONPATH was
set back to the default paths by the commit:
"c254807 python3-ctypes: Fix cross compilation for arm targets"

So correct the above patch and export the correct path
for CROSSPYTHONPATH, to fix both of the issues.

And remove the python3-setup.py-no-host-headers-libs.patch,
it was needed since the above inappropriate patch causes
setup.py gets data from the native _sysconfigdata and
introduce host paths, it's not needed any more with
this fix.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python3-setup.py-no-host-headers-libs.patch    | 33 ----------------------
 ...-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |  2 +-
 meta/recipes-devtools/python/python3_3.4.3.bb      |  6 ++--
 3 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/python3-setup.py-no-host-headers-libs.patch

diff --git a/meta/recipes-devtools/python/python3/python3-setup.py-no-host-headers-libs.patch b/meta/recipes-devtools/python/python3/python3-setup.py-no-host-headers-libs.patch
deleted file mode 100644
index 2bc8b8c..0000000
--- a/meta/recipes-devtools/python/python3/python3-setup.py-no-host-headers-libs.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 43238e1ac13e32984d015c92a5841f3de1fe1d15 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Tue, 18 Nov 2014 00:07:07 -0500
-Subject: [PATCH] setup.py: no host headers libs
-
-When we are cross-compiling, setup.py should never look in /usr
-or /usr/local to find headers or libraries.
-
-Upstream-Status: Inappropriate [Cross compile specific]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- setup.py | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index f020b28..e8339cd 100644
---- a/setup.py
-+++ b/setup.py
-@@ -444,10 +444,7 @@ class PyBuildExt(build_ext):
-         if not cross_compiling:
-             add_dir_to_list(self.compiler.library_dirs, os.path.join('/usr/local', sys.lib))
-             add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
--        # only change this for cross builds for 3.3, issues on Mageia
--        if cross_compiling:
-             self.add_gcc_paths()
--        if not cross_compiling:
-             self.add_multiarch_paths()
- 
-         # Add paths specified in the environment variables LDFLAGS and
--- 
-2.0.0
-
diff --git a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
index 74490d9..c0b1bd3 100644
--- a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
+++ b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
@@ -19,7 +19,7 @@ index 989baf9..2890c96 100644
  	fi
          AC_MSG_RESULT($interp)
 -	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
-+	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH) '$interp
++	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH):$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
      fi
  elif test "$cross_compiling" = maybe; then
      AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
index a33f10f..f4d4f77 100644
--- a/meta/recipes-devtools/python/python3_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.3.bb
@@ -33,7 +33,6 @@ SRC_URI += "\
             file://unixccompiler.patch \
             file://avoid-ncursesw-include-path.patch \
             file://python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
-            file://python3-setup.py-no-host-headers-libs.patch \
             file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
             file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
             file://setup.py-find-libraries-in-staging-dirs.patch \
@@ -59,15 +58,14 @@ CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
 
 TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
 EXTRA_OEMAKE += "CROSS_COMPILE=yes"
-EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip"
+EXTRA_OECONF += "--without-ensurepip"
 
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 export _PYTHON_PROJECT_BASE = "${B}"
 export _PYTHON_PROJECT_SRC = "${S}"
 export CCSHARED = "-fPIC"
 
-# Fix ctypes cross compilation
-export CROSSPYTHONPATH = "${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"
+export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"
 
 # No ctypes option for python 3
 PYTHONLSBOPTS = ""
-- 
1.9.1


