Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63F6F7F847
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 06:04:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00663vtG017477
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Jan 2020 22:04:07 -0800
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 5 Jan 2020 22:03:46 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jan 2020 14:03:16 +0800
Message-ID: <1578290597-8588-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
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
X-List-Received-Date: Mon, 06 Jan 2020 06:04:16 -0000
Content-Type: text/plain

Fix the installation path of libpython3.7m.a on mulitlib lib64
platform to lib64 instead of lib.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../python3/0001-configure.ac-fix-LIBPL.patch      | 34 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.6.bb      |  5 ++--
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.patch

diff --git a/meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.patch b/meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.patch
new file mode 100644
index 0000000..8ac5e3b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-configure.ac-fix-LIBPL.patch
@@ -0,0 +1,34 @@
+From ceff92e449134282ff7c73cd76575b316b1d76fa Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Tue, 24 Dec 2019 17:00:48 +0800
+Subject: [PATCH] configure.ac: fix LIBPL
+
+Use LIBDIR rather than prefix/lib, so that it would work when lib64.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1862245..1acd944 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4562,9 +4562,9 @@ AC_MSG_RESULT($LDVERSION)
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
+1.9.1
+
diff --git a/meta/recipes-devtools/python/python3_3.7.6.bb b/meta/recipes-devtools/python/python3_3.7.6.bb
index af201d7..ae2f105 100644
--- a/meta/recipes-devtools/python/python3_3.7.6.bb
+++ b/meta/recipes-devtools/python/python3_3.7.6.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
            file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
+           file://0001-configure.ac-fix-LIBPL.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -175,7 +176,7 @@ py_package_preprocess () {
                 -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
                 -e 's:${RECIPE_SYSROOT}::g' \
                 -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-                ${PKGD}/${prefix}/lib/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile \
+                ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile \
                 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py \
                 ${PKGD}/${bindir}/python${PYTHON_BINABI}-config
 
@@ -322,7 +323,7 @@ RPROVIDES_${PN}-venv += "python3-pyvenv"
 # package libpython3
 PACKAGES =+ "libpython3 libpython3-staticdev"
 FILES_libpython3 = "${libdir}/libpython*.so.*"
-FILES_libpython3-staticdev += "${prefix}/lib/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-*/libpython${PYTHON_BINABI}.a"
+FILES_libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-*/libpython${PYTHON_BINABI}.a"
 INSANE_SKIP_${PN}-dev += "dev-elf"
 
 # catch all the rest (unsorted)
-- 
1.9.1


