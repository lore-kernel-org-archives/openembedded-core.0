Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B71CE73068
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 05:40:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 20 Aug 2017 22:40:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,407,1498546800"; d="scan'208";a="1208228194"
Received: from ssen-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.129.109])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2017 22:40:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 17:39:40 +1200
Message-Id: <b464cf929437951f54936931fb207db832921274.1503293342.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1503293342.git.paul.eggleton@linux.intel.com>
References: <cover.1503293342.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/10] recipetool: create: disable PREMIRRORS and MIRRORS by default
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
X-List-Received-Date: Mon, 21 Aug 2017 05:40:35 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

When creating new recipes, we are almost certainly fetching a new
source rather that something that has already been fetched. I have
disable PREMIRRORS and MIRRORS settings in the recipe that created
by devtool while leaving an option for users to enable them manually
if needed. Since devtool already has this options, we need to ensure
that recipetool is able to handle the options passed from devtool.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 1 +
 scripts/lib/scriptutils.py       | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index e21e2bf..2c3a58a 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1169,5 +1169,6 @@ def register_commands(subparsers):
     parser_create.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_create.add_argument('--fetch-dev', action="store_true", help='For npm, also fetch devDependencies')
     parser_create.add_argument('--devtool', action="store_true", help=argparse.SUPPRESS)
+    parser_create.add_argument('--mirrors', action="store_true", help='Enable PREMIRRORS and MIRRORS for source tree fetching (disabled by default).')
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
2.9.5


