Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B1006DFA9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 05:56:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBB5uB9p024482
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 21:56:11 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 10 Dec 2013 21:56:10 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Dec 2013 13:57:00 +0800
Message-ID: <3c55225e992723f3309778708a12805870a54a39.1386741230.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1386741230.git.Qi.Chen@windriver.com>
References: <cover.1386741230.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/3] image.bbclass: fix for zap_root_password
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
X-List-Received-Date: Wed, 11 Dec 2013 05:56:11 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, this function replaces the root password with '*' if
'debug-tweaks' is not in IMAGE_FEATURES. It not only zaps empty root
password, but also zaps non-empty root password. That means, if the
user uses a bbappend file for base-passwd to set the root password, he
would not be able to login as root; if the user uses 'EXTRA_USERS_PARAMS'
to set the root password, he would still not be able to login as root.

What we really want from this function is to disallow empty root password
if 'debug-tweaks' is not in IMAGE_FEATURES. This function should not remove
non-empty root password because that password is usually deliberately set
by the user.

This patch renames zap_root_password to zap_empty_root_password to
better reflect the intent of this function. It also modifies the code
to make this function work correctly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/core-image.bbclass |    2 +-
 meta/classes/image.bbclass      |   14 ++++++++------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index e7c34e2..fc4bd2f 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -74,7 +74,7 @@ inherit image
 ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
 
 # Zap the root password if debug-tweaks feature is not enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "", "zap_root_password ; ",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "", "zap_empty_root_password ; ",d)}'
 
 # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 168f283..c6d9db8 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -562,11 +562,13 @@ rootfs_uninstall_unneeded () {
 	fi
 }
 
-# set '*' as the root password so the images
-# can decide if they want it or not
-zap_root_password () {
-	sed 's%^root:[^:]*:%root:*:%' < ${IMAGE_ROOTFS}/etc/passwd >${IMAGE_ROOTFS}/etc/passwd.new
-	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
+# This function is intended to disallow empty root password if 'debug-tweaks' is not in IMAGE_FEATURES.
+zap_empty_root_password () {
+	if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then
+		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/shadow
+	elif [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
+		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/passwd
+	fi
 } 
 
 # allow dropbear/openssh to accept root logins and logins from accounts with an empty password string
@@ -648,7 +650,7 @@ rootfs_sysroot_relativelinks () {
 	sysroot-relativelinks.py ${SDK_OUTPUT}/${SDKTARGETSYSROOT}
 }
 
-EXPORT_FUNCTIONS zap_root_password remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup
+EXPORT_FUNCTIONS zap_empty_root_password remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup
 
 do_fetch[noexec] = "1"
 do_unpack[noexec] = "1"
-- 
1.7.9.5


