Return-Path: <anujx.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3416FEFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 09:09:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 14 Jun 2016 02:09:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="987044190"
Received: from amitta2x-ilbpg1.png.intel.com ([10.88.227.34])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jun 2016 02:09:47 -0700
From: Anuj Mittal <anujx.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 17:10:20 +0800
Message-Id: <1465895420-1660-1-git-send-email-anujx.mittal@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gcc: make sure header path is set correctly
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
X-List-Received-Date: Tue, 14 Jun 2016 09:09:48 -0000

We're setting the native header paths in do_configure_prepend,
and don't need to set them again here.

This results in gcc-target not being able to locate the headers
and not being able to detect glibc version, which in turn
results in SSP support not getting detected even though it's available
in libc.

Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index a960ed4..37c5c62 100644
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


