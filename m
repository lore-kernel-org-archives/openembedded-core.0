Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD1ED4335F
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 13:48:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.72048.1730987282036957970
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 05:48:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A46E497
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Nov 2024 05:48:31 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2367F3F66E
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Nov 2024 05:48:01 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes-recipe/core-image: drop debug-tweaks IMAGE_FEATURE
Date: Thu,  7 Nov 2024 13:47:52 +0000
Message-Id: <20241107134752.2071720-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 13:48:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206832

Remove the 'debug-tweaks' IMAGE_FEATURE. It sounds friendly and kind to
developers, but it results primarily in an image which root can login
remotely without a password.  This is incredibly useful for local
development and testing purposes, but we really want to be explicit that
this is what is happening instead of hiding it behind a vague "debug
tweaks" statement.

To preserve the eixsting behaviour, debug-tweaks should be replaced with
these features:

  allow-empty-password empty-root-password allow-root-login post-install-=
logging

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/core-image.bbclass          | 11 ++++++-----
 meta/classes-recipe/image.bbclass               |  2 +-
 meta/classes-recipe/rootfs-postcommands.bbclass | 16 ++++++++--------
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe=
/core-image.bbclass
index 40fc15cb04f..4072e420c58 100644
--- a/meta/classes-recipe/core-image.bbclass
+++ b/meta/classes-recipe/core-image.bbclass
@@ -26,11 +26,6 @@
 # - ssh-server-openssh  - SSH server (openssh)
 # - hwcodecs            - Install hardware acceleration codecs
 # - package-management  - installs package management tools and preserve=
s the package manager database
-# - debug-tweaks        - makes an image suitable for development, e.g. =
allowing passwordless root logins
-#   - empty-root-password
-#   - allow-empty-password
-#   - allow-root-login
-#   - post-install-logging
 # - serial-autologin-root - with 'empty-root-password': autologin 'root'=
 on the serial console
 # - dev-pkgs            - development packages (headers, etc.) for all i=
nstalled packages in the rootfs
 # - dbg-pkgs            - debug symbol packages for all installed packag=
es in the rootfs
@@ -43,6 +38,12 @@
 # - stateless-rootfs    - systemctl-native not run, image populated by s=
ystemd at runtime
 # - splash              - bootup splash screen
 #
+# Features for development purposes (previously part of debug-tweaks):
+# - empty-root-password  - the root user has no password set
+# - allow-empty-password - users can have an empty password
+# - allow-root-login     - the root user can login
+# - post-install-logging - log the output of postinstall scriptlets
+#
 FEATURE_PACKAGES_weston =3D "packagegroup-core-weston"
 FEATURE_PACKAGES_x11 =3D "packagegroup-core-x11"
 FEATURE_PACKAGES_x11-base =3D "packagegroup-core-x11-base"
diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/imag=
e.bbclass
index 00f1d58f237..eda3c6d0f38 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -40,7 +40,7 @@ INHIBIT_DEFAULT_DEPS =3D "1"
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?=3D ""
 IMAGE_FEATURES[type] =3D "list"
-IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs read-only=
-rootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empt=
y-password allow-root-login serial-autologin-root post-install-logging ov=
erlayfs-etc"
+IMAGE_FEATURES[validitems] +=3D "read-only-rootfs read-only-rootfs-delay=
ed-postinsts stateless-rootfs empty-root-password allow-empty-password al=
low-root-login serial-autologin-root post-install-logging overlayfs-etc"
=20
 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?=3D "0"
diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/class=
es-recipe/rootfs-postcommands.bbclass
index 5f4d67f93ca..50e77dca763 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -4,20 +4,20 @@
 # SPDX-License-Identifier: MIT
 #
=20
-# Zap the root password if debug-tweaks and empty-root-password features=
 are not enabled
-ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURE=
S", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_passwo=
rd ",d)}'
+# Zap the root password if empty-root-password feature is not enabled
+ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", =
"empty-root-password", "", "zap_empty_root_password ",d)}'
=20
-# Allow dropbear/openssh to accept logins from accounts with an empty pa=
ssword string if debug-tweaks or allow-empty-password is enabled
-ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURE=
S", [ 'debug-tweaks', 'allow-empty-password' ], "ssh_allow_empty_password=
 ", "",d)}'
+# Allow dropbear/openssh to accept logins from accounts with an empty pa=
ssword string if allow-empty-password is enabled
+ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", =
"allow-empty-password", "ssh_allow_empty_password ", "",d)}'
=20
-# Allow dropbear/openssh to accept root logins if debug-tweaks or allow-=
root-login is enabled
-ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURE=
S", [ 'debug-tweaks', 'allow-root-login' ], "ssh_allow_root_login ", "",d=
)}'
+# Allow dropbear/openssh to accept root logins if allow-root-login is en=
abled
+ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", =
"allow-root-login", "ssh_allow_root_login ", "",d)}'
=20
 # Autologin the root user on the serial console, if empty-root-password =
and serial-autologin-root are active
 ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", =
[ 'empty-root-password', 'serial-autologin-root' ], "serial_autologin_roo=
t ", "",d)}'
=20
-# Enable postinst logging if debug-tweaks or post-install-logging is ena=
bled
-ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURE=
S", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging =
", "",d)}'
+# Enable postinst logging if post-install-logging is enabled
+ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", =
"post-install-logging", "postinst_enable_logging ", "",d)}'
=20
 # Create /etc/timestamp during image construction to give a reasonably s=
ane default time setting
 ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_update_timestamp "
--=20
2.34.1


