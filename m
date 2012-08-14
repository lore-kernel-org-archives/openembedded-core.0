Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCT-0000Ym-Nr
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:23 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181311"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:12 +0300
Message-Id: <0c3c4faf84437859bcadc054ec72dec99c0adf24.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 25/64] shadow: cleanup update-alternatives deprecated code
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Aug 2012 12:26:24 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb |   18 ++++++------------
 1 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index de10f64..6794cc1 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
 
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "shadow-securetty ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
-PR = "r11"
+PR = "r12"
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://login_defs_pam.sed \
@@ -105,17 +105,11 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "200"
 
-bindir_progs = "passwd chfn newgrp chsh groups"
-ALTERNATIVE_LINKS += "${bindir}/${@' ${bindir}/'.join((d.getVar('bindir_progs', True)).split())}"
-
-sbindir_progs = "chpasswd"
-ALTERNATIVE_LINKS += "${sbindir}/${@' ${sbindir}/'.join((d.getVar('sbindir_progs', True)).split())}"
-
-base_bindir_progs = "login"
-ALTERNATIVE_LINKS += "${base_bindir}/${@' ${base_bindir}/'.join((d.getVar('base_bindir_progs', True)).split())}"
-
-base_sbindir_progs = "vipw vigr"
-ALTERNATIVE_LINKS += "${base_sbindir}/${@' ${base_sbindir}/'.join((d.getVar('base_sbindir_progs', True)).split())}"
+ALTERNATIVE_${PN} = "passwd chfn newgrp chsh groups chpasswd login vipw vigr"
+ALTERNATIVE_LINK_NAME[chpasswd] = "${sbindir}/chpasswd"
+ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
+ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
+ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
 
 pkg_postinst_${PN} () {
 	if [ "x$D" != "x" ]; then
-- 
1.7.7.6



