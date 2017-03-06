Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B75C97765F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 08:47:44 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v190so12483454wme.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 00:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RfJIpYaFI06rxzRmzre8MRr3W6lk4LNyZkHk3ruGdGA=;
	b=j6TRLzhz3mtu8mI9Nx0GPGt985ZAmCwULMt87vdh8SgP+VWV5hVWM85o1oAJffDeDu
	ldM0+B6EubcT+IIfBNzB+en4/aRd701Ds1IkP2ImXA5VozwBTqMcxL47k/nz9swL6840
	5/bTnxCHS2yK9+1TIXAKdmX60bRfMxpuUFEJxtFe/n6i350348D9T2X6dR2Q4OoyVVhM
	Qve7dsaLB0KhtyfQ7MME+S+xT77ugpCkZ5nN96GQKyLqIV2CpHLR/eUYldyZ3A2jBewy
	MZhq3djzhzx78BkEJ88+7vprkM+GootPWFpa1klpJWbL5udXICAsKr2itpAR95cZX4vF
	AQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RfJIpYaFI06rxzRmzre8MRr3W6lk4LNyZkHk3ruGdGA=;
	b=K96rQYv1ctlJ5q1YlEAgOjbyON/euXaXqFNVM0OYfVChy6sUXe1fcxG5pN1gP0aim1
	+9IqVmfEpx3l8bKiG9X3wn37eicAwe/7TaH8NzNuzgRD+mdrNDo61mg01cw2pyhImCYQ
	TdFJdapAcBBLJ6y233LHRuB2E1qBrVvRP12Y7UejMhiVkbqfyF0M9ciWicCv9/rzwf0Y
	8nUB1aBQBMiBYkjndL39PlC6+FsiY0DNP1mLUJDJkueplvfmrZR6Qeosnx8Vw0ZyKnq6
	SkHDod4ktJgBIi54cIvH8zW0AlYYJBHjtziEnWMEoTs2YVkTPXTAzSMzvcZfad2VQFnQ
	Uz0g==
X-Gm-Message-State: AMke39m+GyxHK9geOJmKO7t4/RDoZYWLsw1YHw9xqqvpUBoQ4FzrWgU9dHCyRHMQSKzwig==
X-Received: by 10.28.59.193 with SMTP id i184mr12775206wma.97.1488790064950;
	Mon, 06 Mar 2017 00:47:44 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	x69sm13916067wma.15.2017.03.06.00.47.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 00:47:44 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Mar 2017 09:46:09 +0100
Message-Id: <20170306084611.12507-2-freesilicon@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170306084611.12507-1-freesilicon@gmail.com>
References: <20170306084611.12507-1-freesilicon@gmail.com>
Subject: [PATCH v4 1/3] openssh: Package server configuration
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
X-List-Received-Date: Mon, 06 Mar 2017 08:47:45 -0000

Split sshd configuration for read-write/read-only rootfs in two distinct
packages. Also, add a package dependency between openssh-sshd package
and a provider of sshd-config.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_7.4p1.bb | 51 ++++++++++++++++++----
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.4p1.bb b/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
index c8093d4e2b..0afc4bd948 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
@@ -91,13 +91,17 @@ do_compile_ptest() {
 }
 
 do_install_append () {
-	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
+	# Create default config files
+	install -m 0644 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/sshd_config_default
+	rm -f ${D}${sysconfdir}/ssh/sshd_config
+
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
 		install -D -m 0644 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
-		sed -i -e 's:#UsePAM no:UsePAM yes:' ${D}${sysconfdir}/ssh/sshd_config
+		sed -i -e 's:#UsePAM no:UsePAM yes:' ${D}${sysconfdir}/ssh/sshd_config_default
 	fi
 
-	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" ]; then
-		sed -i -e 's:#X11Forwarding no:X11Forwarding yes:' ${D}${sysconfdir}/ssh/sshd_config
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "x11" ]; then
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
2.12.0


