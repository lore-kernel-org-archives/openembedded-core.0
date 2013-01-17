Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TvrAe-0001Nu-GU
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 16:14:26 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2013 06:58:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,486,1355126400"; d="scan'208";a="192236321"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jan 2013 06:58:56 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2013 16:58:46 +0200
Message-Id: <635d56cf346eb517d83b8f02c860d8539d8de57d.1358432402.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1358432402.git.laurentiu.palcu@intel.com>
References: <cover.1358432402.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1358432402.git.laurentiu.palcu@intel.com>
References: <cover.1358432402.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/6] module.bbclass: do not use update-modules anymore
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
X-List-Received-Date: Thu, 17 Jan 2013 15:14:28 -0000

update-modules is obsolete. The bbclass was updated not to use it
anymore.

[YOCTO #3598]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/module.bbclass |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index ebb0880..d477caa 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -1,4 +1,4 @@
-RDEPENDS_${PN} += "kernel-image ${@oe.utils.contains('DISTRO_FEATURES', 'update-modules', 'update-modules', '', d)}"
+RDEPENDS_${PN} += "kernel-image"
 DEPENDS += "virtual/kernel"
 
 inherit module-base
@@ -27,13 +27,18 @@ module_do_install() {
 
 pkg_postinst_append () {
 if [ -z "$D" ]; then
-	depmod -a
-	update-modules || true
+	depmod -a ${KERNEL_VERSION}
+else
+	depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
 fi
 }
 
 pkg_postrm_append () {
-update-modules || true
+if [ -z "$D" ]; then
+	depmod -a ${KERNEL_VERSION}
+else
+	depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
+fi
 }
 
 EXPORT_FUNCTIONS do_compile do_install
-- 
1.7.9.5



