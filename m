Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F38456FE5B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 08:48:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s728mZAO005871 for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Aug 2014 09:48:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rDs_oclB-PIr
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 09:48:35 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s728mV2U005698
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Aug 2014 09:48:33 +0100
Message-ID: <1406969311.6981.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 02 Aug 2014 09:48:31 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] package: Convert dylib handling from .la to otool
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
X-List-Received-Date: Sat, 02 Aug 2014 08:48:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, the darwin shlibs detection is done by parsing the .la file
dependency fields. This is very old code and is incomplete in some
cases so convert to using otool -l and otool -L to correctly load
the rpath and dependency information.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index fbdccfb..97a92ef 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1350,6 +1350,7 @@ SHLIBSWORKDIR = "${PKGDESTWORK}/${MLPREFIX}shlibs2"
 
 python package_do_shlibs() {
     import re, pipes
+    import subprocess as sub
 
     exclude_shlibs = d.getVar('EXCLUDE_FROM_SHLIBS', 0)
     if exclude_shlibs:
@@ -1459,38 +1460,27 @@ python package_do_shlibs() {
                     prov = (combo, ldir, pkgver)
                     sonames.append(prov)
         if file.endswith('.dylib') or file.endswith('.so'):
-            lafile = file.replace(os.path.join(pkgdest, pkg), d.getVar('PKGD', True))
-            # Drop suffix
-            lafile = lafile.rsplit(".",1)[0]
-            lapath = os.path.dirname(lafile)
-            lafile = os.path.basename(lafile)
-            # Find all combinations
-            combos = get_combinations(lafile)
-            for combo in combos:
-                if os.path.exists(lapath + '/' + combo + '.la'):
-                    break
-            lafile = lapath + '/' + combo + '.la'
-
-            #bb.note("Foo2: %s" % lafile)
-            #bb.note("Foo %s" % file)
-            if os.path.exists(lafile):
-                fd = open(lafile, 'r')
-                lines = fd.readlines()
-                fd.close()
-                for l in lines:
-                    m = re.match("\s*dependency_libs=\s*'(.*)'", l)
-                    if m:
-                        deps = m.group(1).split(" ")
-                        for dep in deps:
-                            #bb.note("Trying %s for %s" % (dep, pkg))
-                            name = None
-                            if dep.endswith(".la"):
-                                name = os.path.basename(dep).replace(".la", "")
-                            elif dep.startswith("-l"):
-                                name = dep.replace("-l", "lib")
-                            if name and name not in needed[pkg]:
-                                needed[pkg].append((name, lafile, []))
-                                #bb.note("Adding %s for %s" % (name, pkg))
+            rpath = []
+            p = sub.Popen([d.expand("${HOST_PREFIX}otool"), '-l', file],stdout=sub.PIPE,stderr=sub.PIPE)
+            err, out = p.communicate()
+            # If returned succesfully, process stderr for results
+            if p.returncode == 0:
+                for l in err.split("\n"):
+                    l = l.strip()
+                    if l.startswith('path '):
+                        rpath.append(l.split()[1])
+
+            p = sub.Popen([d.expand("${HOST_PREFIX}otool"), '-L', file],stdout=sub.PIPE,stderr=sub.PIPE)
+            err, out = p.communicate()
+            # If returned succesfully, process stderr for results
+            if p.returncode == 0:
+                for l in err.split("\n"):
+                    l = l.strip()
+                    if not l or l.endswith(":"):
+                        continue
+                    name = os.path.basename(l.split()[0]).rsplit(".", 1)[0]
+                    if name and name not in needed[pkg]:
+                         needed[pkg].append((name, file, []))
 
     if d.getVar('PACKAGE_SNAP_LIB_SYMLINKS', True) == "1":
         snap_symlinks = True



