Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B6A9A782CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 10:31:19 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jul 2017 03:31:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,383,1496127600"; d="scan'208";a="128964720"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by fmsmga005.fm.intel.com with ESMTP; 20 Jul 2017 03:31:20 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jul 2017 18:31:58 +0800
Message-Id: <1500546720-145364-3-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500546720-145364-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1500546720-145364-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCHv2 2/4] devtool: standard: enable options for PREMIRRORS and MIRRORS
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
X-List-Received-Date: Thu, 20 Jul 2017 10:31:19 -0000

Since we have provide an option to manually enable PREMIRRORS and MIRRORS
in recipetool, we need to make sure devtool is having the same options
as devtool uses recipetool in creating new recipes.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 scripts/lib/devtool/standard.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 7e342e7..d7e2d0f 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -152,6 +152,8 @@ def add(args, config, basepath, workspace):
         extracmdopts += ' -a'
     if args.fetch_dev:
         extracmdopts += ' --fetch-dev'
+    if args.mirrors:
+        extracmdopts += ' --mirrors'
 
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
@@ -1842,6 +1844,7 @@ def register_commands(subparsers, context):
     parser_add.add_argument('--binary', '-b', help='Treat the source tree as something that should be installed verbatim (no compilation, same directory structure). Useful with binary packages e.g. RPMs.', action='store_true')
     parser_add.add_argument('--also-native', help='Also add native variant (i.e. support building recipe for the build host as well as the target machine)', action='store_true')
     parser_add.add_argument('--src-subdir', help='Specify subdirectory within source tree to use', metavar='SUBDIR')
+    parser_add.add_argument('--mirrors', help='Enable PREMIRRORS and MIRRORS for source tree fetching (disable by default).', action="store_true")
     parser_add.set_defaults(func=add, fixed_setup=context.fixed_setup)
 
     parser_modify = subparsers.add_parser('modify', help='Modify the source for an existing recipe',
-- 
2.7.4


