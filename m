Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B288A66099
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 05:56:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2014 22:51:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,462,1400050800"; d="scan'208";a="556147345"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by orsmga002.jf.intel.com with ESMTP; 11 Jun 2014 22:56:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jun 2014 22:56:24 -0700
Message-Id: <471e58fa059977b822bda1337139dfe80802fb08.1402552609.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
Subject: [RFC - WIP v2 05/10] connman: convert to use conf-files
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
 .../conf-files/conf-files}/qemuall/wired-setup     |  0
 .../conf-files/conf-files}/qemuall/wired.config    |  0
 meta/recipes-connectivity/connman/connman-conf.bb  | 24 ----------------------
 meta/recipes-connectivity/connman/connman.inc      |  2 +-
 meta/recipes-connectivity/connman/connman_1.23.bb  |  2 +-
 5 files changed, 2 insertions(+), 26 deletions(-)
 rename meta/{recipes-connectivity/connman/connman-conf => recipes-bsp/conf-files/conf-files}/qemuall/wired-setup (100%)
 rename meta/{recipes-connectivity/connman/connman-conf => recipes-bsp/conf-files/conf-files}/qemuall/wired.config (100%)
 delete mode 100644 meta/recipes-connectivity/connman/connman-conf.bb

diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup b/meta/recipes-bsp/conf-files/conf-files/qemuall/wired-setup
similarity index 100%
rename from meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
rename to meta/recipes-bsp/conf-files/conf-files/qemuall/wired-setup
diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config b/meta/recipes-bsp/conf-files/conf-files/qemuall/wired.config
similarity index 100%
rename from meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config
rename to meta/recipes-bsp/conf-files/conf-files/qemuall/wired.config
diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
deleted file mode 100644
index af72640..0000000
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Connman config to setup wired interface on qemu machines"
-DESCRIPTION = "This is the ConnMan configuration to set up a Wired \
-network interface for a qemu machine."
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
-
-SRC_URI_append_qemuall = "file://wired.config \
-                          file://wired-setup \
-                         "
-PR = "r2"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-FILES_${PN} = "${localstatedir}/* ${libdir}/*"
-
-do_install() {
-    #Configure Wired network interface in case of qemu* machines
-    if test -e ${WORKDIR}/wired.config && test -e ${WORKDIR}/wired-setup; then
-        install -d ${D}${localstatedir}/lib/connman
-        install -m 0644 ${WORKDIR}/wired.config ${D}${localstatedir}/lib/connman
-        install -d ${D}${libdir}/connman
-        install -m 0755 ${WORKDIR}/wired-setup ${D}${libdir}/connman
-    fi
-}
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index f121a81..e5a6109 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -66,7 +66,7 @@ SYSTEMD_SERVICE_${PN} = "connman.service"
 SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
 SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
 
-inherit autotools-brokensep pkgconfig systemd update-rc.d
+inherit autotools-brokensep pkgconfig systemd update-rc.d conf-files
 
 do_configure_append () {
 	sed -i "s#ExecStart=#${SYSTEMD_WIRED_SETUP}\nExecStart=#" ${S}/src/connman.service
diff --git a/meta/recipes-connectivity/connman/connman_1.23.bb b/meta/recipes-connectivity/connman/connman_1.23.bb
index 43501af..dd21f6d 100644
--- a/meta/recipes-connectivity/connman/connman_1.23.bb
+++ b/meta/recipes-connectivity/connman/connman_1.23.bb
@@ -8,4 +8,4 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
 SRC_URI[md5sum] = "f835b8137ab198e0af5deab043e2890a"
 SRC_URI[sha256sum] = "1dcac1d059d5303343e544fca0d0e76837cfb32f36e4a607a71c1b65ccf007c5"
 
-RRECOMMENDS_${PN} = "connman-conf"
+
-- 
1.8.3.2


