Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T6O5k-0001Uq-DQ for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 17:52:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7SEu3pZ008465
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 15:56:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08249-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 15:55:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7SEtrjg008459
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 15:55:55 +0100
Message-ID: <1346168412.23096.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Aug 2012 08:40:12 -0700
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] nativesdk: Convert to use classextend.py
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
X-List-Received-Date: Tue, 28 Aug 2012 15:52:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This patch converts the nativesdk class itself from operating as a suffix 
to a prefix (see the proceeding patch for the related changes outside this
class).

The big benefit here is that we can reuse the generic class extension code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 7deaafc..8c0cd5b 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -59,51 +59,28 @@ python nativesdk_virtclass_handler () {
         return
 
     pn = e.data.getVar("PN", True)
-    if not pn.endswith("-nativesdk"):
+    if not pn.endswith("-nativesdk") or pn.startswith("nativesdk-"):
         return
 
+    e.data.setVar("MLPREFIX", "nativesdk-")
+    e.data.setVar("PN", "nativesdk-" + e.data.getVar("PN", True).replace("-nativesdk", "").replace("nativesdk-", ""))
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-nativesdk")
 }
 
 python () {
     pn = d.getVar("PN", True)
-    if not pn.endswith("-nativesdk"):
+    if not pn.startswith("nativesdk-"):
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
-
-    provides = d.getVar("PROVIDES", True)
-    for prov in provides.split():
-        if prov.find(pn) != -1:
-            continue
-        if not prov.endswith("-nativesdk"):
-            provides = provides.replace(prov, prov + "-nativesdk")
-    d.setVar("PROVIDES", provides)
+    import oe.classextend
+
+    clsextend = oe.classextend.NativesdkClassExtender("nativesdk", d)
+    clsextend.rename_packages()
+    clsextend.rename_package_variables((d.getVar("PACKAGEVARS", True) or "").split())
+
+    clsextend.map_depends_variable("DEPENDS")
+    clsextend.map_packagevars()
+    clsextend.map_variable("PROVIDES")
 }
 
 addhandler nativesdk_virtclass_handler
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index fb0d967..86b1e8a 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -7,6 +7,10 @@ class ClassExtender(object):
     def extend_name(self, name):
         if name.startswith("kernel-module"):
             return name
+        if name.startswith("rtld"):
+            return name
+        if name.endswith("-" + self.extname):
+            name = name.replace("-" + self.extname, "")
         if name.startswith("virtual/"):
             subs = name.split("/", 1)[1]
             if not subs.startswith(self.extname):




