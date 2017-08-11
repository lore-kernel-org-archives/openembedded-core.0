Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0AE487823A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 08:20:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Aug 2017 01:20:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,356,1498546800"; d="scan'208";a="1002520717"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 11 Aug 2017 01:20:53 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 37E6058035B;
	Fri, 11 Aug 2017 01:20:52 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 11:20:45 +0300
Message-Id: <1502439645-32133-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] mesa: Fix build with vulkan on non-x86
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
X-List-Received-Date: Fri, 11 Aug 2017 08:20:52 -0000

The intel vulkan driver requires libdrm-intel: Only enable it when
building for x86 or x86-64 similar to DRI drivers.

Building on non-x86* with vulkan leads to "--with-vulkan-drivers= ":
this is interpreted correctly by the build system.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 45361c7..3bb3cf4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -51,7 +51,10 @@ PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, dri3proto presentproto lib
 
 # Vulkan drivers need dri3 enabled
 # radeon could be enabled as well but requires gallium-llvm with llvm >= 3.9
-PACKAGECONFIG[vulkan] = "--with-vulkan-drivers=intel, --without-vulkan-drivers"
+VULKAN_DRIVERS = ""
+VULKAN_DRIVERS_append_x86 = ",intel"
+VULKAN_DRIVERS_append_x86-64 = ",intel"
+PACKAGECONFIG[vulkan] = "--with-vulkan-drivers=${VULKAN_DRIVERS}, --without-vulkan-drivers"
 
 PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
 
-- 
2.1.4


