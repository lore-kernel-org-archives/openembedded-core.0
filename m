Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.11051.1611768478752797484
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 09:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OX72Am/R;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f52.google.com with SMTP id c2so3379099edr.11
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 09:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UVWHm+I/+EtPlCFJ29/2EklL8nDe64eDMiBwkldNRhs=;
        b=OX72Am/Ro2UArNIZGkDIq74G5wMcEGTvfarGaNWh8VrRpqWBqMOq1FRytL0C+DTa4Y
         8UVSRlFQ6cJEpYZMLX6p2K/bQ+SmwmbYKL1X06teYCF9VjfKmZhU3Q7nOQhFlLh0ExBY
         Y28WT7vugGNXvJcVKT/gnl+ctQB5/Vn1jlXh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UVWHm+I/+EtPlCFJ29/2EklL8nDe64eDMiBwkldNRhs=;
        b=mBBkiMWMu7ExojRsC9hVdDvcq2PQJGOxUM/FUyfGyXtij9r5ZaTqzGb3D2m3CHsrP0
         vkz+SENZDWzOe89p1dRX4Di055QWBTnJeECMsrgesPX9WeWQtOlVcqHlZwnJqnOMn5tV
         EmbrZNS4AZKzBnXNthL2L+mRs7WO8eyTr5wre7D1lt+OpOFXbug0LlhfoEApSMQDkkD7
         wi1y0thv0gsq0AIZhNOd0r6341eLObFJ1UiaHH2kWKqMogBlA82p4F8JzOnrv+As5Mtt
         aZQttSgnEyk/OhiqQlGzAOzfKTaHU7HjlBeKRMPVqN0usWLvt3z5zUHGUY9/aBzX5h8L
         96Og==
X-Gm-Message-State: AOAM533ylDcfP6lZuk2dNMIZWRYK743B5buQC7pCWy5c/AueGGOAWlU2
	+lpIc23Epzxi50n8VFKXBu+9+BC6rbI9/g==
X-Google-Smtp-Source: ABdhPJw8h3gYinuplONobf3lvnC16k1KG8xsN6NiDeTWZfit8yhIfR1wFCMIa/uL57FxyFpms0tIVQ==
X-Received: by 2002:a50:fc18:: with SMTP id i24mr10439905edr.308.1611768477130;
        Wed, 27 Jan 2021 09:27:57 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc])
        by smtp.gmail.com with ESMTPSA id k27sm1115581eje.67.2021.01.27.09.27.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 09:27:56 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] native: Stop clearing PACKAGES
Date: Wed, 27 Jan 2021 17:27:52 +0000
Message-Id: <20210127172753.1286275-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
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
 meta/recipes-support/boost/boost.inc          |  3 +++
 4 files changed, 13 insertions(+), 19 deletions(-)

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

