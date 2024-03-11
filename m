Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEAEC5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 17:19:22 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.631.1710177554363938343
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 10:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=w3ALzq2e;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42BHJCvt107347
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 18:19:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1710177552;
	bh=dV7SpEEJicbrVcPKDN94EEOemxEIo/zHq9NynJ8iX1k=; l=6041;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=w3ALzq2eB7dS+0AfbpZ6+0f+xnEeG5VvJtjUWVaVvY21SvSSBtoCd32zWIu+tZE64
	 +iRjWwYJ5U+InNr7oSVwZWRrf3FsNx6vuHVj+1bwJm0L+65IbUv5/8ou/tx/kQeacO
	 ViIgzAIrXFVfngRkQPpTfvJkok3gztEz1qU/S18ZYvmgI5Xx0ZrMlcf1ef0UkoXbVg
	 s8yKQIUkixhZ1mcqPlI+bSC+m7fU2/wZrfsrt4fAhF4TxncVAQN0wPujEGSN/7spJU
	 47KNjnfGW91AntsGKq9iGd7i+0mcR6qa2A0sE2k61WycBOcL5KBNr6TOZNkp77Fv+K
	 GFonx1AAOeG1Q==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 42BHJ0Xi279265
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Mon, 11 Mar 2024 18:19:01 +0100
Received: from mail-msa-3.intern.sigma-chemnitz.de ([192.168.12.73])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id QHK3HCDZG6; Mon, 11 Mar 2024 18:18:59 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id 42BHIxlB105404
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 11 Mar 2024 18:18:59 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.97.1)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rjjIh-00000008xuh-1xXq;
	Mon, 11 Mar 2024 18:18:59 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 7/7] openssh: move read-only-rootfs setup in configuration snippet
Date: Mon, 11 Mar 2024 18:18:48 +0100
Message-ID: <91d79edd41342bca563e8d6bf71d531921f4686f.1710177387.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
References: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 65ef3d03b121c496daa8ef7b
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 17:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196960

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

This patch replaces the duplicate 'sshd_config_readonly' configuration
file and logic behind by an extra packages which is installed when
corresponding IMAGE_FEATURES are set.

**NOTE**: this causes a regression when host keys are added manually
to the image.  Users have to do

| OPENSSH_FEATURE_CONFIGURATION:remove = "openssh-config-read-only-rootfs"

in this case, or create a .bbappend for openssh-config which sets
RO_KEYDIR.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes-recipe/core-image.bbclass              | 12 ++++++++++++
 meta/classes-recipe/rootfs-postcommands.bbclass     | 13 +------------
 meta/recipes-connectivity/openssh/openssh-config.bb |  7 +++++++
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb  |  7 +------
 4 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe/core-image.bbclass
index 10a2905d9a27..477b6ba47042 100644
--- a/meta/classes-recipe/core-image.bbclass
+++ b/meta/classes-recipe/core-image.bbclass
@@ -84,8 +84,20 @@ CORE_IMAGE_EXTRA_INSTALL ?= ""
 IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
 
 OPENSSH_FEATURE_CONFIGURATION = "\
+    ${@'openssh-config-read-only-rootfs' if etc_is_readonly(d) else ''} \
     ${@bb.utils.contains_any('IMAGE_FEATURES', [ 'debug-tweaks', 'allow-empty-password' ], 'openssh-config-allow-empty-password', '',d)} \
     ${@bb.utils.contains_any('IMAGE_FEATURES', [ 'debug-tweaks', 'allow-root-login' ], 'openssh-config-allow-root-login', '',d)} \
 "
 
+def etc_is_readonly(d):
+    features = (d.getVar('IMAGE_FEATURES') or "").split()
+
+    if 'read-only-rootfs' not in features:
+        return False
+
+    if 'stateless-rootfs' in features:
+        return True
+
+    return 'overlayfs-etc' not in features
+
 inherit image
diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 633f88de6ec8..ba6eb84e4055 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -188,21 +188,10 @@ read_only_rootfs_hook () {
 	fi
 
 	# If we're using openssh and the /etc/ssh directory has no pre-generated keys,
-	# we should configure openssh to use the configuration file /etc/ssh/sshd_config_readonly
-	# and the keys under /var/run/ssh.
+	# we should configure dropbear to use the keys under /var/lib/dropbear
 	# If overlayfs-etc is used this is not done as /etc is treated as writable
 	# If stateless-rootfs is enabled this is always done as we don't want to save keys then
 	if ${@ 'true' if not bb.utils.contains('IMAGE_FEATURES', 'overlayfs-etc', True, False, d) or bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else 'false'}; then
-		if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
-			if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ]; then
-				echo "SYSCONFDIR=\${SYSCONFDIR:-/etc/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
-				echo "SSHD_OPTS=" >> ${IMAGE_ROOTFS}/etc/default/ssh
-			else
-				echo "SYSCONFDIR=\${SYSCONFDIR:-/var/run/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
-				echo "SSHD_OPTS='-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
-			fi
-		fi
-
 		# Also tweak the key location for dropbear in the same way.
 		if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
 			if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
diff --git a/meta/recipes-connectivity/openssh/openssh-config.bb b/meta/recipes-connectivity/openssh/openssh-config.bb
index d4ed661d8299..d2d0d9f4ad0d 100644
--- a/meta/recipes-connectivity/openssh/openssh-config.bb
+++ b/meta/recipes-connectivity/openssh/openssh-config.bb
@@ -9,6 +9,9 @@ SRC_URI = "\
     file://80-oe.conf \
 "
 
+RO_KEYDIR ??= "/var/run/ssh"
+KEY_ALGORITHMS ??= "rsa ecdsa ed25519"
+
 do_install() {
     d=${D}${sysconfdir}/ssh/sshd_config.d
     install -d "$d"
@@ -27,6 +30,10 @@ do_install() {
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" ]; then
         echo "X11Forwarding yes" >> "$f"
     fi
+
+    for alg in ${KEY_ALGORITHMS}; do
+        printf 'HostKey %s/ssh_host_%s_key\n' '${RO_KEYDIR}' "$alg"
+    done > $d/60-read-only-rootfs.conf
 }
 
 python populate_packages:prepend() {
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index e792b459d838..29bc132de8ef 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -121,11 +121,6 @@ do_install:append () {
 
 	# Create config files for read-only rootfs
 	install -d ${D}${sysconfdir}/ssh
-	install -m 644 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/sshd_config_readonly
-	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
-	echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
-	echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
-	echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 
 	install -d ${D}${systemd_system_unitdir}
 	if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','true','false',d)}; then
@@ -165,7 +160,7 @@ PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc $
 FILES:${PN}-scp = "${bindir}/scp.${BPN}"
 FILES:${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
 FILES:${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd ${systemd_system_unitdir}"
-FILES:${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"
+FILES:${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"
 FILES:${PN}-sshd += "${libexecdir}/${BPN}/sshd_check_keys"
 FILES:${PN}-sftp = "${bindir}/sftp"
 FILES:${PN}-sftp-server = "${libexecdir}/sftp-server"
-- 
2.44.0


