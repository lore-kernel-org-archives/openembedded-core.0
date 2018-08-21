Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC9F27900C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:13:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7L7DSST018238
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Aug 2018 00:13:28 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Tue, 21 Aug 2018 00:13:27 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 21 Aug 2018 14:36:06 +0800
Message-ID: <8544a42a3ffe9300e10eaaf26c2ca4f26eeaae8b.1534832871.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534832871.git.kai.kang@windriver.com>
References: <cover.1534832871.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] allarch: disable allarch when multilib is used
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
X-List-Received-Date: Tue, 21 Aug 2018 07:13:28 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Some allarch packages rdepends non-allarch packages. When multilib is
used, it doesn't expand the dependency chain correctly, e.g.

core-image-sato -> ca-certificates(allarch) -> openssl

we expect dependency chain for lib32-core-image-sato:

lib32-core-image-sato -> ca-certificates(allarch) -> lib32-openssl

it should install lib32-openssl for ca-certificates but openssl is
still wrongly required.

Move content of allarch.bbclass to allarch-enabled.bbclass and only
inherit allarch-enabled.bbclass when multilib is not used.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/allarch-enabled.bbclass | 52 ++++++++++++++++++++++++++++
 meta/classes/allarch.bbclass         | 51 ++-------------------------
 meta/classes/icecc.bbclass           |  2 +-
 meta/classes/multilib.bbclass        |  2 +-
 meta/classes/multilib_global.bbclass |  2 +-
 meta/classes/package.bbclass         |  6 ++--
 6 files changed, 60 insertions(+), 55 deletions(-)
 create mode 100644 meta/classes/allarch-enabled.bbclass

diff --git a/meta/classes/allarch-enabled.bbclass b/meta/classes/allarch-enabled.bbclass
new file mode 100644
index 0000000000..1eebe0bf2e
--- /dev/null
+++ b/meta/classes/allarch-enabled.bbclass
@@ -0,0 +1,52 @@
+#
+# This class is used for architecture independent recipes/data files (usually scripts)
+#
+
+PACKAGE_ARCH = "all"
+
+python () {
+    # Allow this class to be included but overridden - only set
+    # the values if we're still "all" package arch.
+    if d.getVar("PACKAGE_ARCH") == "all":
+        # No need for virtual/libc or a cross compiler
+        d.setVar("INHIBIT_DEFAULT_DEPS","1")
+
+        # Set these to a common set of values, we shouldn't be using them other that for WORKDIR directory
+        # naming anyway
+        d.setVar("baselib", "lib")
+        d.setVar("TARGET_ARCH", "allarch")
+        d.setVar("TARGET_OS", "linux")
+        d.setVar("TARGET_CC_ARCH", "none")
+        d.setVar("TARGET_LD_ARCH", "none")
+        d.setVar("TARGET_AS_ARCH", "none")
+        d.setVar("TARGET_FPU", "")
+        d.setVar("TARGET_PREFIX", "")
+        # Expand PACKAGE_EXTRA_ARCHS since the staging code needs this
+        # (this removes any dependencies from the hash perspective)
+        d.setVar("PACKAGE_EXTRA_ARCHS", d.getVar("PACKAGE_EXTRA_ARCHS"))
+        d.setVar("SDK_ARCH", "none")
+        d.setVar("SDK_CC_ARCH", "none")
+        d.setVar("TARGET_CPPFLAGS", "none")
+        d.setVar("TARGET_CFLAGS", "none")
+        d.setVar("TARGET_CXXFLAGS", "none")
+        d.setVar("TARGET_LDFLAGS", "none")
+        d.setVar("POPULATESYSROOTDEPS", "")
+
+        # Avoid this being unnecessarily different due to nuances of
+        # the target machine that aren't important for "all" arch
+        # packages.
+        d.setVar("LDFLAGS", "")
+
+        # No need to do shared library processing or debug symbol handling
+        d.setVar("EXCLUDE_FROM_SHLIBS", "1")
+        d.setVar("INHIBIT_PACKAGE_DEBUG_SPLIT", "1")
+        d.setVar("INHIBIT_PACKAGE_STRIP", "1")
+
+        # These multilib values shouldn't change allarch packages so exclude them
+        d.appendVarFlag("emit_pkgdata", "vardepsexclude", " MULTILIB_VARIANTS")
+        d.appendVarFlag("write_specfile", "vardepsexclude", " MULTILIBS")
+        d.appendVarFlag("do_package", "vardepsexclude", " package_do_shlibs")
+    elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
+        bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
+}
+
diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 1eebe0bf2e..0eca076df0 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -1,52 +1,5 @@
 #
-# This class is used for architecture independent recipes/data files (usually scripts)
+# This class enables allarch only when multilib is not used.
 #
 
