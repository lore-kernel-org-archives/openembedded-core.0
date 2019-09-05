Return-Path: <phong@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 586E77F2E3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 15:39:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x85Fd19g032295
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Sep 2019 08:39:16 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 5 Sep 2019 08:38:58 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21010)	id 345031FF65;
	Thu,  5 Sep 2019 11:38:58 -0400 (EDT)
From: Peiran Hong <peiran.hong@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Sep 2019 11:38:46 -0400
Message-ID: <20190905153846.11226-1-peiran.hong@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] diffutils: Add valgrind to support ptest
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
X-List-Received-Date: Thu, 05 Sep 2019 15:39:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Peiran Hong <Peiran.Hong@windriver.com>

The test "strip-trailing-cr" for diffutils package is skipped since it requires
valgrind to run. This commit adds valgrind to the run-time dependency of
the recipe for diffutils.

Signed-off-by: Peiran Hong <Peiran.Hong@windriver.com>
---
 meta/recipes-extended/diffutils/diffutils_3.7.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/diffutils/diffutils_3.7.bb b/meta/recipes-extended/diffutils/diffutils_3.7.bb
index 7daeee3513..2d763633b6 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.7.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.7.bb
@@ -17,7 +17,9 @@ acpaths = "-I ./m4"
 
 inherit ptest
 
-RDEPENDS_${PN}-ptest += "make"
+# Include valgrind since the test "strip-trailing-cr" requires it to run, although
+# valgrind is a heavy package for diffutils
+RDEPENDS_${PN}-ptest += "make valgrind"
 
 do_install_ptest() {
 	t=${D}${PTEST_PATH}
-- 
2.21.0


