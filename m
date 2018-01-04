Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3057D785E0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 12:13:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 04:13:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,507,1508828400"; 
   d="scan'208";a="8420303"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 04 Jan 2018 04:13:48 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jan 2018 14:13:45 +0200
Message-Id: <20180104121346.18976-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180104121346.18976-1-alexander.kanavin@linux.intel.com>
References: <20180104121346.18976-1-alexander.kanavin@linux.intel.com>
Subject: [PATCHv3 2/3] testimage.bbclass: add ptest to the list of runtime tests whenever possible
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
X-List-Received-Date: Thu, 04 Jan 2018 12:13:48 -0000

If no ptest packages are installed in the image, the test does nothing;
if ptest packages are installed in the image, then they should be
run without user having to enable that manually.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/testimage.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 7260ad4517a..3acccbb8fdb 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -44,16 +44,16 @@ DEVTESTSUITE = "gcc kernelmodule ldd"
 DEFAULT_TEST_SUITES = "${MINTESTSUITE} auto"
 DEFAULT_TEST_SUITES_pn-core-image-minimal = "${MINTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-minimal-dev = "${MINTESTSUITE}"
-DEFAULT_TEST_SUITES_pn-core-image-full-cmdline = "${NETTESTSUITE} perl python logrotate"
+DEFAULT_TEST_SUITES_pn-core-image-full-cmdline = "${NETTESTSUITE} perl python logrotate ptest"
 DEFAULT_TEST_SUITES_pn-core-image-x11 = "${MINTESTSUITE}"
-DEFAULT_TEST_SUITES_pn-core-image-lsb = "${NETTESTSUITE} pam parselogs ${RPMTESTSUITE}"
+DEFAULT_TEST_SUITES_pn-core-image-lsb = "${NETTESTSUITE} pam parselogs ${RPMTESTSUITE} ptest"
 DEFAULT_TEST_SUITES_pn-core-image-sato = "${NETTESTSUITE} connman xorg parselogs ${RPMTESTSUITE} \
-    ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '', d)}"
+    ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '', d)} ptest"
 DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE} buildcpio buildlzip buildgalculator \
-    connman ${DEVTESTSUITE} logrotate perl parselogs python ${RPMTESTSUITE} xorg"
-DEFAULT_TEST_SUITES_pn-core-image-lsb-dev = "${NETTESTSUITE} pam perl python parselogs ${RPMTESTSUITE}"
+    connman ${DEVTESTSUITE} logrotate perl parselogs python ${RPMTESTSUITE} xorg ptest"
+DEFAULT_TEST_SUITES_pn-core-image-lsb-dev = "${NETTESTSUITE} pam perl python parselogs ${RPMTESTSUITE} ptest"
 DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${NETTESTSUITE} buildcpio buildlzip buildgalculator \
-    connman ${DEVTESTSUITE} logrotate pam parselogs perl python ${RPMTESTSUITE}"
+    connman ${DEVTESTSUITE} logrotate pam parselogs perl python ${RPMTESTSUITE} ptest"
 DEFAULT_TEST_SUITES_pn-meta-toolchain = "auto"
 
 # aarch64 has no graphics
-- 
2.15.1


