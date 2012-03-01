Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S30qp-0008UK-N5
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 08:54:59 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Feb 2012 23:46:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="72182152"
Received: from unknown (HELO swold-mobl.myhome.westell.com) ([10.255.15.82])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Feb 2012 23:46:31 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 23:46:22 -0800
Message-Id: <b9d93f6158d8768c107501f4c2e481caa02fcd9c.1330587785.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330587785.git.sgw@linux.intel.com>
References: <cover.1330587785.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330587785.git.sgw@linux.intel.com>
References: <cover.1330587785.git.sgw@linux.intel.com>
Subject: [PATCH 4/4] self-hosted-image: Create a VMDK image with correct SYSLINUX_* settings
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
X-List-Received-Date: Thu, 01 Mar 2012 07:55:00 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/images/self-hosted-image.bb |   16 ++++++++++++++--
 1 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index a0a7592..d56c2cb 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -1,11 +1,23 @@
 IMAGE_INSTALL = "task-core-boot task-core-apps-console task-core-ssh-openssh task-self-hosted"
 
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PR = "r5"
+
 CORE_IMAGE_EXTRA_INSTALL = "\
     task-self-hosted \
     "
 
 IMAGE_FEATURES += "x11-mini package-management"
 
-inherit core-image
+# Ensure there's enough space to do a core-image-minimal build, with rm_work enabled
+IMAGE_ROOTFS_EXTRA_SPACE = "2621440"
 
-PR = "r2"
+# Do a quiet boot with limited console messages
+APPEND += "quiet"
+
+IMAGE_FSTYPES = "vmdk"
+
+inherit core-image
-- 
1.7.7.6



