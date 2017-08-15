Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1C5CA784F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 09:33:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2017 02:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="1162726738"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by orsmga001.jf.intel.com with ESMTP; 15 Aug 2017 02:33:05 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Aug 2017 19:23:58 -0700
Message-Id: <1502763838-84450-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] insane: add qa check for lowercase recipe name
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
X-List-Received-Date: Tue, 15 Aug 2017 09:33:05 -0000

Since we disabled uppercase characters in overrides a few releases ago,
uppercase characters in recipe names (and for that matter, distro and
machine names) cannot be supported due to their reliance upon overrides
including the name.

QA check will produce an warning message when it verify that recipe
name is not lowercase.

[YOCTO# 11592]

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/classes/insane.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index b7177c9..8e062d1 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -27,7 +27,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             installed-vs-shipped compile-host-path install-host-path \
             pn-overrides infodir build-deps \
             unknown-configure-option symlink-to-sysroot multilib \
-            invalid-packageconfig host-user-contaminated \
+            invalid-packageconfig host-user-contaminated pn_lowercase \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -1274,7 +1274,9 @@ python () {
     if pn in overrides:
         msg = 'Recipe %s has PN of "%s" which is in OVERRIDES, this can result in unexpected behaviour.' % (d.getVar("FILE"), pn)
         package_qa_handle_error("pn-overrides", msg, d)
-
+    if pn != pn.lower():
+        package_qa_handle_error("pn_lowercase", 'PN: %s is not lower case, this can result in unexpected behavior.' % pn, d)
+    
     issues = []
     if (d.getVar('PACKAGES') or "").split():
         for dep in (d.getVar('QADEPENDS') or "").split():
-- 
2.7.4


