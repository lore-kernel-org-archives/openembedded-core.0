Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3118577A1F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 12:09:30 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id v75so1329314qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 05:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=ULQtUhhzXwTixtmo4LtcMUJRB26DsTbMxIqpO+sHBwE=;
	b=iZi+APgbjxktl6bt0XZzTKnoGgMYwWrXREylkX+M22hVm4AfTG1ntwrhgswbvSQmP0
	sOb4FHZ6NeMNvbQ8gKSm3W+eWCu3r2KTsDW+Krt85q0riQNZ+S9ia0lAufxjiUdBojU2
	h5YuvQl5miAsVYax+jxwr8WFJ9YCy1BAjyxUGohd1r8a5ZAuhB+uRUyGutqKtWNqXTrx
	1er8MNOaFlHqWE7sgW+a7cN8L0K/3J+gg2rgPXI8l5cT1sT+bjWb3l8VfUAkCK6m4972
	eXixMlBBT3MxEeopNj1dJ08HbFZE6CFf4MYtQf4OissnsAzyWb5HL0PaNGWJSkrp9U4t
	ii3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=ULQtUhhzXwTixtmo4LtcMUJRB26DsTbMxIqpO+sHBwE=;
	b=hdAoMk+yT7K7/sdSNuPvkHc+CJHsYHcWAjrmXpujOM2/YRHbsUK8zaubwqXYKVcl39
	5ZfLp0ZXEXE7kb9qno5lUVYIXsP9zW2HIfDWIkWVduRWl/5reXbNCuhZWb4daM5lB17a
	HJ8okqxuEeBe3ypNLumAXiaBOrpsIi2LjFFMBux7LnA7rA48jVDfh7e8Qr5Eub8rTpdP
	qaLGklGXdEpgWx8C+Ly7/yD3jlZXTORdjyXwjnXAqA7R3hRPf7tiEV/o53R2vZQanG0s
	J1pCq/w6j3Pb87Qxi61d/Xd9N5TcEK0k+iDCvQIvTY6TTiorSZ3ZDLfD1Ys4dpoEwAwW
	bZ8Q==
X-Gm-Message-State: AFeK/H0Jm1Z7NsOUt8Zjo2a95n8PUwgACxTt5zN2gkiPbh3uYSCFNUxYhpXoFxbyaq06nQ==
X-Received: by 10.55.180.70 with SMTP id d67mr28943811qkf.280.1491394171761;
	Wed, 05 Apr 2017 05:09:31 -0700 (PDT)
Received: from centrium.lab.ossystems ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	q66sm13832411qkd.69.2017.04.05.05.09.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Apr 2017 05:09:30 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 09:09:16 -0300
Message-Id: <20170405120916.17095-2-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170405120916.17095-1-fabio.berton@ossystems.com.br>
References: <20170405120916.17095-1-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [PATCH 2/2] openssh: Use systemd-tmpfiles to create volatiles files and dirs
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
X-List-Received-Date: Wed, 05 Apr 2017 12:09:31 -0000

Volatiles files are installed in different locations depending on
distro feature update-rc.d or systemd. For update-rc.d volatiles
configuration files are installed in /etc/default/volatiles and
for systemd in /etc/tmpfiles.d/. So, we need to install volatiles
files in correct location depending on what distro feature is used.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../openssh/openssh/sshd.tmpfiles.d                |  2 ++
 meta/recipes-connectivity/openssh/openssh_7.4p1.bb | 27 +++++++++++++---------
 2 files changed, 18 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd.tmpfiles.d

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.tmpfiles.d b/meta/recipes-connectivity/openssh/openssh/sshd.tmpfiles.d
new file mode 100644
index 0000000000..a2ae06ad94
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/sshd.tmpfiles.d
@@ -0,0 +1,2 @@
+d /var/run/sshd     0755    root    root    -   -
+f /var/log/lastlog  0644    root    root    -   -
diff --git a/meta/recipes-connectivity/openssh/openssh_7.4p1.bb b/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
index c8093d4e2b..eff83de135 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd@.service \
            file://sshdgenkeys.service \
            file://volatiles.99_sshd \
+           file://sshd.tmpfiles.d \
            file://add-test-support-for-busybox.patch \
            file://run-ptest \
            file://openssh-7.1p1-conditional-compile-des-in-cipher.patch \
@@ -104,8 +105,7 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
 	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
 	rmdir ${D}${localstatedir}/run/sshd ${D}${localstatedir}/run ${D}${localstatedir}
-	install -d ${D}/${sysconfdir}/default/volatiles
-	install -m 644 ${WORKDIR}/volatiles.99_sshd ${D}/${sysconfdir}/default/volatiles/99_sshd
+
 	install -m 0755 ${S}/contrib/ssh-copy-id ${D}${bindir}
 
 	# Create config files for read-only rootfs
@@ -117,14 +117,19 @@ do_install_append () {
 	echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 	echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 
-	install -d ${D}${systemd_unitdir}/system
-	install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
-	install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/system
-	install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
-		-e 's,@SBINDIR@,${sbindir},g' \
-		-e 's,@BINDIR@,${bindir},g' \
-		${D}${systemd_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/system/*.service
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}${systemd_unitdir}/system
+		install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
+		install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/system
+		install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/system
+		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+			-e 's,@SBINDIR@,${sbindir},g' \
+			-e 's,@BINDIR@,${bindir},g' \
+			${D}${systemd_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/system/*.service
+		install -Dm 0644 ${WORKDIR}/sshd.tmpfiles.d ${D}${sysconfdir}/tmpfiles.d/sshd.conf
+	else
+		install -Dm 0644 ${WORKDIR}/volatiles.99_sshd ${D}/${sysconfdir}/default/volatiles/99_sshd
+	fi
 }
 
 do_install_ptest () {
@@ -138,7 +143,7 @@ PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc $
 FILES_${PN}-scp = "${bindir}/scp.${BPN}"
 FILES_${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
 FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd ${systemd_unitdir}/system"
-FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"
+FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd ${sysconfdir}/tmpfiles.d/sshd.conf"
 FILES_${PN}-sftp = "${bindir}/sftp"
 FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
 FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
-- 
2.11.0


