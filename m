Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 622F371633
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 11:19:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2016 03:19:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,312,1449561600"; d="scan'208";a="635439999"
Received: from stan94-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.180.176])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2016 03:19:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 00:18:28 +1300
Message-Id: <a8be7fc83b784f8830300eea35421652418bbca6.1453115842.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/10] recipetool: create: detect flex/bison dependency
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
X-List-Received-Date: Mon, 18 Jan 2016 11:19:11 -0000

There are a few different macros that can be used to pick up these
tools, add support for them all.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 544dae3..c6d9bbe 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -296,6 +296,10 @@ class AutotoolsRecipeHandler(RecipeHandler):
                 deps.append('libx11')
             elif keyword in ('AX_BOOST', 'BOOST_REQUIRE'):
                 deps.append('boost')
+            elif keyword in ('AC_PROG_LEX', 'AM_PROG_LEX', 'AX_PROG_FLEX'):
+                deps.append('flex-native')
+            elif keyword in ('AC_PROG_YACC', 'AX_PROG_BISON'):
+                deps.append('bison-native')
             elif keyword == 'AC_INIT':
                 if extravalues is not None:
                     res = ac_init_re.match(value)
@@ -336,6 +340,11 @@ class AutotoolsRecipeHandler(RecipeHandler):
                     'AC_PATH_X',
                     'AX_BOOST',
                     'BOOST_REQUIRE',
+                    'AC_PROG_LEX',
+                    'AM_PROG_LEX',
+                    'AX_PROG_FLEX',
+                    'AC_PROG_YACC',
+                    'AX_PROG_BISON',
                     'AC_INIT',
                     'AM_INIT_AUTOMAKE',
                     'define(',
-- 
2.5.0


