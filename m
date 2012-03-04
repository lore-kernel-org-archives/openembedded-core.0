Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S432F-00050e-Cm for openembedded-core@lists.openembedded.org;
	Sun, 04 Mar 2012 05:27:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q244IVjf020304
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Mar 2012 04:18:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20135-03 for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2012 04:18:26 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q244IMnm020298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Mar 2012 04:18:24 GMT
Message-ID: <1330834705.3949.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 03 Mar 2012 20:18:25 -0800
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] meta/classes: Convert to use appendVar and appendVarFlags
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Mar 2012 04:27:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass              |   36 ++++++++------------------------
 meta/classes/package.bbclass           |   16 ++++---------
 meta/classes/package_deb.bbclass       |    6 +---
 meta/classes/package_ipk.bbclass       |    6 +---
 meta/classes/package_rpm.bbclass       |    6 +---
 meta/classes/sstate.bbclass            |    8 +-----
 meta/classes/toolchain-scripts.bbclass |    4 +-
 7 files changed, 24 insertions(+), 58 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 39d3e78..cab56de 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -308,9 +308,7 @@ python () {
             if not appends:
                 return
             varname = bb.data.expand(varname, d)
-            content = d.getVar(varname, False) or ""
-            content = content + " " + " ".join(appends)
-            d.setVar(varname, content)
+            d.appendVar(varname, " " + " ".join(appends))
 
         extradeps = []
         extrardeps = []
@@ -363,14 +361,10 @@ python () {
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
         d.setVarFlag('do_configure', 'umask', 022)
         d.setVarFlag('do_compile', 'umask', 022)
-        deps = (d.getVarFlag('do_install', 'depends') or "").split()
-        deps.append('virtual/fakeroot-native:do_populate_sysroot')
-        d.setVarFlag('do_install', 'depends', " ".join(deps))
+        d.appendVarFlag('do_install', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_install', 'fakeroot', 1)
         d.setVarFlag('do_install', 'umask', 022)
-        deps = (d.getVarFlag('do_package', 'depends') or "").split()
-        deps.append('virtual/fakeroot-native:do_populate_sysroot')
-        d.setVarFlag('do_package', 'depends', " ".join(deps))
+        d.appendVarFlag('do_package', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_package', 'fakeroot', 1)
         d.setVarFlag('do_package', 'umask', 022)
         d.setVarFlag('do_package_setscene', 'fakeroot', 1)
@@ -408,40 +402,28 @@ python () {
     srcuri = d.getVar('SRC_URI', 1)
     # Svn packages should DEPEND on subversion-native
     if "svn://" in srcuri:
-        depends = d.getVarFlag('do_fetch', 'depends') or ""
-        depends = depends + " subversion-native:do_populate_sysroot"
-        d.setVarFlag('do_fetch', 'depends', depends)
+        d.appendVarFlag('do_fetch', 'depends', ' subversion-native:do_populate_sysroot')
 
     # Git packages should DEPEND on git-native
     if "git://" in srcuri:
-        depends = d.getVarFlag('do_fetch', 'depends') or ""
-        depends = depends + " git-native:do_populate_sysroot"
-        d.setVarFlag('do_fetch', 'depends', depends)
+        d.appendVarFlag('do_fetch', 'depends', ' git-native:do_populate_sysroot')
 
     # Mercurial packages should DEPEND on mercurial-native
     elif "hg://" in srcuri:
-        depends = d.getVarFlag('do_fetch', 'depends') or ""
-        depends = depends + " mercurial-native:do_populate_sysroot"
-        d.setVarFlag('do_fetch', 'depends', depends)
+        d.appendVarFlag('do_fetch', 'depends', ' mercurial-native:do_populate_sysroot')
 
     # OSC packages should DEPEND on osc-native
     elif "osc://" in srcuri:
-        depends = d.getVarFlag('do_fetch', 'depends') or ""
-        depends = depends + " osc-native:do_populate_sysroot"
-        d.setVarFlag('do_fetch', 'depends', depends)
+        d.appendVarFlag('do_fetch', 'depends', ' osc-native:do_populate_sysroot')
 
     # *.xz should depends on xz-native for unpacking
     # Not endswith because of "*.patch.xz;patch=1". Need bb.decodeurl in future
     if '.xz' in srcuri:
-        depends = d.getVarFlag('do_unpack', 'depends') or ""
-        depends = depends + " xz-native:do_populate_sysroot"
-        d.setVarFlag('do_unpack', 'depends', depends)
+        d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
 
     # unzip-native should already be staged before unpacking ZIP recipes
     if ".zip" in srcuri:
-        depends = d.getVarFlag('do_unpack', 'depends') or ""
-        depends = depends + " unzip-native:do_populate_sysroot"
-        d.setVarFlag('do_unpack', 'depends', depends)
+        d.appendVarFlag('do_unpack', 'depends', ' unzip-native:do_populate_sysroot')
 
     # 'multimachine' handling
     mach_arch = d.getVar('MACHINE_ARCH', 1)
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 91c4c6e..4ed6972 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -153,12 +153,7 @@ def do_split_packages(d, root, file_regex, output_pattern, description, postinst
 					the_files.append(aux_files_pattern_verbatim % m.group(1))
 			d.setVar('FILES_' + pkg, " ".join(the_files))
 			if extra_depends != '':
-				the_depends = d.getVar('RDEPENDS_' + pkg, True)
-				if the_depends:
-					the_depends = '%s %s' % (the_depends, extra_depends)
-				else:
-					the_depends = extra_depends
-				d.setVar('RDEPENDS_' + pkg, the_depends)
+				d.appendVar('RDEPENDS_' + pkg, ' ' + extra_depends)
 			d.setVar('DESCRIPTION_' + pkg, description % on)
 			if postinst:
 				d.setVar('pkg_postinst_' + pkg, postinst)
@@ -175,15 +170,14 @@ PACKAGE_DEPENDS += "file-native"
 
 python () {
     if d.getVar('PACKAGES', True) != '':
-        deps = d.getVarFlag('do_package', 'depends') or ""
+        deps = ""
         for dep in (d.getVar('PACKAGE_DEPENDS', True) or "").split():
             deps += " %s:do_populate_sysroot" % dep
-        d.setVarFlag('do_package', 'depends', deps)
+        d.appendVarFlag('do_package', 'depends', deps)
 
-        deps = (d.getVarFlag('do_package', 'deptask') or "").split()
         # shlibs requires any DEPENDS to have already packaged for the *.list files
-        deps.append("do_package")
-        d.setVarFlag('do_package', 'deptask', " ".join(deps))
+        d.appendVarFlag('do_package', 'deptask', " do_package")
+
     elif not bb.data.inherits_class('image', d):
         d.setVar("PACKAGERDEPTASK", "")
 }
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index fc28ee1..8721fd2 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -406,10 +406,8 @@ addtask do_package_write_deb_setscene
 
 python () {
     if d.getVar('PACKAGES', True) != '':
-        deps = (d.getVarFlag('do_package_write_deb', 'depends') or "").split()
-        deps.append('dpkg-native:do_populate_sysroot')
-        deps.append('virtual/fakeroot-native:do_populate_sysroot')
-        d.setVarFlag('do_package_write_deb', 'depends', " ".join(deps))
+        deps = ' dpkg-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
+        d.appendVarFlag('do_package_write_deb', 'depends', deps)
         d.setVarFlag('do_package_write_deb', 'fakeroot', "1")
         d.setVarFlag('do_package_write_deb_setscene', 'fakeroot', "1")
 
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 36dedb9..e9d1ddc 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -442,10 +442,8 @@ addtask do_package_write_ipk_setscene
 
 python () {
     if d.getVar('PACKAGES', True) != '':
-        deps = (d.getVarFlag('do_package_write_ipk', 'depends') or "").split()
-        deps.append('opkg-utils-native:do_populate_sysroot')
-        deps.append('virtual/fakeroot-native:do_populate_sysroot')
-        d.setVarFlag('do_package_write_ipk', 'depends', " ".join(deps))
+        deps = ' opkg-utils-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
+        d.appendVarFlag('do_package_write_ipk', 'depends', deps)
         d.setVarFlag('do_package_write_ipk', 'fakeroot', "1")
         d.setVarFlag('do_package_write_ipk_setscene', 'fakeroot', "1")
 }
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index a813c8b..a264712 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -1025,10 +1025,8 @@ python do_package_rpm () {
 
 python () {
     if d.getVar('PACKAGES', True) != '':
-        deps = (d.getVarFlag('do_package_write_rpm', 'depends') or "").split()
-        deps.append('rpm-native:do_populate_sysroot')
-        deps.append('virtual/fakeroot-native:do_populate_sysroot')
-        d.setVarFlag('do_package_write_rpm', 'depends', " ".join(deps))
+        deps = ' rpm-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
+        d.appendVarFlag('do_package_write_rpm', 'depends', deps)
         d.setVarFlag('do_package_write_rpm', 'fakeroot', 1)
         d.setVarFlag('do_package_write_rpm_setscene', 'fakeroot', 1)
 }
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d20b62a..b1cdf0f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -46,12 +46,8 @@ python () {
     namemap = []
     for task in unique_tasks:
         namemap.append(d.getVarFlag(task, 'sstate-name'))
-        funcs = d.getVarFlag(task, 'prefuncs') or ""
-        funcs = "sstate_task_prefunc " + funcs
-        d.setVarFlag(task, 'prefuncs', funcs)
-        funcs = d.getVarFlag(task, 'postfuncs') or ""
-        funcs = funcs + " sstate_task_postfunc"
-        d.setVarFlag(task, 'postfuncs', funcs)
+        d.prependVarFlag(task, 'prefuncs', "sstate_task_prefunc ")
+        d.appendVarFlag(task, 'postfuncs', " sstate_task_postfunc")
     d.setVar('SSTATETASKNAMES', " ".join(namemap))
 }
 
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 6ca85d9..711efd3 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -143,10 +143,10 @@ toolchain_create_sdk_version () {
 toolchain_create_sdk_version[vardepsexclude] = "DATETIME"
 
 python __anonymous () {
-    deps = d.getVarFlag('do_configure', 'depends') or ""
+    deps = ""
     for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "").split():
         deps += " %s:do_populate_sysroot" % dep
     if d.getVar('TCLIBC', True) is "uclibc":
 	deps += "uclibc:do_populate_sysroot"
-    d.setVarFlag('do_configure', 'depends', deps)
+    d.appendVarFlag('do_configure', 'depends', deps)
 }




