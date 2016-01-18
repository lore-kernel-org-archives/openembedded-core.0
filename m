Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D36E86FF84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 11:19:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2016 03:19:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,312,1449561600"; d="scan'208";a="635439989"
Received: from stan94-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.180.176])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2016 03:19:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 00:18:27 +1300
Message-Id: <24fc0618803bfb0d61be693482464615c53b4218.1453115842.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/10] recipetool: create: pick up boost macros in configure.ac
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
X-List-Received-Date: Mon, 18 Jan 2016 11:19:08 -0000

The presence of BOOST_REQUIRE or AX_BOOST.* indicates that boost is a
dependency.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 7fedb2a..544dae3 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -294,6 +294,8 @@ class AutotoolsRecipeHandler(RecipeHandler):
                                     unmappedlibs.append(lib)
             elif keyword == 'AC_PATH_X':
                 deps.append('libx11')
+            elif keyword in ('AX_BOOST', 'BOOST_REQUIRE'):
+                deps.append('boost')
             elif keyword == 'AC_INIT':
                 if extravalues is not None:
                     res = ac_init_re.match(value)
@@ -332,6 +334,8 @@ class AutotoolsRecipeHandler(RecipeHandler):
                     'AC_PATH_PROG',
                     'AC_CHECK_LIB',
                     'AC_PATH_X',
+                    'AX_BOOST',
+                    'BOOST_REQUIRE',
                     'AC_INIT',
                     'AM_INIT_AUTOMAKE',
                     'define(',
-- 
2.5.0


