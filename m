Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2F8916FFD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 08:53:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 31 Mar 2016 01:54:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,421,1455004800"; d="scan'208";a="945099332"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.133.74])
	by orsmga002.jf.intel.com with ESMTP; 31 Mar 2016 01:53:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 21:53:35 +1300
Message-Id: <a66c738f1be961d780c38a28fd28ace888df8331.1459414389.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1459414389.git.paul.eggleton@linux.intel.com>
References: <cover.1459414389.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1459414389.git.paul.eggleton@linux.intel.com>
References: <cover.1459414389.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/5] devtool: modify: call shutdown on tinfoil when done
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
X-List-Received-Date: Thu, 31 Mar 2016 08:53:59 -0000

Strictly speaking we ought to explicitly shut down a tinfoil instance
when we're done with it. This doesn't affect modify's operation but is
important if you want to be able to call into modify() from another
plugin (though anyone doing so should be advised that the function is
by no means a stable API and is subject to change in future releases).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index f3f3e98..77a82d5 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -805,6 +805,8 @@ def modify(args, config, basepath, workspace):
 
     logger.info('Recipe %s now set up to build from %s' % (pn, srctree))
 
+    tinfoil.shutdown()
+
     return 0
 
 def _get_patchset_revs(args, srctree, recipe_path):
-- 
2.5.5


