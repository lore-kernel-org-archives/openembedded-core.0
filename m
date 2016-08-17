Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 87D4F760A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 23:25:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 17 Aug 2016 16:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,536,1464678000"; d="scan'208";a="1037454886"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2016 16:25:27 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2016 16:25:33 -0700
Message-Id: <20160817232533.92478-2-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160817232533.92478-1-stephano.cetola@linux.intel.com>
References: <20160817232533.92478-1-stephano.cetola@linux.intel.com>
Subject: [PATCH V5] rootfs.py: allow removal of unneeded packages
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
X-List-Received-Date: Wed, 17 Aug 2016 23:25:27 -0000

Current functionality allows for the removal of certain packages
based on the read-only image feature. This patch extends this
functionality by adding the FORCE_RO_REMOVE variable, which will
remove these packages regardless of any image features.

[ YOCTO #9491 ]

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index ed0bab1..7c620e9 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -253,7 +253,9 @@ class Rootfs(object, metaclass=ABCMeta):
 
         image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
                                         True, False, self.d)
-        if image_rorfs:
+        image_rorfs_force = self.d.getVar('FORCE_RO_REMOVE', True)
+
+        if image_rorfs or image_rorfs_force == "1":
             # Remove components that we don't need if it's a read-only rootfs
             unneeded_pkgs = self.d.getVar("ROOTFS_RO_UNNEEDED", True).split()
             pkgs_installed = image_list_installed_packages(self.d)
-- 
2.9.3


