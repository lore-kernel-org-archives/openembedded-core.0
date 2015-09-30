Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CF18877010
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 12:53:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Sep 2015 05:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,612,1437462000"; d="scan'208";a="816296189"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 30 Sep 2015 05:53:03 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Sep 2015 15:53:15 +0300
Message-Id: <1443617598-30123-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/4] image.bbclass: when building a readonly rootfs, tweak ssh settings regardless of init system in use
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
X-List-Received-Date: Wed, 30 Sep 2015 12:53:06 -0000

Previously it was done only if sysvinit was in DISTRO_FEATURES.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/image.bbclass | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 7e6822c..9fbdce5 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -239,6 +239,18 @@ read_only_rootfs_hook () {
 	# Tweak the mount option and fs_passno for rootfs in fstab
 	sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
 
+	# If we're using openssh and the /etc/ssh directory has no pre-generated keys,
+	# we should configure openssh to use the configuration file /etc/ssh/sshd_config_readonly
+	# and the keys under /var/run/ssh.
+	if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
+		if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ]; then
+			echo "SYSCONFDIR=/etc/ssh" >> ${IMAGE_ROOTFS}/etc/default/ssh
+			echo "SSHD_OPTS=" >> ${IMAGE_ROOTFS}/etc/default/ssh
+		else
+			echo "SYSCONFDIR=/var/run/ssh" >> ${IMAGE_ROOTFS}/etc/default/ssh
+			echo "SSHD_OPTS='-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
+		fi
+	fi
 	if ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
 		# Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
 		if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
@@ -249,18 +261,6 @@ read_only_rootfs_hook () {
 		if [ -x ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
 			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
 		fi
-		# If we're using openssh and the /etc/ssh directory has no pre-generated keys,
-		# we should configure openssh to use the configuration file /etc/ssh/sshd_config_readonly
-		# and the keys under /var/run/ssh.
-		if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
-			if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ]; then
-				echo "SYSCONFDIR=/etc/ssh" >> ${IMAGE_ROOTFS}/etc/default/ssh
-				echo "SSHD_OPTS=" >> ${IMAGE_ROOTFS}/etc/default/ssh
-			else
-				echo "SYSCONFDIR=/var/run/ssh" >> ${IMAGE_ROOTFS}/etc/default/ssh
-				echo "SSHD_OPTS='-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
-			fi
-		fi
 	fi
 
 	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", d)}; then
-- 
2.1.4


