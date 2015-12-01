Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DABFD6011F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 12:28:50 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 01 Dec 2015 04:28:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,368,1444719600"; d="scan'208";a="697839139"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 01 Dec 2015 04:28:33 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 0F4D56A4087
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 04:27:24 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Dec 2015 09:40:47 +0200
Message-Id: <1448955647-31680-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2] iproute2: enable previously unselected utilities
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
X-List-Received-Date: Tue, 01 Dec 2015 12:28:51 -0000

Include below listed utilities that are not yet enabled/packaged
in the iproute2 recipe:

lnstat
ifstat
genl
rtacct
nstat
ss

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 29f9062..ca7ea92 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native iptables elfutils"
 
 inherit update-alternatives
 
-EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
+EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip misc genl' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
 
 do_configure_append () {
     sh configure ${STAGING_INCDIR}
@@ -32,9 +32,15 @@ do_install () {
 # The .so files in iproute2-tc are modules, not traditional libraries
 INSANE_SKIP_${PN}-tc = "dev-so"
 
-PACKAGES =+ "${PN}-tc"
+PACKAGES =+ "${PN}-tc ${PN}-lnstat ${PN}-ifstat ${PN}-genl ${PN}-rtacct ${PN}-nstat ${PN}-ss"
 FILES_${PN}-tc = "${base_sbindir}/tc* \
                   ${libdir}/tc/*.so"
+FILES_${PN}-lnstat = "${base_sbindir}/lnstat ${base_sbindir}/ctstat ${base_sbindir}/rtstat"
+FILES_${PN}-ifstat = "${base_sbindir}/ifstat"
+FILES_${PN}-genl = "${base_sbindir}/genl"
+FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
+FILES_${PN}-nstat = "${base_sbindir}/nstat"
+FILES_${PN}-ss = "${base_sbindir}/ss"
 
 FILES_${PN}-dbg += "${libdir}/tc/.debug"
 
-- 
2.4.0


