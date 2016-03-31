Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1FE6A6FEE0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 08:53:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 31 Mar 2016 01:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,421,1455004800"; d="scan'208";a="945099286"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.133.74])
	by orsmga002.jf.intel.com with ESMTP; 31 Mar 2016 01:53:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 21:53:32 +1300
Message-Id: <c8342d13b35dae72579b3ba3f14b081266596a0e.1459414389.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1459414389.git.paul.eggleton@linux.intel.com>
References: <cover.1459414389.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1459414389.git.paul.eggleton@linux.intel.com>
References: <cover.1459414389.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/5] oe-publish-sdk: prevent specifying a directory for the SDK argument
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
X-List-Received-Date: Thu, 31 Mar 2016 08:53:50 -0000

The SDK argument is expected to be an installer .sh file; if a directory
is specified we can get an ugly failure later on; best to check up
front.

Fixes [YOCTO #9065].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-publish-sdk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index 1729a0d..cd912df 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -50,7 +50,10 @@ def publish(args):
 
     # Ensure the SDK exists
     if not os.path.exists(target_sdk):
-        logger.error("%s doesn't exist" % target_sdk)
+        logger.error("Specified SDK %s doesn't exist" % target_sdk)
+        return -1
+    if os.path.isdir(target_sdk):
+        logger.error("%s is a directory - expected path to SDK installer file" % target_sdk)
         return -1
 
     if ':' in destination:
-- 
2.5.5


