Return-Path: <gaba@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id A84A160289
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 13:28:33 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Thu, 11 Jul 2013 15:28:30 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4354)	id 6EB8D288C5A;
	Thu, 11 Jul 2013 15:28:30 +0200 (CEST)
From: Gabriel Barbu <gabriel.barbu@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jul 2013 15:28:08 +0200
Message-ID: <1373549288-42469-1-git-send-email-gabriel.barbu@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: gabriel.barbu@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] ethtool: add ptest
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
X-List-Received-Date: Thu, 11 Jul 2013 13:28:34 -0000
Content-Type: text/plain

Install ethtool test and run it as a ptest.

Signed-off-by: Gabriel Barbu <gabriel.barbu@enea.com>
---
 meta/recipes-extended/ethtool/ethtool-3.10/run-ptest |    2 ++
 meta/recipes-extended/ethtool/ethtool_3.10.bb        |   18 ++++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/ethtool/ethtool-3.10/run-ptest

diff --git a/meta/recipes-extended/ethtool/ethtool-3.10/run-ptest b/meta/recipes-extended/ethtool/ethtool-3.10/run-ptest
new file mode 100644
index 0000000..1e245da
--- /dev/null
+++ b/meta/recipes-extended/ethtool/ethtool-3.10/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+make -k runtest-TESTS
diff --git a/meta/recipes-extended/ethtool/ethtool_3.10.bb b/meta/recipes-extended/ethtool/ethtool_3.10.bb
index aa8b129..83587d9 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.10.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.10.bb
@@ -6,9 +6,23 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://ethtool.c;beginline=4;endline=17;md5=c19b30548c582577fc6b443626fc1216"
 
-SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz"
+SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
+           file://run-ptest"
 
 SRC_URI[md5sum] = "b41deb37143dfb86934a8f52cea853d2"
 SRC_URI[sha256sum] = "62f0a9cea954c32a2bdc2d2ece295fda5b915cfea56f5de97b997d8ebaae0381"
 
-inherit autotools
+inherit autotools ptest
+RDEPENDS_${PN}-ptest += "make"
+
+do_compile_ptest() {
+   oe_runmake buildtest-TESTS
+}
+
+do_install_ptest () {
+   cp ${B}/Makefile                 ${D}${PTEST_PATH}
+   install ${B}/test-cmdline        ${D}${PTEST_PATH}
+   install ${B}/test-features       ${D}${PTEST_PATH}
+   install ${B}/ethtool             ${D}${PTEST_PATH}/ethtool
+   sed -i 's/^Makefile/_Makefile/'  ${D}${PTEST_PATH}/Makefile
+}
-- 
1.7.10.4


