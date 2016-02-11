Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 569F6731EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 01:15:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 10 Feb 2016 17:15:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,428,1449561600"; d="scan'208";a="900462022"
Received: from pngang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.110])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2016 17:15:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 14:13:29 +1300
Message-Id: <757bf546415cde8d6c23819669acfe5002ffeda7.1455151881.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455151881.git.paul.eggleton@linux.intel.com>
References: <cover.1455151881.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455151881.git.paul.eggleton@linux.intel.com>
References: <cover.1455151881.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/11] recipetool: create: support cmake find_library directive
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
X-List-Received-Date: Thu, 11 Feb 2016 01:15:19 -0000

CMake supports a find_library() directive to find named libraries, so
detect dependencies from this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index ba393a8..4d11e04 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -137,6 +137,7 @@ class CmakeRecipeHandler(RecipeHandler):
         pkgcm_re = re.compile('pkg_check_modules\s*\(\s*[a-zA-Z0-9-_]+\s*(REQUIRED)?\s+([^)\s]+)\s*\)', re.IGNORECASE)
         pkgsm_re = re.compile('pkg_search_module\s*\(\s*[a-zA-Z0-9-_]+\s*(REQUIRED)?((\s+[^)\s]+)+)\s*\)', re.IGNORECASE)
         findpackage_re = re.compile('find_package\s*\(\s*([a-zA-Z0-9-_]+)\s*.*', re.IGNORECASE)
+        findlibrary_re = re.compile('find_library\s*\(\s*[a-zA-Z0-9-_]+\s*(NAMES\s+)?([a-zA-Z0-9-_ ]+)\s*.*')
         checklib_re = re.compile('check_library_exists\s*\(\s*([^\s)]+)\s*.*', re.IGNORECASE)
         include_re = re.compile('include\s*\(\s*([^)\s]*)\s*\)', re.IGNORECASE)
         subdir_re = re.compile('add_subdirectory\s*\(\s*([^)\s]*)\s*([^)\s]*)\s*\)', re.IGNORECASE)
@@ -215,6 +216,15 @@ class CmakeRecipeHandler(RecipeHandler):
                         lib = interpret_value(res.group(1))
                         if not lib.startswith('$'):
                             libdeps.append(lib)
+                    res = findlibrary_re.match(line)
+                    if res:
+                        libs = res.group(2).split()
+                        for lib in libs:
+                            if lib in ['HINTS', 'PATHS', 'PATH_SUFFIXES', 'DOC', 'NAMES_PER_DIR'] or lib.startswith(('NO_', 'CMAKE_', 'ONLY_CMAKE_')):
+                                break
+                            lib = interpret_value(lib)
+                            if not lib.startswith('$'):
+                                libdeps.append(lib)
                     if line.lower().startswith('useswig'):
                         deps.append('swig-native')
                         continue
-- 
2.5.0


