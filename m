Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TPE5i-000719-E8 for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 17:02:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9JEn5Yl031809
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 15:49:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31641-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 15:49:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9JEmteC031803
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 15:48:56 +0100
Message-ID: <1350658135.2520.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Oct 2012 15:48:55 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate: Improve handling of machine specific manifests
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
X-List-Received-Date: Fri, 19 Oct 2012 15:02:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Now do_package isn't machine specific, we're only left with do_populate_sysroot as a
machine specific task. This change marks only the machine specific manifests as machine
specific, defaulting to PACKAGE_ARCH for everything else.

This means we do less work where there are multiple machines using the same
core package architecture and we can start to clean up the sstate duplicate files
whitelist.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d2a120b..dee84bf 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -17,10 +17,7 @@ SSTATE_EXTRAPATH   = ""
 SSTATE_EXTRAPATHWILDCARD = ""
 SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/${SSTATE_PKGSPEC}"
 
-# In theory we should be using:
-# SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/ ${DEPLOY_DIR_IPK}/all/ ${DEPLOY_DIR_RPM}/all ${DEPLOY_DIR_DEB}/all/ ${TMPDIR}/pkgdata/all${TARGET_VENDOR}-${TARGET_OS}"
-# However until do_package is not machine specific, we'll have to make do with all of deploy/pkgdata.
-SSTATE_DUPWHITELIST = "${DEPLOY_DIR}/ ${TMPDIR}/pkgdata/"
+SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/"
 # Also need to make cross recipes append to ${PN} and install once for any given PACAGE_ARCH so
 # can avoid multiple installs (e.g. routerstationpro+qemumips both using mips32)
 SSTATE_DUPWHITELIST += "${STAGING_LIBDIR_NATIVE}/${MULTIMACH_TARGET_SYS} ${STAGING_DIR_NATIVE}/usr/libexec/${MULTIMACH_TARGET_SYS} ${STAGING_BINDIR_NATIVE}/${MULTIMACH_TARGET_SYS} ${STAGING_DIR_NATIVE}${includedir_native}/gcc-build-internal-${MULTIMACH_TARGET_SYS}"
@@ -53,9 +50,8 @@ python () {
         d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}_${PACKAGE_ARCH}"))
     elif bb.data.inherits_class('allarch', d):
         d.setVar('SSTATE_PKGARCH', "allarch")
-        d.setVar('SSTATE_MANMACH', d.expand("allarch_${MACHINE}"))
     else:
-        d.setVar('SSTATE_MANMACH', d.expand("${MACHINE}"))
+        d.setVar('SSTATE_MANMACH', d.expand("${PACKAGE_ARCH}"))
 
     if bb.data.inherits_class('native', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross', d):
         d.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
@@ -125,6 +121,9 @@ def sstate_install(ss, d):
     shareddirs = []
     bb.mkdirhier(d.expand("${SSTATE_MANIFESTS}"))
     manifest = d.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['name'])
+    extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', True)
+    if extrainf:
+        manifest = manifest + "." + extrainf
 
     if os.access(manifest, os.R_OK):
         bb.fatal("Package already staged (%s)?!" % manifest)
@@ -307,6 +306,9 @@ def sstate_clean(ss, d):
     import oe.path
 
     manifest = d.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['name'])
+    extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', True)
+    if extrainf:
+        manifest = manifest + "." + extrainf
 
     if os.path.exists(manifest):
         locks = []
@@ -321,7 +323,6 @@ def sstate_clean(ss, d):
             bb.utils.unlockfile(lock)
 
     stfile = d.getVar("STAMP", True) + ".do_" + ss['task']
-    extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', True)
     oe.path.remove(stfile)
     oe.path.remove(stfile + "_setscene")
     if extrainf:




