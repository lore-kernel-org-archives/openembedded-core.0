Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QyJRm-0003V2-4v
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 10:13:26 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Aug 2011 01:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="43280577"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga002.jf.intel.com with ESMTP; 30 Aug 2011 01:08:31 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2011 16:05:01 +0800
Message-Id: <d241a9acdd1578fb711d6d7c113cc51eb1bea74c.1314691314.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1314691314.git.edwin.zhai@intel.com>
References: <cover.1314691314.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1314691314.git.edwin.zhai@intel.com>
References: <cover.1314691314.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] shadow: Fix rpm failed dependencies when install
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
X-List-Received-Date: Tue, 30 Aug 2011 08:13:26 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

There are some links become invalid after rename, so that failed dependencies
detected when install rpm package. This commit update links to resolve it.

[YOCTO #1158] got fixed.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index 70d4cbb..e34895e 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
 
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-${PV}.tar.bz2 \
            file://login_defs_pam.sed \
@@ -97,6 +97,11 @@ do_install_append() {
 	mv ${D}${sbindir}/vipw ${D}${base_sbindir}/vipw.${PN}
 	mv ${D}${bindir}/login ${D}${base_bindir}/login.${PN}
 
+	# Handle link properly after rename, otherwise missing files would
+	# lead rpm failed dependencies.
+	ln -sf vipw.${PN} ${D}${base_sbindir}/vigr.${PN}
+	ln -sf newgrp.${PN} ${D}${bindir}/sg
+
 	# Ensure we add a suitable securetty file to the package that has
 	# most common embedded TTYs defined.
 	if [ ! -z "${SERIAL_CONSOLE}" ]; then
-- 
1.7.1



