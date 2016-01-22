Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8DBED73216
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:00:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2016 04:00:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,330,1449561600"; d="scan'208";a="732272803"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by orsmga003.jf.intel.com with ESMTP; 22 Jan 2016 04:00:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:59:57 +1300
Message-Id: <3eb84dca02e8c1d080f66299657eea0c534b7c59.1453463789.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/14] recipetool: create: strip quotes from values extracted from CMakeLists.txt
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
X-List-Received-Date: Fri, 22 Jan 2016 12:00:30 -0000

Quoting is optional in CMakeLists.txt and is occasionally used, so strip
out quotes if they are present.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys.py | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 6afb5de..ba393a8 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -142,6 +142,9 @@ class CmakeRecipeHandler(RecipeHandler):
         subdir_re = re.compile('add_subdirectory\s*\(\s*([^)\s]*)\s*([^)\s]*)\s*\)', re.IGNORECASE)
         dep_re = re.compile('([^ ><=]+)( *[<>=]+ *[^ ><=]+)?')
 
+        def interpret_value(value):
+            return value.strip('"')
+
         def parse_cmake_file(fn, paths=None):
             searchpaths = (paths or []) + [os.path.dirname(fn)]
             logger.debug('Parsing file %s' % fn)
@@ -166,13 +169,13 @@ class CmakeRecipeHandler(RecipeHandler):
                         continue
                     res = proj_re.match(line)
                     if res:
-                        extravalues['PN'] = res.group(1).split()[0]
+                        extravalues['PN'] = interpret_value(res.group(1).split()[0])
                         continue
                     res = pkgcm_re.match(line)
                     if res:
                         res = dep_re.findall(res.group(2))
                         if res:
-                            pcdeps.extend([x[0] for x in res])
+                            pcdeps.extend([interpret_value(x[0]) for x in res])
                         inherits.append('pkgconfig')
                         continue
                     res = pkgsm_re.match(line)
@@ -180,7 +183,7 @@ class CmakeRecipeHandler(RecipeHandler):
                         res = dep_re.findall(res.group(2))
                         if res:
                             # Note: appending a tuple here!
-                            item = tuple((x[0] for x in res))
+                            item = tuple((interpret_value(x[0]) for x in res))
                             if len(item) == 1:
                                 item = item[0]
                             pcdeps.append(item)
@@ -189,7 +192,7 @@ class CmakeRecipeHandler(RecipeHandler):
                     res = findpackage_re.match(line)
                     if res:
                         origpkg = res.group(1)
-                        pkg = origpkg.lower()
+                        pkg = interpret_value(origpkg.lower())
                         if pkg == 'gettext':
                             inherits.append('gettext')
                         elif pkg == 'perl':
@@ -209,7 +212,7 @@ class CmakeRecipeHandler(RecipeHandler):
                         continue
                     res = checklib_re.match(line)
                     if res:
-                        lib = res.group(1)
+                        lib = interpret_value(res.group(1))
                         if not lib.startswith('$'):
                             libdeps.append(lib)
                     if line.lower().startswith('useswig'):
-- 
2.5.0


