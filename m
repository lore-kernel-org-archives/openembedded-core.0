Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7E4B078697
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 02:46:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w562kLhJ024883
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jun 2018 19:46:21 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Tue, 5 Jun 2018 19:46:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2018 10:54:41 +0800
Message-ID: <9ac9dc93105f3728e30fcf7c7ed2b3afd51666e9.1528252931.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528252931.git.liezhi.yang@windriver.com>
References: <cover.1528252931.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 06/11] rootfs-postcommands: split ssh_allow_empty_password
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
X-List-Received-Date: Wed, 06 Jun 2018 02:46:20 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

"allow root login" should not be bundled in ssh_allow_empty_password,
because some distro may want only one of "allow root login" and "allow
empty password", so split it out into ssh_allow_root_login and add new
imagefeature allow-root-login so they can be controlled separately,
debug-tweaks will still include both of them.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/image.bbclass                    |  2 +-
 meta/classes/rootfs-postcommands.bbclass      | 25 ++++++++++++++++++++++---
 meta/lib/oeqa/selftest/cases/imagefeatures.py |  4 ++--
 3 files changed, 25 insertions(+), 6 deletions(-)

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
index 221869e..7dde2f8 100644
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
 
@@ -143,12 +146,11 @@ zap_empty_root_password () {
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
@@ -171,6 +173,23 @@ ssh_allow_empty_password () {
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
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 09e0b20..b60ab8a 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -23,7 +23,7 @@ class ImageFeatures(OESelftestTestCase):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh empty-root-password allow-empty-password"\n'
+        features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh empty-root-password allow-empty-password allow-root-login"\n'
         features += 'INHERIT += "extrausers"\n'
         features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
         self.write_config(features)
@@ -49,7 +49,7 @@ class ImageFeatures(OESelftestTestCase):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh allow-empty-password"\n'
+        features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh allow-empty-password allow-root-login"\n'
         features += 'INHERIT += "extrausers"\n'
         features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
         self.write_config(features)
-- 
2.7.4


