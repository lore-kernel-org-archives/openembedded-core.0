Return-Path: <ed.bartosh@linux.intel.com>
X-Greylist: delayed 574 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 Aug 2016 09:27:07 UTC
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D64F7731BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 09:27:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 22 Aug 2016 02:17:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,559,1464678000"; d="scan'208";a="159260558"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2016 02:17:34 -0700
Received: from ed.fi.intel.com (ed.fi.intel.com [10.237.72.179])
	by linux.intel.com (Postfix) with ESMTP id 197196A4080;
	Mon, 22 Aug 2016 02:17:15 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 12:17:28 +0300
Message-Id: <1471857448-3738-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] rm_work: don't remove timestamps of image tasks
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
X-List-Received-Date: Mon, 22 Aug 2016 09:27:08 -0000

Excluded removal of do_bootimg, do_bootdirectdisk and do_vmimg
timestamps to prevent unneeded rootfs rebuilds.

[YOCTO #10159]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/rm_work.bbclass | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 3e6c5ac..b71a9d1 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -66,14 +66,10 @@ do_rm_work () {
                 i=dummy
                 break
                 ;;
-            *do_rootfs*)
-               i=dummy
-               break
-               ;;
-            *do_image*)
-               i=dummy
-               break
-               ;;
+            *do_rootfs*|*do_image*|*do_bootimg*|*do_bootdirectdisk*|*do_vmimg*)
+                i=dummy
+                break
+                ;;
             *do_build*)
                 i=dummy
                 break
-- 
2.6.6


