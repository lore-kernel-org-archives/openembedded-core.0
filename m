Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id DC94E6AF41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:41 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id bi5so2913380pad.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=nJuArMB2jCbmyLLfYP3zKMqSKMqCCzS6u7jHJIBwsK8=;
	b=swMnnqoZQ64TYSiP6/vtZEuAhcpWrc/Q6vk1HZuhu2yJibSNTguGU8A9xDpJcU+K38
	q7rakoy9egYU2pHtT1p70Es9AX+kWuRuZF0Ag1nLoFsrbh2AG6TdJxXacgQBZYUqsNcl
	HE5aeY7trBZVEZH3x8D3J54CGDKdGlTwxET7XWLgHfwC9jH1+R+n0o6ypHHUbR+QPGMU
	A28Hz1Io5Y3fbtu7gEqGRUIwWxnfJkMbp7w69NqtPuKKtwFsPOCLTbwG/LMZC0dP+3iX
	jzsMRCH87Mea+zeehcNjzlzaujENfzVOBr0PLEoer98eIQvNixgXUbBeI3ucFG4EL0AX
	4exQ==
X-Received: by 10.68.211.228 with SMTP id nf4mr13538977pbc.26.1372457083124;
	Fri, 28 Jun 2013 15:04:43 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.41 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:04:01 -0700
Message-Id: <7f4986d3104e324f6fcbb4134cfe38870194866f.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 16/24] python-distribute: Add recipes for python2 and python3
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
X-List-Received-Date: Fri, 28 Jun 2013 22:04:42 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python-distribute_0.6.32.bb             |   47 ++++++++++++++++++++
 .../python/python3-distribute_0.6.32.bb            |   46 +++++++++++++++++++
 2 files changed, 93 insertions(+)
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
index 0000000..e0415d5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
@@ -0,0 +1,46 @@
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
1.7.9.5


