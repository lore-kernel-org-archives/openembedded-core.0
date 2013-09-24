Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B4EB76CA5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 11:10:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Sep 2013 04:10:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,970,1371106800"; d="scan'208";a="406346035"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.52])
	by fmsmga002.fm.intel.com with ESMTP; 24 Sep 2013 04:10:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2013 12:10:14 +0100
Message-Id: <1380021014-16042-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] grub: don't patch generated configure to fix do_patch re-execution
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
X-List-Received-Date: Tue, 24 Sep 2013 11:10:20 -0000

If do_patch re-executes, patching the configure script will fail because
it will have been regenerated during do_configure. We're patching
configure.ac so we don't need to patch configure anyway.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../grub/files/grub-2.00-fpmath-sse-387-fix.patch           | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/recipes-bsp/grub/files/grub-2.00-fpmath-sse-387-fix.patch b/meta/recipes-bsp/grub/files/grub-2.00-fpmath-sse-387-fix.patch
index bea5944..c557f13 100644
--- a/meta/recipes-bsp/grub/files/grub-2.00-fpmath-sse-387-fix.patch
+++ b/meta/recipes-bsp/grub/files/grub-2.00-fpmath-sse-387-fix.patch
@@ -22,16 +22,3 @@ Index: grub-1.99/configure.ac
  fi
  
  # By default, GCC 4.4 generates .eh_frame sections containing unwind
-Index: grub-1.99/configure
-===================================================================
---- grub-1.99.orig/configure
-+++ grub-1.99/configure
-@@ -19991,7 +19991,7 @@ $as_echo "$grub_cv_cc_falign_loop" >&6;
- 
-   # Some toolchains enable these features by default, but they need
-   # registers that aren't set up properly in GRUB.
--  TARGET_CFLAGS="$TARGET_CFLAGS -mno-mmx -mno-sse -mno-sse2 -mno-3dnow"
-+  TARGET_CFLAGS="$TARGET_CFLAGS -mno-mmx -mno-sse -mno-sse2 -mno-3dnow -mfpmath=387"
- fi
- 
- # By default, GCC 4.4 generates .eh_frame sections containing unwind
-- 
1.8.1.2


