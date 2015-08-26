Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0366071633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 01:41:02 +0000 (UTC)
Received: by qkda128 with SMTP id a128so61847186qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 18:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XVbmmerDp4XahaP/w5/YcfugNaZoWNcaOi4IoS+f0Cg=;
	b=D1wA118Z5MVuZ57QxLSx3dvIEjzRtmSescDj6hRggNQxC/nIzEwxulzmsQ/WMYCPJl
	txQcZRLjxCOWRcoLZCsEspQtpLiId78topycbeele2mSVEBhX2qTGV2Fp0Ui45zkc1Dl
	vE8ihGJLgwWxcf0HMUeVDGL1TFytglfwAMujYPzxUpN9doq22D0YoiW55aF8F65O1imH
	e7ctbvPZON/BvxtnacAKm79p8HDIEoV7TI01Bs3vWuJx1DJUkdAZ7ZatNTwk5yf96FLJ
	W20fC3XIfNgcC5YRr6Q8lKbnAx51lYmD9zvYPQ2f076T5tNAmKiOUYxFXv4LdhflD5Gn
	5LVw==
X-Received: by 10.55.197.69 with SMTP id p66mr15067105qki.59.1440553262724;
	Tue, 25 Aug 2015 18:41:02 -0700 (PDT)
Received: from khem-dvm-001.sys.comcast.net (a-96-119-177-31.sys.comcast.net.
	[96.119.177.31]) by smtp.gmail.com with ESMTPSA id
	h49sm15175823qgh.43.2015.08.25.18.41.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Aug 2015 18:41:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 01:40:56 +0000
Message-Id: <1440553256-9914-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH V2 15/16] python-distribute, python-setuptools: Migrate to good old python-setuptools
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
X-List-Received-Date: Wed, 26 Aug 2015 01:41:06 -0000

setuptools the old king is ruling again, distribute fork has been merged
into setuptools starting 0.7x, so lets move to use it as well

Remove licence ambiguity we need to say which verison of PSF and Zope license is in use

Fixes [YOCTO #8201]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python-distribute_0.6.32.bb             | 63 ----------------------
 .../python/python-setuptools_18.2.bb               | 46 ++++++++++++++++
 ...tuptools_15.2.bb => python3-setuptools_18.2.bb} |  4 +-
 3 files changed, 48 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-distribute_0.6.32.bb
 create mode 100644 meta/recipes-devtools/python/python-setuptools_18.2.bb
 rename meta/recipes-devtools/python/{python3-setuptools_15.2.bb => python3-setuptools_18.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python-distribute_0.6.32.bb b/meta/recipes-devtools/python/python-distribute_0.6.32.bb
deleted file mode 100644
index aa07633..0000000
--- a/meta/recipes-devtools/python/python-distribute_0.6.32.bb
+++ /dev/null
@@ -1,63 +0,0 @@
-SUMMARY = "Download, build, install, upgrade, and uninstall Python packages"
-HOMEPAGE = "http://packages.python.org/distribute"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=234;endline=234;md5=26f6b02022b737126d3c88838782dddb"
-
-SRCNAME = "distribute"
-PR = "ml5"
-DEPENDS += "python"
-DEPENDS_class-native += "python-native"
-
-SRC_URI = " \
-  http://pypi.python.org/packages/source/d/distribute/${SRCNAME}-${PV}.tar.gz \
-"
-SRC_URI[md5sum] = "acb7a2da81e3612bfb1608abe4f0e568"
-SRC_URI[sha256sum] = "8970cd1e148b5d1fea9430584aea66c45ea22d80e0933393ec49ebc388f718df"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-#  http://python-distribute.org/distribute_setup.py 
-
-# force the selection of python3
-#PYTHON_BASEVERSION = "3.3"
-#PYTHON_MAJMIN = "3.3"
-
-inherit distutils
-
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
-
-do_install_prepend() {
-    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
-}
-
-#
-#  The installer puts the wrong path in the setuptools.pth file.  Correct it.
-#
-do_install_append() {
-    rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
-    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
-}
-
-do_install_append_class-nativesdk() {
-	sed -i -e '1s|^#!.*|#!/usr/bin/env python|' ${D}${PYTHON_SITEPACKAGES_DIR}/distribute-${PV}-py${PYTHON_BASEVERSION}.egg/setuptools/tests/test_resources.py
-	sed -i -e '1s|^#!.*|#!/usr/bin/env python|' ${D}${bindir}/easy_install
-	sed -i -e '1s|^#!.*|#!/usr/bin/env python|' ${D}${bindir}/easy_install-${PYTHON_BASEVERSION}
-}
-
-RDEPENDS_${PN} = "\
-  python-distutils \
-  python-compression \
-"
-
-RDEPENDS_${PN}_class-target = "\
-  python-distutils \
-  python-compression \
-  python-netclient \
-  python-email \
-  python-shell \
-"
-
-RPROVIDES_${PN} += "python-setuptools"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python-setuptools_18.2.bb b/meta/recipes-devtools/python/python-setuptools_18.2.bb
new file mode 100644
index 0000000..1de2b2e
--- /dev/null
+++ b/meta/recipes-devtools/python/python-setuptools_18.2.bb
@@ -0,0 +1,46 @@
+SUMMARY = "Downloads, builds, installs, upgrades, and uninstalls Python packages"
+HOMEPAGE = "https://pypi.python.org/pypi/setuptools"
+SECTION = "devel/python"
+LICENSE = "Python-2.0 | ZPL-2.0"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=78;endline=78;md5=8a314270dd7a8dbca741775415f1716e"
+
+SRCNAME = "setuptools"
+
+PROVIDES = "python-distribute"
+
+DEPENDS += "python"
+DEPENDS_class-native += "python-native"
+
+inherit distutils
+
+SRC_URI = "https://pypi.python.org/packages/source/s/setuptools/setuptools-${PV}.tar.gz"
+SRC_URI[md5sum] = "52b4e48939ef311d7204f8fe940764f4"
+SRC_URI[sha256sum] = "0994a58df27ea5dc523782a601357a2198b7493dcc99a30d51827a23585b5b1d"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+
+DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
+
+do_install_prepend() {
+    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
+}
+
+RDEPENDS_${PN} = "\
+  python-stringold \
+  python-email \
+  python-shell \
+  python-distutils \
+  python-compression \
+"
+
+RDEPENDS_${PN}_class-native = "\
+  python-distutils \
+  python-compression \
+"
+
+RREPLACES_${PN} = "python-distribute"
+RPROVIDES_${PN} = "python-distribute"
+RCONFLICTS_${PN} = "python-distribute"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-setuptools_15.2.bb b/meta/recipes-devtools/python/python3-setuptools_18.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-setuptools_15.2.bb
rename to meta/recipes-devtools/python/python3-setuptools_18.2.bb
index 97058c1..dc0ac80 100644
--- a/meta/recipes-devtools/python/python3-setuptools_15.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_18.2.bb
@@ -11,8 +11,8 @@ DEPENDS_class-native += "python3-native"
 SRC_URI = " \
   http://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "a9028a9794fc7ae02320d32e2d7e12ee"
-SRC_URI[sha256sum] = "381e78471fb0eff89c4b1a219e8739f48dd87c76ad2d3a790010ca3a62ee29a4"
+SRC_URI[md5sum] = "52b4e48939ef311d7204f8fe940764f4"
+SRC_URI[sha256sum] = "0994a58df27ea5dc523782a601357a2198b7493dcc99a30d51827a23585b5b1d"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


