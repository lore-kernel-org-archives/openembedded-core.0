Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B641278221
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 12:15:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 23 Aug 2017 05:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,416,1498546800"; d="scan'208";a="1006804084"
Received: from skhurana-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.43])
	by orsmga003.jf.intel.com with ESMTP; 23 Aug 2017 05:15:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 00:14:48 +1200
Message-Id: <cdd76ab80e6c1505a9e29adfed20e5f07a13d265.1503490439.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1503490439.git.paul.eggleton@linux.intel.com>
References: <cover.1503490439.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] recipetool: create: fix npm license code regression
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
X-List-Received-Date: Wed, 23 Aug 2017 12:15:01 -0000

OE-Core commit 1df60b09f7a60427795ec828c9c7180e4e52f98c caused a
regression in npm handling since it still expected to be able to get the
results of the license handling, but this no longer happens until after
the npm plugin is called. Thus, call the license handling function
ourselves here (which will record this as having been handled so it
doesn't get done again later).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_npm.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 6252e91..ae53972 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -208,11 +208,14 @@ class NpmRecipeHandler(RecipeHandler):
 
                 # Split each npm module out to is own package
                 npmpackages = oe.package.npm_split_package_dirs(srctree)
+                licvalues = None
                 for item in handled:
                     if isinstance(item, tuple):
                         if item[0] == 'license':
                             licvalues = item[1]
                             break
+                if not licvalues:
+                    licvalues = handle_license_vars(srctree, lines_before, handled, extravalues, d)
                 if licvalues:
                     # Augment the license list with information we have in the packages
                     licenses = {}
-- 
2.9.5


