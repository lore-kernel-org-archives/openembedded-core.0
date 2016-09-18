Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3B5016FFED
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 20:08:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 18 Sep 2016 13:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,358,1470726000"; d="scan'208";a="1058565606"
Received: from yewyangh-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.139])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2016 13:08:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2016 08:08:08 +1200
Message-Id: <613b522376b5f0ae2126a7a3a6c3bbd46ddbcfbe.1474229259.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/10] recipetool: create: detect python autoconf macros
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
X-List-Received-Date: Sun, 18 Sep 2016 20:08:56 -0000

If python is required then we need to inherit pythonnative (or
python3native) otherwise do_configure will probably fail since it won't
be able to find python.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 0ad748e..067be18 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -442,6 +442,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
         ac_init_re = re.compile('AC_INIT\(\s*([^,]+),\s*([^,]+)[,)].*')
         am_init_re = re.compile('AM_INIT_AUTOMAKE\(\s*([^,]+),\s*([^,]+)[,)].*')
         define_re = re.compile('\s*(m4_)?define\(\s*([^,]+),\s*([^,]+)\)')
+        version_re = re.compile('([0-9.]+)')
 
         defines = {}
         def subst_defines(value):
@@ -488,6 +489,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
             for handler in handlers:
                 if handler.process_macro(srctree, keyword, value, process_value, libdeps, pcdeps, deps, outlines, inherits, values):
                     return
+            logger.debug('Found keyword %s with value "%s"' % (keyword, value))
             if keyword == 'PKG_CHECK_MODULES':
                 res = pkg_re.search(value)
                 if res:
@@ -573,6 +575,17 @@ class AutotoolsRecipeHandler(RecipeHandler):
                 deps.append('swig-native')
             elif keyword == 'AX_PROG_XSLTPROC':
                 deps.append('libxslt-native')
+            elif keyword in ['AC_PYTHON_DEVEL', 'AX_PYTHON_DEVEL', 'AM_PATH_PYTHON']:
+                pythonclass = 'pythonnative'
+                res = version_re.search(value)
+                if res:
+                    if res.group(1).startswith('3'):
+                        pythonclass = 'python3native'
+                # Avoid replacing python3native with pythonnative
+                if not pythonclass in inherits and not 'python3native' in inherits:
+                    if 'pythonnative' in inherits:
+                        inherits.remove('pythonnative')
+                    inherits.append(pythonclass)
             elif keyword == 'AX_WITH_CURSES':
                 deps.append('ncurses')
             elif keyword == 'AX_PATH_BDB':
@@ -639,6 +652,9 @@ class AutotoolsRecipeHandler(RecipeHandler):
                     'AX_LIB_TAGLIB',
                     'AX_PKG_SWIG',
                     'AX_PROG_XSLTPROC',
+                    'AC_PYTHON_DEVEL',
+                    'AX_PYTHON_DEVEL',
+                    'AM_PATH_PYTHON',
                     'AX_WITH_CURSES',
                     'AX_PATH_BDB',
                     'AX_PATH_LIB_PCRE',
-- 
2.5.5


