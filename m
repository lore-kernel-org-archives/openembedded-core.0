Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Ty1Xu-0002w6-LT for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 15:43:29 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0NEVq9n010391 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 14:31:52 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YGlrUwUgPItb
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 14:31:52 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0NEVhur010385
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 14:31:46 GMT
Message-ID: <1358951253.6356.53.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jan 2013 14:27:33 +0000
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] Split do_packagedata task from do_package
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
X-List-Received-Date: Wed, 23 Jan 2013 14:43:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, do_rootfs has a dependency on all the do_package output being present
due to its usage of the pkgdata directories. This means that if you run:

bitbake xxxx-image -c rootfs

you end up having to fetch and unpack all the do_package data which is usually
large and inefficient. It also means rm_work has to leave all the do_package
data lying around so rootfs works.

This patch splits the actual creation of the pkgdata directory off into a separate
task, "packagedata" which happens immediately after do_package. We can then remap
the dependencies so this task is depended upon, not do_package. Sstate can then be
programmed not to require do_package at the appropriate times.

Whilst this patch doesn't do so, it opens the possibility of rm_work wiping
out the do_package output from WORKDIR as long as it also removed the do_package
stamp (both normal and setscene variants) and allowing more space savings
with rm_work which has been regularly requested.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/debian.bbclass b/meta/classes/debian.bbclass
index 2484003..45f01e4 100644
--- a/meta/classes/debian.bbclass
+++ b/meta/classes/debian.bbclass
@@ -8,7 +8,7 @@
 #
 # Better expressed as ensure all RDEPENDS package before we package
 # This means we can't have circular RDEPENDS/RRECOMMENDS
-DEBIANRDEP = "do_package"
+DEBIANRDEP = "do_packagedata"
 do_package_write_ipk[rdeptask] = "${DEBIANRDEP}"
 do_package_write_deb[rdeptask] = "${DEBIANRDEP}"
 do_package_write_tar[rdeptask] = "${DEBIANRDEP}"
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 0293d2e..9b4dec8 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -83,7 +83,7 @@ LDCONFIGDEPEND_libc-uclibc = ""
 
 do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND}"
 do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
-do_rootfs[recrdeptask] += "do_package"
+do_rootfs[recrdeptask] += "do_packagedata"
 
 IMAGE_TYPE_live = '${@base_contains("IMAGE_FSTYPES", "live", "live", "empty", d)}'
 inherit image-${IMAGE_TYPE_live}
@@ -480,6 +480,7 @@ do_compile[noexec] = "1"
 do_install[noexec] = "1"
 do_populate_sysroot[noexec] = "1"
 do_package[noexec] = "1"
