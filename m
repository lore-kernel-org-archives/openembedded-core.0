Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1ULIx8-0006VP-Q6
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 20:57:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2SJeY4b025365
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 12:40:34 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 28 Mar 2013 12:40:34 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2013 14:40:29 -0500
Message-ID: <1364499629-3445-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
X-Originating-IP: [172.25.34.110]
Subject: [PATCH 1/1 RFC - Denzil] nativesdk.bbclass: Fix the remapping code on nativesdk
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
X-List-Received-Date: Thu, 28 Mar 2013 19:57:42 -0000
Content-Type: text/plain

The following patch is being sent to the oe-core list in order to meet our
Yocto Project compliance requirements.  We don't believe this patch is
generally applicable to Denzil.

The purpose of this change is to fix the way automatic dependencies and such
are generated when creating nativesdk packages.  (This approach was
abandoned in the Danny development and replaced with the multilib approach.)

---

When remapping the nativesdk we need to change the values of
PACKAGES, as well as the various R* items.  But not only the
values, but we need to rename the vars to their new PACKAGES
entries.

In addition, if a package has "-nativesdk" already in the name
we want to add it to RPROVIDES to avoid compatibility problems.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/insane.bbclass    |    2 +
 meta/classes/nativesdk.bbclass |   61 +++++++++++++++++++++++++++++++++++----
 2 files changed, 56 insertions(+), 7 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 85ccdab..6a80ccf 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -213,6 +213,8 @@ def package_qa_check_staticdev(path, name, d, elf, messages):
     libgcc.a, libgcov.a will be skipped in their packages
     """
 
+    if name.endswith("-nativesdk"):
+        name = name.replace("-nativesdk", "")
     if not name.endswith("-pic") and not name.endswith("-staticdev") and path.endswith(".a") and not path.endswith("_nonshared.a"):
         messages.append("non -staticdev package contains static .a library: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index a58fce2..3746190 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -78,7 +78,9 @@ python () {
         deps = bb.utils.explode_deps(deps)
         newdeps = []
         for dep in deps:
-            if dep.endswith("-native") or dep.endswith("-cross"):
+            if dep.startswith("rtld"):
+                newdeps.append(dep)
+            elif dep.endswith("-native") or dep.endswith("-cross"):
                 newdeps.append(dep)
             elif dep.endswith("-gcc-intermediate") or dep.endswith("-gcc-initial") or dep.endswith("-gcc") or dep.endswith("-g++"):
                 newdeps.append(dep + "-crosssdk")
@@ -88,13 +90,58 @@ python () {
                 newdeps.append(dep)
         d.setVar(varname, " ".join(newdeps))
 
+    def renameVars(varname, d, origpkg, newpkg):
+        origV = varname + "_" + origpkg
+        # In the case where FOO_${PN}-bar, we need to figure out the ${PN} and change it to BPN-bar-nativesdk!
+        pnV = varname + "_" + origpkg.replace("-nativesdk", "").replace(d.getVar('PN', True).replace('-nativesdk', ""),d.getVar('PN', True))
+        newV  = varname + "_" + newpkg
+        if origV != newV and not d.getVar(newV, False) and d.getVar(origV, False):
+            d.renameVar(origV, newV)
+        elif pnV != newV and not d.getVar(newV, False) and d.getVar(pnV, False):
+            d.renameVar(pnV, newV)
+
     map_dependencies("DEPENDS", d)
-    #for pkg in (d.getVar("PACKAGES", True).split() + [""]):
-    #    map_dependencies("RDEPENDS", d, pkg)
-    #    map_dependencies("RRECOMMENDS", d, pkg)
-    #    map_dependencies("RSUGGESTS", d, pkg)
-    #    map_dependencies("RPROVIDES", d, pkg)
-    #    map_dependencies("RREPLACES", d, pkg)
+    newpkgs = ""
+    for pkg in (d.getVar("PACKAGES", True).split() + [""]):
+        if pkg and not pkg.endswith("-nativesdk"):
+            newpkg = pkg.replace("-nativesdk", "") + "-nativesdk"
+            # If we end up renaming this, we need to add ourselves as a provider
+            if "-nativesdk" in pkg:
+                d.appendVar("RPROVIDES_" + pkg, " " + pkg)
+        else:
+            newpkg = pkg
+        newpkgs += " " + newpkg
+
+        renameVars("FILES", d, pkg, newpkg)
+        renameVars("INSANE_SKIP", d, pkg, newpkg)
+
+        renameVars("ALTERNATIVE", d, pkg, newpkg)
+        renameVars("ALTERNATIVE_TARGET", d, pkg, newpkg)
+        renameVars("ALTERNATIVE_PRIORITY", d, pkg, newpkg)
+
+        renameVars("pkg_postinst", d, pkg, newpkg)
+        renameVars("pkg_postrm", d, pkg, newpkg)
+        renameVars("pkg_preinst", d, pkg, newpkg)
+        renameVars("pkg_prerm", d, pkg, newpkg)
+
+        renameVars("ALLOW_EMPTY", d, pkg, newpkg)
+
+        renameVars("RDEPENDS", d, pkg, newpkg)
+        map_dependencies("RDEPENDS", d, newpkg)
+        renameVars("RRECOMMENDS", d, pkg, newpkg)
+        map_dependencies("RRECOMMENDS", d, newpkg)
+        renameVars("RSUGGESTS", d, pkg, newpkg)
+        map_dependencies("RSUGGESTS", d, newpkg)
+        renameVars("RPROVIDES", d, pkg, newpkg)
+        map_dependencies("RPROVIDES", d, newpkg)
+        renameVars("RREPLACES", d, pkg, newpkg)
+        map_dependencies("RREPLACES", d, newpkg)
+        renameVars("RCONFLICTS", d, pkg, newpkg)
+        map_dependencies("RCONFLICTS", d, newpkg)
+        renameVars("PKG", d, pkg, newpkg)
+        map_dependencies("PKG", d, newpkg)
+
+    d.setVar("PACKAGES", newpkgs)
 
     provides = d.getVar("PROVIDES", True)
     for prov in provides.split():
-- 
1.7.1



