Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QZj49-0007Tf-9S
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 14:31:25 +0200
Received: by rex (Postfix, from userid 1000)
	id 955B220E22; Thu, 23 Jun 2011 13:27:49 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2011 13:27:28 +0100
Message-Id: <a3af01f9728967d3cfabb8bc0489e92ae91f7f08.1308831847.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
References: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
References: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/4] classes/conf: Drop MULTIMACH_ARCH variable, it adds unused complexity and serves no useful purpose
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
X-List-Received-Date: Thu, 23 Jun 2011 12:31:25 -0000

Signed-off-by: Richard  Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass           |    8 +-------
 meta/classes/cross-canadian.bbclass |   14 +++++++-------
 meta/classes/sstate.bbclass         |    4 ++--
 meta/conf/bitbake.conf              |    9 ++-------
 4 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f390f08..0bea639 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -362,11 +362,8 @@ python () {
                     if local.startswith(mp):
                         #bb.note("overriding PACKAGE_ARCH from %s to %s" % (pkg_arch, mach_arch))
                         bb.data.setVar('PACKAGE_ARCH', "${MACHINE_ARCH}", d)
-                        bb.data.setVar('MULTIMACH_ARCH', mach_arch, d)
                         return
 
-    multiarch = pkg_arch
-
     packages = bb.data.getVar('PACKAGES', d, 1).split()
     for pkg in packages:
         pkgarch = bb.data.getVar("PACKAGE_ARCH_%s" % pkg, d, 1)
@@ -375,10 +372,7 @@ python () {
         # if multiple differences are present?
         # Look through PACKAGE_ARCHS for the priority order?
         if pkgarch and pkgarch == mach_arch:
-            multiarch = mach_arch
-            break
-
-    bb.data.setVar('MULTIMACH_ARCH', multiarch, d)
+            bb.fatal("Recipe %s is marked as only being architecture specific but seems to have machine specific packages?" % d.getVar("PN", True))
 }
 
 def check_gcc3(data):
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 1a045ba..edd51da 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -9,14 +9,14 @@
 # or indirectly via dependency.  No need to be in 'world'.
 EXCLUDE_FROM_WORLD = "1"
 
-STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/${OLD_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
+STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/${OLD_BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 #
 # Update BASE_PACKAGE_ARCH and PACKAGE_ARCHS
 #
-OLD_MULTIMACH_ARCH := "${MULTIMACH_ARCH}"
+OLD_PACKAGE_ARCH := "${PACKAGE_ARCH}"
 OLD_MULTIMACH_TARGET_SYS := "${MULTIMACH_TARGET_SYS}"
-OLD_PACKAGE_ARCH := ${BASE_PACKAGE_ARCH}
+OLD_BASE_PACKAGE_ARCH := ${BASE_PACKAGE_ARCH}
 BASE_PACKAGE_ARCH = "${SDK_ARCH}-nativesdk"
 python () {
     archs = bb.data.getVar('PACKAGE_ARCHS', d, True).split()
@@ -25,7 +25,7 @@ python () {
         sdkarchs.append(arch + '-nativesdk')
     bb.data.setVar('PACKAGE_ARCHS', " ".join(sdkarchs), d)
 }
-MULTIMACH_TARGET_SYS = "${MULTIMACH_ARCH}${HOST_VENDOR}-${HOST_OS}"
+MULTIMACH_TARGET_SYS = "${PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -66,12 +66,12 @@ target_exec_prefix := "${exec_prefix}"
 base_prefix = "${SDKPATHNATIVE}"
 prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
 exec_prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
-bindir = "${exec_prefix}/bin/${OLD_MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
+bindir = "${exec_prefix}/bin/${OLD_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 sbindir = "${bindir}"
 base_bindir = "${bindir}"
 base_sbindir = "${bindir}"
-libdir = "${exec_prefix}/lib/${OLD_MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
-libexecdir = "${exec_prefix}/libexec/${OLD_MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
+libdir = "${exec_prefix}/lib/${OLD_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
+libexecdir = "${exec_prefix}/libexec/${OLD_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 FILES_${PN} = "${prefix}"
 FILES_${PN}-dbg += "${prefix}/.debug \
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6358d39..14c90ec 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -5,8 +5,8 @@ SSTATE_MANFILEBASE = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-"
 SSTATE_MANFILEPREFIX = "${SSTATE_MANFILEBASE}${PN}"
 
 
-SSTATE_PKGARCH    = "${MULTIMACH_ARCH}"
-SSTATE_PKGSPEC    = "sstate-${PN}-${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}-${PV}-${PR}-${SSTATE_PKGARCH}-${SSTATE_VERSION}-"
+SSTATE_PKGARCH    = "${PACKAGE_ARCH}"
+SSTATE_PKGSPEC    = "sstate-${PN}-${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}-${PV}-${PR}-${SSTATE_PKGARCH}-${SSTATE_VERSION}-"
 SSTATE_PKGNAME    = "${SSTATE_PKGSPEC}${BB_TASKHASH}"
 SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c05d736..4e89500 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -99,9 +99,8 @@ PACKAGE_ARCHS = "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
 # since machine specific packages are handled using multimachine
 PACKAGE_ARCHS[vardepsexclude] = "MACHINE_ARCH"
 
-MULTIMACH_ARCH = "${PACKAGE_ARCH}"
-MULTIMACH_TARGET_SYS = "${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
-MULTIMACH_HOST_SYS = "${MULTIMACH_ARCH}${HOST_VENDOR}-${HOST_OS}"
+MULTIMACH_TARGET_SYS = "${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
+MULTIMACH_HOST_SYS = "${PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 BASEPKG_HOST_SYS = "${BASE_PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 BASEPKG_TARGET_SYS = "${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
@@ -317,8 +316,6 @@ STAGING_INCDIR_NATIVE = "${STAGING_DIR_NATIVE}${includedir_native}"
 STAGING_ETCDIR_NATIVE = "${STAGING_DIR_NATIVE}${sysconfdir_native}"
 STAGING_DATADIR_NATIVE = "${STAGING_DIR_NATIVE}${datadir_native}"
 
-# This should really be MULTIMACH_HOST_SYS but that breaks "all" and machine 
-# specific packages - hack around it for now.
 STAGING_DIR_HOST = "${STAGING_DIR}/${MACHINE}"
 STAGING_BINDIR = "${STAGING_DIR_HOST}${bindir}"
 STAGING_LIBDIR = "${STAGING_DIR_HOST}${libdir}"
@@ -329,8 +326,6 @@ STAGING_LOADER_DIR = "${STAGING_DIR_HOST}/loader"
 STAGING_FIRMWARE_DIR = "${STAGING_DIR_HOST}/firmware"
 STAGING_PYDIR = "${STAGING_DIR}/lib/python2.4"
 
-# This should really be MULTIMACH_TARGET_SYS but that breaks "all" and machine 
-# specific packages - hack around it for now.
 STAGING_DIR_TARGET = "${STAGING_DIR}/${MACHINE}"
 STAGING_DIR_TCBOOTSTRAP = "${STAGING_DIR_TARGET}-tcbootstrap"
 
-- 
1.7.4.1



