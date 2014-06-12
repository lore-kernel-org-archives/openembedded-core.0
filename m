Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 98C6565FE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 05:56:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2014 22:51:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,462,1400050800"; d="scan'208";a="556147338"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by orsmga002.jf.intel.com with ESMTP; 11 Jun 2014 22:56:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jun 2014 22:56:22 -0700
Message-Id: <42525d5c0b5a5db2078bda118ce09c830f9f3ad7.1402552609.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
Subject: [RFC - WIP v2 03/10] alsa-state: convert to use conf-files
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
X-List-Received-Date: Thu, 12 Jun 2014 05:56:35 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/alsa-state/alsa-state.bb                        | 9 +++------
 .../{alsa-state/alsa-state => conf-files/conf-files}/asound.conf | 0
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-bsp/{alsa-state/alsa-state => conf-files/conf-files}/asound.conf (100%)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index 874d6bb..029967c 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -13,12 +13,11 @@ PV = "0.2.0"
 PR = "r5"
 
 SRC_URI = "\
-  file://asound.conf \
   file://asound.state \
   file://alsa-state-init \
 "
 
-inherit update-rc.d
+inherit update-rc.d conf-files
 
 INITSCRIPT_NAME = "alsa-state"
 INITSCRIPT_PARAMS = "start 39 S . stop 31 0 6 ."
@@ -29,17 +28,15 @@ do_install() {
     install -m 0755 ${WORKDIR}/alsa-state-init ${D}${sysconfdir}/init.d/alsa-state
 
     install -d ${D}/${localstatedir}/lib/alsa
-    install -m 0644 ${WORKDIR}/asound.conf ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/*.state ${D}${localstatedir}/lib/alsa
 }
 
 PACKAGES += "alsa-states"
 
-RRECOMMENDS_alsa-state = "alsa-states"
+RRECOMMENDS_${PN} = "alsa-states"
 
 RDEPENDS_${PN} = "alsa-utils-alsactl"
-FILES_${PN} = "${sysconfdir}/init.d ${sysconfdir}/asound.conf"
-CONFFILES_${PN} = "${sysconfdir}/asound.conf"
+FILES_${PN} = "${sysconfdir}/init.d"
 
 FILES_alsa-states = "${localstatedir}/lib/alsa/*.state"
 
diff --git a/meta/recipes-bsp/alsa-state/alsa-state/asound.conf b/meta/recipes-bsp/conf-files/conf-files/asound.conf
similarity index 100%
rename from meta/recipes-bsp/alsa-state/alsa-state/asound.conf
rename to meta/recipes-bsp/conf-files/conf-files/asound.conf
-- 
1.8.3.2


