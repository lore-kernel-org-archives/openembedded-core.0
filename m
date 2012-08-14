Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCX-0000ne-Sk
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:26 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181340"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:16 +0300
Message-Id: <929a33fc6f791a470cf6c19147c2ccb6d7a2f32f.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 29/64] procps: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:26 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/procps/procps.inc      |    9 +++++++--
 meta/recipes-extended/procps/procps_3.2.8.bb |    9 +--------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-extended/procps/procps.inc b/meta/recipes-extended/procps/procps.inc
index 80080fc..6ee4a04 100644
--- a/meta/recipes-extended/procps/procps.inc
+++ b/meta/recipes-extended/procps/procps.inc
@@ -13,8 +13,13 @@ DEPENDS = "ncurses"
 SRC_URI = "http://procps.sourceforge.net/procps-${PV}.tar.gz \
            file://install.patch"
 
-inherit autotools
+inherit autotools update-alternatives
 
 FILES_${PN} += "${libdir}/*-${PV}.so ${base_libdir}/*-${PV}.so"
 FILES_SOLIBSDEV = ""
-FILES_${PN} += ""
+
+ALTERNATIVE_${PN} = "top uptime free pkill pmap kill sysctl ps pgrep pwdx watch"
+ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
+ALTERNATIVE_LINK_NAME[sysctl] = "${base_sbindir}/sysctl"
+ALTERNATIVE_LINK_NAME[ps] = "${base_bindir}/ps"
+ALTERNATIVE_PRIORITY = "110"
diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index 5508eb0..7b011a0 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -1,13 +1,6 @@
 require procps.inc
 
-PR = "r8"
-
-inherit update-alternatives
-
-ALTERNATIVE_LINKS = "${bindir}/top ${bindir}/uptime ${bindir}/free ${bindir}/pkill ${bindir}/pmap \
-                     ${base_bindir}/kill ${base_sbindir}/sysctl ${base_bindir}/ps \
-                     ${bindir}/pgrep ${bindir}/pwdx ${bindir}/watch"
-ALTERNATIVE_PRIORITY = "110"
+PR = "r9"
 
 SRC_URI += "file://procmodule.patch \
             file://psmodule.patch \
-- 
1.7.7.6



