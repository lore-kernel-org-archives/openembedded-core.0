Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 61C7C6612D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 17:45:12 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Oct 2017 10:45:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,371,1503385200"; d="scan'208";a="160233604"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga005.jf.intel.com with ESMTP; 13 Oct 2017 10:45:13 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Oct 2017 10:45:05 -0700
Message-Id: <1507916705-89854-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] gawk-ptest: fix a failing test
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
X-List-Received-Date: Fri, 13 Oct 2017 17:45:12 -0000

This patch changes the result of the "include" test
from FAIL to PASS. The test used to fail as the test prerequisite
was missing.
This was the only test out of 298 that used to fail.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-extended/gawk/gawk_4.1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/gawk/gawk_4.1.4.bb b/meta/recipes-extended/gawk/gawk_4.1.4.bb
index 04451f7..995d37d 100644
--- a/meta/recipes-extended/gawk/gawk_4.1.4.bb
+++ b/meta/recipes-extended/gawk/gawk_4.1.4.bb
@@ -41,7 +41,7 @@ inherit ptest
 
 do_install_ptest() {
 	mkdir ${D}${PTEST_PATH}/test
-	for i in `grep -vE "@|^$|#|Gt-dummy" ${S}/test/Maketests |awk -F: '{print $1}'` Maketests; \
+	for i in `grep -vE "@|^$|#|Gt-dummy" ${S}/test/Maketests |awk -F: '{print $1}'` Maketests inclib.awk; \
 	  do cp ${S}/test/$i* ${D}${PTEST_PATH}/test; \
 	done
 }
-- 
2.7.4


