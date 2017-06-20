Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA89719E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 08:35:45 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 20 Jun 2017 01:35:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="116518001"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 20 Jun 2017 01:35:44 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 207D15804B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 01:35:43 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 11:35:40 +0300
Message-Id: <1497947740-25438-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] connman: fix build-time warning with sysvinit
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
X-List-Received-Date: Tue, 20 Jun 2017 08:35:47 -0000

Due to recent modifications related to systemd, sysvinit builds began
to show this warning:

WARNING: connman-1.34-r0 do_package: connman: NOT adding alternative
provide /etc/resolv.conf: /etc/resolv-conf.connman does not exist

Fix this warning by making those updates specific to systemd.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index ab18f2f..7e05c80 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -70,9 +70,9 @@ SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
 SYSTEMD_SERVICE_${PN}-wait-online = "connman-wait-online.service"
 
 ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE_${PN} ="resolv-conf"
-ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.connman"
-ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
+ALTERNATIVE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','resolv-conf','',d)}"
+ALTERNATIVE_TARGET[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv-conf.connman','',d)}"
+ALTERNATIVE_LINK_NAME[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv.conf','',d)}"
 
 do_install_append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
-- 
2.4.0


