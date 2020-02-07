Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F91860697
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 06:07:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 01767l4C026241
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Feb 2020 22:07:47 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 6 Feb 2020 22:07:45 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Feb 2020 14:07:43 +0800
Message-ID: <1581055664-311654-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] python3: fix the installation path of libpython3.7m.a for multilib
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
X-List-Received-Date: Fri, 07 Feb 2020 06:07:46 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Fix the installation path of libpython3.7m.a on mulitlib lib64
platform to lib64 instead of lib

Signed-off-by: Li Zhou <li.zhou@windriver.com>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../python3/0001-configure.ac-fix-LIBPL.patch      | 35 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.1.bb      |  5 ++--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.patch

diff --git a/meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.patch b/meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.patch
new file mode 100644
index 0000000..123ce3a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.patch
@@ -0,0 +1,35 @@
+From acce3d441e7eadadd2d3ce38654155dc43f1f607 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 7 Feb 2020 09:36:25 +0800
+Subject: [PATCH] configure.ac: fix LIBPL
+
+Use LIBDIR rather than prefix/lib, so that it would work when lib64.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Li Zhou <li.zhou@windriver.c>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ce04258..915f475 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4532,9 +4532,9 @@ fi
+ dnl define LIBPL after ABIFLAGS and LDVERSION is defined.
+ AC_SUBST(PY_ENABLE_SHARED)
+ if test x$PLATFORM_TRIPLET = x; then
+-  LIBPL='$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}"
++  LIBPL='$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}"
+ else
+-  LIBPL='$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}-${PLATFORM_TRIPLET}"
++  LIBPL='$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}-${PLATFORM_TRIPLET}"
+ fi
+ AC_SUBST(LIBPL)
+
+--
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python3_3.8.1.bb b/meta/recipes-devtools/python/python3_3.8.1.bb
index a71c207..981b52e 100644
--- a/meta/recipes-devtools/python/python3_3.8.1.bb
+++ b/meta/recipes-devtools/python/python3_3.8.1.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
            file://0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
+           file://0001-configure.ac-fix-LIBPL.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -174,7 +175,7 @@ py_package_preprocess () {
                 -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
                 -e 's:${RECIPE_SYSROOT}::g' \
                 -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-                ${PKGD}/${prefix}/lib/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile \
+                ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile \
                 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py \
                 ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
 
@@ -322,7 +323,7 @@ RPROVIDES_${PN}-venv += "python3-pyvenv"
 # package libpython3
 PACKAGES =+ "libpython3 libpython3-staticdev"
 FILES_libpython3 = "${libdir}/libpython*.so.*"
-FILES_libpython3-staticdev += "${prefix}/lib/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}-*/libpython${PYTHON_MAJMIN}.a"
+FILES_libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}-*/libpython${PYTHON_MAJMIN}.a"
 INSANE_SKIP_${PN}-dev += "dev-elf"
 
 # catch all the rest (unsorted)
-- 
2.7.4


