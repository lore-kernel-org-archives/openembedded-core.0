Return-Path: <anujx.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7F0636014F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 02:56:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 29 Jun 2016 19:56:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,550,1459839600"; d="scan'208";a="997755588"
Received: from amitta2x-ilbpg1.png.intel.com ([10.88.227.34])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2016 19:56:49 -0700
From: Anuj Mittal <anujx.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2016 10:57:12 +0800
Message-Id: <1467255432-22473-1-git-send-email-anujx.mittal@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [krogoth][jethro][PATCH] gcc: make sure header path is set correctly
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
X-List-Received-Date: Thu, 30 Jun 2016 02:56:49 -0000

We're setting the native header paths in do_configure_prepend,
and don't need to set them again here.

This results in gcc-target not being able to locate the headers
and not being able to detect glibc version, which in turn
results in SSP support not getting detected even though it's available
in libc.

Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 85630aa894278e7818c867179dc19ca2fbd994fc)
Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index b8dabe5..de99a0d 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -4,7 +4,6 @@ require gcc-configure-common.inc
 EXTRA_OECONF_PATHS = "\
     --with-sysroot=/ \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
-    --with-native-system-header-dir=${STAGING_DIR_TARGET}${target_includedir} \
     --with-gxx-include-dir=${includedir}/c++/${BINV} \
 "
 
-- 
1.9.1


