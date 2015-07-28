Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by mail.openembedded.org (Postfix) with ESMTP id 84C4A763DA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 15:04:46 +0000 (UTC)
Received: from dastp.fritz.box ([79.253.156.126]) by mail.gmx.com (mrgmx002)
	with ESMTPSA (Nemesis) id 0MZTbR-1Zcag31diH-00LCMv;
	Tue, 28 Jul 2015 16:59:30 +0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jul 2015 16:58:35 +0200
Message-Id: <1438095518-7513-2-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.4.6
In-Reply-To: <1438095518-7513-1-git-send-email-dominic.sacre@gmx.de>
References: <1438095518-7513-1-git-send-email-dominic.sacre@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K0:tj5he2sOVnRrcF1RuAP9EmPZtI8JmmnUKD3jviKQ6xDZpyPFDy5
	7y4Sb7KnYQGEE9iKnkK8La+AjHpoeioNn1C+Us39EIIWLZDGsqzoDHvoGTjB5cPH1K4Om9I
	JWbWqrjT7LlctqcORk8T814Y8vtqpjZdQa1tQ6yunDB4FYZ/0fXkeRszI1L+pFWTAwhzyIV
	6Bt/ZRf99jC7oDpk8uxpw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ii8z1SsAL6A=:qdMHfp5Lt6sfgSCSHD236d
	UfdK8Wzb7PzROwyOxOmVk/Z4FTvC8FjgmFzRrf7y6G3PBye67yK9yNXPHi5N9iVevq2wCLvPI
	L2gqFmLc7cVGrtaVi7bI6bv67mz0Q12abtbSmRQEVS0+jIoYazpx6Lzm0g5s64Kva7y4WPm9s
	C8xksHkpK1siRHVZvVSKLY1M78Gs4tVpWuiWiQgxfOpcptmaVjkPUg+A6IRNTNJW81vpIi5E+
	5SzXG6Qzjf8iTI0hvB5WkKDZVbcaeigk0EMJ7yA3a6yw2/teDdA39hpvvJlGIvtPwj+gbpDOr
	2JCYdWU6PyotKmYHe6Yak/2Wcrjf70ZWPFYVzvgX7lVEEVvwbNSRTHxfJPa1kj69vBGFXcFcM
	HiNHxskfvXpoOAMoz2gFvJY7wjgDyquosxpa7LUFqiMTA6VLg9Rj6a1ST6oElHp9YlWFNo4YZ
	X+fVviyXp1Ki0lLI7+KwMOoUy6hvaIMcVzzhsIJaoVxgs3dM6v4JeU5EthVf53wkRnY/67KlA
	GBThxoUhosZKSFpj84rGyWlfOGG46s8m4u7ioIIR3cKe7kaJ0mcDBTiU5yx5TGUnH8p71o9lj
	7VCKB779fKG3Dzhj+po9GzwxtM1urDioef5dV2xItqjaqgY3kpZELCPTjjpOHntNsuOUH638Q
	uBDU5c2T0h9e1sUTcGDg7vrsUfJUOCkIEVKaVxG+XYSFvfeu7m1i+vg79wpF2bUl7b4U=
Subject: [PATCH 1/4] python3: detect libraries in STAGING_LIBDIR
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
X-List-Received-Date: Tue, 28 Jul 2015 15:04:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch setup.py so that the detect_modules() function looks for required
libraries and headers in STAGING_LIBDIR / STAGING_INCDIR.

Without this patch, several extension modules are not built, even though
their dependencies are present in the compiler's search paths.
The result is the following warning, and ultimately incomplete packages:

| The necessary bits to build these optional modules were not found:
| _bz2                  _curses_panel         _dbm
| _gdbm                 _lzma                 _sqlite3
| nis                   readline              zlib
| To find the necessary bits, look in setup.py in detect_modules() for the module's name.

With the Python 3.3 version of the recipe, at least some of these modules
were built, because STAGING_LIBDIR happened to be in the search path
by coincidence. Due to changes to distutils in Python 3.4, this is no
longer the case.

