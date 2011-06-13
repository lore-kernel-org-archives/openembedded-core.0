Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QW97G-000335-IR
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:31:50 +0200
Received: by rex (Postfix, from userid 1000)
	id 1E4E421A26; Mon, 13 Jun 2011 16:28:07 +0100 (BST)
From: y@tim.rpsys.net
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 16:27:57 +0100
Message-Id: <c3d317014f417ca895458b797afdf6c40e5b5a57.1307978499.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <9a616b0cbde68f758d29c53f0468c78a58dda0cd.1307978499.git.richard.purdie@linuxfoundation.org>
References: <9a616b0cbde68f758d29c53f0468c78a58dda0cd.1307978499.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1307978499.git.richard.purdie@linuxfoundation.org>
References: <cover.1307978499.git.richard.purdie@linuxfoundation.org>
X-Mailman-Approved-At: Mon, 13 Jun 2011 17:46:11 +0200
Subject: [PATCH 11/11] nativesdk.bbclass: Correct ordering of manipulations
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
X-List-Received-Date: Mon, 13 Jun 2011 15:31:51 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

OVERDIDES is the key variable that needs to be set prior to data finalisation.
The other variables should be manipulated after finalisation so any
DEPENDS_prepend and _append are accounted for. This patch ensures this is
the case.

The PACKAGES maniupulations are not enabled at this time as they
don't function 100% correctly yet.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/nativesdk.bbclass |   53 ++++++++++++++++++++++++++++------------
 1 files changed, 37 insertions(+), 16 deletions(-)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 644e731..3fe4bf9 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -62,27 +62,48 @@ python nativesdk_virtclass_handler () {
     if not pn.endswith("-nativesdk"):
         return
 
-    depends = bb.data.getVar("DEPENDS", e.data, True)
-    deps = bb.utils.explode_deps(depends)
-    newdeps = []
-    for dep in deps:
-        if dep.endswith("-native") or dep.endswith("-cross"):
-            newdeps.append(dep)
-        elif dep.endswith("-gcc-intermediate") or dep.endswith("-gcc-initial") or dep.endswith("-gcc") or dep.endswith("-g++"):
-            newdeps.append(dep + "-crosssdk")
-        elif not dep.endswith("-nativesdk"):
-            newdeps.append(dep + "-nativesdk")
-        else:
-            newdeps.append(dep)
-    bb.data.setVar("DEPENDS", " ".join(newdeps), e.data)
-    provides = bb.data.getVar("PROVIDES", e.data, True)
+    bb.data.setVar("OVERRIDES", bb.data.getVar("OVERRIDES", e.data, False) + ":virtclass-nativesdk", e.data)
+}
+
+python () {
+    pn = bb.data.getVar("PN", d, True)
+    if not pn.endswith("-nativesdk"):
+        return
+
+    def map_dependencies(varname, d, suffix = ""):
+        if suffix:
+            varname = varname + "_" + suffix
+        deps = bb.data.getVar(varname, d, True)
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
+        bb.data.setVar(varname, " ".join(newdeps), d)
+
+    map_dependencies("DEPENDS", d)
+    #for pkg in (d.getVar("PACKAGES", True).split() + [""]):
+    #    map_dependencies("RDEPENDS", d, pkg)
+    #    map_dependencies("RRECOMMENDS", d, pkg)
+    #    map_dependencies("RSUGGESTS", d, pkg)
+    #    map_dependencies("RPROVIDES", d, pkg)
+    #    map_dependencies("RREPLACES", d, pkg)
+
+    provides = bb.data.getVar("PROVIDES", d, True)
     for prov in provides.split():
         if prov.find(pn) != -1:
             continue
         if not prov.endswith("-nativesdk"):
             provides = provides.replace(prov, prov + "-nativesdk")
-    bb.data.setVar("PROVIDES", provides, e.data)
-    bb.data.setVar("OVERRIDES", bb.data.getVar("OVERRIDES", e.data, False) + ":virtclass-nativesdk", e.data)
+    bb.data.setVar("PROVIDES", provides, d)
 }
 
 addhandler nativesdk_virtclass_handler
-- 
1.7.4.1



