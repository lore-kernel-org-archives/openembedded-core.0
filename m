Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 87BDF6B8F6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 15:32:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s88FWQuZ022825
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Sep 2014 08:32:26 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 8 Sep 2014 08:32:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Sep 2014 08:32:25 -0700
Message-ID: <7466b1af8cd40d7f0cf2c3ce5b5272c4278d1575.1410188390.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1410188390.git.liezhi.yang@windriver.com>
References: <cover.1410188390.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cracklib: add python support back
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
X-List-Received-Date: Mon, 08 Sep 2014 15:32:29 -0000
Content-Type: text/plain

It had been disabled because of installed-vs-shipped:
    WARNING:   /usr/lib/python2.7
    WARNING:   /usr/lib/python2.7/site-packages

Now we fix it and add cracklib-python back.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/cracklib/cracklib_2.9.1.bb |   29 +++++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.1.bb b/meta/recipes-extended/cracklib/cracklib_2.9.1.bb
index 99ccde3..2772a02 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.1.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.1.bb
@@ -4,10 +4,13 @@ HOMEPAGE = "http://sourceforge.net/projects/cracklib"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-DEPENDS = "cracklib-native zlib"
-DEPENDS_class-native = "zlib-native"
+DEPENDS = "cracklib-native zlib python"
+DEPENDS_class-native = "zlib-native python-native"
+RDEPEND_${PN}-python += "python"
 
-EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
+PACKAGES += "${PN}-python"
+
+EXTRA_OECONF = "--with-python --libdir=${base_libdir}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
@@ -16,10 +19,28 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
 SRC_URI[md5sum] = "90536219c520add2ceb3c26f0d7da404"
 SRC_URI[sha256sum] = "408905c2539a97dc8cbbb6d7cd2046cb5647a345b4bda399220d9471be16d156"
 
-inherit autotools-brokensep gettext
+inherit autotools-brokensep gettext pythonnative
 
 do_install_append_class-target() {
 	create-cracklib-dict -o ${D}${datadir}/cracklib/pw_dict ${D}${datadir}/cracklib/cracklib-small
 }
 
+do_install_append() {
+	src_dir="${D}${base_libdir}/${PYTHON_DIR}/site-packages"
+	rm -f $src_dir/*.pyo
+	rm -f $src_dir/test_cracklib.py
+	# Move python files from ${base_libdir} to ${libdir} since used --libdir=${base_libdir}
+	install -d -m 0755 ${D}${PYTHON_SITEPACKAGES_DIR}/
+	mv $src_dir/* ${D}${PYTHON_SITEPACKAGES_DIR}
+	rm -fr ${D}${base_libdir}/${PYTHON_DIR}
+}
+
 BBCLASSEXTEND = "native nativesdk"
+
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/cracklib.py \
+	${PYTHON_SITEPACKAGES_DIR}/_cracklib.so \
+    "
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/_cracklib.so"
+FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_cracklib.a \
+	${PYTHON_SITEPACKAGES_DIR}/_cracklib.la \
+    "
-- 
1.7.9.5


