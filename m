Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 611B5731D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:24:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jan 2016 03:24:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,354,1449561600"; d="scan'208";a="869740561"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.8.138])
	by orsmga001.jf.intel.com with ESMTP; 27 Jan 2016 03:24:17 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 11:23:59 +0000
Message-Id: <0816b3bfc4d8b544f7701def0b4d92cf92a06946.1453893763.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453893763.git.joshua.g.lock@intel.com>
References: <cover.1453893763.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1453893763.git.joshua.g.lock@intel.com>
References: <cover.1453893763.git.joshua.g.lock@intel.com>
Subject: [PATCH v5 1/2] connman-conf: convert to systemd oneshot
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
X-List-Received-Date: Wed, 27 Jan 2016 11:24:20 -0000

From: Joshua Lock <joshua.lock@collabora.co.uk>

Install a oneshot unit file that is started before ConnMan to
configure a wired network inteface with the wired-setup script,
rather than requiring this script to be manually run some how.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-connectivity/connman/connman-conf.bb            | 12 +++++++++++-
 .../connman/connman-conf/qemuall/wired-connection.service    | 10 ++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service

diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index 9254ed7..9a519ec 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -4,8 +4,11 @@ network interface for a qemu machine."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
+inherit systemd
+
 SRC_URI_append_qemuall = " file://wired.config \
                            file://wired-setup \
+                           file://wired-connection.service \
 "
 PR = "r2"
 
@@ -17,10 +20,17 @@ FILES_${PN} = "${localstatedir}/* ${datadir}/*"
 
 do_install() {
     #Configure Wired network interface in case of qemu* machines
-    if test -e ${WORKDIR}/wired.config && test -e ${WORKDIR}/wired-setup; then
+    if test -e ${WORKDIR}/wired.config &&
+       test -e ${WORKDIR}/wired-setup &&
+       test -e ${WORKDIR}/wired-connection.service; then
         install -d ${D}${localstatedir}/lib/connman
         install -m 0644 ${WORKDIR}/wired.config ${D}${localstatedir}/lib/connman
         install -d ${D}${datadir}/connman
         install -m 0755 ${WORKDIR}/wired-setup ${D}${datadir}/connman
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${WORKDIR}/wired-connection.service ${D}${systemd_system_unitdir}
+        sed -i -e 's|@SCRIPTDIR@|${datadir}/connman|g' ${D}${systemd_system_unitdir}/wired-connection.service
     fi
 }
+
+SYSTEMD_SERVICE_${PN}_qemuall = "wired-connection.service"
diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service
new file mode 100644
index 0000000..48adfc0
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Setup a wired interface
+Before=connman.service
+
+[Service]
+Type=oneshot
+ExecStart=@SCRIPTDIR@/wired-setup
+
+[Install]
+WantedBy=network.target
-- 
2.5.0


