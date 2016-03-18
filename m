Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E29D6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 09:02:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2I92SMl015090
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Mar 2016 02:02:28 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 18 Mar 2016 02:02:27 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<raj.khem@gmail.com>
Date: Fri, 18 Mar 2016 05:01:51 -0400
Message-ID: <3c4c20f10c15a3f49d45c360ec986cd942eb6c2a.1458282563.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458282563.git.hongxu.jia@windriver.com>
References: <cover.1458282563.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/18] python2/3: fix buildpath QA issue
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
X-List-Received-Date: Fri, 18 Mar 2016 09:02:29 -0000
Content-Type: text/plain

- Remove build paths in target file

- Since _sysconfigdata.py was modified at do_package,
  so update _sysconfigdata.pyc manually (Python2 only).

[YOCTO #8446]
[YOCTO #9169]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/python/python3_3.5.1.bb | 20 ++++++++++++++++----
 meta/recipes-devtools/python/python_2.7.11.bb | 27 ++++++++++++++++++++++-----
 2 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.1.bb b/meta/recipes-devtools/python/python3_3.5.1.bb
index 2fbb3cb..bfcea85 100644
--- a/meta/recipes-devtools/python/python3_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3_3.5.1.bb
@@ -186,12 +186,24 @@ PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
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
index 0c00d6e..1019e29 100644
--- a/meta/recipes-devtools/python/python_2.7.11.bb
+++ b/meta/recipes-devtools/python/python_2.7.11.bb
@@ -128,15 +128,32 @@ do_install_append_class-nativesdk () {
 
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


