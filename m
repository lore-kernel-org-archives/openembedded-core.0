Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2593E71C9A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 10:31:48 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id 196so3965359wmm.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 02:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k28MSrMEgXNYAAyBXiMalk50GJmD4ysYRKYukHF6uqc=;
	b=HtAjmYCdiWs596AuW9j949jl1ONBzO3hLy3x0QEZz75Ezwnl5uHajghdvZfW0n35c+
	lgizUpEx2juSeItrJgEDzG01sgLL2XBc+mfnGDnxaHH+rMycQHbZnnUcwZM8b1o7tjFm
	Ff+bmpAShw5DP9I/POQCJY7vSViOTszBGDDhTQumNotb1Qr3p/F4Xaca1QMlDxSSnbKE
	w3NGkImru02khVrXQLwVPMpNajF/gguCDDNOqe0BISi3KE3T1BdO3ppOz5ga1BmvWliW
	qSo1xErEsT7KkvHjpMgVtoUurSMCSC4WE4Tx5YIwIr/q7964oVqBKcgcULldOIgf+Gqn
	cxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k28MSrMEgXNYAAyBXiMalk50GJmD4ysYRKYukHF6uqc=;
	b=E//R8KfsG0sVoSO9dGiyBOa9t4G0pXd7jHa0DK7BchqLdgP9MFgtdLDtAydbHSWPhg
	1u/J0iagXfPSTDyvpPsSp6LbVmG772pD+3cmwWFmS4iSDWw0eNV8w7HA5QF17TofhgH0
	VD/5YC4GD+3NHJ3rEYB38Egc7wPzhpNi74czSqGCzmNLRkNLqBL4WWq8L1Lb4x9trMUP
	XAUDmnKi5FBYvySoQXouSXBgRjAwX/ovqVpOkkr27ykOa4R3t+SIyIk+23doR7/qiv4a
	nzboc7ML8O4nbwGPrVxR8rf4EYuCCOLxjLpLRASUTDTVBym1p1KG3t94m6NwiYHx1AUo
	F8tA==
X-Gm-Message-State: AIkVDXK0nrSE9Y97NceSY00Bu2dtzE8nUwTH/pdmqI/ksrz9KssvZXcZFZmOh2bWjRGCrA==
X-Received: by 10.28.146.12 with SMTP id u12mr7134848wmd.113.1486031508468;
	Thu, 02 Feb 2017 02:31:48 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	a186sm34632192wmh.1.2017.02.02.02.31.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Feb 2017 02:31:48 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2017 11:30:40 +0100
Message-Id: <20170202103042.14571-2-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170202103042.14571-1-freesilicon@gmail.com>
References: <20170124090715.11646-1-freesilicon@gmail.com>
	<20170202103042.14571-1-freesilicon@gmail.com>
Subject: [PATCH v3 1/3] openssh: Package server configuration
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
X-List-Received-Date: Thu, 02 Feb 2017 10:31:49 -0000

Split sshd configuration for read-write/read-only rootfs in two distinct
packages. Also, add a package dependency between openssh-sshd package
and a provider of sshd-config.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_7.4p1.bb | 47 ++++++++++++++++++----
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.4p1.bb b/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
index 3b3d667a68..0afc4bd948 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
@@ -91,13 +91,17 @@ do_compile_ptest() {
 }
 
 do_install_append () {
+	# Create default config files
+	install -m 0644 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/sshd_config_default
+	rm -f ${D}${sysconfdir}/ssh/sshd_config
+
 	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
 		install -D -m 0644 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
-		sed -i -e 's:#UsePAM no:UsePAM yes:' ${D}${sysconfdir}/ssh/sshd_config
+		sed -i -e 's:#UsePAM no:UsePAM yes:' ${D}${sysconfdir}/ssh/sshd_config_default
 	fi
 
 	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "x11" ]; then
-		sed -i -e 's:#X11Forwarding no:X11Forwarding yes:' ${D}${sysconfdir}/ssh/sshd_config
+		sed -i -e 's:#X11Forwarding no:X11Forwarding yes:' ${D}${sysconfdir}/ssh/sshd_config_default
 	fi
 
 	install -d ${D}${sysconfdir}/init.d
@@ -110,7 +114,7 @@ do_install_append () {
 
 	# Create config files for read-only rootfs
 	install -d ${D}${sysconfdir}/ssh
-	install -m 644 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/sshd_config_readonly
+	install -m 644 ${D}${sysconfdir}/ssh/sshd_config_default ${D}${sysconfdir}/ssh/sshd_config_readonly
 	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
 	echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 	echo "HostKey /var/run/ssh/ssh_host_dsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
@@ -134,30 +138,59 @@ do_install_ptest () {
 
 ALLOW_EMPTY_${PN} = "1"
 
-PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc ${PN}-sftp-server"
+PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd-config ${PN}-sshd-config-readonly ${PN}-sshd ${PN}-sftp ${PN}-misc ${PN}-sftp-server"
 FILES_${PN}-scp = "${bindir}/scp.${BPN}"
 FILES_${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
+FILES_${PN}-sshd-config = "${sysconfdir}/ssh/sshd_config_default"
+FILES_${PN}-sshd-config-readonly = "${sysconfdir}/ssh/sshd_config_readonly"
 FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd ${systemd_unitdir}/system"
-FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"
+FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"
 FILES_${PN}-sftp = "${bindir}/sftp"
 FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
 FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
 FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
-RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
+RDEPENDS_${PN}-sshd += "${PN}-keygen sshd-config ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
 RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make"
 
 RPROVIDES_${PN}-ssh = "ssh"
+RPROVIDES_${PN}-sshd-config = "sshd-config"
+RPROVIDES_${PN}-sshd-config-readonly = "sshd-config"
 RPROVIDES_${PN}-sshd = "sshd"
 
 RCONFLICTS_${PN} = "dropbear"
+RCONFLICTS_${PN}-sshd-config = "${PN}-sshd-config-readonly"
+RCONFLICTS_${PN}-sshd-config-readonly = "${PN}-sshd-config"
 RCONFLICTS_${PN}-sshd = "dropbear"
 RCONFLICTS_${PN}-keygen = "ssh-keygen"
 
-CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
+CONFFILES_${PN}-sshd-config = "${sysconfdir}/ssh/sshd_config_default"
+CONFFILES_${PN}-sshd-config-readonly = "${sysconfdir}/ssh/sshd_config_readonly"
 CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
 
+pkg_postinst_${PN}-sshd-config () {
+#!/bin/sh
+if [ -e $D${sysconfdir}/ssh/sshd_config ]; then
+    rm $D${sysconfdir}/ssh/sshd_config
+fi
+
+# Make sure destination directory exists, before creating the symlink
+mkdir -p $D${sysconfdir}/ssh
+ln -s sshd_config_default $D${sysconfdir}/ssh/sshd_config
+}
+
+pkg_postinst_${PN}-sshd-config-readonly () {
+#!/bin/sh
+if [ -e $D${sysconfdir}/ssh/sshd_config ]; then
+    rm $D${sysconfdir}/ssh/sshd_config
+fi
+
+# Make sure destination directory exists, before creating the symlink
+mkdir -p $D${sysconfdir}/ssh
+ln -s sshd_config_readonly $D${sysconfdir}/ssh/sshd_config
+}
+
 ALTERNATIVE_PRIORITY = "90"
 ALTERNATIVE_${PN}-scp = "scp"
 ALTERNATIVE_${PN}-ssh = "ssh"
-- 
2.11.0


