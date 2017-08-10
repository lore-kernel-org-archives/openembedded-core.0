Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9C1D96006E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 04:04:05 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 09 Aug 2017 21:04:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,349,1498546800"; d="scan'208";a="117474817"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by orsmga004.jf.intel.com with ESMTP; 09 Aug 2017 21:04:04 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Aug 2017 12:04:38 +0800
Message-Id: <1502337878-89084-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] recipetool: create: disable PREMIRRORS and MIRRORS by default
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
X-List-Received-Date: Thu, 10 Aug 2017 04:04:06 -0000

When creating new recipes, we are almost certainly fetching a new
source rather that something that has already been fetched. I have
disable PREMIRRORS and MIRRORS settings in the recipe that created
by devtool while leaving an option for users to enable them manually
if needed. Since devtool already has this options, we need to ensure
that recipetool is able to handle the options passed from devtool.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 scripts/lib/recipetool/create.py | 3 ++-
 scripts/lib/scriptutils.py       | 9 ++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 359eb9a..f6ea422 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -446,7 +446,7 @@ def create_recipe(args):
         srctree = os.path.join(tempsrc, 'source')
 
         try:
-            checksums, ftmpdir = scriptutils.fetch_url(tinfoil, srcuri, srcrev, srctree, logger, preserve_tmp=args.keep_temp)
+            checksums, ftmpdir = scriptutils.fetch_url(tinfoil, srcuri, srcrev, srctree, logger, preserve_tmp=args.keep_temp, mirrors=args.mirrors)
         except scriptutils.FetchUrlFailure as e:
             logger.error(str(e))
             sys.exit(1)
@@ -1169,5 +1169,6 @@ def register_commands(subparsers):
     parser_create.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_create.add_argument('--fetch-dev', action="store_true", help='For npm, also fetch devDependencies')
     parser_create.add_argument('--devtool', action="store_true", help=argparse.SUPPRESS)
+    parser_create.add_argument('--mirrors', action="store_true", help='Enable PREMIRRORS and MIRRORS for source tree fetching (disable by default).')
     parser_create.set_defaults(func=create_recipe)
 
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 9785438..11f1a78 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -102,7 +102,7 @@ class FetchUrlFailure(Exception):
     def __str__(self):
         return "Failed to fetch URL %s" % self.url
 
-def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False):
+def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False, mirrors=False):
     """
     Fetch the specified URL using normal do_fetch and do_unpack tasks, i.e.
     any dependencies that need to be satisfied in order to support the fetch
@@ -150,6 +150,13 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False):
                 f.write('WORKDIR = "%s"\n' % tmpworkdir)
                 # Set S out of the way so it doesn't get created under the workdir
                 f.write('S = "%s"\n' % os.path.join(tmpdir, 'emptysrc'))
+                if not mirrors:
+                    # We do not need PREMIRRORS since we are almost certainly
+                    # fetching new source rather than something that has already
+                    # been fetched. Hence, we disable them by default.
+                    # However, we provide an option for users to enable it.
+                    f.write('PREMIRRORS = ""\n')
+                    f.write('MIRRORS = ""\n')
 
             logger.info('Fetching %s...' % srcuri)
 
-- 
2.7.4


