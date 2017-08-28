Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9A980781F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 20:28:28 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Aug 2017 13:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,442,1498546800"; d="scan'208";a="123361382"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 28 Aug 2017 13:28:30 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Aug 2017 13:28:20 -0700
Message-Id: <1503952106-26310-3-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503952106-26310-1-git-send-email-juro.bystricky@intel.com>
References: <1503952106-26310-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 2/8] bash.inc: improve reproducibility
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
X-List-Received-Date: Mon, 28 Aug 2017 20:28:28 -0000

Remove all host build references from the following bash packages:
bash-ptest, bash-bashbug, bash-dev, bash-loadable.

[YOCTO #11918]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-extended/bash/bash.inc | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 92916d9..f6cb7e4 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -48,16 +48,32 @@ do_install_append () {
 	fi
 }
 do_install_append_class-target () {
-	# Clean host path in bashbug
+	# Clean buildhost references in bashbug
 	sed -i -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
-		-e "s,-I${WORKDIR}/\S* ,,g" ${D}${bindir}/bashbug
+		-e "s,-I${WORKDIR}/\S* ,,g" \
+		-e 's|${DEBUG_PREFIX_MAP}||g' \
+		${D}${bindir}/bashbug
+
+	# Clean buildhost references in bash.pc
+	sed -i -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
+	     ${D}${libdir}/pkgconfig/bash.pc
+
+	# Clean buildhost references in Makefile.inc
+	sed -i -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
+		-e 's|${DEBUG_PREFIX_MAP}||g' \
+		-e 's:${HOSTTOOLS_DIR}/::g' \
+		-e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+		${D}${libdir}/bash/Makefile.inc
 }
 
 do_install_ptest () {
 	make INSTALL_TEST_DIR=${D}${PTEST_PATH}/tests install-test
 	cp ${B}/Makefile ${D}${PTEST_PATH}
         sed -i -e 's/^Makefile/_Makefile/' -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
-	    -e "s,${S},,g" -e "s,${B},,g" -e "s,${STAGING_DIR_NATIVE},,g" ${D}${PTEST_PATH}/Makefile
+	    -e 's|${DEBUG_PREFIX_MAP}||g' \
+	    -e "s,${S},,g" -e "s,${B},,g" -e "s,${STAGING_DIR_NATIVE},,g" \
+	    -e 's:${HOSTTOOLS_DIR}/::g' \
+	     ${D}${PTEST_PATH}/Makefile
 }
 
 pkg_postinst_${PN} () {
-- 
2.7.4


