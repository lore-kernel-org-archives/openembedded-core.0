Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 60C2C73196
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 17:59:26 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 17 Feb 2016 09:59:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,461,1449561600"; d="scan'208";a="49610331"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2016 09:59:06 -0800
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 09:55:39 +0000
Message-Id: <1455702940-5840-2-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1455702940-5840-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1455702940-5840-1-git-send-email-alejandro.franco@linux.intel.com>
Subject: [PATCH 1/2] testimage: add DEFAULT_TEST_SUITES for more images
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
X-List-Received-Date: Wed, 17 Feb 2016 17:59:29 -0000

Add these generic variables, to reuse test suite lists in more
specific default test suites variables for actual images:

DEFAULT_TEST_SUITES_minimal
DEFAULT_TEST_SUITES_network
DEFAULT_TEST_SUITES_dev

Add these default test suites variables:

DEFAULT_TEST_SUITES_pn-core-image-minimal-dev
DEFAULT_TEST_SUITES_pn-core-image-full-cmdline
DEFAULT_TEST_SUITES_pn-core-image-x11
DEFAULT_TEST_SUITES_pn-core-image-lsb

[YOCTO #8410]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/classes/testimage.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index eed27be..cce8cea 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -33,9 +33,17 @@ TEST_EXPORT_DIR ?= "${TMPDIR}/testimage/${PN}"
 TEST_EXPORT_ONLY ?= "0"
 
 RPMTESTSUITE = "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'smart rpm', '', d)}"
+MINTESTSUITE = "ping"
+NETTESTSUITE = "${MINTESTSUITE} ssh df date scp syslog"
+DEVTESTSUITE = "gcc kernelmodule ldd"
 
 DEFAULT_TEST_SUITES = "ping auto"
 DEFAULT_TEST_SUITES_pn-core-image-minimal = "ping"
+DEFAULT_TEST_SUITES_pn-core-image-minimal-dev = "${MINTESTSUITE}"
+DEFAULT_TEST_SUITES_pn-core-image-full-cmdline = "${NETTESTSUITE} perl python logrotate"
+DEFAULT_TEST_SUITES_pn-core-image-x11 = "${MINTESTSUITE}"
+DEFAULT_TEST_SUITES_pn-core-image-lsb = "${NETTESTSUITE} buildcvs buildiptables buildsudoku \
+    connman pam parselogs ${RPMTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh df connman syslog xorg scp date parselogs ${RPMTESTSUITE} \
     ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '', d)}"
 DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman syslog xorg scp date perl ldd gcc kernelmodule python parselogs ${RPMTESTSUITE}"
-- 
2.6.2


