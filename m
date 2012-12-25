Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TnKtU-0004Vw-JW
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Dec 2012 04:09:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBP2sbV6010308
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Dec 2012 18:54:37 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 24 Dec 2012 18:54:37 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Dec 2012 10:55:05 +0800
Message-ID: <59ce0f37e56a93748c19bb45cc8aa9138cd7a5a1.1356403679.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1356403679.git.Qi.Chen@windriver.com>
References: <cover.1356403679.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V2 2/2] rootfs: support read-only-rootfs image feature
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
X-List-Received-Date: Tue, 25 Dec 2012 03:09:38 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Two small tweaks at rootfs time:
1) If IMAGE_FEATUERS contains 'read-only-rootfs', we make
populate-volatile.sh run at rootfs time to set up basic files and
directories.
2) If IMAGE_FEATURES contains 'read-only-rootfs', mount options in
/etc/fstab is automatically tweaked to the appropriate value.

[YOCTO #3406]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/core-image.bbclass |    4 +++-
 meta/classes/image.bbclass      |    6 ++++++
 meta/classes/rootfs_deb.bbclass |   14 ++++++++++++++
 meta/classes/rootfs_ipk.bbclass |   15 +++++++++++++++
 meta/classes/rootfs_rpm.bbclass |   20 +++++++++++++++++++-
 5 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 2e67018..ee0b397 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -28,6 +28,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # - dev-pkgs            - development packages (headers, etc.) for all installed packages in the rootfs
 # - dbg-pkgs            - debug symbol packages for all installed packages in the rootfs
 # - doc-pkgs            - documentation packages for all installed packages in the rootfs
+# - read-only-rootfs    - tweaks an image to support read-only rootfs
 #
 PACKAGE_GROUP_x11 = "packagegroup-core-x11"
 PACKAGE_GROUP_x11-base = "packagegroup-core-x11-base"
@@ -78,4 +79,5 @@ ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
 ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "", "zap_root_password ; ",d)}'
 # Allow openssh accept empty password login if both debug-tweaks and ssh-server-openssh are enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks ssh-server-openssh", "openssh_allow_empty_password; ", "",d)}'
-
+# Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
+ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "fstab_tweak_mount_opt; ", "",d)}'
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 8bf718a..3854ee7 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -394,6 +394,12 @@ zap_root_password () {
 	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
 } 
 
+# Change the mount options for rootfs in case of a read-only-rootfs image
+fstab_tweak_mount_opt () {
+	sed '/rootfs/ s/defaults/ro/' < ${IMAGE_ROOTFS}/etc/fstab > ${IMAGE_ROOTFS}/etc/fstab.new
+	mv ${IMAGE_ROOTFS}/etc/fstab.new ${IMAGE_ROOTFS}/etc/fstab
+}
+
 # allow openssh accept login with empty password string
 openssh_allow_empty_password () {
 	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 293953d..052d5d9 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -84,6 +84,20 @@ fakeroot rootfs_deb_do_rootfs () {
 
 	${ROOTFS_POSTPROCESS_COMMAND}
 
+	# Let populate-volatile.sh run at rootfs time in case of an read-only rootfs
+	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false", d)}; then
+		if [ ! -e ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
+			echo "${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh doesn't exist."
+			exit 1
+		else
+			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
+			if [ $? != 0 ]; then
+				echo "Running populate-volatile.sh under ${IMAGE_ROOTFS} failed"
+				exit 1
+			fi
+		fi
+	fi
+
 	log_check rootfs
 }
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 5c962de..b851049 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -114,6 +114,21 @@ fakeroot rootfs_ipk_do_rootfs () {
 			remove_packaging_data_files
 		fi
 	fi
+
+        # Let populate-volatile.sh run at rootfs time in case of a read-only-rootfs image
+	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false", d)}; then
+		if [ ! -e ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
+			echo "${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh doesn't exist."
+			exit 1
+		else
+			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
+			if [ $? != 0 ]; then
+				echo "Running populate-volatile.sh under ${IMAGE_ROOTFS} failed"
+				exit 1
+			fi
+		fi
+	fi
+
 	set +x
 	log_check rootfs
 }
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index f7e4c5e..733764a 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -89,6 +89,8 @@ fakeroot rootfs_rpm_do_rootfs () {
 
 	# Report delayed package scriptlets
 	for i in ${IMAGE_ROOTFS}/etc/rpm-postinsts/*; do
+                # We should add a check here to check whether we're building a read-only rootfs
+                # If so, exit 1, because there are still postintalls that are to be run on target.
 		if [ -f $i ]; then
 			echo "Delayed package scriptlet: `head -n 3 $i | tail -n 1`"
 		fi
@@ -104,7 +106,7 @@ for i in /etc/rpm-postinsts/*; do
 	if [ -f $i ] && $i; then
 		rm $i
 	else
-		echo "ERROR: postinst $i failed."
+		[ -f $i ] && echo "ERROR: postinst $i failed."
 	fi
 done
 rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
@@ -127,6 +129,22 @@ EOF
 	# Remove all remaining resolver files
 	rm -rf ${IMAGE_ROOTFS}/install
 
+	# Run init scripts that are necessary in case of an read-only rootfs
+	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false", d)}; then
+		if [ ! -e ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
+			echo "${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh doesn't exist."
+			exit 1
+		else
+			# Run populate_volatile.sh under ${IMAGE_ROOTFS} to set up basic
+                        # directories and files which are related to volatile storage.
+			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
+			if [ $? != 0 ]; then
+				echo "Running populate-volatile.sh under ${IMAGE_ROOTFS} failed"
+				exit 1
+			fi
+		fi
+	fi
+
 	log_check rootfs
 }
 
-- 
1.7.9.5



