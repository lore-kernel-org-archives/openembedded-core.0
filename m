Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SATLh-0002jI-NQ
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:45:41 +0100
Received: by wgbdr12 with SMTP id dr12so823501wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=m1D1Wxc99Ew4SFv5rlTIgWmX4S/ZNDUMY2OnQ21P09s=;
	b=EeTapFHkAdOexYN0tJzTj1QRszrUdiDIv23z4Y2gNtyoNF4wvd6wvFUeYDCfAqHt18
	CrqbGqePAorNbtI02dsHarmurhPdKZwe0rRBcgKrapNAUajLZcTN08oSk4prD1KC4BSL
	6sKeI92oA6iUa2JXqcYvI/QyGEbWxM929kS1aOOvChSTV+kAdTNKD3mUIW6m/GW2j3SX
	LW0JT4JyKohZkz8P64M06E4yCrxxQNaeghNl1miNIwCnL5R6/4JI5wyuljGV6SDFoyIY
	R/uuVkdhY9hRA421xACLfJ5/luT+qEgfno/Ba5gh45HTmLacHBl1rKIMMg5Kdr7Nzj1H
	6Qeg==
Received: by 10.180.107.162 with SMTP id hd2mr41421885wib.8.1332365807516;
	Wed, 21 Mar 2012 14:36:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff9sm7695167wib.2.2012.03.21.14.36.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:36:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:36:09 +0100
Message-Id: <47e81fcc80e7ca5aa4d2f9209d5db65fc4fc0ed5.1332365336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
References: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332365336.git.Martin.Jansa@gmail.com>
References: <cover.1332365336.git.Martin.Jansa@gmail.com>
Subject: [PATCH 04/13] base.bbclass: extract *virtclass_map_dependencies logic from native/nativesdk bbclasses and call it from packageconfig
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2012 21:45:41 -0000

* if some package is using PACKAGECONFIG and also BBCLASSEXTEND then it could be called twice
  but without this PACKAGECONFIG was adding items to DEPENDS after virtclass handler
  so foo-native was depending on bar instead of bar-foo when bar was added by PACKAGECONFIG
  see: http://lists.linuxtogo.org/pipermail/openembedded-core/2012-February/017772.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/base.bbclass      |   77 ++++++++++++++++++++++++++++++++++++---
 meta/classes/native.bbclass    |   25 +------------
 meta/classes/nativesdk.bbclass |   27 +-------------
 3 files changed, 73 insertions(+), 56 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index c8ed544..14efa16 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -223,6 +223,59 @@ def get_layers_branch_rev(d):
 			s1= layers_branch_rev[i][p1:]
 	return layers_branch_rev
 
