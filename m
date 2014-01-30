Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id A31166EA14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 04:11:56 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id un15so2652264pbc.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 20:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Ye6LGnBHR/Jg7XDo0T0sRzNfKAavdi+yRlpjYO3SDUw=;
	b=E0q5IoDeiPfETcvVytRUfDveyDmBVmxaXpPGqrb3uNrsZCELAZigJa1O7+Bm6df54t
	+utbOFiukh3nqbSs9Ob31HD99P3dzHBOceHlPWv3eBbhgaPwjP8YVOYNYRXwZBndtPoQ
	/4ych75OJo1lzeN/yl62RBimkzHVShavzDQd871qssDZ80pTLqqeWNuBQ4/aAYue32la
	fQoDphHtcTrWxH7UEezf9IxNAvZKjXHrPPt/4D0VGp7MYC0L/CFtNkYpEoGHc3tnl7p4
	PjFk/UWDbgc+9OoVdfWmJv5TbhSAlNIaiHS7gj3qcUAXQ/PLcBubpJque1mvDyiDLRY1
	kVGw==
X-Received: by 10.68.226.70 with SMTP id rq6mr12123433pbc.107.1391055117950;
	Wed, 29 Jan 2014 20:11:57 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	iu7sm12388951pbc.45.2014.01.29.20.11.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Jan 2014 20:11:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 20:12:33 -0800
Message-Id: <2dc7fdc290be0a35798f3ee4474db6ecceeeebe7.1391054829.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
References: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
In-Reply-To: <cover.1391054829.git.raj.khem@gmail.com>
References: <cover.1391054829.git.raj.khem@gmail.com>
Subject: [PATCH 11/15] python-distribute: Add recipes for python2 and python3
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
X-List-Received-Date: Thu, 30 Jan 2014 04:11:56 -0000

in python3-distribute rename easy_install to easy3_install

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python-distribute_0.6.32.bb             |   47 ++++++++++++++++++++
 .../python/python3-distribute_0.6.32.bb            |   47 ++++++++++++++++++++
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
1.7.10.4


