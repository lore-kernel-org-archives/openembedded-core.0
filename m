Return-Path: <dave.lerner@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0763B60125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 19:56:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7HJuASk012148
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Aug 2015 12:56:10 -0700 (PDT)
Received: from ord-dlerner-d8.wrs.com (172.25.44.98) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 17 Aug 2015 12:56:10 -0700
From: Dave Lerner <dave.lerner@windriver.com>
To: <openembedded-core@lists.openembedded.org>, Saul Wold <sgw@linux.intel.com>
Date: Mon, 17 Aug 2015 14:55:56 -0500
Message-ID: <1439841356-31421-1-git-send-email-dave.lerner@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] valgrind: build ptests without optimizations
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
X-List-Received-Date: Mon, 17 Aug 2015 19:56:22 -0000
Content-Type: text/plain

[ YOCTO #8063 ]

This commit changes the both CFLAGS and CXXFLAGS when building the
valgrind ptest binaries by appending -O0, forcing no optimizations
instead of the default -O2.  For qemux86-64, this change results in
FAIL/PASS ratio improvements from 149/394 to 58/485.

It is evident that the expected result files were generated from
regression tests binaries built without optimizations.

Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
index 97d923d..537d7c8 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
@@ -57,7 +57,7 @@ RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
 RDEPENDS_${PN}-ptest += " sed perl glibc-utils perl-module-file-glob"
 
 do_compile_ptest() {
-    oe_runmake check
+    oe_runmake check CFLAGS="${CFLAGS} -O0" CXXFLAGS="${CXXFLAGS} -O0"
 }
 
 
-- 
1.9.1


