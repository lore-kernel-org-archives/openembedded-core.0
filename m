Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.1187.1590530250553904915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 14:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SuE2vx1e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id c71so1143836wmd.5
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 14:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JiV/sSy2/E6do2DcIiA+EA6By+7502CRsTJw1fwIX4s=;
        b=SuE2vx1e+oiDFJ0SD3Rg/SQlKQnDBZN7V/Vt2J6dNjl+VWKHJ2/LBRaK7eq4blMyTv
         2sSVflKa7iuL/SuK16yhMjdkKoLKQvxQISjoqYBwiYpSzPKWbEPBEBftJ9I60OnOWz0Q
         Hv4uLlQAXzkwSKYrd2n5dl+nfZSSINMiXiPgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JiV/sSy2/E6do2DcIiA+EA6By+7502CRsTJw1fwIX4s=;
        b=gAaZdf3HhNJdIuxaI3yI0y6wVEsOtIOuVWvFfUz16VHw+SvrWQeDhTLD1u3aUHe5Gl
         lowT5Xy93Cz10kkrsQJmy3Gboj8t6nqyxLWfCYBUT/1unFlkFhJte8HnyEtzpLlgXVi+
         FPgGvQ6mV9K3IH4ChoPfwZcYZJbhZvDjaXub57xKmsCukhNGSvos8BbwscBSnF102tsV
         nR+2/J5YJsIWYmkgjEITVP24BYNstiqGP4HL2Bu7kVXYmY5WdanhmlAB/clG/tin8bjt
         ZcVFBFhuKjLTcYFZDSn/Dx37w3k38sqOXUcCjpc1zZmqU18gzM9YhongxNYzmzHCzoJv
         VfmA==
X-Gm-Message-State: AOAM530EU6BEMhZHbSG4fB7iCPPzfOgOvCtFOQIZaKrL7EV/CVBqOvLE
	KtFzUiZSbdyhbb2n/xdSuiBRUtU5+sU+dA==
X-Google-Smtp-Source: ABdhPJxawiH747xateapbqlPieYaEdJk8uDEBbkqnuqnYQBXVHNW1jTfgMok5va41te4U3LPYRM3xQ==
X-Received: by 2002:a1c:7213:: with SMTP id n19mr1141085wmc.88.1590530247776;
        Tue, 26 May 2020 14:57:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z132sm901291wmc.29.2020.05.26.14.57.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 14:57:27 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5 v2] multilib/recipes: Use new RecipePostKeyExpansion event
Date: Tue, 26 May 2020 22:57:21 +0100
Message-Id: <20200526215725.992258-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are issues with multilib due to the ordering of events where some
functions see the remapped multilib dependencies and some do not. A significant
problem is that the multilib class needs to make some changes before key expansion
and some afterwards but by using existing event handlers, some code sees things
in a partially translated state, leading to bugs.

This patch changes things to use a new event handler from bitbake which makes the
ordering of the changes explcit.

The challenge in doing this is that it breaks some existing anonymous python and
dyanmic assignments. In some cases these used to be translated and no longer are,
meaning MLPREFIX has to be added. In some cases these are now translated and the
MLPREFIX can be removed.

This change does now make it very clear when MLPREFIX is required and when it is
not, its just the migration path which is harder. The patch changes the small number
of cases where fixes are needed.

In particular, where a variable like RDEPENDS is conditionally extended (e.g.
with an override), MLPREFIX is now required.

This patch also reverts:
base: Revert 'base.bbclass: considering multilib when setting LICENSE_EXCLUSION'

