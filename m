Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E224A77121
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 08:01:45 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o80so1525801wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 01:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1bNBE82bIiyMqIxGtM2m5NmML1UQ8MYY4OZx+U7X6es=;
	b=ySvs8jzV/90mkff0nhryYzrnVcVGWeSQvhTlaBcfOtr4OIggzseSmVNp5Ml0FygzgI
	XLqaDt9HSbOq4Iw41sVbvCcG8vREvPEDNkBpr6MIoRNhiqwuYqGG3SSgAdf6SMqU5CrR
	zmBd//V0tFD5OcQn2+ZiESqoSq/RimqAvvOs8iH8iZlnMlGjdvh1j9zwBdMY5uVwrq7c
	fpfTdMGTg3Jvmr3KZyXvvC7/aGgV+IszSNGXjq4sUK2hxAnRokAnWK9x3XS+ICWkHT0t
	L1CKxGw0z0MIsgEBt4SHmwzO44cdbzOf8K6wJPwJGm0rlDrDAnosROMMUOWNOg6iabAS
	PdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1bNBE82bIiyMqIxGtM2m5NmML1UQ8MYY4OZx+U7X6es=;
	b=mgMyzG83/LC0fS2Hb7h/SqC9LmSp7e9/NNPsPiP4kzjshAk395ZacrFPLbj3fKOWBG
	Ezv9/jLEx5pz65A5Km8DawAN1AmKD8BQmT84FRBZEF94aX//sBLB83thcR9vth71jeyb
	BBnRqSi5rt3qKb5rwomsqvbYLAB6FUnfJaPtPTlWokEWkaMN0qZO4QSe24itGAKP7hRX
	lfyEc8ehabNRebJhEr2oaGLwTLTQhj4lPI+iTj9jI/r2tszoCBF2ZcSeqMkzKgqIM9vx
	9b9rIbJZM6e2uolxnWBc8VryxMsoWdwyzNy6gskLwZ35ZoOD5ekE7wxMGP5JCT02Zf+4
	VNiQ==
X-Gm-Message-State: AEkoouszlxVD7JIC1urRpSst/3wgnOgKLn/DYjAMYUhwlblxOOqaHLeMOHsuPN2mhe5TWA==
X-Received: by 10.25.143.20 with SMTP id r20mr28569486lfd.52.1470729705730;
	Tue, 09 Aug 2016 01:01:45 -0700 (PDT)
Received: from localhost.localdomain (m77-218-224-24.cust.tele2.se.
	[77.218.224.24]) by smtp.gmail.com with ESMTPSA id
	e73sm6204048lji.31.2016.08.09.01.01.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 01:01:45 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2016 10:01:41 +0200
Message-Id: <1470729701-27518-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] Use PYTHON_SITEPACKAGES_DIR insted of hard-coded *site-packages*
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
X-List-Received-Date: Tue, 09 Aug 2016 08:01:46 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

For thoese recipes that are inheriting python*-dir.bbclass, there is
already a PYTHON_SITEPACKAGES_DIR present, use that definition replacing
redundant "${libdir}/python*/site-packages".

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../bootchart2/bootchart2_0.14.8.bb                |  2 +-
 meta/recipes-devtools/python/python-setuptools.inc |  2 +-
 .../python/python-setuptools_22.0.5.bb             |  2 +-
 meta/recipes-devtools/python/python-smartpm_git.bb | 36 +++++++++++-----------
 meta/recipes-devtools/python/python3-pip_8.1.2.bb  |  8 ++---
 .../python/python3-setuptools_22.0.5.bb            |  2 +-
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            | 18 +++++------
 meta/recipes-kernel/lttng/lttng-tools_git.bb       | 10 +++---
 meta/recipes-kernel/perf/perf.bb                   |  2 +-
 9 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
index d0555c3..d039b1b 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
@@ -134,7 +134,7 @@ do_install () {
 }
 
 PACKAGES =+ "pybootchartgui"
-FILES_pybootchartgui += "${libdir}/python*/site-packages/pybootchartgui ${bindir}/pybootchartgui"
+FILES_pybootchartgui += "${PYTHON_SITEPACKAGES_DIR}/pybootchartgui ${bindir}/pybootchartgui"
 RDEPENDS_pybootchartgui = "python3-pycairo python3-compression python3-image python3-textutils python3-shell python3-compression python3-codecs"
 RDEPENDS_${PN}_class-target += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
 RDEPENDS_${PN}_class-target += "lsb"
diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 53a514b..92ca9a0 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -17,5 +17,5 @@ UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 do_install_prepend() {
-    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
 }
