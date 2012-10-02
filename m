Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TIqHO-0001rS-H9 for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 02:24:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q920B8KM009942
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Oct 2012 01:11:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07592-10 for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2012 01:11:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q920At9A009918
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Oct 2012 01:10:56 +0100
Message-ID: <1349136658.15753.126.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 02 Oct 2012 01:10:58 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] classes: Update to use corrected bb.utils.explode_dep_versions2 API
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
X-List-Received-Date: Tue, 02 Oct 2012 00:24:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The bb.utils.explode_dep_versions function has issues where dependency information
can be lost. The API doesn't support maintaining the correct information so this
changes to use a new function which correctly handles the data.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
NB: This applies on top of Mark's patch and reverts some components of
it. When it comes to finally applying it, I may squash them together.

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index dddcd66..4f87c93 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -656,14 +656,15 @@ def package_qa_check_deps(pkg, pkgdest, skip, d):
     def check_valid_deps(var):
         sane = True
         try:
-            rvar = bb.utils.explode_dep_versions(localdata.getVar(var, True) or "")
+            rvar = bb.utils.explode_dep_versions2(localdata.getVar(var, True) or "")
         except ValueError as e:
             bb.fatal("%s_%s: %s" % (var, pkg, e))
             raise e
         for dep in rvar:
-            if rvar[dep] and not rvar[dep].startswith(('< ', '= ', '> ', '<= ', '>=')):
-                error_msg = "%s_%s is invalid: %s (%s)   only comparisons <, =, >, <=, and >= are allowed" % (var, pkg, dep, rvar[dep])
-                sane = package_qa_handle_error("dep-cmp", error_msg, d)
+            for v in rvar[dep]:
+                if v and not v.startswith(('< ', '= ', '> ', '<= ', '>=')):
+                    error_msg = "%s_%s is invalid: %s (%s)   only comparisons <, =, >, <=, and >= are allowed" % (var, pkg, dep, v)
+                    sane = package_qa_handle_error("dep-cmp", error_msg, d)
         return sane
 
     sane = True
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 878fd6c..36bc3c7 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -20,13 +20,6 @@ python __anonymous () {
     image = d.getVar('INITRAMFS_IMAGE', True)
     if image:
         d.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs')
-
-    # RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
-    rprovides = bb.utils.explode_dep_versions(d.getVar("RPROVIDES_kernel-base", True) or "")
-    dep = d.expand("kernel-${KERNEL_VERSION}")
-    if not dep in rprovides:
-        rprovides[dep] = ""
-    d.setVar("RPROVIDES_kernel-base", bb.utils.join_deps(rprovides, commasep=False))
 }
 
 inherit kernel-arch deploy
@@ -276,6 +269,7 @@ RDEPENDS_kernel = "kernel-base"
 RDEPENDS_kernel-base ?= "kernel-image"
 PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
 PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
+RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
 ALLOW_EMPTY_kernel = "1"
 ALLOW_EMPTY_kernel-base = "1"
 ALLOW_EMPTY_kernel-image = "1"
@@ -435,10 +429,10 @@ python populate_packages_prepend () {
             old_desc = d.getVar('DESCRIPTION_' + pkg, True) or ""
             d.setVar('DESCRIPTION_' + pkg, old_desc + "; " + vals["description"])
 
-        rdepends = bb.utils.explode_dep_versions(d.getVar('RDEPENDS_' + pkg, True) or "")
+        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg, True) or "")
         for dep in get_dependencies(file, pattern, format):
             if not dep in rdepends:
-                rdepends[dep] = ""
+                rdepends[dep] = []
         d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
 
     module_deps = parse_depmod()
diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index dc32c81..0f49936 100644
--- a/meta/classes/libc-common.bbclass
+++ b/meta/classes/libc-common.bbclass
@@ -29,14 +29,7 @@ python populate_packages_prepend () {
         d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
         d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
         # For backward compatibility with old -dbg package
-
-        def add_dep(var, dep):
-            deps = bb.utils.explode_dep_versions(d.getVar(var + '_' + bpn, True) or "")
-            if not dep in deps:
-                deps[dep] = ""
-                d.setVar(var + '_' + bpn, bb.utils.join_deps(deps, commasep=False))
-
-        add_dep('RPROVIDES', 'libc-dbg')
-        add_dep('RCONFLICTS', 'libc-dbg')
-        add_dep('RREPLACES', 'libc-dbg')
+        d.appendVar('RPROVIDES_' + bpn + '-dbg', ' libc-dbg')
+        d.appendVar('RCONFLICTS_' + bpn + '-dbg', ' libc-dbg')
+        d.appendVar('RREPLACES_' + bpn + '-dbg', ' libc-dbg')
 }
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index f162293..eaaad5f 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -85,9 +85,9 @@ PACKAGEFUNCS_append = "do_package_qa_multilib"
 python do_package_qa_multilib() {
 
     def check_mlprefix(pkg, var, mlprefix):
-        values = bb.utils.explode_dep_versions(d.getVar('%s_%s' % (var, pkg), True) or d.getVar(var, True) or "")
+        values = bb.utils.explode_deps(d.getVar('%s_%s' % (var, pkg), True) or d.getVar(var, True) or "")
         candidates = []
-        for i in values.keys():
+        for i in values:
             if i.startswith('virtual/'):
                 i = i[len('virtual/'):]
             if (not i.startswith('kernel-module')) and (not i.startswith(mlprefix)):
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 6b28a15..a14561d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -375,17 +375,13 @@ def get_package_mapping (pkg, d):
 def runtime_mapping_rename (varname, d):
     #bb.note("%s before: %s" % (varname, d.getVar(varname, True)))
 
-    new_depends = []
-    deps = bb.utils.explode_dep_versions(d.getVar(varname, True) or "")
+    new_depends = {}
+    deps = bb.utils.explode_dep_versions2(d.getVar(varname, True) or "")
     for depend in deps:
-        # Have to be careful with any version component of the depend
         new_depend = get_package_mapping(depend, d)
-        if deps[depend]:
-            new_depends.append("%s (%s)" % (new_depend, deps[depend]))
-        else:
-            new_depends.append(new_depend)
+        new_depends[new_depend] = deps[depend]
 
-    d.setVar(varname, " ".join(new_depends) or None)
+    d.setVar(varname, bb.utils.join_deps(new_depends, commasep=False))
 
     #bb.note("%s after: %s" % (varname, d.getVar(varname, True)))
 
@@ -1078,7 +1074,7 @@ python populate_packages () {
                     dangling_links[pkg].append(os.path.normpath(target))
 
     for pkg in package_list:
-        rdepends = bb.utils.explode_dep_versions(d.getVar('RDEPENDS_' + pkg, True) or d.getVar('RDEPENDS', True) or "")
+        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg, True) or d.getVar('RDEPENDS', True) or "")
 
         for l in dangling_links[pkg]:
             found = False
@@ -1091,7 +1087,7 @@ python populate_packages () {
                         if p == pkg:
                             break
                         if p not in rdepends:
-                            rdepends[p] = ""
+                            rdepends[p] = []
                         break
             if found == False:
                 bb.note("%s contains dangling symlink to %s" % (pkg, l))
@@ -1646,7 +1642,7 @@ def read_libdep_files(d):
                 fd.close()
                 for l in lines:
                     l.rstrip()
-                    deps = bb.utils.explode_dep_versions(l)
+                    deps = bb.utils.explode_dep_versions2(l)
                     for dep in deps:
                         if not dep in pkglibdeps[pkg]:
                             pkglibdeps[pkg][dep] = deps[dep]
@@ -1657,12 +1653,14 @@ python read_shlibdeps () {
 
     packages = d.getVar('PACKAGES', True).split()
     for pkg in packages:
-        rdepends = bb.utils.explode_dep_versions(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False) or "")
+        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False) or "")
         for dep in pkglibdeps[pkg]:
             # Add the dep if it's not already there, or if no comparison is set
-            if not dep in rdepends or not rdepends[dep]:
-                rdepends[dep] = pkglibdeps[pkg][dep]
-
+            if dep not in rdepends:
+                rdepends[dep] = []
+            for v in pkglibdeps[pkg][dep]:
+                if v not in rdepends[dep]:
+                    rdepends[dep].append(v)
         d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
 }
 
