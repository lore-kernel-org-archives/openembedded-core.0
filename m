Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B581177116
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 May 2016 22:21:44 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 29 May 2016 15:21:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,386,1459839600"; d="scan'208";a="976886755"
Received: from jialelim-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.83])
	by fmsmga001.fm.intel.com with ESMTP; 29 May 2016 15:21:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2016 10:21:02 +1200
Message-Id: <afcecfbd2c40cc6fde80c5218db94902dd50866a.1464560316.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1464560316.git.paul.eggleton@linux.intel.com>
References: <cover.1464560316.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1464560316.git.paul.eggleton@linux.intel.com>
References: <cover.1464560316.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/7] recipetool / devtool: set a fixed SRCREV by default when fetching from git
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
X-List-Received-Date: Sun, 29 May 2016 22:21:44 -0000

If fetching source from a git repository, typically within OpenEmbedded
we encourage setting SRCREV to a fixed revision, so change to do that by
default and add a  -a/--autorev option to use "${AUTOREV}" instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 6 ++++--
 scripts/lib/devtool/standard.py   | 3 +++
 scripts/lib/recipetool/create.py  | 5 +++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 132a73d..b64f9b3 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -207,12 +207,14 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         pn = 'dbus-wait'
+        srcrev = '6cc6077a36fe2648a5f993fe7c16c9632f946517'
         # We choose an https:// git URL here to check rewriting the URL works
         url = 'https://git.yoctoproject.org/git/dbus-wait'
         # Force fetching to "noname" subdir so we verify we're picking up the name from autoconf
         # instead of the directory name
         result = runCmd('git clone %s noname' % url, cwd=tempdir)
         srcdir = os.path.join(tempdir, 'noname')
+        result = runCmd('git reset --hard %s' % srcrev, cwd=srcdir)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure.ac')), 'Unable to find configure script in source directory')
         # Test devtool add
         self.track_for_cleanup(self.workspacedir)
@@ -235,7 +237,7 @@ class DevtoolTests(DevtoolBase):
         checkvars['S'] = '${WORKDIR}/git'
         checkvars['PV'] = '0.1+git${SRCPV}'
         checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/dbus-wait;protocol=https'
-        checkvars['SRCREV'] = '${AUTOREV}'
+        checkvars['SRCREV'] = srcrev
         checkvars['DEPENDS'] = set(['dbus'])
         self._test_recipe_contents(recipefile, checkvars, [])
 
@@ -345,7 +347,7 @@ class DevtoolTests(DevtoolBase):
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake -c cleansstate %s' % testrecipe)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add %s %s -f %s' % (testrecipe, srcdir, url))
+        result = runCmd('devtool add %s %s -a -f %s' % (testrecipe, srcdir, url))
         self.assertTrue(os.path.exists(os.path.join(self.workspacedir, 'conf', 'layer.conf')), 'Workspace directory not created: %s' % result.output)
         self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure.ac')), 'Unable to find configure.ac in source directory')
         # Test devtool status
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 77a82d5..3be3214 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -144,6 +144,8 @@ def add(args, config, basepath, workspace):
         extracmdopts += ' --also-native'
     if args.src_subdir:
         extracmdopts += ' --src-subdir "%s"' % args.src_subdir
+    if args.autorev:
+        extracmdopts += ' -a'
 
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
@@ -1390,6 +1392,7 @@ def register_commands(subparsers, context):
     parser_add.add_argument('--fetch', '-f', help='Fetch the specified URI and extract it to create the source tree (deprecated - pass as positional argument instead)', metavar='URI')
     parser_add.add_argument('--version', '-V', help='Version to use within recipe (PV)')
     parser_add.add_argument('--no-git', '-g', help='If fetching source, do not set up source tree as a git repository', action="store_true")
+    parser_add.add_argument('--autorev', '-a', help='When fetching from a git repository, set SRCREV in the recipe to a floating revision instead of fixed', action="store_true")
     parser_add.add_argument('--binary', '-b', help='Treat the source tree as something that should be installed verbatim (no compilation, same directory structure). Useful with binary packages e.g. RPMs.', action='store_true')
     parser_add.add_argument('--also-native', help='Also add native variant (i.e. support building recipe for the build host as well as the target machine)', action='store_true')
     parser_add.add_argument('--src-subdir', help='Specify subdirectory within source tree to use', metavar='SUBDIR')
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 1899a0d..4a59363 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -563,6 +563,10 @@ def create_recipe(args):
         lines_before.append('')
         lines_before.append('# Modify these as desired')
         lines_before.append('PV = "%s+git${SRCPV}"' % (realpv or '1.0'))
+        if not args.autorev and srcrev == '${AUTOREV}':
+            if os.path.exists(os.path.join(srctree, '.git')):
+                (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
+            srcrev = stdout.rstrip()
         lines_before.append('SRCREV = "%s"' % srcrev)
     lines_before.append('')
 
@@ -1049,5 +1053,6 @@ def register_commands(subparsers):
     parser_create.add_argument('-b', '--binary', help='Treat the source tree as something that should be installed verbatim (no compilation, same directory structure)', action='store_true')
     parser_create.add_argument('--also-native', help='Also add native variant (i.e. support building recipe for the build host as well as the target machine)', action='store_true')
     parser_create.add_argument('--src-subdir', help='Specify subdirectory within source tree to use', metavar='SUBDIR')
+    parser_create.add_argument('-a', '--autorev', help='When fetching from a git repository, set SRCREV in the recipe to a floating revision instead of fixed', action="store_true")
     parser_create.set_defaults(func=create_recipe)
 
-- 
2.5.5


