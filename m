Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.11928.1625242832205213805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="196043508"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="196043508"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:33 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="626776475"
Received: from ypoh4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.151.64])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:32 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 16/22] kernel-devicetree: Fix interaction when packaging disabled
Date: Sat,  3 Jul 2021 00:19:58 +0800
Message-Id: <13a1e550b0252d6f3a1164d39614f8ac847e1095.1625242066.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625242066.git.anuj.mittal@intel.com>
References: <cover.1625242066.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When packaging is disabled using the nopackages class, ensure we don't
add to PACKAGES. This fixes builds where we have an unpackaged kernel
alongside a packaged kernel.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d6b114cf5a9b22688c0b59a3afc46a07450d87b5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/kernel-devicetree.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index d4f8864200..27a4905ac6 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -1,8 +1,11 @@
 # Support for device tree generation
-PACKAGES_append = " \
-    ${KERNEL_PACKAGE_NAME}-devicetree \
-    ${@[d.getVar('KERNEL_PACKAGE_NAME') + '-image-zimage-bundle', ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
-"
+python () {
+    if not bb.data.inherits_class('nopackages', d):
+        d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-devicetree")
+        if d.getVar('KERNEL_DEVICETREE_BUNDLE') == '1':
+            d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-image-zimage-bundle")
+}
+
 FILES_${KERNEL_PACKAGE_NAME}-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
 FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
 
-- 
2.31.1

