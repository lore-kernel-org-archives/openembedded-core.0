Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7F73078283
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 07:05:10 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id m7so1516242wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 00:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vVv9Z0ZATVa6LeQEOnV/RxYXW9UBLEXnWU/0Es3ePBo=;
	b=Cp0wIAcF2rK+OonIEMrRj2d08z0t5kR5lMdUJOm2NRBwE2VZdZiKmR3fg678QbLCJK
	FE8bUyTLym56jVfaFbyu+3VuZgddV8tf9/cw9Tc/a9yt0CPr7XEE5h3iq68n5LJd+AP5
	3omcPfQmRXhkGJf1Cd2+an35Wq7ijw1A+1k10ojASEg4TMFWh/ALtMsS25MEdxrDWSIC
	HT1of+6YUwB8P7MQKdYeDntOMxkQADT0Uyoe9U3xaRLD0J6TZubMA0p/mNMk9yZyzwj8
	Bo/PJ2/xK5Z2hj2mXa7CeRaiaCce6bIipPE/CICbvrm0BWBGOgZ9kOhfWcg/6++Q8XAb
	QwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vVv9Z0ZATVa6LeQEOnV/RxYXW9UBLEXnWU/0Es3ePBo=;
	b=tAwvk4UImAbsNG4QxXJiCnkW0yj7zyGwIB3SXb5fJID05kGn+YROLYw+56e2BwOBej
	C5ru8vQqVI7EzwvIKfWQNNmPxn5dZJ0YghNJihEH6+M6J+yVNBg/qWS2YxyVfBA/yJvr
	7onmWW95Qdgtgrpg/ni1JuEoMmtLMpX2olLSrnVllGnpfLYWdM9PMrlulfYHPCMY7HEh
	lvi+ISJwPXJ0Wh9oYhMz0vLHKxtus5Olt0qfHo+0XnqIa1g53L1d3fnZZ4A5z7MMfbog
	syoyK0wmWSTFuLFqQXwNdxVvf+KgoFqeoWC+qr3bVqXZ0OA6qdWk9QjqFfULTUD7E3nJ
	hb1A==
X-Gm-Message-State: AKS2vOyFQ2V39U0GcR1BGFhNPNHSwzzYP3Y7+pdARgOFLYq0jNk+hWup
	vJw/zaPUGKsm4Mmm0Us=
X-Received: by 10.28.11.84 with SMTP id 81mr2208688wml.82.1496991910785;
	Fri, 09 Jun 2017 00:05:10 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id 62sm304574wra.44.2017.06.09.00.05.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Jun 2017 00:05:10 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 09:04:27 +0200
Message-Id: <20170609070429.17376-2-freesilicon@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170609070429.17376-1-freesilicon@gmail.com>
References: <20170609070429.17376-1-freesilicon@gmail.com>
Subject: [PATCH RESEND 1/3] openssh: Package server configuration
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
X-List-Received-Date: Fri, 09 Jun 2017 07:05:10 -0000

Split sshd configuration for read-write/read-only rootfs in two distinct
packages. Also, add a package dependency between openssh-sshd package
and a provider of sshd-config.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_7.5p1.bb | 51 ++++++++++++++++++----
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
index 5b96745aae..e22e6c672d 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
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
2.13.0


