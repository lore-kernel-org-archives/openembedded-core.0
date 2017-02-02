Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4FBB271C9B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 10:31:49 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r18so12204911wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 02:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cVlQDb5QmTu33ntoUgxh35p9bwdH5RmjdQ2N15sWX2U=;
	b=rQi2jajOWGPri/hY+2uNnef2fH5RzjXHx7qrtu7L60qqrZhoL3oxAX9B7gLo/Q8DLZ
	yKwh0eFcm96DXOi6eVhLOqTkOWG+dvC2o3oVm5Ubivu6fQE9Gg+xqoLPA9LYNXFeMIWU
	72ml2vi3Muvcic+XbF+gbrphP4FtVmTh0qKA0Udnvy9fBddcKrMlAky8C2r3BnSfhkoM
	FwHw32jq1mluDdRiDbo9HmzDWMY8qRx7PTXxw9F2etQ4LrUkKH27NNxhLFNsAPdPfjXK
	Z7aXtQgXJBReO5R0l3Le+aypdF3bYvUWpz8ETqKgLj4cE4s8fmgz6Pf/KUst9eYmfCXg
	DeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cVlQDb5QmTu33ntoUgxh35p9bwdH5RmjdQ2N15sWX2U=;
	b=AYgXw2RIrTP2Q+yEZFVfArmpDvQJfKiWW4zRwoWevCBg1ScJ3UfsMTH0JRty6+l2OS
	Nx3iRGWI6KRKL1IgjiYFU7idXQvpxwXw7S0Nc+BRaVNAdAGaJslyssdyv5OVkQylFmsw
	eNsc3hx7kJHsR9ketkFNGqcwKfG77tMsul29L7EzpyGt376ieldgGP3NOUoPNHqyIn5X
	qazKVHLCcj/9sITwSqU3baOqvbdJO74YWXbAvhS/alFxRW4GXLJ3ndM4PeVmKYVSbxmJ
	i0j3wXPU6SmcStxhS2oqO3ke2jrAQufF9FWy3zhH5HunKwUZkUD0b9Q3k+wC4gumxKLF
	g5CA==
X-Gm-Message-State: AIkVDXIVg24sM73iDA8MgJux2R+dO34kkS48p/X/QNJ2WecjKbRbd4cjb5cM5rKwqjxuAg==
X-Received: by 10.28.63.5 with SMTP id m5mr7208198wma.95.1486031509786;
	Thu, 02 Feb 2017 02:31:49 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	a186sm34632192wmh.1.2017.02.02.02.31.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Feb 2017 02:31:49 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2017 11:30:42 +0100
Message-Id: <20170202103042.14571-4-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170202103042.14571-1-freesilicon@gmail.com>
References: <20170124090715.11646-1-freesilicon@gmail.com>
	<20170202103042.14571-1-freesilicon@gmail.com>
Subject: [PATCH v3 3/3] rootfs-postcommands: Modify ssh-related commands
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
X-List-Received-Date: Thu, 02 Feb 2017 10:31:50 -0000

OpenSSH configuration is now a symlink which points to the desired
configuration, so the functions that modified it must be updated to
modify the target and not override it.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index c42829dd65..60cfac82c4 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -87,15 +87,12 @@ read_only_rootfs_hook () {
 	sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
 
 	# If we're using openssh and the /etc/ssh directory has no pre-generated keys,
-	# we should configure openssh to use the configuration file /etc/ssh/sshd_config_readonly
-	# and the keys under /var/run/ssh.
+	# we should configure openssh to use the keys under /var/run/ssh.
 	if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
 		if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ]; then
 			echo "SYSCONFDIR=/etc/ssh" >> ${IMAGE_ROOTFS}/etc/default/ssh
-			echo "SSHD_OPTS=" >> ${IMAGE_ROOTFS}/etc/default/ssh
 		else
 			echo "SYSCONFDIR=/var/run/ssh" >> ${IMAGE_ROOTFS}/etc/default/ssh
-			echo "SSHD_OPTS='-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
 		fi
 	fi
 
@@ -138,12 +135,10 @@ zap_empty_root_password () {
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
@@ -162,7 +157,7 @@ ssh_allow_empty_password () {
 
 ssh_disable_dns_lookup () {
 	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
-		sed -i -e 's:#UseDNS yes:UseDNS no:' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
+		sed -i --follow-symlinks -e 's:#UseDNS yes:UseDNS no:' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
 	fi
 }
 
-- 
2.11.0


