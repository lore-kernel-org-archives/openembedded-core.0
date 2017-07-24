Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id F35BF783B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 08:24:22 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 24 Jul 2017 01:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,406,1496127600"; d="scan'208";a="996343402"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by orsmga003.jf.intel.com with ESMTP; 24 Jul 2017 01:24:23 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jul 2017 16:25:01 +0800
Message-Id: <1500884703-154582-2-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500884703-154582-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1500884703-154582-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCHv3 1/3] recipetool: create: disable PREMIRRORS and MIRRORS by default
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
X-List-Received-Date: Mon, 24 Jul 2017 08:24:23 -0000

When creating new recipes, we are almost certainly fetching a new
source rather that something that has already been fetched. I have
disable PREMIRRORS and MIRRORS settings from tinfoil while leaving
an option for users to enable them manually if needed.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 scripts/lib/recipetool/create.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 359eb9a..3885017 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -422,6 +422,7 @@ def create_recipe(args):
     source = args.source
     srcsubdir = ''
     srcrev = '${AUTOREV}'
+    mirrors = args.mirrors
 
     if os.path.isfile(source):
         source = 'file://%s' % os.path.abspath(source)
@@ -440,6 +441,14 @@ def create_recipe(args):
             srcrev = res.group(1)
             srcuri = rev_re.sub('', srcuri)
 
+        if not mirrors:
+            # We do not need PREMIRRORS since we are almost certainly
+            # fetching new source rather than something that has already
+            # been fetched. Hence, we disable them by default.
+            # However, we provide an option for users to enable it.
+            tinfoil.config_data.setVar('PREMIRRORS', '')
+            tinfoil.config_data.setVar('MIRRORS', '')
+
         tmpparent = tinfoil.config_data.getVar('BASE_WORKDIR')
         bb.utils.mkdirhier(tmpparent)
         tempsrc = tempfile.mkdtemp(prefix='recipetool-', dir=tmpparent)
@@ -1169,5 +1178,6 @@ def register_commands(subparsers):
     parser_create.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_create.add_argument('--fetch-dev', action="store_true", help='For npm, also fetch devDependencies')
     parser_create.add_argument('--devtool', action="store_true", help=argparse.SUPPRESS)
+    parser_create.add_argument('--mirrors', action="store_true", help='Enable PREMIRRORS and MIRRORS for source tree fetching (disable by default).')
     parser_create.set_defaults(func=create_recipe)
 
-- 
2.7.4


