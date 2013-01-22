Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TxXhs-0002rH-Db
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 07:51:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0M6aB5X017362
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 22:36:11 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 21 Jan 2013 22:36:10 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jan 2013 14:36:13 +0800
Message-ID: <3d6b90b5ad79166eda3883ad4e9d5ca1ed937f10.1358836314.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1358836314.git.Qi.Chen@windriver.com>
References: <cover.1358836314.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V8 2/6] image.bbclass: add a hook funtion to support readonly rootfs
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
X-List-Received-Date: Tue, 22 Jan 2013 06:51:47 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

read_only_rootfs_hook: this funtion is invoked only if 'read-only-rootfs'
is in IMAGE_FEATURES. It tweaks some basic files and makes populate-
volatile.sh script run at rootfs time.

For now, it has real effect only if the init system is sysvinit.

[YOCTO #3406]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 0293d2e..91045fc 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -201,6 +201,24 @@ run_intercept_scriptlets () {
 	fi
 }
 
+# A hook function to support read-only-rootfs IMAGE_FEATURES
+# Currently, it only supports sysvinit system.
+read_only_rootfs_hook () {
+	if ${@base_contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
+	        # Tweak the mount option in fstab
+		sed -i '/rootfs/ s/defaults/ro/' ${IMAGE_ROOTFS}/etc/fstab
+	        # Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
+		if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
+			sed -i 's/ROOTFS_READ_ONLY=no/ROOTFS_READ_ONLY=yes/' ${IMAGE_ROOTFS}/etc/default/rcS
+		fi
+	        # Run populate-volatile.sh at rootfs time to set up basic files
+	        # and directories to support read-only rootfs.
+		if [ -e ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
+			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
+		fi
+	fi
+}
+
 fakeroot do_rootfs () {
 	#set -x
 	# When use the rpm incremental image generation, don't remove the rootfs
-- 
1.7.9.5



