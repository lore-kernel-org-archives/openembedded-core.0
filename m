Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 25769731EE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 11:17:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jan 2016 03:17:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,528,1444719600"; d="scan'208";a="875594475"
Received: from ngochun1-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2016 03:16:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 00:15:52 +1300
Message-Id: <de798a8006fabb828f0f0fb47758c8f0d721bd99.1452078721.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 11/14] devtool: add: support adding a native variant
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
X-List-Received-Date: Wed, 06 Jan 2016 11:17:03 -0000

Sometimes you need to build a variant of a recipe for the build
host as well as for the target (i.e. BBCLASSEXTEND = "native"); add a
 --also-native command line option to "recipetool create" that enables
this and plumb it through from an identical option for "devtool add".

(We could conceivably do the same for nativesdk, but I felt it might be
confusing within the context of the extensible SDK, where nativesdk
isn't really relevant to the user.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py  |  3 +++
 scripts/lib/recipetool/create.py | 23 +++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 741f0ea..7ef0ab8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -139,6 +139,8 @@ def add(args, config, basepath, workspace):
         extracmdopts += ' -V %s' % args.version
     if args.binary:
         extracmdopts += ' -b'
+    if args.also_native:
+        extracmdopts += ' --also-native'
 
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
@@ -1307,6 +1309,7 @@ def register_commands(subparsers, context):
     parser_add.add_argument('--version', '-V', help='Version to use within recipe (PV)')
     parser_add.add_argument('--no-git', '-g', help='If fetching source, do not set up source tree as a git repository', action="store_true")
     parser_add.add_argument('--binary', '-b', help='Treat the source tree as something that should be installed verbatim (no compilation, same directory structure). Useful with binary packages e.g. RPMs.', action='store_true')
+    parser_add.add_argument('--also-native', help='Also add native variant (i.e. support building recipe for the build host as well as the target machine)', action='store_true')
     parser_add.set_defaults(func=add)
 
     parser_modify = subparsers.add_parser('modify', help='Modify the source for an existing recipe',
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 775be42..4f95d7e 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -252,8 +252,14 @@ def create_recipe(args):
     if args.name:
         pn = args.name
         if args.name.endswith('-native'):
+            if args.also_native:
+                logger.error('--also-native cannot be specified for a recipe named *-native (*-native denotes a recipe that is already only for native) - either remove the -native suffix from the name or drop --also-native')
+                sys.exit(1)
             classes.append('native')
         elif args.name.startswith('nativesdk-'):
+            if args.also_native:
+                logger.error('--also-native cannot be specified for a recipe named nativesdk-* (nativesdk-* denotes a recipe that is already only for nativesdk)')
+                sys.exit(1)
             classes.append('nativesdk')
 
     if pv and pv not in 'git svn hg'.split():
@@ -393,6 +399,22 @@ def create_recipe(args):
                 line = re.sub('"[^+]*\+', '"%s+' % realpv, line)
         lines_before.append(line)
 
+    if args.also_native:
+        lines = lines_after
+        lines_after = []
+        bbclassextend = None
+        for line in lines:
+            if line.startswith('BBCLASSEXTEND ='):
+                splitval = line.split('"')
+                if len(splitval) > 1:
+                    bbclassextend = splitval[1].split()
+                    if not 'native' in bbclassextend:
+                        bbclassextend.insert(0, 'native')
+                line = 'BBCLASSEXTEND = "%s"' % ' '.join(bbclassextend)
+            lines_after.append(line)
+        if not bbclassextend:
+            lines_after.append('BBCLASSEXTEND = "native"')
+
     outlines = []
     outlines.extend(lines_before)
     if classes:
@@ -591,5 +613,6 @@ def register_commands(subparsers):
     parser_create.add_argument('-N', '--name', help='Name to use within recipe (PN)')
     parser_create.add_argument('-V', '--version', help='Version to use within recipe (PV)')
     parser_create.add_argument('-b', '--binary', help='Treat the source tree as something that should be installed verbatim (no compilation, same directory structure)', action='store_true')
+    parser_create.add_argument('--also-native', help='Also add native variant (i.e. support building recipe for the build host as well as the target machine)', action='store_true')
     parser_create.set_defaults(func=create_recipe)
 
-- 
2.5.0