diff --git a/meta/recipes-devtools/python/python-setuptools_22.0.5.bb b/meta/recipes-devtools/python/python-setuptools_22.0.5.bb
index c172039..526474c 100644
--- a/meta/recipes-devtools/python/python-setuptools_22.0.5.bb
+++ b/meta/recipes-devtools/python/python-setuptools_22.0.5.bb
@@ -7,7 +7,7 @@ DEPENDS_class-native += "python-native"
 
 inherit distutils
 
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
+DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
 
 RDEPENDS_${PN} = "\
   python-stringold \
diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/recipes-devtools/python/python-smartpm_git.bb
index 81e45b7..0f0cfaa 100644
--- a/meta/recipes-devtools/python/python-smartpm_git.bb
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb
@@ -55,41 +55,41 @@ inherit distutils
 
 do_install_append() {
    # We don't support the following items
-   rm -rf ${D}${libdir}/python*/site-packages/smart/backends/slack
-   rm -rf ${D}${libdir}/python*/site-packages/smart/backends/arch
-   rm -rf ${D}${libdir}/python*/site-packages/smart/interfaces/qt
+   rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/smart/backends/slack
+   rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/smart/backends/arch
+   rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/smart/interfaces/qt
 
    # Temporary, debian support in OE is missing the python module
-   rm -f ${D}${libdir}/python*/site-packages/smart/plugins/aptchannelsync.py*
-   rm -f ${D}${libdir}/python*/site-packages/smart/plugins/debdir.py*
-   rm -rf ${D}${libdir}/python*/site-packages/smart/backends/deb
+   rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/smart/plugins/aptchannelsync.py*
+   rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/smart/plugins/debdir.py*
+   rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/smart/backends/deb
 
    # Disable automatic channel detection
-   rm -f ${D}${libdir}/python*/site-packages/smart/plugins/detectsys.py*
+   rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/smart/plugins/detectsys.py*
 
    # Disable landscape support
-   rm -f ${D}${libdir}/python*/site-packages/smart/plugins/landscape.py*
+   rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/smart/plugins/landscape.py*
 
    # Disable urpmi channel support
-   rm -f ${D}${libdir}/python*/site-packages/smart/plugins/urpmichannelsync.py*
+   rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/smart/plugins/urpmichannelsync.py*
 
    # Disable yum channel support
-   rm -f ${D}${libdir}/python*/site-packages/smart/plugins/yumchannelsync.py*
+   rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/smart/plugins/yumchannelsync.py*
 
    # Disable zypper channel support
-   rm -f ${D}${libdir}/python*/site-packages/smart/plugins/zyppchannelsync.py*
+   rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/smart/plugins/zyppchannelsync.py*
 
    if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'rpm', 'rpm', '', d)}" ]; then
-      rm -f ${D}${libdir}/python*/site-packages/smart/plugins/rpmdir.py*
-      rm -rf ${D}${libdir}/python*/site-packages/smart/backends/rpm
+      rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/smart/plugins/rpmdir.py*
+      rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/smart/backends/rpm
    fi
 
    if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'qt4', 'qt4', '', d)}" ]; then
-      rm -rf ${D}${libdir}/python*/site-packages/smart/interfaces/qt4
+      rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/smart/interfaces/qt4
    fi
 
    if [ -z "${@bb.utils.contains('PACKAGECONFIG', 'gtk+', 'gtk', '', d)}" ]; then
-      rm -rf ${D}${libdir}/python*/site-packages/smart/interfaces/gtk
+      rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/smart/interfaces/gtk
    fi
 }
 
@@ -129,10 +129,10 @@ RDEPENDS_${PN}-interface-gtk = "gtk+ ${PN}-interface-images"
 
 FILES_smartpm = "${bindir}/smart"
 
-FILES_${PN}-backend-rpm = "${libdir}/python*/site-packages/smart/backends/rpm"
+FILES_${PN}-backend-rpm = "${PYTHON_SITEPACKAGES_DIR}/smart/backends/rpm"
 
-FILES_${PN}-interface-qt4 = "${libdir}/python*/site-packages/smart/interfaces/qt4"
-FILES_${PN}-interface-gtk = "${libdir}/python*/site-packages/smart/interfaces/gtk"
+FILES_${PN}-interface-qt4 = "${PYTHON_SITEPACKAGES_DIR}/smart/interfaces/qt4"
+FILES_${PN}-interface-gtk = "${PYTHON_SITEPACKAGES_DIR}/smart/interfaces/gtk"
 FILES_${PN}-interface-images = "${datadir}/${baselib}/python*/site-packages/smart/interfaces/images"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pip_8.1.2.bb b/meta/recipes-devtools/python/python3-pip_8.1.2.bb
