Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCH-0000a1-D5
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Aug 2012 05:14:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181210"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:02 +0300
Message-Id: <9746720f56d69918dd6c829268757dfb5d03226d.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 15/64] powertop: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:09 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/powertop/powertop_1.13.bb |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/powertop/powertop_1.13.bb b/meta/recipes-kernel/powertop/powertop_1.13.bb
index b4f45dd..db54ed0 100644
--- a/meta/recipes-kernel/powertop/powertop_1.13.bb
+++ b/meta/recipes-kernel/powertop/powertop_1.13.bb
@@ -11,7 +11,7 @@ DEPENDS = "virtual/libintl ncurses"
 # powertop 1.13 needs lspci
 RDEPENDS_${PN} = "pciutils"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.lesswatts.org/projects/powertop/download/powertop-${PV}.tar.gz \
            file://stub_out_the_ncurses_calls_in_dump_mode.patch \
@@ -25,12 +25,6 @@ EXTRA_OEMAKE = "VERSION=\"${PV}\" EXTRA_LIBS=${EXTRA_LIBS}"
 
 EXTRA_LIBS_libc-uclibc = "-lintl"
 
-inherit update-alternatives
-ALTERNATIVE_NAME = "powertop"
-ALTERNATIVE_PATH = "${bindir}/powertop"
-ALTERNATIVE_LINK = "${base_bindir}/powertop"
-ALTERNATIVE_PRIORITY = "100"
-
 do_configure() {
 	# We do not build ncurses with wide char support
 	sed -i -e 's:lncursesw:lncurses ${EXTRA_LIBS}:g' ${S}/Makefile
@@ -40,3 +34,8 @@ do_install() {
 	oe_runmake install DESTDIR=${D}
 }
 
+inherit update-alternatives
+ALTERNATIVE_${PN} = "powertop"
+ALTERNATIVE_TARGET[powertop] = "${bindir}/powertop"
+ALTERNATIVE_LINK_NAME[powertop] = "${base_bindir}/powertop"
+ALTERNATIVE_PRIORITY = "100"
-- 
1.7.7.6



