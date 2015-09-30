Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7403577030
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 12:53:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Sep 2015 05:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,612,1437462000"; d="scan'208";a="816296217"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 30 Sep 2015 05:53:05 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Sep 2015 15:53:17 +0300
Message-Id: <1443617598-30123-3-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443617598-30123-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1443617598-30123-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/4] image.bbclass: tweak the key location for dropbear when rootfs is readonly
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

In the same way it's done for openssh.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/image.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 9fbdce5..d2f8105 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -251,6 +251,17 @@ read_only_rootfs_hook () {
 			echo "SSHD_OPTS='-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
 		fi
 	fi
+
+	# Also tweak the key location for dropbear in the same way.
+	if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
+		if [ -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
+			echo "DROPBEAR_RSAKEY_DIR=/etc/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
+		else
+			echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
+		fi
+	fi
+
+
 	if ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
 		# Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
 		if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
-- 
2.1.4


