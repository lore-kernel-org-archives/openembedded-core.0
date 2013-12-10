Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63AA461566
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 09:58:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBA9w3DE021049
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 01:58:03 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 10 Dec 2013 01:58:02 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Dec 2013 17:58:51 +0800
Message-ID: <51a89b7ff6efb35278daf3373040434a9673dba8.1386669285.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1386669285.git.Qi.Chen@windriver.com>
References: <cover.1386669285.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] image.bbclass: remove zap_root_password
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
X-List-Received-Date: Tue, 10 Dec 2013 09:58:03 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This function replaces the root password with '*' if 'debug-tweaks'
is not in IMAGE_FEATURES. As a result, if we don't have 'debug-tweaks',
we would be locked out of the system. That means, if the user uses a
bbappend file for base-passwd to set the root password, he would not be
able to login as root; if the user uses 'EXTRA_USERS_PARAMS' to set
the root password, he would still not be able to login as root.

In a word, this function should be removed to make things work correctly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/core-image.bbclass |    3 ---
 meta/classes/image.bbclass      |    9 +--------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index e7c34e2..5ee0d6d 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -73,8 +73,5 @@ inherit image
 # Create /etc/timestamp during image construction to give a reasonably sane default time setting
 ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
 
-# Zap the root password if debug-tweaks feature is not enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "", "zap_root_password ; ",d)}'
-
 # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 168f283..a5ef244 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -562,13 +562,6 @@ rootfs_uninstall_unneeded () {
 	fi
 }
 
-# set '*' as the root password so the images
-# can decide if they want it or not
-zap_root_password () {
-	sed 's%^root:[^:]*:%root:*:%' < ${IMAGE_ROOTFS}/etc/passwd >${IMAGE_ROOTFS}/etc/passwd.new
-	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
-} 
-
 # allow dropbear/openssh to accept root logins and logins from accounts with an empty password string
 ssh_allow_empty_password () {
 	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
@@ -648,7 +641,7 @@ rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 }
 
-EXPORT_FUNCTIONS zap_root_password remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup
+EXPORT_FUNCTIONS remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup
 
 do_fetch[noexec] = "1"
 do_unpack[noexec] = "1"
-- 
1.7.9.5


