Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EC5F4766F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 23:27:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 21 Sep 2015 16:27:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,570,1437462000"; d="scan'208";a="649637783"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga003.jf.intel.com with ESMTP; 21 Sep 2015 16:27:09 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Sep 2015 16:21:20 -0700
Message-Id: <1442877680-8798-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1442877680-8798-1-git-send-email-juro.bystricky@intel.com>
References: <1442260397.2948.87.camel@pbcl.net>
	<1442877680-8798-1-git-send-email-juro.bystricky@intel.com>
Cc: richard.purdie@intel.com
Subject: [PATCH v2] libgcc.inc: package baremetal multilib libraries
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
X-List-Received-Date: Mon, 21 Sep 2015 23:27:09 -0000

When building libgcc some files and libraries may be built but not packaged.
The original code packaged only some explicitly specified files targeting mostly x86.
This patch does not discriminate between various targets.
It fixes errors such as these:

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
 meta/recipes-devtools/gcc/libgcc.inc | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 739adbd..95fa3f4 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -15,17 +15,10 @@ LICENSE_${PN}-dev = "GPL-3.0-with-GCC-exception"
 LICENSE_${PN}-dbg = "GPL-3.0-with-GCC-exception"
 
 
-FILES_${PN} = "${base_libdir}/libgcc*.so.*"
 FILES_${PN}-dev = "\
     ${base_libdir}/libgcc*.so \
-    ${libdir}/${TARGET_SYS}/${BINV}/*crt* \
-    ${libdir}/${TARGET_SYS}/${BINV}/64 \
-    ${libdir}/${TARGET_SYS}/${BINV}/32 \
-    ${libdir}/${TARGET_SYS}/${BINV}/x32 \
-    ${libdir}/${TARGET_SYS}/${BINV}/n32 \
-    ${libdir}/${TARGET_SYS}/${BINV}/libgcc* \
     ${@base_conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}', d)} \
-    ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
+    ${libdir}/${TARGET_SYS}/${BINV}* \
 "
 
 FILES_${PN}-dbg += "${base_libdir}/.debug/"
-- 
1.9.1


