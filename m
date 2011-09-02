Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QzTS9-0002F6-28 for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 15:06:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p82D1ffh025873
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Sep 2011 14:01:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25302-02 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2011 14:01:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p82D1W1h025867
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Sep 2011 14:01:32 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 02 Sep 2011 14:01:13 +0100
Message-ID: <1314968473.5939.577.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: multilib: Only build one kernel
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
X-List-Received-Date: Fri, 02 Sep 2011 13:06:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

For a given system we only want one kernel to be built. This change makes
the main kernel recipe provide all of the provides of the various enabled
multilibs hence allowing it to fulfil all the appropriate dependencies.

To make this work a global multilib class file needed to be created.

This patch also enables this multi provider functionality for "allarch"
packages.

[YOCTO #1361]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 5d975fd..583d76b 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -6,12 +6,17 @@ python multilib_virtclass_handler () {
     variant = e.data.getVar("BBEXTENDVARIANT", True)
     if cls != "multilib" or not variant:
         return
+
+    # There should only be one kernel in multilib configs
+    if bb.data.inherits_class('kernel', e.data) or bb.data.inherits_class('module-base', e.data) or bb.data.inherits_class('allarch', e.data):
+        raise bb.parse.SkipPackage("We shouldn't have multilib variants for the kernel")
+
     save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME", True) or ""
     for name in save_var_name.split():
         val=e.data.getVar(name, True)
         if val:
             e.data.setVar(name + "_MULTILIB_ORIGINAL", val)
-
+ 
     override = ":virtclass-multilib-" + variant
 
     e.data.setVar("MLPREFIX", variant + "-")
@@ -28,16 +33,6 @@ STAGINGCC_prepend = "${BBEXTENDVARIANT}-"
 python __anonymous () {
     variant = d.getVar("BBEXTENDVARIANT", True)
 
-    def extend_name(name):
-        if name.startswith("virtual/"):
-            subs = name.split("/", 1)[1]
-            if not subs.startswith(variant):
-                return "virtual/" + variant + "-" + subs
-            return name
-        if not name.startswith(variant):
-            return variant + "-" + name
-        return name
-
     def map_dependencies(varname, d, suffix = ""):
         if suffix:
             varname = varname + "_" + suffix
@@ -50,25 +45,15 @@ python __anonymous () {
             if dep.endswith(("-native", "-native-runtime")):
                 newdeps.append(dep)
             else:
-                newdeps.append(extend_name(dep))
+                newdeps.append(multilib_extend_name(variant, dep))
         d.setVar(varname, " ".join(newdeps))
 
-    def map_variable(varname, d):
-        var = d.getVar(varname, True)
-        if not var:
-            return
-        var = var.split()
-        newvar = []
-        for v in var:
-            newvar.append(extend_name(v))
-        d.setVar(varname, " ".join(newvar))
-
     pkgs_mapping = []
     for pkg in (d.getVar("PACKAGES", True) or "").split():
         if pkg.startswith(variant):
             pkgs_mapping.append([pkg.split(variant + "-")[1], pkg])
             continue
-        pkgs_mapping.append([pkg, extend_name(pkg)])
+        pkgs_mapping.append([pkg, multilib_extend_name(variant, pkg)])
 
     d.setVar("PACKAGES", " ".join([row[1] for row in pkgs_mapping]))
 
@@ -87,8 +72,8 @@ python __anonymous () {
         map_dependencies("RCONFLICTS", d, pkg)
         map_dependencies("PKG", d, pkg)
 
-    map_variable("PROVIDES", d)
-    map_variable("PACKAGES_DYNAMIC", d)
-    map_variable("PACKAGE_INSTALL", d)
-    map_variable("INITSCRIPT_PACKAGES", d)
+    multilib_map_variable("PROVIDES", variant, d)
+    multilib_map_variable("PACKAGES_DYNAMIC", variant, d)
+    multilib_map_variable("PACKAGE_INSTALL", variant, d)
+    multilib_map_variable("INITSCRIPT_PACKAGES", variant, d)
 }
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
new file mode 100644
index 0000000..217349b
--- a/dev/null
+++ b/meta/classes/multilib_global.bbclass
@@ -0,0 +1,39 @@
+python multilib_virtclass_handler_global () {
+    if not e.data:
+        return
+
+    variant = e.data.getVar("BBEXTENDVARIANT", True)
+
+    if isinstance(e, bb.event.RecipeParsed) and not variant:
+        if bb.data.inherits_class('kernel', e.data) or bb.data.inherits_class('module-base', e.data) or bb.data.inherits_class('allarch', e.data):
+            origprovs = provs = e.data.getVar("PROVIDES", True)
+            variants = (e.data.getVar("MULTILIB_VARIANTS", True) or "").split()
+            for variant in variants:
+                provs = provs + " " + multilib_map_variable("PROVIDES", variant, e.data)
+                e.data.setVar("PROVIDES", origprovs)
+            e.data.setVar("PROVIDES", provs)
+}
+
+addhandler multilib_virtclass_handler_global
+
+def multilib_extend_name(variant, name):
+    if name.startswith("virtual/"):
+        subs = name.split("/", 1)[1]
+        if not subs.startswith(variant):
+            return "virtual/" + variant + "-" + subs
+        return name
+    if not name.startswith(variant):
+        return variant + "-" + name
+    return name
+
+def multilib_map_variable(varname, variant, d):
+    var = d.getVar(varname, True)
+    if not var:
+        return
+    var = var.split()
+    newvar = []
+    for v in var:
+        newvar.append(multilib_extend_name(variant, v))
+    newdata =  " ".join(newvar)
+    d.setVar(varname, newdata)
+    return newdata
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 36793d2..7424b8f 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -6,6 +6,8 @@ MULTILIB_SAVE_VARNAME = "DEFAULTTUNE"
 
 MULTILIBS ??= "multilib:lib32"
 
+INHERIT += "multilib_global"
+
 BBCLASSEXTEND_append_pn-acl = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-alsa-lib = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-alsa-utils = " ${MULTILIBS}"




