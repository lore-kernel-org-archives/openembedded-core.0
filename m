Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD7577E87
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 17:27:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Sep 2017 10:27:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,422,1500966000"; d="scan'208";a="1016671266"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 20 Sep 2017 10:27:08 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Sep 2017 10:27:17 -0700
Message-Id: <1505928437-42844-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] gzip_1.8.bb: improve reproducibility
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
X-List-Received-Date: Wed, 20 Sep 2017 17:27:32 -0000

Remove build host references from gzip-ptest package.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-extended/gzip/gzip_1.8.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/gzip/gzip_1.8.bb b/meta/recipes-extended/gzip/gzip_1.8.bb
index a0dec14..d093207 100644
--- a/meta/recipes-extended/gzip/gzip_1.8.bb
+++ b/meta/recipes-extended/gzip/gzip_1.8.bb
@@ -27,6 +27,10 @@ do_install_ptest() {
             -e 's/^AWK = ..*/AWK = awk/'                \
             -e 's/^srcdir = ..*/srcdir = \./'           \
             -e 's/^Makefile: ..*/Makefile: /'           \
+            -e 's,--sysroot=${STAGING_DIR_TARGET},,g'   \
+            -e 's|${DEBUG_PREFIX_MAP}||g' \
+            -e 's:${HOSTTOOLS_DIR}/::g'                 \
+            -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
             ${B}/tests/Makefile > ${D}${PTEST_PATH}/src/tests/Makefile
 }
 
-- 
2.7.4


