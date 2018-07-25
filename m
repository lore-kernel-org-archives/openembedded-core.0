Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 435C278870
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 17:16:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6PHGV2D020092
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Jul 2018 10:16:32 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 25 Jul 2018 10:16:31 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <mark.hatle@windriver.com>
Date: Thu, 26 Jul 2018 00:41:06 +0800
Message-ID: <20180725164107.8891-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180725164107.8891-1-kai.kang@windriver.com>
References: <20180725164107.8891-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 1/2] make allarch packages don't dependent specific multilib package
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
X-List-Received-Date: Wed, 25 Jul 2018 17:16:32 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The dependencies of allarch packages doesn't not extend when enable
multilib. So take ca-certificates as an example, it always requires
openssl no matter whether multilib is enabled. For multilib image such
as lib32-core-image-sato, it installs 64 bits openssl rather than
lib32-openssl which is expected.

So extend rdependencies of allarch package with prefix 'noarch-' and all
of multilib variants. For

ca-certificates -> openssl

exends to

ca-certificates -> openssl, lib32-openssl, noarch-openssl

Rdepends on openssl and lib32-openssl make both of them exist in
oe-core-repo when do rootfs. And then make both openssl and
lib32-openssl provide noarch-openssl. And only keep noarch-openssl in
RDEPENDS when write package for ca-certificates. So when do image rootfs
for lib32-core-image-sato, remove openssl if installed already and
install lib32-openssl for allarch pacakge ca-certificates.

