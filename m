Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 239537765F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 08:47:46 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v190so12483628wme.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 00:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vfVzN0xLE5j6FeNOr8FJcTD5HAaQqXzuNXBTC6SMcUI=;
	b=s9SvYLS43+ov2D0+bIbYNZu+FX5Fji+laYNEA5kaSNSB+gnUiXYF/RMcLN6qdi8ioj
	hrAOBOIp5bfL1WQJi+oQzh1H4ZoXEHiRfz3B/eAuF0ZTGmVRQbRsQmK1Nx/bOTMOwEww
	z1/1ra405HT0YUlo072mOr89F6X0Q0xxhEtqVIyh+0BxziVE/NP+q/dsVmoE2OGnqFIf
	PNBPNmLJJqicqZZa5yFZjKNAQ1lVjwhIQaLaG5Zn/ZkhkzSqC5xScxGxS2ACCQb4QsSk
	L6hU8MrCPnISggwYFOigra/1u7f6RVQSWpdOfATN+n2NHzQ7njr6lrxWH5QGL94Z5AcF
	yh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vfVzN0xLE5j6FeNOr8FJcTD5HAaQqXzuNXBTC6SMcUI=;
	b=TjfRjoRhODdXrahidE/EfwnUEeaB+h6w8VKNdUVlqxDnUnWGPg+QlzQjQ/eqlcxkyz
	cx2Qbe8mXK853uLQgKNiZfBsD9QPgM+/Aqi1y4qZ7cj6y+rhDyLaSYMST5gZIHsXOPx5
	eD7GKI7ml/pnBPP/+923Y3yxsh39GZs2WSBik48F1gyCNmSZv31ADLLEWvzu0hxLOylX
	AKxQg1LwQIeW3YBU70B5qqRlivXOdoMSOwuEyA4j8lw6iElOB5lHeX/l+Sfypv3lnZaj
	NGSRjGH0cgt9Oq1+Hg12SmVpM0DZ9iwWXJ2RR42vDqTwrgBdozlvXShFFkpAP6YAAZOs
	qvlw==
X-Gm-Message-State: AMke39lhytOswWRcQjMObcJ1J4YA230MsY2dYTqm+P5WoSc092zQeLSArUM2l4rHAeIquQ==
X-Received: by 10.28.144.209 with SMTP id s200mr13132879wmd.134.1488790067489; 
	Mon, 06 Mar 2017 00:47:47 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	x69sm13916067wma.15.2017.03.06.00.47.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 00:47:47 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Mar 2017 09:46:11 +0100
Message-Id: <20170306084611.12507-4-freesilicon@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170306084611.12507-1-freesilicon@gmail.com>
References: <20170306084611.12507-1-freesilicon@gmail.com>
Subject: [PATCH v4 3/3] rootfs-postcommands: Modify ssh-related commands
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
X-List-Received-Date: Mon, 06 Mar 2017 08:47:47 -0000

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
2.12.0


