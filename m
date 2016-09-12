Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19D58771F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 08:32:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8C8WCiI004980
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 01:32:12 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Sep 2016 01:32:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Sep 2016 01:32:08 -0700
Message-ID: <4a987c9c17b8a84c12275262d24f7631770b42d3.1473669090.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1473669090.git.liezhi.yang@windriver.com>
References: <cover.1473669090.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] meta: cleanup d.getVar(var, 0)
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
X-List-Received-Date: Mon, 12 Sep 2016 08:32:13 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/base.bbclass          |  2 +-
 meta/classes/image.bbclass         |  2 +-
 meta/classes/package.bbclass       |  2 +-
 meta/classes/recipe_sanity.bbclass | 22 +++++++++++-----------
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index a31a53f..5a1bd3a 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -472,7 +472,7 @@ python () {
         else:
             raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % d.getVar('MACHINE', True))
 
-    source_mirror_fetch = d.getVar('SOURCE_MIRROR_FETCH', 0)
+    source_mirror_fetch = d.getVar('SOURCE_MIRROR_FETCH', False)
     if not source_mirror_fetch:
         need_host = d.getVar('COMPATIBLE_HOST', True)
         if need_host:
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 8c8b8a2..8273401 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -359,7 +359,7 @@ python () {
     # Without de-duplication, gen_conversion_cmds() below
     # would create the same compression command multiple times.
     ctypes = set(d.getVar('CONVERSIONTYPES', True).split())
-    old_overrides = d.getVar('OVERRIDES', 0)
+    old_overrides = d.getVar('OVERRIDES', False)
 
     def _image_base_type(type):
         basetype = type
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d0b2db6..a9ca141 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1490,7 +1490,7 @@ python package_do_shlibs() {
     import re, pipes
     import subprocess as sub
 
-    exclude_shlibs = d.getVar('EXCLUDE_FROM_SHLIBS', 0)
+    exclude_shlibs = d.getVar('EXCLUDE_FROM_SHLIBS', False)
     if exclude_shlibs:
         bb.note("not generating shlibs")
         return
diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index 295611f..add34df 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -8,7 +8,7 @@ def bad_runtime_vars(cfgdata, d):
         return
 
     for var in d.getVar("__recipe_sanity_badruntimevars", True).split():
-        val = d.getVar(var, 0)
+        val = d.getVar(var, False)
         if val and val != cfgdata.get(var):
             __note("%s should be %s_${PN}" % (var, var), d)
 
@@ -16,11 +16,11 @@ __recipe_sanity_reqvars = "DESCRIPTION"
 __recipe_sanity_reqdiffvars = ""
 def req_vars(cfgdata, d):
     for var in d.getVar("__recipe_sanity_reqvars", True).split():
-        if not d.getVar(var, 0):
+        if not d.getVar(var, False):
             __note("%s should be set" % var, d)
 
     for var in d.getVar("__recipe_sanity_reqdiffvars", True).split():
-        val = d.getVar(var, 0)
+        val = d.getVar(var, False)
         cfgval = cfgdata.get(var)
 
         if not val:
@@ -29,7 +29,7 @@ def req_vars(cfgdata, d):
             __note("%s should be defined to something other than default (%s)" % (var, cfgval), d)
 
 def var_renames_overwrite(cfgdata, d):
-    renames = d.getVar("__recipe_sanity_renames", 0)
+    renames = d.getVar("__recipe_sanity_renames", False)
     if renames:
         for (key, newkey, oldvalue, newvalue) in renames:
             if oldvalue != newvalue and oldvalue != cfgdata.get(newkey):
@@ -50,7 +50,7 @@ def can_use_autotools_base(cfgdata, d):
         if cfg.find(i) != -1:
             return False
 
-    for clsfile in d.getVar("__inherit_cache", 0):
+    for clsfile in d.getVar("__inherit_cache", False):
         (base, _) = os.path.splitext(os.path.basename(clsfile))
         if cfg.find("%s_do_configure" % base) != -1:
             __note("autotools_base usage needs verification, spotted %s_do_configure" % base, d)
@@ -60,7 +60,7 @@ def can_use_autotools_base(cfgdata, d):
 def can_delete_FILESPATH(cfgdata, d):
     expected = cfgdata.get("FILESPATH")
     expectedpaths = d.expand(expected)
-    unexpanded = d.getVar("FILESPATH", 0)
+    unexpanded = d.getVar("FILESPATH", False)
     filespath = d.getVar("FILESPATH", True).split(":")
     filespath = [os.path.normpath(f) for f in filespath if os.path.exists(f)]
     for fp in filespath:
@@ -73,7 +73,7 @@ def can_delete_FILESPATH(cfgdata, d):
 def can_delete_FILESDIR(cfgdata, d):
     expected = cfgdata.get("FILESDIR")
     #expected = "${@bb.utils.which(d.getVar('FILESPATH', True), '.')}"
-    unexpanded = d.getVar("FILESDIR", 0)
+    unexpanded = d.getVar("FILESDIR", False)
     if unexpanded is None:
         return False
 
@@ -90,7 +90,7 @@ def can_delete_others(p, cfgdata, d):
     for k in ["S", "PV", "PN", "DESCRIPTION", "DEPENDS",
               "SECTION", "PACKAGES", "EXTRA_OECONF", "EXTRA_OEMAKE"]:
     #for k in cfgdata:
-        unexpanded = d.getVar(k, 0)
+        unexpanded = d.getVar(k, False)
         cfgunexpanded = cfgdata.get(k)
         if not cfgunexpanded:
             continue
@@ -117,7 +117,7 @@ python do_recipe_sanity () {
         #(can_use_autotools_base, "candidate for use of autotools_base"),
         (incorrect_nonempty_PACKAGES, "native or cross recipe with non-empty PACKAGES"),
     ]
-    cfgdata = d.getVar("__recipe_sanity_cfgdata", 0)
+    cfgdata = d.getVar("__recipe_sanity_cfgdata", False)
 
     for (func, msg) in sanitychecks:
         if func(cfgdata, d):
@@ -143,8 +143,8 @@ python recipe_sanity_eh () {
 
     cfgdata = {}
     for k in d.keys():
-        if not isinstance(d.getVar(k, 0), bb.data_smart.DataSmart):
-            cfgdata[k] = d.getVar(k, 0)
+        if not isinstance(d.getVar(k, False), bb.data_smart.DataSmart):
+            cfgdata[k] = d.getVar(k, False)
 
     d.setVar("__recipe_sanity_cfgdata", cfgdata)
     #d.setVar("__recipe_sanity_cfgdata", d)
-- 
2.9.0


