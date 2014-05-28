Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id B990A66099
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 16:59:55 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 28 May 2014 18:59:55 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id E8635288E1E;
	Wed, 28 May 2014 18:59:55 +0200 (CEST)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 May 2014 18:59:54 +0200
Message-ID: <1401296394-37222-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 1/1] ethtool: use serial-tests config needed by ptest.
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
X-List-Received-Date: Wed, 28 May 2014 16:59:58 -0000
Content-Type: text/plain

buildtest-TESTS and runtest-TESTS targets are required by ptest.
In order to have those targets in automake 1.13.4 serial-tests
should be specified since parallel-tests is assumed by default
and serial-tests is optional.

ptest results:
PASS: test-cmdline
PASS: test-features
==================
All 2 tests passed
==================

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch      |   19 +++++++++++++++++++
 meta/recipes-extended/ethtool/ethtool_3.14.bb       |    6 ++++--
 2 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
new file mode 100644
index 0000000..bf66267
--- /dev/null
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -0,0 +1,19 @@
+ptest needs buildtest-TESTS and runtest-TESTS targets.
+serial-tests is required to generate those targets.
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+Upstream-Status: Inappropriate
+(default automake behavior incompatible with ptest)
+
+diff -ruN a/configure.ac b/configure.ac
+--- a/configure.ac	2014-05-28 18:19:13.513980977 +0200
++++ b/configure.ac	2014-05-28 18:19:21.129660215 +0200
+@@ -2,7 +2,7 @@
+ AC_INIT(ethtool, 3.14, netdev@vger.kernel.org)
+ AC_PREREQ(2.52)
+ AC_CONFIG_SRCDIR([ethtool.c])
+-AM_INIT_AUTOMAKE([gnu])
++AM_INIT_AUTOMAKE([gnu serial-tests])
+ AC_CONFIG_HEADERS([ethtool-config.h])
+ 
+ AM_MAINTAINER_MODE
diff --git a/meta/recipes-extended/ethtool/ethtool_3.14.bb b/meta/recipes-extended/ethtool/ethtool_3.14.bb
index 2a3ca70..49c79b6 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.14.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.14.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ethtool.c;beginline=4;endline=17;md5=c19b30548c582577fc6b443626fc1216"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
-           file://run-ptest"
+           file://run-ptest \
+           file://avoid_parallel_tests.patch \
+           "
 
 SRC_URI[md5sum] = "997e20c25c43ad5800f8ae3204455a8a"
 SRC_URI[sha256sum] = "b1a988d6e397bd9d5d73cfd64329f85121936a050174bbfe90f8701fd893a1df"
@@ -16,7 +18,7 @@ inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
 
 do_compile_ptest() {
-   oe_runmake test-cmdline test-features
+   oe_runmake buildtest-TESTS
 }
 
 do_install_ptest () {
-- 
1.7.10.4


