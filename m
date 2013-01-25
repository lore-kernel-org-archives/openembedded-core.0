Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TyktD-0002CQ-Sd
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 16:08:24 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 25 Jan 2013 06:52:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,538,1355126400"; d="scan'208";a="195117873"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 25 Jan 2013 06:52:46 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 16:59:36 +0200
Message-Id: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Fri, 25 Jan 2013 15:08:24 -0000

this fixes a service dependency issue;
while graphical.target is the default mode, systemd
will try to start display-manager.service which is not
available.

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/conf/distro/include/default-distrovars.inc |    3 +++
 meta/recipes-core/systemd/systemd_196.bb        |    5 +++++
 2 files changed, 8 insertions(+)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index f073547..c21d9a3 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -22,6 +22,9 @@ DISTRO_FEATURES_LIBC_class-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
 DISTRO_FEATURES_INITMAN ?= "sysvinit"
 DISTRO_FEATURES ?= "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g x11 ${DISTRO_FEATURES_LIBC} ${DISTRO_FEATURES_INITMAN}"
 
+# "multi-user" vs "graphical"
+SYSTEMD_DEFAULT_TARGET ?= "multi-user"
+
 IMAGE_FEATURES ?= ""
 
 # This is a list of packages that are used by the build system to build the distribution, they are not
diff --git a/meta/recipes-core/systemd/systemd_196.bb b/meta/recipes-core/systemd/systemd_196.bb
index a78a8a6..4b97774 100644
--- a/meta/recipes-core/systemd/systemd_196.bb
+++ b/meta/recipes-core/systemd/systemd_196.bb
@@ -95,6 +95,11 @@ do_install() {
 	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
 
 	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+
+
+	if [ -n ${SYSTEMD_DEFAULT_TARGET} ]; then
+		ln -s ${systemd_unitdir}/system/${SYSTEMD_DEFAULT_TARGET}.target ${D}${sysconfdir}/systemd/system/default.target
+	fi
 }
 
 python populate_packages_prepend (){
-- 
1.7.9.5



