Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 457A76057A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 10:07:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 06 Oct 2016 03:07:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,453,1473145200"; d="scan'208";a="1041080683"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.29.86])
	by orsmga001.jf.intel.com with ESMTP; 06 Oct 2016 03:07:02 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2016 11:06:54 +0100
Message-Id: <1475748414-11867-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] testimage: disable build tests for qemumips and qemumips64
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
X-List-Received-Date: Thu, 06 Oct 2016 10:07:03 -0000

It's not uncommon for qemumips[64] builds on the Yocto Project
autobuilder to fail during Sanity Tests after a very long timeout
period. This is due to the MIPS emulation in QEMU being slow and
some of the build tests taking a very long time on MIPS machines.

This patch works around this slowness by disabling the more
complex build tests for QEMU MIPS machines.

[YOCTO #10340]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/classes/testimage.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 5ddbecb..6b6781d 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -58,6 +58,12 @@ DEFAULT_TEST_SUITES_pn-meta-toolchain = "auto"
 # aarch64 has no graphics
 DEFAULT_TEST_SUITES_remove_aarch64 = "xorg"
 
+# qemumips is quite slow and has reached the timeout limit several times on the YP build cluster,
+# mitigate this by removing build tests for qemumips machines.
+MIPSREMOVE ??= "buildcvs buildiptables buildgalculator"
+DEFAULT_TEST_SUITES_remove_qemumips = "${MIPSREMOVE}"
+DEFAULT_TEST_SUITES_remove_qemumips64 = "${MIPSREMOVE}"
+
 TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
 
 TEST_QEMUBOOT_TIMEOUT ?= "1000"
-- 
2.7.4


