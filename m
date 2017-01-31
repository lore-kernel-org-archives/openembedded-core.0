Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 39FA3731CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 20:49:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jan 2017 12:49:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,316,1477983600"; d="scan'208";a="37939480"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.122])
	by orsmga002.jf.intel.com with ESMTP; 31 Jan 2017 12:49:50 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 14:52:53 -0600
Message-Id: <1485895975-7611-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1485895975-7611-1-git-send-email-anibal.limon@linux.intel.com>
References: <1485895975-7611-1-git-send-email-anibal.limon@linux.intel.com>
Subject: [PATCH 2/4] testimage.bbclass: Add missing suites on some sato images, dependency of createrepo and DL_DIR update
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
X-List-Received-Date: Tue, 31 Jan 2017 20:49:50 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

There are some missing suites on sato-sdk and lsb-sdk images so add it.

The createrepo-native needs to be built before run testimage in
order to create a repository from install packages.

The DL_DIR data also needs to be updated from the current bitbake
environment instead of use the value from testdata file.

[YOCTO #10964]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 47bccbc..7495fe1 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -49,11 +49,11 @@ DEFAULT_TEST_SUITES_pn-core-image-x11 = "${MINTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-lsb = "${NETTESTSUITE} pam parselogs ${RPMTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-sato = "${NETTESTSUITE} connman xorg parselogs ${RPMTESTSUITE} \
     ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '', d)}"
-DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE} connman xorg perl python \
-    ${DEVTESTSUITE} parselogs ${RPMTESTSUITE}"
+DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE} buildcvs buildiptables buildgalculator \
+    connman ${DEVTESTSUITE} logrotate perl parselogs python ${RPMTESTSUITE} xorg"
 DEFAULT_TEST_SUITES_pn-core-image-lsb-dev = "${NETTESTSUITE} pam perl python parselogs ${RPMTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${NETTESTSUITE} buildcvs buildiptables buildgalculator \
-    connman ${DEVTESTSUITE} pam perl python parselogs ${RPMTESTSUITE}"
+    connman ${DEVTESTSUITE} logrotate pam parselogs perl python ${RPMTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-meta-toolchain = "auto"
 
 # aarch64 has no graphics
@@ -79,13 +79,14 @@ TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python-smartp
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'ipk', 'opkg-utils-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'deb', 'apt-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python-smartpm-native:do_populate_sysroot', '', d)}"
+TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'createrepo-native:do_populate_sysroot', '', d)}"
 
 TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
 TESTIMAGELOCK_qemuall = ""
 
 TESTIMAGE_DUMP_DIR ?= "/tmp/oe-saved-tests/"
 
-TESTIMAGE_UPDATE_VARS ?= "WORKDIR DEPLOY_DIR"
+TESTIMAGE_UPDATE_VARS ?= "DL_DIR WORKDIR DEPLOY_DIR"
 
 testimage_dump_target () {
     top -bn1
-- 
2.1.4


