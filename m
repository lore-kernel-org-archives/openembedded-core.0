Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UBvLi-0004d1-5f for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 23:56:29 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r22Mj5Z4023667; Sat, 2 Mar 2013 22:47:24 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cvYYtufWo9FM; Sat,  2 Mar 2013 22:47:24 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r22MlFlj023857
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 2 Mar 2013 22:47:18 GMT
Message-ID: <1362263971.11004.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 02 Mar 2013 22:39:31 +0000
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Subject: [PATCH] package_rpm.bbclass: Optimise per file dependency handling
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
X-List-Received-Date: Sat, 02 Mar 2013 22:56:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently the process for injecting the per file rpm dependencies into
rpmbuild is painfully slow. Its done through the repeated execution of
a script which has to return the correct value in each case. This continual
execution means the CPU usage of rpmbuild is low.

This patch allows the option of collapsing the per file dependencies to
a per package basis and injecting them through the .spec file. This removes
the execution overhead and allows rpmbuild to run at 100% of cpu.

Ultimately it would be nice to inject the per file dependencies through
the .spec file however that is not currently possible.

Since few people use the per file dependency information, this patch
goes for the faster approach. It can be enabled if anyone needs it although
I'd mention that its being used to us as this code may well go away in
the future if nobody complains.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 697bb36..3ac379d 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -8,6 +8,10 @@ RPMBUILD="rpmbuild"
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 PKGWRITEDIRSRPM = "${DEPLOY_DIR}/sources/deploy-srpm"
 
+# Maintaining the perfile dependencies has singificant overhead when writing the 
+# packages. When set, this value merges them for efficiency.
+MERGEPERFILEDEPS = "1"
+
 #
 # Update the packages indexes ${DEPLOY_DIR_RPM}
 #
@@ -460,6 +464,78 @@ EOF
 	fi
 }
 
