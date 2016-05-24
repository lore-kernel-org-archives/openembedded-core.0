Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B566D731DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:54:10 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:54:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498190"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:54:12 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:54:21 +0300
Message-Id: <aeb6ec6c59df159c99e2d3f113814f47d30ffeea.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 32/45] cracklib: disable building the python module
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
X-List-Received-Date: Tue, 24 May 2016 11:54:10 -0000

It's tricky to convert to Python 3 and isn't required by anything in
oe-core or meta-oe.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/cracklib/cracklib_2.9.5.bb | 25 +++---------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
index 3bd3f93..c185d23 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
@@ -4,12 +4,9 @@ HOMEPAGE = "http://sourceforge.net/projects/cracklib"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-DEPENDS = "cracklib-native zlib python"
-RDEPEND_${PN}-python += "python"
+DEPENDS = "cracklib-native zlib"
 
-PACKAGES += "${PN}-python"
-
-EXTRA_OECONF = "--with-python --libdir=${base_libdir}"
+EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
@@ -21,27 +18,11 @@ SRC_URI[sha256sum] = "59ab0138bc8cf90cccb8509b6969a024d5e58d2d02bcbdccbb9ba9b88b
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/cracklib/files/cracklib/"
 UPSTREAM_CHECK_REGEX = "/cracklib/(?P<pver>(\d+[\.\-_]*)+)/"
 
-inherit autotools gettext pythonnative python-dir
+inherit autotools gettext
 
 do_install_append_class-target() {
 	create-cracklib-dict -o ${D}${datadir}/cracklib/pw_dict ${D}${datadir}/cracklib/cracklib-small
 }
 
-do_install_append() {
-	src_dir="${D}${base_libdir}/${PYTHON_DIR}/site-packages"
-	rm -f $src_dir/test_cracklib.py*
-
-	if [ "${base_libdir}" != "${libdir}" ] ; then
-	   # Move python files from ${base_libdir} to ${libdir} since used --libdir=${base_libdir}
-	   install -d -m 0755 ${D}${PYTHON_SITEPACKAGES_DIR}/
-	   mv $src_dir/* ${D}${PYTHON_SITEPACKAGES_DIR}
-	   rm -fr ${D}${base_libdir}/${PYTHON_DIR}
-	fi
-}
-
 BBCLASSEXTEND = "native nativesdk"
 
-FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/cracklib.py* \
-	${PYTHON_SITEPACKAGES_DIR}/_cracklib.*"
-
-FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_cracklib.a"
-- 
2.8.1


