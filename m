Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QdmMC-0005V2-Nn
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 18:50:48 +0200
Received: by rex (Postfix, from userid 1000)
	id CF2C3308E3; Mon,  4 Jul 2011 17:46:32 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2011 17:46:24 +0100
Message-Id: <ca1da932acdd18477e136196871d65df288f2899.1309797628.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <d9a975fe45667bec7ec11697106d5975ffe9b835.1309797628.git.richard.purdie@linuxfoundation.org>
References: <d9a975fe45667bec7ec11697106d5975ffe9b835.1309797628.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309797628.git.richard.purdie@linuxfoundation.org>
References: <cover.1309797628.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/8] libgsmd: Fix QA warnings
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
X-List-Received-Date: Mon, 04 Jul 2011 16:50:49 -0000

Signed-off-by: Richard  Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/gsm/gsmd.inc |   26 +++++++++++++++++++-------
 1 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/gsm/gsmd.inc b/meta/recipes-connectivity/gsm/gsmd.inc
index b2aebb1..682456b 100644
--- a/meta/recipes-connectivity/gsm/gsmd.inc
+++ b/meta/recipes-connectivity/gsm/gsmd.inc
@@ -35,11 +35,13 @@ PACKAGES =+ "\
   ${PN}-tools \
   ${BASEPN}-plugins \
   ${BASEPN}-plugin-machine-generic \
+  ${BASEPN}-plugin-machine-telit \
   ${BASEPN}-plugin-machine-tihtc \
   ${BASEPN}-plugin-machine-gta01 \
   ${BASEPN}-plugin-vendor-bcm \
   ${BASEPN}-plugin-vendor-qc \
   ${BASEPN}-plugin-vendor-ti \
+  ${BASEPN}-plugin-vendor-telit \
   ${BASEPN}-plugin-vendor-tihtc \
 "
 
@@ -47,11 +49,13 @@ ALLOW_EMPTY_${BASEPN}-plugin-machine-gta01 = "1"
 
 RDEPENDS_${BASEPN}-plugins = "\
   ${BASEPN}-plugin-machine-generic \
+  ${BASEPN}-plugin-machine-telit \
   ${BASEPN}-plugin-machine-tihtc \
   ${BASEPN}-plugin-machine-gta01 \
   ${BASEPN}-plugin-vendor-bcm \
   ${BASEPN}-plugin-vendor-qc \
   ${BASEPN}-plugin-vendor-ti \
+  ${BASEPN}-plugin-vendor-telit \
   ${BASEPN}-plugin-vendor-tihtc \
 "
 
@@ -59,15 +63,19 @@ RDEPENDS_${PN} += "update-rc.d initscripts"
 RRECOMMENDS_${PN} += "${BASEPN}-plugins"
 
 FILES_${PN}-dbg += "${libdir}/gsmd/.debug/*"
+FILES_${PN}-dev += "${libdir}/gsmd/*.so ${libdir}/gsmd/*.la"
+FILES_${PN}-staticdev += "${libdir}/gsmd/*.a"
 FILES_${PN}-tools = "${bindir}/*"
 FILES_${BASEPN}-plugins = ""
