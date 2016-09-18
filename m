Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CE17473163
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 20:08:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 18 Sep 2016 13:08:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,358,1470726000"; d="scan'208";a="1058565553"
Received: from yewyangh-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.139])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2016 13:08:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2016 08:08:04 +1200
Message-Id: <211b2cd42d2cd92838c1800369ad87bc9e9c402e.1474229259.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/10] recipetool: create: fix picking up name from local python source tree
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
X-List-Received-Date: Sun, 18 Sep 2016 20:08:48 -0000

Make use of the extravalues dict to send back other variable values from
the python handling plugin, and enable passing back PV and PN. This not
only places variable values in the final recipe a bit more consistently
with other types of source, it also allows the name and version to be
picked up fron a local source tree and not just when the recipe is
fetched from a remote URL that happens to have those in it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 36 ++----------------------
 1 file changed, 2 insertions(+), 34 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index fb9806d..354af0c 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -61,8 +61,6 @@ class PythonRecipeHandler(RecipeHandler):
     }
     # PN/PV are already set by recipetool core & desc can be extremely long
     excluded_fields = [
-        'Name',
-        'Version',
         'Description',
     ]
     setup_parse_map = {
@@ -237,7 +235,6 @@ class PythonRecipeHandler(RecipeHandler):
 
 
         # Map PKG-INFO & setup.py fields to bitbake variables
-        bbinfo = {}
         for field, values in info.items():
             if field in self.excluded_fields:
                 continue
@@ -251,37 +248,8 @@ class PythonRecipeHandler(RecipeHandler):
                 value = ' '.join(str(v) for v in values if v)
 
             bbvar = self.bbvar_map[field]
-            if bbvar not in bbinfo and value:
-                bbinfo[bbvar] = value
-
-        comment_lic_line = None
-        for pos, line in enumerate(list(lines_before)):
-            if line.startswith('#') and 'LICENSE' in line:
-                comment_lic_line = pos
-            elif line.startswith('LICENSE =') and 'LICENSE' in bbinfo:
-                if line in ('LICENSE = "Unknown"', 'LICENSE = "CLOSED"'):
-                    lines_before[pos] = 'LICENSE = "{}"'.format(bbinfo['LICENSE'])
-                    if line == 'LICENSE = "CLOSED"' and comment_lic_line:
-                        lines_before[comment_lic_line:pos] = [
-                            '# WARNING: the following LICENSE value is a best guess - it is your',
-                            '# responsibility to verify that the value is complete and correct.'
-                        ]
-                del bbinfo['LICENSE']
-
-        src_uri_line = None
-        for pos, line in enumerate(lines_before):
-            if line.startswith('SRC_URI ='):
-                src_uri_line = pos
-
-        if bbinfo:
-            mdinfo = ['']
-            for k in sorted(bbinfo):
-                v = bbinfo[k]
-                mdinfo.append('{} = "{}"'.format(k, v))
-            if src_uri_line:
-                lines_before[src_uri_line-1:src_uri_line-1] = mdinfo
-            else:
-                lines_before.extend(mdinfo)
+            if bbvar not in extravalues and value:
+                extravalues[bbvar] = value
 
         mapped_deps, unmapped_deps = self.scan_setup_python_deps(srctree, setup_info, setup_non_literals)
 
-- 
2.5.5


