Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 12AB977225
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 09:08:05 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r126so33096982wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 01:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RQtNdrayuhdRpZEbXAQEFXYkwd4POBEFecHPg2VPzVI=;
	b=U5tSDbAHRUwWBDnY/W/imto58ZCz7R6+M5AoDWfy+ryZz9KmO4DBtFt9cYb1t6NpFS
	gcU38qNI+uQtOSL8+OYmZJSMI10l7r2GIKIzU1iJiflYAID2PdkG0+Ax7448UERJ89pu
	qOYoZRbWd7AxGyRMNdBNhL7J51rYx9EOrodBGuPQ+XdrQQYZPPiIzAZ4CQ9HOTe/kgBj
	5/nsWuLQZU8Ijfi2hl1n2PytOzNrAG2vT2z/FiN7AvKjS29v8SiMLfqT0K25jSf6L0Y+
	ZH7VxGgUs/LvxxotHA7fVlUOeQKBPQbWxlA4AACXeEeJJVIRpk8BtYRzj+jzArGWqhVD
	X8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RQtNdrayuhdRpZEbXAQEFXYkwd4POBEFecHPg2VPzVI=;
	b=FeTKZ5Ss7ZxlQYjf+kHKP78hp2sNA96KAAYc0d9CzOvRqZr0Nm2FCmdE/TRswqWvR+
	H/EDyq0T7Dha5+XKA3B553DAY/gORtHjFaKktnbOr3CMSbQcWxtKoRBCvsgdR5X91GM/
	+4NpgyqftnwjMJEbHs6bWwM7VV7WOiOKTtNp8Hq7aDxn4nPBb/mbUZPW25Nr75fex53R
	37d3syEtsmsvsmj3oYzjfLW2WiLv1GKS8StZP/B+cw/dRlPingNB5chONhNGyP4Mr3ki
	Hb/BadxUT2R0hOmuZJDJe4heshcU24wVG4YZ1Rv/W8dSWtohlqSAB0inVJ1jR4rthwhv
	nOBg==
X-Gm-Message-State: AIkVDXLkg8XsY9i6Bsp2mYe41DVyLXAyRY3PivQukKk8fGhuiHeK2LfGollG9KRyPkgEnQ==
X-Received: by 10.223.155.157 with SMTP id d29mr1564232wrc.74.1485248885707;
	Tue, 24 Jan 2017 01:08:05 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	w70sm18781208wrc.47.2017.01.24.01.08.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Jan 2017 01:08:05 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 10:07:15 +0100
Message-Id: <20170124090715.11646-4-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170124090715.11646-1-freesilicon@gmail.com>
References: <20170123145508.9252-1-freesilicon@gmail.com>
	<20170124090715.11646-1-freesilicon@gmail.com>
Subject: [PATCH 3/3] rootfs-postcommands: Modify ssh-related commands
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
X-List-Received-Date: Tue, 24 Jan 2017 09:08:06 -0000

OpenSSH configuration is now a symlink which points to the desired
configuration, so the functions that modified it must be updated to
modify the target and not override it.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index c8f18c6702..2d862b0b2e 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -86,20 +86,8 @@ read_only_rootfs_hook () {
 	# Tweak the mount option and fs_passno for rootfs in fstab
 	sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
 
-	# If we're using openssh and the /etc/ssh directory has no pre-generated keys,
-	# we should configure openssh to use the configuration file /etc/ssh/sshd_config_readonly
-	# and the keys under /var/run/ssh.
-	if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
-		if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ]; then
-			echo "SYSCONFDIR=/etc/ssh" >> ${IMAGE_ROOTFS}/etc/default/ssh
-			echo "SSHD_OPTS=" >> ${IMAGE_ROOTFS}/etc/default/ssh
-		else
-			echo "SYSCONFDIR=/var/run/ssh" >> ${IMAGE_ROOTFS}/etc/default/ssh
-			echo "SSHD_OPTS='-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
-		fi
-	fi
-
-	# Also tweak the key location for dropbear in the same way.
+	# If we're using dropbear and the /etc/dropbear directory has no pre-generated keys,
+	# we should configure dropbear to use the keys under /var/lib/dropbear.
 	if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
 		if [ -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
 			echo "DROPBEAR_RSAKEY_DIR=/etc/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
@@ -138,12 +126,10 @@ zap_empty_root_password () {
 # allow dropbear/openssh to accept root logins and logins from accounts with an empty password string
 #
 ssh_allow_empty_password () {
-	for config in sshd_config sshd_config_readonly; do
-		if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/$config ]; then
-			sed -i 's/^[#[:space:]]*PermitRootLogin.*/PermitRootLogin yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/$config
-			sed -i 's/^[#[:space:]]*PermitEmptyPasswords.*/PermitEmptyPasswords yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/$config
-		fi
-	done
+	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
+		sed -i --follow-symlinks 's/^[#[:space:]]*PermitRootLogin.*/PermitRootLogin yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
+		sed -i --follow-symlinks 's/^[#[:space:]]*PermitEmptyPasswords.*/PermitEmptyPasswords yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
+	fi
 
 	if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then
 		if grep -q DROPBEAR_EXTRA_ARGS ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear 2>/dev/null ; then
@@ -162,7 +148,7 @@ ssh_allow_empty_password () {
 
 ssh_disable_dns_lookup () {
 	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
-		sed -i -e 's:#UseDNS yes:UseDNS no:' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
+		sed -i --follow-symlinks -e 's:#UseDNS yes:UseDNS no:' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
 	fi
 }
 
-- 
2.11.0