-PACKAGE_ARCH = "all"
-
-python () {
-    # Allow this class to be included but overridden - only set
-    # the values if we're still "all" package arch.
-    if d.getVar("PACKAGE_ARCH") == "all":
-        # No need for virtual/libc or a cross compiler
-        d.setVar("INHIBIT_DEFAULT_DEPS","1")
-
-        # Set these to a common set of values, we shouldn't be using them other that for WORKDIR directory
-        # naming anyway
-        d.setVar("baselib", "lib")
-        d.setVar("TARGET_ARCH", "allarch")
-        d.setVar("TARGET_OS", "linux")
-        d.setVar("TARGET_CC_ARCH", "none")
-        d.setVar("TARGET_LD_ARCH", "none")
-        d.setVar("TARGET_AS_ARCH", "none")
-        d.setVar("TARGET_FPU", "")
-        d.setVar("TARGET_PREFIX", "")
-        # Expand PACKAGE_EXTRA_ARCHS since the staging code needs this
-        # (this removes any dependencies from the hash perspective)
-        d.setVar("PACKAGE_EXTRA_ARCHS", d.getVar("PACKAGE_EXTRA_ARCHS"))
-        d.setVar("SDK_ARCH", "none")
-        d.setVar("SDK_CC_ARCH", "none")
-        d.setVar("TARGET_CPPFLAGS", "none")
-        d.setVar("TARGET_CFLAGS", "none")
-        d.setVar("TARGET_CXXFLAGS", "none")
-        d.setVar("TARGET_LDFLAGS", "none")
-        d.setVar("POPULATESYSROOTDEPS", "")
-
-        # Avoid this being unnecessarily different due to nuances of
-        # the target machine that aren't important for "all" arch
-        # packages.
-        d.setVar("LDFLAGS", "")
-
-        # No need to do shared library processing or debug symbol handling
-        d.setVar("EXCLUDE_FROM_SHLIBS", "1")
-        d.setVar("INHIBIT_PACKAGE_DEBUG_SPLIT", "1")
-        d.setVar("INHIBIT_PACKAGE_STRIP", "1")
-
-        # These multilib values shouldn't change allarch packages so exclude them
-        d.appendVarFlag("emit_pkgdata", "vardepsexclude", " MULTILIB_VARIANTS")
-        d.appendVarFlag("write_specfile", "vardepsexclude", " MULTILIBS")
-        d.appendVarFlag("do_package", "vardepsexclude", " package_do_shlibs")
-    elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
-        bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
-}
-
+inherit ${@oe.utils.ifelse(d.getVar('MULTILIB_VARIANTS'), '', 'allarch-enabled')}
diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 0ca8de86c2..bb925b8d24 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -171,7 +171,7 @@ def use_icecc(bb,d):
     return "yes"
 
 def icecc_is_allarch(bb, d):
-    return d.getVar("PACKAGE_ARCH") == "all" or bb.data.inherits_class('allarch', d)
+    return d.getVar("PACKAGE_ARCH") == "all" or bb.data.inherits_class('allarch-enabled', d)
 
 def icecc_is_kernel(bb, d):
     return \
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index f2ac8bdfef..c576cd8b40 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -50,7 +50,7 @@ python multilib_virtclass_handler () {
     if bb.data.inherits_class('nativesdk', e.data) or bb.data.inherits_class('crosssdk', e.data):
         raise bb.parse.SkipRecipe("We can't extend nativesdk recipes")
 
-    if bb.data.inherits_class('allarch', e.data) and not bb.data.inherits_class('packagegroup', e.data):
+    if bb.data.inherits_class('allarch-enabled', e.data) and not bb.data.inherits_class('packagegroup', e.data):
         raise bb.parse.SkipRecipe("Don't extend allarch recipes which are not packagegroups")
 
     # Expand this since this won't work correctly once we set a multilib into place
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index d2ec1adfea..4e2b6718df 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -166,7 +166,7 @@ python multilib_virtclass_handler_global () {
 
     if bb.data.inherits_class('kernel', e.data) or \
             bb.data.inherits_class('module-base', e.data) or \
-            (bb.data.inherits_class('allarch', e.data) and\
+            (bb.data.inherits_class('allarch-enabled', e.data) and\
              not bb.data.inherits_class('packagegroup', e.data)):
             variants = (e.data.getVar("MULTILIB_VARIANTS") or "").split()
 
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4ce9de2f57..37160811cf 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -499,7 +499,7 @@ def get_package_mapping (pkg, basepkg, d):
 
     if key in data:
         # Have to avoid undoing the write_extra_pkgs(global_variants...)
-        if bb.data.inherits_class('allarch', d) and data[key] == basepkg:
+        if bb.data.inherits_class('allarch-enabled', d) and data[key] == basepkg:
             return pkg
         return data[key]
 
@@ -1411,7 +1411,7 @@ fi
     if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
         write_extra_pkgs(variants, pn, packages, pkgdatadir)
 
-    if (bb.data.inherits_class('allarch', d) and not bb.data.inherits_class('packagegroup', d)):
+    if (bb.data.inherits_class('allarch-enabled', d) and not bb.data.inherits_class('packagegroup', d)):
         write_extra_pkgs(global_variants, pn, packages, pkgdatadir)
 
     workdir = d.getVar('WORKDIR')
@@ -1500,7 +1500,7 @@ fi
     if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
         write_extra_runtime_pkgs(variants, packages, pkgdatadir)
 
-    if bb.data.inherits_class('allarch', d) and not bb.data.inherits_class('packagegroup', d):
+    if bb.data.inherits_class('allarch-enabled', d) and not bb.data.inherits_class('packagegroup', d):
         write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
 
 }
-- 
2.18.0


