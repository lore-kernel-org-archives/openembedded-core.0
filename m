Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlFgv-0001mf-92
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 09:35:05 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2011 00:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,259,1309762800"; d="scan'208";a="31038676"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2011 00:30:46 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 00:30:42 -0700
Message-Id: <a4b8591a283717239cae976004eee86b2b65082b.1311578785.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311578785.git.sgw@linux.intel.com>
References: <cover.1311578785.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311578785.git.sgw@linux.intel.com>
References: <cover.1311578785.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED 25 July PULL 6/7] docbook-dsssl-stylesheets-native: Add SYSROOT_PREPROCESS_FUNC
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
X-List-Received-Date: Mon, 25 Jul 2011 07:35:05 -0000

[YOCTO #1250]

This added function will install a private install-catalog binary so that shared state
can find the binary as there is not a guarantee.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../docbook-dsssl-stylesheets-native_1.79.bb       |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb b/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
index 88d24dd..a776ea5 100644
--- a/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
+++ b/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=41;endline=74;md5=875385159b2ee76ecf
 
 DEPENDS = "sgml-common-native"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/docbook/docbook-dsssl-${PV}.tar.bz2"
 
@@ -19,6 +19,8 @@ S = "${WORKDIR}/docbook-dsssl-${PV}"
 inherit native
 
 SSTATEPOSTINSTFUNCS += "docbook_dsssl_stylesheets_sstate_postinst"
+SYSROOT_PREPROCESS_FUNCS += "docbook_dsssl_sysroot_preprocess"
+
 
 do_install () {
 	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/docbook-dsssl.html
@@ -42,8 +44,14 @@ docbook_dsssl_stylesheets_sstate_postinst () {
 	then
 		# Ensure that the catalog file sgml-docbook.cat is properly
 		# updated when the package is installed from sstate cache.
-		install-catalog \
+		${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-dsssl \
 			--add ${sysconfdir}/sgml/sgml-docbook.cat \
 			${sysconfdir}/sgml/dsssl-docbook-stylesheets.cat
 	fi
 }
+
+docbook_dsssl_sysroot_preprocess () {
+    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+    install -m 755 ${STAGING_BINDIR_NATIVE}/install-catalog ${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-dsssl
+}
+
-- 
1.7.3.4