+do_packagedata[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
 do_package_write_deb[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index c08ca19..bfc9e4c 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -151,6 +151,7 @@ python native_virtclass_handler () {
 addhandler native_virtclass_handler
 
 do_package[noexec] = "1"
+do_packagedata[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
 do_package_write_deb[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8e07168..9602aa0 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -217,7 +217,7 @@ python () {
         d.appendVarFlag('do_package', 'depends', deps)
 
         # shlibs requires any DEPENDS to have already packaged for the *.list files
-        d.appendVarFlag('do_package', 'deptask', " do_package")
+        d.appendVarFlag('do_package', 'deptask', " do_packagedata")
 
     elif not bb.data.inherits_class('image', d):
         d.setVar("PACKAGERDEPTASK", "")
@@ -1902,9 +1902,7 @@ PACKAGELOCK = "${STAGING_DIR}/package-output.lock"
 SSTATETASKS += "do_package"
 do_package[sstate-name] = "package"
 do_package[cleandirs] = "${PKGDESTWORK}"
-do_package[sstate-plaindirs] = "${PKGD} ${PKGDEST}"
-do_package[sstate-inputdirs] = "${PKGDESTWORK}"
-do_package[sstate-outputdirs] = "${PKGDATA_DIR}"
+do_package[sstate-plaindirs] = "${PKGD} ${PKGDEST} ${PKGDESTWORK}"
 do_package[sstate-lockfile-shared] = "${PACKAGELOCK}"
 do_package_setscene[dirs] = "${STAGING_DIR}"
 
@@ -1913,6 +1911,23 @@ python do_package_setscene () {
 }
 addtask do_package_setscene
 
+do_packagedata () {
+	:
+}
+
+addtask packagedata before do_build after do_package
+
+SSTATETASKS += "do_packagedata"
+do_packagedata[sstate-name] = "packagedata"
+do_packagedata[sstate-inputdirs] = "${PKGDESTWORK}"
+do_packagedata[sstate-outputdirs] = "${PKGDATA_DIR}"
+do_packagedata[sstate-lockfile-shared] = "${PACKAGELOCK}"
+
+python do_packagedata_setscene () {
+    sstate_setscene(d)
+}
+addtask do_packagedata_setscene
+
 # Dummy task to mark when all packaging is complete
 do_package_write () {
 	:
@@ -1920,7 +1935,7 @@ do_package_write () {
 do_package_write[noexec] = "1"
 PACKAGERDEPTASK = "do_package_write"
 do_build[recrdeptask] += "${PACKAGERDEPTASK}"
-addtask package_write before do_build after do_package
+addtask package_write before do_build after do_packagedata
 
 #
 # Helper functions for the package writing classes
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index eed9b8a..ac8c9f3 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -453,7 +453,7 @@ python do_package_write_deb () {
 }
 do_package_write_deb[dirs] = "${PKGWRITEDIRDEB}"
 do_package_write_deb[umask] = "022"
-addtask package_write_deb before do_package_write after do_package
+addtask package_write_deb before do_package_write after do_packagedata do_package
 
 
 PACKAGEINDEXES += "package_update_index_deb;"
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index b441e86..ad4ea53 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -477,7 +477,7 @@ python do_package_write_ipk () {
 }
 do_package_write_ipk[dirs] = "${PKGWRITEDIRIPK}"
 do_package_write_ipk[umask] = "022"
-addtask package_write_ipk before do_package_write after do_package
+addtask package_write_ipk before do_package_write after do_packagedata do_package
 
 PACKAGEINDEXES += "package_update_index_ipk;"
 PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 19c91ae..579f85d 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -1084,7 +1084,7 @@ python do_package_write_rpm () {
 
 do_package_write_rpm[dirs] = "${PKGWRITEDIRRPM}"
 do_package_write_rpm[umask] = "022"
-addtask package_write_rpm before do_package_write after do_package
+addtask package_write_rpm before do_package_write after do_packagedata do_package
 
 PACKAGEINDEXES += "package_update_index_rpm; [ ! -e ${DEPLOY_DIR_RPM} ] || createrepo ${DEPLOY_DIR_RPM};"
 PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index 332fa3f..e76ce29 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -107,4 +107,4 @@ python do_package_write_tar () {
 	bb.build.exec_func("do_package_tar", d)
 }
 do_package_write_tar[dirs] = "${D}"
-addtask package_write_tar before do_build after do_package
+addtask package_write_tar before do_build after do_packagedata do_package
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index e92fbae..bc9f7ad 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -655,13 +655,13 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
         if dep in notneeded:
             continue
         # do_package_write_* and do_package doesn't need do_package
-        if taskdependees[task][1] == "do_package" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
+        if taskdependees[task][1] == "do_package" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata']:
             continue
         # do_package_write_* and do_package doesn't need do_populate_sysroot
-        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
+        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata']:
             continue
         # Native/Cross packages don't exist and are noexec anyway
-        if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
+        if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata']:
             continue
 
         # Consider sysroot depending on sysroot tasks
diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/package-index.bb
index bf3922f..99ac1a8 100644
--- a/meta/recipes-core/meta/package-index.bb
+++ b/meta/recipes-core/meta/package-index.bb
@@ -12,6 +12,7 @@ do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 do_install[noexec] = "1"
 do_package[noexec] = "1"
+do_packagedata[noexec] = "1"
 do_package_write[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
diff --git a/meta/recipes-devtools/gcc/gcc-package-cross.inc b/meta/recipes-devtools/gcc/gcc-package-cross.inc
index 9718101..3d81677 100644
--- a/meta/recipes-devtools/gcc/gcc-package-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-cross.inc
@@ -42,6 +42,7 @@ do_install () {
 }
 
 do_package[noexec] = "1"
+do_packagedata[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 do_package_write_deb[noexec] = "1"
diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
index 75847b6..2e2f75a 100644
--- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
@@ -75,6 +75,6 @@ FILES_libgomp-staticdev = "\
   ${libdir}/libgomp*.a \
   "
 
-do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_package"
-do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_package"
-do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_package"
+do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
diff --git a/meta/recipes-devtools/gcc/libgcc_4.7.bb b/meta/recipes-devtools/gcc/libgcc_4.7.bb
index 5eaa515..c12aeef 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.7.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.7.bb
@@ -61,10 +61,10 @@ do_install () {
 	rm -rf ${D}${libdir}/${TARGET_SYS}/${BINV}/include
 }
 
-do_package[depends] += "virtual/${MLPREFIX}libc:do_package"
-do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_package"
-do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_package"
-do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_package"
+do_package[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
+do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 
 BBCLASSEXTEND = "nativesdk"
 
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 3624dbc..227e866 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -81,6 +81,7 @@ do_populate_adt[nostamp] = "1"
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 do_package[noexec] = "1"
+do_packagedata[noexec] = "1"
 do_package_write[noexec] = "1"
 do_package_write_ipk[noexec] = "1"
 do_package_write_rpm[noexec] = "1"




