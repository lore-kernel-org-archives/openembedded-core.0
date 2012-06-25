Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Sj1ms-0003l4-Pf
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 07:24:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Jun 2012 22:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="157768568"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.116])
	by orsmga001.jf.intel.com with ESMTP; 24 Jun 2012 22:13:37 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jun 2012 13:15:29 +0800
Message-Id: <5bfc2cadad3f2b0e2b03c4562aba4efd0a604c95.1340600710.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1340600710.git.lianhao.lu@intel.com>
References: <cover.1340600710.git.lianhao.lu@intel.com>
Subject: [PATCH V3 1/3] classes/image: Allow openssh empty passwords login.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jun 2012 05:24:35 -0000

Allow empty passwords login so that the default root user can login in
through openssh.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/core-image.bbclass |    2 ++
 meta/classes/image.bbclass      |    7 +++++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index e2ad0fc..25f5c5a 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -69,4 +69,6 @@ ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
 
 # Zap the root password if debug-tweaks feature is not enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "", "zap_root_password ; ",d)}'
+# Allow openssh accept empty password login if both debug-tweaks and ssh-server-openssh are enabled
+ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks ssh-server-openssh", "openssh_allow_empty_password; ", "",d)}'
 
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index fb932b9..0772363 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -318,6 +318,13 @@ zap_root_password () {
 	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
 } 
 
+# allow openssh accept login with empty password string
+openssh_allow_empty_password () {
+	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
+		sed -i 's#.*PermitEmptyPasswords.*#PermitEmptyPasswords yes#' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
+	fi
+}
+
 # Turn any symbolic /sbin/init link into a file
 remove_init_link () {
 	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
-- 
1.7.0.4



