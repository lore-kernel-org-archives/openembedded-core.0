Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn6Qr-0003sJ-Sy
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 12:43:37 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Dec 2012 03:28:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="184316272"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Dec 2012 03:28:05 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 13:28:38 +0200
Message-Id: <3c20b960aec3ca2f2271ec0a73ae186a8b3fff65.1356347599.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356347599.git.constantinx.musca@intel.com>
References: <cover.1356347599.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356347599.git.constantinx.musca@intel.com>
References: <cover.1356347599.git.constantinx.musca@intel.com>
Subject: [PATCH 1/3] multilib: fix allarch/kernel/module-base multilib issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Dec 2012 11:43:40 -0000

- skip the non-packagegroup allarch recipes in multilib_virtclass_handler
- extend PROVIDES/RPROVIDES for allarch recipes which are not packagegroups
- use variants from MULTILIB_GLOBAL_VARIANTS (lib32 lib64 libx32) to create
additional pkgdata files for multilib allarch: ${pkgdatadir}/${variant}-${PN}
and ${pkgdatadir}/runtime/${variant}-${pkg}
- use variants from MULTILIB_VARIANTS to create additional pkgdata files
for multilib kernel/module-base recipes
- add a sanity check to determine if the current multilib is in
MULTILIB_GLOBAL_VARIANTS

[YOCTO #2918]
[YOCTO #3440]
[YOCTO #3565]
[YOCTO #3568]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/multilib.bbclass        |  3 +++
 meta/classes/multilib_global.bbclass |  5 ++++-
 meta/classes/package.bbclass         | 30 ++++++++++++++++++++++++++++++
 meta/classes/sanity.bbclass          |  4 ++++
 meta/conf/multilib.conf              |  2 ++
 5 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 09c08ed..f5f3c69 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -31,6 +31,9 @@ python multilib_virtclass_handler () {
     if bb.data.inherits_class('nativesdk', e.data) or bb.data.inherits_class('crosssdk', e.data):
         raise bb.parse.SkipPackage("We can't extend nativesdk recipes")
 
+    if bb.data.inherits_class('allarch', e.data) and not bb.data.inherits_class('packagegroup', e.data):
+        raise bb.parse.SkipPackage("Don't extend allarch recipes which are not packagegroups")
+
     save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME", True) or ""
     for name in save_var_name.split():
         val=e.data.getVar(name, True)
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index f55e3a2..529e82a 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -10,7 +10,10 @@ python multilib_virtclass_handler_global () {
     variant = e.data.getVar("BBEXTENDVARIANT", True)
 
     if isinstance(e, bb.event.RecipeParsed) and not variant:
-        if bb.data.inherits_class('kernel', e.data) or bb.data.inherits_class('module-base', e.data):
+        if bb.data.inherits_class('kernel', e.data) or \
+            bb.data.inherits_class('module-base', e.data) or \
+            (bb.data.inherits_class('allarch', e.data) and\
+             not bb.data.inherits_class('packagegroup', e.data)):
             variants = (e.data.getVar("MULTILIB_VARIANTS", True) or "").split()
 
             import oe.classextend
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 9885d94..1ac6551 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1132,6 +1132,20 @@ python emit_pkgdata() {
             size = 0
         return size
 
+    def write_extra_pkgs(variants, pn, packages, pkgdatadir):
+        for variant in variants:
+            with open("%s/%s-%s" % (pkgdatadir, variant, pn), 'w') as fd:
+                fd.write("PACKAGES: %s\n" % ' '.join(
+                            map(lambda pkg: '%s-%s' % (variant, pkg), packages.split())))
+
+    def write_extra_runtime_pkgs(variants, packages, pkgdatadir):
+        for variant in variants:
+            for pkg in packages.split():
+                ml_pkg = "%s-%s" % (variant, pkg)
+                subdata_file = "%s/runtime/%s" % (pkgdatadir, ml_pkg)
+                with open(subdata_file, 'w') as fd:
+                    fd.write("PKG_%s: %s" % (ml_pkg, pkg))
+
     packages = d.getVar('PACKAGES', True)
     pkgdest = d.getVar('PKGDEST', True)
     pkgdatadir = d.getVar('PKGDESTWORK', True)
@@ -1144,6 +1158,16 @@ python emit_pkgdata() {
     f.write("PACKAGES: %s\n" % packages)
     f.close()
 
+    pn = d.getVar('PN', True)
+    global_variants = (d.getVar('MULTILIB_GLOBAL_VARIANTS', True) or "").split()
+    variants = (d.getVar('MULTILIB_VARIANTS', True) or "").split()
+
+    if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
+        write_extra_pkgs(variants, pn, packages, pkgdatadir)
+
+    if (bb.data.inherits_class('allarch', d) and not bb.data.inherits_class('packagegroup', d)):
+        write_extra_pkgs(global_variants, pn, packages, pkgdatadir)
+
     workdir = d.getVar('WORKDIR', True)
 
     for pkg in packages.split():
@@ -1198,6 +1222,12 @@ python emit_pkgdata() {
             packagedfile = pkgdatadir + '/runtime/%s.packaged' % pkg
             file(packagedfile, 'w').close()
 
+    if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('module-base', d):
+        write_extra_runtime_pkgs(variants, packages, pkgdatadir)
+
+    if bb.data.inherits_class('allarch', d) and not bb.data.inherits_class('packagegroup', d):
+        write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
+
     bb.utils.unlockfile(lf)
 }
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse"
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 5b4f070..0ffa52d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -114,6 +114,8 @@ def check_toolchain(data):
         tune_error_set.append(tune_errors)
 
     multilibs = (data.getVar("MULTILIB_VARIANTS", True) or "").split()
+    global_multilibs = (data.getVar("MULTILIB_GLOBAL_VARIANTS", True) or "").split()
+
     if multilibs:
         seen_libs = []
         seen_tunes = []
@@ -122,6 +124,8 @@ def check_toolchain(data):
                 tune_error_set.append("The multilib '%s' appears more than once." % lib)
             else:
                 seen_libs.append(lib)
+            if not lib in global_multilibs:
+                tune_error_set.append("Multilib %s is not present in MULTILIB_GLOBAL_VARIANTS" % lib)
             tune = data.getVar("DEFAULTTUNE_virtclass-multilib-%s" % lib, True)
             if tune in seen_tunes:
                 tune_error_set.append("The tuning '%s' appears in more than one multilib." % tune)
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index b22a4cb..97b53ec 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -12,3 +12,5 @@ STAGING_DIR_TARGET = "${STAGING_DIR}/${MLPREFIX}${MACHINE}"
 INHERIT += "multilib_global"
 
 BBCLASSEXTEND_append = " ${MULTILIBS}"
+
+MULTILIB_GLOBAL_VARIANTS  = "lib32 lib64 libx32"
-- 
1.7.11.7



