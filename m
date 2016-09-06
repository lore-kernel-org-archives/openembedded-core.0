Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A8E817751D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 10:04:10 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 06 Sep 2016 03:04:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,291,1470726000"; 
   d="scan'208";a="5042787"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2016 03:04:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2016 22:03:27 +1200
Message-Id: <c8853f441f459af50e223582f19ba25542385960.1473155977.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1473155977.git.paul.eggleton@linux.intel.com>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1473155977.git.paul.eggleton@linux.intel.com>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/9] recipetool: create: add --keep-temp command line option
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
X-List-Received-Date: Tue, 06 Sep 2016 10:04:10 -0000

For debugging it's useful to be able to tell recipetool to keep the
temporary directory.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 7cbd614..89ab748 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -765,7 +765,10 @@ def create_recipe(args):
         logger.info('Recipe %s has been created; further editing may be required to make it fully functional' % outfile)
 
     if tempsrc:
-        shutil.rmtree(tempsrc)
+        if args.keep_temp:
+            logger.info('Preserving temporary directory %s' % tempsrc)
+        else:
+            shutil.rmtree(tempsrc)
 
     return 0
 
@@ -1048,5 +1051,6 @@ def register_commands(subparsers):
     parser_create.add_argument('--also-native', help='Also add native variant (i.e. support building recipe for the build host as well as the target machine)', action='store_true')
     parser_create.add_argument('--src-subdir', help='Specify subdirectory within source tree to use', metavar='SUBDIR')
     parser_create.add_argument('-a', '--autorev', help='When fetching from a git repository, set SRCREV in the recipe to a floating revision instead of fixed', action="store_true")
+    parser_create.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_create.set_defaults(func=create_recipe)
 
-- 
2.5.5


