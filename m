Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBq9m-0001Rc-Gc
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 18:23:48 +0100
Received: by mail-pa0-f47.google.com with SMTP id bj3so2391853pad.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2013 09:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=p05+loVkEibO6IyEk9s/8at3r2CKr3S11Yier6Xo/do=;
	b=f1GfLL/vZHCJsJ99v3j5OLSdWcZLIWhFDDAKxAP1l138/9liNj/VR3ybV8x/A/E3B0
	T9xeQO5h8duwLhVY6o3eTN4JO3iPVtnF6Sn9Y59/yrRWyzhu+A3giSCA65eVvRtTMv0b
	l++UObibWeS35wVpAxg6d/BlfxqBStKLC6njZTM6ALKY7fEqnF5Nudhm6mHNYP46O/Cl
	bRjGQAnLJtQl9i2aO01cZrRhhQSsSA5lsAcjFk7IIJ9gxNoe9f06tkZviCfwqoXeoos3
	qqr5s72yhuEaIHljinuxP9pPpkLyK7iA5bA2K6Q0/sr3O5DkCVEAP/gMT20X0AGrY2IS
	liAA==
X-Received: by 10.66.232.33 with SMTP id tl1mr24896171pac.151.1362244028750;
	Sat, 02 Mar 2013 09:07:08 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hp7sm16079533pbc.8.2013.03.02.09.07.05
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 02 Mar 2013 09:07:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Mar 2013 18:06:56 +0100
Message-Id: <1362244018-27333-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 1/3] kernel: extract functions for kernel modules to separate bbclass
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
X-List-Received-Date: Sat, 02 Mar 2013 17:23:50 -0000
X-List-Received-Date: Sat, 02 Mar 2013 17:23:50 -0000

* this way we can reuse the same functionality also for external modules
  including module_autoload_foo and module_conf_foo functionality
