Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E6D8B6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 20:14:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 23 Aug 2017 13:14:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,417,1498546800"; d="scan'208";a="1165538467"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2017 13:14:25 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2017 13:14:19 -0700
Message-Id: <1503519259-35385-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] attr: improve reproducibility
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
X-List-Received-Date: Wed, 23 Aug 2017 20:14:25 -0000

Remove all host build references from the attr-ptest package.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-support/attr/attr.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index e8b5d05..24ef5ad 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -32,6 +32,12 @@ do_install_ptest() {
 	  do cp ${S}/include/$i ${D}${PTEST_PATH}/include/; \
 	done
 	sed -e 's|; @echo|; echo|' -i ${D}${PTEST_PATH}/test/Makefile
+    
+	# Remove any build host references
+	sed -e "s:--sysroot=${STAGING_DIR_TARGET}::g" \
+	    -e 's:${HOSTTOOLS_DIR}/::g' \
+	    -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+	    -i ${D}${PTEST_PATH}/include/builddefs
 }
 
 RDEPENDS_${PN}-ptest = "attr coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix"
-- 
2.7.4


