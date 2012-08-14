Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCQ-0000Ym-1d
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181272"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:09 +0300
Message-Id: <cf2ddbb2ac61fccdb33f57ca0d7c22ff6ee0342e.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 22/64] mktemp: cleanup update-alternatives deprecated code
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
 meta/recipes-extended/mktemp/mktemp_1.7.bb |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/mktemp/mktemp_1.7.bb b/meta/recipes-extended/mktemp/mktemp_1.7.bb
index b3a3d51..170a183 100644
--- a/meta/recipes-extended/mktemp/mktemp_1.7.bb
+++ b/meta/recipes-extended/mktemp/mktemp_1.7.bb
@@ -5,7 +5,7 @@ SECTION = "console/utils"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=430680f6322a1eb87199b5e01a82c0d4"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "ftp://ftp.mktemp.org/pub/mktemp/${BPN}-${PV}.tar.gz \
         file://disable-strip.patch \
@@ -20,12 +20,11 @@ inherit autotools update-alternatives
 EXTRA_OECONF = "--with-libc"
 
 do_install_append () {
-	mkdir ${D}${base_bindir}
-	mv ${D}${bindir}/mktemp ${D}${base_bindir}/mktemp.${BPN}
+	install -d ${D}${base_bindir}
+	mv ${D}${bindir}/mktemp ${D}${base_bindir}/mktemp
 	rmdir ${D}${bindir}
 }
 
-ALTERNATIVE_NAME = "mktemp"
-ALTERNATIVE_LINK = "${base_bindir}/mktemp"
-ALTERNATIVE_PATH = "${base_bindir}/mktemp.${BPN}"
+ALTERNATIVE_${PN} = "mktemp"
+ALTERNATIVE_LINK_NAME[mktemp] = "${base_bindir}/mktemp"
 ALTERNATIVE_PRIORITY = "100"
-- 
1.7.7.6



