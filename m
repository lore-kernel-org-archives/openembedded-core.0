Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B861A7835D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 22:01:55 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2017 15:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,379,1498546800"; d="scan'208";a="119382510"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 15 Aug 2017 15:01:53 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 15:01:30 -0700
Message-Id: <1502834490-920-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] gmp: improve reproducibility
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
X-List-Received-Date: Tue, 15 Aug 2017 22:01:55 -0000

Remove references to the host build system from generated/packaged
header file gmp.h. The file ends up in two different packages (libgmp-dev,
libgmp-dbg). Rather then modifying the file twice in two different
destinations after the installation, we modify the file gmp.h only once,
but before the installation.

[YOCTO #11922]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-support/gmp/gmp_6.1.2.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gmp/gmp_6.1.2.bb b/meta/recipes-support/gmp/gmp_6.1.2.bb
index 5e65075..b008710 100644
--- a/meta/recipes-support/gmp/gmp_6.1.2.bb
+++ b/meta/recipes-support/gmp/gmp_6.1.2.bb
@@ -25,8 +25,11 @@ EXTRA_OECONF_mipsarchr6_append = " --disable-assembly"
 PACKAGES =+ "libgmpxx"
 FILES_libgmpxx = "${libdir}/libgmpxx${SOLIBS}"
 
-do_install_append_class-target() {
-        sed -i "s|--sysroot=${STAGING_DIR_HOST}||g" ${D}${includedir}/gmp.h
+do_install_prepend_class-target() {
+        sed -i \
+        -e "s|--sysroot=${STAGING_DIR_HOST}||g" \
+        -e "s|${DEBUG_PREFIX_MAP}||g" \
+         ${B}/gmp.h
 }
 
 SSTATE_SCAN_FILES += "gmp.h"
-- 
2.7.4


