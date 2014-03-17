Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 610606F7A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 17:01:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Mar 2014 09:56:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,671,1389772800"; d="scan'208";a="501662247"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.240])
	by orsmga002.jf.intel.com with ESMTP; 17 Mar 2014 10:00:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Mar 2014 10:00:49 -0700
Message-Id: <1395075649-10987-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] openssh: dont use DNS lookup for Qemu
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
X-List-Received-Date: Mon, 17 Mar 2014 17:01:07 -0000

Since we are always using ip address to connect to the sshd server, it does not need
to use reverse DNS to look up the ip address.  This will save some time during testing.

[YOCTO #5954]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/openssh/openssh_6.5p1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
index 6c413af..9ad25fa 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
@@ -109,6 +109,10 @@ do_install_append () {
 		${D}${systemd_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/system/*.service
 }
 
+do_install_append_qemuall() {
+	sed -i -e 's:#UseDNS yes:UseDNS no:' ${WORKDIR}/sshd_config ${D}${sysconfdir}/ssh/sshd_config
+}
+
 ALLOW_EMPTY_${PN} = "1"
 
 PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc ${PN}-sftp-server"
-- 
1.8.3.1


