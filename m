Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UHaYt-0003dz-19
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 14:57:20 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Mar 2013 06:37:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,865,1355126400"; d="scan'208";a="303818639"
Received: from unknown (HELO localhost.localdomain) ([10.237.72.58])
	by orsmga002.jf.intel.com with ESMTP; 18 Mar 2013 06:39:20 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2013 15:39:18 +0200
Message-Id: <1363613958-20200-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH] connman-conf: Initial systemd support
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
X-List-Received-Date: Mon, 18 Mar 2013 13:57:28 -0000
X-List-Received-Date: Mon, 18 Mar 2013 13:57:28 -0000

Create IPv4 address for ethernet in qemu image when systemd is
in use.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
Hi,

this patch will provision the ethernet IP address automatically
in qemu image when systemd is being used.

Cheers,
Jukka

 .../connman/connman-conf.bbappend                     | 19 +++++++++++++++++++
 .../connman/connman-conf/qemuall/connman-conf.service | 11 +++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-systemd/oe-core/recipes-connectivity/connman/connman-conf.bbappend
 create mode 100644 meta-systemd/oe-core/recipes-connectivity/connman/connman-conf/qemuall/connman-conf.service

diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman-conf.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman-conf.bbappend
new file mode 100644
index 0000000..6699355
--- /dev/null
+++ b/meta-systemd/oe-core/recipes-connectivity/connman/connman-conf.bbappend
@@ -0,0 +1,19 @@
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+SRC_URI_append_qemuall += " file://connman-conf.service "
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "connman-conf.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+FILES_${PN} += " connman-conf.service "
+
+do_install_append() {
+	install -d ${D}${nonarch_base_libdir}/systemd/system
+	install -m 0755 ${WORKDIR}/connman-conf.service ${D}${nonarch_base_libdir}/systemd/system
+}
+
+PACKAGES += " ${PN}-systemd"
diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman-conf/qemuall/connman-conf.service b/meta-systemd/oe-core/recipes-connectivity/connman/connman-conf/qemuall/connman-conf.service
new file mode 100644
index 0000000..5d3c2b4
--- /dev/null
+++ b/meta-systemd/oe-core/recipes-connectivity/connman/connman-conf/qemuall/connman-conf.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Setup IP address for wired interface
+After=syslog.target
+
+[Service]
+Type=simple
+ExecStart=-/usr/lib/connman/wired-setup
+StandardOutput=null
+
+[Install]
+WantedBy=connman.service
-- 
1.7.11.4



