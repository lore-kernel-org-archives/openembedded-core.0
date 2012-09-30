Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TI7Mu-0001mW-EY
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Sep 2012 02:26:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8U0Dqfl020468
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2012 17:13:52 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Sat, 29 Sep 2012 17:13:52 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2012 19:19:10 -0500
Message-ID: <81b24042824b81344141c7dcaffbfe74354bc635.1348963477.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1348963477.git.mark.hatle@windriver.com>
References: <cover.1348963477.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 04/12] bb.utils.explode_dep_versions: Update to ensure we avoid duplicate deps
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
X-List-Received-Date: Sun, 30 Sep 2012 00:26:49 -0000
Content-Type: text/plain

Due to a recent change in bb.utils.explode_dep_version, we need to make
sure that we do not have any duplicates in things that use
explode_dep_versions.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/insane.bbclass      |   55 +++++++++++++++++++++++++++++++++-
 meta/classes/kernel.bbclass      |   20 +++++++-----
 meta/classes/libc-common.bbclass |   13 ++++++--
 meta/classes/package.bbclass     |   20 ++++++++++--
 meta/classes/package_rpm.bbclass |   61 +++++++++++++++++++++-----------------
 5 files changed, 125 insertions(+), 44 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 1fb8970..17d887a 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -114,7 +114,7 @@ def package_qa_get_machine_dict():
 
 # Currently not being used by default "desktop"
 WARN_QA ?= "ldflags useless-rpaths rpaths unsafe-references-in-binaries unsafe-references-in-scripts staticdev libdir"
-ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
+ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms dep-cmp"
 
 ALL_QA = "${WARN_QA} ${ERROR_QA}"
 
@@ -659,6 +659,54 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, d):
 
     return sane
 
