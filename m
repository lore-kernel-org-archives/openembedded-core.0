Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 807F965D4F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 08:35:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAI8ZZWF004063
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 00:35:36 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 18 Nov 2014 00:35:35 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Nov 2014 03:35:33 -0500
Message-ID: <1416299733-20175-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] python3: several fixes for cross compiling
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
X-List-Received-Date: Tue, 18 Nov 2014 08:35:44 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Add a patch to use CROSSPYTHONPATH as PYTHONPATH for
  PYTHON_FOR_BUILD, otherwise CROSSPYTHONPATH is never used,
  and it use the path in target builds to find libraries.

* Add a patch to avoid finding host headers and libs

* Fix a typo: s/python-native3/python3-native/

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python3-setup.py-no-host-headers-libs.patch    |   33 ++++++++++++++++++++
 ...-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |   28 +++++++++++++++++
 meta/recipes-devtools/python/python3_3.3.3.bb      |   17 +++++-----
 3 files changed, 70 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/python3-setup.py-no-host-headers-libs.patch
 create mode 100644 meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch

diff --git a/meta/recipes-devtools/python/python3/python3-setup.py-no-host-headers-libs.patch b/meta/recipes-devtools/python/python3/python3-setup.py-no-host-headers-libs.patch
new file mode 100644
index 0000000..2bc8b8c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/python3-setup.py-no-host-headers-libs.patch
@@ -0,0 +1,33 @@
+From 43238e1ac13e32984d015c92a5841f3de1fe1d15 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Tue, 18 Nov 2014 00:07:07 -0500
+Subject: [PATCH] setup.py: no host headers libs
+
+When we are cross-compiling, setup.py should never look in /usr
+or /usr/local to find headers or libraries.
+
+Upstream-Status: Inappropriate [Cross compile specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ setup.py | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index f020b28..e8339cd 100644
+--- a/setup.py
++++ b/setup.py
+@@ -444,10 +444,7 @@ class PyBuildExt(build_ext):
+         if not cross_compiling:
+             add_dir_to_list(self.compiler.library_dirs, os.path.join('/usr/local', sys.lib))
+             add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+-        # only change this for cross builds for 3.3, issues on Mageia
+-        if cross_compiling:
+             self.add_gcc_paths()
+-        if not cross_compiling:
+             self.add_multiarch_paths()
+ 
+         # Add paths specified in the environment variables LDFLAGS and
+-- 
+2.0.0
+
diff --git a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
new file mode 100644
index 0000000..74490d9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
@@ -0,0 +1,28 @@
+From 53ed216d7bf70dd2a925432b6805a701e5fc3e0e Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Mon, 17 Nov 2014 06:44:47 +0000
+Subject: [PATCH] python3 use CROSSPYTHONPATH for PYTHON_FOR_BUILD
+
+Upstream-Status: Inappropriate [Cross compile specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 989baf9..2890c96 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -67,7 +67,7 @@ if test "$cross_compiling" = yes; then
+ 	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
+ 	fi
+         AC_MSG_RESULT($interp)
+-	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
++	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH) '$interp
+     fi
+ elif test "$cross_compiling" = maybe; then
+     AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
+-- 
+2.0.1
+
diff --git a/meta/recipes-devtools/python/python3_3.3.3.bb b/meta/recipes-devtools/python/python3_3.3.3.bb
index 4497e02..2c1f63f 100644
--- a/meta/recipes-devtools/python/python3_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3_3.3.3.bb
@@ -37,6 +37,8 @@ SRC_URI += "\
             file://sysroot-include-headers.patch \
             file://unixccompiler.patch \
             file://avoid-ncursesw-include-path.patch \
+            file://python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
+            file://python3-setup.py-no-host-headers-libs.patch \
            "
 SRC_URI[md5sum] = "f3ebe34d4d8695bf889279b54673e10c"
 SRC_URI[sha256sum] = "e526e9b612f623888364d30cc9f3dfc34dcef39065c713bdbcddf47df84d8dcb"
@@ -62,6 +64,7 @@ TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
 TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
 TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
 EXTRA_OEMAKE += "CROSS_COMPILE=yes"
+EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"
 
 # No ctypes option for python 3
 PYTHONLSBOPTS = ""
@@ -116,8 +119,8 @@ do_compile() {
 		ARCH=${TARGET_ARCH} \
 		OPT="${CFLAGS}" libpython3.so
 
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native3/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native3/python3 \
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
@@ -139,9 +142,8 @@ do_install() {
 
 	# rerun the build once again with original makefile this time
 	# run install in a separate step to avoid compile/install race
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native3/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native3/python3 \
-		CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
@@ -150,9 +152,8 @@ do_install() {
 		ARCH=${TARGET_ARCH} \
 		DESTDIR=${D} LIBDIR=${libdir}
 	
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native3/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native3/python3 \
-		CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-- 
1.7.9.5


