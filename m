Return-Path: <phong@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DFD747F3AF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 19:00:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x86IxkHF008508
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Sep 2019 11:59:56 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 6 Sep 2019 11:59:36 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21010)	id CEF3520476;
	Fri,  6 Sep 2019 14:59:35 -0400 (EDT)
From: Peiran Hong <peiran.hong@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Sep 2019 14:59:23 -0400
Message-ID: <20190906185923.14998-1-peiran.hong@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v2] diffutils: Added perl to support ptest & Skipped one test case
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
X-List-Received-Date: Fri, 06 Sep 2019 19:00:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Peiran Hong <Peiran.Hong@windriver.com>

Added perl to the run-time dependency of the recipe for diffutils since
it is required by the test "large-subpot".
The test "strip-trailing-cr" is skipped since it requires valgrind to
work, but valgrind is considered too heavy-weight for diffutils package.

Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
---
 ...001-Skip-strip-trailing-cr-test-case.patch | 28 +++++++++++++++++++
 .../diffutils/diffutils_3.7.bb                |  3 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch

diff --git a/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch b/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
new file mode 100644
index 0000000000..c2ba93285f
--- /dev/null
+++ b/meta/recipes-extended/diffutils/diffutils/0001-Skip-strip-trailing-cr-test-case.patch
@@ -0,0 +1,28 @@
+From d725a2d855377e5cab1b636380c3bd86b711c54a Mon Sep 17 00:00:00 2001
+From: Peiran Hong <peiran.hong@windriver.com>
+Date: Thu, 5 Sep 2019 15:42:22 -0400
+Subject: [PATCH] Skip strip-trailing-cr test case
+
+---
+ tests/Makefile.am | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 83a7c9d..04d51b5 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -21,8 +21,10 @@ TESTS = \
+   stdin \
+   strcoll-0-names \
+   filename-quoting \
+-  strip-trailing-cr \
+   colors
++# Skipping this test since it requires valgrind
++# and thus is too heavy for diffutils package
++# strip-trailing-cr
+ 
+ XFAIL_TESTS = large-subopt
+ 
+-- 
+2.21.0
+
diff --git a/meta/recipes-extended/diffutils/diffutils_3.7.bb b/meta/recipes-extended/diffutils/diffutils_3.7.bb
index 7daeee3513..8111ae6065 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.7.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.7.bb
@@ -5,6 +5,7 @@ require diffutils.inc
 
 SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
            file://run-ptest \
+           file://0001-Skip-strip-trailing-cr-test-case.patch \
 "
 
 SRC_URI[md5sum] = "4824adc0e95dbbf11dfbdfaad6a1e461"
@@ -17,7 +18,7 @@ acpaths = "-I ./m4"
 
 inherit ptest
 
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make perl"
 
 do_install_ptest() {
 	t=${D}${PTEST_PATH}
-- 
2.21.0


