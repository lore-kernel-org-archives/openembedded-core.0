Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E36B67835B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 05:55:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7V5tkPt012167
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 22:55:46 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 30 Aug 2017 22:55:45 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Aug 2017 13:54:58 +0800
Message-ID: <20170831055458.9197-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] rootfs-postcommands.bbclass: add support for /etc/ld.so.conf.d/*.conf
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
X-List-Received-Date: Thu, 31 Aug 2017 05:55:46 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

There are advantages in changing the contents of ld.so.conf to
"include /etc/ld.so.conf.d/*.conf" instead of directly listing
directories in it, just like most distributions are doing the same.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/rootfs-postcommands.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index dc5a76baba..af01eb550a 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -20,6 +20,9 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only
 # Generates test data file with data store variables expanded in json format
 ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data ; "
 
+# Add support for /etc/ld.so.conf.d/*.conf if ldconfig is enabled
+ROOTFS_POSTINSTALL_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', 'add_ld_so_conf_d ;', '', d)}"
+
 # Write manifest
 IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}.rootfs.manifest"
 ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
@@ -244,6 +247,16 @@ make_zimage_symlink_relative () {
 	fi
 }
 
+# Add support for /etc/ld.so.conf.d/*.conf
+add_ld_so_conf_d() {
+    if [ -f ${IMAGE_ROOTFS}${sysconfdir}/ld.so.conf ]; then
+        if ! `grep -q 'include ld.so.conf.d\/\*.conf' /etc/ld.so.conf`; then
+            echo 'include ld.so.conf.d/*.conf' >> ${IMAGE_ROOTFS}${sysconfdir}/ld.so.conf
+        fi
+        mkdir -p ${IMAGE_ROOTFS}${sysconfdir}/ld.so.conf.d
+    fi
+}
+
 python write_image_manifest () {
     from oe.rootfs import image_list_installed_packages
     from oe.utils import format_pkg_list
-- 
2.11.0