+def native_virtclass_map_dependencies(d):
+    def map_dependencies(varname, d, suffix = ""):
+        if suffix:
+            varname = varname + "_" + suffix
+        deps = d.getVar(varname, True)
+        if not deps:
+            return
+        deps = bb.utils.explode_deps(deps)
+        newdeps = []
+        for dep in deps:
+            if dep.endswith("-cross"):
+                newdeps.append(dep.replace("-cross", "-native"))
+            elif not dep.endswith("-native"):
+                newdeps.append(dep + "-native")
+            else:
+                newdeps.append(dep)
+        d.setVar(varname, " ".join(newdeps))
+
+    map_dependencies("DEPENDS", d)
+    for pkg in [d.getVar("PN", True), "", "${PN}"]:
+        map_dependencies("RDEPENDS", d, pkg)
+        map_dependencies("RRECOMMENDS", d, pkg)
+        map_dependencies("RSUGGESTS", d, pkg)
+        map_dependencies("RPROVIDES", d, pkg)
+        map_dependencies("RREPLACES", d, pkg)
+
+def nativesdk_virtclass_map_dependencies(d):
+    def map_dependencies(varname, d, suffix = ""):
+        if suffix:
+            varname = varname + "_" + suffix
+        deps = d.getVar(varname, True)
+        if not deps:
+            return
+        deps = bb.utils.explode_deps(deps)
+        newdeps = []
+        for dep in deps:
+            if dep.endswith("-native") or dep.endswith("-cross"):
+                newdeps.append(dep)
+            elif dep.endswith("-gcc-intermediate") or dep.endswith("-gcc-initial") or dep.endswith("-gcc") or dep.endswith("-g++"):
+                newdeps.append(dep + "-crosssdk")
+            elif not dep.endswith("-nativesdk"):
+                newdeps.append(dep.replace("-nativesdk", "") + "-nativesdk")
+            else:
+                newdeps.append(dep)
+        d.setVar(varname, " ".join(newdeps))
+
+    map_dependencies("DEPENDS", d)
+    #for pkg in (d.getVar("PACKAGES", True).split() + [""]):
+    #    map_dependencies("RDEPENDS", d, pkg)
+    #    map_dependencies("RRECOMMENDS", d, pkg)
+    #    map_dependencies("RSUGGESTS", d, pkg)
+    #    map_dependencies("RPROVIDES", d, pkg)
+    #    map_dependencies("RREPLACES", d, pkg)
 
 addhandler base_eventhandler
 python base_eventhandler() {
@@ -293,8 +346,10 @@ do_build () {
 	:
 }
 
-python () {
-    import exceptions, string, re
+addhandler packageconfig_handler
+python packageconfig_handler () {
+    if not isinstance(e, bb.event.RecipePreFinalise):
+            return
 
     # Handle PACKAGECONFIG
     #
@@ -302,14 +357,14 @@ python () {
     #
     # PACKAGECONFIG ?? = "<default options>"
     # PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends"
-    pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
+    pkgconfigflags = e.data.getVarFlags("PACKAGECONFIG") or {}
     if pkgconfigflags:
-        pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
+        pkgconfig = (e.data.getVar('PACKAGECONFIG', True) or "").split()
         def appendVar(varname, appends):
             if not appends:
                 return
-            varname = d.expand(varname)
-            d.appendVar(varname, " " + " ".join(appends))
+            varname = e.data.expand(varname)
+            e.data.appendVar(varname, " " + " ".join(appends))
 
         extradeps = []
         extrardeps = []
@@ -332,6 +387,16 @@ python () {
         appendVar('DEPENDS', extradeps)
         appendVar('RDEPENDS_${PN}', extrardeps)
         appendVar('EXTRA_OECONF', extraconf)
+        classextend = e.data.getVar('BBCLASSEXTEND', True) or ""
+        pn = e.data.getVar("PN", True)
+        if "native" in classextend and pn.endswith("-native"):
+            native_virtclass_map_dependencies(e.data)
+        if "nativesdk" in classextend and pn.endswith("-nativesdk"):
+            nativesdk_virtclass_map_dependencies(e.data)
+}
+
+python () {
+    import exceptions, string, re
 
     # If PRINC is set, try and increase the PR value by the amount specified
     princ = d.getVar('PRINC', True)
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index ffab971..7ef3684 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -112,30 +112,7 @@ python native_virtclass_handler () {
     if not pn.endswith("-native"):
         return
 
-    def map_dependencies(varname, d, suffix = ""):
-        if suffix:
-            varname = varname + "_" + suffix
-        deps = d.getVar(varname, True)
-        if not deps:
-            return
-        deps = bb.utils.explode_deps(deps)
-        newdeps = []
-        for dep in deps:
-            if dep.endswith("-cross"):
-                newdeps.append(dep.replace("-cross", "-native"))
-            elif not dep.endswith("-native"):
-                newdeps.append(dep + "-native")
-            else:
-                newdeps.append(dep)
-        d.setVar(varname, " ".join(newdeps))
-
-    map_dependencies("DEPENDS", e.data)
-    for pkg in [e.data.getVar("PN", True), "", "${PN}"]:
-        map_dependencies("RDEPENDS", e.data, pkg)
-        map_dependencies("RRECOMMENDS", e.data, pkg)
-        map_dependencies("RSUGGESTS", e.data, pkg)
-        map_dependencies("RPROVIDES", e.data, pkg)
-        map_dependencies("RREPLACES", e.data, pkg)
+    native_virtclass_map_dependencies(e.data)
 
     provides = e.data.getVar("PROVIDES", True)
     for prov in provides.split():
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index ceec53e..af8f9ef 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -72,32 +72,7 @@ python () {
     if not pn.endswith("-nativesdk"):
         return
 
-    def map_dependencies(varname, d, suffix = ""):
-        if suffix:
-            varname = varname + "_" + suffix
-        deps = d.getVar(varname, True)
-        if not deps:
-            return
-        deps = bb.utils.explode_deps(deps)
-        newdeps = []
-        for dep in deps:
-            if dep.endswith("-native") or dep.endswith("-cross"):
-                newdeps.append(dep)
-            elif dep.endswith("-gcc-intermediate") or dep.endswith("-gcc-initial") or dep.endswith("-gcc") or dep.endswith("-g++"):
-                newdeps.append(dep + "-crosssdk")
-            elif not dep.endswith("-nativesdk"):
-                newdeps.append(dep.replace("-nativesdk", "") + "-nativesdk")
-            else:
-                newdeps.append(dep)
-        d.setVar(varname, " ".join(newdeps))
-
-    map_dependencies("DEPENDS", d)
-    #for pkg in (d.getVar("PACKAGES", True).split() + [""]):
-    #    map_dependencies("RDEPENDS", d, pkg)
-    #    map_dependencies("RRECOMMENDS", d, pkg)
-    #    map_dependencies("RSUGGESTS", d, pkg)
-    #    map_dependencies("RPROVIDES", d, pkg)
-    #    map_dependencies("RREPLACES", d, pkg)
+    nativesdk_virtclass_map_dependencies(d)
 
     provides = d.getVar("PROVIDES", True)
     for prov in provides.split():
-- 
1.7.8.5



