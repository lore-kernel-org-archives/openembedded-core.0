Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D8410783A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 23:55:22 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Aug 2017 16:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,450,1498546800"; d="scan'208";a="146494503"
Received: from ekooi-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.249])
	by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2017 16:55:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 11:54:12 +1200
Message-Id: <3d923d8c63b04e0ba8db997f82b738ece8696128.1504137086.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1504137086.git.paul.eggleton@linux.intel.com>
References: <cover.1504137086.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/13] recipetool: create: make recently added branch/tag handling git specific
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
X-List-Received-Date: Wed, 30 Aug 2017 23:55:23 -0000

The branch and tag handling code that was recently added in OE-Core revs
ecca596b75cfda2f798a0bdde75f4f774e23a95b and
3afdcbdc9a3e65bc925ec61717784ffec67d529d is specific to git, so only
apply it when we're fetching from a git URL.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 8346336..4da745b 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -518,7 +518,7 @@ def create_recipe(args):
         # We need this checking mechanism to improve the recipe created by recipetool and devtool
         # is able to parse and build by bitbake.
         # If there is no input for branch name, then check for branch name with SRCREV provided.
-        if not srcbranch and not nobranch and srcrev and (srcrev != '${AUTOREV}'):
+        if not srcbranch and not nobranch and srcrev and (srcrev != '${AUTOREV}') and scheme in ['git', 'gitsm']:
             try:
                 cmd = 'git branch -r --contains'
                 check_branch, check_branch_err = bb.process.run('%s %s' % (cmd, srcrev), cwd=srctree)
@@ -549,7 +549,7 @@ def create_recipe(args):
             params['branch'] = srcbranch
             srcuri = bb.fetch2.encodeurl((scheme, network, path, user, passwd, params))
 
-        if storeTagName:
+        if storeTagName and scheme in ['git', 'gitsm']:
             # Re-introduced tag variable from storeTagName
             # Check srcrev using tag and check validity of the tag
             cmd = ('git rev-parse --verify %s' % (storeTagName))
-- 
2.9.5


