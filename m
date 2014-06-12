Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8491665E62
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 05:56:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2014 22:51:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,462,1400050800"; d="scan'208";a="556147331"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by orsmga002.jf.intel.com with ESMTP; 11 Jun 2014 22:56:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jun 2014 22:56:21 -0700
Message-Id: <9d956d438906cf24a820ef9403622414e5cfca9c.1402552609.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
Subject: [RFC - WIP v2 02/10] apmd: convert to use conf-files
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
X-List-Received-Date: Thu, 12 Jun 2014 05:56:34 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/apmd/apmd_3.2.2-14.bb                               | 5 +----
 .../{apmd/apmd-3.2.2-14 => conf-files/conf-files}/apmd_proxy.conf    | 0
 2 files changed, 1 insertion(+), 4 deletions(-)
 rename meta/recipes-bsp/{apmd/apmd-3.2.2-14 => conf-files/conf-files}/apmd_proxy.conf (100%)

diff --git a/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb b/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
index ab7de65..b0d6f10 100644
--- a/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
+++ b/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
@@ -17,7 +17,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apmd/apmd_3.2.2.orig.tar.gz;name=tarball \
            file://init \
            file://default \
            file://apmd_proxy \
-           file://apmd_proxy.conf \
            file://apmd.service"
 
 SRC_URI[tarball.md5sum] = "b1e6309e8331e0f4e6efd311c2d97fa8"
@@ -28,7 +27,7 @@ SRC_URI[patch.sha256sum] = "7905ff96be93d725544d0040e425c42f9c05580db3c272f11cff
 
 S = "${WORKDIR}/apmd-3.2.2.orig"
 
-inherit update-rc.d systemd
+inherit update-rc.d systemd conf-files
 
 INITSCRIPT_NAME = "apmd"
 INITSCRIPT_PARAMS = "defaults"
@@ -54,13 +53,11 @@ do_install() {
 	install -d ${D}${sbindir}
 	install -d ${D}${bindir}
 	install -d ${D}${libdir}
-	install -d ${D}${datadir}/apmd
 	install -d ${D}${includedir}
 
 	install -m 4755 ${S}/.libs/apm ${D}${bindir}/apm
 	install -m 0755 ${S}/.libs/apmd ${D}${sbindir}/apmd
 	install -m 0755 ${WORKDIR}/apmd_proxy ${D}${sysconfdir}/apm/
-	install -m 0644 ${WORKDIR}/apmd_proxy.conf ${D}${datadir}/apmd/
 	install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/apmd
 	oe_libinstall -so libapm ${D}${libdir}
 	install -m 0644 apm.h ${D}${includedir}
diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd_proxy.conf b/meta/recipes-bsp/conf-files/conf-files/apmd_proxy.conf
similarity index 100%
rename from meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd_proxy.conf
rename to meta/recipes-bsp/conf-files/conf-files/apmd_proxy.conf
-- 
1.8.3.2


