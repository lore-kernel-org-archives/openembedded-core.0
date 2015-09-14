Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2EB096E26B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:28:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2015 09:28:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,529,1437462000"; d="scan'208";a="768788467"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga001.jf.intel.com with ESMTP; 14 Sep 2015 09:28:10 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 09:22:47 -0700
Message-Id: <1442247767-7879-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: richard.purdie@intel.com
Subject: [PATCH] libgcc.inc: package baremetal multilib libraries
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
X-List-Received-Date: Mon, 14 Sep 2015 16:28:10 -0000

When building libgcc for baremetal cross-compilers, some files and libraries
may be built but not packaged. This patch fixes errors such as these:

ERROR: QA Issue: libgcc: Files/directories were installed but not shipped in any package:
  /usr/lib/arm-poky-eabi/4.9.3/thumb
  /usr/lib/arm-poky-eabi/4.9.3/fpu
  /usr/lib/arm-poky-eabi/4.9.3/thumb/libgcov.a
  /usr/lib/arm-poky-eabi/4.9.3/thumb/crtn.o
  /usr/lib/arm-poky-eabi/4.9.3/thumb/crtend.o
  /usr/lib/arm-poky-eabi/4.9.3/thumb/crtbegin.o
  /usr/lib/arm-poky-eabi/4.9.3/thumb/libgcc.a
  /usr/lib/arm-poky-eabi/4.9.3/thumb/crti.o
  /usr/lib/arm-poky-eabi/4.9.3/fpu/libgcov.a
  /usr/lib/arm-poky-eabi/4.9.3/fpu/crtn.o
  /usr/lib/arm-poky-eabi/4.9.3/fpu/crtend.o
  /usr/lib/arm-poky-eabi/4.9.3/fpu/crtbegin.o
  /usr/lib/arm-poky-eabi/4.9.3/fpu/libgcc.a
  /usr/lib/arm-poky-eabi/4.9.3/fpu/crti.o
Please set FILES such that these items are packaged. Alternatively if they are unneeded,
avoid installing them or delete them within do_install. [installed-vs-shipped]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/gcc/libgcc.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 739adbd..95709e4 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -28,6 +28,12 @@ FILES_${PN}-dev = "\
     ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
 "
 
+FILES_${PN}-dev_libc-baremetal = "\
+    ${base_libdir}/ \
+    ${libdir}/* \
+    ${libdir}/${TARGET_SYS}/* \
+"
+
 FILES_${PN}-dbg += "${base_libdir}/.debug/"
 
 LIBGCCBUILDTREENAME = "gcc-build-internal-"
-- 
1.9.1


