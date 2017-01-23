Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4DDC4771EE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:56:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r126so26998021wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 06:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RQtNdrayuhdRpZEbXAQEFXYkwd4POBEFecHPg2VPzVI=;
	b=LWjbDzFrfGnW2qSGZ+EM6Gb5Ru9Jy44DzSpOGNrMmtDF5gwpZngDEhW5B7aZ06b9+j
	LlxTWU684+OI9d/kP9KgWlYA2+7ZGGtrr1wRJyGruW4BNy4d+EKo9LSHxSfQq1gTgCro
	Pcvq6OobNkt/+GUdV9GFthH971tX8FhQGLwBrterwIiIML+q59vReOa7rgez1JTSiDLn
	91zgbUqxTTKdjh4xNUOlGB8Z5CpTonizhVfuBWxjC+FkLpKwVNxBzzZo7DDdS8s0+e/u
	FiqwfOGBSwM2zmXUZfMtIZo4NCQI4Prkm7ueCv56hi6TlJBLbfadiUXb0601a2tjqFyi
	Q+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RQtNdrayuhdRpZEbXAQEFXYkwd4POBEFecHPg2VPzVI=;
	b=j+Pl88gJmihHknQ0t1hPU+PO5qGGlkn3QwAYGW/8oXtyiB1V97jSIo4tcVZsk2m8dw
	9K2yYbApgjSR4RGnP1CaIWutF5n3HoshYUNvnNtb7/xjM3pqhtgZawRv+qm0uS5pjWOm
	81BHS+6kKvjNjMvCD3dRH2p/lAuLkjF03Wj1WKf3eRA7Z2lRmgErBevky4Ctlt8hCAAQ
	mfsariZiON1+7mvhq5UfNXkcMA9yN0eOy1n+7YjzXCO8KRTyi0005jmJ8Ad4o1WMxrcN
	q8IGpJ1LV0A3HTXYeVM8dxJREXm7pGrobINCprvAcXrvUs8uXWy+dTFE4OTIibEvb1ck
	Ukew==
X-Gm-Message-State: AIkVDXLQliUU/PPAC40fXRnucAgiPfv/yVKslM0gQJmsLkA/x5e/HxE9I/kYDkSzznolag==
X-Received: by 10.28.173.140 with SMTP id w134mr13153051wme.56.1485183371195; 
	Mon, 23 Jan 2017 06:56:11 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	q5sm15129433wrd.32.2017.01.23.06.56.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 06:56:10 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 15:55:07 +0100
Message-Id: <20170123145508.9252-4-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170123145508.9252-1-freesilicon@gmail.com>
References: <20170123145508.9252-1-freesilicon@gmail.com>
Subject: [PATCH 3/4] rootfs-postcommands: Modify ssh-related commands
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
X-List-Received-Date: Mon, 23 Jan 2017 14:56:11 -0000

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


