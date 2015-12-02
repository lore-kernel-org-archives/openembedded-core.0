Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 96A176E5CB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 11:04:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id CA0FB260302
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Dec 2015 11:03:52 +0000
Message-Id: <25ee66771dd3eca9e0e816e97f7c77c30012cbfa.1449054142.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <cover.1449006701.git.joshua.lock@collabora.co.uk>
References: <cover.1449006701.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1449054142.git.joshua.lock@collabora.co.uk>
References: <cover.1449054142.git.joshua.lock@collabora.co.uk>
Subject: [PATCH 1/3] connman-conf: convert to systemd oneshot
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
X-List-Received-Date: Wed, 02 Dec 2015 11:04:19 -0000

Install a oneshot unit file that is started before ConnMan to
configure a wired network inteface with the wired-setup script
rather than requiring this script to be manually run some how.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-connectivity/connman/connman-conf.bb              |  9 ++++++++-
 .../connman/connman-conf/qemuall/wired-connection.service      | 10 ++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service

diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index 9254ed7..bef9237 100644
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
 
@@ -17,10 +20,14 @@ FILES_${PN} = "${localstatedir}/* ${datadir}/*"
 
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
     fi
 }
diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service
new file mode 100644
index 0000000..f66d158a
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Setup wired interface on qemu machines
+Before=connman.service
+
+[Service]
+Type=oneshot
+ExecStart=/usr/lib/connman/wired-setup
+
+[Install]
+WantedBy=network.target
-- 
2.4.3


