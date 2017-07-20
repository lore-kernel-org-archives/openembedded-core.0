Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 703C278291
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 10:31:18 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jul 2017 03:31:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,383,1496127600"; d="scan'208";a="128964714"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by fmsmga005.fm.intel.com with ESMTP; 20 Jul 2017 03:31:19 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jul 2017 18:31:57 +0800
Message-Id: <1500546720-145364-2-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500546720-145364-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1500546720-145364-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCHv2 1/4] recipetool: create: disable PREMIRRORS and MIRRORS by default
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
X-List-Received-Date: Thu, 20 Jul 2017 10:31:18 -0000

When creating new recipes, we are almost certainly fetching a new
source rather that something that has already been fetched. I have
disable PREMIRRORS and MIRRORS settings from datastore while leaving
an option for users to enable them manually if needed.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 scripts/lib/recipetool/create.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 8e63580..1015d02 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -422,6 +422,7 @@ def create_recipe(args):
     source = args.source
     srcsubdir = ''
     srcrev = '${AUTOREV}'
+    mirrors = args.mirrors
 
     if os.path.isfile(source):
         source = 'file://%s' % os.path.abspath(source)
@@ -442,6 +443,13 @@ def create_recipe(args):
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
@@ -1180,6 +1188,7 @@ def register_commands(subparsers):
     parser_create.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_create.add_argument('--fetch-dev', action="store_true", help='For npm, also fetch devDependencies')
     parser_create.add_argument('--devtool', action="store_true", help=argparse.SUPPRESS)
+    parser_create.add_argument('--mirrors', action="store_true", help='Enable PREMIRRORS and MIRRORS for source tree fetching (disable by default).')
     # FIXME I really hate having to set parserecipes for this, but given we may need
     # to call into npm (and we don't know in advance if we will or not) and in order
     # to do so we need to know npm's recipe sysroot path, there's not much alternative
-- 
2.7.4