* MODULE_PACKAGES variable was removed (splited modules are now returned
  by do_split_packages
* KERNEL_MODULES_META_PACKAGE is used to append all splitted packages
  to RDEPENDS. In kernel.bbclass it's old "kernel-modules" in
  module.bbclass it defaults to ${PN} for upgrade path from
  single PN with all modules to PN depending on all new kernel-module-*

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-module-split.bbclass | 185 +++++++++++++++++++++++++++++++
 meta/classes/kernel.bbclass              | 180 +-----------------------------
 meta/classes/module.bbclass              |  35 +-----
 3 files changed, 191 insertions(+), 209 deletions(-)
 create mode 100644 meta/classes/kernel-module-split.bbclass

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
new file mode 100644
index 0000000..aa0c499
--- /dev/null
+++ b/meta/classes/kernel-module-split.bbclass
@@ -0,0 +1,185 @@
+pkg_postinst_modules () {
+if [ -z "$D" ]; then
+	depmod -a ${KERNEL_VERSION}
+else
+	depmodwrapper -a -b $D ${KERNEL_VERSION}
+fi
+}
+
+pkg_postrm_modules () {
+if [ -z "$D" ]; then
+	depmod -a ${KERNEL_VERSION}
+else
+	depmodwrapper -a -b $D ${KERNEL_VERSION}
+fi
+}
+
+autoload_postinst_fragment() {
+if [ x"$D" = "x" ]; then
+	modprobe %s || true
+fi
+}
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/modules-load.d/ ${D}${sysconfdir}/modprobe.d/
+}
+
+PACKAGESPLITFUNCS_prepend = "split_kernel_module_packages "
+
+KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
+
+python split_kernel_module_packages () {
+    import re
+
+    modinfoexp = re.compile("([^=]+)=(.*)")
+    kerverrexp = re.compile('^(.*-hh.*)[\.\+].*$')
+    depmodpat0 = re.compile("^(.*\.k?o):..*$")
+    depmodpat1 = re.compile("^(.*\.k?o):\s*(.*\.k?o)\s*$")
+    depmodpat2 = re.compile("^(.*\.k?o):\s*(.*\.k?o)\s*\\\$")
+    depmodpat3 = re.compile("^\t(.*\.k?o)\s*\\\$")
+    depmodpat4 = re.compile("^\t(.*\.k?o)\s*$")
+
+    def extract_modinfo(file):
+        import tempfile, subprocess
+        tempfile.tempdir = d.getVar("WORKDIR", True)
+        tf = tempfile.mkstemp()
+        tmpfile = tf[1]
+        cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX", True) or "", file, tmpfile)
+        subprocess.call(cmd, shell=True)
+        f = open(tmpfile)
+        l = f.read().split("\000")
+        f.close()
+        os.close(tf[0])
+        os.unlink(tmpfile)
+        vals = {}
+        for i in l:
+            m = modinfoexp.match(i)
+            if not m:
+                continue
+            vals[m.group(1)] = m.group(2)
+        return vals
+
+    def parse_depmod():
+
+        dvar = d.getVar('PKGD', True)
+
+        kernelver = d.getVar('KERNEL_VERSION', True)
+        kernelver_stripped = kernelver
+        m = kerverrexp.match(kernelver)
+        if m:
+            kernelver_stripped = m.group(1)
+        staging_kernel_dir = d.getVar("STAGING_KERNEL_DIR", True)
+        system_map_file = "%s/boot/System.map-%s" % (dvar, kernelver)
+        if not os.path.exists(system_map_file):
+            system_map_file = "%s/System.map-%s" % (staging_kernel_dir, kernelver)
+            if not os.path.exists(system_map_file):
+                bb.fatal("System.map-%s does not exist in '%s/boot' nor STAGING_KERNEL_DIR '%s'" % (kernelver, dvar, staging_kernel_dir))
+
+        cmd = "depmod -n -a -b %s -F %s %s" % (dvar, system_map_file, kernelver_stripped)
+        f = os.popen(cmd, 'r')
+
+        deps = {}
+        line = f.readline()
+        while line:
+            if not depmodpat0.match(line):
+                line = f.readline()
+                continue
+            m1 = depmodpat1.match(line)
+            if m1:
+                deps[m1.group(1)] = m1.group(2).split()
+            else:
+                m2 = depmodpat2.match(line)
+                if m2:
+                    deps[m2.group(1)] = m2.group(2).split()
+                    line = f.readline()
+                    m3 = depmodpat3.match(line)
+                    while m3:
+                        deps[m2.group(1)].extend(m3.group(1).split())
+                        line = f.readline()
+                        m3 = depmodpat3.match(line)
+                    m4 = depmodpat4.match(line)
+                    deps[m2.group(1)].extend(m4.group(1).split())
+            line = f.readline()
+        f.close()
+        return deps
+
+    def get_dependencies(file, pattern, format):
+        # file no longer includes PKGD
+        file = file.replace(d.getVar('PKGD', True) or '', '', 1)
+        # instead is prefixed with /lib/modules/${KERNEL_VERSION}
+        file = file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VERSION', True) or '', '', 1)
+
+        if module_deps.has_key(file):
+            dependencies = []
+            for i in module_deps[file]:
+                m = re.match(pattern, os.path.basename(i))
+                if not m:
+                    continue
+                on = legitimize_package_name(m.group(1))
+                dependency_pkg = format % on
+                dependencies.append(dependency_pkg)
+            return dependencies
+        return []
+
+    def frob_metadata(file, pkg, pattern, format, basename):
+        vals = extract_modinfo(file)
+
+        dvar = d.getVar('PKGD', True)
+
+        # If autoloading is requested, output /etc/modules-load.d/<name>.conf and append
+        # appropriate modprobe commands to the postinst
+        autoload = d.getVar('module_autoload_%s' % basename, True)
+        if autoload:
+            name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
+            f = open(name, 'w')
+            for m in autoload.split():
+                f.write('%s\n' % m)
+            f.close()
+            postinst = d.getVar('pkg_postinst_%s' % pkg, True)
+            if not postinst:
+                bb.fatal("pkg_postinst_%s not defined" % pkg)
+            postinst += d.getVar('autoload_postinst_fragment', True) % autoload
+            d.setVar('pkg_postinst_%s' % pkg, postinst)
+
+        # Write out any modconf fragment
+        modconf = d.getVar('module_conf_%s' % basename, True)
+        if modconf:
+            name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
+            f = open(name, 'w')
+            f.write("%s\n" % modconf)
+            f.close()
+
+        files = d.getVar('FILES_%s' % pkg, True)
+        files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
+        d.setVar('FILES_%s' % pkg, files)
+
+        if vals.has_key("description"):
+            old_desc = d.getVar('DESCRIPTION_' + pkg, True) or ""
+            d.setVar('DESCRIPTION_' + pkg, old_desc + "; " + vals["description"])
+
+        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg, True) or "")
+        for dep in get_dependencies(file, pattern, format):
+            if not dep in rdepends:
+                rdepends[dep] = []
+        d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
+
+    module_deps = parse_depmod()
+    module_regex = '^(.*)\.k?o$'
+    module_pattern = 'kernel-module-%s'
+
+    postinst = d.getVar('pkg_postinst_modules', True)
+    postrm = d.getVar('pkg_postrm_modules', True)
+
+    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION", True)))
+    if modules:
+        metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE', True)
+        d.appendVar('RDEPENDS_' + metapkg, ' '.join(modules))
+
+    # If modules-load.d and modprobe.d are empty at this point, remove them to
+    # avoid warnings. removedirs only raises an OSError if an empty
+    # directory cannot be removed.
+    dvar = d.getVar('PKGD', True)
+    for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar), "%s/etc" % (dvar)]:
+        if len(os.listdir(dir)) == 0:
+            os.rmdir(dir)
+}
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5fe4356..0a0430e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,4 +1,4 @@
-inherit linux-kernel-base module_strip
+inherit linux-kernel-base module_strip kernel-module-split
 
 PROVIDES += "virtual/kernel"
 DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross"
