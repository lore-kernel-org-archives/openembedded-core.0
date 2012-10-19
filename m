Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TPE53-0006yO-PE for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 17:01:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9JEmOYe031799
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 15:48:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31581-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 15:48:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9JEmGiG031792
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 15:48:17 +0100
Message-ID: <1350658096.2520.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Oct 2012 15:48:16 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] package.bbclass: Switch shlibs to pkgdata directory and make package non-machine specific
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
X-List-Received-Date: Fri, 19 Oct 2012 15:01:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently, do_package is machine specific since the shlibs data is installed
into each machine specific sysroot. This change moves the shlibs data to the
pkgdata structure, at the expense of having to iterate over a set of shlibs
directories instead of a single one.

It turns out this isn't any particular hardship for the code and as a result,
do_package stops being machine specific leading to optimisations for builds
that use a common PACKAGE_ARCH.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 47fb0ab..7dc20c6 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -90,7 +90,8 @@ export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${layout_libdir}/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
 
 # Cross-canadian packages need to pull in nativesdk dynamic libs
-SHLIBSDIR = "${STAGING_DIR}/${SDK_ARCH}-nativesdk${SDK_VENDOR}-${BUILD_OS}/shlibs"
+SHLIBSDIRS = "${TMPDIR}/pkgdata/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}/shlibs/ ${TMPDIR}/pkgdata/all-${HOST_VENDOR}-${HOST_OS}/shlibs/"
+SHLIBSDIR = "${TMPDIR}/pkgdata/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}/shlibs/"
 
 do_populate_sysroot[stamp-extra-info] = ""
 do_package[stamp-extra-info] = ""
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index eb30b5a..93f96f5 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -88,7 +88,6 @@ do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_NATIVE}"
 # Since we actually install these into situ there is no staging prefix
 STAGING_DIR_HOST = ""
 STAGING_DIR_TARGET = ""
-SHLIBSDIR = "${STAGING_DIR_NATIVE}/shlibs"
 PKG_CONFIG_DIR = "${libdir}/pkgconfig"
 
 EXTRA_NATIVE_PKGCONFIG_PATH ?= ""
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0300277..76979bd 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1292,8 +1292,16 @@ python package_do_filedeps() {
         d.setVar("FILERPROVIDESFLIST_" + pkg, " ".join(provides_files))
 }
 
-SHLIBSDIR = "${STAGING_DIR_HOST}/shlibs"
-SHLIBSWORKDIR = "${WORKDIR}/shlibs"
+def getshlibsdirs(d):
+    dirs = []
+    triplets = (d.getVar("PKGTRIPLETS") or "").split()
+    for t in triplets:
+        dirs.append("${TMPDIR}/pkgdata/" + t + "/shlibs/")
+    return " ".join(dirs)
+
+SHLIBSDIRS = "${@getshlibsdirs(d)}"
+SHLIBSDIR = "${TMPDIR}/pkgdata/${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/shlibs"
+SHLIBSWORKDIR = "${PKGDESTWORK}/shlibs"
 
 python package_do_shlibs() {
     import re, pipes
@@ -1318,7 +1326,7 @@ python package_do_shlibs() {
 
     pkgdest = d.getVar('PKGDEST', True)
 
-    shlibs_dir = d.getVar('SHLIBSDIR', True)
+    shlibs_dirs = d.getVar('SHLIBSDIRS', True).split()
     shlibswork_dir = d.getVar('SHLIBSWORKDIR', True)
 
     # Take shared lock since we're only reading, not writing
@@ -1472,7 +1480,7 @@ python package_do_shlibs() {
             d.setVar('pkg_postinst_%s' % pkg, postinst)
 
     list_re = re.compile('^(.*)\.list$')
-    for dir in [shlibs_dir]:
+    for dir in shlibs_dirs:
         if not os.path.exists(dir):
             continue
         for file in os.listdir(dir):
@@ -1543,7 +1551,7 @@ python package_do_pkgconfig () {
     workdir = d.getVar('WORKDIR', True)
     pkgdest = d.getVar('PKGDEST', True)
 
-    shlibs_dir = d.getVar('SHLIBSDIR', True)
+    shlibs_dirs = d.getVar('SHLIBSDIRS', True).split()
     shlibswork_dir = d.getVar('SHLIBSWORKDIR', True)
 
     pc_re = re.compile('(.*)\.pc$')
@@ -1594,7 +1602,7 @@ python package_do_pkgconfig () {
                 f.write('%s\n' % p)
             f.close()
 
-    for dir in [shlibs_dir]:
+    for dir in shlibs_dirs:
         if not os.path.exists(dir):
             continue
         for file in os.listdir(dir):
@@ -1853,10 +1861,9 @@ SSTATETASKS += "do_package"
 do_package[sstate-name] = "package"
 do_package[cleandirs] = "${PKGDESTWORK}"
 do_package[sstate-plaindirs] = "${PKGD} ${PKGDEST}"
-do_package[sstate-inputdirs] = "${PKGDESTWORK} ${SHLIBSWORKDIR}"
-do_package[sstate-outputdirs] = "${PKGDATA_DIR} ${SHLIBSDIR}"
+do_package[sstate-inputdirs] = "${PKGDESTWORK}"
+do_package[sstate-outputdirs] = "${PKGDATA_DIR}"
 do_package[sstate-lockfile-shared] = "${PACKAGELOCK}"
-do_package[stamp-extra-info] = "${MACHINE}"
 do_package_setscene[dirs] = "${STAGING_DIR}"
 
 python do_package_setscene () {




