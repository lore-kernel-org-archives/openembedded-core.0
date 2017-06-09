Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1CFE47827D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 07:05:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x3so10370979wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 00:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1W43iR83/FDRXCycyDTj260QXkQUy+F7eYrTgU+hAMc=;
	b=Ncv6nhPnSR0lRKGZ8/KUXejuyumyyr5PlWkjq9LN9pR8S8gjQHcHwgl/S8KwcpTNnc
	5kAni0uQVXh+4uSBDjNAce5wYGxKiKOBKj159Euuh5SCoAHvgv/6kPVWlIwAfbidRttI
	motQZ71ATOZozCusHnJLie1ZjfzPjazf/qQ3xltD1oRT8Zakn5ChmmvF4B0anbsSsDdK
	tpA313Rl9xdbWNP/EVmloc+mgSMeLvjubvBmPElAqkFdYXR5SJMgYUshvOnqMX3q+WxS
	kQEyR6/cnTAE9lMY9J1OiGa2RWeyK4HZ1RXo1/xw80222l7gF0ANQIyfpmj0PS72c1Yb
	GplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1W43iR83/FDRXCycyDTj260QXkQUy+F7eYrTgU+hAMc=;
	b=t9ZC2KH3CfQqPj7pud/oHOizT04Kq9LvbDwHoXuk3s2Oi4+sNg/OOgmJfh6Ii7sE75
	TIYm7pVOftl7I/AMMaAqun9vfRbGoTPWN+Oh+2v2Aeks2wNnT0a7frS69MjI5wdjDISE
	sLE49UlzaekkItZTMuvV7ikkmdoo78FyNK+hb7OU54xkVyZNjEhGHj5RL6eBeV5LBJg6
	mcFgBtYkQZAsMjlJnkO0dQZGFjN2jBlGRayQGS+ULzSAOu2pbmFLylwRD9QEnGkQ0rk/
	bXwhiQtaDf6vB8jhNcm41ftIRLyIYp/cvkHalPs1L+mm+lesBQo3ye56SKlIpo3KED0Q
	nxrQ==
X-Gm-Message-State: AODbwcCdNfh0nmkV75Qd+TmnMxiuTQwKeA5gv4S+/OCoUkaAUPgQU+W0
	0H8TUug9CtdbRsRfZTY=
X-Received: by 10.28.102.6 with SMTP id a6mr6438309wmc.114.1496991912623;
	Fri, 09 Jun 2017 00:05:12 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id 62sm304574wra.44.2017.06.09.00.05.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Jun 2017 00:05:12 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 09:04:29 +0200
Message-Id: <20170609070429.17376-4-freesilicon@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170609070429.17376-1-freesilicon@gmail.com>
References: <20170609070429.17376-1-freesilicon@gmail.com>
Subject: [PATCH RESEND 3/3] rootfs-postcommands: Modify ssh-related commands
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
X-List-Received-Date: Fri, 09 Jun 2017 07:05:12 -0000

OpenSSH configuration is now a symlink which points to the desired
configuration, so the functions that modified it must be updated to
modify the target and not override it.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 1d66a42953..1c0af87c9f 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -89,15 +89,12 @@ read_only_rootfs_hook () {
 	fi
 
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
 
@@ -140,12 +137,10 @@ zap_empty_root_password () {
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
@@ -164,7 +159,7 @@ ssh_allow_empty_password () {
 
 ssh_disable_dns_lookup () {
 	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
-		sed -i -e 's:#UseDNS yes:UseDNS no:' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
+		sed -i --follow-symlinks -e 's:#UseDNS yes:UseDNS no:' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
 	fi
 }
 
-- 
2.13.0


