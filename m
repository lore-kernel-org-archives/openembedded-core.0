Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 17E2F7724C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 17:17:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 23 Feb 2016 09:17:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,490,1449561600"; d="scan'208";a="657971336"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2016 09:17:30 -0800
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Feb 2016 09:14:28 +0000
Message-Id: <1456218868-36139-3-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1456218868-36139-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1456218868-36139-1-git-send-email-alejandro.franco@linux.intel.com>
Subject: [PATCHv2 2/2] testimage.bbclass: reuse generic test suites
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
X-List-Received-Date: Tue, 23 Feb 2016 17:17:50 -0000

Modify existing default test suites to reuse the new
generic test suites.

Related to [YOCTO #8410]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/classes/testimage.bbclass | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 791cce3..e77bb11 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -37,17 +37,19 @@ MINTESTSUITE = "ping"
 NETTESTSUITE = "${MINTESTSUITE} ssh df date scp syslog"
 DEVTESTSUITE = "gcc kernelmodule ldd"
 
-DEFAULT_TEST_SUITES = "ping auto"
-DEFAULT_TEST_SUITES_pn-core-image-minimal = "ping"
+DEFAULT_TEST_SUITES = "${MINTESTSUITE} auto"
+DEFAULT_TEST_SUITES_pn-core-image-minimal = "${MINTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-minimal-dev = "${MINTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-full-cmdline = "${NETTESTSUITE} perl python logrotate"
 DEFAULT_TEST_SUITES_pn-core-image-x11 = "${MINTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-lsb = "${NETTESTSUITE} pam parselogs ${RPMTESTSUITE}"
-DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh df connman syslog xorg scp date parselogs ${RPMTESTSUITE} \
+DEFAULT_TEST_SUITES_pn-core-image-sato = "${NETTESTSUITE} connman xorg parselogs ${RPMTESTSUITE} \
     ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '', d)}"
-DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman syslog xorg scp date perl ldd gcc kernelmodule python parselogs ${RPMTESTSUITE}"
+DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE} connman xorg perl python \
+    ${DEVTESTSUITE} parselogs ${RPMTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-lsb-dev = "${NETTESTSUITE} pam perl python parselogs ${RPMTESTSUITE}"
-DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "ping buildcvs buildiptables buildsudoku connman date df gcc kernelmodule ldd pam parselogs perl python scp ${RPMTESTSUITE} ssh syslog logrotate"
+DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${NETTESTSUITE} buildcvs buildiptables buildsudoku \
+    connman ${DEVTESTSUITE} pam perl python parselogs ${RPMTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-meta-toolchain = "auto"
 
 # aarch64 has no graphics
-- 
2.6.2


