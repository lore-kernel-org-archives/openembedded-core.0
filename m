Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkPc3-0005gA-Lj
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jul 2011 01:58:36 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Jul 2011 16:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,250,1309762800"; d="scan'208";a="30520851"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 22 Jul 2011 16:54:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 16:54:20 -0700
Message-Id: <0f2a735982c18259fc8f4a54b2a9da29174ff6ba.1311378711.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311378711.git.sgw@linux.intel.com>
References: <cover.1311378711.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311378711.git.sgw@linux.intel.com>
References: <cover.1311378711.git.sgw@linux.intel.com>
Subject: [PATCH 2/3] docbook-sgml-dtd-native: Add SYSROOT_PREPROCESS_FUNC
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
X-List-Received-Date: Fri, 22 Jul 2011 23:58:36 -0000

[YOCTO #1250]

This added function will install a private install-catalog binary so that shared state
can find the binary as there is not a guarantee.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../docbook-sgml-dtd/docbook-sgml-dtd-native.inc   |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
index ede7bb1..542600a 100644
--- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
+++ b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-native.inc
@@ -20,9 +20,10 @@ SRC_URI = "http://www.docbook.org/sgml/${DTD_VERSION}/docbook-${DTD_VERSION}.zip
 # The .zip file extracts to the current dir
 S = "${WORKDIR}"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 SSTATEPOSTINSTFUNCS += "docbook_sgml_dtd_sstate_postinst"
+SYSROOT_PREPROCESS_FUNCS += "docbook_sgml_dtd_sysroot_preprocess"
 
 inherit native
 
@@ -43,8 +44,14 @@ docbook_sgml_dtd_sstate_postinst () {
 	then
 		# Ensure that the catalog file sgml-docbook.cat is properly
 		# updated when the package is installed from sstate cache.
-		install-catalog \
+		${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-sgml-dtd-${DTD_VERSION} \
 			--add ${sysconfdir}/sgml/sgml-docbook.cat \
 			${sysconfdir}/sgml/sgml-docbook-dtd-${DTD_VERSION}.cat
 	fi
 }
+
+docbook_sgml_dtd_sysroot_preprocess () {
+    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+    install -m 755 ${STAGING_BINDIR_NATIVE}/install-catalog ${SYSROOT_DESTDIR}${bindir_crossscripts}/install-catalog-docbook-sgml-dtd-${DTD_VERSION}
+}
+
-- 
1.7.3.4



