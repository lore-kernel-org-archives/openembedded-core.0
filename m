Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TufkY-00072W-Ht
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 09:50:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0E8ZFED018133
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2013 00:35:15 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 14 Jan 2013 00:35:15 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Jan 2013 16:35:40 +0800
Message-ID: <4d6a5afdcd4222d653334ae32e75df962eac5df1.1358152182.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1358152182.git.Qi.Chen@windriver.com>
References: <cover.1358152182.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V7 2/6] image.bbclass: add a hook funtion to support readonly rootfs
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
X-List-Received-Date: Mon, 14 Jan 2013 08:50:35 -0000
X-List-Received-Date: Mon, 14 Jan 2013 08:50:35 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

read_only_rootfs_hook: this funtion is invoked only if 'read-only-rootfs'
is in IMAGE_FEATURES. It tweaks some basic files and makes populate-
volatile.sh script run at rootfs time.

[YOCTO #3406]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass |   16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index e494689..834497a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -185,7 +185,6 @@ do_build[nostamp] = "1"
 # task, so that we have a single fakeroot context for the whole process.
 do_rootfs[umask] = "022"
 
-
 run_intercept_scriptlets () {
 	if [ -d ${WORKDIR}/intercept_scripts ]; then
 		cd ${WORKDIR}/intercept_scripts
@@ -396,6 +395,21 @@ zap_root_password () {
 	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
 } 
 
+# A hook function to support read-only-rootfs IMAGE_FEATURES
+read_only_rootfs_hook () {
+	# Tweak the mount option in fstab
+	sed -i '/rootfs/ s/defaults/ro/' ${IMAGE_ROOTFS}/etc/fstab
+	# Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
+	if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
+		sed -i 's/ROOTFS_READ_ONLY=no/ROOTFS_READ_ONLY=yes/' ${IMAGE_ROOTFS}/etc/default/rcS
+	fi
+	# Run populate-volatile.sh at rootfs time to set up basic files
+	# and directories to support read-only rootfs.
+	if [ -e ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
+		${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
+	fi
+}
+
 # allow openssh accept login with empty password string
 openssh_allow_empty_password () {
 	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
-- 
1.7.9.5



