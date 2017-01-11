Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BEAB971A5E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 01:44:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0B1iVmp018355
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Jan 2017 17:44:32 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 10 Jan 2017 17:44:31 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2017 20:44:28 -0500
Message-ID: <d4f993e17790a2ed2a1c15b4e549eb33393bfaa9.1484098871.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1484098871.git.dengke.du@windriver.com>
References: <cover.1484098871.git.dengke.du@windriver.com>
MIME-Version: 1.0
Cc: randy.e.witt@intel.com
Subject: [PATCH 1/1] Fix RPM backend does not honor package overrides for PACKAGE_ARCH
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
X-List-Received-Date: Wed, 11 Jan 2017 01:44:32 -0000
Content-Type: text/plain

If we use a package overrides as part of PACKAGE_ARCH when using the rpm
backend, The override is not honored.

For example, we use the Randy Witt's attachment, we can get it from:

	https://bugzilla.yoctoproject.org/show_bug.cgi?id=7984

Using the attached recipe, the package "package-b" would be have architecture
of "all" in the rpm metadata, but for the subpackages rpm program only support
"noarch" , so at this time we set it to "noarch", after we build it, however
it ends up being equal to the default. i.e. TUNE_PKGARCH, but it does not occur
when using ipk and deb.

This is because when using ipk and deb, the packages were builded one by one,
but when using rpm, the packages were builded form only one spec file, that is
to say the building only occur once, and all the packages' arch was set to the
default: TUNE_PKGARCH.

The solution is that we need to check the extra arch of packages, and build them
individually.

