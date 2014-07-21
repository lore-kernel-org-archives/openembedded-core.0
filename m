Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 28A13705CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 10:03:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jul 2014 03:03:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,699,1400050800"; d="scan'208";a="572973868"
Received: from jrissane-mobl.ger.corp.intel.com ([10.237.67.153])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2014 03:03:12 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 13:03:10 +0300
Message-Id: <1405936990-10656-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] connman: Fix PPTP VPN plugin QA issue
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
X-List-Received-Date: Mon, 21 Jul 2014 10:03:36 -0000

Fixing this error by skipping dev-so QA check for
connman-plugin-vpn-pptp package.

ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: connman-plugin-vpn-pptp path '/work/core2-32-oe-linux/connman/1.24+gitAUTOINC+42779cd63c-r20.0/packages-split/connman-plugin-vpn-pptp/usr/lib/connman/scripts/libppp-plugin.so' [dev-so]
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
Hi,

just upgraded to head 4d2ac6f6df2b3ef98699dd4f7afadb2d994222bb in master and started
to see this QA error. Adding proper INSANE_SKIP seem to fix it. Just wondered why
I am seeing this now but not earlier.


Cheers,
Jukka


 meta/recipes-connectivity/connman/connman.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index f121a81..3e9d027 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -211,5 +211,6 @@ DESCRIPTION_${PN}-plugin-vpn-pptp = "The ConnMan PPTP plugin uses pptp-linux cli
 to create a VPN connection to PPTP server."
 FILES_${PN}-plugin-vpn-pptp += "${libdir}/connman/scripts/libppp-plugin.so* \
                                 ${libdir}/connman/plugins-vpn/pptp.so"
+INSANE_SKIP_${PN}-plugin-vpn-pptp += "dev-so"
 RDEPENDS_${PN}-plugin-vpn-pptp += "${PN}-vpn"
 RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG','pptp','${PN}-plugin-vpn-pptp', '', d)}"
-- 
1.8.3.1