@@ -1687,7 +1685,7 @@ python package_depchains() {
     def pkg_adddeprrecs(pkg, base, suffix, getname, depends, d):
 
         #bb.note('depends for %s is %s' % (base, depends))
-        rreclist = bb.utils.explode_dep_versions(d.getVar('RRECOMMENDS_' + pkg, True) or d.getVar('RRECOMMENDS', True) or "")
+        rreclist = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg, True) or d.getVar('RRECOMMENDS', True) or "")
 
         for depend in depends:
             if depend.find('-native') != -1 or depend.find('-cross') != -1 or depend.startswith('virtual/'):
@@ -1700,7 +1698,7 @@ python package_depchains() {
             pkgname = getname(depend, suffix)
             #bb.note("Adding %s for %s" % (pkgname, depend))
             if pkgname not in rreclist and pkgname != pkg:
-                rreclist[pkgname] = ""
+                rreclist[pkgname] = []
 
         #bb.note('setting: RRECOMMENDS_%s=%s' % (pkg, ' '.join(rreclist)))
         d.setVar('RRECOMMENDS_%s' % pkg, bb.utils.join_deps(rreclist, commasep=False))
@@ -1708,7 +1706,7 @@ python package_depchains() {
     def pkg_addrrecs(pkg, base, suffix, getname, rdepends, d):
 
         #bb.note('rdepends for %s is %s' % (base, rdepends))
-        rreclist = bb.utils.explode_dep_versions(d.getVar('RRECOMMENDS_' + pkg, True) or d.getVar('RRECOMMENDS', True) or "")
+        rreclist = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg, True) or d.getVar('RRECOMMENDS', True) or "")
 
         for depend in rdepends:
             if depend.find('virtual-locale-') != -1:
