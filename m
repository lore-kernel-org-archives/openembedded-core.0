Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D5CDF6FFE8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 14:49:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 May 2016 07:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,572,1455004800"; d="scan'208";a="967737083"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2016 07:49:48 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 521926A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 08:37:23 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 May 2016 17:49:41 +0300
Message-Id: <1462286989-22848-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
References: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 02/10] ethtool: upgrade to 4.5
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
X-List-Received-Date: Tue, 03 May 2016 14:49:48 -0000

4.2 -> 4.5

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/ethtool/ethtool_4.2.bb | 30 ----------------------------
 meta/recipes-extended/ethtool/ethtool_4.5.bb | 30 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-extended/ethtool/ethtool_4.2.bb
 create mode 100644 meta/recipes-extended/ethtool/ethtool_4.5.bb

diff --git a/meta/recipes-extended/ethtool/ethtool_4.2.bb b/meta/recipes-extended/ethtool/ethtool_4.2.bb
deleted file mode 100644
index 95df784..0000000
--- a/meta/recipes-extended/ethtool/ethtool_4.2.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Display or change ethernet card settings"
-DESCRIPTION = "A small utility for examining and tuning the settings of your ethernet-based network interfaces."
-HOMEPAGE = "http://www.kernel.org/pub/software/network/ethtool/"
-SECTION = "console/network"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://ethtool.c;beginline=4;endline=17;md5=c19b30548c582577fc6b443626fc1216"
-
-SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
-           file://run-ptest \
-           file://avoid_parallel_tests.patch \
-           "
-
-SRC_URI[md5sum] = "5b55f7cd76e901dfc2738ac22cab96ca"
-SRC_URI[sha256sum] = "f84226db8dd18afaf91d8d00f5cb8f87ec3d7f787d2a3605de08d6dfa95ab8ef"
-
-inherit autotools ptest
-RDEPENDS_${PN}-ptest += "make"
-
-do_compile_ptest() {
-   oe_runmake buildtest-TESTS
-}
-
-do_install_ptest () {
-   cp ${B}/Makefile                 ${D}${PTEST_PATH}
-   install ${B}/test-cmdline        ${D}${PTEST_PATH}
-   install ${B}/test-features       ${D}${PTEST_PATH}
-   install ${B}/ethtool             ${D}${PTEST_PATH}/ethtool
-   sed -i 's/^Makefile/_Makefile/'  ${D}${PTEST_PATH}/Makefile
-}
diff --git a/meta/recipes-extended/ethtool/ethtool_4.5.bb b/meta/recipes-extended/ethtool/ethtool_4.5.bb
new file mode 100644
index 0000000..c47b30a
--- /dev/null
+++ b/meta/recipes-extended/ethtool/ethtool_4.5.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Display or change ethernet card settings"
+DESCRIPTION = "A small utility for examining and tuning the settings of your ethernet-based network interfaces."
+HOMEPAGE = "http://www.kernel.org/pub/software/network/ethtool/"
+SECTION = "console/network"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://ethtool.c;beginline=4;endline=17;md5=c19b30548c582577fc6b443626fc1216"
+
+SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
+           file://run-ptest \
+           file://avoid_parallel_tests.patch \
+           "
+
+SRC_URI[md5sum] = "10038f417db89a1508584d5c375f79bb"
+SRC_URI[sha256sum] = "3b1e69d4de3322e2fe2b1e90befaf2c1ea886469d43ba73af3da36be5e2cc5e7"
+
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
2.4.0


