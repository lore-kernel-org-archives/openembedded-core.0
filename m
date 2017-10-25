Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id F1D7F607F8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 23:00:27 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 25 Oct 2017 16:00:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,433,1503385200"; d="scan'208";a="142260284"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 25 Oct 2017 16:00:28 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 16:00:26 -0700
Message-Id: <1508972426-19419-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] e2fsprogs-ptest: improve reproducibility
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
X-List-Received-Date: Wed, 25 Oct 2017 23:00:28 -0000

Remove several Makefiles containing build host references.
While at it, also remove some additional files not needed for
testing.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
index 7fba8eb..00093cc 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
@@ -109,4 +109,9 @@ do_install_ptest() {
 	cp -R --no-dereference --preserve=mode,links -v ${B}/tests ${D}${PTEST_PATH}/test
 	cp -R --no-dereference --preserve=mode,links -v ${S}/tests/* ${D}${PTEST_PATH}/test
 	sed -e 's!../e2fsck/e2fsck!e2fsck!g' -i ${D}${PTEST_PATH}/test/*/expect*
+
+	# Remove various files
+	find "${D}${PTEST_PATH}" -type f \
+	    \( -name 'Makefile' -o -name 'Makefile.in' -o -name '*.o' -o -name '*.c' -o -name '*.h' \)\
+	    -exec  rm -f {} +
 }
-- 
2.7.4


