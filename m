Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 41A4376DFF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:22:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520519"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:22:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:39 +0100
Message-Id: <023819bae0cde65eaa6dd066d534c9c7d1e8ef3c.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 25/27] devtool / recipetool: add handling for binary-only packages
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:21 -0000

Add a means of creating recipes for package files or archives that
contain a directory structure to be installed verbatim, for example an
rpm file. (We mostly just re-use bin_package here and skip some of the
normal build system checks.) This support is available in "recipetool
create" and "devtool add" which wraps the former.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py  |  9 +++++++++
 scripts/lib/recipetool/create.py | 14 ++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index c254132..96b271c 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -94,6 +94,8 @@ def add(args, config, basepath, workspace):
         source = srctree
     if args.version:
         extracmdopts += ' -V %s' % args.version
+    if args.binary:
+        extracmdopts += ' -b'
     try:
         stdout, _ = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s "%s" %s' % (color, recipefile, source, extracmdopts))
     except bb.process.ExecutionError as e:
@@ -125,6 +127,12 @@ def add(args, config, basepath, workspace):
         if initial_rev:
             f.write('\n# initial_rev: %s\n' % initial_rev)
 
+        if args.binary:
+            f.write('do_install_append() {\n')
+            f.write('    rm -rf ${D}/.git\n')
+            f.write('    rm -f ${D}/singletask.lock\n')
+            f.write('}\n')
+
     _add_md5(config, args.recipename, appendfile)
 
     logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
@@ -885,6 +893,7 @@ def register_commands(subparsers, context):
     parser_add.add_argument('--fetch', '-f', help='Fetch the specified URI and extract it to create the source tree', metavar='URI')
     parser_add.add_argument('--version', '-V', help='Version to use within recipe (PV)')
     parser_add.add_argument('--no-git', '-g', help='If -f/--fetch is specified, do not set up source tree as a git repository', action="store_true")
+    parser_add.add_argument('--binary', '-b', help='Treat the source tree as something that should be installed verbatim (no compilation, same directory structure)', action='store_true')
     parser_add.set_defaults(func=add)
 
     parser_modify = subparsers.add_parser('modify', help='Modify the source for an existing recipe',
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 409b255..844073b 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -104,6 +104,10 @@ def create_recipe(args):
     if '://' in args.source:
         # Fetch a URL
         fetchuri = urlparse.urldefrag(args.source)[0]
+        if args.binary:
+            # Assume the archive contains the directory structure verbatim
+            # so we need to extract to a subdirectory
+            fetchuri += ';subdir=%s' % os.path.splitext(os.path.basename(urlparse.urlsplit(fetchuri).path))[0]
         srcuri = fetchuri
         rev_re = re.compile(';rev=([^;]+)')
         res = rev_re.search(srcuri)
@@ -226,6 +230,10 @@ def create_recipe(args):
         lines_after.append('PACKAGE_ARCH = "%s"' % pkgarch)
         lines_after.append('')
 
+    if args.binary:
+        lines_after.append('INSANE_SKIP_${PN} += "already-stripped"')
+        lines_after.append('')
+
     # Find all plugins that want to register handlers
     handlers = []
     for plugin in plugins:
@@ -235,6 +243,11 @@ def create_recipe(args):
     # Apply the handlers
     classes = []
     handled = []
+
+    if args.binary:
+        classes.append('bin_package')
+        handled.append('buildsystem')
+
     for handler in handlers:
         handler.process(srctree, classes, lines_before, lines_after, handled)
 
@@ -426,5 +439,6 @@ def register_command(subparsers):
     parser_create.add_argument('-m', '--machine', help='Make recipe machine-specific as opposed to architecture-specific', action='store_true')
     parser_create.add_argument('-x', '--extract-to', metavar='EXTRACTPATH', help='Assuming source is a URL, fetch it and extract it to the directory specified as %(metavar)s')
     parser_create.add_argument('-V', '--version', help='Version to use within recipe (PV)')
+    parser_create.add_argument('-b', '--binary', help='Treat the source tree as something that should be installed verbatim (no compilation, same directory structure)', action='store_true')
     parser_create.set_defaults(func=create_recipe)
 
-- 
2.1.0