A previous patch that only affects the search paths for SSL is dropped, as
this one is a more complete fix for [YOCTO #7768].

Part of the fix for [YOCTO #8048].

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 .../python/python3/fix_ssl_include_dir.patch       | 41 ----------------------
 .../setup.py-find-libraries-in-staging-dirs.patch  | 30 ++++++++++++++++
 meta/recipes-devtools/python/python3_3.4.3.bb      |  2 +-
 3 files changed, 31 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/fix_ssl_include_dir.patch
 create mode 100644 meta/recipes-devtools/python/python3/setup.py-find-libraries-in-staging-dirs.patch

diff --git a/meta/recipes-devtools/python/python3/fix_ssl_include_dir.patch b/meta/recipes-devtools/python/python3/fix_ssl_include_dir.patch
deleted file mode 100644
index 9972829..0000000
--- a/meta/recipes-devtools/python/python3/fix_ssl_include_dir.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status:  Inappropriate [Embedded Specific]
-
-Python 3 fails to compile the ssl module, later, when requesting to install packages that should include such modules
-no error is shown; but a running python shell trying to import the ssl library results in an import error, 
-since it was never installed.
-
-This looks for the modules in the correct directories so they are corretcly compiled and installed along with python3.
-
-ImportError: No module named _ssl
-
-Signed-Off-By: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
-
-Index: Python-3.4.3/setup.py
-===================================================================
---- Python-3.4.3.orig/setup.py
-+++ Python-3.4.3/setup.py
-@@ -726,10 +726,9 @@ class PyBuildExt(build_ext):
-         exts.append( Extension('_socket', ['socketmodule.c'],
-                                depends = ['socketmodule.h']) )
-         # Detect SSL support for the socket module (via _ssl)
--        search_for_ssl_incs_in = [
--                              '/usr/local/ssl/include',
--                              '/usr/contrib/ssl/include/'
--                             ]
-+        search_for_ssl_incs_in = []
-+        for dir in [os.getenv("STAGING_INCDIR")]:
-+                search_for_ssl_incs_in.append(dir)
-         ssl_incs = find_file('openssl/ssl.h', inc_dirs,
-                              search_for_ssl_incs_in
-                              )
-@@ -739,9 +738,7 @@ class PyBuildExt(build_ext):
-             if krb5_h:
-                 ssl_incs += krb5_h
-         ssl_libs = find_library_file(self.compiler, 'ssl',lib_dirs,
--                                     ['/usr/local/ssl/lib',
--                                      '/usr/contrib/ssl/lib/'
--                                     ] )
-+                                     [os.getenv("STAGING_LIBDIR")])
- 
-         if (ssl_incs is not None and
-             ssl_libs is not None):
diff --git a/meta/recipes-devtools/python/python3/setup.py-find-libraries-in-staging-dirs.patch b/meta/recipes-devtools/python/python3/setup.py-find-libraries-in-staging-dirs.patch
new file mode 100644
index 0000000..f26bd38
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/setup.py-find-libraries-in-staging-dirs.patch
@@ -0,0 +1,30 @@
+Patch setup.py so that the detect_modules() function looks for required
+libraries and headers in STAGING_LIBDIR / STAGING_INCDIR.
+
+Without this patch, several extension modules are not built, even though
+their dependencies are present in the compiler's search paths.
+The result is the following warning, and ultimately incomplete packages:
+
+| The necessary bits to build these optional modules were not found:
+| _bz2                  _curses_panel         _dbm
+| _gdbm                 _lzma                 _sqlite3
+| nis                   readline              zlib
+| To find the necessary bits, look in setup.py in detect_modules() for the module's name.
+
+Upstream-Status:  Inappropriate [Cross compile specific]
+
+Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
+
+Index: Python-3.4.3/setup.py
+===================================================================
+--- Python-3.4.3.orig/setup.py
++++ Python-3.4.3/setup.py
+@@ -521,6 +521,8 @@ class PyBuildExt(build_ext):
+         else:
+             lib_dirs = self.compiler.library_dirs[:]
+             inc_dirs = self.compiler.include_dirs[:]
++            lib_dirs.append(os.environ.get('STAGING_LIBDIR'))
++            inc_dirs.append(os.environ.get('STAGING_INCDIR'))
+         exts = []
+         missing = []
+ 
diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
index dce778a..e2d9f79 100644
--- a/meta/recipes-devtools/python/python3_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.3.bb
@@ -36,7 +36,7 @@ SRC_URI += "\
             file://python3-setup.py-no-host-headers-libs.patch \
             file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
             file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
-            file://fix_ssl_include_dir.patch \
+            file://setup.py-find-libraries-in-staging-dirs.patch \
            "
 SRC_URI[md5sum] = "7d092d1bba6e17f0d9bd21b49e441dd5"
 SRC_URI[sha256sum] = "b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d399ec06b043ea996b8"
-- 
2.4.6


