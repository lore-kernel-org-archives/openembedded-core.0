Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D0E1D6FFD3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 03:33:11 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 20:33:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,352,1496127600"; d="scan'208";a="125959604"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by fmsmga005.fm.intel.com with ESMTP; 12 Jul 2017 20:33:09 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jul 2017 11:33:54 +0800
Message-Id: <1499916836-188258-2-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1499916836-188258-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1499916836-188258-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCH 1/3] recipetool: create: disable PREMIRRORS and MIRRORS by default
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
X-List-Received-Date: Thu, 13 Jul 2017 03:33:12 -0000

When creating new recipes, we are almost certainly fetching a new
source rather that something that has already been fetched. I have
disable PREMIRRORS and MIRRORS settings from datastore while leaving
an option for users to enable them manually if needed.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 scripts/lib/recipetool/create.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 2a5a84c..ee1f678 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -405,6 +405,7 @@ def create_recipe(args):
     source = args.source
     srcsubdir = ''
     srcrev = '${AUTOREV}'
+    mirrors = args.mirrors
 
     if os.path.isfile(source):
         source = 'file://%s' % os.path.abspath(source)
@@ -425,6 +426,13 @@ def create_recipe(args):
         tempsrc = tempfile.mkdtemp(prefix='recipetool-')
         srctree = tempsrc
         d = bb.data.createCopy(tinfoil.config_data)
+        if not mirrors:
+            # We do not need PREMIRRORS since we are almost certainly
+            # fetching new source rather than something that has already
+            # been fetched. Hence, we disable them by default.
+            # However, we provide an option for users to enable it.
+            d.setVar('PREMIRRORS', '')
+            d.setVar('MIRRORS', '')
         if fetchuri.startswith('npm://'):
             # Check if npm is available
             npm_bindir = check_npm(tinfoil, args.devtool)
@@ -1163,6 +1171,7 @@ def register_commands(subparsers):
     parser_create.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_create.add_argument('--fetch-dev', action="store_true", help='For npm, also fetch devDependencies')
     parser_create.add_argument('--devtool', action="store_true", help=argparse.SUPPRESS)
+    parser_create.add_argument('--mirrors', action="store_true", help='Enable PREMIRRORS and MIRRORS for source tree fetching (disable by default).')
     # FIXME I really hate having to set parserecipes for this, but given we may need
     # to call into npm (and we don't know in advance if we will or not) and in order
     # to do so we need to know npm's recipe sysroot path, there's not much alternative
-- 
2.7.4


