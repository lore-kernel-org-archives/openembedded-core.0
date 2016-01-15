Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C1E7F6FF01
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 12:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FCP5VY019888 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 12:25:05 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id N0-ZWeFW87k3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 12:25:04 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FCP1PW019885
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 12:25:02 GMT
Message-ID: <1452860701.28375.149.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jan 2016 12:25:01 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] insane: Clean up horrible return value processing code
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
X-List-Received-Date: Fri, 15 Jan 2016 12:25:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Whilst in theory return values are nice, handling the complex aggregation
of the return values is ugly. The code already uses QA_SANE as a marker
to signal problems. Whilst that isn't as idealistic, it makes the code
massively cleaner, so rely on this instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index ba9c651..acf8639 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -779,15 +779,12 @@ def package_qa_walk(path, warnfuncs, errorfuncs, skip, package, d):
     for e in errors:
         package_qa_handle_error(e, errors[e], d)
 
-    return len(errors) == 0
-
 def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
     # Don't do this check for kernel/module recipes, there aren't too many debug/development
     # packages and you can get false positives e.g. on kernel-module-lirc-dev
     if bb.data.inherits_class("kernel", d) or bb.data.inherits_class("module-base", d):
-        return True
+        return
 
-    sane = True
     if not "-dbg" in pkg and not "packagegroup-" in pkg and not "-image" in pkg:
         localdata = bb.data.createCopy(d)
         localdata.setVar('OVERRIDES', pkg)
@@ -801,10 +798,10 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
             for rdepend in rdepends:
                 if "-dbg" in rdepend and "debug-deps" not in skip:
                     error_msg = "%s rdepends on %s" % (pkg,rdepend)
-                    sane = package_qa_handle_error("debug-deps", error_msg, d)
+                    package_qa_handle_error("debug-deps", error_msg, d)
                 if (not "-dev" in pkg and not "-staticdev" in pkg) and rdepend.endswith("-dev") and "dev-deps" not in skip:
                     error_msg = "%s rdepends on %s" % (pkg, rdepend)
-                    sane = package_qa_handle_error("dev-deps", error_msg, d)
+                    package_qa_handle_error("dev-deps", error_msg, d)
                 if rdepend not in packages:
                     rdep_data = oe.packagedata.read_subpkgdata(rdepend, d)
                     if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
@@ -822,7 +819,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                     if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
                         continue
                     error_msg = "%s rdepends on %s, but it isn't a build dependency?" % (pkg, rdepend)
-                    sane = package_qa_handle_error("build-deps", error_msg, d)
+                    package_qa_handle_error("build-deps", error_msg, d)
 
         if "file-rdeps" not in skip:
             ignored_file_rdeps = set(['/bin/sh', '/usr/bin/env', 'rtld(GNU_HASH)'])
@@ -889,19 +886,15 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                 for key in filerdepends:
                     error_msg = "%s contained in package %s requires %s, but no providers found in its RDEPENDS" % \
                             (filerdepends[key],pkg, key)
-                sane = package_qa_handle_error("file-rdeps", error_msg, d)
-
-    return sane
+                package_qa_handle_error("file-rdeps", error_msg, d)
 
 def package_qa_check_deps(pkg, pkgdest, skip, d):
-    sane = True
 
     localdata = bb.data.createCopy(d)
     localdata.setVar('OVERRIDES', pkg)
     bb.data.update_data(localdata)
 
     def check_valid_deps(var):
-        sane = True
         try:
             rvar = bb.utils.explode_dep_versions2(localdata.getVar(var, True) or "")
         except ValueError as e:
@@ -910,24 +903,14 @@ def package_qa_check_deps(pkg, pkgdest, skip, d):
             for v in rvar[dep]:
                 if v and not v.startswith(('< ', '= ', '> ', '<= ', '>=')):
                     error_msg = "%s_%s is invalid: %s (%s)   only comparisons <, =, >, <=, and >= are allowed" % (var, pkg, dep, v)
-                    sane = package_qa_handle_error("dep-cmp", error_msg, d)
-        return sane
-
-    sane = True
-    if not check_valid_deps('RDEPENDS'):
-        sane = False
-    if not check_valid_deps('RRECOMMENDS'):
-        sane = False
-    if not check_valid_deps('RSUGGESTS'):
-        sane = False
-    if not check_valid_deps('RPROVIDES'):
-        sane = False
-    if not check_valid_deps('RREPLACES'):
-        sane = False
-    if not check_valid_deps('RCONFLICTS'):
-        sane = False
+                    package_qa_handle_error("dep-cmp", error_msg, d)
 
-    return sane
+    check_valid_deps('RDEPENDS'):
+    check_valid_deps('RRECOMMENDS'):
+    check_valid_deps('RSUGGESTS'):
+    check_valid_deps('RPROVIDES'):
+    check_valid_deps('RREPLACES'):
+    check_valid_deps('RCONFLICTS'):
 
 QAPATHTEST[expanded-d] = "package_qa_check_expanded_d"
 def package_qa_check_expanded_d(path,name,d,elf,messages):
@@ -1072,9 +1055,6 @@ python do_package_qa () {
         taskdeps.add(taskdepdata[dep][0])
 
     g = globals()
-    walk_sane = True
-    rdepends_sane = True
-    deps_sane = True
     for package in packages:
         skip = (d.getVar('INSANE_SKIP_' + package, True) or "").split()
         if skip:
@@ -1099,19 +1079,16 @@ python do_package_qa () {
                     "%s doesn't match the [a-z0-9.+-]+ regex" % package, d)
 
         path = "%s/%s" % (pkgdest, package)
-        if not package_qa_walk(path, warnchecks, errorchecks, skip, package, d):
-            walk_sane  = False
-        if not package_qa_check_rdepends(package, pkgdest, skip, taskdeps, packages, d):
-            rdepends_sane = False
-        if not package_qa_check_deps(package, pkgdest, skip, d):
-            deps_sane = False
+        package_qa_walk(path, warnchecks, errorchecks, skip, package, d)
 
+        package_qa_check_rdepends(package, pkgdest, skip, taskdeps, packages, d):
+        package_qa_check_deps(package, pkgdest, skip, d):
 
     if 'libdir' in d.getVar("ALL_QA", True).split():
         package_qa_check_libdir(d)
 
     qa_sane = d.getVar("QA_SANE", True)
-    if not walk_sane or not rdepends_sane or not deps_sane or not qa_sane:
+    if not qa_sane:
         bb.fatal("QA run found fatal errors. Please consider fixing them.")
     bb.note("DONE with PACKAGE QA")
 }



