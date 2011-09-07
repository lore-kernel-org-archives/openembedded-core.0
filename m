Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R1KiB-0008Se-1A
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 18:10:51 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Sep 2011 09:05:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,346,1312182000"; d="scan'208";a="50058146"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.53])
	by fmsmga002.fm.intel.com with ESMTP; 07 Sep 2011 09:05:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 17:05:39 +0100
Message-Id: <edd6036c0484f56edb74d8a42359dfb7c5602a79.1315411460.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1315411459.git.paul.eggleton@linux.intel.com>
References: <cover.1315411459.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1315411459.git.paul.eggleton@linux.intel.com>
References: <cover.1315411459.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] core-image.bbclass: zap root password if debug-tweaks not enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Sep 2011 16:10:51 -0000

If you do not have debug-tweaks in IMAGE_FEATURES, then zap the root
password so that you can't log in as root without a password in an image
potentially intended for a production system.

Also mention debug-tweaks in the comments listing IMAGE_FEATURES in this
file.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/core-image.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 507d6a6..8e83d4a 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -26,6 +26,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # - nfs-server          - NFS server (exports / over NFS to everybody)
 # - ssh-server-dropbear - SSH server (dropbear)
 # - ssh-server-openssh  - SSH server (openssh)
+# - debug-tweaks        - makes an image suitable for development
 #
 PACKAGE_GROUP_apps-console-core = "task-core-apps-console"
 PACKAGE_GROUP_x11-base = "task-core-x11-base"
@@ -65,3 +66,7 @@ inherit image
 
 # Create /etc/timestamp during image construction to give a reasonably sane default time setting
 ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
+
+# Zap the root password if debug-tweaks feature is not enabled
+ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "", "zap_root_password ; ",d)}'
+
-- 
1.7.4.1



