Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1D2A060E07
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 17:38:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Mar 2014 10:37:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,766,1389772800"; d="scan'208";a="484174471"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.43])
	by orsmga001.jf.intel.com with ESMTP; 31 Mar 2014 10:37:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Mar 2014 10:37:38 -0700
Message-Id: <1396287458-12576-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] image.bbclass: add function to disable SSH DNS Lookup for Qemu
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
X-List-Received-Date: Mon, 31 Mar 2014 17:38:13 -0000

This function disables the reverse DNS lookup on QEMU targets to reduce the
delay when using static IP address. By disabling DNS lookup we can save a great
deal of time during automated testing on the autobuilder (on the order of ~400
seconds per ssh tranaction). This is seen when using the testimage, there is a
delay getting logged-in from the server to target.

It's enabled for all qemu imgaes by default and can be overridden by setting
the SSH_DISABLE_DNS_LOOKUP variable.

[YOCTO #5954]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 29309f5..ea035fe 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -304,6 +304,16 @@ ssh_allow_empty_password () {
 	fi
 }
 
+# Disable DNS lookups, the SSH_DISABLE_DNS_LOOKUP can be overridden to allow
+# distros to choose not to take this change
+SSH_DISABLE_DNS_LOOKUP ?= " ssh_disable_dns_lookup ; "
+ROOTFS_POSTPROCESS_COMMAND_append_qemuall = "${SSH_DISABLE_DNS_LOOKUP}"
+ssh_disable_dns_lookup () {
+	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
+		sed -i -e 's:#UseDNS yes:UseDNS no:' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
+	fi
+}
+
 # Enable postinst logging if debug-tweaks is enabled
 postinst_enable_logging () {
 	mkdir -p ${IMAGE_ROOTFS}${sysconfdir}/default
-- 
1.8.3.1