index e319dff..eefb4cb 100644
--- a/meta/recipes-devtools/python/python3-pip_8.1.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_8.1.2.bb
@@ -18,16 +18,16 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils3
 
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
+DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
 
 do_install_prepend() {
-    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
 }
 
 # Use setuptools site.py instead, avoid shared state issue
 do_install_append() {
-    rm ${D}/${libdir}/${PYTHON_DIR}/site-packages/site.py
-    rm ${D}/${libdir}/${PYTHON_DIR}/site-packages/__pycache__/site.cpython-*.pyc
+    rm ${D}${PYTHON_SITEPACKAGES_DIR}/site.py
+    rm ${D}${PYTHON_SITEPACKAGES_DIR}/__pycache__/site.cpython-*.pyc
 
     # Install as pip3 and leave pip2 as default
     rm ${D}/${bindir}/pip
diff --git a/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb b/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb
index fb2931c..65af6f0 100644
--- a/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb
@@ -5,7 +5,7 @@ DEPENDS_class-native += "python3-native"
 
 inherit distutils3
 
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
+DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
 
 # The installer puts the wrong path in the setuptools.pth file.  Correct it.
 do_install_append() {
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index d264d50..84adef6 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -259,7 +259,7 @@ PACKAGECONFIG[xar] = "--with-xar,--without-xar,xar,"
 
 WITH_PYTHON = " --with-python=${PYTHON_BASEVERSION} \
 		--with-python-inc-dir=${STAGING_INCDIR}/python${PYTHON_BASEVERSION} \
-		--with-python-lib-dir=${libdir}/python${PYTHON_BASEVERSION}/site-packages \
+		--with-python-lib-dir=${PYTHON_SITEPACKAGES_DIR} \
 		--without-pythonembed"
 PACKAGECONFIG[python] = "${WITH_PYTHON},--without-python,python,"
 
@@ -477,7 +477,7 @@ RDEPENDS_${PN}-build = "file bash perl"
 
 RDEPENDS_python-rpm = "${PN} python"
 
-FILES_python-rpm = "${libdir}/python*/site-packages/rpm"
+FILES_python-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm"
 PROVIDES += "python-rpm"
 
 FILES_perl-module-rpm = "${libdir}/perl/*/* \
@@ -512,7 +512,7 @@ FILES_${PN}-staticdev = " \
 		${libdir}/librpmmisc.a \
 		${libdir}/librpmbuild.a \
 		${libdir}/rpm/lib/liblua.a \
-		${libdir}/python*/site-packages/rpm/*.a \
+		${PYTHON_SITEPACKAGES_DIR}/rpm/*.a \
 		"
 
 do_configure() {
@@ -581,10 +581,10 @@ do_install_append() {
 	rm -f ${D}/${mandir}/man1/lz*.1
 	rm -f ${D}/${libdir}/pkgconfig/liblzma*
 
-	rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/*.a
-	rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/*.la
-	rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/rpm/*.a
-	rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/rpm/*.la
+	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/*.a
+	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/*.la
+	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/rpm/*.a
+	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/rpm/*.la
 
 	#find ${D}/${libdir}/perl5 -type f -a \( -name perllocal.pod -o -name .packlist \
 	#	-o \( -name '*.bs' -a -empty \) \) -exec rm -f {} ';'
@@ -647,11 +647,11 @@ EOF
 }
 
 do_install_append_class-native () {
-	sed -i -e 's|^#!.*/usr/bin/python|#! /usr/bin/env nativepython|' ${D}/${libdir}/python2.7/site-packages/rpm/transaction.py
+	sed -i -e 's|^#!.*/usr/bin/python|#! /usr/bin/env nativepython|' ${D}${PYTHON_SITEPACKAGES_DIR}/rpm/transaction.py
 }
 
 do_install_append_class-nativesdk () {
-	sed -i -e 's|^#!.*/usr/bin/python|#! /usr/bin/env python|' ${D}/${libdir}/python2.7/site-packages/rpm/transaction.py
+	sed -i -e 's|^#!.*/usr/bin/python|#! /usr/bin/env python|' ${D}${PYTHON_SITEPACKAGES_DIR}/rpm/transaction.py
 }
 
 def multilib_rpmmacros(d):
diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
index b0c369c..fe1e2a3 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
@@ -16,8 +16,8 @@ RDEPENDS_${PN}-ptest += "make perl bash"
 SRCREV = "a90f2c1e10b759782653a81815625e9d1bbb75ca"
 PV = "2.7.1+git${SRCPV}"
 
-PYTHON_OPTION = "am_cv_python_pyexecdir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
-                 am_cv_python_pythondir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
+PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
+                 am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
                  PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
 "
 PACKAGECONFIG ??= "lttng-ust"
@@ -39,9 +39,9 @@ USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "tracing"
 
 FILES_${PN} += "${libdir}/lttng/libexec/* ${datadir}/xml/lttng \
-                ${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
-FILES_${PN}-staticdev += "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a"
-FILES_${PN}-dev += "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.la"
+                ${PYTHON_SITEPACKAGES_DIR}/*"
+FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
+FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
 
 # Since files are installed into ${libdir}/lttng/libexec we match 
 # the libexec insane test so skip it.
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 1e84a22..d485548 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -217,7 +217,7 @@ RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
 FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent"
 FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
 FILES_${PN}-tests = "${libdir}/perf/perf-core/tests ${libexecdir}/perf-core/tests"
-FILES_${PN}-python = "${libdir}/python*/site-packages ${libdir}/perf/perf-core/scripts/python"
+FILES_${PN}-python = "${libdir}/perf/perf-core/scripts/python ${PYTHON_SITEPACKAGES_DIR}"
 FILES_${PN}-python += "${libexecdir}/perf-core/scripts/python/*"
 FILES_${PN}-perl = "${libdir}/perf/perf-core/scripts/perl"
 
-- 
1.9.1


