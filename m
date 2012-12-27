Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1To3td-0002ht-Dq
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 04:12:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBR2viRY023584
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2012 18:57:44 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 26 Dec 2012 18:57:43 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Dec 2012 10:57:39 +0800
Message-ID: <819997e2cad5d6a4bf2621fb7cc443105ca0fc87.1356576405.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1356576405.git.Qi.Chen@windriver.com>
References: <cover.1356576405.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/4] image.bbclass: add two hook funtions to support read-only rootfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Dec 2012 03:12:55 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

read_only_rootfs_hook: this funtion is invoked only if 'read-only-rootfs'
is in IMAGE_FEATURES. It tweaks some basic files and makes populate-
volatile.sh script run at rootfs time.

choose_volatile_conf_file: this function properly chooses the right
conf file for volatile storage handling according to the IMAGE_FEATURES.

[YOCTO #3406]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 8bf718a..15d42d0 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -394,6 +394,35 @@ zap_root_password () {
 	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
 } 
 
+# A hook function to support read-only-rootfs IMAGE_FEATURES
+read_only_rootfs_hook () {
+	# Tweak the mount option in fstab
+	sed '/rootfs/ s/defaults/ro/' < ${IMAGE_ROOTFS}/etc/fstab > ${IMAGE_ROOTFS}/etc/fstab.new
+	mv ${IMAGE_ROOTFS}/etc/fstab.new ${IMAGE_ROOTFS}/etc/fstab
+	# Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
+	sed 's/ROOTFS_READ_ONLY=no/ROOTFS_READ_ONLY=yes/' < ${IMAGE_ROOTFS}/etc/default/rcS > ${IMAGE_ROOTFS}/etc/default/rcS.new
+	mv ${IMAGE_ROOTFS}/etc/default/rcS.new ${IMAGE_ROOTFS}/etc/default/rcS
+	# Run populate-volatile.sh at rootfs time to set up basic files
+	# and directories to support read-only rootfs.
+	if [ ! -e ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
+		echo "${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh doesn't exist."
+		exit 1
+	else
+		${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
+	fi
+}
+
+# Choose the correct config file for volatile storage handling according to the image type
+choose_volatile_conf_file () {
+	if ${@base_contains("IMAGE_FEATURES", "x11-sato", "true", "false" ,d)}; then
+		cp ${IMAGE_ROOTFS}/etc/default/volatiles_stage/volatiles-readonly-sato \
+			${IMAGE_ROOTFS}/etc/default/volatiles/00_core_readonly
+	else
+		cp ${IMAGE_ROOTFS}/etc/default/volatiles_stage/volatiles-readonly-minimal \
+			${IMAGE_ROOTFS}/etc/default/volatiles/00_core_readonly
+	fi
+}
+
 # allow openssh accept login with empty password string
 openssh_allow_empty_password () {
 	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
-- 
1.7.9.5



