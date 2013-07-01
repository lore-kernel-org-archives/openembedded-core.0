Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 6BE306A45A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 13:45:18 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r61DjFQd007098; 
	Mon, 1 Jul 2013 08:45:17 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2013 18:45:25 +0500
Message-Id: <1372686325-12412-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] openssh: Enabling with systemd
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
X-List-Received-Date: Mon, 01 Jul 2013 13:45:18 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

- Remove dependency on systemd layer
- Bump PR

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../openssh/openssh-6.2p2/sshd.socket              |   11 +++++++++++
 .../openssh/openssh-6.2p2/sshd@.service            |    9 +++++++++
 .../openssh/openssh-6.2p2/sshdgenkeys.service      |   10 ++++++++++
 meta/recipes-connectivity/openssh/openssh_6.2p2.bb |   18 ++++++++++++++++--
 4 files changed, 46 insertions(+), 2 deletions(-)

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
index ab2eefb..dbf99d4 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
@@ -7,7 +7,7 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -19,6 +19,10 @@ RCONFLICTS_${PN} = "dropbear"
 RCONFLICTS_${PN}-sshd = "dropbear"
 RCONFLICTS_${PN}-keygen = "ssh-keygen"
 
+inherit systemd
+
+SYSTEMD_SERVICE_${PN} = "sshd.socket"
+
 SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
            file://nostrip.patch \
            file://sshd_config \
@@ -26,7 +30,10 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://init \
            file://openssh-CVE-2011-4327.patch \
            file://mac.patch \
-           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://sshd.socket \
+           file://sshd@.service \
+           file://sshdgenkeys.service "
 
 PAM_SRC_URI = "file://sshd"
 
@@ -86,6 +93,13 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
 	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
 	rmdir ${D}${localstatedir}/run/sshd ${D}${localstatedir}/run ${D}${localstatedir}
+
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/system
+    fi
 }
 
 ALLOW_EMPTY_${PN} = "1"
-- 
1.7.9.5


