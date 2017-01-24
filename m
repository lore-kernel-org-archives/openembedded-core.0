Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 70349771D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 08:44:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id d140so33047523wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 00:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8ivlosxuKfFmhbZUxe5Cgml4RozFHTrZNdXJ+u/Ekms=;
	b=kglhQbmExTmoXewKkF+OtJlhIaNb2gK5BdWTAlsU4UxTFtt3Iu6h1EPMpZrFPslFZb
	wZWCovs9vE6r9ZtHOPWRQIoPlQIcBblGuN5fOhYQ/DMxIs5IQ2DRyzfzc9pO80xBMwil
	+zCppqKaOXvQzWxDSq5wved4Cvhe/J5mNypvCLQOBihLxPN0DHzwByy/S9bMIgCS8Dj4
	aX9P6hIG4jFv/kI6m2s8zJy7fPV1lwGj18qHFWQecG3YRs7/SRDJSfoIC1PxT0siQRGP
	uiN5U5RqrCHTy1eJsbiNtELGdkc/+r490bbByMOadgFirRt9u/+5DqOMms+CI+OllMBO
	5j3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8ivlosxuKfFmhbZUxe5Cgml4RozFHTrZNdXJ+u/Ekms=;
	b=U3trJIYKOm8JCR3rZ1keAV0pYs0X0iw8r0ciE5/bh0PDGxOpfDBpbr4h9dTLMwIgWy
	n3sDwKqXZHpEA/GMhw8Kc66sugy+2DpYf+OH+vQ1PHEZHEKGB/F8I2UUteQdkc//o0mH
	uwtJ6lWu/qejNV43SeRYdXROTjzPYNILCbGC5swqzKw/8kO8EFO9NFNVVM7azyIrah2e
	QBQNAUpyhebBnmAHSfMLNrHmcAgvxX6LhaROpVfxVxpiUpGqH16hvcmur+bOIejNrVso
	sSAhdxAD65C/4fQqlACu98ONYG4eGzclLTHpveUs94WaN3rb1J9I18vA/5WB1ROaI69/
	8zuQ==
X-Gm-Message-State: AIkVDXJnopzWUQjJAbgy26EOzf3dzpefXvhzMsl2v+0oRc74mgnM9J8TMqVgbuAsc0EBwQ==
X-Received: by 10.223.165.1 with SMTP id i1mr27009207wrb.82.1485247451489;
	Tue, 24 Jan 2017 00:44:11 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	l140sm25240314wmg.12.2017.01.24.00.44.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Jan 2017 00:44:10 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 09:43:12 +0100
Message-Id: <20170124084314.8046-2-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170124084314.8046-1-freesilicon@gmail.com>
References: <20170123145508.9252-1-freesilicon@gmail.com>
	<20170124084314.8046-1-freesilicon@gmail.com>
Subject: [PATCH 1/3] openssh: Package server configuration
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
X-List-Received-Date: Tue, 24 Jan 2017 08:44:11 -0000

Split sshd configuration for read-write/read-only rootfs in two distinct
packages. Also, add a package dependency between openssh-sshd package
and a provider of sshd-config.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_7.3p1.bb | 47 ++++++++++++++++++----
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.3p1.bb b/meta/recipes-connectivity/openssh/openssh_7.3p1.bb
index 94eb0ed208..c02bb7d450 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.3p1.bb
@@ -92,13 +92,17 @@ do_compile_ptest() {
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
@@ -111,7 +115,7 @@ do_install_append () {
 
 	# Create config files for read-only rootfs
 	install -d ${D}${sysconfdir}/ssh
-	install -m 644 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/sshd_config_readonly
+	install -m 644 ${D}${sysconfdir}/ssh/sshd_config_default ${D}${sysconfdir}/ssh/sshd_config_readonly
 	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
 	echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 	echo "HostKey /var/run/ssh/ssh_host_dsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
@@ -135,30 +139,59 @@ do_install_ptest () {
 
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


