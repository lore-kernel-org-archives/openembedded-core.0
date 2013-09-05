Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id F09A1615F2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 04:17:46 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro12so1254454pbb.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 21:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=8ohh3NAoWeUbIymXY1yc0mC5cYnlkOnFpS/BWrkiXjw=;
	b=Pha5U/WjqPzRaegp8WYMwM8MuI1/Q5nXRQyb4DZFuYBwQtiz2eOQ/b3aVAJZXrHSNc
	W7LhA59EUR3kSgDjkPNAwoAqD6ClPLouWguiMlxt6ScyLBwzBE9SURDNx7vfI5oTUBCH
	J5G4N9HIWx7R5WH21V8VB/6DQtc3LzwpnIgidfLH3cqifzahee6LVTHRAovJRDdjU9j4
	SXio4FCrueS2QrEvcuLrd2ttqab/HQ4TwHzyPouZQ5x1A8d6nloV9uARsNscXRb6D3lk
	d+AX/KoZiV+R7YApxu/+GNLJNigUHNK99hsuX+yTt8o5kNNC4eoMrqt5Xgk8SPoQMHv1
	4AUQ==
X-Received: by 10.68.196.138 with SMTP id im10mr7124258pbc.5.1378354669116;
	Wed, 04 Sep 2013 21:17:49 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	tr10sm32571783pbc.22.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 21:17:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2013 21:16:16 -0700
Message-Id: <70a24c84362548fb16948eed6768dba9dad9be66.1378354382.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <01b4612b2453648a4b5f203acd8326b73ef293f3.1378354382.git.raj.khem@gmail.com>
References: <01b4612b2453648a4b5f203acd8326b73ef293f3.1378354382.git.raj.khem@gmail.com>
In-Reply-To: <cover.1378354381.git.raj.khem@gmail.com>
References: <cover.1378354381.git.raj.khem@gmail.com>
Subject: [PATCH 11/13] python-distribute: Add recipes for python2 and python3
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
X-List-Received-Date: Thu, 05 Sep 2013 04:17:47 -0000

in python3-distribute rename easy_install to easy3_install

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python-distribute_0.6.32.bb             | 47 ++++++++++++++++++++++
 .../python/python3-distribute_0.6.32.bb            | 47 ++++++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-distribute_0.6.32.bb
 create mode 100644 meta/recipes-devtools/python/python3-distribute_0.6.32.bb

diff --git a/meta/recipes-devtools/python/python-distribute_0.6.32.bb b/meta/recipes-devtools/python/python-distribute_0.6.32.bb
new file mode 100644
index 0000000..86ac871
--- /dev/null
+++ b/meta/recipes-devtools/python/python-distribute_0.6.32.bb
@@ -0,0 +1,47 @@
+DESCRIPTION = "Download, build, install, upgrade, and uninstall Python packages"
+HOMEPAGE = "http://packages.python.org/distribute"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=234;endline=234;md5=26f6b02022b737126d3c88838782dddb"
+
+SRCNAME = "distribute"
+PR = "ml5"
+DEPENDS += "python"
+DEPENDS_virtclass-native += "python-native"
+
+SRC_URI = " \
+  http://pypi.python.org/packages/source/d/distribute/${SRCNAME}-${PV}.tar.gz \
+"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+#  http://python-distribute.org/distribute_setup.py 
+
+# force the selection of python3
+#PYTHON_BASEVERSION = "3.3"
+#PYTHON_MAJMIN = "3.3"
+
+inherit distutils
+
+DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
+
+do_install_prepend() {
+    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
+}
+
+#
+#  The installer puts the wrong path in the setuptools.pth file.  Correct it.
+#
+do_install_append() {
+    rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
+    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
+}
+
+RDEPENDS_${PN} = "\
+  python-distutils \
+  python-compression \
+"
+
+SRC_URI[md5sum] = "acb7a2da81e3612bfb1608abe4f0e568"
+SRC_URI[sha256sum] = "8970cd1e148b5d1fea9430584aea66c45ea22d80e0933393ec49ebc388f718df"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/python/python3-distribute_0.6.32.bb b/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
new file mode 100644
index 0000000..31fc56d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
@@ -0,0 +1,47 @@
+DESCRIPTION = "Download, build, install, upgrade, and uninstall Python packages"
+HOMEPAGE = "http://packages.python.org/distribute"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=234;endline=234;md5=26f6b02022b737126d3c88838782dddb"
+
+SRCNAME = "distribute"
+PR = "ml5"
+DEPENDS += "python3"
+DEPENDS_virtclass-native += "python3-native"
+
+SRC_URI = " \
+  http://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+#  http://python-distribute.org/distribute_setup.py 
+
+# force the selection of python3
+#PYTHON_BASEVERSION = "3.3"
+#PYTHON_MAJMIN = "3.3"
+
+inherit distutils3
+
+DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
+
+do_install_prepend() {
+    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
+}
+#
+#  The installer puts the wrong path in the setuptools.pth file.  Correct it.
+#
+do_install_append() {
+    rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
+    mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
+    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
+}
+
+RDEPENDS_${PN} = "\
+  python3-distutils \
+  python3-compression \
+"
+
+SRC_URI[md5sum] = "acb7a2da81e3612bfb1608abe4f0e568"
+SRC_URI[sha256sum] = "8970cd1e148b5d1fea9430584aea66c45ea22d80e0933393ec49ebc388f718df"
+
+BBCLASSEXTEND = "native"
-- 
1.8.4


