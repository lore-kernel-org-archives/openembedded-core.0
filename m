Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1DD5D6E8D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 00:31:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 18 Mar 2014 17:31:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,681,1389772800"; d="scan'208";a="494730454"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.240])
	by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2014 17:31:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Mar 2014 17:31:19 -0700
Message-Id: <1395189079-18831-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v2] testimage: dont use DNS lookup for qemu based testimages
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
X-List-Received-Date: Wed, 19 Mar 2014 00:31:26 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/testimage.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 691c7f6..ee028e1 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -45,6 +45,16 @@ TESTIMAGEDEPENDS_qemuall = "qemu-native:do_populate_sysroot qemu-helper-native:d
 TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
 TESTIMAGELOCK_qemuall = ""
 
+IMAGE_POSTPROCESS_COMMAND_qemuall += "fix_dns_lookup_for_qemu"
+
+fix_dns_lookup_for_qemu() {
+	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
+		sed -i -e 's:#UseDNS yes:UseDNS no:' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
+	fi
+}
+
+EXPORT_FUNCTIONS fix_dns_lookup_for_qemu
+
 python do_testimage() {
     testimage_main(d)
 }
-- 
1.8.3.1


