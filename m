Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 409DD76C0F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 20:03:48 +0000 (UTC)
Received: by iodt126 with SMTP id t126so162649426iod.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=rQvbwOLmRgerxtRCusP00dJDO5MaPI8mGjIowvTGZTk=;
	b=J6AThpaTEugiCsfxvy6zTPSRbU7N1f9Y5k9/SYshbIwsMP3/rn/RvaY2nSAL00sP/8
	AzHqBLXCyjhVAQzfj13XgGCTNoCSkhezhaKr4c55lfFT/fZWIhIJzTLRSLfN4CZ/eIzv
	hSJ+0BeQ5UgHmlkTqjP1jbCpcz57pOc3XHtgH7DIjNlSMIBozvNmxirsceM2h8YDy7Ul
	O4HSdXdKcPqtfhGDKWFTRMous9Y/9k2ffSAgVl0IhCdE99leYqQylb9meKyXNolj0a3J
	0gGz0ZRt6p9vV9swalG1+zaOFKfp7UZ+iK3Q66g1KojLUXB5Mj7cpfWGXAcnekBccDZv
	ct4Q==
X-Received: by 10.107.10.139 with SMTP id 11mr18867700iok.117.1440446628934;
	Mon, 24 Aug 2015 13:03:48 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	hh9sm9538417igb.18.2015.08.24.13.03.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:03:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 13:03:34 -0700
Message-Id: <9bf77291c7084cfdef86008d204932e7adb1067a.1440446290.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
References: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
In-Reply-To: <cover.1440446289.git.raj.khem@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
Subject: [PATCH 16/17] python-distribute, python-setuptools: Migrate to good old python-setuptools
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
X-List-Received-Date: Mon, 24 Aug 2015 20:03:49 -0000

setuptools the old king is ruling again, distribute fork has been merged
into setuptools starting 0.7x, so lets move to use it as well

Fixes [YOCTO #8201]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python-distribute_0.6.32.bb             | 63 ----------------------
 .../python/python-setuptools_18.2.bb               | 46 ++++++++++++++++
 ...tuptools_15.2.bb => python3-setuptools_18.2.bb} |  0
 3 files changed, 46 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-distribute_0.6.32.bb
 create mode 100644 meta/recipes-devtools/python/python-setuptools_18.2.bb
 rename meta/recipes-devtools/python/{python3-setuptools_15.2.bb => python3-setuptools_18.2.bb} (100%)

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
index 0000000..1af3e05
--- /dev/null
+++ b/meta/recipes-devtools/python/python-setuptools_18.2.bb
@@ -0,0 +1,46 @@
+SUMMARY = "Downloads, builds, installs, upgrades, and uninstalls Python packages"
+HOMEPAGE = "https://pypi.python.org/pypi/setuptools"
+SECTION = "devel/python"
+LICENSE = "PSF|ZPL"
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
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_15.2.bb
rename to meta/recipes-devtools/python/python3-setuptools_18.2.bb
-- 
2.1.4


