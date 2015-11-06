Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7345A766B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:17:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 06 Nov 2015 05:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="844167496"
Received: from bdiacone-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.207])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2015 05:17:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 13:16:58 +0000
Message-Id: <4dd5b839d2aad4742e036d4b13d1615cf7b4c30f.1446815768.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1446815768.git.paul.eggleton@linux.intel.com>
References: <cover.1446815768.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1446815768.git.paul.eggleton@linux.intel.com>
References: <cover.1446815768.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] oeqa/selftest/devtool: fix test if build directory is not inside COREBASE
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
X-List-Received-Date: Fri, 06 Nov 2015 13:17:11 -0000

Fix test_devtool_update_recipe_git to work when build directory is not
inside COREBASE.

Fixes [YOCTO #8639].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index f48e6a2..dcdef5a 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -582,7 +582,7 @@ class DevtoolTests(DevtoolBase):
         # Now try with auto mode
         runCmd('cd %s; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, os.path.basename(recipefile)))
         result = runCmd('devtool update-recipe %s' % testrecipe)
-        result = runCmd('git rev-parse --show-toplevel')
+        result = runCmd('git rev-parse --show-toplevel', cwd=os.path.dirname(recipefile))
         topleveldir = result.output.strip()
         relpatchpath = os.path.join(os.path.relpath(os.path.dirname(recipefile), topleveldir), testrecipe)
         expected_status = [(' M', os.path.relpath(recipefile, topleveldir)),
-- 
2.1.0


