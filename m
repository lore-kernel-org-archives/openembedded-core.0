Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9518171A60
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 21:13:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 14 Dec 2016 13:13:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,348,1477983600"; d="scan'208";a="18188768"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.22.2])
	by orsmga002.jf.intel.com with ESMTP; 14 Dec 2016 13:13:52 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2016 21:13:07 +0000
Message-Id: <bb5ce25a3aaa950279956656542cdf724ad3184d.1481749746.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1481749746.git.joshua.g.lock@intel.com>
References: <cover.1481749746.git.joshua.g.lock@intel.com>
Subject: [PATCH 4/4] scripts: remove True option to getVarFlag calls
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
X-List-Received-Date: Wed, 14 Dec 2016 21:13:52 -0000

getVarFlag() now defaults to expanding by default, thus remove the
True option from getVarFlag() calls with a regex search and
replace.

Search made with the following regex:
getVarFlag ?\(( ?[^,()]*, ?[^,()]*), True\)

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/lib/recipetool/append.py | 6 +++---
 scripts/verify-bashisms          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index def4f90..69c8bb7 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -121,7 +121,7 @@ def determine_file_source(targetpath, rd):
         logger.debug('source path: %s' % srcpath)
         if not srcpath.startswith('/'):
             # Handle non-absolute path
-            srcpath = os.path.abspath(os.path.join(rd.getVarFlag('do_install', 'dirs', True).split()[-1], srcpath))
+            srcpath = os.path.abspath(os.path.join(rd.getVarFlag('do_install', 'dirs').split()[-1], srcpath))
         if srcpath.startswith(workdir):
             # OK, now we have the source file name, look for it in SRC_URI
             workdirfile = os.path.relpath(srcpath, workdir)
@@ -191,10 +191,10 @@ def get_source_path(cmdelements):
 def get_func_deps(func, d):
     """Find the function dependencies of a shell function"""
     deps = bb.codeparser.ShellParser(func, logger).parse_shell(d.getVar(func))
-    deps |= set((d.getVarFlag(func, "vardeps", True) or "").split())
+    deps |= set((d.getVarFlag(func, "vardeps") or "").split())
     funcdeps = []
     for dep in deps:
-        if d.getVarFlag(dep, 'func', True):
+        if d.getVarFlag(dep, 'func'):
             funcdeps.append(dep)
     return funcdeps
 
diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index 0741e18..a8f761d 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -97,7 +97,7 @@ if __name__=='__main__':
         result = []
         data = tinfoil.parse_recipe_file(fn)
         for key in data.keys():
-            if data.getVarFlag(key, "func", True) and not data.getVarFlag(key, "python", True):
+            if data.getVarFlag(key, "func") and not data.getVarFlag(key, "python"):
                 script = data.getVar(key, False)
                 if not script: continue
                 #print ("%s:%s" % (fn, key))
-- 
2.9.3


