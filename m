Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web09.7694.1611915864655700593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 02:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HTtqh1fy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f42.google.com with SMTP id j13so9981334edp.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 02:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VjU97vuZXwfsmo5UMj8MeXIDB1lnYU/UQPA2zCQQ9go=;
        b=HTtqh1fyZPYKs0+OGlMleIWIcQBwQ62P8wU3zxvItPebVxxdMur0yc7qRNDCQUH0EK
         lzctYgpipwQ7+IDVCqq3m+vHXuAZJgW3mbmRZyjQ8iUqid02Q6tXxEs43TMLp66igkmi
         2N5pvYyPLJBr2uYncjIPtCqCyUyH6uqYsd5tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VjU97vuZXwfsmo5UMj8MeXIDB1lnYU/UQPA2zCQQ9go=;
        b=M1vT0ngJ76pOhWzLQ2URcZRJ4QL5FsVE9Tsy7EwSlOI6dCnpbfn3zR9VdSKw00C1XW
         wipwRjN26Ut9ETVWp47fX8NbZX7U1idmMVvPFHYfSSAlPfM87jOgfiqNQMhZnsGRYr1F
         iVZlRef8xKL+nLJaCoC6QJs9sYRAy98ngFHgg1mZinffsDe8e9z485H82WOf7G6MBHMt
         3K+7FuOTyqHi3nxDpPKTYi1TU9jXh71Br1QYnM7EgtDl8Sg9451CIxjmWiK0+EnmTzmj
         kD/YCY2yLgY6vYTgnEu3vs4+0ZadGVXbAM6HUDsimyMfiyq9W5lIpORykGKSdEMBAAn8
         TATw==
X-Gm-Message-State: AOAM530ZrHO2Ep3oLiarEf4KY96eMVFgzNiCqt2zhT6alIsWhJ09OsxH
	tJy1JaACzYTAudZO7sDmZco7+faj+P7mXA==
X-Google-Smtp-Source: ABdhPJxPpwZ9LmJEOW/53T/qUl/vj4/n6QHit27yksCf4PoVxyxF9R/m4hlthweapAmm5fOosMfd4Q==
X-Received: by 2002:aa7:cf94:: with SMTP id z20mr4257131edx.75.1611915862969;
        Fri, 29 Jan 2021 02:24:22 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id k22sm3554574eji.101.2021.01.29.02.24.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 02:24:22 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/13] native: Stop clearing PACKAGES
Date: Fri, 29 Jan 2021 10:24:11 +0000
Message-Id: <20210129102419.1360572-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
References: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Native recipes have been special and they don't have packages generated
from them. The RDEPENDS/RPROVIDES and other runtime package specific
variables can contain important data about dependencies recipes need
though and currently it is required to write this information explicitly
in the native case.

We now delete the packaging tasks for native recipes which removes the
need to clear PACKAGES. The next step to improve the metadata is to
stop clearing it and ensure any entries in these variables are remapped
appropriately. The R* variables were already being processed by the class
extension code but the implementation was suboptimal.

This patch stops clearing PACKAGES and PACKAGES_DYNAMIC and fixes the places
where that caused issues in OE-Core, for example PACKAGES additions in anonymous
python without the "-native" suffix and a case where the included classes
caused a self reference in DEPENDS which would once have been removed by
the previous code.

The implementation uses datastore/parser parameters to ensure that the
variable overrides are not overwritten when calling setVar which is appropriate
for a function as close to the core as this one is.

Some now unneeded code in python3-setuptools is dropped, there are further
changes like this which can follow.

This change was verified with OE-Core by comparing task-depends.dot generated
by "bitbake world -g" before and after the change, the files were identical.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/native.bbclass                   | 23 ++++++++-----------
 .../python/python3-setuptools_51.0.0.bb       |  5 ----
 .../gdk-pixbuf/gdk-pixbuf_2.40.0.bb           |  1 +
 meta/recipes-graphics/mesa/mesa.inc           | 14 +++++++----
 meta/recipes-support/boost/boost.inc          |  3 +++
 5 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 08106e345ca..a0838e41b97 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -5,20 +5,12 @@ inherit relocatable
 # no need for them to be a direct target of 'world'
 EXCLUDE_FROM_WORLD = "1"
 
-PACKAGES = ""
-PACKAGES_class-native = ""
-PACKAGES_DYNAMIC = ""
-PACKAGES_DYNAMIC_class-native = ""
 PACKAGE_ARCH = "${BUILD_ARCH}"
 
 # used by cmake class
 OECMAKE_RPATH = "${libdir}"
 OECMAKE_RPATH_class-native = "${libdir}"
 
-# When this class has packaging enabled, setting 
-# RPROVIDES becomes unnecessary.
-RPROVIDES = "${PN}"
-
 TARGET_ARCH = "${BUILD_ARCH}"
 TARGET_OS = "${BUILD_OS}"
 TARGET_VENDOR = "${BUILD_VENDOR}"
