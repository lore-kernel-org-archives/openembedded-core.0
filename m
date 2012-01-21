Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RoTT7-0001lA-7k
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 06:26:25 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2012 21:18:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="101117503"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.79])
	by orsmga002.jf.intel.com with ESMTP; 20 Jan 2012 21:18:41 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 21:18:22 -0800
Message-Id: <ba4c4a24941fb436819f8106433c72d797bceceb.1327123057.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327123057.git.sgw@linux.intel.com>
References: <cover.1327123057.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327123057.git.sgw@linux.intel.com>
References: <cover.1327123057.git.sgw@linux.intel.com>
Subject: [PATCH 04/20] augeas: refactor packages for staticdev
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
X-List-Received-Date: Sat, 21 Jan 2012 05:26:25 -0000

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