And extend rprovides of allarch package with prefix 'noarch-' too that
it may be required by other allarch packages. Put all dependent packages
of all allarch recipes in oe-core to a new ariable 'ALLARCH_RDEP_PKGS'.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/allarch.bbclass         |  3 ---
 meta/classes/multilib.bbclass        |  3 ++-
 meta/classes/multilib_global.bbclass | 31 +++++++++++++++++++++++++++-
 meta/classes/nativesdk.bbclass       |  8 +++++++
 meta/classes/package_deb.bbclass     |  7 ++++++-
 meta/classes/package_ipk.bbclass     |  7 ++++++-
 meta/classes/package_rpm.bbclass     |  8 ++++++-
 meta/conf/multilib.conf              | 16 ++++++++++++++
 8 files changed, 75 insertions(+), 8 deletions(-)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 1eebe0bf2e..52efba405a 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -42,9 +42,6 @@ python () {
         d.setVar("INHIBIT_PACKAGE_DEBUG_SPLIT", "1")
         d.setVar("INHIBIT_PACKAGE_STRIP", "1")
 
-        # These multilib values shouldn't change allarch packages so exclude them
-        d.appendVarFlag("emit_pkgdata", "vardepsexclude", " MULTILIB_VARIANTS")
-        d.appendVarFlag("write_specfile", "vardepsexclude", " MULTILIBS")
         d.appendVarFlag("do_package", "vardepsexclude", " package_do_shlibs")
     elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
         bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index f2ac8bdfef..f9417ce69e 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -134,7 +134,8 @@ python do_package_qa_multilib() {
                 i = i[len('virtual/'):]
             if (not i.startswith('kernel-module')) and (not i.startswith(mlprefix)) and \
                 (not 'cross-canadian' in i) and (not i.startswith("nativesdk-")) and \
-                (not i.startswith("rtld")) and (not i.startswith('kernel-vmlinux')):
+                (not i.startswith("rtld")) and (not i.startswith('kernel-vmlinux')) and \
+                (not i.startswith("noarch")):
                 candidates.append(i)
         if len(candidates) > 0:
             msg = "%s package %s - suspicious values '%s' in %s" \
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index d2ec1adfea..a5e3046498 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -161,6 +161,16 @@ multilib_virtclass_handler_vendor[eventmask] = "bb.event.ConfigParsed"
 
 python multilib_virtclass_handler_global () {
     variant = e.data.getVar("BBEXTENDVARIANT")
+
+    # make packages from ALLARCH_RDEP_PKGS provide noarch-pkg
+    if not (bb.data.inherits_class('nativesdk', e.data) or bb.data.inherits_class('crosssdk', e.data)):
+        for pkg in (e.data.getVar("PACKAGES") or "").split():
+            bpkg = pkg.lstrip(variant + "-" if variant else "")
+            if bpkg in (e.data.getVar("ALLARCH_RDEP_PKGS") or ""):
+                rprovs = d.getVar("RPROVIDES_%s" % pkg) or ""
+                rprovs = rprovs + " noarch-" + bpkg
+                d.setVar("RPROVIDES_%s" % pkg, rprovs.strip())
+
     if variant:
         return
 
@@ -194,9 +204,28 @@ python multilib_virtclass_handler_global () {
                 for clsextend in clsextends:
                     rprovs = rprovs + " " + clsextend.map_variable("RPROVIDES_%s" % pkg, setvar=False)
                     rprovs = rprovs + " " + clsextend.extname + "-" + pkg
+
+                if bb.data.inherits_class('allarch', e.data):
+                    # make allarch pkg rprovides noarch-itself
+                    if not pkg.endswith(("-dbg", "-dev", "-staticdev")):
+                        rprovs = rprovs + " noarch-" + pkg
+
                 e.data.setVar("RPROVIDES_%s" % pkg, rprovs)
+
+            # Process RDEPENDS for noarch recipe
+            if bb.data.inherits_class('allarch', e.data) and \
+                not (bb.data.inherits_class('nativesdk', e.data) or bb.data.inherits_class('crosssdk', e.data)):
+                noarch_clsext = oe.classextend.ClassExtender('noarch', e.data)
+                for pkg in (e.data.getVar("PACKAGES") or "").split():
+                    if pkg.endswith(("-dbg", "-dev", "-staticdev")):
+                        continue
+
+                    rdeps = e.data.getVar("RDEPENDS_%s" % pkg) or ""
+                    rdeps = rdeps + " " + noarch_clsext.map_variable("RDEPENDS_%s" % pkg, setvar=False)
+                    for clsextend in clsextends:
+                        rdeps = rdeps + " " + clsextend.map_variable("RDEPENDS_%s" % pkg, setvar=False)
+                    e.data.setVar("RDEPENDS_%s" % pkg, rdeps)
 }
 
 addhandler multilib_virtclass_handler_global
 multilib_virtclass_handler_global[eventmask] = "bb.event.RecipeParsed"
-
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index ab566e9803..8f8af8f188 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -95,6 +95,14 @@ python () {
     clsextend.map_packagevars()
     clsextend.map_variable("PROVIDES")
     clsextend.map_regexp_variable("PACKAGES_DYNAMIC")
+
+    # make variant-pkg from ALLARCH_RDEP_PKGS provides noarch-pkg
+    for pkg in (d.getVar("PACKAGES") or "").split():
+        bpkg = pkg.replace("nativesdk-", "")
+        if bpkg in (d.getVar("ALLARCH_RDEP_PKGS") or "").split():
+            rprovs = d.getVar("RPROVIDES_%s" % pkg) or ""
+            rprovs = rprovs + " noarch-" + pkg
+            d.setVar("RPROVIDES_%s" % pkg, rprovs)
 }
 
 addhandler nativesdk_virtclass_handler
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 2e8d17d3c7..71f69b9ac3 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -245,7 +245,12 @@ def deb_write_pkg(pkg, d):
                     elif (v or "").startswith("> "):
                         var[dep][i] = var[dep][i].replace("> ", ">> ")
 
-        rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS") or "")
+        rdepends = localdata.getVar("RDEPENDS") or ""
+        if bb.data.inherits_class('allarch', localdata) \
+            and not bb.data.inherits_class('packagegroup', localdata) \
+            and not pkg.endswith(("-dbg", "-dev", "-staticdev")):
+            rdepends =  " ".join(list(filter(lambda dep: dep.startswith('noarch-'), rdepends.split())))
+        rdepends = bb.utils.explode_dep_versions2(rdepends)
         debian_cmp_remap(rdepends)
         for dep in list(rdepends.keys()):
                 if dep == pkg:
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index a0b34fa7a5..783a2302bf 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -225,7 +225,12 @@ def ipk_write_pkg(pkg, d):
                     elif (v or "").startswith("> "):
                         var[dep][i] = var[dep][i].replace("> ", ">> ")
 
-        rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS") or "")
+        rdepends = localdata.getVar("RDEPENDS") or ""
+        if bb.data.inherits_class('allarch', localdata) \
+            and not bb.data.inherits_class('packagegroup', localdata) \
+            and not pkg.endswith(("-dbg", "-dev", "-staticdev")):
+            rdepends = " ".join(list(filter(lambda dep: dep.startswith('noarch-'), rdepends)))
+        rdepends = bb.utils.explode_dep_versions2(rdepends)
         debian_cmp_remap(rdepends)
         rrecommends = bb.utils.explode_dep_versions2(localdata.getVar("RRECOMMENDS") or "")
         debian_cmp_remap(rrecommends)
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 21ada348aa..dbd7cc3701 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -333,6 +333,13 @@ python write_specfile () {
 
         localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)
 
+        if bb.data.inherits_class('allarch', localdata) \
+            and not bb.data.inherits_class('packagegroup', localdata) \
+            and not pkg.endswith(("-dbg", "-dev", "-staticdev")):
+            rdeps = (localdata.getVar('RDEPENDS') or "").split()
+            rdeps = list(filter(lambda dep: dep.startswith('noarch-'), rdeps))
+            localdata.setVar('RDEPENDS', ' '.join(rdeps))
+
         conffiles = get_conffiles(pkg, d)
         dirfiles = localdata.getVar('DIRFILES')
         if dirfiles is not None:
@@ -372,7 +379,6 @@ python write_specfile () {
         splitrprerm    = localdata.getVar('pkg_prerm')
         splitrpostrm   = localdata.getVar('pkg_postrm')
 
-
         if not perfiledeps:
             # Add in summary of per file dependencies
             splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index e74dec81a8..2466befbca 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -26,3 +26,19 @@ OPKG_ARGS_append = " --force-maintainer --force-overwrite"
 PKG_CONFIG_PATH .= ":${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig"
 PKG_CONFIG_PATH[vardepsexclude] = "datadir WORKDIR"
 PKG_CONFIG_PATH[vardepvalueexclude] = ":${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig"
+
+# resolve runtime dependencies of allarch packages when enable multilib
+ALLARCH_RDEP_PKGS ?= "\
+    bash \
+    busybox-mdev \
+    font-util \
+    fontconfig-utils \
+    kbd \
+    openssl \
+    perl \
+    ppp \
+    udev \
+    udev-extraconf \
+    weston \
+    ${VIRTUAL-RUNTIME_base-utils} \
+"
-- 
2.17.1


