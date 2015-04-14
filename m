Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3EB73D38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:09:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3E994Ep009788
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:09:04 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 02:09:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 02:08:59 -0700
Message-ID: <6f36e5a2eaba7bc596eb867a5df35846a8e94951.1429002519.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429002519.git.liezhi.yang@windriver.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] cracklib: add python support back
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
X-List-Received-Date: Tue, 14 Apr 2015 09:09:02 -0000
Content-Type: text/plain

It had been disabled because of installed-vs-shipped:
    WARNING:   /usr/lib/python2.7
    WARNING:   /usr/lib/python2.7/site-packages

Now we fix it and add cracklib-python back.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/cracklib/cracklib_2.9.2.bb |   28 ++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.2.bb b/meta/recipes-extended/cracklib/cracklib_2.9.2.bb
index 177ab27..fceca54 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.2.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.2.bb
@@ -4,10 +4,12 @@ HOMEPAGE = "http://sourceforge.net/projects/cracklib"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-DEPENDS = "cracklib-native zlib"
-DEPENDS_class-native = "zlib-native"
+DEPENDS = "cracklib-native zlib python"
+RDEPEND_${PN}-python += "python"
 
-EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
+PACKAGES += "${PN}-python"
+
+EXTRA_OECONF = "--with-python --libdir=${base_libdir}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
@@ -18,10 +20,28 @@ SRC_URI[sha256sum] = "c1c899291d443e99d1aecfbc879e4ac9c0cbc265574f47b487842da11e
 
 PR = "r1"
 
-inherit autotools gettext
+inherit autotools gettext pythonnative python-dir
 
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


