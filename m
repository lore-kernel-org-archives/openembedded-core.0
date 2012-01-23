Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpOrN-0004vA-Gq
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 19:43:18 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Jan 2012 10:34:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59212154"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.82])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Jan 2012 10:34:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 10:34:09 -0800
Message-Id: <1b8774710e4df35e9892c2ae052baac659d58b76.1327343524.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
Subject: [PATCH v2 04/21] augeas: refactor packages for staticdev
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
X-List-Received-Date: Mon, 23 Jan 2012 18:43:18 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/augeas/augeas.inc       |    7 ++++---
 meta/recipes-extended/augeas/augeas_0.10.0.bb |    2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
index 0c6d534..40be762 100644
--- a/meta/recipes-extended/augeas/augeas.inc
+++ b/meta/recipes-extended/augeas/augeas.inc
@@ -11,11 +11,12 @@ DEPENDS = "readline"
 
 inherit autotools
 
-PACKAGES =+ "${PN}-lenses lib${BPN} lib${BPN}-dev lib${BPN}-dbg"
+PACKAGES =+ "${PN}-lenses lib${BPN} lib${BPN}-dev lib${BPN}-staticdev lib${BPN}-dbg"
 
 FILES_${PN}-lenses = "${datadir}/augeas/lenses"
-FILES_lib${BPN} = "${libdir}/*.so.*"
-FILES_lib${BPN}-dev = "${libdir}/*.so ${libdir}/*.a ${libdir}/*.la ${includedir} ${libdir}/pkgconfig"
+FILES_lib${BPN} = "${libdir}/lib*${SOLIBS}"
+FILES_lib${BPN}-dev = "${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${includedir} ${libdir}/pkgconfig"
+FILES_lib${BPN}-staticdev = "${libdir}/*.a"
 FILES_lib${BPN}-dbg = "${libdir}/.debug"
 
 RDEPENDS_lib${BPN} += "${PN}-lenses"
diff --git a/meta/recipes-extended/augeas/augeas_0.10.0.bb b/meta/recipes-extended/augeas/augeas_0.10.0.bb
index 734d171..00921aa 100644
--- a/meta/recipes-extended/augeas/augeas_0.10.0.bb
+++ b/meta/recipes-extended/augeas/augeas_0.10.0.bb
@@ -1,6 +1,6 @@
 require augeas.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "fe1834e90a066c3208ac0214622c7352"
 SRC_URI[sha256sum] = "ec111af06186216930176ebe5ecccdf7bf528528aee9acde1d5d70088484afca"
-- 
1.7.6.5



