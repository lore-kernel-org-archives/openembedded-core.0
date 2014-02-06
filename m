Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 343566CBB2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 13:43:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2014 05:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="479046679"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.123.186])
	by orsmga002.jf.intel.com with ESMTP; 06 Feb 2014 05:43:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 13:42:53 +0000
Message-Id: <1391694173-26080-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] iproute2: split out package for tc
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
X-List-Received-Date: Thu, 06 Feb 2014 13:43:13 -0000

tc (the IP traffic control utility) isn't often used and makes up a
reasonably large part of the iproute2 package as well as having a
runtime dependency on iptables, so split it out into its own package.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 3db21db..568aa5f 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -23,10 +23,13 @@ do_install () {
     rm ${D}/share -rf || true
 }
 
-# There are only .so files in iproute2
-INSANE_SKIP_${PN} = "dev-so"
+# The .so files in iproute2-tc are modules, not traditional libraries
+INSANE_SKIP_${PN}-tc = "dev-so"
+
+PACKAGES =+ "${PN}-tc"
+FILES_${PN}-tc = "${base_sbindir}/tc* \
+                  ${libdir}/tc/*.so"
 
-FILES_${PN} += "${libdir}/tc"
 FILES_${PN}-dbg += "${libdir}/tc/.debug"
 
 ALTERNATIVE_${PN} = "ip"
-- 
1.8.5.3


