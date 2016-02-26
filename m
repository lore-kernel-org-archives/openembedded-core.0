Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E0AEF77353
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 01:45:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1Q1jAqQ028068
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 25 Feb 2016 17:45:11 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Feb 2016 17:45:10 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <alejandro.hernandez@linux.intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 25 Feb 2016 20:44:55 -0500
Message-ID: <77d245fbb18c34299a5804ef3f34278506218f0b.1456449257.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456449257.git.hongxu.jia@windriver.com>
References: <cover.1456449257.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/15] python2/3: fix buildpath QA issue
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
X-List-Received-Date: Fri, 26 Feb 2016 01:45:14 -0000
Content-Type: text/plain

- use relative path to compile source file

- Since _sysconfigdata.py was modified at do_package,
  so remove _sysconfigdata.pyc is ok (Python2 only).

- Add _sysconfigdata.py and Makefile it to QA_BUILDPATHS_SKIP_PATTERN.

- Remove -fdebug-prefix-map in _sysconfigdata.py, Makefile and
  python3.5m-config (Python3 only).

[YOCTO #8446]
[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../use-relative-path-to-compile-source-file.patch | 31 ++++++++++++++++++++++
 .../use-relative-path-to-compile-source-file.patch | 31 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.1.bb      | 10 ++++++-
 meta/recipes-devtools/python/python_2.7.11.bb      |  8 ++++++
 4 files changed, 79 insertions(+), 1 deletion(-)
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
index 11f959b..58370f1 100644
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
@@ -179,6 +180,7 @@ do_install_append_class-nativesdk () {
 	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo'
 }
 
+QA_BUILDPATHS_SKIP_PATTERN ?= "Makefile _sysconfigdata.py"
 SSTATE_SCAN_FILES += "Makefile"
 PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
 
@@ -187,8 +189,14 @@ py_package_preprocess () {
 	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
 	# Remove references to buildmachine paths in target Makefile and _sysconfigdata
 	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
+		-e 's:-fdebug-prefix-map=${B}=/usr/src/${BPN}::g' \
+		-e 's:-fdebug-prefix-map=${S}=/usr/src/${BPN}::g' \
+		-e 's:-fdebug-prefix-map=${STAGING_DIR_NATIVE}=::g' \
+		-e 's:-fdebug-prefix-map=${STAGING_DIR_HOST}=::g' \
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
-		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
+		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py \
+		${PKGD}/${bindir}/python${PYTHON_BINABI}-config
+
 }
 
 require python-${PYTHON_MAJMIN}-manifest.inc
diff --git a/meta/recipes-devtools/python/python_2.7.11.bb b/meta/recipes-devtools/python/python_2.7.11.bb
index 0c00d6e..3b7c9ec 100644
--- a/meta/recipes-devtools/python/python_2.7.11.bb
+++ b/meta/recipes-devtools/python/python_2.7.11.bb
@@ -27,6 +27,7 @@ SRC_URI += "\
   file://use_sysroot_ncurses_instead_of_host.patch \
   file://avoid_parallel_make_races_on_pgen.patch \
   file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
+  file://use-relative-path-to-compile-source-file.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
@@ -126,6 +127,7 @@ do_install_append_class-nativesdk () {
 	create_wrapper ${D}${bindir}/python2.7 PYTHONHOME='${prefix}' TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo'
 }
 
+QA_BUILDPATHS_SKIP_PATTERN ?= "Makefile _sysconfigdata.py"
 SSTATE_SCAN_FILES += "Makefile"
 PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
 
@@ -135,8 +137,14 @@ py_package_preprocess () {
 
 	# Remove references to buildmachine paths in target Makefile and _sysconfigdata
 	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
+		-e 's:-fdebug-prefix-map=${B}=/usr/src/${BPN}::g' \
+		-e 's:-fdebug-prefix-map=${S}=/usr/src/${BPN}::g' \
+		-e 's:-fdebug-prefix-map=${STAGING_DIR_NATIVE}=::g' \
+		-e 's:-fdebug-prefix-map=${STAGING_DIR_HOST}=::g' \
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
+
+	rm -f ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.pyc
 }
 
 require python-${PYTHON_MAJMIN}-manifest.inc
-- 
1.9.1


