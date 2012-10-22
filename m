Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TQJsc-00004s-8w
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 17:25:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9MFC0e9018768
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 08:12:00 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Mon, 22 Oct 2012 08:12:00 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Oct 2012 10:20:35 -0500
Message-ID: <b939b430a474e14fe77ed9ac3f3cef0b822ef345.1350918262.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1350918262.git.mark.hatle@windriver.com>
References: <cover.1350918262.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/4] multilib: Add support for cross-canadian multilib packages
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
X-List-Received-Date: Mon, 22 Oct 2012 15:25:26 -0000
Content-Type: text/plain

Add support for the generation of cross-canadian packages.

Each cross-canadian package has:
 PN = "pkg-cross-canadian-${TRANSLATED_TARGET_ARCH}"

in order for that to be evaluated properly with multilibs enabled, it was
necessary to detect both the presence of the cross-canadian packages and
then update the vars using the OVERRIDE for the multilib.  Additional checks
were made to ensure that any dependency that sais "cross-canadian" did not
get prefixed with the MLPREFIX.

Also, make sure that even when building multilib cross-canadian packages,
we only use the single SDK PACKAGE_ARCH, we don't want or need variants.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/base.bbclass     |   39 +++++++++++++++++++++++++++++++++++++--
 meta/classes/multilib.bbclass |   18 ++++++++++++++----
 meta/lib/oe/classextend.py    |    4 ++--
 3 files changed, 53 insertions(+), 8 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f254306..12a30c9 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -183,6 +183,8 @@ def preferred_ml_updates(d):
             providers.append(v)
 
     for pkg, reason in blacklists.items():
+        if pkg.endswith("-native") or pkg.startswith("nativesdk-") or 'cross-canadian' in pkg:
+            continue
         for p in prefixes:
             newpkg = p + "-" + pkg
             if not d.getVarFlag('PNBLACKLIST', newpkg, True):
@@ -193,6 +195,17 @@ def preferred_ml_updates(d):
         pkg = v.replace("PREFERRED_VERSION_", "")
         if pkg.endswith("-native") or pkg.startswith("nativesdk-"):
             continue
+        if 'cross-canadian' in pkg:
+            for p in prefixes:
+                localdata = bb.data.createCopy(d)
+                override = ":virtclass-multilib-" + p
+                localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
+                bb.data.update_data(localdata)
+                newname = localdata.expand(v)
+                if newname != v:
+                    newval = localdata.getVar(v, True)
+                    d.setVar(newname, newval)
+            continue
         for p in prefixes:
             newname = "PREFERRED_VERSION_" + p + "-" + pkg
             if not d.getVar(newname, False):
@@ -203,14 +216,36 @@ def preferred_ml_updates(d):
         pkg = prov.replace("PREFERRED_PROVIDER_", "")
         if pkg.endswith("-native") or pkg.startswith("nativesdk-"):
             continue
+        if 'cross-canadian' in pkg:
+            for p in prefixes:
+                localdata = bb.data.createCopy(d)
+                override = ":virtclass-multilib-" + p
+                localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
+                bb.data.update_data(localdata)
+                newname = localdata.expand(prov)
+                if newname != prov:
+                    newval = localdata.expand(val)
+                    d.setVar(newname, newval)
+            continue
         virt = ""
         if pkg.startswith("virtual/"):
             pkg = pkg.replace("virtual/", "")
             virt = "virtual/"
         for p in prefixes:
-            newname = "PREFERRED_PROVIDER_" + virt + p + "-" + pkg
             if pkg != "kernel":
                 val = p + "-" + val
+
+            # implement variable keys
+            localdata = bb.data.createCopy(d)
+            override = ":virtclass-multilib-" + p
+            localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
+            bb.data.update_data(localdata)
+            newname = localdata.expand(prov)
+            if newname != prov:
+                d.setVar(newname, localdata.expand(val))
+
+            # implement alternative multilib name
+            newname = localdata.expand("PREFERRED_PROVIDER_" + virt + p + "-" + pkg)
             if not d.getVar(newname, False):
                 d.setVar(newname, val)
 
@@ -218,7 +253,7 @@ def preferred_ml_updates(d):
     mp = (d.getVar("MULTI_PROVIDER_WHITELIST", True) or "").split()
     extramp = []
     for p in mp:
-        if p.endswith("-native") or p.startswith("nativesdk-"):
+        if p.endswith("-native") or p.startswith("nativesdk-") or 'cross-canadian' in p:
             continue
         virt = ""
         if p.startswith("virtual/"):
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 3824f3b..de6e59e 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -18,6 +18,13 @@ python multilib_virtclass_handler () {
         e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
         return
 
+    if bb.data.inherits_class('cross-canadian', e.data):
+        e.data.setVar("MLPREFIX", variant + "-")
+        override = ":virtclass-multilib-" + variant
+        e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
+        bb.data.update_data(e.data)
+        return
+
     if bb.data.inherits_class('native', e.data):
         raise bb.parse.SkipPackage("We can't extend native recipes")
 
@@ -69,12 +76,16 @@ python __anonymous () {
     if bb.data.inherits_class('image', d) or bb.data.inherits_class('populate_sdk_base', d):
         return
 
+    clsextend.map_depends_variable("DEPENDS")
+    clsextend.map_variable("PROVIDES")
+
+    if bb.data.inherits_class('cross-canadian', d):
+        return
+
     clsextend.rename_packages()
     clsextend.rename_package_variables((d.getVar("PACKAGEVARS", True) or "").split())
 
-    clsextend.map_depends_variable("DEPENDS")
     clsextend.map_packagevars()
-    clsextend.map_variable("PROVIDES")
     clsextend.map_regexp_variable("PACKAGES_DYNAMIC")
     clsextend.map_variable("PACKAGE_INSTALL")
     clsextend.map_variable("INITSCRIPT_PACKAGES")
@@ -90,7 +101,7 @@ python do_package_qa_multilib() {
         for i in values:
             if i.startswith('virtual/'):
                 i = i[len('virtual/'):]
-            if (not i.startswith('kernel-module')) and (not i.startswith(mlprefix)):
+            if (not i.startswith('kernel-module')) and (not i.startswith(mlprefix)) and (not 'cross-canadian' in i):
                 candidates.append(i)
         if len(candidates) > 0:
             bb.warn("Multilib QA Issue: %s package %s - suspicious values '%s' in %s" 
@@ -109,4 +120,3 @@ python do_package_qa_multilib() {
         check_mlprefix(pkg, 'RREPLACES', ml)
         check_mlprefix(pkg, 'RCONFLICTS', ml)
 }
-
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index 857a6c9..c982fb7 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -50,7 +50,7 @@ class ClassExtender(object):
         return newdata
 
     def map_depends(self, dep):
-        if dep.endswith(("-native", "-native-runtime")):
+        if dep.endswith(("-native", "-native-runtime")) or ('nativesdk-' in dep) or ('cross-canadian' in dep):
             return dep
         else:
             return self.extend_name(dep)
@@ -93,7 +93,7 @@ class ClassExtender(object):
 
 class NativesdkClassExtender(ClassExtender):
     def map_depends(self, dep):
-        if dep.endswith(("-native", "-native-runtime", "-cross")):
+        if dep.endswith(("-native", "-native-runtime", "-cross")) or ('nativesdk-' in dep):
             return dep
         elif dep.endswith(("-gcc-intermediate", "-gcc-initial", "-gcc", "-g++")):
             return dep + "-crosssdk"
-- 
1.7.3.4



