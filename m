Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BBC3E71E1A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:36:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2017 02:36:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,186,1484035200"; d="scan'208";a="1132314531"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2017 02:36:07 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Feb 2017 12:35:46 +0200
Message-Id: <20170220103551.20022-15-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170220103551.20022-1-markus.lehtonen@linux.intel.com>
References: <20170220103551.20022-1-markus.lehtonen@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 15/20] python3: remove two setup.py cross-compile hacks
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
X-List-Received-Date: Mon, 20 Feb 2017 10:36:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove two unneeded hacks. The first hack ("setup.py: no host headers
libs" patch) is not needed because we use cross-compiler (e.g.
i586-oe-linux-gcc) which has not been configured with any host system
include or library directories, and thus, we don't get any host system
directories when running "gcc -E -v".

The second hack becomes useless after the first hack has been removed
and we get the standard include and lib directories normally from gcc.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 .../python3-setup.py-no-host-headers-libs.patch    | 33 ----------------------
 .../setup.py-find-libraries-in-staging-dirs.patch  | 30 --------------------
 meta/recipes-devtools/python/python3_3.5.2.bb      |  2 --
 3 files changed, 65 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/python3-setup.py-no-host-headers-libs.patch
 delete mode 100644 meta/recipes-devtools/python/python3/setup.py-find-libraries-in-staging-dirs.patch

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
diff --git a/meta/recipes-devtools/python/python3/setup.py-find-libraries-in-staging-dirs.patch b/meta/recipes-devtools/python/python3/setup.py-find-libraries-in-staging-dirs.patch
deleted file mode 100644
index f26bd38..0000000
--- a/meta/recipes-devtools/python/python3/setup.py-find-libraries-in-staging-dirs.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Patch setup.py so that the detect_modules() function looks for required
-libraries and headers in STAGING_LIBDIR / STAGING_INCDIR.
-
-Without this patch, several extension modules are not built, even though
-their dependencies are present in the compiler's search paths.
-The result is the following warning, and ultimately incomplete packages:
-
-| The necessary bits to build these optional modules were not found:
-| _bz2                  _curses_panel         _dbm
-| _gdbm                 _lzma                 _sqlite3
-| nis                   readline              zlib
-| To find the necessary bits, look in setup.py in detect_modules() for the module's name.
-
-Upstream-Status:  Inappropriate [Cross compile specific]
-
-Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
-
-Index: Python-3.4.3/setup.py
-===================================================================
---- Python-3.4.3.orig/setup.py
-+++ Python-3.4.3/setup.py
-@@ -521,6 +521,8 @@ class PyBuildExt(build_ext):
-         else:
-             lib_dirs = self.compiler.library_dirs[:]
-             inc_dirs = self.compiler.include_dirs[:]
-+            lib_dirs.append(os.environ.get('STAGING_LIBDIR'))
-+            inc_dirs.append(os.environ.get('STAGING_INCDIR'))
-         exts = []
-         missing = []
- 
diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb b/meta/recipes-devtools/python/python3_3.5.2.bb
index 042c2b0..18d683e 100644
--- a/meta/recipes-devtools/python/python3_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3_3.5.2.bb
@@ -30,10 +30,8 @@ SRC_URI += "\
             file://unixccompiler.patch \
             file://avoid-ncursesw-include-path.patch \
             file://python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
-            file://python3-setup.py-no-host-headers-libs.patch \
             file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
             file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
-            file://setup.py-find-libraries-in-staging-dirs.patch \
             file://configure.ac-fix-LIBPL.patch \
             file://python3-fix-CVE-2016-1000110.patch \
             file://upstream-random-fixes.patch \
-- 
2.10.2


