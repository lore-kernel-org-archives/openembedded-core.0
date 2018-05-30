Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CEEE974F21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 08:56:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4U8u4Vs004986
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 01:56:04 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 30 May 2018 01:56:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2018 17:03:56 +0800
Message-ID: <b171f1d32f54b9c817b5ca471fa99e900f76169d.1527670923.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527670923.git.liezhi.yang@windriver.com>
References: <cover.1527670923.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/16] rootfs-postcommands: split ssh_allow_empty_password
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
X-List-Received-Date: Wed, 30 May 2018 08:56:03 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

"allow root login" should not be bundled in ssh_allow_empty_password,
because some distro may want only one of "allow root login" and "allow
empty password", so split it out into ssh_allow_root_login and add new
imagefeature allow-root-login so they can be controlled separately,
debug-tweaks will still include both of them.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/image.bbclass               |  2 +-
 meta/classes/rootfs-postcommands.bbclass | 25 ++++++++++++++++++++++---
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2247b30..28e64ba 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -23,7 +23,7 @@ inherit ${TESTIMAGECLASS}
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
-IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs empty-root-password allow-empty-password post-install-logging"
+IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs empty-root-password allow-empty-password allow-root-login post-install-logging"
 
 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?= "0"
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 5522209..72cc6db 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -2,9 +2,12 @@
 # Zap the root password if debug-tweaks feature is not enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password ; ",d)}'
 
-# Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks is enabled
+# Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks or allow-empty-password is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-empty-password' ], "ssh_allow_empty_password; ", "",d)}'
 
+# Allow dropbear/openssh to accept root logins if debug-tweaks or allow-root-login is enabled
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-root-login' ], "ssh_allow_root_login; ", "",d)}'
+
 # Enable postinst logging if debug-tweaks is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
 
@@ -146,12 +149,11 @@ zap_empty_root_password () {
 }
 
 #
-# allow dropbear/openssh to accept root logins and logins from accounts with an empty password string
+# allow dropbear/openssh to accept logins from accounts with an empty password string
 #
 ssh_allow_empty_password () {
 	for config in sshd_config sshd_config_readonly; do
 		if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/$config ]; then
-			sed -i 's/^[#[:space:]]*PermitRootLogin.*/PermitRootLogin yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/$config
 			sed -i 's/^[#[:space:]]*PermitEmptyPasswords.*/PermitEmptyPasswords yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/$config
 		fi
 	done
@@ -174,6 +176,23 @@ ssh_allow_empty_password () {
 	fi
 }
 
+#
+# allow dropbear/openssh to accept root logins
+#
+ssh_allow_root_login () {
+	for config in sshd_config sshd_config_readonly; do
+		if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/$config ]; then
+			sed -i 's/^[#[:space:]]*PermitRootLogin.*/PermitRootLogin yes/' ${IMAGE_ROOTFS}${sysconfdir}/ssh/$config
+		fi
+	done
+
+	if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then
+		if grep -q DROPBEAR_EXTRA_ARGS ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear 2>/dev/null ; then
+			sed -i '/^DROPBEAR_EXTRA_ARGS=/ s/-w//' ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear
+		fi
+	fi
+}
+
 ssh_disable_dns_lookup () {
 	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
 		sed -i -e 's:#UseDNS yes:UseDNS no:' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
-- 
2.7.4


