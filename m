Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 92AD371633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:00:35 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2016 04:00:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,330,1449561600"; d="scan'208";a="732272838"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by orsmga003.jf.intel.com with ESMTP; 22 Jan 2016 04:00:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:59:59 +1300
Message-Id: <9a2363a2f72409055830d8069e7bce91f50f4f4c.1453463789.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 12/14] recipetool: create: extract SRC_URI from local git repositories
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
X-List-Received-Date: Fri, 22 Jan 2016 12:00:35 -0000

If you specify a local directory which happens to be a git repository
with an origin remote (and it is in fact remote), we can use that for
SRC_URI rather than leaving it blank in the recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 9c3a63d..5caf374 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -260,6 +260,14 @@ def supports_srcrev(uri):
             return True
     return False
 
+def reformat_git_uri(uri):
+    '''Convert any http[s]://....git URI into git://...;protocol=http[s]'''
+    res = re.match('(https?)://([^;]+\.git)(;.*)?$', uri)
+    if res:
+        # Need to switch the URI around so that the git fetcher is used
+        return 'git://%s;protocol=%s%s' % (res.group(2), res.group(1), res.group(3) or '')
+    return uri
+
 def create_recipe(args):
     import bb.process
     import tempfile
@@ -275,16 +283,11 @@ def create_recipe(args):
     srcrev = '${AUTOREV}'
     if '://' in args.source:
         # Fetch a URL
-        fetchuri = urlparse.urldefrag(args.source)[0]
+        fetchuri = reformat_git_uri(urlparse.urldefrag(args.source)[0])
         if args.binary:
             # Assume the archive contains the directory structure verbatim
             # so we need to extract to a subdirectory
             fetchuri += ';subdir=%s' % os.path.splitext(os.path.basename(urlparse.urlsplit(fetchuri).path))[0]
-        git_re = re.compile('(https?)://([^;]+\.git)(;.*)?$')
-        res = git_re.match(fetchuri)
-        if res:
-            # Need to switch the URI around so that the git fetcher is used
-            fetchuri = 'git://%s;protocol=%s%s' % (res.group(2), res.group(1), res.group(3) or '')
         srcuri = fetchuri
         rev_re = re.compile(';rev=([^;]+)')
         res = rev_re.search(srcuri)
@@ -321,8 +324,21 @@ def create_recipe(args):
         if not os.path.isdir(args.source):
             logger.error('Invalid source directory %s' % args.source)
             sys.exit(1)
-        srcuri = ''
         srctree = args.source
+        srcuri = ''
+        if os.path.exists(os.path.join(srctree, '.git')):
+            # Try to get upstream repo location from origin remote
+            try:
+                stdout, _ = bb.process.run('git remote -v', cwd=srctree, shell=True)
+            except bb.process.ExecutionError as e:
+                stdout = None
+            if stdout:
+                for line in stdout.splitlines():
+                    splitline = line.split()
+                    if len(splitline) > 1:
+                        if splitline[0] == 'origin' and '://' in splitline[1]:
+                            srcuri = reformat_git_uri(splitline[1])
+                            break
 
     if args.src_subdir:
         srcsubdir = os.path.join(srcsubdir, args.src_subdir)
-- 
2.5.0


