Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA03FECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 18:41:04 +0000 (UTC)
Received: from mailrelay2-2.pub.mailoutpod1-cph3.one.com
 (mailrelay2-2.pub.mailoutpod1-cph3.one.com [46.30.212.1])
 by mx.groups.io with SMTP id smtpd.web12.28251.1662403262403332363
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 11:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=nDDispnJ;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.1,
 mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=aHq8/snQrtu8semQ4faXov2Nv4H8OVHiqjan1LfI8MU=;
	b=nDDispnJ4yTmzzyk4N1NW0FfjvAY0EU/0t6mIbBcVmj3C+1k0HF/GOZa6B/V7+mb8XFawgcfxi+zb
	 uHt1Iy1zMMDWtS9yy73+N1sbWamYRjPywXLO8TPnjYqFRoRbrgB/GGaCdy4cDHVuFNcw8rwHpSHwE9
	 vwZCHNpf1AaC/qLtNVjsQ5yNq8SNHRI7jdXeRSkm+Uq6yt9UClc7r3pe9i22qF7UAMMbHg6l89h4z8
	 zVEgdo/hiFc7s4yK49rbKbFieGMTZZp0uE4MknJJd/rFUSTJxs/v8d2nYV8b1b1PG/PgdW0s6FwFjM
	 g6byTdIVG95cY1Ctrw4R8V8vLFfV1dg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=aHq8/snQrtu8semQ4faXov2Nv4H8OVHiqjan1LfI8MU=;
	b=5uTx29Y4BO8bEjzfaIobU4olNdXjL1ULI8av1QH4nBXZGMfxkax48HoYlRXxOl/mhVI0KCV13EcKl
	 aYlmwPcBA==
X-HalOne-Cookie: f0bad61e3860b63741abad72d3ecf747043d7ced
X-HalOne-ID: 46964713-2d4a-11ed-a921-d0431ea8a290
Received: from pbergin-7420.. (ua-213-113-159-147.bbcust.telenor.se
 [213.113.159.147])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 46964713-2d4a-11ed-a921-d0431ea8a290;
	Mon, 05 Sep 2022 18:40:59 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH v2] rootfs-postcommands.bbclass: avoid moving ssh host keys if
 etc is writable
Date: Mon,  5 Sep 2022 20:40:40 +0200
Message-Id: <20220905184040.12022-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 18:41:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170324

When using IMAGE_FEATURE read-only-rootfs ssh host keys are moved to volatile
storage. If the feature overlayfs-etc is used in addition to read-only-rootfs
/etc is writable and the move is not wanted. But in the case also the IMAGE_FEATURE
stateless-rootfs is used the keys will be moved as storage of keys should not
be wanted in a stateless-rootfs.

This change only takes effect in the case IMAGE_FEATURE contains read-only-rootfs.
In adddition the following cases are handled:

  IMAGE_FEATURES = "read-only-rootfs" --> ssh keys/config handled as ro root
  IMAGE_FEATURES = "read-only-rootfs overlayfs-etc" --> ssh keys/config handled as rw root
  IMAGE_FEATURES = "read-only-rootfs stateless-rootfs" --> ssh keys/config handled as ro root
  IMAGE_FEATURES = "read-only-rootfs overlayfs-etc stateless-rootfs" --> ssh keys/config handled as ro root

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
v2: Change logic expression for easier understanding. Use tabs for indentation in script.


 .../rootfs-postcommands.bbclass               | 30 +++++++++++--------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 215e38e33d..74601f0829 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -22,7 +22,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
 # Create /etc/timestamp during image construction to give a reasonably sane default time setting
 ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp; "
 
-# Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
+# Tweak files in /etc if read-only-rootfs is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
 
 # We also need to do the same for the kernel boot parameters,
@@ -111,20 +111,24 @@ read_only_rootfs_hook () {
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
+	if ${@ 'true' if not bb.utils.contains('IMAGE_FEATURES', 'overlayfs-etc', True, False, d) or bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else 'false'}; then
+		if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
+			if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ]; then
+				echo "SYSCONFDIR=\${SYSCONFDIR:-/etc/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
+				echo "SSHD_OPTS=" >> ${IMAGE_ROOTFS}/etc/default/ssh
+			else
+				echo "SYSCONFDIR=\${SYSCONFDIR:-/var/run/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
+				echo "SSHD_OPTS='-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
+			fi
 		fi
-	fi
 
-	# Also tweak the key location for dropbear in the same way.
-	if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
-		if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
-			echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
+		# Also tweak the key location for dropbear in the same way.
+		if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
+			if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
+				echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
+			fi
 		fi
 	fi
 
-- 
2.34.1


