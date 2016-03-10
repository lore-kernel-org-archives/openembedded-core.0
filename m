Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E88E6FFEA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 07:23:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2A7NVeS005876
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Mar 2016 23:23:31 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 23:23:30 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Mar 2016 02:23:07 -0500
Message-ID: <91e6fea08c99f1456a04cb8da9b05abed08329fe.1457593651.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1457593651.git.hongxu.jia@windriver.com>
References: <cover.1457593651.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/18] python2/3: fix buildpath QA issue
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
X-List-Received-Date: Thu, 10 Mar 2016 07:23:33 -0000
Content-Type: text/plain

- use relative path to compile source file

- Remove build paths in target file

- Since _sysconfigdata.py was modified at do_package,
  so update _sysconfigdata.pyc manually (Python2 only).

[YOCTO #8446]
[YOCTO #9169]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../use-relative-path-to-compile-source-file.patch | 31 ++++++++++++++++++++++
 .../use-relative-path-to-compile-source-file.patch | 31 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.1.bb      | 21 ++++++++++++---
 meta/recipes-devtools/python/python_2.7.11.bb      | 28 +++++++++++++++----
 4 files changed, 102 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/use-relative-path-to-compile-source-file.patch
 create mode 100644 meta/recipes-devtools/python/python3/use-relative-path-to-compile-source-file.patch

diff --git a/meta/recipes-devtools/python/python/use-relative-path-to-compile-source-file.patch b/meta/recipes-devtools/python/python/use-relative-path-to-compile-source-file.patch
new file mode 100644
index 0000000..d68ca0c
--- /dev/null
+++ b/meta/recipes-devtools/python/python/use-relative-path-to-compile-source-file.patch
@@ -0,0 +1,31 @@
+From 048a7fef98cb4b8323c0b144c0cc1cdff91c603c Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 23 Feb 2016 21:14:45 -0500
+Subject: [PATCH] use relative path to compile source file
+
+Use relative path rather than absolute path to compile source file.
+This could avoid build path issues.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Lib/distutils/ccompiler.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Lib/distutils/ccompiler.py b/Lib/distutils/ccompiler.py
+index 82fd7d5..eb86158 100644
+--- a/Lib/distutils/ccompiler.py
++++ b/Lib/distutils/ccompiler.py
+@@ -342,7 +342,7 @@ class CCompiler:
+ 
+         build = {}
+         for i in range(len(sources)):
+-            src = sources[i]
++            src = os.path.relpath(sources[i], '.')
+             obj = objects[i]
+             ext = os.path.splitext(src)[1]
+             self.mkpath(os.path.dirname(obj))
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/python/python3/use-relative-path-to-compile-source-file.patch b/meta/recipes-devtools/python/python3/use-relative-path-to-compile-source-file.patch
new file mode 100644
index 0000000..d68ca0c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/use-relative-path-to-compile-source-file.patch
@@ -0,0 +1,31 @@
+From 048a7fef98cb4b8323c0b144c0cc1cdff91c603c Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 23 Feb 2016 21:14:45 -0500
+Subject: [PATCH] use relative path to compile source file
+
+Use relative path rather than absolute path to compile source file.
+This could avoid build path issues.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Lib/distutils/ccompiler.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Lib/distutils/ccompiler.py b/Lib/distutils/ccompiler.py
+index 82fd7d5..eb86158 100644
+--- a/Lib/distutils/ccompiler.py
++++ b/Lib/distutils/ccompiler.py
+@@ -342,7 +342,7 @@ class CCompiler:
+ 
+         build = {}
+         for i in range(len(sources)):
+-            src = sources[i]
++            src = os.path.relpath(sources[i], '.')
+             obj = objects[i]
+             ext = os.path.splitext(src)[1]
+             self.mkpath(os.path.dirname(obj))
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/python/python3_3.5.1.bb b/meta/recipes-devtools/python/python3_3.5.1.bb
index 11f959b..e7e654d 100644
--- a/meta/recipes-devtools/python/python3_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3_3.5.1.bb
@@ -37,6 +37,7 @@ SRC_URI += "\
             file://setup.py-find-libraries-in-staging-dirs.patch \
             file://use_packed_importlib.patch \
             file://configure.ac-fix-LIBPL.patch \
+            file://use-relative-path-to-compile-source-file.patch \
            "
 SRC_URI[md5sum] = "e9ea6f2623fffcdd871b7b19113fde80"
 SRC_URI[sha256sum] = "c6d57c0c366d9060ab6c0cdf889ebf3d92711d466cc0119c441dbf2746f725c9"
@@ -185,12 +186,24 @@ PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
 py_package_preprocess () {
 	# copy back the old Makefile to fix target package
 	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
-	# Remove references to buildmachine paths in target Makefile and _sysconfigdata
-	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
-		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
-		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
 }
 
+# Remove references to buildmachine paths in target
+inherit fix_buildpaths
+PACKAGE_BUILDPATH_TEXT_FILES ?= " \
+    ${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
+    ${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}/Makefile \
+    ${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py \
+    ${bindir}/python${PYTHON_BINABI}-config \
+"
+PACKAGE_BUILDPATH_TEXT_PATTERNS += " \
+    -e 's:--with-libtool-sysroot=${STAGING_DIR_TARGET}::g' \
+    -e 's:${STAGING_DIR}/${MACHINE}${datadir}/pkgconfig:${datadir}/pkgconfig:g' \
+    -e 's:${STAGING_DIR_HOST}::g' \
+    -e 's:${STAGING_DIR_NATIVE}::g' \
+    -e 's:${WORKDIR}::g' \
+"
+
 require python-${PYTHON_MAJMIN}-manifest.inc
 
 # manual dependency additions
diff --git a/meta/recipes-devtools/python/python_2.7.11.bb b/meta/recipes-devtools/python/python_2.7.11.bb
index 0c00d6e..69bcba7 100644
--- a/meta/recipes-devtools/python/python_2.7.11.bb
+++ b/meta/recipes-devtools/python/python_2.7.11.bb
@@ -27,6 +27,7 @@ SRC_URI += "\
   file://use_sysroot_ncurses_instead_of_host.patch \
   file://avoid_parallel_make_races_on_pgen.patch \
   file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
+  file://use-relative-path-to-compile-source-file.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
@@ -128,15 +129,32 @@ do_install_append_class-nativesdk () {
 
 SSTATE_SCAN_FILES += "Makefile"
 PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
-
 py_package_preprocess () {
 	# copy back the old Makefile to fix target package
 	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+}
+
+# Remove references to buildmachine paths in target
+inherit fix_buildpaths
+PACKAGE_BUILDPATH_TEXT_FILES ?= " \
+    ${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
+    ${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py \
+    ${PTEST_PATH}/Makefile \
+"
+PACKAGE_BUILDPATH_TEXT_PATTERNS += " \
+    -e 's:--with-libtool-sysroot=${STAGING_DIR_TARGET}::g' \
+    -e 's:${STAGING_DIR}/${MACHINE}${datadir}/pkgconfig:${datadir}/pkgconfig:g' \
+    -e 's:${STAGING_DIR_HOST}::g' \
+    -e 's:${STAGING_DIR_NATIVE}::g' \
+    -e 's:${WORKDIR}::g' \
+"
 
-	# Remove references to buildmachine paths in target Makefile and _sysconfigdata
-	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
-		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
-		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
+PACKAGE_PREPROCESS_FUNCS += "update_pyc_package_preprocess"
+python update_pyc_package_preprocess () {
+    # Update _sysconfigdata.pyc
+    root_path = d.expand("${PKGD}")
+    byte_code = d.expand("${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.pyc")
+    remove_buildpath_bytecode(root_path, byte_code)
 }
 
 require python-${PYTHON_MAJMIN}-manifest.inc
-- 
1.9.1


