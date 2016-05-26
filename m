Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1C21C736B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 20:39:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2016 13:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,370,1459839600"; d="scan'208";a="985453233"
Received: from yocto-dev86.jf.intel.com ([10.7.198.60])
	by orsmga002.jf.intel.com with ESMTP; 26 May 2016 13:39:52 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 13:40:37 -0700
Message-Id: <1464295237-30868-1-git-send-email-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.8.2
Subject: [PATCH] package.bbclass: fix strip and split logic
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
X-List-Received-Date: Thu, 26 May 2016 20:39:52 -0000

In order for strip and split to work together, we need to populate the
data structors if either split OR strip are not inhibited.

Original behaviour:

INHIBIT_PACKAGE_STRIP: no strip, no debug split
INHIBIT_PACKAGE_DEBUG_SPLIT: strip, no split

Behaviour after this patch:

INHIBIT_PACKAGE_STRIP: no strip, debug split
INHIBIT_PACKAGE_DEBUG_SPLIT: strip, no split
BOTH: no strip, no split, DNP data structures

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/classes/package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ffd4eff..a4125a0 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -903,7 +903,8 @@ python split_and_strip_files () {
     inodes = {}
     libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir", True))
     baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir", True))
-    if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
+    if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1' or \
+            d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) != '1'):
         for root, dirs, files in cpath.walk(dvar):
             for f in files:
                 file = os.path.join(root, f)
-- 
2.8.2


