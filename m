Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlFgu-0001mf-7c
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 09:35:04 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2011 00:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,259,1309762800"; d="scan'208";a="31038672"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2011 00:30:46 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 00:30:40 -0700
Message-Id: <8c205878ed523de45ca31dc70cc54cc10f932db3.1311578785.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311578785.git.sgw@linux.intel.com>
References: <cover.1311578785.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311578785.git.sgw@linux.intel.com>
References: <cover.1311578785.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED 25 July PULL 4/7] openjade-native: Add SYSROOT_PREPROCESS_FUNC
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
X-List-Received-Date: Mon, 25 Jul 2011 07:35:04 -0000

[YOCTO #1250]

This added function will install a private install-catalog binary so that shared state
can find the binary as there is not a guarantee.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../openjade/openjade-native_1.3.2.bb              |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index 1c672e1..da59406 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -7,7 +7,7 @@ SECTION = "base"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=641ff1e4511f0a87044ad42f87cb1045"
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "opensp-native sgml-common-native"
 RDEPENDS_${PN} = "sgml-common"
@@ -31,6 +31,8 @@ CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('--datadir=${datadi
 CFLAGS =+ "-I${S}/include"
 
 SSTATEPOSTINSTFUNCS += "openjade_sstate_postinst"
+SYSROOT_PREPROCESS_FUNCS += "openjade_sysroot_preprocess"
+
 
 # We need to do this else the source interdependencies aren't generated and
 # build failures can result (e.g. zero size style/Makefile.dep file)
@@ -66,8 +68,14 @@ openjade_sstate_postinst() {
 	then
 		# Ensure that the catalog file sgml-docbook.cat is properly
 		# updated when the package is installed from sstate cache.
-		install-catalog \
+		${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-openjade \
 			--add ${sysconfdir}/sgml/sgml-docbook.cat \
 			${sysconfdir}/sgml/openjade-${PV}.cat
 	fi
 }
+
+openjade_sysroot_preprocess () {
+    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+    install -m 755 ${STAGING_BINDIR_NATIVE}/install-catalog ${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-openjade
+}
+
-- 
1.7.3.4



