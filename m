Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84188ECAAD3
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 14:23:53 +0000 (UTC)
Received: from mailrelay3-2.pub.mailoutpod1-cph3.one.com
 (mailrelay3-2.pub.mailoutpod1-cph3.one.com [46.30.212.2])
 by mx.groups.io with SMTP id smtpd.web10.25418.1662387825138374929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 07:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=d2voM2gr;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.2,
 mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=FEbtwMGWV6avLW/uvLxzgAGD1WPokwt7jegyyVBbRbw=;
	b=d2voM2grsnsPcinDY6gPSNPsGdzjPEizmG9dfFnmD3RfbrbEtyFoqj0U8KqVOzkwEL1awkwvAtckX
	 Q6pdICbLhMaDbro2mBoDbFnUGn93EDdg6EsughvowUxngVpMsIipjlSP52E1n/i2z5tYpaCPsOuuDw
	 X8LnKAenvTC72XnqzmhLgC+tY7chzcBuyuMVFxEmwtbL578j53F/f8k9ZvAHHSR0ZAnfc4XYkh9IHi
	 o6/2/HVpsR0RHOFVw5emorWY27+3wTKGUxIGUJZABhCKinWwWs8z7u5O9a017OnRE2CDwoBy4luY+U
	 yJZPLio+xGCd1AiHClVmPdVslaeFu6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=FEbtwMGWV6avLW/uvLxzgAGD1WPokwt7jegyyVBbRbw=;
	b=z5sBRzV1jLoyPgTnyTyKxedv9Zvc+Gs2JFR/IdmAIwB3B3xJ+0+n7BGZMkeIRfMClZs6R+UKlxLP4
	 nuLlKcZCA==
X-HalOne-Cookie: e6b845b18b7c2c4d9971e83c1e4c7d78d9a9b056
X-HalOne-ID: 55a10648-2d26-11ed-be89-d0431ea8bb03
Received: from pbergin-7420.localdomain (unknown [83.218.73.98])
	by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 55a10648-2d26-11ed-be89-d0431ea8bb03;
	Mon, 05 Sep 2022 14:23:41 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH] rootfs-postcommands.bbclass: avoid moving ssh host keys if
 etc is writable
Date: Mon,  5 Sep 2022 16:23:29 +0200
Message-Id: <20220905142329.34087-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 14:23:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170316

When using IMAGE_FEATURE read-only-rootfs ssh host keys are moved to volatile
storage. If the feature overlayfs-etc is used in addition to read-only-rootfs
/etc is writable and the move is not wanted. But in the case also the IMAGE_FEATURE
stateless-roots is used the keys will be moved as storage of keys should not
be wanted in a stateless-rootfs.

This change only takes effect in the case IMAGE_FEATURE contains read-only-rootfs.
In adddition the following cases are handled:

  IMAGE_FEATURES = "read-only-rootfs" --> ssh keys/config handled as ro root
  IMAGE_FEATURES = "read-only-rootfs overlayfs-etc" --> ssh keys/config handled as rw root
  IMAGE_FEATURES = "read-only-rootfs stateless-rootfs" --> ssh keys/config handled as ro root
  IMAGE_FEATURES = "read-only-rootfs overlayfs-etc stateless-rootfs" --> ssh keys/config handled as ro root

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 .../rootfs-postcommands.bbclass               | 32 +++++++++++--------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 215e38e33d..367fe07c09 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -22,7 +22,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
 # Create /etc/timestamp during image construction to give a reasonably sane default time setting
 ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp; "
 
-# Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
+# Tweak files in /etc if read-only-rootfs is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
 
 # We also need to do the same for the kernel boot parameters,
@@ -111,21 +111,25 @@ read_only_rootfs_hook () {
 	# If we're using openssh and the /etc/ssh directory has no pre-generated keys,
 	# we should configure openssh to use the configuration file /etc/ssh/sshd_config_readonly
 	# and the keys under /var/run/ssh.
-	if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
-		if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ]; then
-			echo "SYSCONFDIR=\${SYSCONFDIR:-/etc/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
-			echo "SSHD_OPTS=" >> ${IMAGE_ROOTFS}/etc/default/ssh
-		else
-			echo "SYSCONFDIR=\${SYSCONFDIR:-/var/run/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
-			echo "SSHD_OPTS='-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
+	# If overlayfs-etc is used this is not done as /etc is treated as writable
+	# If stateless-rootfs is enabled this is always done as we don't want to save keys then
+	if ${@ 'false;' if bb.utils.contains('IMAGE_FEATURES', 'overlayfs-etc', True, False, d) and not bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else 'true;'} then
+	    if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
+		    if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ]; then
+			    echo "SYSCONFDIR=\${SYSCONFDIR:-/etc/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
+			    echo "SSHD_OPTS=" >> ${IMAGE_ROOTFS}/etc/default/ssh
+		    else
+			    echo "SYSCONFDIR=\${SYSCONFDIR:-/var/run/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
+			    echo "SSHD_OPTS='-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
+		    fi
 		fi
-	fi
 
-	# Also tweak the key location for dropbear in the same way.
-	if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
-		if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
-			echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
-		fi
+	    # Also tweak the key location for dropbear in the same way.
+	    if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
+		    if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
+			    echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
+		    fi
+	    fi
 	fi
 
 	if ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
-- 
2.34.1