@@ -281,190 +281,12 @@ else
 fi
 }
 
-pkg_postinst_modules () {
-if [ -z "$D" ]; then
-	depmod -a ${KERNEL_VERSION}
-else
-	depmodwrapper -a -b $D ${KERNEL_VERSION}
-fi
-}
-
-pkg_postrm_modules () {
-if [ -z "$D" ]; then
-	depmod -a ${KERNEL_VERSION}
-else
-	depmodwrapper -a -b $D ${KERNEL_VERSION}
-fi
-}
-
-autoload_postinst_fragment() {
-if [ x"$D" = "x" ]; then
-	modprobe %s || true
-fi
-}
-
 PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
 
 python split_kernel_packages () {
-    import re
-
-    modinfoexp = re.compile("([^=]+)=(.*)")
-    kerverrexp = re.compile('^(.*-hh.*)[\.\+].*$')
-    depmodpat0 = re.compile("^(.*\.k?o):..*$")
-    depmodpat1 = re.compile("^(.*\.k?o):\s*(.*\.k?o)\s*$")
-    depmodpat2 = re.compile("^(.*\.k?o):\s*(.*\.k?o)\s*\\\$")
-    depmodpat3 = re.compile("^\t(.*\.k?o)\s*\\\$")
-    depmodpat4 = re.compile("^\t(.*\.k?o)\s*$")
-
-    def extract_modinfo(file):
-        import tempfile, subprocess
-        tempfile.tempdir = d.getVar("WORKDIR", True)
-        tf = tempfile.mkstemp()
-        tmpfile = tf[1]
-        cmd = "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOST_PREFIX", True) or "", file, tmpfile)
-        subprocess.call(cmd, shell=True)
-        f = open(tmpfile)
-        l = f.read().split("\000")
-        f.close()
-        os.close(tf[0])
-        os.unlink(tmpfile)
-        vals = {}
-        for i in l:
-            m = modinfoexp.match(i)
-            if not m:
-                continue
-            vals[m.group(1)] = m.group(2)
-        return vals
-    
-    def parse_depmod():
-
-        dvar = d.getVar('PKGD', True)
-
-        kernelver = d.getVar('KERNEL_VERSION', True)
-        kernelver_stripped = kernelver
-        m = kerverrexp.match(kernelver)
-        if m:
-            kernelver_stripped = m.group(1)
-        cmd = "depmod -n -a -b %s -F %s/boot/System.map-%s %s" % (dvar, dvar, kernelver, kernelver_stripped)
-        f = os.popen(cmd, 'r')
-
-        deps = {}
-        line = f.readline()
-        while line:
-            if not depmodpat0.match(line):
-                line = f.readline()
-                continue
-            m1 = depmodpat1.match(line)
-            if m1:
-                deps[m1.group(1)] = m1.group(2).split()
-            else:
-                m2 = depmodpat2.match(line)
-                if m2:
-                    deps[m2.group(1)] = m2.group(2).split()
-                    line = f.readline()
-                    m3 = depmodpat3.match(line)
-                    while m3:
-                        deps[m2.group(1)].extend(m3.group(1).split())
-                        line = f.readline()
-                        m3 = depmodpat3.match(line)
-                    m4 = depmodpat4.match(line)
-                    deps[m2.group(1)].extend(m4.group(1).split())
-            line = f.readline()
-        f.close()
-        return deps
-    
-    def get_dependencies(file, pattern, format):
-        # file no longer includes PKGD
-        file = file.replace(d.getVar('PKGD', True) or '', '', 1)
-        # instead is prefixed with /lib/modules/${KERNEL_VERSION}
-        file = file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VERSION', True) or '', '', 1)
-
-        if module_deps.has_key(file):
-            dependencies = []
-            for i in module_deps[file]:
-                m = re.match(pattern, os.path.basename(i))
-                if not m:
-                    continue
-                on = legitimize_package_name(m.group(1))
-                dependency_pkg = format % on
-                dependencies.append(dependency_pkg)
-            return dependencies
-        return []
-
-    def frob_metadata(file, pkg, pattern, format, basename):
-        vals = extract_modinfo(file)
-
-        dvar = d.getVar('PKGD', True)
-
-        # If autoloading is requested, output /etc/modules-load.d/<name>.conf and append
-        # appropriate modprobe commands to the postinst
-        autoload = d.getVar('module_autoload_%s' % basename, True)
-        if autoload:
-            name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
-            f = open(name, 'w')
-            for m in autoload.split():
-                f.write('%s\n' % m)
-            f.close()
-            postinst = d.getVar('pkg_postinst_%s' % pkg, True)
-            if not postinst:
-                bb.fatal("pkg_postinst_%s not defined" % pkg)
-            postinst += d.getVar('autoload_postinst_fragment', True) % autoload
-            d.setVar('pkg_postinst_%s' % pkg, postinst)
-
-        # Write out any modconf fragment
-        modconf = d.getVar('module_conf_%s' % basename, True)
-        if modconf:
-            name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
-            f = open(name, 'w')
-            f.write("%s\n" % modconf)
-            f.close()
-
-        files = d.getVar('FILES_%s' % pkg, True)
-        files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
-        d.setVar('FILES_%s' % pkg, files)
-
-        if vals.has_key("description"):
-            old_desc = d.getVar('DESCRIPTION_' + pkg, True) or ""
-            d.setVar('DESCRIPTION_' + pkg, old_desc + "; " + vals["description"])
-
-        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg, True) or "")
-        for dep in get_dependencies(file, pattern, format):
-            if not dep in rdepends:
-                rdepends[dep] = []
-        d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
-
-    module_deps = parse_depmod()
-    module_regex = '^(.*)\.k?o$'
-    module_pattern = 'kernel-module-%s'
-
-    postinst = d.getVar('pkg_postinst_modules', True)
-    postrm = d.getVar('pkg_postrm_modules', True)
-
     do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.bin$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
     do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.fw$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
     do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
