Return-Path: <elliot.smith@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EBF35731E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 13:12:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 07 Apr 2016 06:12:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,449,1455004800"; d="scan'208";a="953723537"
Received: from jmkenned-mobl1.ger.corp.intel.com (HELO lp.ger.corp.intel.com)
	([10.252.6.182])
	by fmsmga002.fm.intel.com with ESMTP; 07 Apr 2016 06:11:57 -0700
From: Elliot Smith <elliot.smith@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Apr 2016 14:11:46 +0100
Message-Id: <1460034706-13999-1-git-send-email-elliot.smith@intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] toaster.bbclass: strip task from the target
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
X-List-Received-Date: Thu, 07 Apr 2016 13:12:16 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

Current code in toaster_buildhistory_dump assumes that bitbake
target doesn't contain task name. It uses target as a part of
path to the files with data that it analizes. It fails to find
files if target contains task name. Stripping task from the
target should solve this.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Elliot Smith <elliot.smith@intel.com>
---
 meta/classes/toaster.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 1c0703c..004e068 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -317,6 +317,7 @@ python toaster_buildhistory_dump() {
     allpkgs = {}
     files = {}
     for target in e._pkgs:
+        target = target.split(':')[0] # strip ':<task>' suffix from the target
         installed_img_path = e.data.expand(os.path.join(BUILDHISTORY_DIR_IMAGE_BASE, target))
         if os.path.exists(installed_img_path):
             images[target] = {}
-- 
1.9.3

---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