@@ -1721,13 +1719,12 @@ python package_depchains() {
             pkgname = getname(depend, suffix)
             #bb.note("Adding %s for %s" % (pkgname, depend))
             if pkgname not in rreclist and pkgname != pkg:
-                rreclist[pkgname] = ""
+                rreclist[pkgname] = []
 
         #bb.note('setting: RRECOMMENDS_%s=%s' % (pkg, ' '.join(rreclist)))
         d.setVar('RRECOMMENDS_%s' % pkg, bb.utils.join_deps(rreclist, commasep=False))
 
     def add_dep(list, dep):
-        dep = dep.split(' (')[0].strip()
         if dep not in list:
             list.append(dep)
 
@@ -1766,14 +1763,7 @@ python package_depchains() {
 
     if "-dbg" in pkgs:
         pkglibdeps = read_libdep_files(d)
-        pkglibdeplist = []
-        for pkg in pkglibdeps:
-            for dep in pkglibdeps[pkg]:
-                cmp = pkglibdeps[pkg][dep]
-                if cmp:
-                    add_dep(pkglibdeplist, dep)
-                else:
-                    add_dep(pkglibdeplist, "%s (%s)" % (dep, cmp))
+        pkglibdeplist = pkglibdeps.keys()
         # FIXME this should not look at PN once all task recipes inherit from task.bbclass
         dbgdefaultdeps = ((d.getVar('DEPCHAIN_DBGDEFAULTDEPS', True) == '1') or (d.getVar('PN', True) or '').startswith('packagegroup-'))
 
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index a25e5d7..d273cb0 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -341,28 +341,29 @@ python do_package_deb () {
             # adjust these to the '<<' and '>>' equivalents
             #
             for dep in var:
-                if (var[dep] or "").startswith("< "):
-                    var[dep] = var[dep].replace("< ", "<< ")
-                elif (var[dep] or "").startswith("> "):
-                    var[dep] = var[dep].replace("> ", ">> ")
+                for i, v in enumerate(var[dep]):
+                    if (v or "").startswith("< "):
+                        var[dep][i] = var[dep][i].replace("< ", "<< ")
+                    elif (v or "").startswith("> "):
+                        var[dep][i] = var[dep][i].replace("> ", ">> ")
 
-        rdepends = bb.utils.explode_dep_versions(localdata.getVar("RDEPENDS", True) or "")
+        rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS", True) or "")
         debian_cmp_remap(rdepends)
         for dep in rdepends:
                 if '*' in dep:
                         del rdepends[dep]
-        rrecommends = bb.utils.explode_dep_versions(localdata.getVar("RRECOMMENDS", True) or "")
+        rrecommends = bb.utils.explode_dep_versions2(localdata.getVar("RRECOMMENDS", True) or "")
         debian_cmp_remap(rrecommends)
         for dep in rrecommends:
                 if '*' in dep:
                         del rrecommends[dep]
-        rsuggests = bb.utils.explode_dep_versions(localdata.getVar("RSUGGESTS", True) or "")
+        rsuggests = bb.utils.explode_dep_versions2(localdata.getVar("RSUGGESTS", True) or "")
         debian_cmp_remap(rsuggests)
-        rprovides = bb.utils.explode_dep_versions(localdata.getVar("RPROVIDES", True) or "")
+        rprovides = bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES", True) or "")
         debian_cmp_remap(rprovides)
-        rreplaces = bb.utils.explode_dep_versions(localdata.getVar("RREPLACES", True) or "")
+        rreplaces = bb.utils.explode_dep_versions2(localdata.getVar("RREPLACES", True) or "")
         debian_cmp_remap(rreplaces)
-        rconflicts = bb.utils.explode_dep_versions(localdata.getVar("RCONFLICTS", True) or "")
+        rconflicts = bb.utils.explode_dep_versions2(localdata.getVar("RCONFLICTS", True) or "")
         debian_cmp_remap(rconflicts)
         if rdepends:
             ctrlfile.write("Depends: %s\n" % unicode(bb.utils.join_deps(rdepends)))
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 281ce59..019bd7c 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -379,22 +379,23 @@ python do_package_ipk () {
             # adjust these to the '<<' and '>>' equivalents
             #
             for dep in var:
-                if (var[dep] or "").startswith("< "):
-                    var[dep] = var[dep].replace("< ", "<< ")
-                elif (var[dep] or "").startswith("> "):
-                    var[dep] = var[dep].replace("> ", ">> ")
+                for i, v in enumerate(var[dep]):
+                    if (v or "").startswith("< "):
+                        var[dep][i] = var[dep][i].replace("< ", "<< ")
+                    elif (v or "").startswith("> "):
+                        var[dep][i] = var[dep][i].replace("> ", ">> ")
 
-        rdepends = bb.utils.explode_dep_versions(localdata.getVar("RDEPENDS", True) or "")
+        rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS", True) or "")
         debian_cmp_remap(rdepends)
-        rrecommends = bb.utils.explode_dep_versions(localdata.getVar("RRECOMMENDS", True) or "")
+        rrecommends = bb.utils.explode_dep_versions2(localdata.getVar("RRECOMMENDS", True) or "")
         debian_cmp_remap(rrecommends)
-        rsuggests = bb.utils.explode_dep_versions(localdata.getVar("RSUGGESTS", True) or "")
+        rsuggests = bb.utils.explode_dep_versions2(localdata.getVar("RSUGGESTS", True) or "")
         debian_cmp_remap(rsuggests)
-        rprovides = bb.utils.explode_dep_versions(localdata.getVar("RPROVIDES", True) or "")
+        rprovides = bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES", True) or "")
         debian_cmp_remap(rprovides)
-        rreplaces = bb.utils.explode_dep_versions(localdata.getVar("RREPLACES", True) or "")
+        rreplaces = bb.utils.explode_dep_versions2(localdata.getVar("RREPLACES", True) or "")
         debian_cmp_remap(rreplaces)
-        rconflicts = bb.utils.explode_dep_versions(localdata.getVar("RCONFLICTS", True) or "")
+        rconflicts = bb.utils.explode_dep_versions2(localdata.getVar("RCONFLICTS", True) or "")
         debian_cmp_remap(rconflicts)
 
         if rdepends:
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 6256d6f..c491775 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -609,7 +609,7 @@ python write_specfile () {
         return name
 
     def strip_multilib_deps(deps, d):
-        depends = bb.utils.explode_dep_versions(deps or "")
+        depends = bb.utils.explode_dep_versions2(deps or "")
         newdeps = {}
         for dep in depends:
             newdeps[strip_multilib(dep, d)] = depends[dep]
@@ -637,18 +637,20 @@ python write_specfile () {
     def translate_vers(varname, d):
         depends = d.getVar(varname, True)
         if depends:
-            depends_dict = bb.utils.explode_dep_versions(depends)
+            depends_dict = bb.utils.explode_dep_versions2(depends)
             newdeps_dict = {}
             for dep in depends_dict:
-                ver = depends_dict[dep]
-                if dep and ver:
+                verlist = []
+                for ver in depends_dict[dep]:
                     if '-' in ver:
                         subd = oe.packagedata.read_subpkgdata_dict(dep, d)
                         if 'PKGV' in subd:
                             pv = subd['PKGV']
                             reppv = pv.replace('-', '+')
-                            ver = ver.replace(pv, reppv)
-                newdeps_dict[dep] = ver
+                            verlist.append(ver.replace(pv, reppv))
+                    else:
+                        verlist.append(ver)
+                newdeps_dict[dep] = verlist
             depends = bb.utils.join_deps(newdeps_dict)
             d.setVar(varname, depends.strip())
 
@@ -657,14 +659,13 @@ python write_specfile () {
     def print_deps(variable, tag, array, d):
         depends = variable
         if depends:
-            depends_dict = bb.utils.explode_dep_versions(depends)
+            depends_dict = bb.utils.explode_dep_versions2(depends)
             for dep in depends_dict:
-                ver = depends_dict[dep]
-                if dep and ver:
+                for ver in depends_dict[dep]:
                     ver = ver.replace('(', '')
                     ver = ver.replace(')', '')
                     array.append("%s: %s %s" % (tag, dep, ver))
-                else:
+                if not len(depends_dict[dep]):
                     array.append("%s: %s" % (tag, dep))
 
     def walk_files(walkpath, target, conffiles):
@@ -833,9 +834,9 @@ python write_specfile () {
         spec_preamble_bottom.append('Group: %s' % splitsection)
 
         # Replaces == Obsoletes && Provides
-        robsoletes = bb.utils.explode_dep_versions(splitrobsoletes or "")
-        rprovides = bb.utils.explode_dep_versions(splitrprovides or "")
-        rreplaces = bb.utils.explode_dep_versions(splitrreplaces or "")
+        robsoletes = bb.utils.explode_dep_versions2(splitrobsoletes or "")
+        rprovides = bb.utils.explode_dep_versions2(splitrprovides or "")
+        rreplaces = bb.utils.explode_dep_versions2(splitrreplaces or "")
         for dep in rreplaces:
             if not dep in robsoletes:
                 robsoletes[dep] = rreplaces[dep]
@@ -854,7 +855,7 @@ python write_specfile () {
 
         # conflicts can not be in a provide!  We will need to filter it.
         if splitrconflicts:
-            depends_dict = bb.utils.explode_dep_versions(splitrconflicts)
+            depends_dict = bb.utils.explode_dep_versions2(splitrconflicts)
             newdeps_dict = {}
             for dep in depends_dict:
                 if dep not in splitrprovides:
@@ -925,9 +926,9 @@ python write_specfile () {
     tail_source(d)
 
     # Replaces == Obsoletes && Provides
-    robsoletes = bb.utils.explode_dep_versions(srcrobsoletes or "")
-    rprovides = bb.utils.explode_dep_versions(srcrprovides or "")
-    rreplaces = bb.utils.explode_dep_versions(srcrreplaces or "")
+    robsoletes = bb.utils.explode_dep_versions2(srcrobsoletes or "")
+    rprovides = bb.utils.explode_dep_versions2(srcrprovides or "")
+    rreplaces = bb.utils.explode_dep_versions2(srcrreplaces or "")
     for dep in rreplaces:
         if not dep in robsoletes:
             robsoletes[dep] = rreplaces[dep]
@@ -947,7 +948,7 @@ python write_specfile () {
     
     # conflicts can not be in a provide!  We will need to filter it.
     if srcrconflicts:
-        depends_dict = bb.utils.explode_dep_versions(srcrconflicts)
+        depends_dict = bb.utils.explode_dep_versions2(srcrconflicts)
         newdeps_dict = {}
         for dep in depends_dict:
             if dep not in srcrprovides:




