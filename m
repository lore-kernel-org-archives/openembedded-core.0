Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3659660746
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 01:52:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="4868745"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Mar 2016 09:52:28 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id C62AE489F965
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 09:52:24 +0800 (CST)
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 23 Mar 2016 09:52:24 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Mar 2016 04:52:11 +0300
Message-ID: <1458697931-1829-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
X-yoursite-MailScanner-ID: C62AE489F965.A24EC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] openssh: add systemd service file sshd.service
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
X-List-Received-Date: Wed, 23 Mar 2016 01:52:35 -0000
Content-Type: text/plain

If sysvinit is disabled from DISTRO_FEATURES,then /etc/init.d/sshd
will be removed,and this will cause sshd daemon failed to start by systemd,
So add it.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/openssh/openssh/sshd.service | 19 +++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.1p2.bb    |  9 +++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd.service

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.service b/meta/recipes-connectivity/openssh/openssh/sshd.service
new file mode 100644
index 0000000..6c05f23
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/sshd.service
@@ -0,0 +1,19 @@
+[Unit]
+Description=OpenSSH server daemon
+Documentation=man:sshd(8) man:sshd_config(5)
+After=network.target sshd-keygen.service
+Wants=sshd-keygen.service
+
+[Service]
+Type=forking
+PIDFile=@localstatedir@/run/sshd.pid
+EnvironmentFile=-@SYSCONFDIR@/sysconfig/sshd
+ExecStart=@SBINDIR@/sshd $OPTIONS
+ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
+KillMode=process
+Restart=on-failure
+RestartSec=42s
+
+[Install]
+WantedBy=multi-user.target
+
diff --git a/meta/recipes-connectivity/openssh/openssh_7.1p2.bb b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
index 3b5e28a..8b31b40 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
@@ -23,7 +23,9 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://run-ptest \
            file://CVE-2016-1907_upstream_commit.patch \
            file://CVE-2016-1907_2.patch \
-           file://CVE-2016-1907_3.patch "
+           file://CVE-2016-1907_3.patch \
+           file://sshd.service"
+
 
 PAM_SRC_URI = "file://sshd"
 
@@ -39,7 +41,7 @@ INITSCRIPT_NAME_${PN}-sshd = "sshd"
 INITSCRIPT_PARAMS_${PN}-sshd = "defaults 9"
 
 SYSTEMD_PACKAGES = "${PN}-sshd"
-SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
+SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket sshd.service"
 
 inherit autotools-brokensep ptest
 
@@ -118,9 +120,12 @@ do_install_append () {
 	install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
 	install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/system
 	install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/system
+	install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_unitdir}/system
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 		-e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@BINDIR@,${bindir},g' \
+		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
+		-e 's,@localstatedir@,${localstatedir},g' \ 
 		${D}${systemd_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/system/*.service
 }
 
-- 
1.8.4.2




