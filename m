Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RdmrE-0004F6-Cr for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 18:55:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBMHm1mF026650
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 17:48:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26256-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 17:47:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBMHlrMd026644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 17:47:54 GMT
Message-ID: <1324576076.24604.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Dec 2011 17:47:56 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: multilib: Abstract class extension code into classextend.py
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
X-List-Received-Date: Thu, 22 Dec 2011 17:55:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is a lot of code which could ideally be shared between the various
users of BBCLASSEXTEND (native, nativesdk and multilib). This starts the
process of refactoring it into a python class in lib/oe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 6eb3bc3..87d0cd4 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -37,25 +37,14 @@ STAGINGCC_prepend = "${BBEXTENDVARIANT}-"
 python __anonymous () {
     variant = d.getVar("BBEXTENDVARIANT", True)
 
-    def map_dependencies(varname, d, suffix = ""):
-        if suffix:
-            varname = varname + "_" + suffix
-        deps = d.getVar(varname, True)
-        if not deps:
-            return
-        deps = bb.utils.explode_deps(deps)
-        newdeps = []
-        for dep in deps:
-            if dep.endswith(("-native", "-native-runtime")):
-                newdeps.append(dep)
-            else:
-                newdeps.append(multilib_extend_name(variant, dep))
-        d.setVar(varname, " ".join(newdeps))
+    import oe.classextend
+
+    clsextend = oe.classextend.ClassExtender(variant, d)
 
     if bb.data.inherits_class('image', d):
-        map_dependencies("PACKAGE_INSTALL", d)
-        map_dependencies("LINGUAS_INSTALL", d)
-        map_dependencies("RDEPENDS", d)
+        clsextend.map_depends_variable("PACKAGE_INSTALL")
+        clsextend.map_depends_variable("LINGUAS_INSTALL")
+        clsextend.map_depends_variable("RDEPENDS")
         pinstall = d.getVar("LINGUAS_INSTALL", True) + " " + d.getVar("PACKAGE_INSTALL", True)
         d.setVar("PACKAGE_INSTALL", pinstall)
         d.setVar("LINGUAS_INSTALL", "")
@@ -63,32 +52,13 @@ python __anonymous () {
         d.setVar("PACKAGE_INSTALL_ATTEMPTONLY", "")
         return
 
-    pkgs_mapping = []
-    for pkg in (d.getVar("PACKAGES", True) or "").split():
-        if pkg.startswith(variant):
-            pkgs_mapping.append([pkg.split(variant + "-")[1], pkg])
-            continue
-        pkgs_mapping.append([pkg, multilib_extend_name(variant, pkg)])
-
-    d.setVar("PACKAGES", " ".join([row[1] for row in pkgs_mapping]))
-
-    vars = (d.getVar("PACKAGEVARS", True) or "").split()
-    for pkg_mapping in pkgs_mapping:
-        for subs in vars:
-            d.renameVar("%s_%s" % (subs, pkg_mapping[0]), "%s_%s" % (subs, pkg_mapping[1]))
-
-    map_dependencies("DEPENDS", d)
-    for pkg in (d.getVar("PACKAGES", True).split() + [""]):
-        map_dependencies("RDEPENDS", d, pkg)
-        map_dependencies("RRECOMMENDS", d, pkg)
-        map_dependencies("RSUGGESTS", d, pkg)
-        map_dependencies("RPROVIDES", d, pkg)
-        map_dependencies("RREPLACES", d, pkg)
-        map_dependencies("RCONFLICTS", d, pkg)
-        map_dependencies("PKG", d, pkg)
+    clsextend.rename_packages()
+    clsextend.rename_package_variables((d.getVar("PACKAGEVARS", True) or "").split())
 
-    multilib_map_variable("PROVIDES", variant, d)
-    multilib_map_variable("PACKAGES_DYNAMIC", variant, d)
-    multilib_map_variable("PACKAGE_INSTALL", variant, d)
-    multilib_map_variable("INITSCRIPT_PACKAGES", variant, d)
+    clsextend.map_depends_variable("DEPENDS")
+    clsextend.map_packagevars()
+    clsextend.map_variable("PROVIDES")
+    clsextend.map_variable("PACKAGES_DYNAMIC")
+    clsextend.map_variable("PACKAGE_INSTALL")
+    clsextend.map_variable("INITSCRIPT_PACKAGES")
 }
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
new file mode 100644
index 0000000..f23885d
--- /dev/null
+++ b/meta/lib/oe/classextend.py
@@ -0,0 +1,80 @@
+class ClassExtender(object):
+    def __init__(self, extname, d):
+        self.extname = extname
+        self.d = d
+        self.pkgs_mapping = []
+
+    def extend_name(self, name):
+        if name.startswith("kernel-module"):
+            return name
+        if name.startswith("virtual/"):
+            subs = name.split("/", 1)[1]
+            if not subs.startswith(self.extname):
+                return "virtual/" + self.extname + "-" + subs
+            return name
+        if not name.startswith(self.extname):
+            return self.extname + "-" + name
+        return name
+
+    def map_variable(self, varname):
+        var = self.d.getVar(varname, True)
+        if not var:
+            return ""
+        var = var.split()
+        newvar = []
+        for v in var:
+            newvar.append(self.extend_name(v))
+        newdata =  " ".join(newvar)
+        self.d.setVar(varname, newdata)
+        return newdata
+
+    def map_depends(self, dep):
+        if dep.endswith(("-native", "-native-runtime")):
+            return dep
+        else:
+            return self.extend_name(dep)
+
+    def map_depends_variable(self, varname, suffix = ""):
+        if suffix:
+            varname = varname + "_" + suffix
+        deps = self.d.getVar(varname, True)
+        if not deps:
+            return
+        deps = bb.utils.explode_deps(deps)
+        newdeps = []
+        for dep in deps:
+            newdeps.append(self.map_depends(dep))
+        self.d.setVar(varname, " ".join(newdeps))
+
+    def map_packagevars(self):
+        for pkg in (self.d.getVar("PACKAGES", True).split() + [""]):
+            self.map_depends_variable("RDEPENDS", pkg)
+            self.map_depends_variable("RRECOMMENDS", pkg)
+            self.map_depends_variable("RSUGGESTS", pkg)
+            self.map_depends_variable("RPROVIDES", pkg)
+            self.map_depends_variable("RREPLACES", pkg)
+            self.map_depends_variable("RCONFLICTS", pkg)
+            self.map_depends_variable("PKG", pkg)
+
+    def rename_packages(self):
+        for pkg in (self.d.getVar("PACKAGES", True) or "").split():
+            if pkg.startswith(self.extname):
+               self.pkgs_mapping.append([pkg.split(self.extname + "-")[1], pkg])
+               continue
+            self.pkgs_mapping.append([pkg, self.extend_name(pkg)])
+
+        self.d.setVar("PACKAGES", " ".join([row[1] for row in self.pkgs_mapping]))
+
+    def rename_package_variables(self, variables):
+        for pkg_mapping in self.pkgs_mapping:
+            for subs in variables:
+                self.d.renameVar("%s_%s" % (subs, pkg_mapping[0]), "%s_%s" % (subs, pkg_mapping[1]))
+
+class NativesdkClassExtender(ClassExtender):
+    def map_depends(self, dep):
+        if dep.endswith(("-native", "-native-runtime", "-cross")):
+            return dep
+        elif dep.endswith(("-gcc-intermediate", "-gcc-initial", "-gcc", "-g++")):
+            return dep + "-crosssdk"
+        else:
+            return self.extend_name(dep)