-    do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION", True)))
-
-    # If modules-load.d and modprobe.d are empty at this point, remove them to
-    # avoid warnings. removedirs only raises an OSError if an empty
-    # directory cannot be removed.
-    dvar = d.getVar('PKGD', True)
-    for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar), "%s/etc" % (dvar)]:
-        if len(os.listdir(dir)) == 0:
-            os.rmdir(dir)
-
-    metapkg = "kernel-modules"
-    blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux' ]
-    for l in module_deps.values():
-        for i in l:
-            pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
-            blacklist.append(pkg)
-    metapkg_rdepends = []
-    packages = d.getVar('PACKAGES', True).split()
-    for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends:
-            metapkg_rdepends.append(pkg)
-    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
 }
 
 # Support checking the kernel size since some kernels need to reside in partitions
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 2c1888c..ad6f7af 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -1,6 +1,6 @@
 DEPENDS += "virtual/kernel"
 
-inherit module-base
+inherit module-base kernel-module-split
 
 addtask make_scripts after do_patch before do_compile
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
@@ -24,34 +24,9 @@ module_do_install() {
 	           modules_install
 }
 
-module_pkg_postinst () {
-if [ -z "$D" ]; then
-	depmod -a ${KERNEL_VERSION}
-else
-	depmodwrapper -a -b $D ${KERNEL_VERSION}
-fi
-}
-
-module_pkg_postrm () {
-if [ -z "$D" ]; then
-	depmod -a ${KERNEL_VERSION}
-else
-	depmodwrapper -a -b $D ${KERNEL_VERSION}
-fi
-}
-
 EXPORT_FUNCTIONS do_compile do_install
 
-MODULE_PACKAGES ?= "${PN}"
-
-python __anonymous() {
-    for package in d.getVar("MODULE_PACKAGES", True).split():
-        d.appendVar("RDEPENDS_%s" % package, " kernel-image")
-        files = d.getVar("MODULE_FILES_%s" % package, True) or "/etc /lib/modules"
-        d.appendVar("FILES_%s" % package, " " + files)
-        d.appendVar('pkg_postinst_%s' %  package, " " + d.getVar('module_pkg_postinst', True))
-        d.appendVar('pkg_postrm_%s' %  package, " " + d.getVar('module_pkg_postrm', True))
-        if not package in d.getVar("PACKAGES", True):
-            d.prependVar("PACKAGES", package + " ")
-}
-         	
+# add all splitted modules to PN RDEPENDS, PN can be empty now
+KERNEL_MODULES_META_PACKAGE = "${PN}"
+FILES_${PN} = ""
+ALLOW_EMPTY_${PN} = "1"
-- 
1.8.1.4



