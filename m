Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 24461731E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:00:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2016 04:00:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,330,1449561600"; d="scan'208";a="732272823"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by orsmga003.jf.intel.com with ESMTP; 22 Jan 2016 04:00:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:59:58 +1300
Message-Id: <8820e9959aca8467dd9c2a660bce61f2c078765b.1453463789.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 11/14] devtool / recipetool: support specifying a subdirectory within the fetched source
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
X-List-Received-Date: Fri, 22 Jan 2016 12:00:33 -0000

Sometimes you don't want to build an entire project, just a subdirectory
of it; add a --src-subdir option to make that easier. (We still look for
a single subdirectory in what gets unpacked, e.g. what you might find
within a tarball, so whatever you specify with this option is added onto
the end of that.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py  |  6 ++++++
 scripts/lib/recipetool/create.py | 11 +++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 5390f51..f19de27 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -141,6 +141,8 @@ def add(args, config, basepath, workspace):
         extracmdopts += ' -b'
     if args.also_native:
         extracmdopts += ' --also-native'
+    if args.src_subdir:
+        extracmdopts += ' --src-subdir "%s"' % args.src_subdir
 
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
@@ -208,6 +210,9 @@ def add(args, config, basepath, workspace):
     if not rd:
         return 1
 
+    if args.src_subdir:
+        srctree = os.path.join(srctree, args.src_subdir)
+
     bb.utils.mkdirhier(os.path.dirname(appendfile))
     with open(appendfile, 'w') as f:
         f.write('inherit externalsrc\n')
@@ -1308,6 +1313,7 @@ def register_commands(subparsers, context):
     parser_add.add_argument('--no-git', '-g', help='If fetching source, do not set up source tree as a git repository', action="store_true")
     parser_add.add_argument('--binary', '-b', help='Treat the source tree as something that should be installed verbatim (no compilation, same directory structure). Useful with binary packages e.g. RPMs.', action='store_true')
     parser_add.add_argument('--also-native', help='Also add native variant (i.e. support building recipe for the build host as well as the target machine)', action='store_true')
+    parser_add.add_argument('--src-subdir', help='Specify subdirectory within source tree to use', metavar='SUBDIR')
     parser_add.set_defaults(func=add)
 
     parser_modify = subparsers.add_parser('modify', help='Modify the source for an existing recipe',
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 43861ee..9c3a63d 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -324,6 +324,12 @@ def create_recipe(args):
         srcuri = ''
         srctree = args.source
 
+    if args.src_subdir:
+        srcsubdir = os.path.join(srcsubdir, args.src_subdir)
+        srctree_use = os.path.join(srctree, args.src_subdir)
+    else:
+        srctree_use = srctree
+
     if args.outfile and os.path.isdir(args.outfile):
         outfile = None
         outdir = args.outfile
@@ -343,7 +349,7 @@ def create_recipe(args):
     lines_before.append('# (Feel free to remove these comments when editing.)')
     lines_before.append('#')
 
-    licvalues = guess_license(srctree)
+    licvalues = guess_license(srctree_use)
     lic_files_chksum = []
     if licvalues:
         licenses = []
@@ -472,7 +478,7 @@ def create_recipe(args):
 
     extravalues = {}
     for handler in handlers:
-        handler.process(srctree, classes, lines_before, lines_after, handled, extravalues)
+        handler.process(srctree_use, classes, lines_before, lines_after, handled, extravalues)
 
     if not realpv:
         realpv = extravalues.get('PV', None)
@@ -759,5 +765,6 @@ def register_commands(subparsers):
     parser_create.add_argument('-V', '--version', help='Version to use within recipe (PV)')
     parser_create.add_argument('-b', '--binary', help='Treat the source tree as something that should be installed verbatim (no compilation, same directory structure)', action='store_true')
     parser_create.add_argument('--also-native', help='Also add native variant (i.e. support building recipe for the build host as well as the target machine)', action='store_true')
+    parser_create.add_argument('--src-subdir', help='Specify subdirectory within source tree to use', metavar='SUBDIR')
     parser_create.set_defaults(func=create_recipe)
 
-- 
2.5.0