+def package_qa_check_deps(pkg, pkgdest, skip, d):
+    sane = True
+
+    # Copied from package_ipk.bbclass
+    # boiler plate to update the data
+    localdata = bb.data.createCopy(d)
+    root = "%s/%s" % (pkgdest, pkg)
+
+    localdata.setVar('ROOT', '') 
+    localdata.setVar('ROOT_%s' % pkg, root)
+    pkgname = localdata.getVar('PKG_%s' % pkg, True)
+    if not pkgname:
+        pkgname = pkg
+    localdata.setVar('PKG', pkgname)
+
+    localdata.setVar('OVERRIDES', pkg)
+
+    bb.data.update_data(localdata)
+
+    def check_valid_deps(var):
+        sane = True
+        try:
+            rvar = bb.utils.explode_dep_versions(localdata.getVar(var, True) or "")
+        except ValueError as e:
+            bb.fatal("%s_%s: %s" % (var, pkgname, e))
+            raise e
+        for dep in rvar:
+            if rvar[dep] and not rvar[dep].startswith(('< ', '= ', '> ', '<= ', '>=')):
+                error_msg = "%s_%s is invalid: %s (%s)   only comparisons <, =, >, <=, and >= are allowed" % (var, pkgname, dep, rvar[dep])
+                sane = package_qa_handle_error("dep-cmp", error_msg, d)
+        return sane
+
+    sane = True
+    if not check_valid_deps('RDEPENDS'):
+        sane = False
+    if not check_valid_deps('RRECOMMENDS'):
+        sane = False
+    if not check_valid_deps('RSUGGESTS'):
+        sane = False
+    if not check_valid_deps('RPROVIDES'):
+        sane = False
+    if not check_valid_deps('RREPLACES'):
+        sane = False
+    if not check_valid_deps('RCONFLICTS'):
+        sane = False
+
+    return sane
+
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     import subprocess
@@ -699,6 +747,7 @@ python do_package_qa () {
     g = globals()
     walk_sane = True
     rdepends_sane = True
+    deps_sane = True
     for package in packages.split():
         skip = (d.getVar('INSANE_SKIP_' + package, True) or "").split()
         if skip:
@@ -722,12 +771,14 @@ python do_package_qa () {
             walk_sane  = False
         if not package_qa_check_rdepends(package, pkgdest, skip, d):
             rdepends_sane = False
+        if not package_qa_check_deps(package, pkgdest, skip, d):
+            deps_sane = False
 
 
     if 'libdir' in d.getVar("ALL_QA", True).split():
         package_qa_check_libdir(d)
 
-    if not walk_sane or not rdepends_sane:
+    if not walk_sane or not rdepends_sane or not deps_sane:
         bb.fatal("QA run found fatal errors. Please consider fixing them.")
     bb.note("DONE with PACKAGE QA")
 }
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index fdef1be..878fd6c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -20,6 +20,13 @@ python __anonymous () {
     image = d.getVar('INITRAMFS_IMAGE', True)
     if image:
         d.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs')
+
+    # RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
+    rprovides = bb.utils.explode_dep_versions(d.getVar("RPROVIDES_kernel-base", True) or "")
+    dep = d.expand("kernel-${KERNEL_VERSION}")
+    if not dep in rprovides:
+        rprovides[dep] = ""
+    d.setVar("RPROVIDES_kernel-base", bb.utils.join_deps(rprovides, commasep=False))
 }
 
 inherit kernel-arch deploy
@@ -269,7 +276,6 @@ RDEPENDS_kernel = "kernel-base"
 RDEPENDS_kernel-base ?= "kernel-image"
 PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
 PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
-RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
 ALLOW_EMPTY_kernel = "1"
 ALLOW_EMPTY_kernel-base = "1"
 ALLOW_EMPTY_kernel-image = "1"
@@ -429,13 +435,11 @@ python populate_packages_prepend () {
             old_desc = d.getVar('DESCRIPTION_' + pkg, True) or ""
             d.setVar('DESCRIPTION_' + pkg, old_desc + "; " + vals["description"])
 
-        rdepends_str = d.getVar('RDEPENDS_' + pkg, True)
-        if rdepends_str:
-            rdepends = rdepends_str.split()
-        else:
-            rdepends = []
-        rdepends.extend(get_dependencies(file, pattern, format))
-        d.setVar('RDEPENDS_' + pkg, ' '.join(rdepends))
+        rdepends = bb.utils.explode_dep_versions(d.getVar('RDEPENDS_' + pkg, True) or "")
+        for dep in get_dependencies(file, pattern, format):
+            if not dep in rdepends:
+                rdepends[dep] = ""
+        d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
 
     module_deps = parse_depmod()
     module_regex = '^(.*)\.k?o$'
diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index 0f49936..dc32c81 100644
--- a/meta/classes/libc-common.bbclass
+++ b/meta/classes/libc-common.bbclass
@@ -29,7 +29,14 @@ python populate_packages_prepend () {
         d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
         d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
         # For backward compatibility with old -dbg package
-        d.appendVar('RPROVIDES_' + bpn + '-dbg', ' libc-dbg')
-        d.appendVar('RCONFLICTS_' + bpn + '-dbg', ' libc-dbg')
-        d.appendVar('RREPLACES_' + bpn + '-dbg', ' libc-dbg')
+
+        def add_dep(var, dep):
+            deps = bb.utils.explode_dep_versions(d.getVar(var + '_' + bpn, True) or "")
+            if not dep in deps:
+                deps[dep] = ""
+                d.setVar(var + '_' + bpn, bb.utils.join_deps(deps, commasep=False))
+
+        add_dep('RPROVIDES', 'libc-dbg')
+        add_dep('RCONFLICTS', 'libc-dbg')
+        add_dep('RREPLACES', 'libc-dbg')
 }
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index c8aafc9..6b28a15 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1637,14 +1637,19 @@ def read_libdep_files(d):
     pkglibdeps = {}
     packages = d.getVar('PACKAGES', True).split()
     for pkg in packages:
-        pkglibdeps[pkg] = []
+        pkglibdeps[pkg] = {}
         for extension in ".shlibdeps", ".pcdeps", ".clilibdeps":
             depsfile = d.expand("${PKGDEST}/" + pkg + extension)
             if os.access(depsfile, os.R_OK):
                 fd = file(depsfile)
                 lines = fd.readlines()
                 fd.close()
-                pkglibdeps[pkg].extend([l.rstrip() for l in lines])
+                for l in lines:
+                    l.rstrip()
+                    deps = bb.utils.explode_dep_versions(l)
+                    for dep in deps:
+                        if not dep in pkglibdeps[pkg]:
+                            pkglibdeps[pkg][dep] = deps[dep]
     return pkglibdeps
 
 python read_shlibdeps () {
@@ -1654,7 +1659,10 @@ python read_shlibdeps () {
     for pkg in packages:
         rdepends = bb.utils.explode_dep_versions(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False) or "")
         for dep in pkglibdeps[pkg]:
-            rdepends[dep] = ""
+            # Add the dep if it's not already there, or if no comparison is set
+            if not dep in rdepends or not rdepends[dep]:
+                rdepends[dep] = pkglibdeps[pkg][dep]
+
         d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
 }
 
@@ -1761,7 +1769,11 @@ python package_depchains() {
         pkglibdeplist = []
         for pkg in pkglibdeps:
             for dep in pkglibdeps[pkg]:
-                add_dep(pkglibdeplist, dep)
+                cmp = pkglibdeps[pkg][dep]
+                if cmp:
+                    add_dep(pkglibdeplist, dep)
+                else:
+                    add_dep(pkglibdeplist, "%s (%s)" % (dep, cmp))
         # FIXME this should not look at PN once all task recipes inherit from task.bbclass
         dbgdefaultdeps = ((d.getVar('DEPCHAIN_DBGDEFAULTDEPS', True) == '1') or (d.getVar('PN', True) or '').startswith('packagegroup-'))
 
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 49055f2..6256d6f 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -608,6 +608,13 @@ python write_specfile () {
                 name = "".join(name.split(eext[1] + '-'))
         return name
 
+    def strip_multilib_deps(deps, d):
+        depends = bb.utils.explode_dep_versions(deps or "")
+        newdeps = {}
+        for dep in depends:
+            newdeps[strip_multilib(dep, d)] = depends[dep]
+        return bb.utils.join_deps(newdeps)
+
 #        ml = d.getVar("MLPREFIX", True)
 #        if ml and name and len(ml) != 0 and name.find(ml) == 0:
 #            return ml.join(name.split(ml, 1)[1:])
@@ -709,7 +716,7 @@ python write_specfile () {
     srchomepage    = d.getVar('HOMEPAGE', True)
     srcdescription = d.getVar('DESCRIPTION', True) or "."
 
-    srcdepends     = strip_multilib(d.getVar('DEPENDS', True), d)
+    srcdepends     = strip_multilib_deps(d.getVar('DEPENDS', True), d)
     srcrdepends    = []
     srcrrecommends = []
     srcrsuggests   = []
@@ -772,12 +779,12 @@ python write_specfile () {
         # Map the dependencies into their final form
         mapping_rename_hook(localdata)
 
-        splitrdepends    = strip_multilib(localdata.getVar('RDEPENDS', True), d) or ""
-        splitrrecommends = strip_multilib(localdata.getVar('RRECOMMENDS', True), d) or ""
-        splitrsuggests   = strip_multilib(localdata.getVar('RSUGGESTS', True), d) or ""
-        splitrprovides   = strip_multilib(localdata.getVar('RPROVIDES', True), d) or ""
-        splitrreplaces   = strip_multilib(localdata.getVar('RREPLACES', True), d) or ""
-        splitrconflicts  = strip_multilib(localdata.getVar('RCONFLICTS', True), d) or ""
+        splitrdepends    = strip_multilib_deps(localdata.getVar('RDEPENDS', True), d)
+        splitrrecommends = strip_multilib_deps(localdata.getVar('RRECOMMENDS', True), d)
+        splitrsuggests   = strip_multilib_deps(localdata.getVar('RSUGGESTS', True), d)
+        splitrprovides   = strip_multilib_deps(localdata.getVar('RPROVIDES', True), d)
+        splitrreplaces   = strip_multilib_deps(localdata.getVar('RREPLACES', True), d)
+        splitrconflicts  = strip_multilib_deps(localdata.getVar('RCONFLICTS', True), d)
         splitrobsoletes  = []
 
         # Gather special src/first package data
@@ -826,16 +833,16 @@ python write_specfile () {
         spec_preamble_bottom.append('Group: %s' % splitsection)
 
         # Replaces == Obsoletes && Provides
-        if splitrreplaces and splitrreplaces.strip() != "":
-            for dep in splitrreplaces.split(','):
-                if splitrprovides:
-                    splitrprovides = splitrprovides + ", " + dep
-                else:
-                    splitrprovides = dep
-                if splitrobsoletes:
-                    splitrobsoletes = splitrobsoletes + ", " + dep
-                else:
-                    splitrobsoletes = dep
+        robsoletes = bb.utils.explode_dep_versions(splitrobsoletes or "")
+        rprovides = bb.utils.explode_dep_versions(splitrprovides or "")
+        rreplaces = bb.utils.explode_dep_versions(splitrreplaces or "")
+        for dep in rreplaces:
+            if not dep in robsoletes:
+                robsoletes[dep] = rreplaces[dep]
+            if not dep in rprovides:
+                rprovides[dep] = rreplaces[dep]
+        splitrobsoletes = bb.utils.join_deps(robsoletes, commasep=False)
+        splitrprovides = bb.utils.join_deps(rprovides, commasep=False)
 
         print_deps(splitrdepends, "Requires", spec_preamble_bottom, d)
         # Suggests in RPM are like recommends in OE-core!
@@ -918,16 +925,16 @@ python write_specfile () {
     tail_source(d)
 
     # Replaces == Obsoletes && Provides
-    if srcrreplaces and srcrreplaces.strip() != "":
-        for dep in srcrreplaces.split(','):
-            if srcrprovides:
-                srcrprovides = srcrprovides + ", " + dep
-            else:
-                srcrprovides = dep
-            if srcrobsoletes:
-                srcrobsoletes = srcrobsoletes + ", " + dep
-            else:
-                srcrobsoletes = dep
+    robsoletes = bb.utils.explode_dep_versions(srcrobsoletes or "")
+    rprovides = bb.utils.explode_dep_versions(srcrprovides or "")
+    rreplaces = bb.utils.explode_dep_versions(srcrreplaces or "")
+    for dep in rreplaces:
+        if not dep in robsoletes:
+            robsoletes[dep] = rreplaces[dep]
+        if not dep in rprovides:
+            rprovides[dep] = rreplaces[dep]
+    srcrobsoletes = bb.utils.join_deps(robsoletes, commasep=False)
+    srcrprovides = bb.utils.join_deps(rprovides, commasep=False)
 
     print_deps(srcdepends, "BuildRequires", spec_preamble_top, d)
     print_deps(srcrdepends, "Requires", spec_preamble_top, d)
-- 
1.7.3.4



