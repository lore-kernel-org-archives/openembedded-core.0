Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id CDC4D60D74
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 22:49:39 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Tue, 3 Dec 2013
	23:49:35 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 6B65628508B;
	Tue,  3 Dec 2013 23:49:35 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Dec 2013 23:49:25 +0100
Message-ID: <1386110965-24404-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] ethtool: use serial-tests to generate targets used by ptest.
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
X-List-Received-Date: Tue, 03 Dec 2013 22:49:41 -0000
Content-Type: text/plain

buildtest-TESTS and runtest-TESTS targets are required by ptest.
In order to have those targets in automake 1.13.4 serial-tests
should be specified since parallel-tests is assumed by default
and serial-tests is optional.


Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 .../ethtool/ethtool-3.12.1/use_serial_tests.patch  |   20 ++++++++++++++++++++
 meta/recipes-extended/ethtool/ethtool_3.12.1.bb    |    6 ++++--
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/ethtool/ethtool-3.12.1/use_serial_tests.patch

diff --git a/meta/recipes-extended/ethtool/ethtool-3.12.1/use_serial_tests.patch b/meta/recipes-extended/ethtool/ethtool-3.12.1/use_serial_tests.patch
new file mode 100644
index 0000000..e036edc
--- /dev/null
+++ b/meta/recipes-extended/ethtool/ethtool-3.12.1/use_serial_tests.patch
@@ -0,0 +1,20 @@
+ptest needs buildtest-TESTS and runtest-TESTS targets.
+serial-tests is required to generate those targets.
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+Upstream-Status: Inappropriate 
+(default automake behavior incompatible with ptest) 
+
+diff -ruN a/configure.ac b/configure.ac
+--- a/configure.ac	2013-12-03 10:37:40.773157142 +0100
++++ b/configure.ac	2013-12-03 10:37:21.521992831 +0100
+@@ -2,7 +2,7 @@
+ AC_INIT(ethtool, 3.12.1, netdev@vger.kernel.org)
+ AC_PREREQ(2.52)
+ AC_CONFIG_SRCDIR([ethtool.c])
+-AM_INIT_AUTOMAKE([gnu])
++AM_INIT_AUTOMAKE([gnu serial-tests])
+ AC_CONFIG_HEADERS([ethtool-config.h])
+ 
+ AM_MAINTAINER_MODE
diff --git a/meta/recipes-extended/ethtool/ethtool_3.12.1.bb b/meta/recipes-extended/ethtool/ethtool_3.12.1.bb
index 6615009..5e7559c 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.12.1.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.12.1.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://ethtool.c;beginline=4;endline=17;md5=c19b30548c582577fc6b443626fc1216"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
-           file://run-ptest"
+           file://run-ptest \
+           file://use_serial_tests.patch \
+          "
 
 SRC_URI[md5sum] = "5a1058efe8eb4f3473f5028967729078"
 SRC_URI[sha256sum] = "45190d70e5ce1b4d87def4f71fb5bf04f8a4f4dc5f9e0f38c49c16c462fb59d9"
@@ -16,7 +18,7 @@ inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
 
 do_compile_ptest() {
-   oe_runmake test-cmdline test-features
+   oe_runmake buildtest-TESTS
 }
 
 do_install_ptest () {
-- 
1.7.10.4


