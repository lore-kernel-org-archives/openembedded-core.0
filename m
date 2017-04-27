Return-Path: <panagiotis.tamtamis@unify.com>
Received: from mx12.unify.com (mx12.unify.com [62.134.46.10])
	by mail.openembedded.org (Postfix) with ESMTP id F24EF71AC0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 17:51:25 +0000 (UTC)
Received: from ubuntu500.ath.global-intra.net (unknown [172.25.14.167])
	by mx12.unify.com (Server) with ESMTP id 6FDD423F0477;
	Thu, 27 Apr 2017 19:51:26 +0200 (CEST)
From: Panagiotis Tamtamis <panagiotis.tamtamis@unify.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 20:33:57 +0300
Message-Id: <1493314437-8475-1-git-send-email-panagiotis.tamtamis@unify.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] rootfs-postcommands.bbclass: Check if "/etc/fstab" exists
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
X-List-Received-Date: Thu, 27 Apr 2017 17:51:26 -0000

Using "read-only-rootfs" feature in minimal or special
purpose images (eg mounted images) makes build to fail
because ${IMAGE_ROOTFS}/etc/fstab file does not exist.

Signed-off-by: Panagiotis Tamtamis <panagiotis.tamtamis@unify.com>
---
 meta/classes/rootfs-postcommands.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 0c7ceea..4709369 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -64,7 +64,8 @@ systemd_create_users () {
 #
 read_only_rootfs_hook () {
 	# Tweak the mount option and fs_passno for rootfs in fstab
-	sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
+	if [ -f ${IMAGE_ROOTFS}/etc/fstab ]; then
+		sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
 
 	# If we're using openssh and the /etc/ssh directory has no pre-generated keys,
 	# we should configure openssh to use the configuration file /etc/ssh/sshd_config_readonly
-- 
1.9.1


