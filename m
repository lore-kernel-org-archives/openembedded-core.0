Return-Path: <freesilicon@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id E14B973D46
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:56:05 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id kq3so2105311wjc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 06:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8ivlosxuKfFmhbZUxe5Cgml4RozFHTrZNdXJ+u/Ekms=;
	b=H+NI9SpbpmmkpURrcVhqYFc/gQi3S0uvFj2dPUbNZ1R/jbeW/k0CZunRO5ikTLsDrA
	zOXERycHiQW4Yr8JP/EbODhZkAf/5z9Hudw5r27yLIuo1nPeglt2GCeiya11ZVAeXrLg
	GoxuLwiyfqUiKX7LsTimIclwGZPoaq8/VcAHAJCbNiF+oWSRyT19Sr7nBjsnluNWH2ig
	e8mK5BEzf2ej0+je2ivf0N9KNbsF99oLzYcr4v4NiNykdRZZrJGeqEOfq7diusItsdl0
	reeG4gtrYBmsRhL81GJYkD/5RPDJwkwmvNUXrYFBHW9NEYC+FmPkUxEDcGoulId3I+il
	O1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8ivlosxuKfFmhbZUxe5Cgml4RozFHTrZNdXJ+u/Ekms=;
	b=ksw6Jj19SK+5uCjWMkfADdtK9v8Y1OOKWlyup8Jjjse3EWuJto/ngoTOmWFjbPb3i7
	ChF8zG3eWZKU3UQDIIUhc3R7+VQuXSdGcKiU6/c/qaXJgnwI3WNbGSON2426M28j2IJH
	Wi7GXw/eAjcTnlr/B7pYzHj4B/pcKYxWNegYK7WP874kjyyzTNiSdlJdHhFxyslj8b8u
	Ah7T8aGF+lfgEOqP+EhWsSfdTvA9H1oq6PIvhb9JcY850RKzSzSUbVtUBpT6Z8x95wnm
	bNhR4bx0UUQr1kOUQ/uiUZPZEjCwX7hT0ofLzkKHNQ2e4yPgXIjTqyDVppVzzpwByQ7h
	F+Dg==
X-Gm-Message-State: AIkVDXK/z7+7wf+pP3Quz9vTCdotf3hFVurjSJ4ewJcZ96ZA40qUXZz8QKsMatdpmHDR3A==
X-Received: by 10.223.136.109 with SMTP id e42mr24145230wre.14.1485183365545; 
	Mon, 23 Jan 2017 06:56:05 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	q5sm15129433wrd.32.2017.01.23.06.56.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 06:56:05 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 15:55:05 +0100
Message-Id: <20170123145508.9252-2-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170123145508.9252-1-freesilicon@gmail.com>
References: <20170123145508.9252-1-freesilicon@gmail.com>
Subject: [PATCH 1/4] openssh: Package server configuration
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
X-List-Received-Date: Mon, 23 Jan 2017 14:56:07 -0000

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


