Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id ADAEE78916
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 17:24:08 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id b130so7148569qkg.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 09:24:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/UTT2jkpRUj1gzMW2q2P8ncf9egR7PvWUCNV9cSlXY8=;
	b=Qd6kGMXTW4URA+4N5A2jaB6L8qHQSkWUiirFs/Ah3vYn6F8QJiGmFUCydceQ2R4N6j
	zpCzMcL5nYARSuBFMX0ElV183e8OhCVq8oII8+b3k8S3GXNe+5qIvTA6JQ4EzPDb5sJ+
	9VEsuzI13HI2/q9QRLiexg+/s8t28WRt3h+dReQXouA6K+BGdxlU1iwtjByJNw+0OWYD
	cO0j2+/4Sz9x/4EBu0gI8P6KU6gvOYRNYhTuMnCYWoq/rQ2YfBmSpABbepulyrA60bIJ
	+lq7PvrlKDTAEEqdc2XR+1B90ljsthDV2TsP6qS+nbBQlmsz2zf4tTDYwAxiIUQXrG/G
	D31w==
X-Gm-Message-State: AElRT7HEL5bf6oNZ2P8GbbEK426vy7zX1T+3XlLdxB/oU2GYHaH7RzGZ
	FTby2xpdsSZjhf/OqJXVV6dgCp+l
X-Google-Smtp-Source: AG47ELsGMqykSnNyV0SupHL5O9+Cb5u/RWtKJeBWOXpzlfkI44oP0kswAP0nRN/qT7z4OhUyikRSyQ==
X-Received: by 10.55.196.2 with SMTP id d2mr115965qki.223.1520702649040;
	Sat, 10 Mar 2018 09:24:09 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	f54sm2472923qta.87.2018.03.10.09.24.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 10 Mar 2018 09:24:08 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Mar 2018 12:23:25 -0500
Message-Id: <1520702605-14330-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python-numpy: reorganize numpy recipes to use a common .inc file to reduce duplication
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
X-List-Received-Date: Sat, 10 Mar 2018 17:24:08 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python-numpy/python-numpy.inc | 109 ++++++++++++++++++++
 .../python-numpy/python-numpy_1.14.1.bb            | 113 +--------------------
 .../python-numpy/python3-numpy_1.14.1.bb           | 112 +-------------------
 3 files changed, 113 insertions(+), 221 deletions(-)
 create mode 100644 meta/recipes-devtools/python-numpy/python-numpy.inc

diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
new file mode 100644
index 0000000..10af4c5
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -0,0 +1,109 @@
+SUMMARY = "A sophisticated Numeric Processing Package for Python"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fc53b33304171d132128ebe82ea4a645"
+
+SRCNAME = "numpy"
+
+SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
+           file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
+           file://fix_shebang_f2py.patch \
+           ${CONFIGFILESURI} "
+SRC_URI[md5sum] = "0e09f20f62ab9f8a02cb7bd3fd023482"
+SRC_URI[sha256sum] = "8708a775be9a9a457b80a49193c57bd9d51a8a195ed1f1c4b8e89eaf3aa646ee"
+
+UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
+
+CONFIGFILESURI ?= ""
+
+CONFIGFILESURI_aarch64 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_arm = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
+CONFIGFILESURI_armeb = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
+CONFIGFILESURI_mipsarcho32el = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
+CONFIGFILESURI_x86 = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
+CONFIGFILESURI_x86-64 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_mipsarcho32eb = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_powerpc = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_powerpc64 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_mipsarchn64eb = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_mipsarchn64el = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_mipsarchn32eb = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_mipsarchn32el = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+
+S = "${WORKDIR}/numpy-${PV}"
+
+# Make the build fail and replace *config.h with proper one
+# This is a ugly, ugly hack - Koen
+do_compile_prepend_class-target() {
+    ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
+    true
+    cp ${WORKDIR}/*config.h ${S}/build/$(ls ${S}/build | grep src)/numpy/core/include/numpy/
+}
+
+FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
+
+# install what is needed for numpy.test()
+RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
+                  ${PYTHON_PN}-difflib \
+                  ${PYTHON_PN}-pprint \
+                  ${PYTHON_PN}-pickle \
+                  ${PYTHON_PN}-shell \
+                  ${PYTHON_PN}-nose \
+                  ${PYTHON_PN}-doctest \
+                  ${PYTHON_PN}-datetime \
+                  ${PYTHON_PN}-distutils \
+                  ${PYTHON_PN}-misc \
+                  ${PYTHON_PN}-mmap \
+                  ${PYTHON_PN}-netclient \
+                  ${PYTHON_PN}-numbers \
+                  ${PYTHON_PN}-pydoc \
+                  ${PYTHON_PN}-pkgutil \
+                  ${PYTHON_PN}-email \
+                  ${PYTHON_PN}-compression \
+                  ${PYTHON_PN}-ctypes \
+                  ${PYTHON_PN}-threading \
+"
+
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.14.1.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.14.1.bb
index 6b5dd67..5013789 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy_1.14.1.bb
+++ b/meta/recipes-devtools/python-numpy/python-numpy_1.14.1.bb
@@ -1,113 +1,6 @@
-SUMMARY = "A sophisticated Numeric Processing Package for Python"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fc53b33304171d132128ebe82ea4a645"
-
-SRCNAME = "numpy"
-
-SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
-           file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
-           file://fix_shebang_f2py.patch \
-           ${CONFIGFILESURI} "
-
-SRC_URI[md5sum] = "0e09f20f62ab9f8a02cb7bd3fd023482"
-SRC_URI[sha256sum] = "8708a775be9a9a457b80a49193c57bd9d51a8a195ed1f1c4b8e89eaf3aa646ee"
-
-UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-
-CONFIGFILESURI ?= ""
-
-CONFIGFILESURI_aarch64 = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_arm = " \
-    file://config.h \
-    file://numpyconfig.h \
-"
-CONFIGFILESURI_armeb = " \
-    file://config.h \
-    file://numpyconfig.h \
-"
-CONFIGFILESURI_mipsarcho32el = " \
-    file://config.h \
-    file://numpyconfig.h \
-"
-CONFIGFILESURI_x86 = " \
-    file://config.h \
-    file://numpyconfig.h \
-"
-CONFIGFILESURI_x86-64 = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_mipsarcho32eb = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_powerpc = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_powerpc64 = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_mipsarchn64eb = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_mipsarchn64el = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_mipsarchn32eb = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_mipsarchn32el = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-
-S = "${WORKDIR}/numpy-${PV}"
-
 inherit setuptools
+require python-numpy.inc
 
-# Make the build fail and replace *config.h with proper one
-# This is a ugly, ugly hack - Koen
-do_compile_prepend_class-target() {
-    ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
-    true
-    cp ${WORKDIR}/*config.h ${S}/build/$(ls ${S}/build | grep src)/numpy/core/include/numpy/
-}
-
-FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
-
-# install what is needed for numpy.test()
-RDEPENDS_${PN} = "python-unittest \
-                  python-difflib \
-                  python-pprint \
-                  python-pickle \
-                  python-shell \
-                  python-nose \
-                  python-doctest \
-                  python-datetime \
-                  python-distutils \
-                  python-misc \
-                  python-mmap \
-                  python-netclient \
-                  python-numbers \
-                  python-pydoc \
-                  python-pkgutil \
-                  python-email \
-                  python-subprocess \
-                  python-compression \
-                  python-ctypes \
-                  python-threading \
+RDEPENDS_${PN}_class-target_append = " \
+    ${PYTHON_PN}-subprocess \
 "
-
-RDEPENDS_${PN}_class-native = ""
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.14.1.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.14.1.bb
index 736e0f5..915e6f8 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.14.1.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.14.1.bb
@@ -1,112 +1,2 @@
-SUMMARY = "A sophisticated Numeric Processing Package for Python"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fc53b33304171d132128ebe82ea4a645"
-
-SRCNAME = "numpy"
-
-SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
-           file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
-           file://fix_shebang_f2py.patch \
-           ${CONFIGFILESURI} \
-           "
-SRC_URI[md5sum] = "0e09f20f62ab9f8a02cb7bd3fd023482"
-SRC_URI[sha256sum] = "8708a775be9a9a457b80a49193c57bd9d51a8a195ed1f1c4b8e89eaf3aa646ee"
-
-UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-
-CONFIGFILESURI ?= ""
-
-CONFIGFILESURI_aarch64 = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_arm = " \
-    file://config.h \
-    file://numpyconfig.h \
-"
-CONFIGFILESURI_armeb = " \
-    file://config.h \
-    file://numpyconfig.h \
-"
-CONFIGFILESURI_mipsarcho32el = " \
-    file://config.h \
-    file://numpyconfig.h \
-"
-CONFIGFILESURI_x86 = " \
-    file://config.h \
-    file://numpyconfig.h \
-"
-CONFIGFILESURI_x86-64 = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_mipsarcho32eb = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_powerpc = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_powerpc64 = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_mipsarchn64eb = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_mipsarchn64el = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_mipsarchn32eb = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_mipsarchn32el = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-
-S = "${WORKDIR}/numpy-${PV}"
-
 inherit setuptools3
-
-# Make the build fail and replace *config.h with proper one
-# This is a ugly, ugly hack - Koen
-do_compile_prepend_class-target() {
-    ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build ${DISTUTILS_BUILD_ARGS} || \
-    true
-    cp ${WORKDIR}/*config.h ${S}/build/$(ls ${S}/build | grep src)/numpy/core/include/numpy/
-}
-
-FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
-
-# install what is needed for numpy.test()
-RDEPENDS_${PN} = "python3-unittest \
-                  python3-difflib \
-                  python3-pprint \
-                  python3-pickle \
-                  python3-shell \
-                  python3-nose \
-                  python3-doctest \
-                  python3-datetime \
-                  python3-distutils \
-                  python3-misc \
-                  python3-mmap \
-                  python3-netclient \
-                  python3-numbers \
-                  python3-pydoc \
-                  python3-pkgutil \
-                  python3-email \
-                  python3-compression \
-                  python3-ctypes \
-                  python3-threading \
-"
-
-RDEPENDS_${PN}_class-native = ""
-
-BBCLASSEXTEND = "native nativesdk"
+require python-numpy.inc
-- 
2.7.4


