Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 69F407E042
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 20:11:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4HKAjiY009995
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 13:10:55 -0700
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 17 May 2019 13:10:22 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 May 2019 16:10:20 -0400
Message-ID: <20190517201021.6598-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH 1/2] valgrind: Make ptest timestamps copasetic
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
X-List-Received-Date: Fri, 17 May 2019 20:11:05 -0000
Content-Type: text/plain

Avoid ptest failures due to .diffs such as
cachegrind/tests/ann1.post.diff:
   @ Source file 'a.c' is more recent than input file 'cgout-test'.
   @ Annotations may not be correct.
by using:
   touch a.c -r cgout-test

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.15.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index ae3498f551..2160fc92d1 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -168,6 +168,7 @@ do_install_ptest() {
         -o -name "*.h" \) \
         -exec rm {} \;
     mv ${D}${PTEST_PATH}/cachegrind/tests/a_c ${D}${PTEST_PATH}/cachegrind/tests/a.c
+    touch ${D}${PTEST_PATH}/cachegrind/tests/a.c -r ${D}${PTEST_PATH}/cachegrind/tests/cgout-test
 
     # find *_annotate in ${bindir} for yocto build
     sed -i s:\.\./\.\./cachegrind/cg_annotate:${bindir}/cg_annotate: ${D}${PTEST_PATH}/cachegrind/tests/ann1.vgtest
-- 
2.17.0


