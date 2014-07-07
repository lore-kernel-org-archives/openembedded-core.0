Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9A7C37036E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 17:41:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s67HfZFj008540 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Jul 2014 18:41:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pFWybmzJif8k
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 18:41:35 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s67HfTFV008536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Jul 2014 18:41:30 +0100
Message-ID: <1404754883.1458.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 07 Jul 2014 18:41:23 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH RFC 1/4] package.bbclass: Improve shlibs needed data structure
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
X-List-Received-Date: Mon, 07 Jul 2014 17:41:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Improve the shlibs 'needed' data structure to include the file and
any rpath information. This allows various cleanups to the data structure
and moves us closer to being able to resolve shlibs providers issues
based on path in due course.

This commit doesn't change any stored data, just cleans up internal data
structures (for example dropping the needed_from dict).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ea75918..1ef0c66 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1382,20 +1382,25 @@ python package_do_shlibs() {
                     for l in lines:
                         shlib_provider[l.rstrip()] = (dep_pkg, lib_ver)
 
-    def linux_so(file):
+    def linux_so(file, needed, sonames, renames):
         needs_ldconfig = False
+        ldir = os.path.dirname(file).replace(pkgdest, '')
         cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(file) + " 2>/dev/null"
         fd = os.popen(cmd)
         lines = fd.readlines()
         fd.close()
+        rpath = []
+        for l in lines:
+            m = re.match("\s+RPATH\s+([^\s]*)", l)
+            if m:
+                rpaths = m.group(1).replace("$ORIGIN", ldir).split(":")
+                rpath = map(os.path.normpath, rpaths)
         for l in lines:
             m = re.match("\s+NEEDED\s+([^\s]*)", l)
             if m:
-                if m.group(1) not in needed[pkg]:
-                    needed[pkg].append(m.group(1))
-                if m.group(1) not in needed_from:
-                    needed_from[m.group(1)] = []
-                needed_from[m.group(1)].append(file)
+                dep = m.group(1)
+                if dep not in needed[pkg]:
+                    needed[pkg].append((dep, file, rpath))
             m = re.match("\s+SONAME\s+([^\s]*)", l)
             if m:
                 this_soname = m.group(1)
@@ -1409,7 +1414,7 @@ python package_do_shlibs() {
                     renames.append((file, os.path.join(os.path.dirname(file), this_soname)))
         return needs_ldconfig
 
-    def darwin_so(file):
+    def darwin_so(file, needed, sonames, renames):
         if not os.path.exists(file):
             return
 
@@ -1464,14 +1469,8 @@ python package_do_shlibs() {
                                 name = os.path.basename(dep).replace(".la", "")
                             elif dep.startswith("-l"):
                                 name = dep.replace("-l", "lib")
-                            if pkg not in needed:
-                                needed[pkg] = []
                             if name and name not in needed[pkg]:
-                                needed[pkg].append(name)
-                            if name not in needed_from:
-                                needed_from[name] = []
-                            if lafile and lafile not in needed_from[name]:
-                                needed_from[name].append(lafile)
+                                needed[pkg].append((name, lafile, []))
                                 #bb.note("Adding %s for %s" % (name, pkg))
 
     if d.getVar('PACKAGE_SNAP_LIB_SYMLINKS', True) == "1":
@@ -1485,7 +1484,6 @@ python package_do_shlibs() {
         use_ldconfig = False
 
     needed = {}
-    needed_from = {}
     shlib_provider = {}
     read_shlib_providers()
 
@@ -1509,9 +1507,9 @@ python package_do_shlibs() {
                 if cpath.islink(file):
                     continue
                 if targetos == "darwin" or targetos == "darwin8":
-                    darwin_so(file)
+                    darwin_so(file, needed, sonames, renames)
                 elif os.access(file, os.X_OK) or lib_re.match(file):
-                    ldconfig = linux_so(file)
+                    ldconfig = linux_so(file, needed, sonames, renames)
                     needs_ldconfig = needs_ldconfig or ldconfig
         for (old, new) in renames:
             bb.note("Renaming %s to %s" % (old, new))
@@ -1567,12 +1565,12 @@ python package_do_shlibs() {
             # but skipping it is still better alternative than providing own
             # version and then adding runtime dependency for the same system library
             if private_libs and n in private_libs:
-                bb.debug(2, '%s: Dependency %s covered by PRIVATE_LIBS' % (pkg, n))
+                bb.debug(2, '%s: Dependency %s covered by PRIVATE_LIBS' % (pkg, n[0]))
                 continue
-            if n in shlib_provider.keys():
-                (dep_pkg, ver_needed) = shlib_provider[n]
+            if n[0] in shlib_provider.keys():
+                (dep_pkg, ver_needed) = shlib_provider[n[0]]
 
-                bb.debug(2, '%s: Dependency %s requires package %s (used by files: %s)' % (pkg, n, dep_pkg, needed_from[n]))
+                bb.debug(2, '%s: Dependency %s requires package %s (used by files: %s)' % (pkg, n[0], dep_pkg, n[1]))
 
                 if dep_pkg == pkg:
                     continue
@@ -1584,7 +1582,7 @@ python package_do_shlibs() {
                 if not dep in deps:
                     deps.append(dep)
             else:
-                bb.note("Couldn't find shared library provider for %s, used by files: %s" % (n, needed_from[n]))
+                bb.note("Couldn't find shared library provider for %s, used by files: %s" % (n[0], n[1]))
 
         deps_file = os.path.join(pkgdest, pkg + ".shlibdeps")
         if os.path.exists(deps_file):



