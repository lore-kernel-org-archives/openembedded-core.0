Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 63558731D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 05:36:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 07 Mar 2016 21:36:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,555,1449561600"; d="scan'208";a="919077652"
Received: from jlee45-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.164.131])
	by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2016 21:36:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Mar 2016 18:36:00 +1300
Message-Id: <2f72f4ac4668b56dd394e00d226c2b4c1aea0241.1457415260.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457415260.git.paul.eggleton@linux.intel.com>
References: <cover.1457415260.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457415260.git.paul.eggleton@linux.intel.com>
References: <cover.1457415260.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/6] recipetool: create: be more tolerant of spacing in configure.ac
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
X-List-Received-Date: Tue, 08 Mar 2016 05:36:39 -0000

Allow for whitespace in appropriate places, and ensure we match all
whitespace chars not just the space character.

(This fixes extracting dependencies from tmux's configure.ac, for
example.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 0228269..909743b 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -413,15 +413,15 @@ class AutotoolsRecipeHandler(RecipeHandler):
         progclassmap = {'gconftool-2': 'gconf',
                 'pkg-config': 'pkgconfig'}
 
-        pkg_re = re.compile('PKG_CHECK_MODULES\(\[?[a-zA-Z0-9_]*\]?, *\[?([^,\]]*)\]?[),].*')
-        pkgce_re = re.compile('PKG_CHECK_EXISTS\(\[?([^,\]]*)\]?[),].*')
-        lib_re = re.compile('AC_CHECK_LIB\(\[?([^,\]]*)\]?,.*')
-        libx_re = re.compile('AX_CHECK_LIBRARY\(\[?[^,\]]*\]?, *\[?([^,\]]*)\]?, *\[?([a-zA-Z0-9-]*)\]?,.*')
-        progs_re = re.compile('_PROGS?\(\[?[a-zA-Z0-9_]*\]?, \[?([^,\]]*)\]?[),].*')
+        pkg_re = re.compile('PKG_CHECK_MODULES\(\s*\[?[a-zA-Z0-9_]*\]?,\s*\[?([^,\]]*)\]?[),].*')
+        pkgce_re = re.compile('PKG_CHECK_EXISTS\(\s*\[?([^,\]]*)\]?[),].*')
+        lib_re = re.compile('AC_CHECK_LIB\(\s*\[?([^,\]]*)\]?,.*')
+        libx_re = re.compile('AX_CHECK_LIBRARY\(\s*\[?[^,\]]*\]?,\s*\[?([^,\]]*)\]?,\s*\[?([a-zA-Z0-9-]*)\]?,.*')
+        progs_re = re.compile('_PROGS?\(\s*\[?[a-zA-Z0-9_]*\]?,\s*\[?([^,\]]*)\]?[),].*')
         dep_re = re.compile('([^ ><=]+)( [<>=]+ [^ ><=]+)?')
-        ac_init_re = re.compile('AC_INIT\(([^,]+), *([^,]+)[,)].*')
-        am_init_re = re.compile('AM_INIT_AUTOMAKE\(([^,]+), *([^,]+)[,)].*')
-        define_re = re.compile(' *(m4_)?define\(([^,]+), *([^,]+)\)')
+        ac_init_re = re.compile('AC_INIT\(\s*([^,]+),\s*([^,]+)[,)].*')
+        am_init_re = re.compile('AM_INIT_AUTOMAKE\(\s*([^,]+),\s*([^,]+)[,)].*')
+        define_re = re.compile('\s*(m4_)?define\(\s*([^,]+),\s*([^,]+)\)')
 
         defines = {}
         def subst_defines(value):
-- 
2.5.0


