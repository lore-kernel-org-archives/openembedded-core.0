Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SuPKm-0002Ym-KM
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 16:46:36 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2012 07:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127179876"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.37])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Jul 2012 07:35:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2012 15:35:00 +0100
Message-Id: <e24b9ab4ba9c67f929f71d2c5dccab2118403488.1343313237.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343313237.git.paul.eggleton@linux.intel.com>
References: <cover.1343313237.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343313237.git.paul.eggleton@linux.intel.com>
References: <cover.1343313237.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/package: reduce dbg package dependencies
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
X-List-Received-Date: Thu, 26 Jul 2012 14:46:36 -0000

Make dbg package dependencies added via DEPCHAIN_POST less aggressive -
only add dependencies on dbg packages for shared library dependencies.
This avoids dragging in extraneous packages (such as eglibc-dbg forcing
bash-dbg to be installed) whilst preserving the ability to easily debug
into shared libraries in use by an application by just requesting the
installation of the single dbg package for that application.

For task recipes however we preserve the previous behaviour, since when
you install task-xxx-dbg you expect the dbg packages for every package
in the task to be installed. Unfortunately not all of our tasks inherit
from task.bbclass so we just use a name match - this should be tidied up
later.

Fixes [YOCTO #2599].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package.bbclass |   32 +++++++++++++++++++++++++++-----
 meta/classes/task.bbclass    |    3 +++
 2 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 962abcd..efb03f8 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1580,19 +1580,28 @@ python package_do_pkgconfig () {
     bb.utils.unlockfile(lf)
 }
 
-python read_shlibdeps () {
+def read_libdep_files(d):
+    pkglibdeps = {}
     packages = d.getVar('PACKAGES', True).split()
     for pkg in packages:
-        rdepends = bb.utils.explode_dep_versions(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False) or "")
-
+        pkglibdeps[pkg] = []
         for extension in ".shlibdeps", ".pcdeps", ".clilibdeps":
             depsfile = d.expand("${PKGDEST}/" + pkg + extension)
             if os.access(depsfile, os.R_OK):
                 fd = file(depsfile)
                 lines = fd.readlines()
                 fd.close()
-                for l in lines:
-                    rdepends[l.rstrip()] = ""
+                pkglibdeps[pkg].extend([l.rstrip() for l in lines])
+    return pkglibdeps
+
+python read_shlibdeps () {
+    pkglibdeps = read_libdep_files(d)
+
+    packages = d.getVar('PACKAGES', True).split()
+    for pkg in packages:
+        rdepends = bb.utils.explode_dep_versions(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False) or "")
+        for dep in pkglibdeps[pkg]:
+            rdepends[dep] = ""
         d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
 }
 
@@ -1694,6 +1703,15 @@ python package_depchains() {
                     pkgs[prefix] = {}
                 pkgs[prefix][pkg] = (pkg[:-len(prefix)], pre_getname)
 
+    if "-dbg" in pkgs:
+        pkglibdeps = read_libdep_files(d)
+        pkglibdeplist = []
+        for pkg in pkglibdeps:
+            for dep in pkglibdeps[pkg]:
+                add_dep(pkglibdeplist, dep)
+        # FIXME this should not look at PN once all task recipes inherit from task.bbclass
+        dbgdefaultdeps = ((d.getVar('DEPCHAIN_DBGDEFAULTDEPS', True) == '1') or (d.getVar('PN', True) or '').startswith('task-'))
+
     for suffix in pkgs:
         for pkg in pkgs[suffix]:
             if d.getVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs'):
@@ -1701,6 +1719,10 @@ python package_depchains() {
             (base, func) = pkgs[suffix][pkg]
             if suffix == "-dev":
                 pkg_adddeprrecs(pkg, base, suffix, func, depends, d)
+            elif suffix == "-dbg":
+                if not dbgdefaultdeps:
+                    pkg_addrrecs(pkg, base, suffix, func, pkglibdeplist, d)
+                    continue
             if len(pkgs[suffix]) == 1:
                 pkg_addrrecs(pkg, base, suffix, func, rdepends, d)
             else:
diff --git a/meta/classes/task.bbclass b/meta/classes/task.bbclass
index 22c2fd3..6ec154a 100644
--- a/meta/classes/task.bbclass
+++ b/meta/classes/task.bbclass
@@ -25,3 +25,6 @@ python () {
     d.setVar('PACKAGES', ' '.join(packages+genpackages))
 }
 
+# We don't want to look at shared library dependencies for the
+# dbg packages
+DEPCHAIN_DBGDEFAULTDEPS = "1"
-- 
1.7.9.5