@@ -138,7 +130,7 @@ python native_virtclass_handler () {
     if "native" not in classextend:
         return
 
-    def map_dependencies(varname, d, suffix = ""):
+    def map_dependencies(varname, d, suffix = "", selfref=True):
         if suffix:
             varname = varname + "_" + suffix
         deps = d.getVar(varname)
@@ -148,22 +140,25 @@ python native_virtclass_handler () {
         newdeps = []
         for dep in deps:
             if dep == pn:
-                continue
+                if not selfref:
+                    continue
+                newdeps.append(dep)
             elif "-cross-" in dep:
                 newdeps.append(dep.replace("-cross", "-native"))
             elif not dep.endswith("-native"):
-                newdeps.append(dep + "-native")
+                newdeps.append(dep.replace("-native", "") + "-native")
             else:
                 newdeps.append(dep)
-        d.setVar(varname, " ".join(newdeps))
+        d.setVar(varname, " ".join(newdeps), parsing=True)
 
-    map_dependencies("DEPENDS", e.data)
-    for pkg in [e.data.getVar("PN"), "", "${PN}"]:
+    map_dependencies("DEPENDS", e.data, selfref=False)
+    for pkg in e.data.getVar("PACKAGES", False).split():
         map_dependencies("RDEPENDS", e.data, pkg)
         map_dependencies("RRECOMMENDS", e.data, pkg)
         map_dependencies("RSUGGESTS", e.data, pkg)
         map_dependencies("RPROVIDES", e.data, pkg)
         map_dependencies("RREPLACES", e.data, pkg)
+    map_dependencies("PACKAGES", e.data)
 
     provides = e.data.getVar("PROVIDES")
     nprovides = []
diff --git a/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
index 6ee935f8f79..db336bfa13b 100644
--- a/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
@@ -58,8 +58,3 @@ RDEPENDS_${PYTHON_PN}-pkg-resources = "\
   ${PYTHON_PN}-plistlib \
   ${PYTHON_PN}-pprint \
 "
-# Due to the way OE-Core implemented native recipes, the native class cannot
-# have a dependency on something that is not a recipe name. Work around that by
-# manually setting RPROVIDES.
-RDEPENDS_${PN}_append = " ${PYTHON_PN}-pkg-resources"
-RPROVIDES_append_class-native = " ${PYTHON_PN}-pkg-resources-native"
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
index 16708fd581d..226e1c7b89f 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 SECTION = "libs"
 
 DEPENDS = "glib-2.0 gdk-pixbuf-native shared-mime-info"
+DEPENDS_remove_class-native = "gdk-pixbuf-native"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index efb12e573f8..cb075a8b89e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -218,6 +218,9 @@ do_install_append () {
 # RPROVIDEs/RCONFLICTs on the generic libgl name.
 python __anonymous() {
     pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
+    suffix = ""
+    if "-native" in d.getVar("PN"):
+        suffix = "-native"
     for p in (("egl", "libegl", "libegl1"),
               ("dri", "libgl", "libgl1"),
               ("gles", "libgles1", "libglesv1-cm1"),
@@ -226,19 +229,19 @@ python __anonymous() {
         if not p[0] in pkgconfig:
             continue
         mlprefix = d.getVar("MLPREFIX")
-        fullp = mlprefix + p[1] + "-mesa"
+        fullp = mlprefix + p[1] + "-mesa" + suffix
         mlprefix = d.getVar("MLPREFIX")
-        pkgs = " ".join(mlprefix + x for x in p[1:])
+        pkgs = " ".join(mlprefix + x + suffix for x in p[1:])
         d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
         d.appendVar("RREPLACES_" + fullp, pkgs)
         d.appendVar("RPROVIDES_" + fullp, pkgs)
         d.appendVar("RCONFLICTS_" + fullp, pkgs)
 
-        d.appendVar("RRECOMMENDS_" + fullp, " ${MLPREFIX}mesa-megadriver")
+        d.appendVar("RRECOMMENDS_" + fullp, " ${MLPREFIX}mesa-megadriver" + suffix)
 
         # For -dev, the first element is both the Debian and original name
-        fullp += "-dev"
-        pkgs = mlprefix + p[1] + "-dev"
+        fullp = mlprefix + p[1] + "-mesa-dev" + suffix
+        pkgs = mlprefix + p[1] + "-dev" + suffix
         d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
         d.appendVar("RREPLACES_" + fullp, pkgs)
         d.appendVar("RPROVIDES_" + fullp, pkgs)
@@ -272,6 +275,7 @@ python mesa_populate_packages() {
 PACKAGESPLITFUNCS_prepend = "mesa_populate_packages "
 
 PACKAGES_DYNAMIC += "^mesa-driver-.*"
+PACKAGES_DYNAMIC_class-native = "^mesa-driver-.*-native"
 
 FILES_mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d/00-mesa-defaults.conf"
 FILES_mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${datadir}/vulkan"
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index cbf9cad7071..c9bb1785419 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -59,10 +59,13 @@ PACKAGES = "${PN}-dbg ${BOOST_PACKAGES}"
 python __anonymous () {
     packages = []
     extras = []
+    pn = d.getVar("PN")
     mlprefix = d.getVar("MLPREFIX")
     for lib in d.getVar('BOOST_LIBS').split():
         extras.append("--with-%s" % lib)
         pkg = "boost-%s" % (lib.replace("_", "-"))
+        if "-native" in pn:
+            pkg = pkg + "-native"
         packages.append(mlprefix + pkg)
         if not d.getVar("FILES_%s" % pkg):
                 d.setVar("FILES_%s%s" % (mlprefix, pkg), "${libdir}/libboost_%s*.so.*" % lib)
-- 
2.27.0