This reverts 6597130256a1609c3e05ec5891aceaf549c37985 as the changes
to multilib datastore handling mean its no longer necessary.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass                     |  3 +-
 meta/classes/fontcache.bbclass                |  2 +-
 meta/classes/multilib.bbclass                 | 28 ++++++++++++---
 meta/lib/oe/classextend.py                    | 35 +++++++++++++++++--
 meta/recipes-core/glibc/glibc-package.inc     |  2 +-
 .../packagegroups/packagegroup-base.bb        |  8 ++---
 meta/recipes-core/psplash/psplash_git.bb      |  5 +--
 meta/recipes-devtools/perl/perl_5.30.2.bb     |  2 +-
 meta/recipes-devtools/python/python3_3.8.2.bb | 14 ++++----
 .../packagegroup-core-full-cmdline.bb         | 10 +++---
 meta/recipes-graphics/mesa/mesa.inc           | 10 +++---
 .../alsa/alsa-plugins_1.2.1.bb                |  6 ++--
 meta/recipes-support/boost/boost.inc          | 10 ++++--
 13 files changed, 95 insertions(+), 40 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 7aa2e144eb7..4c681cc870d 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -570,8 +570,7 @@ python () {
                 if unskipped_pkgs:
                     for pkg in skipped_pkgs:
                         bb.debug(1, "Skipping the package %s at do_rootfs because of incompatible license(s): %s" % (pkg, ' '.join(skipped_pkgs[pkg])))
-                        mlprefix = d.getVar('MLPREFIX')
-                        d.setVar('LICENSE_EXCLUSION-' + mlprefix + pkg, ' '.join(skipped_pkgs[pkg]))
+                        d.setVar('LICENSE_EXCLUSION-' + pkg, ' '.join(skipped_pkgs[pkg]))
                     for pkg in unskipped_pkgs:
                         bb.debug(1, "Including the package %s" % pkg)
                 else:
diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index 97e7f17f00e..624a420a0de 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -7,7 +7,7 @@ PACKAGE_WRITE_DEPS += "qemu-native"
 inherit qemu
 
 FONT_PACKAGES ??= "${PN}"
-FONT_EXTRA_RDEPENDS ?= "fontconfig-utils"
+FONT_EXTRA_RDEPENDS ?= "${MLPREFIX}fontconfig-utils"
 FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 FONTCONFIG_CACHE_PARAMS ?= "-v"
 # You can change this to e.g. FC_DEBUG=16 to debug fc-cache issues,
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index ee677da1e20..9f726e45371 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -91,13 +91,12 @@ addhandler multilib_virtclass_handler
 multilib_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
 
 python __anonymous () {
-    variant = d.getVar("BBEXTENDVARIANT")
-
-    import oe.classextend
+    if bb.data.inherits_class('image', d):
+        variant = d.getVar("BBEXTENDVARIANT")
+        import oe.classextend
 
-    clsextend = oe.classextend.ClassExtender(variant, d)
+        clsextend = oe.classextend.ClassExtender(variant, d)
 
-    if bb.data.inherits_class('image', d):
         clsextend.map_depends_variable("PACKAGE_INSTALL")
         clsextend.map_depends_variable("LINGUAS_INSTALL")
         clsextend.map_depends_variable("RDEPENDS")
@@ -109,6 +108,22 @@ python __anonymous () {
         bb.build.deltask('do_populate_sdk', d)
         bb.build.deltask('do_populate_sdk_ext', d)
         return
+}
+
+python multilib_virtclass_handler_postkeyexp () {
+    cls = d.getVar("BBEXTENDCURR")
+    variant = d.getVar("BBEXTENDVARIANT")
+    if cls != "multilib" or not variant:
+        return
+
+    variant = d.getVar("BBEXTENDVARIANT")
+
+    import oe.classextend
+
+    clsextend = oe.classextend.ClassExtender(variant, d)
+
+    if bb.data.inherits_class('image', d):
+        return
 
     clsextend.map_depends_variable("DEPENDS")
     clsextend.map_variable("PROVIDES")
@@ -129,6 +144,9 @@ python __anonymous () {
     reset_alternative_priority(d)
 }
 
+addhandler multilib_virtclass_handler_postkeyexp
+multilib_virtclass_handler_postkeyexp[eventmask] = "bb.event.RecipePostKeyExpansion"
+
 def reset_alternative_priority(d):
     if not bb.data.inherits_class('update-alternatives', d):
         return
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index f02fbe9fbad..e1049ce3e88 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -4,11 +4,21 @@
 
 import collections
 
+def get_packages(d):
+    pkgs = d.getVar("PACKAGES_NONML")
+    extcls = d.getVar("EXTENDERCLASS")
+    return extcls.rename_packages_internal(pkgs)
+
+def get_depends(varprefix, d):
+    extcls = d.getVar("EXTENDERCLASS")
+    return extcls.map_depends_variable(varprefix + "_NONML")
+
 class ClassExtender(object):
     def __init__(self, extname, d):
         self.extname = extname
         self.d = d
         self.pkgs_mapping = []
+        self.d.setVar("EXTENDERCLASS", self)
 
     def extend_name(self, name):
         if name.startswith("kernel-") or name == "virtual/kernel":
@@ -24,7 +34,7 @@ class ClassExtender(object):
             if not subs.startswith(self.extname):
                 return "virtual/" + self.extname + "-" + subs
             return name
-        if name.startswith("/"):
+        if name.startswith("/") or (name.startswith("${") and name.endswith("}")):
             return name
         if not name.startswith(self.extname):
             return self.extname + "-" + name
@@ -89,8 +99,14 @@ class ClassExtender(object):
         for dep in deps:
             newdeps[self.map_depends(dep)] = deps[dep]
 
-        self.d.setVar(varname, bb.utils.join_deps(newdeps, False).replace("EXTENDPKGV", "${EXTENDPKGV}"))
+        if not varname.endswith("_NONML"):
+            #if varname == "DEPENDS":
+            self.d.renameVar(varname, varname + "_NONML")
+            self.d.setVar(varname, "${@oe.classextend.get_depends('%s', d)}" % varname)
+            self.d.appendVarFlag(varname, "vardeps", " " + varname + "_NONML")
+        ret = bb.utils.join_deps(newdeps, False).replace("EXTENDPKGV", "${EXTENDPKGV}")
         self.d.setVar("EXTENDPKGV", orig)
+        return ret
 
     def map_packagevars(self):
         for pkg in (self.d.getVar("PACKAGES").split() + [""]):
@@ -109,10 +125,23 @@ class ClassExtender(object):
                continue
             self.pkgs_mapping.append([pkg, self.extend_name(pkg)])
 
-        self.d.setVar("PACKAGES", " ".join([row[1] for row in self.pkgs_mapping]))
+        self.d.renameVar("PACKAGES", "PACKAGES_NONML")
+        self.d.setVar("PACKAGES", "${@oe.classextend.get_packages(d)}")
+
+    def rename_packages_internal(self, pkgs):
+        self.pkgs_mapping = []
+        for pkg in (self.d.expand(pkgs) or "").split():
+            if pkg.startswith(self.extname):
+               self.pkgs_mapping.append([pkg.split(self.extname + "-")[1], pkg])
+               continue
+            self.pkgs_mapping.append([pkg, self.extend_name(pkg)])
+
+        return " ".join([row[1] for row in self.pkgs_mapping])
 
     def rename_package_variables(self, variables):
         for pkg_mapping in self.pkgs_mapping:
+            if pkg_mapping[0].startswith("${") and pkg_mapping[0].endswith("}"):
+                continue
             for subs in variables:
                 self.d.renameVar("%s_%s" % (subs, pkg_mapping[0]), "%s_%s" % (subs, pkg_mapping[1]))
 
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index aa8e0592169..ff25fd41875 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -24,7 +24,7 @@ libc_baselibs_append = " ${@oe.utils.conditional('ARCH_DYNAMIC_LOADER', '', '',
 INSANE_SKIP_${PN}_append_aarch64 = " libdir"
 
 FILES_${PN} = "${libc_baselibs} ${libexecdir}/*"
-RRECOMMENDS_${PN} = "${@bb.utils.filter('DISTRO_FEATURES', 'ldconfig', d)}"
+RRECOMMENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)}"
 FILES_ldconfig = "${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
 FILES_ldd = "${bindir}/ldd"
 FILES_libsegfault = "${base_libdir}/libSegFault*"
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 1f802da09b7..90b79adfdcd 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -110,16 +110,16 @@ python __anonymous () {
     machine_features= set(d.getVar("MACHINE_FEATURES").split())
 
     if "bluetooth" in distro_features and not "bluetooth" in machine_features and ("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in machine_features):
-        d.setVar("ADD_BT", "packagegroup-base-bluetooth")
+        d.setVar("ADD_BT", "${MLPREFIX}packagegroup-base-bluetooth")
 
     if "wifi" in distro_features and not "wifi" in machine_features and ("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in machine_features):
-        d.setVar("ADD_WIFI", "packagegroup-base-wifi")
+        d.setVar("ADD_WIFI", "${MLPREFIX}packagegroup-base-wifi")
 
     if "3g" in distro_features and not "3g" in machine_features and ("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in machine_features):
-        d.setVar("ADD_3G", "packagegroup-base-3g")
+        d.setVar("ADD_3G", "${MLPREFIX}packagegroup-base-3g")
 
     if "nfc" in distro_features and not "nfc" in machine_features and ("usbhost" in machine_features):
-        d.setVar("ADD_NFC", "packagegroup-base-nfc")
+        d.setVar("ADD_NFC", "${MLPREFIX}packagegroup-base-nfc")
 }
 
 #
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 22c71f099b8..44f0007daf0 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -22,6 +22,7 @@ SPLASH_IMAGES = "file://psplash-poky-img.h;outsuffix=default"
 python __anonymous() {
     oldpkgs = d.getVar("PACKAGES").split()
     splashfiles = d.getVar('SPLASH_IMAGES').split()
+    mlprefix = d.getVar('MLPREFIX') or ''
     pkgs = []
     localpaths = []
     for uri in splashfiles:
@@ -46,9 +47,9 @@ python __anonymous() {
     # Set these so that we have less work to do in do_compile and do_install_append
     d.setVar("SPLASH_INSTALL", " ".join(pkgs))
     d.setVar("SPLASH_LOCALPATHS", " ".join(localpaths))
+    for p in pkgs:
+        d.prependVar("PACKAGES", "%s%s " % (mlprefix, p))
 
-    d.prependVar("PACKAGES", "%s " % (" ".join(pkgs)))
-    mlprefix = d.getVar('MLPREFIX') or ''
     pn = d.getVar('PN') or ''
     for p in pkgs:
         ep = '%s%s' % (mlprefix, p)
diff --git a/meta/recipes-devtools/perl/perl_5.30.2.bb b/meta/recipes-devtools/perl/perl_5.30.2.bb
index 778c420b2ee..26138ea9e55 100644
--- a/meta/recipes-devtools/perl/perl_5.30.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.2.bb
@@ -328,7 +328,7 @@ python split_perl_packages () {
 
 python() {
     if d.getVar('CLASSOVERRIDE') == "class-target":
-        d.setVar("PACKAGES_DYNAMIC", "^perl-module-.*(?<!native)$")
+        d.setVar("PACKAGES_DYNAMIC", "^${MLPREFIX}perl-module-.*(?<!native)$")
     elif d.getVar('CLASSOVERRIDE') == "class-native":
         d.setVar("PACKAGES_DYNAMIC", "^perl-module-.*-native$")
     elif d.getVar('CLASSOVERRIDE') == "class-nativesdk":
diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index a4a16fd495f..0474f07214f 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -311,8 +311,8 @@ do_create_manifest[depends] += "${PN}:do_patch"
 
 # manual dependency additions
 RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
-RRECOMMENDS_${PN}-crypt_append_class-target = " openssl ca-certificates"
-RRECOMMENDS_${PN}-crypt_append_class-nativesdk = " openssl ca-certificates"
+RRECOMMENDS_${PN}-crypt_append_class-target = " ${MLPREFIX}openssl ${MLPREFIX}ca-certificates"
+RRECOMMENDS_${PN}-crypt_append_class-nativesdk = " ${MLPREFIX}openssl ${MLPREFIX}ca-certificates"
 
 # For historical reasons PN is empty and provided by python3-modules
 FILES_${PN} = ""
@@ -322,7 +322,7 @@ FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
 FILES_${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
 
 # provide python-pyvenv from python3-venv
-RPROVIDES_${PN}-venv += "python3-pyvenv"
+RPROVIDES_${PN}-venv += "${MLPREFIX}python3-pyvenv"
 
 # package libpython3
 PACKAGES =+ "libpython3 libpython3-staticdev"
@@ -333,8 +333,8 @@ INSANE_SKIP_${PN}-dev += "dev-elf"
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
 RDEPENDS_${PN}-misc += "python3-core python3-email python3-codecs python3-pydoc python3-pickle python3-audio"
-RDEPENDS_${PN}-modules_append_class-target = " python3-misc"
-RDEPENDS_${PN}-modules_append_class-nativesdk = " python3-misc"
+RDEPENDS_${PN}-modules_append_class-target = " ${MLPREFIX}python3-misc"
+RDEPENDS_${PN}-modules_append_class-nativesdk = " ${MLPREFIX}python3-misc"
 FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
 
 # catch manpage
@@ -348,5 +348,5 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
 RDEPENDS_${PN}-dev = ""
 
-RDEPENDS_${PN}-tests_append_class-target = " bash"
-RDEPENDS_${PN}-tests_append_class-nativesdk = " bash"
+RDEPENDS_${PN}-tests_append_class-target = " ${MLPREFIX}bash"
+RDEPENDS_${PN}-tests_append_class-nativesdk = " ${MLPREFIX}bash"
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index 15a8e6dedc3..16c2f9f2aa9 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -32,21 +32,23 @@ python __anonymous () {
     namemap["packagegroup-core-full-cmdline-sys-services"] = "packagegroup-core-sys-services"
 
     packages = d.getVar("PACKAGES").split()
+    mlprefix = d.getVar("MLPREFIX")
     for pkg in packages:
+        pkg2 = pkg[len(mlprefix):]
         if pkg.endswith('-dev'):
-            mapped = namemap.get(pkg[:-4], None)
+            mapped = namemap.get(pkg2[:-4], None)
             if mapped:
                 mapped += '-dev'
         elif pkg.endswith('-dbg'):
-            mapped = namemap.get(pkg[:-4], None)
+            mapped = namemap.get(pkg2[:-4], None)
             if mapped:
                 mapped += '-dbg'
         else:
-            mapped = namemap.get(pkg, None)
+            mapped = namemap.get(pkg2, None)
 
         if mapped:
             oldtaskname = mapped.replace("packagegroup-core", "task-core")
-            mapstr = " %s %s" % (mapped, oldtaskname)
+            mapstr = " %s%s %s%s" % (mlprefix, mapped, mlprefix, oldtaskname)
             d.appendVar("RPROVIDES_%s" % pkg, mapstr)
             d.appendVar("RREPLACES_%s" % pkg, mapstr)
             d.appendVar("RCONFLICTS_%s" % pkg, mapstr)
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index fede691d6ff..bb43a9a8b65 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -212,18 +212,20 @@ python __anonymous() {
               ("gles", "libgles3",)):
         if not p[0] in pkgconfig:
             continue
-        fullp = p[1] + "-mesa"
-        pkgs = " ".join(p[1:])
+        mlprefix = d.getVar("MLPREFIX")
+        fullp = mlprefix + p[1] + "-mesa"
+        mlprefix = d.getVar("MLPREFIX")
+        pkgs = " ".join(mlprefix + x for x in p[1:])
         d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
         d.appendVar("RREPLACES_" + fullp, pkgs)
         d.appendVar("RPROVIDES_" + fullp, pkgs)
         d.appendVar("RCONFLICTS_" + fullp, pkgs)
 
-        d.appendVar("RRECOMMENDS_" + fullp, " mesa-megadriver")
+        d.appendVar("RRECOMMENDS_" + fullp, " ${MLPREFIX}mesa-megadriver")
 
         # For -dev, the first element is both the Debian and original name
         fullp += "-dev"
-        pkgs = p[1] + "-dev"
+        pkgs = mlprefix + p[1] + "-dev"
         d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
         d.appendVar("RREPLACES_" + fullp, pkgs)
         d.appendVar("RPROVIDES_" + fullp, pkgs)
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
index 9882e12763a..d092b158f26 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
@@ -167,7 +167,7 @@ FILES_${PN}-pulseaudio-conf += "\
 "
 
 RDEPENDS_${PN}-pulseaudio-conf += "\
-        libasound-module-conf-pulse \
-        libasound-module-ctl-pulse \
-        libasound-module-pcm-pulse \
+        ${MLPREFIX}libasound-module-conf-pulse \
+        ${MLPREFIX}libasound-module-ctl-pulse \
+        ${MLPREFIX}libasound-module-pcm-pulse \
 "
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 8eb9494381f..ca140d595fd 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -62,12 +62,16 @@ PACKAGES = "${PN}-dbg ${BOOST_PACKAGES}"
 python __anonymous () {
     packages = []
     extras = []
+    mlprefix = d.getVar("MLPREFIX")
     for lib in d.getVar('BOOST_LIBS').split():
         extras.append("--with-%s" % lib)
-        pkg = "boost-%s" % lib.replace("_", "-")
-        packages.append(pkg)
+        pkg = "boost-%s" % (lib.replace("_", "-"))
+        packages.append(mlprefix + pkg)
         if not d.getVar("FILES_%s" % pkg):
-                d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.so.*" % lib)
+                d.setVar("FILES_%s%s" % (mlprefix, pkg), "${libdir}/libboost_%s*.so.*" % lib)
+        else:
+                d.setVar("FILES_%s%s" % (mlprefix, pkg), d.getVar("FILES_%s" % pkg))
+
     d.setVar("BOOST_PACKAGES", " ".join(packages))
     d.setVar("BJAM_EXTRA", " ".join(extras))
 }
-- 
2.25.1

