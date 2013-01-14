Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TufkZ-00072c-UG
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Jan 2013 09:51:11 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0E8ZH6I002692
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2013 00:35:17 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 14 Jan 2013 00:35:16 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Jan 2013 16:35:41 +0800
Message-ID: <4c79adfdbd038632d42bc15507ef0951c141c929.1358152182.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1358152182.git.Qi.Chen@windriver.com>
References: <cover.1358152182.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V7 3/6] core-image.bbclass: support read-only rootfs
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
X-List-Received-Date: Mon, 14 Jan 2013 08:51:23 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The hook function is appended to ROOTFS_POSTPROCESS_COMMAND
properly to support the 'read-only-rootfs' image feature.

[YOCTO #3406]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/core-image.bbclass |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 2e67018..ebb9597 100644
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
@@ -73,9 +74,9 @@ inherit image
 
 # Create /etc/timestamp during image construction to give a reasonably sane default time setting
 ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
-
 # Zap the root password if debug-tweaks feature is not enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "", "zap_root_password ; ",d)}'
 # Allow openssh accept empty password login if both debug-tweaks and ssh-server-openssh are enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks ssh-server-openssh", "openssh_allow_empty_password; ", "",d)}'
-
+# Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
+ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
-- 
1.7.9.5



