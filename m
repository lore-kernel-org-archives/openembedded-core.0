Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B435460767
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 22:00:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 13 Jun 2016 15:00:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,468,1459839600"; d="scan'208";a="974911227"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.155])
	by orsmga001.jf.intel.com with ESMTP; 13 Jun 2016 15:00:52 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2016 17:02:42 -0500
Message-Id: <1465855362-25759-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] flex: Fix top_builddir path for flex's test-driver script
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
X-List-Received-Date: Mon, 13 Jun 2016 22:00:56 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Since 5f82d17ac63f6d5b55f7b8d019c239620ab54596, test-driver scripts
look into top_buildir path, so fix this path on flex's tests/Makefile.

[YOCTO #9721]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-devtools/flex/flex_2.6.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.0.bb
index 8285426..f6d136c 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.0.bb
@@ -51,5 +51,8 @@ do_install_ptest() {
 	cp ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
 	cp -r ${S}/tests/* ${D}${PTEST_PATH}
 	cp -r ${B}/tests/* ${D}${PTEST_PATH}
-	sed -e 's/^Makefile:/_Makefile:/' -e 's/^srcdir = \(.*\)/srcdir = ./' -e 's/^top_srcdir = \(.*\)/top_srcdir = ./'  -i ${D}${PTEST_PATH}/Makefile
+	sed -e 's/^Makefile:/_Makefile:/' \
+	    -e 's/^srcdir = \(.*\)/srcdir = ./' -e 's/^top_srcdir = \(.*\)/top_srcdir = ./' \
+	    -e 's/^builddir = \(.*\)/builddir = ./' -e 's/^top_builddir = \(.*\)/top_builddir = ./' \
+	    -i ${D}${PTEST_PATH}/Makefile
 }
-- 
2.1.4


