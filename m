Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TvrAd-0001Nx-5H
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 16:14:23 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2013 06:58:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,486,1355126400"; d="scan'208";a="192236302"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jan 2013 06:58:54 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2013 16:58:44 +0200
Message-Id: <74304c741e2c87aa94d2badcc5f52dca46dfc218.1358432402.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1358432402.git.laurentiu.palcu@intel.com>
References: <cover.1358432402.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1358432402.git.laurentiu.palcu@intel.com>
References: <cover.1358432402.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/6] orinoco-conf: remove dependencies of update-modules
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 15:14:24 -0000

Since update-modules became obsolete, no need for these dependencies.
Also:
 * install the conf files in the modprobe.d directory. /etc/modutils is
   also obsolete;
 * remove postinst/postrm scriptlets since they ran update-modules and
   this is just an alias file;

[YOCTO #3598]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-bsp/orinoco/orinoco-conf_1.0.bb |   17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-bsp/orinoco/orinoco-conf_1.0.bb b/meta/recipes-bsp/orinoco/orinoco-conf_1.0.bb
index 57e746b..4be9277 100644
--- a/meta/recipes-bsp/orinoco/orinoco-conf_1.0.bb
+++ b/meta/recipes-bsp/orinoco/orinoco-conf_1.0.bb
@@ -2,8 +2,7 @@ DESCRIPTION = "PCMCIA-cs configuration files for Hermes (Orinoco) wireless LAN c
 SECTION = "kernel/modules"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
-RDEPENDS_${PN} = "update-modules"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "file://orinoco_cs.conf \
            file://COPYING.patch"
@@ -11,17 +10,7 @@ SRC_URI = "file://orinoco_cs.conf \
 inherit allarch
 
 do_install() {
-        install -d ${D}${sysconfdir}/modutils
-        install -m 0644 ${WORKDIR}/orinoco_cs.conf ${D}${sysconfdir}/modutils/
+        install -d ${D}${sysconfdir}/modprobe.d
+        install -m 0644 ${WORKDIR}/orinoco_cs.conf ${D}${sysconfdir}/modprobe.d/
 }
 
-pkg_postinst_${PN} () {
-	if [ -n "$D" ]; then
-		exit 1
-	fi
-	update-modules || true
-}
-
-pkg_postrm_${PN} () {
-	update-modules || true
-}
-- 
1.7.9.5



