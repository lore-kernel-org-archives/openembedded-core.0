Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 07DED71B45
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 18:22:36 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Oct 2017 11:22:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,481,1500966000"; d="scan'208";a="157197365"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga005.jf.intel.com with ESMTP; 05 Oct 2017 11:22:37 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 11:22:28 -0700
Message-Id: <1507227748-4044-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python-ptest: various fixes
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
X-List-Received-Date: Thu, 05 Oct 2017 18:22:37 -0000

python-ptest needs python-tests package installed in order to
run any tests.
This patch adds python-tests as a runtime dependency, so the test suite
will be present in the image.
While in there, also removed several build host references.

[YOCTO #12144]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/python/python_2.7.13.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python_2.7.13.bb b/meta/recipes-devtools/python/python_2.7.13.bb
index 4d73cd2..8770699 100644
--- a/meta/recipes-devtools/python/python_2.7.13.bb
+++ b/meta/recipes-devtools/python/python_2.7.13.bb
@@ -154,7 +154,7 @@ FILES_lib${BPN}2 = "${libdir}/libpython*.so.*"
 PACKAGES += "${PN}-misc"
 FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
 RDEPENDS_${PN}-modules += "${PN}-misc"
-RDEPENDS_${PN}-ptest = "${PN}-modules"
+RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests"
 #inherit ptest after "require python-${PYTHON_MAJMIN}-manifest.inc" so PACKAGES doesn't get overwritten
 inherit ptest
 
@@ -164,6 +164,16 @@ do_install_ptest() {
 	sed -e s:LIBDIR/python/ptest:${PTEST_PATH}:g \
 	 -e s:LIBDIR:${libdir}:g \
 	 -i ${D}${PTEST_PATH}/run-ptest
+
+	#Remove build host references
+	sed -i \
+		-e 's:--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
+	    -e 's:--sysroot=${STAGING_DIR_TARGET}::g' \
+	    -e 's|${DEBUG_PREFIX_MAP}||g' \
+	    -e 's:${HOSTTOOLS_DIR}/::g' \
+	    -e 's:${RECIPE_SYSROOT}::g' \
+	    -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+	${D}/${PTEST_PATH}/Makefile
 }
 
 # catch manpage
-- 
2.7.4