-FILES_${BASEPN}-plugin-machine-generic = "${libdir}/gsmd/libgsmd-machine_generic.so*"
-FILES_${BASEPN}-plugin-machine-tihtc = "${libdir}/gsmd/libgsmd-machine_tihtc.so*"
-FILES_${BASEPN}-plugin-machine-gta01 = "${libdir}/gsmd/libgsmd-machine_gta01.so*"
-FILES_${BASEPN}-plugin-vendor-qc = "${libdir}/gsmd/libgsmd-vendor_qc.so*"
-FILES_${BASEPN}-plugin-vendor-bcm = "${libdir}/gsmd/libgsmd-vendor_bcm.so*"
-FILES_${BASEPN}-plugin-vendor-ti = "${libdir}/gsmd/libgsmd-vendor_ti.so*"
-FILES_${BASEPN}-plugin-vendor-tihtc = "${libdir}/gsmd/libgsmd-vendor_tihtc.so*"
+FILES_${BASEPN}-plugin-machine-generic = "${libdir}/gsmd/libgsmd-machine_generic.so.*"
+FILES_${BASEPN}-plugin-machine-tihtc = "${libdir}/gsmd/libgsmd-machine_tihtc.so.*"
+FILES_${BASEPN}-plugin-machine-telit = "${libdir}/gsmd/libgsmd-machine_telit.so.*"
+FILES_${BASEPN}-plugin-machine-gta01 = "${libdir}/gsmd/libgsmd-machine_gta01.so.*"
+FILES_${BASEPN}-plugin-vendor-qc = "${libdir}/gsmd/libgsmd-vendor_qc.so.*"
+FILES_${BASEPN}-plugin-vendor-bcm = "${libdir}/gsmd/libgsmd-vendor_bcm.so.*"
+FILES_${BASEPN}-plugin-vendor-ti = "${libdir}/gsmd/libgsmd-vendor_ti.so.*"
+FILES_${BASEPN}-plugin-vendor-telit = "${libdir}/gsmd/libgsmd-vendor_telit.so.*"
+FILES_${BASEPN}-plugin-vendor-tihtc = "${libdir}/gsmd/libgsmd-vendor_tihtc.so.*"
 
 PACKAGES_DYNAMIC = "lib${BASEPN}* ${BASEPN}"
 
@@ -77,20 +85,24 @@ RCONFLICTS_lib${BASEPN} = "lib${CONFLICTNAME}"
 RCONFLICTS_${BASEPN} = "${CONFLICTNAME}"
 RCONFLICTS_${BASEPN}-plugins = "${CONFLICTNAME}-plugins"
 RCONFLICTS_${BASEPN}-plugin-machine-generic = "${CONFLICTNAME}-plugin-machine-generic"
+RCONFLICTS_${BASEPN}-plugin-machine-telit = "${CONFLICTNAME}-plugin-machine-telit"
 RCONFLICTS_${BASEPN}-plugin-machine-tihtc = "${CONFLICTNAME}-plugin-machine-tihtc"
 RCONFLICTS_${BASEPN}-plugin-machine-gta01 = "${CONFLICTNAME}-plugin-machine-gta01"
 RCONFLICTS_${BASEPN}-plugin-vendor-qc = "${CONFLICTNAME}-plugin-vendor-qc"
 RCONFLICTS_${BASEPN}-plugin-vendor-bcm = "${CONFLICTNAME}-plugin-vendor-bcm"
 RCONFLICTS_${BASEPN}-plugin-vendor-ti = "${CONFLICTNAME}-plugin-vendor-ti"
+RCONFLICTS_${BASEPN}-plugin-vendor-telit = "${CONFLICTNAME}-plugin-vendor-telit"
 RCONFLICTS_${BASEPN}-plugin-vendor-tihtc = "${CONFLICTNAME}-plugin-vendor-tihtc"
 
 RPROVIDES_lib${BASEPN} += "lib${CONFLICTNAME}"
 RPROVIDES_${BASEPN} = "${CONFLICTNAME}"
 RPROVIDES_${BASEPN}-plugins = "${CONFLICTNAME}-plugins"
 RPROVIDES_${BASEPN}-plugin-machine-generic = "${CONFLICTNAME}-plugin-machine-generic"
+RPROVIDES_${BASEPN}-plugin-machine-telit = "${CONFLICTNAME}-plugin-machine-telit"
 RPROVIDES_${BASEPN}-plugin-machine-tihtc = "${CONFLICTNAME}-plugin-machine-tihtc"
 RPROVIDES_${BASEPN}-plugin-machine-gta01 = "${CONFLICTNAME}-plugin-machine-gta01"
 RPROVIDES_${BASEPN}-plugin-vendor-qc = "${CONFLICTNAME}-plugin-vendor-qc"
 RPROVIDES_${BASEPN}-plugin-vendor-bcm = "${CONFLICTNAME}-plugin-vendor-bcm"
 RPROVIDES_${BASEPN}-plugin-vendor-ti = "${CONFLICTNAME}-plugin-vendor-ti"
+RPROVIDES_${BASEPN}-plugin-vendor-telit = "${CONFLICTNAME}-plugin-vendor-telit"
 RPROVIDES_${BASEPN}-plugin-vendor-tihtc = "${CONFLICTNAME}-plugin-vendor-tihtc"
-- 
1.7.4.1



