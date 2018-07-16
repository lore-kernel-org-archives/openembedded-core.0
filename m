Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0DC60272
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 07:46:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42276607"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jul 2018 15:46:51 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2DBA44B5CD6E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 15:46:49 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Mon, 16 Jul 2018 15:46:48 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jul 2018 15:46:39 +0800
Message-ID: <1531727199-24488-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 2DBA44B5CD6E.A93E4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] sshd: add sshd.service
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
X-List-Received-Date: Mon, 16 Jul 2018 07:46:58 -0000
Content-Type: text/plain

Add sshd.service for user to start the sshd deamon.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-connectivity/openssh/openssh/sshd.service | 16 ++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.7p1.bb     |  2 ++
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd.service

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.service b/meta/recipes-connectivity/openssh/openssh/sshd.service
new file mode 100644
index 0000000..eb87d32
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/sshd.service
@@ -0,0 +1,16 @@
+[Unit]
+Description=OpenSSH server daemon
+Documentation=man:sshd(8) man:sshd_config(5)
+After=network.target sshd-keygen.service
+Wants=sshd-keygen.service
+
+[Service]
+EnvironmentFile=/etc/sysconfig/sshd
+ExecStart=/usr/sbin/sshd -D $OPTIONS
+ExecReload=/bin/kill -HUP $MAINPID
+KillMode=process
+Restart=on-failure
+RestartSec=42s
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
index b3da5f6..def4062 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://ssh_config \
            file://init \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://sshd.service \
            file://sshd.socket \
            file://sshd@.service \
            file://sshdgenkeys.service \
@@ -111,6 +112,7 @@ do_install_append () {
 	echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 
 	install -d ${D}${systemd_unitdir}/system
+	install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_unitdir}/system
 	install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
 	install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/system
 	install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/system
-- 
2.7.4




