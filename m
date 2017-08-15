Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 432ED78483
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 04:07:49 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 14 Aug 2017 21:07:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,376,1498546800"; d="scan'208";a="118993441"
Received: from kbarque1-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.131.243])
	by orsmga004.jf.intel.com with ESMTP; 14 Aug 2017 21:07:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 16:07:17 +1200
Message-Id: <50d9fef8e5f4d25f89e2ee439f8c3668b742a6d3.1502770026.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1502770026.git.paul.eggleton@linux.intel.com>
References: <cover.1502770026.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] recipetool: create: fix incorrect URL variable usage
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
X-List-Received-Date: Tue, 15 Aug 2017 04:07:49 -0000

We have two variables here, srcuri and fetchuri. srcuri is what
eventually ends up in the recipe, whereas fetchuri is what we actually
pass to the fetcher when we fetch the source within recipetool -
sometimes these need to be different particularly for an upcoming patch
to handle automatically setting the branch parameter. In OE-Core
revision 9a47a6690052ef943c0d4760630ee630fb012153 I erroneously changed
the call to scriptutils.fetch_url() to pass srcuri instead of fetchuri -
this likely didn't have any ill effect, but change it back to passing
fetchuri to match the original intent.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 359eb9a..e21e2bf 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -446,7 +446,7 @@ def create_recipe(args):
         srctree = os.path.join(tempsrc, 'source')
 
         try:
-            checksums, ftmpdir = scriptutils.fetch_url(tinfoil, srcuri, srcrev, srctree, logger, preserve_tmp=args.keep_temp)
+            checksums, ftmpdir = scriptutils.fetch_url(tinfoil, fetchuri, srcrev, srctree, logger, preserve_tmp=args.keep_temp)
         except scriptutils.FetchUrlFailure as e:
             logger.error(str(e))
             sys.exit(1)
-- 
2.9.5