[YOCTO #7984]

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/classes/package_rpm.bbclass | 202 ++++++++++++++++++++++++++-------------
 1 file changed, 134 insertions(+), 68 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 638cc1b..629ce31 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -269,7 +269,23 @@ python write_specfile () {
         else:
             spec_preamble.append('%s' % textwrap.fill(dedent_text, width=75))
 
-    packages = d.getVar('PACKAGES')
+    # The "PACKAGE_HAVE_EXTRA_ARCH" have been set in function do_package_rpm
+    # If the subpackages have extra arch, the arch variable have been set in "PACKAGE_HAVE_EXTRA_ARCH"
+    # If "PACKAGE_HAVE_EXTRA_ARCH" was set, build rpm for the subpackages that have extra arch
+    # If "PACKAGE_HAVE_EXTRA_ARCH" was not set, remove the subpackages that have extra arch from the "PACKAGES", and then build
+    # rpm for the remaining subpackages.
+    package_extra_arch = d.getVar('PACKAGE_HAVE_EXTRA_ARCH', True)
+    packages = ""
+    if not package_extra_arch:
+        packages_tmp = d.getVar('PACKAGES', True)
+        need_remove_pkg = d.getVar('REMOVE_EXTRA_ARCH_PKG', True)
+        list_pkg_tmp = packages_tmp.split()
+        for pkg in need_remove_pkg:
+            list_pkg_tmp.remove(pkg)
+        packages = ' '.join(list_pkg_tmp)
+    else:
+        packages = package_extra_arch
+
     if not packages or packages == '':
         bb.debug(1, "No packages; nothing to do")
         return
@@ -657,6 +673,23 @@ python do_package_rpm () {
             return "".join(name.split(ml))
         return name
 
+    # When generating rpm packages, the packages arch was default to TUNE_PKGARCH.
+    # But sometime some packages' arch maybe overrides as part of PACKAGE_ARCH,
+    # for example set one package's arch to "noarch".
+    # The following function was to check extra arch for packages, and return the 
+    # "package:arch" pairs which package in pair has different arch from the default.
+    def check_extra_package_arch(packages, d):
+        arch_main = d.getVar('PACKAGE_ARCH', True)
+        diff_arch = {}
+        for pkg in packages.split():
+            localdata = bb.data.createCopy(d)
+            localdata.setVar('OVERRIDES', d.getVar('OVERRIDES', False) + ":" + pkg)
+            bb.data.update_data(localdata)
+            arch_pkg = localdata.getVar('PACKAGE_ARCH', True)
+            if arch_pkg != arch_main:
+                diff_arch[pkg] = arch_pkg
+        return diff_arch
+
     workdir = d.getVar('WORKDIR')
     tmpdir = d.getVar('TMPDIR')
     pkgd = d.getVar('PKGD')
@@ -670,73 +703,106 @@ python do_package_rpm () {
         bb.debug(1, "No packages; nothing to do")
         return
 
-    # Construct the spec file...
-    # If the spec file already exist, and has not been stored into 
-    # pseudo's files.db, it maybe cause rpmbuild src.rpm fail,
-    # so remove it before doing rpmbuild src.rpm.
-    srcname    = strip_multilib(d.getVar('PN'), d)
-    outspecfile = workdir + "/" + srcname + ".spec"
-    if os.path.isfile(outspecfile):
-        os.remove(outspecfile)
-    d.setVar('OUTSPECFILE', outspecfile)
-    bb.build.exec_func('write_specfile', d)
-
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
-    if perfiledeps:
-        outdepends, outprovides = write_rpm_perfiledata(srcname, d)
-
-    # Setup the rpmbuild arguments...
-    rpmbuild = d.getVar('RPMBUILD')
-    targetsys = d.getVar('TARGET_SYS')
-    targetvendor = d.getVar('HOST_VENDOR')
-    package_arch = (d.getVar('PACKAGE_ARCH') or "").replace("-", "_")
-    sdkpkgsuffix = (d.getVar('SDKPKGSUFFIX') or "nativesdk").replace("-", "_")
-    if package_arch not in "all any noarch".split() and not package_arch.endswith(sdkpkgsuffix):
-        ml_prefix = (d.getVar('MLPREFIX') or "").replace("-", "_")
-        d.setVar('PACKAGE_ARCH_EXTEND', ml_prefix + package_arch)
-    else:
-        d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
-    pkgwritedir = d.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}')
-    d.setVar('RPM_PKGWRITEDIR', pkgwritedir)
-    bb.debug(1, 'PKGWRITEDIR: %s' % d.getVar('RPM_PKGWRITEDIR'))
-    pkgarch = d.expand('${PACKAGE_ARCH_EXTEND}${HOST_VENDOR}-${HOST_OS}')
-    magicfile = d.expand('${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc')
-    bb.utils.mkdirhier(pkgwritedir)
-    os.chmod(pkgwritedir, 0o755)
-
-    cmd = rpmbuild
-    cmd = cmd + " --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
-    cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
-    cmd = cmd + " --define '_builddir " + d.getVar('S') + "'"
-    cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
-    cmd = cmd + " --define '_use_internal_dependency_generator 0'"
-    if perfiledeps:
-        cmd = cmd + " --define '__find_requires " + outdepends + "'"
-        cmd = cmd + " --define '__find_provides " + outprovides + "'"
-    else:
-        cmd = cmd + " --define '__find_requires %{nil}'"
-        cmd = cmd + " --define '__find_provides %{nil}'"
-    cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
-    cmd = cmd + " --define 'debug_package %{nil}'"
-    cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
-    cmd = cmd + " --define '_tmppath " + workdir + "'"
-    if d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and bb.data.inherits_class('archiver', d):
-        cmd = cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTDIR') + "'"
-        cmdsrpm = cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_OUTDIR') + "'"
-        cmdsrpm = cmdsrpm + " -bs " + outspecfile
-        # Build the .src.rpm
-        d.setVar('SBUILDSPEC', cmdsrpm + "\n")
-        d.setVarFlag('SBUILDSPEC', 'func', '1')
-        bb.build.exec_func('SBUILDSPEC', d)
-    cmd = cmd + " -bb " + outspecfile
-
-    # Build the rpm package!
-    d.setVar('BUILDSPEC', cmd + "\n")
-    d.setVarFlag('BUILDSPEC', 'func', '1')
-    bb.build.exec_func('BUILDSPEC', d)
-
-    if d.getVar('RPM_SIGN_PACKAGES') == '1':
-        bb.build.exec_func("sign_rpm", d)
+    # The rpm_build function was used to build rpm for packages.
+    # It have two functionality:
+    # If the args was null, the build was default for the default arch: TUNE_PKGARCH.
+    # If the args was not null, it was in format (package:arch)
+    # The args[0] was package that used to build rpm, the args[1]
+    # was the package's arch.
+    def rpm_build(*args):
+        # Construct the spec file...
+        # If the spec file already exist, and has not been stored into 
+        # pseudo's files.db, it maybe cause rpmbuild src.rpm fail,
+        # so remove it before doing rpmbuild src.rpm.
+        srcname = ""
+        package_arch = ""
+        if not args:
+            srcname    = strip_multilib(d.getVar('PN', True), d)
+            package_arch = (d.getVar('PACKAGE_ARCH', True) or "").replace("-", "_")
+        else:
+            srcname = args[0]
+            package_arch = args[1]
+
+        outspecfile = workdir + "/" + srcname + ".spec"
+        if os.path.isfile(outspecfile):
+            os.remove(outspecfile)
+        d.setVar('OUTSPECFILE', outspecfile)
+        bb.build.exec_func('write_specfile', d)
+
+        perfiledeps = (d.getVar("MERGEPERFILEDEPS", True) or "0") == "0"
+        if perfiledeps:
+            outdepends, outprovides = write_rpm_perfiledata(srcname, d)
+
+        # Setup the rpmbuild arguments...
+        rpmbuild = d.getVar('RPMBUILD', True)
+        targetsys = d.getVar('TARGET_SYS', True)
+        targetvendor = d.getVar('HOST_VENDOR', True)
+
+        sdkpkgsuffix = (d.getVar('SDKPKGSUFFIX', True) or "nativesdk").replace("-", "_")
+        if package_arch not in "all any noarch".split() and not package_arch.endswith(sdkpkgsuffix):
+            ml_prefix = (d.getVar('MLPREFIX', True) or "").replace("-", "_")
+            d.setVar('PACKAGE_ARCH_EXTEND', ml_prefix + package_arch)
+        else:
+            d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
+        pkgwritedir = d.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}')
+        d.setVar('RPM_PKGWRITEDIR', pkgwritedir)
+        bb.debug(1, 'PKGWRITEDIR: %s' % d.getVar('RPM_PKGWRITEDIR', True))
+        pkgarch = d.expand('${PACKAGE_ARCH_EXTEND}${HOST_VENDOR}-${HOST_OS}')
+        magicfile = d.expand('${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc')
+        bb.utils.mkdirhier(pkgwritedir)
+        os.chmod(pkgwritedir, 0o755)
+
+        cmd = rpmbuild
+        cmd = cmd + " --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
+        cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
+        cmd = cmd + " --define '_builddir " + d.getVar('S', True) + "'"
+        cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
+        cmd = cmd + " --define '_use_internal_dependency_generator 0'"
+        if perfiledeps:
+            cmd = cmd + " --define '__find_requires " + outdepends + "'"
+            cmd = cmd + " --define '__find_provides " + outprovides + "'"
+        else:
+            cmd = cmd + " --define '__find_requires %{nil}'"
+            cmd = cmd + " --define '__find_provides %{nil}'"
+        cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
+        cmd = cmd + " --define 'debug_package %{nil}'"
+        cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
+        cmd = cmd + " --define '_tmppath " + workdir + "'"
+        if d.getVarFlag('ARCHIVER_MODE', 'srpm', True) == '1' and bb.data.inherits_class('archiver', d):
+            cmd = cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTDIR', True) + "'"
+            cmdsrpm = cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_OUTDIR', True) + "'"
+            cmdsrpm = cmdsrpm + " -bs " + outspecfile
+            # Build the .src.rpm
+            d.setVar('SBUILDSPEC', cmdsrpm + "\n")
+            d.setVarFlag('SBUILDSPEC', 'func', '1')
+            bb.build.exec_func('SBUILDSPEC', d)
+        cmd = cmd + " -bb " + outspecfile
+
+        # Build the rpm package!
+        d.setVar('BUILDSPEC', cmd + "\n")
+        d.setVarFlag('BUILDSPEC', 'func', '1')
+        bb.build.exec_func('BUILDSPEC', d)
+
+        if d.getVar('RPM_SIGN_PACKAGES', True) == '1':
+            bb.build.exec_func("sign_rpm", d)
+
+    # Get the "package:arch" pairs which package has different arch from the default.
+    extra_arch = check_extra_package_arch(packages, d)
+
+    # build rpm for extra arch packages
+    for pkg in extra_arch.keys():
+        d.setVar("PACKAGE_HAVE_EXTRA_ARCH", pkg)
+        rpm_build(pkg,extra_arch[pkg])
+        d.delVar("PACKAGE_HAVE_EXTRA_ARCH")
+
+    # build rpm for the default arch packages
+    remove_extra_arch_pkg = []
+    for pkg in extra_arch.keys():
+        remove_extra_arch_pkg.append(pkg)
+
+    d.setVar('REMOVE_EXTRA_ARCH_PKG', remove_extra_arch_pkg)
+    rpm_build()
+    d.delVar("REMOVE_EXTRA_ARCH_PKG")
 }
 
 python () {
-- 
2.8.1


