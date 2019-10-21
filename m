Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A78177F395
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 10:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 89A661832C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:37 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ICfQfh43yCUF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:35 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id B92051834B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 935781A06B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8727E1A06F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.130.9])
	by seth.se.axis.com (Postfix) with ESMTP id 7B8B52ED8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 7636440AB1; Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2019 12:30:32 +0200
Message-Id: <20191021103034.12200-7-olani@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191021103034.12200-1-olani@axis.com>
References: <20191021103034.12200-1-olani@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 7/9] package.bbclass: Use with to manage file handle lifetimes
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
X-List-Received-Date: Mon, 21 Oct 2019 10:30:37 -0000

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/classes/package.bbclass | 76 ++++++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 42 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d8bef3afb0..f955df1111 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -826,8 +826,9 @@ python fixup_perms () {
 
     # Now we actually load from the configuration files
     for conf in get_fs_perms_list(d).split():
-        if os.path.exists(conf):
-            f = open(conf)
+        if not os.path.exists(conf):
+            continue
+        with open(conf) as f:
             for line in f:
                 if line.startswith('#'):
                     continue
@@ -848,7 +849,6 @@ python fixup_perms () {
                         fs_perms_table[entry.path] = entry
                         if entry.path in fs_link_table:
                             fs_link_table.pop(entry.path)
-            f.close()
 
     # Debug -- list out in-memory table
     #for dir in fs_perms_table:
@@ -1424,10 +1424,9 @@ fi
     pkgdest = d.getVar('PKGDEST')
     pkgdatadir = d.getVar('PKGDESTWORK')
 
-    data_file = pkgdatadir + d.expand("/${PN}" )
-    f = open(data_file, 'w')
-    f.write("PACKAGES: %s\n" % packages)
-    f.close()
+    data_file = pkgdatadir + d.expand("/${PN}")
+    with open(data_file, 'w') as fd:
+        fd.write("PACKAGES: %s\n" % packages)
 
     pn = d.getVar('PN')
     global_variants = (d.getVar('MULTILIB_GLOBAL_VARIANTS') or "").split()
@@ -1778,21 +1777,20 @@ python package_do_shlibs() {
             bb.note("Renaming %s to %s" % (old, new))
             os.rename(old, new)
             pkgfiles[pkg].remove(old)
-	    
+
         shlibs_file = os.path.join(shlibswork_dir, pkg + ".list")
         if len(sonames):
-            fd = open(shlibs_file, 'w')
-            for s in sonames:
-                if s[0] in shlib_provider and s[1] in shlib_provider[s[0]]:
-                    (old_pkg, old_pkgver) = shlib_provider[s[0]][s[1]]
-                    if old_pkg != pkg:
-                        bb.warn('%s-%s was registered as shlib provider for %s, changing it to %s-%s because it was built later' % (old_pkg, old_pkgver, s[0], pkg, pkgver))
-                bb.debug(1, 'registering %s-%s as shlib provider for %s' % (pkg, pkgver, s[0]))
-                fd.write(s[0] + ':' + s[1] + ':' + s[2] + '\n')
-                if s[0] not in shlib_provider:
-                    shlib_provider[s[0]] = {}
-                shlib_provider[s[0]][s[1]] = (pkg, pkgver)
-            fd.close()
+            with open(shlibs_file, 'w') as fd:
+                for s in sonames:
+                    if s[0] in shlib_provider and s[1] in shlib_provider[s[0]]:
+                        (old_pkg, old_pkgver) = shlib_provider[s[0]][s[1]]
+                        if old_pkg != pkg:
+                            bb.warn('%s-%s was registered as shlib provider for %s, changing it to %s-%s because it was built later' % (old_pkg, old_pkgver, s[0], pkg, pkgver))
+                    bb.debug(1, 'registering %s-%s as shlib provider for %s' % (pkg, pkgver, s[0]))
+                    fd.write(s[0] + ':' + s[1] + ':' + s[2] + '\n')
+                    if s[0] not in shlib_provider:
+                        shlib_provider[s[0]] = {}
+                    shlib_provider[s[0]][s[1]] = (pkg, pkgver)
         if needs_ldconfig and use_ldconfig:
             bb.debug(1, 'adding ldconfig call to postinst for %s' % pkg)
             postinst = d.getVar('pkg_postinst_%s' % pkg)
@@ -1864,11 +1862,10 @@ python package_do_shlibs() {
         deps_file = os.path.join(pkgdest, pkg + ".shlibdeps")
         if os.path.exists(deps_file):
             os.remove(deps_file)
-        if len(deps):
-            fd = open(deps_file, 'w')
-            for dep in sorted(deps):
-                fd.write(dep + '\n')
-            fd.close()
+        if deps:
+            with open(deps_file, 'w') as fd:
+                for dep in sorted(deps):
+                    fd.write(dep + '\n')
 }
 
 python package_do_pkgconfig () {
@@ -1898,9 +1895,8 @@ python package_do_pkgconfig () {
                     pkgconfig_provided[pkg].append(name)
                     if not os.access(file, os.R_OK):
                         continue
-                    f = open(file, 'r')
-                    lines = f.readlines()
-                    f.close()
+                    with open(file, 'r') as f:
+                        lines = f.readlines()
                     for l in lines:
                         m = var_re.match(l)
                         if m:
@@ -1918,10 +1914,9 @@ python package_do_pkgconfig () {
     for pkg in packages.split():
         pkgs_file = os.path.join(shlibswork_dir, pkg + ".pclist")
         if pkgconfig_provided[pkg] != []:
-            f = open(pkgs_file, 'w')
-            for p in pkgconfig_provided[pkg]:
-                f.write('%s\n' % p)
-            f.close()
+            with open(pkgs_file, 'w') as f:
+                for p in pkgconfig_provided[pkg]:
+                    f.write('%s\n' % p)
 
     # Go from least to most specific since the last one found wins
     for dir in reversed(shlibs_dirs):
@@ -1931,9 +1926,8 @@ python package_do_pkgconfig () {
             m = re.match(r'^(.*)\.pclist$', file)
             if m:
                 pkg = m.group(1)
-                fd = open(os.path.join(dir, file))
-                lines = fd.readlines()
-                fd.close()
+                with open(os.path.join(dir, file)) as fd:
+                    lines = fd.readlines()
                 pkgconfig_provided[pkg] = []
                 for l in lines:
                     pkgconfig_provided[pkg].append(l.rstrip())
@@ -1951,10 +1945,9 @@ python package_do_pkgconfig () {
                 bb.note("couldn't find pkgconfig module '%s' in any package" % n)
         deps_file = os.path.join(pkgdest, pkg + ".pcdeps")
         if len(deps):
-            fd = open(deps_file, 'w')
-            for dep in deps:
-                fd.write(dep + '\n')
-            fd.close()
+            with open(deps_file, 'w') as fd:
+                for dep in deps:
+                    fd.write(dep + '\n')
 }
 
 def read_libdep_files(d):
@@ -1965,9 +1958,8 @@ def read_libdep_files(d):
         for extension in ".shlibdeps", ".pcdeps", ".clilibdeps":
             depsfile = d.expand("${PKGDEST}/" + pkg + extension)
             if os.access(depsfile, os.R_OK):
-                fd = open(depsfile)
-                lines = fd.readlines()
-                fd.close()
+                with open(depsfile) as fd:
+                    lines = fd.readlines()
                 for l in lines:
                     l.rstrip()
                     deps = bb.utils.explode_dep_versions2(l)
-- 
2.11.0


