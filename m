Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D07F96FFAB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 08:06:35 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 28 Jun 2016 01:06:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,540,1459839600"; d="scan'208";a="129745419"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2016 01:06:26 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2016 11:06:11 +0300
Message-Id: <1467101180-23116-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 01/10] bdwgc: update to 7.4.4
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
X-List-Received-Date: Tue, 28 Jun 2016 08:06:37 -0000

Drop 0001-fix-build-with-musl.patch, the problem is fixed upstream.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../bdwgc/bdwgc/0001-fix-build-with-musl.patch     | 35 ----------------------
 .../bdwgc/{bdwgc_7.4.2.bb => bdwgc_7.4.4.bb}       |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta/recipes-support/bdwgc/bdwgc/0001-fix-build-with-musl.patch
 rename meta/recipes-support/bdwgc/{bdwgc_7.4.2.bb => bdwgc_7.4.4.bb} (94%)

diff --git a/meta/recipes-support/bdwgc/bdwgc/0001-fix-build-with-musl.patch b/meta/recipes-support/bdwgc/bdwgc/0001-fix-build-with-musl.patch
deleted file mode 100644
index ab907fc..0000000
--- a/meta/recipes-support/bdwgc/bdwgc/0001-fix-build-with-musl.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 829a89e7f5785239a9384e3afd46c900f9d76ada Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 31 Aug 2015 19:55:32 +0000
-Subject: [PATCH] fix build with musl
-
-signal.h already includes bits/sigcontext.h
-Documentation seems to indicate that if you need the definitions in
-sigcontext.h, you are supposed to include signal.h and not sigcontext.h.
-
-a good fix should be to remove glibc
-specific understanding, in those ifdef's
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- os_dep.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/os_dep.c b/os_dep.c
-index 08c501d..5cb7873 100644
---- a/os_dep.c
-+++ b/os_dep.c
-@@ -41,7 +41,7 @@
- #   else /* __GLIBC__ < 2 */
-       /* libc5 doesn't have <sigcontext.h>: go directly with the kernel   */
-       /* one.  Check LINUX_VERSION_CODE to see which we should reference. */
--#     include <asm/sigcontext.h>
-+#     include <signal.h>
- #   endif /* __GLIBC__ < 2 */
- # endif
- #endif /* LINUX && !POWERPC */
--- 
-2.5.1
-
diff --git a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb b/meta/recipes-support/bdwgc/bdwgc_7.4.4.bb
similarity index 94%
rename from meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
rename to meta/recipes-support/bdwgc/bdwgc_7.4.4.bb
index 8d4dab3..600ced7 100644
--- a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
+++ b/meta/recipes-support/bdwgc/bdwgc_7.4.4.bb
@@ -21,9 +21,8 @@ SECTION = "devel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README.QUICK;md5=55f5088f90a982fed7af9a4897047ef7"
 
-SRCREV = "e31cdc288ffbee5bf25f948e19deb5a7ce846971"
+SRCREV = "d8bfa89c2a9c7c86fb98acbc53b5750600b95492"
 SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-7_4 \
-           file://0001-fix-build-with-musl.patch \
            file://0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch \
            file://0002-Altera-NIOS2-support.patch \
           "
-- 
2.8.1


