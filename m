Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1986bCgEy+/z2+kGerHYo7rt986blvtwWQ=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QodgA-0000hF-E6
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:48:18 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p73Fhuve031308
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 10:43:56 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 10:43:56 -0500
Message-Id: <1312386236-11826-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] tcl: Fix packaging of platform independent files
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
X-List-Received-Date: Wed, 03 Aug 2011 15:48:18 -0000

Tcl's doesn't utilize ${baselib} for platform independent files but
defines it as follows:

TCL_LIBRARY             = $(prefix)/lib/tcl$(VERSION)

Match that so if ${baselib} is not just /lib things work properly.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-devtools/tcltk/tcl_8.5.9.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb b/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
index 12e2bd0..2eabb4d 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://../license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11
     file://../win/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
     "
 
-PR = "r0"
+PR = "r1"
 
 BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
                 file://tcl-add-soname.patch"
@@ -59,7 +59,7 @@ do_install() {
 
 PACKAGES =+ "${PN}-lib"
 FILES_${PN}-lib = "${libdir}/libtcl8.5.so*"
-FILES_${PN} += "${libdir}/tcl8.5"
+FILES_${PN} += "${prefix}/lib/tcl8.5"
 FILES_${PN}-dev += "${libdir}/tclConfig.sh"
 
 BBCLASSEXTEND = "native"
-- 
1.7.3.4



