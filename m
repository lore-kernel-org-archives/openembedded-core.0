Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D22EA781FD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 20:28:28 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Aug 2017 13:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,442,1498546800"; d="scan'208";a="123361388"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 28 Aug 2017 13:28:30 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Aug 2017 13:28:22 -0700
Message-Id: <1503952106-26310-5-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503952106-26310-1-git-send-email-juro.bystricky@intel.com>
References: <1503952106-26310-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 4/8] diffutils_3.6.bb: remove build host references
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
X-List-Received-Date: Mon, 28 Aug 2017 20:28:29 -0000

Remove build host references from diffutils-ptest package.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-extended/diffutils/diffutils_3.6.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/diffutils/diffutils_3.6.bb b/meta/recipes-extended/diffutils/diffutils_3.6.bb
index a2ea484..deadd62 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.6.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.6.bb
@@ -24,7 +24,12 @@ do_install_ptest() {
 	install -D ${S}/build-aux/test-driver $t/build-aux/test-driver
 	cp -r ${S}/tests $t/
 	install ${B}/tests/Makefile $t/tests/
-	sed -e 's|^Makefile:|_Makefile:|' \
+	sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+	    -e 's|${DEBUG_PREFIX_MAP}||g' \
+	    -e 's:${HOSTTOOLS_DIR}/::g' \
+	    -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+	    -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+	    -e 's|^Makefile:|_Makefile:|' \
 	    -e 's|bash|sh|' \
 	    -e 's|^top_srcdir = \(.*\)|top_srcdir = ..\/|' \
 	    -e 's|^srcdir = \(.*\)|srcdir = .|' \
-- 
2.7.4


