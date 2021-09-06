Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.17763.1630897610744720113
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Sep 2021 20:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10098"; a="219925653"
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; 
   d="scan'208";a="219925653"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2021 20:06:50 -0700
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; 
   d="scan'208";a="522846512"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.236.127])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2021 20:06:49 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 4/4] kernel-devicetree: Fix interaction when packaging disabled
Date: Mon,  6 Sep 2021 11:06:24 +0800
Message-Id: <aef114187d9d62029008a1662395f2d9fa8373c4.1630897275.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630897275.git.anuj.mittal@intel.com>
References: <cover.1630897275.git.anuj.mittal@intel.com>
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
index 81dda8003f..3c5def1041 100644
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

