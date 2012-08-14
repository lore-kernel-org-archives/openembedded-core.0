Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCQ-0000ne-U2
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181286"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:10 +0300
Message-Id: <5cc29e574d0e2570cf84373b5e69fce3ec2f0092.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 23/64] which: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:23 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/which/which_2.18.bb |    8 ++------
 meta/recipes-extended/which/which_2.20.bb |   10 ++--------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-extended/which/which_2.18.bb b/meta/recipes-extended/which/which_2.18.bb
index d54e776..27a567c 100644
--- a/meta/recipes-extended/which/which_2.18.bb
+++ b/meta/recipes-extended/which/which_2.18.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "n/a"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.xs4all.nl/~carlo17/which/which-${PV}.tar.gz \
            file://fix_name_conflict_group_member.patch"
@@ -26,11 +26,7 @@ do_configure_prepend() {
 	NEW="-I ${STAGING_DIR_NATIVE}/${datadir}/cwautomacros/m4"
 	sed -i "s#${OLD}#${NEW}#g" `grep -rl ${OLD} ${S}`
 }
-do_install_append() {
-	mv ${D}/${bindir}/which ${D}/${bindir}/which.${BPN}
-}
 
-ALTERNATIVE_NAME = "which"
-ALTERNATIVE_PATH = "which.${BPN}"
+ALTERNATIVE_${PN} = "which"
 ALTERNATIVE_PRIORITY = "100"
 
diff --git a/meta/recipes-extended/which/which_2.20.bb b/meta/recipes-extended/which/which_2.20.bb
index 9b43943..312688f 100644
--- a/meta/recipes-extended/which/which_2.20.bb
+++ b/meta/recipes-extended/which/which_2.20.bb
@@ -8,7 +8,7 @@ DEPENDS     = "cwautomacros-native"
 
 inherit autotools update-alternatives
 
-PR = "r2"
+PR = "r3"
 
 EXTRA_OECONF = "--disable-iberty"
 
@@ -22,11 +22,5 @@ do_configure_prepend() {
 	sed -i -e 's%@ACLOCAL_CWFLAGS@%-I ${STAGING_DIR_NATIVE}/usr/share/cwautomacros/m4%g' ${S}/Makefile.am ${S}/tilde/Makefile.am
 }
 
-do_install() {
-	autotools_do_install
-	mv ${D}${bindir}/which ${D}${bindir}/which.${BPN}
-}
-
-ALTERNATIVE_NAME = "which"
-ALTERNATIVE_PATH = "which.${BPN}"
+ALTERNATIVE_${PN} = "which"
 ALTERNATIVE_PRIORITY = "100"
-- 
1.7.7.6



