Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 9EB3E73695
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 20:09:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 18 Sep 2016 13:09:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,358,1470726000"; d="scan'208";a="1058565657"
Received: from yewyangh-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.139])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2016 13:09:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2016 08:08:11 +1200
Message-Id: <8f62c47d9577bb2a9fcafb0759fa2ae1d0632d79.1474229259.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/10] recipetool: create: support git short form URLs
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
X-List-Received-Date: Sun, 18 Sep 2016 20:09:03 -0000

In keeping with making recipetool create / devtool add as easy to use as
possible, users shouldn't have to know how to reformat git short form ssh
URLs for consumption by BitBake's fetcher (for example
user@git.example.com:repo.git should be expressed as
git://user@git.example.com/repo.git;protocol=ssh ) - instead we should
just take care of that automatically. Add some logic in the appropriate
places to do that.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py  |  4 ++--
 scripts/lib/recipetool/create.py |  9 ++++++---
 scripts/lib/scriptutils.py       | 13 +++++++++++++
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index baef23e..abbc0cb 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -47,13 +47,13 @@ def add(args, config, basepath, workspace):
     # These are positional arguments, but because we're nice, allow
     # specifying e.g. source tree without name, or fetch URI without name or
     # source tree (if we can detect that that is what the user meant)
-    if '://' in args.recipename:
+    if scriptutils.is_src_url(args.recipename):
         if not args.fetchuri:
             if args.fetch:
                 raise DevtoolError('URI specified as positional argument as well as -f/--fetch')
             args.fetchuri = args.recipename
             args.recipename = ''
-    elif args.srctree and '://' in args.srctree:
+    elif scriptutils.is_src_url(args.srctree):
         if not args.fetchuri:
             if args.fetch:
                 raise DevtoolError('URI specified as positional argument as well as -f/--fetch')
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 7787d8e..9b31fe9 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -353,10 +353,13 @@ def reformat_git_uri(uri):
     '''Convert any http[s]://....git URI into git://...;protocol=http[s]'''
     checkuri = uri.split(';', 1)[0]
     if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://github.com/[^/]+/[^/]+/?$', checkuri):
-        res = re.match('(https?)://([^;]+(\.git)?)(;.*)?$', uri)
+        res = re.match('(http|https|ssh)://([^;]+(\.git)?)(;.*)?$', uri)
         if res:
             # Need to switch the URI around so that the git fetcher is used
             return 'git://%s;protocol=%s%s' % (res.group(2), res.group(1), res.group(4) or '')
+        elif '@' in checkuri:
+            # Catch e.g. git@git.example.com:repo.git
+            return 'git://%s;protocol=ssh' % checkuri.replace(':', '/', 1)
     return uri
 
 def is_package(url):
@@ -386,7 +389,7 @@ def create_recipe(args):
     if os.path.isfile(source):
         source = 'file://%s' % os.path.abspath(source)
 
-    if '://' in source:
+    if scriptutils.is_src_url(source):
         # Fetch a URL
         fetchuri = reformat_git_uri(urldefrag(source)[0])
         if args.binary:
@@ -478,7 +481,7 @@ def create_recipe(args):
                 for line in stdout.splitlines():
                     splitline = line.split()
                     if len(splitline) > 1:
-                        if splitline[0] == 'origin' and '://' in splitline[1]:
+                        if splitline[0] == 'origin' and scriptutils.is_src_url(splitline[1]):
                             srcuri = reformat_git_uri(splitline[1])
                             srcsubdir = 'git'
                             break
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index bd082d8..5ccc027 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -116,3 +116,16 @@ def run_editor(fn):
     except OSError as exc:
         logger.error("Execution of editor '%s' failed: %s", editor, exc)
         return 1
+
+def is_src_url(param):
+    """
+    Check if a parameter is a URL and return True if so
+    NOTE: be careful about changing this as it will influence how devtool/recipetool command line handling works
+    """
+    if not param:
+        return False
+    elif '://' in param:
+        return True
+    elif param.startswith('git@') or ('@' in param and param.endswith('.git')):
+        return True
+    return False
-- 
2.5.5