+# Construct per file dependencies file
+def write_rpm_perfiledata(srcname, d):
+    workdir = d.getVar('WORKDIR', True)
+    packages = d.getVar('PACKAGES', True)
+    pkgd = d.getVar('PKGD', True)
+
+    def dump_filerdeps(varname, outfile, d):
+        outfile.write("#!/usr/bin/env python\n\n")
+        outfile.write("# Dependency table\n")
+        outfile.write('deps = {\n')
+        for pkg in packages.split():
+            dependsflist_key = 'FILE' + varname + 'FLIST' + "_" + pkg
+            dependsflist = (d.getVar(dependsflist_key, True) or "")
+            for dfile in dependsflist.split():
+                key = "FILE" + varname + "_" + dfile + "_" + pkg
+                depends_dict = bb.utils.explode_dep_versions(d.getVar(key, True) or "")
+                file = dfile.replace("@underscore@", "_")
+                file = file.replace("@closebrace@", "]")
+                file = file.replace("@openbrace@", "[")
+                file = file.replace("@tab@", "\t")
+                file = file.replace("@space@", " ")
+                file = file.replace("@at@", "@")
+                outfile.write('"' + pkgd + file + '" : "')
+                for dep in depends_dict:
+                    ver = depends_dict[dep]
+                    if dep and ver:
+                        ver = ver.replace("(","")
+                        ver = ver.replace(")","")
+                        outfile.write(dep + " " + ver + " ")
+                    else:
+                        outfile.write(dep + " ")
+                outfile.write('",\n')
+        outfile.write('}\n\n')
+        outfile.write("import sys\n")
+        outfile.write("while 1:\n")
+        outfile.write("\tline = sys.stdin.readline().strip()\n")
+        outfile.write("\tif not line:\n")
+        outfile.write("\t\tsys.exit(0)\n")
+        outfile.write("\tif line in deps:\n")
+        outfile.write("\t\tprint(deps[line] + '\\n')\n")
+
+    # OE-core dependencies a.k.a. RPM requires
+    outdepends = workdir + "/" + srcname + ".requires"
+
+    try:
+        from __builtin__ import file
+        dependsfile = file(outdepends, 'w')
+    except OSError:
+        raise bb.build.FuncFailed("unable to open spec file for writing.")
+
+    dump_filerdeps('RDEPENDS', dependsfile, d)
+
+    dependsfile.close()
+    os.chmod(outdepends, 0755)
+
+    # OE-core / RPM Provides
+    outprovides = workdir + "/" + srcname + ".provides"
+
+    try:
+        from __builtin__ import file
+        providesfile = file(outprovides, 'w')
+    except OSError:
+        raise bb.build.FuncFailed("unable to open spec file for writing.")
+
+    dump_filerdeps('RPROVIDES', providesfile, d)
+
+    providesfile.close()
+    os.chmod(outprovides, 0755)
+
+    return (outdepends, outprovides)
+
+
 python write_specfile () {
     import textwrap
     import oe.packagedata
@@ -576,6 +652,17 @@ python write_specfile () {
         scr = scr[:pos] + 'if [ "$1" = "0" ] ; then\n' + scr[pos:] + '\nfi'
         return scr
 
+    def get_perfile(varname, pkg, d):
+        deps = []
+        dependsflist_key = 'FILE' + varname + 'FLIST' + "_" + pkg
+        dependsflist = (d.getVar(dependsflist_key, True) or "")
+        for dfile in dependsflist.split():
+            key = "FILE" + varname + "_" + dfile + "_" + pkg
+            depends = d.getVar(key, True)
+            if depends:
+                deps.append(depends)
+        return " ".join(deps)
+
     packages = d.getVar('PACKAGES', True)
     if not packages or packages == '':
         bb.debug(1, "No packages; nothing to do")
@@ -626,6 +713,8 @@ python write_specfile () {
     spec_files_top = []
     spec_files_bottom = []
 
+    perfiledeps = (d.getVar("MERGEPERFILEDEPS", True) or "0") == "0"
+
     for pkg in packages.split():
         localdata = bb.data.createCopy(d)
 
@@ -679,6 +768,12 @@ python write_specfile () {
         splitrprerm    = localdata.getVar('pkg_prerm', True)
         splitrpostrm   = localdata.getVar('pkg_postrm', True)
 
+
+        if not perfiledeps:
+            # Add in summary of per file dependencies
+            splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
+            splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
+
         # Gather special src/first package data
         if srcname == splitname:
             srcrdepends    = splitrdepends
@@ -977,69 +1072,9 @@ python do_package_rpm () {
     d.setVar('OUTSPECFILE', outspecfile)
     bb.build.exec_func('write_specfile', d)
 
-    # Construct per file dependencies file
-    def dump_filerdeps(varname, outfile, d):
-        outfile.write("#!/usr/bin/env python\n\n")
-        outfile.write("# Dependency table\n")
-        outfile.write('deps = {\n')
-        for pkg in packages.split():
-            dependsflist_key = 'FILE' + varname + 'FLIST' + "_" + pkg
-            dependsflist = (d.getVar(dependsflist_key, True) or "")
-            for dfile in dependsflist.split():
-                key = "FILE" + varname + "_" + dfile + "_" + pkg
-                depends_dict = bb.utils.explode_dep_versions(d.getVar(key, True) or "")
-                file = dfile.replace("@underscore@", "_")
-                file = file.replace("@closebrace@", "]")
-                file = file.replace("@openbrace@", "[")
-                file = file.replace("@tab@", "\t")
-                file = file.replace("@space@", " ")
-                file = file.replace("@at@", "@")
-                outfile.write('"' + pkgd + file + '" : "')
-                for dep in depends_dict:
-                    ver = depends_dict[dep]
-                    if dep and ver:
-                        ver = ver.replace("(","")
-                        ver = ver.replace(")","")
-                        outfile.write(dep + " " + ver + " ")
-                    else:
-                        outfile.write(dep + " ")
-                outfile.write('",\n')
-        outfile.write('}\n\n')
-        outfile.write("import sys\n")
-        outfile.write("while 1:\n")
-        outfile.write("\tline = sys.stdin.readline().strip()\n")
-        outfile.write("\tif not line:\n")
-        outfile.write("\t\tsys.exit(0)\n")
-        outfile.write("\tif line in deps:\n")
-        outfile.write("\t\tprint(deps[line] + '\\n')\n")
-
-    # OE-core dependencies a.k.a. RPM requires
-    outdepends = workdir + "/" + srcname + ".requires"
-
-    try:
-        from __builtin__ import file
-        dependsfile = file(outdepends, 'w')
-    except OSError:
-        raise bb.build.FuncFailed("unable to open spec file for writing.")
-
-    dump_filerdeps('RDEPENDS', dependsfile, d)
-
-    dependsfile.close()
-    os.chmod(outdepends, 0755)
-
-    # OE-core / RPM Provides
-    outprovides = workdir + "/" + srcname + ".provides"
-
-    try:
-        from __builtin__ import file
-        providesfile = file(outprovides, 'w')
-    except OSError:
-        raise bb.build.FuncFailed("unable to open spec file for writing.")
-
-    dump_filerdeps('RPROVIDES', providesfile, d)
-
-    providesfile.close()
-    os.chmod(outprovides, 0755)
+    perfiledeps = (d.getVar("MERGEPERFILEDEPS", True) or "0") == "0"
+    if perfiledeps:
+        outdepends, outprovides = write_rpm_perfiledata(srcname, d)
 
     # Setup the rpmbuild arguments...
     rpmbuild = d.getVar('RPMBUILD', True)
@@ -1062,8 +1097,12 @@ python do_package_rpm () {
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
     cmd = cmd + " --define '_use_internal_dependency_generator 0'"
-    cmd = cmd + " --define '__find_requires " + outdepends + "'"
-    cmd = cmd + " --define '__find_provides " + outprovides + "'"
+    if perfiledeps:
+        cmd = cmd + " --define '__find_requires " + outdepends + "'"
+        cmd = cmd + " --define '__find_provides " + outprovides + "'"
+    else:
+        cmd = cmd + " --define '__find_requires %{nil}'"
+        cmd = cmd + " --define '__find_provides %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"




