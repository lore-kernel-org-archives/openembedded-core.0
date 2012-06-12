Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SeOE3-00064a-V5
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 12:21:28 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Jun 2012 03:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="111100518"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.123])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Jun 2012 03:10:54 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 18:10:07 +0800
Message-Id: <de650fb4dbcc6e2539f9325c58dbe5dd1e94f137.1339495723.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <40eb390623c511dadf467d19e146a4dc92b70856.1339495723.git.lianhao.lu@intel.com>
References: <40eb390623c511dadf467d19e146a4dc92b70856.1339495723.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1339495723.git.lianhao.lu@intel.com>
References: <cover.1339495723.git.lianhao.lu@intel.com>
Subject: [PATCH V2 3/3] classes/image: Allow openssh empty passwords login.
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
X-List-Received-Date: Tue, 12 Jun 2012 10:21:28 -0000

Allow empty passwords login so that the default root user can login in
through openssh.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/core-image.bbclass |    2 ++
 meta/classes/image.bbclass      |   10 +++++++++-
 2 files changed, 11 insertions(+), 1 deletions(-)

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
index fb932b9..3f53271 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -318,6 +318,14 @@ zap_root_password () {
 	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
 } 
 
+# allow openssh accept login with empty password string
+openssh_allow_empty_password () {
+	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
+		sed 's#.*PermitEmptyPasswords.*#PermitEmptyPasswords yes#' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config >${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config.new
+		mv -f ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config.new ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
+	fi
+}
+
 # Turn any symbolic /sbin/init link into a file
 remove_init_link () {
 	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
@@ -372,7 +380,7 @@ rootfs_trim_schemas () {
 	done
 }
 
-EXPORT_FUNCTIONS zap_root_password remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup
+EXPORT_FUNCTIONS zap_root_password remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup openssh_allow_empty_password
 
 do_fetch[noexec] = "1"
 do_unpack[noexec] = "1"
-- 
1.7.0.4



