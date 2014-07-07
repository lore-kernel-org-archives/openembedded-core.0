Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 109D0701D6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 17:41:11 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s67Hf6bl008526 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Jul 2014 18:41:07 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TvSKmrWN16BK
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 18:41:06 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s67Hf0kQ008516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Jul 2014 18:41:02 +0100
Message-ID: <1404754855.1458.45.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 07 Jul 2014 18:40:55 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH RFC 4/4] package.bbclass: Rewrite shlib_provider handling to include RPATH
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
X-List-Received-Date: Mon, 07 Jul 2014 17:41:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Change the do_package shlibs code to account for RPATHS. This means that
for library dependency purposes, only libraries in system paths or in
any declared RPATH will be seen. This is important to resolve problems
people have been having where similarly named libraries in "private"
paths were conflicting, e.g. with gstreamer.

For now this code assumes the default search path is libdir and
base_libdir and places ASSUME_SHLIBS in libdir so they are searched by
default.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d7de72b..988e148 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1375,7 +1375,9 @@ python package_do_shlibs() {
                     fd.close()
                     for l in lines:
                         s = l.strip().split(":")
-                        shlib_provider[s[0]] = (dep_pkg, s[2])
+                        if s[0] not in shlib_provider:
+                            shlib_provider[s[0]] = {}
+                        shlib_provider[s[0]][s[1]] = (dep_pkg, s[2])
 
     def linux_so(file, needed, sonames, renames, pkgver):
         needs_ldconfig = False
@@ -1518,13 +1520,15 @@ python package_do_shlibs() {
         if len(sonames):
             fd = open(shlibs_file, 'w')
             for s in sonames:
-                if s[0] in shlib_provider:
-                    (old_pkg, old_pkgver) = shlib_provider[s[0]]
+                if s[0] in shlib_provider and s[1] in shlib_provider[s[0]]:
+                    (old_pkg, old_pkgver) = shlib_provider[s[0]][s[1]]
                     if old_pkg != pkg:
                         bb.warn('%s-%s was registered as shlib provider for %s, changing it to %s-%s because it was built later' % (old_pkg, old_pkgver, s[0], pkg, pkgver))
                 bb.debug(1, 'registering %s-%s as shlib provider for %s' % (pkg, pkgver, s[0]))
                 fd.write(s[0] + ':' + s[1] + ':' + s[2] + '\n')
-                shlib_provider[s[0]] = (pkg, pkgver)
+                if s[0] not in shlib_provider:
+                    shlib_provider[s[0]] = {}
+                shlib_provider[s[0]][s[1]] = (pkg, pkgver)
             fd.close()
         if needs_ldconfig and use_ldconfig:
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
@@ -1539,6 +1543,7 @@ python package_do_shlibs() {
 
     assumed_libs = d.getVar('ASSUME_SHLIBS', True)
     if assumed_libs:
+        libdir = d.getVar("libdir", True)
         for e in assumed_libs.split():
             l, dep_pkg = e.split(":")
             lib_ver = None
@@ -1546,7 +1551,9 @@ python package_do_shlibs() {
             if len(dep_pkg) == 2:
                 lib_ver = dep_pkg[1]
             dep_pkg = dep_pkg[0]
-            shlib_provider[l] = (dep_pkg, lib_ver)
+            shlib_provider[l][libdir] = (dep_pkg, lib_ver)
+
+    libsearchpath = [d.getVar('libdir', True), d.getVar('base_libdir', True)]
 
     for pkg in packages.split():
         bb.debug(2, "calculating shlib requirements for %s" % pkg)
@@ -1562,21 +1569,27 @@ python package_do_shlibs() {
                 bb.debug(2, '%s: Dependency %s covered by PRIVATE_LIBS' % (pkg, n[0]))
                 continue
             if n[0] in shlib_provider.keys():
-                (dep_pkg, ver_needed) = shlib_provider[n[0]]
+                match = None
+                for p in n[2] + libsearchpath:
+                    if p in shlib_provider[n[0]]:
+                        match = p
+                        break
+                if match:
+                    (dep_pkg, ver_needed) = shlib_provider[n[0]][match]
 
-                bb.debug(2, '%s: Dependency %s requires package %s (used by files: %s)' % (pkg, n[0], dep_pkg, n[1]))
+                    bb.debug(2, '%s: Dependency %s requires package %s (used by files: %s)' % (pkg, n[0], dep_pkg, n[1]))
 
-                if dep_pkg == pkg:
-                    continue
+                    if dep_pkg == pkg:
+                        continue
 
-                if ver_needed:
-                    dep = "%s (>= %s)" % (dep_pkg, ver_needed)
-                else:
-                    dep = dep_pkg
-                if not dep in deps:
-                    deps.append(dep)
-            else:
-                bb.note("Couldn't find shared library provider for %s, used by files: %s" % (n[0], n[1]))
+                    if ver_needed:
+                        dep = "%s (>= %s)" % (dep_pkg, ver_needed)
+                    else:
+                        dep = dep_pkg
+                    if not dep in deps:
+                        deps.append(dep)
+                    continue
+            bb.note("Couldn't find shared library provider for %s, used by files: %s" % (n[0], n[1]))
 
         deps_file = os.path.join(pkgdest, pkg + ".shlibdeps")
         if os.path.exists(deps_file):




