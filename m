Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE8EB74775
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 16:31:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w86GV0Vl003639
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 09:31:01 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Sep 2018 09:30:59 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 6 Sep 2018 23:52:24 +0800
Message-ID: <2824ade62c3ec58c96074aba632740a8118c15f2.1536248856.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1536248856.git.kai.kang@windriver.com>
References: <cover.1536248856.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] allarch: only enable allarch when multilib is not used
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
X-List-Received-Date: Thu, 06 Sep 2018 16:31:01 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Some allarch packages rdepends non-allarch packages. when multilib is
used, it doesn't expand the dependency chain correctly, e.g.

core-image-sato -> ca-certificates(allarch) -> openssl

we expect dependency chain for lib32-core-image-sato:

lib32-core-image-sato -> ca-certificates(allarch) -> lib32-openssl

it should install lib32-openssl for ca-certificates but openssl is still
wrongly required.

Only enable allarch when multilib is not used to fix the issue.

signed-off-by: kai kang <kai.kang@windriver.com>
---
 meta/classes/allarch.bbclass         | 12 +++++++++++-
 meta/classes/icecc.bbclass           |  2 +-
 meta/classes/multilib.bbclass        |  3 ++-
 meta/classes/multilib_global.bbclass |  4 +---
 meta/classes/package.bbclass         |  9 ++++++---
 5 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 1eebe0bf2e..45f62a5939 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -2,7 +2,17 @@
 # This class is used for architecture independent recipes/data files (usually scripts)
 #
 
-PACKAGE_ARCH = "all"
+python allarch_package_arch_handler () {
+    if bb.data.inherits_class("nativesdk", d) or bb.data.inherits_class("crosssdk", d):
+        return
+
+    variants = d.getVar("MULTILIB_VARIANTS")
+    if not variants:
+        d.setVar("PACKAGE_ARCH", "all" )
+}
+
+addhandler allarch_package_arch_handler
+allarch_package_arch_handler[eventmask] = "bb.event.RecipePreFinalise"
 
 python () {
     # Allow this class to be included but overridden - only set
diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 0ca8de86c2..b5a8457747 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -171,7 +171,7 @@ def use_icecc(bb,d):
     return "yes"
 
 def icecc_is_allarch(bb, d):
-    return d.getVar("PACKAGE_ARCH") == "all" or bb.data.inherits_class('allarch', d)
+    return d.getVar("PACKAGE_ARCH") == "all"
 
 def icecc_is_kernel(bb, d):
     return \
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index f2ac8bdfef..7b4d6472b0 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -50,7 +50,8 @@ python multilib_virtclass_handler () {
     if bb.data.inherits_class('nativesdk', e.data) or bb.data.inherits_class('crosssdk', e.data):
         raise bb.parse.SkipRecipe("We can't extend nativesdk recipes")
 
-    if bb.data.inherits_class('allarch', e.data) and not bb.data.inherits_class('packagegroup', e.data):
+    if bb.data.inherits_class('allarch', e.data) and not d.getVar('MULTILIB_VARIANTS') \
+        and not bb.data.inherits_class('packagegroup', e.data):
         raise bb.parse.SkipRecipe("Don't extend allarch recipes which are not packagegroups")
 
     # Expand this since this won't work correctly once we set a multilib into place
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index d2ec1adfea..1bb62427b0 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -165,9 +165,7 @@ python multilib_virtclass_handler_global () {
         return
 
     if bb.data.inherits_class('kernel', e.data) or \
-            bb.data.inherits_class('module-base', e.data) or \
-            (bb.data.inherits_class('allarch', e.data) and\
-             not bb.data.inherits_class('packagegroup', e.data)):
+            bb.data.inherits_class('module-base', e.data):
             variants = (e.data.getVar("MULTILIB_VARIANTS") or "").split()
 
             import oe.classextend
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0b6f65a855..d1e9138c66 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -494,7 +494,8 @@ def get_package_mapping (pkg, basepkg, d):
 
     if key in data:
         # Have to avoid undoing the write_extra_pkgs(global_variants...)
-        if bb.data.inherits_class('allarch', d) and data[key] == basepkg:
+        if bb.data.inherits_class('allarch', d) and not d.getVar('MULTILIB_VARIANTS') \
+            and data[key] == basepkg:
             return pkg
         return data[key]
 
@@ -1413,7 +1414,8 @@ fi
     if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
         write_extra_pkgs(variants, pn, packages, pkgdatadir)
 
-    if (bb.data.inherits_class('allarch', d) and not bb.data.inherits_class('packagegroup', d)):
+    if bb.data.inherits_class('allarch', d) and not variants \
+        and not bb.data.inherits_class('packagegroup', d):
         write_extra_pkgs(global_variants, pn, packages, pkgdatadir)
 
     workdir = d.getVar('WORKDIR')
@@ -1502,7 +1504,8 @@ fi
     if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
         write_extra_runtime_pkgs(variants, packages, pkgdatadir)
 
-    if bb.data.inherits_class('allarch', d) and not bb.data.inherits_class('packagegroup', d):
+    if bb.data.inherits_class('allarch', d) and not variants \
+        and not bb.data.inherits_class('packagegroup', d):
         write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
 
 }
-- 
2.18.0


