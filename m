Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1R4Ki8-0005n8-2S
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 00:47:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Sep 2011 15:42:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="48941671"
Received: from unknown (HELO localhost) ([10.7.199.145])
	by orsmga002.jf.intel.com with ESMTP; 15 Sep 2011 15:42:01 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 15:41:38 -0700
Message-Id: <493455fd67419c8a4a9f80a6013d5a2bcba48293.1316126173.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316126173.git.dvhart@linux.intel.com>
References: <cover.1316126173.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1316126173.git.dvhart@linux.intel.com>
References: <cover.1316126173.git.dvhart@linux.intel.com>
Subject: [PATCH 2/2] Prevent IMAGE_FEATURES from contaminating initrd
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
X-List-Received-Date: Thu, 15 Sep 2011 22:47:12 -0000

Set IMAGE_FEATURES="" in core-image-initramfs to prevent
the setting of things like EXTRA_IMAGE_FEATURES in local.conf
from contaminating the initrd with features meant for the rootfs.

Suggested-by: Richard Purdie <richardpurdie@linuxfoundation.org>
Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 .../images/core-image-minimal-initramfs.bb         |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 3246d5c..0bac27a 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -2,6 +2,9 @@
 
 IMAGE_INSTALL = "initramfs-live-boot initramfs-live-install busybox udev base-passwd"
 
+# Do not pollute the initrd image with rootfs features
+IMAGE_FEATURES = ""
+
 export IMAGE_BASENAME = "core-image-minimal-initramfs"
 IMAGE_LINGUAS = ""
 
-- 
1.7.6



