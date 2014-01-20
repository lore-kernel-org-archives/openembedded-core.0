Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E59486E7CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 02:22:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0K2N0XY022065
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 18:23:00 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 19 Jan 2014 18:22:59 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2014 10:23:01 +0800
Message-ID: <afc7def2a323e44876a0e3fbf165cdb907e864ca.1390184362.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1390184362.git.Qi.Chen@windriver.com>
References: <cover.1390184362.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 3/5] openssh: fixes for systemd
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
X-List-Received-Date: Mon, 20 Jan 2014 02:22:59 -0000
Content-Type: text/plain

This patch contains a few fixes for the systemd unit files of openssh.
The fixes use the same unit files in Fedora 20 as a reference.

1) Remove sshdgenkeys.service and sshd@.service from SYSTEMD_SERVICE.
2) Fix the dependency and logic of sshdgenkeys.service.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../openssh/openssh-6.4p1/sshd.socket              |    1 -
 .../openssh/openssh-6.4p1/sshd@.service            |    1 +
 .../openssh/openssh-6.4p1/sshdgenkeys.service      |    8 ++++----
 meta/recipes-connectivity/openssh/openssh_6.4p1.bb |    4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh-6.4p1/sshd.socket b/meta/recipes-connectivity/openssh/openssh-6.4p1/sshd.socket
index d19ab2a..12c39b2 100644
--- a/meta/recipes-connectivity/openssh/openssh-6.4p1/sshd.socket
+++ b/meta/recipes-connectivity/openssh/openssh-6.4p1/sshd.socket
@@ -8,4 +8,3 @@ Accept=yes
 
 [Install]
 WantedBy=sockets.target
-Also=sshdgenkeys.service
diff --git a/meta/recipes-connectivity/openssh/openssh-6.4p1/sshd@.service b/meta/recipes-connectivity/openssh/openssh-6.4p1/sshd@.service
index 64e009f..4eda659 100644
--- a/meta/recipes-connectivity/openssh/openssh-6.4p1/sshd@.service
+++ b/meta/recipes-connectivity/openssh/openssh-6.4p1/sshd@.service
@@ -1,5 +1,6 @@
 [Unit]
 Description=OpenSSH Per-Connection Daemon
+Wants=sshdgenkeys.service
 After=sshdgenkeys.service
 
 [Service]
diff --git a/meta/recipes-connectivity/openssh/openssh-6.4p1/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh-6.4p1/sshdgenkeys.service
index 2fd8a9a..c21d70b 100644
--- a/meta/recipes-connectivity/openssh/openssh-6.4p1/sshdgenkeys.service
+++ b/meta/recipes-connectivity/openssh/openssh-6.4p1/sshdgenkeys.service
@@ -1,10 +1,10 @@
 [Unit]
-Description=SSH Key Generation
+Description=OpenSSH Key Generation
+ConditionPathExists=|!/etc/ssh/ssh_host_rsa_key
+ConditionPathExists=|!/etc/ssh/ssh_host_dsa_key
+ConditionPathExists=|!/etc/ssh/ssh_host_ecdsa_key
 
 [Service]
 ExecStart=@BINDIR@/ssh-keygen -A
 Type=oneshot
 RemainAfterExit=yes
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
index c61d16f..1f78566 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
@@ -44,7 +44,7 @@ INITSCRIPT_NAME_${PN}-sshd = "sshd"
 INITSCRIPT_PARAMS_${PN}-sshd = "defaults 9"
 
 SYSTEMD_PACKAGES = "${PN}-sshd"
-SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket sshd@.service sshdgenkeys.service"
+SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
 
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,,tcp-wrappers"
@@ -114,7 +114,7 @@ ALLOW_EMPTY_${PN} = "1"
 PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc ${PN}-sftp-server"
 FILES_${PN}-scp = "${bindir}/scp.${BPN}"
 FILES_${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
-FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd"
+FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd ${systemd_unitdir}/system"
 FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatiles/99_sshd"
 FILES_${PN}-sftp = "${bindir}/sftp"
 FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
-- 
1.7.9.5


