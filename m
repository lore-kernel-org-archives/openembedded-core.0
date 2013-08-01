Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id C0A2A6B1F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 11:43:01 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r71Bgwhf031900; 
	Thu, 1 Aug 2013 06:43:00 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2013 16:43:19 +0500
Message-Id: <1375357402-10147-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/4] openssh: Add systemd support
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
X-List-Received-Date: Thu, 01 Aug 2013 11:43:02 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

-Remove dependency on meta-systemd

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../openssh/openssh-6.2p2/sshd.socket              |   11 ++++++++++
 .../openssh/openssh-6.2p2/sshd@.service            |    9 +++++++++
 .../openssh/openssh-6.2p2/sshdgenkeys.service      |   10 ++++++++++
 meta/recipes-connectivity/openssh/openssh_6.2p2.bb |   21 ++++++++++++++++++--
 4 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket
new file mode 100644
index 0000000..753a33b
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket
@@ -0,0 +1,11 @@
+[Unit]
+Conflicts=sshd.service
+
+[Socket]
+ExecStartPre=/bin/mkdir -p /var/run/sshd
+ListenStream=22
+Accept=yes
+
+[Install]
+WantedBy=sockets.target
+Also=sshdgenkeys.service
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service
new file mode 100644
index 0000000..d118490
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=OpenSSH Per-Connection Daemon
+After=sshdgenkeys.service
+
+[Service]
+ExecStart=-/usr/sbin/sshd -i
+ExecReload=/bin/kill -HUP $MAINPID
+StandardInput=socket
+StandardError=syslog
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.service
new file mode 100644
index 0000000..c717214
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=SSH Key Generation
+
+[Service]
+ExecStart=/usr/bin/ssh-keygen -A
+Type=oneshot
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
index ab2eefb..0821190 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
@@ -26,14 +26,17 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://init \
            file://openssh-CVE-2011-4327.patch \
            file://mac.patch \
-           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://sshd.socket \
+           file://sshd@.service \
+           file://sshdgenkeys.service "
 
 PAM_SRC_URI = "file://sshd"
 
 SRC_URI[md5sum] = "be46174dcbb77ebb4ea88ef140685de1"
 SRC_URI[sha256sum] = "7f29b9d2ad672ae0f9e1dcbff871fc5c2e60a194e90c766432e32161b842313b"
 
-inherit useradd update-rc.d update-alternatives
+inherit useradd update-rc.d update-alternatives systemd
 
 USERADD_PACKAGES = "${PN}-sshd"
 USERADD_PARAM_${PN}-sshd = "--system --no-create-home --home-dir /var/run/sshd --shell /bin/false --user-group sshd"
@@ -41,6 +44,10 @@ INITSCRIPT_PACKAGES = "${PN}-sshd"
 INITSCRIPT_NAME_${PN}-sshd = "sshd"
 INITSCRIPT_PARAMS_${PN}-sshd = "defaults 9"
 
+SYSTEMD_PACKAGES = "${PN}-sshd"
+SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
+SYSTEMD_AUTO_ENABLE = "enable"
+
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,,tcp-wrappers"
 
@@ -86,6 +93,15 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
 	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
 	rmdir ${D}${localstatedir}/run/sshd ${D}${localstatedir}/run ${D}${localstatedir}
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/system
+    sed -i 's,/bin,${base_bindir},g' ${D}${systemd_unitdir}/system/sshd.socket
+    sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${systemd_unitdir}/system/sshd@.service
+    sed -i 's,/bin,${base_bindir},g' ${D}${systemd_unitdir}/system/sshd@.service
+    sed -i 's,/usr/bin/,${bindir}/,g' ${D}${systemd_unitdir}/system/sshdgenkeys.service
 }
 
 ALLOW_EMPTY_${PN} = "1"
@@ -95,6 +111,7 @@ FILES_${PN}-scp = "${bindir}/scp.${BPN}"
 FILES_${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
 FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd"
 FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config"
+FILES_${PN}-sshd += "${systemd_unitdir}"
 FILES_${PN}-sftp = "${bindir}/sftp"
 FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
 FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
-- 
1.7.9.5


