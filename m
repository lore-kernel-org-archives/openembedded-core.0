Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 169AB719C4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 19:17:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 10 Apr 2017 12:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,182,1488873600"; d="scan'208";a="954418852"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 10 Apr 2017 12:17:19 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Apr 2017 22:16:51 +0300
Message-Id: <20170410191651.8128-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCHv2] openssl: fix the reference to native perl in ptests
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
X-List-Received-Date: Mon, 10 Apr 2017 19:17:20 -0000

This was causing a couple of ptest failures.

[YOCTO #10840]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 481a4445605..c721d8c570d 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -205,6 +205,10 @@ do_install () {
 
 do_install_ptest () {
 	cp -r -L Makefile.org Makefile test ${D}${PTEST_PATH}
+
+        # Replace the path to native perl with the path to target perl
+        sed -i 's,^PERL=.*,PERL=${bindir}/perl,' ${D}${PTEST_PATH}/Makefile
+
 	cp Configure config e_os.h ${D}${PTEST_PATH}
 	cp -r -L include ${D}${PTEST_PATH}
 	ln -sf ${libdir}/libcrypto.a ${D}${PTEST_PATH}
-- 
2.11.0


