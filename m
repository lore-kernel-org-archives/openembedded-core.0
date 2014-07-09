Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E502E70481
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 20:27:13 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s69KR8qC019398 for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Jul 2014 21:27:09 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bPTnTQ9eBIRW
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 21:27:08 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s69KR1Vt019384
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Jul 2014 21:27:04 +0100
Message-ID: <1404937616.15985.58.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 09 Jul 2014 21:26:56 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH RFC 3/3] insane: Add build depends check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jul 2014 20:27:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Now that we can get the task dependency tree from bitbake, we can start
to use this to strengthen our QA checks. If a dependency is added on
something which isn't in our dependency tree, that is obviously a bad
thing for example.

This patch therefore checks the RDEPENDS against the list of tasks and
ensures we do have a dependency present, if not a QA warning or error
can be issued through the usual mechanism.

The implementation is complicated by needing to resolve the RDEPENDS to
a PN using pkgdata. Its possible that can be an RPROVIDES of another
package so we need to check that too if it isn't a direct RDEPENDS.

To allow this test to work, we need to extend the do_package_qa
dependencies to include all RDEPENDS. In practise the do_package_write_*
tasks already do this so there should be no new circular dependencies or
any issues like that.

For now the issues are warnings as there are issues this finds in
OE-Core which need to be resolved and certainly will be in other layers
too. This change should simplify and assist some of Martin's dependency
scripts, the idea for this came from a discussion with Martin. It has
changed in that it doesn't just cover shlibs dependencies but checks all
dependencies. 

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 2c60917..b7c849e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -29,7 +29,7 @@ QA_SANE = "True"
 WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             textrel already-stripped incompatible-license files-invalid \
             installed-vs-shipped compile-host-path install-host-path \
-            pn-overrides infodir \
+            pn-overrides infodir build-deps \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -760,7 +760,7 @@ def package_qa_walk(path, warnfuncs, errorfuncs, skip, package, d):
 
     return len(errors) == 0
 
-def package_qa_check_rdepends(pkg, pkgdest, skip, d):
+def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
     # Don't do this check for kernel/module recipes, there aren't too many debug/development
     # packages and you can get false positives e.g. on kernel-module-lirc-dev
     if bb.data.inherits_class("kernel", d) or bb.data.inherits_class("module-base", d):
@@ -783,6 +783,21 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, d):
             if (not "-dev" in pkg and not "-staticdev" in pkg) and rdepend.endswith("-dev") and "dev-deps" not in skip:
                 error_msg = "%s rdepends on %s" % (pkg, rdepend)
                 sane = package_qa_handle_error("dev-deps", error_msg, d)
+            if rdepend not in packages:
+                rdep_data = oe.packagedata.read_subpkgdata(rdepend, d)
+                if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
+                    continue
+                if not rdep_data or not 'PN' in rdep_data:
+                    pkgdata_dir = d.getVar("PKGDATA_DIR", True)
+                    possibles = os.listdir("%s/runtime-rprovides/%s/" % (pkgdata_dir, rdepend))
+                    for p in possibles:
+                        rdep_data = oe.packagedata.read_subpkgdata(p, d)
+                        if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
+                            break
+                if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
+                    continue
+                error_msg = "%s rdepends on %s but its not a build dependency?" % (pkg, rdepend)
+                sane = package_qa_handle_error("build-deps", error_msg, d)
 
     return sane
 
@@ -825,6 +842,7 @@ def package_qa_check_deps(pkg, pkgdest, skip, d):
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     import subprocess
+    import oe.packagedata
 
     bb.note("DO PACKAGE QA")
 
@@ -875,6 +893,11 @@ python do_package_qa () {
     # The package name matches the [a-z0-9.+-]+ regular expression
     pkgname_pattern = re.compile("^[a-z0-9.+-]+$")
 
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    taskdeps = set()
+    for dep in taskdepdata:
+        taskdeps.add(taskdepdata[dep][0])
+
     g = globals()
     walk_sane = True
     rdepends_sane = True
@@ -905,7 +928,7 @@ python do_package_qa () {
         path = "%s/%s" % (pkgdest, package)
         if not package_qa_walk(path, warnchecks, errorchecks, skip, package, d):
             walk_sane  = False
-        if not package_qa_check_rdepends(package, pkgdest, skip, d):
+        if not package_qa_check_rdepends(package, pkgdest, skip, taskdeps, packages, d):
             rdepends_sane = False
         if not package_qa_check_deps(package, pkgdest, skip, d):
             deps_sane = False
@@ -920,7 +943,8 @@ python do_package_qa () {
     bb.note("DONE with PACKAGE QA")
 }
 
-addtask do_package_qa after do_package before do_build
+do_package_qa[rdeptask] = "do_packagedata"
+addtask do_package_qa after do_packagedata before do_build
 
 SSTATETASKS += "do_package_qa"
 do_package_qa[sstate-inputdirs] = ""
@@ -1043,6 +1067,8 @@ python () {
         for var in 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RCONFLICTS', 'RPROVIDES', 'RREPLACES', 'FILES', 'pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm', 'ALLOW_EMPTY':
             if d.getVar(var):
                 issues.append(var)
+    else:
+        d.setVarFlag('do_package_qa', 'rdeptask', '')
     for i in issues:
         package_qa_handle_error("pkgvarcheck", "%s: Variable %s is set as not being package specific, please fix this." % (d.getVar("FILE", True), i), d)
 }



