Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC2E65CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 11:23:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 17 Aug 2015 04:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,694,1432623600"; d="scan'208";a="626925817"
Received: from jwanrooi-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.11.216])
	by orsmga003.jf.intel.com with ESMTP; 17 Aug 2015 04:23:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Aug 2015 12:23:03 +0100
Message-Id: <8388b5c3f125ca8bfbe73e55492411d885f1e953.1439810551.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1439810551.git.paul.eggleton@linux.intel.com>
References: <cover.1439810551.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1439810551.git.paul.eggleton@linux.intel.com>
References: <cover.1439810551.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] devtool: extract: prevent externalsrc from interfering with extraction
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
X-List-Received-Date: Mon, 17 Aug 2015 11:23:11 -0000

In case the user has set up externalsrc outside of devtool, force
EXTERNALSRC to blank for the recipe when extracting so that the original
source URI is still in SRC_URI and we're still able to extract it. (This
isn't a problem with devtool itself because the bbappends within the
workspace layer that apply externalsrc are explicitly filtered out when
devtool parses a recipe).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index ea21877..e4ee7f7 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -294,6 +294,8 @@ def _extract_source(srctree, keep_temp, devbranch, d):
 
         task_executor = BbTaskExecutor(crd)
 
+        crd.setVar('EXTERNALSRC_forcevariable', '')
+
         logger.info('Fetching %s...' % pn)
         task_executor.exec_func('do_fetch', False)
         logger.info('Unpacking...')
-- 
2.1.0


