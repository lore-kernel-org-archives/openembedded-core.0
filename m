Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 670AC701D6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 17:41:17 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s67HfDSR008531 for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Jul 2014 18:41:13 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id M5y47ieHD-9q
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 18:41:13 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s67Hf8j3008523
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Jul 2014 18:41:09 +0100
Message-ID: <1404754863.1458.46.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 07 Jul 2014 18:41:03 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH RFC 3/4] package.bbclass: Improve shlibs pkgdata file format
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
X-List-Received-Date: Mon, 07 Jul 2014 17:41:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Instead of having a .list file and a .ver file, place the version
information into the .list file in a ":" delimited string.

Also place the path to the library here, this can then be used to
evaluate RPATHs in the shlib dependency code.

Since the disk format has changed, the easiest way to avoid build
failures in the same TMPDIR is to change the shlibs directory to
shlibs2. sstate dependency code with ensure everything rebuilds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index bc91e9f..d7de72b 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1326,8 +1326,8 @@ python package_do_filedeps() {
         d.setVar("FILERPROVIDESFLIST_" + pkg, " ".join(provides_files[pkg]))
 }
 
-SHLIBSDIRS = "${PKGDATA_DIR}/${MLPREFIX}shlibs"
-SHLIBSWORKDIR = "${PKGDESTWORK}/${MLPREFIX}shlibs"
+SHLIBSDIRS = "${PKGDATA_DIR}/${MLPREFIX}shlibs2"
+SHLIBSWORKDIR = "${PKGDESTWORK}/${MLPREFIX}shlibs2"
 
 python package_do_shlibs() {
     import re, pipes
@@ -1373,16 +1373,11 @@ python package_do_shlibs() {
                     fd = open(os.path.join(dir, file))
                     lines = fd.readlines()
                     fd.close()
-                    ver_file = os.path.join(dir, dep_pkg + '.ver')
-                    lib_ver = None
-                    if os.path.exists(ver_file):
-                        fd = open(ver_file)
-                        lib_ver = fd.readline().rstrip()
-                        fd.close()
                     for l in lines:
-                        shlib_provider[l.rstrip()] = (dep_pkg, lib_ver)
+                        s = l.strip().split(":")
+                        shlib_provider[s[0]] = (dep_pkg, s[2])
 
-    def linux_so(file, needed, sonames, renames):
+    def linux_so(file, needed, sonames, renames, pkgver):
         needs_ldconfig = False
         ldir = os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
         cmd = d.getVar('OBJDUMP', True) + " -p " + pipes.quote(file) + " 2>/dev/null"
@@ -1404,7 +1399,7 @@ python package_do_shlibs() {
             m = re.match("\s+SONAME\s+([^\s]*)", l)
             if m:
                 this_soname = m.group(1)
-                prov = (this_soname, ldir)
+                prov = (this_soname, ldir, pkgver)
                 if not prov in sonames:
                     # if library is private (only used by package) then do not build shlib for it
                     if not private_libs or this_soname not in private_libs:
@@ -1415,7 +1410,7 @@ python package_do_shlibs() {
                     renames.append((file, os.path.join(os.path.dirname(file), this_soname)))
         return needs_ldconfig
 
-    def darwin_so(file, needed, sonames, renames):
+    def darwin_so(file, needed, sonames, renames, pkgver):
         if not os.path.exists(file):
             return
         ldir = os.path.dirname(file).replace(pkgdest, '')
@@ -1440,7 +1435,7 @@ python package_do_shlibs() {
             combos = get_combinations(name)
             for combo in combos:
                 if not combo in sonames:
-                    prov = (combo, ldir)
+                    prov = (combo, ldir, pkgver)
                     sonames.append(prov)
         if file.endswith('.dylib') or file.endswith('.so'):
             lafile = file.replace(os.path.join(pkgdest, pkg), d.getVar('PKGD', True))
@@ -1510,9 +1505,9 @@ python package_do_shlibs() {
                 if cpath.islink(file):
                     continue
                 if targetos == "darwin" or targetos == "darwin8":
-                    darwin_so(file, needed, sonames, renames)
+                    darwin_so(file, needed, sonames, renames, pkgver)
                 elif os.access(file, os.X_OK) or lib_re.match(file):
-                    ldconfig = linux_so(file, needed, sonames, renames)
+                    ldconfig = linux_so(file, needed, sonames, renames, pkgver)
                     needs_ldconfig = needs_ldconfig or ldconfig
         for (old, new) in renames:
             bb.note("Renaming %s to %s" % (old, new))
@@ -1520,7 +1515,6 @@ python package_do_shlibs() {
             pkgfiles[pkg].remove(old)
 	    
         shlibs_file = os.path.join(shlibswork_dir, pkg + ".list")
-        shver_file = os.path.join(shlibswork_dir, pkg + ".ver")
         if len(sonames):
             fd = open(shlibs_file, 'w')
             for s in sonames:
@@ -1529,12 +1523,9 @@ python package_do_shlibs() {
                     if old_pkg != pkg:
                         bb.warn('%s-%s was registered as shlib provider for %s, changing it to %s-%s because it was built later' % (old_pkg, old_pkgver, s[0], pkg, pkgver))
                 bb.debug(1, 'registering %s-%s as shlib provider for %s' % (pkg, pkgver, s[0]))
-                fd.write(s[0] + '\n')
+                fd.write(s[0] + ':' + s[1] + ':' + s[2] + '\n')
                 shlib_provider[s[0]] = (pkg, pkgver)
             fd.close()
-            fd = open(shver_file, 'w')
-            fd.write(pkgver + '\n')
-            fd.close()
         if needs_ldconfig and use_ldconfig:
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
             postinst = d.getVar('pkg_postinst_%s' % pkg, True)



