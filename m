Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CD2C8607A4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 23:08:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 10 Jul 2016 16:08:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,343,1464678000"; d="scan'208";a="732288681"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.164.140])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Jul 2016 16:08:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 11:07:52 +1200
Message-Id: <5238d497c238a7629b3fa3dfc32cf0b52dc79980.1468191874.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1468191874.git.paul.eggleton@linux.intel.com>
References: <cover.1468191874.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1468191874.git.paul.eggleton@linux.intel.com>
References: <cover.1468191874.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 2/7] recipetool: create: support specifying a file as the local source
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
X-List-Received-Date: Sun, 10 Jul 2016 23:08:26 -0000

It is currently possible to specify a file (e.g. a tarball) on the local
disk as the source, but you have to know to put file:// in front of it.
There's really no need to force users to jump through that hoop if they
really want to do this so check if the specified source is a file and
prefix it with file:// if that's the case.

Also ensure the same works for "devtool add" at the same time.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py  |  4 ++++
 scripts/lib/recipetool/create.py | 15 ++++++++++-----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index ed49a93..737ecc1 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -65,6 +65,10 @@ def add(args, config, basepath, workspace):
         elif os.path.isdir(args.recipename):
             logger.warn('Ambiguous argument %s - assuming you mean it to be the recipe name')
 
+    if args.srctree and os.path.isfile(args.srctree):
+        args.fetchuri = 'file://' + os.path.abspath(args.srctree)
+        args.srctree = ''
+
     if args.fetch:
         if args.fetchuri:
             raise DevtoolError('URI specified as positional argument as well as -f/--fetch')
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 95b16fb..f246028 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -351,11 +351,16 @@ def create_recipe(args):
     extravalues = {}
     checksums = (None, None)
     tempsrc = ''
+    source = args.source
     srcsubdir = ''
     srcrev = '${AUTOREV}'
-    if '://' in args.source:
+
+    if os.path.isfile(source):
+        source = 'file://%s' % os.path.abspath(source)
+
+    if '://' in source:
         # Fetch a URL
-        fetchuri = reformat_git_uri(urldefrag(args.source)[0])
+        fetchuri = reformat_git_uri(urldefrag(source)[0])
         if args.binary:
             # Assume the archive contains the directory structure verbatim
             # so we need to extract to a subdirectory
@@ -426,10 +431,10 @@ def create_recipe(args):
         if args.extract_to:
             logger.error('--extract-to cannot be specified if source is a directory')
             sys.exit(1)
-        if not os.path.isdir(args.source):
-            logger.error('Invalid source directory %s' % args.source)
+        if not os.path.isdir(source):
+            logger.error('Invalid source directory %s' % source)
             sys.exit(1)
-        srctree = args.source
+        srctree = source
         srcuri = ''
         if os.path.exists(os.path.join(srctree, '.git')):
             # Try to get upstream repo location from origin remote
-- 
2.5.5


