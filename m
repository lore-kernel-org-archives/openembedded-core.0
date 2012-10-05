Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TK7zA-0000Fk-7q for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 15:30:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q95DHV1G016959
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Oct 2012 14:17:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16305-04 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2012 14:17:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q95DHLYP016953
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Oct 2012 14:17:22 +0100
Message-ID: <1349443045.15658.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 05 Oct 2012 14:17:25 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate: Add extra entries to the sstate duplicate files whitelist
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
X-List-Received-Date: Fri, 05 Oct 2012 13:30:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This avoids errors where gcc/binutils get installed to the native sysroot
in the same location for multiple package architectures. Ultimately making
these native recipes with ${PACKAGE_ARCH} appended to PN will resolve this
but hide the warnings until this gets sorted out.

Also hide the python and docbook catalog warnings since they're known about,
nothing to worry about and we'll aim to clean them up properly in the 1.4 cycle.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index e820a2e..96a3765 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -19,9 +19,15 @@ SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/${SSTATE_PKGSPEC
 
 # In theory we should be using:
 # SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/ ${DEPLOY_DIR_IPK}/all/ ${DEPLOY_DIR_RPM}/all ${DEPLOY_DIR_DEB}/all/ ${TMPDIR}/pkgdata/all${TARGET_VENDOR}-${TARGET_OS}"
-# However until do_package is not machine specific, we'll have to make do with this:
+# However until do_package is not machine specific, we'll have to make do with all of deploy/pkgdata.
 SSTATE_DUPWHITELIST = "${DEPLOY_DIR}/ ${TMPDIR}/pkgdata/"
-
+# Also need to make cross recipes append to ${PN} and install once for any given PACAGE_ARCH so
+# can avoid multiple installs (e.g. routerstationpro+qemumips both using mips32)
+SSTATE_DUPWHITELIST += "${STAGING_LIBDIR_NATIVE}/${MULTIMACH_TARGET_SYS} ${STAGING_DIR_NATIVE}/usr/libexec/${MULTIMACH_TARGET_SYS} ${STAGING_BINDIR_NATIVE}/${MULTIMACH_TARGET_SYS} ${STAGING_DIR_NATIVE}${includedir_native}/gcc-build-internal-${MULTIMACH_TARGET_SYS}"
+# Also avoid python issues until we fix the python recipe
+SSTATE_DUPWHITELIST += "${STAGING_LIBDIR}/python2.7/config/Makefile ${STAGING_LIBDIR}/libpython2.7 ${STAGING_INCDIR}/python2.7/pyconfig.h"
+# Avoid docbook/sgml catalog warnings for now
+SSTATE_DUPWHITELIST += "${STAGING_ETCDIR_NATIVE}/sgml"
 
 SSTATE_SCAN_FILES ?= "*.la *-config *_config"
 SSTATE_SCAN_CMD ?= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES", True).split())}" \) -type f'




