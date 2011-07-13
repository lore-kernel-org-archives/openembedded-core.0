Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qgu19-0003mE-Sm
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 09:38:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jul 2011 00:33:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="25272052"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.40])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2011 00:33:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 00:33:36 -0700
Message-Id: <a5da87cc3fda0f912b253ce02dfe2c14bba0e020.1310541680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
Subject: [PATCH V2 04/25] wireless-tools: Updated for staticdevpackaging
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
X-List-Received-Date: Wed, 13 Jul 2011 07:38:00 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../wireless-tools/wireless-tools_29.bb            |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
index cc51dec..29a8f0a 100644
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 			file://sample_enc.c;beginline=1;endline=4;md5=838372be07874260b566bae2f6ed33b6"
 SECTION = "base"
 PE = "1"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.29.tar.gz \
            file://man.patch;apply=yes \
@@ -40,14 +40,16 @@ do_install() {
 	#install ${WORKDIR}/zzz-wireless.if-pre-up ${D}${sysconfdir}/network/if-pre-up.d/zzz-wireless
 }
 
-PACKAGES = "libiw-dbg ifrename-dbg ${PN}-dbg \
-libiw libiw-dev libiw-doc ifrename-doc ifrename ${PN} ${PN}-doc"
+PACKAGES += "libiw libiw-dev libiw-dbg libiw-doc libiw-staticdev \
+             ifrename-dbg ifrename-doc ifrename"
 
-FILES_libiw-dbg = "${libdir}/.debug/*.so.*"
+FILES_libiw-dbg = "${libdir}/.debug/*${SOLIBS}"
 FILES_ifrename-dbg = "${sbindir}/.debug/ifrename"
-FILES_libiw = "${libdir}/*.so.*"
-FILES_libiw-dev = "${libdir}/*.a ${libdir}/*.so ${includedir}"
+FILES_libiw = "${libdir}/*${SOLIBS}"
+FILES_libiw-dev = "${libdir}/${SOLIBSDEV} ${includedir}"
 FILES_libiw-doc = "${mandir}/man7"
+FILES_libiw-staticdev = "${libdir}/*.a"
+RDEPENDS_libiw-staticdev = "libiw-dev (= ${EXTENDPKGV})"
 FILES_ifrename = "${sbindir}/ifrename"
 FILES_ifrename-doc = "${mandir}/man8/ifrename.8 ${mandir}/man5/iftab.5"
 FILES_${PN} = "${bindir} ${sbindir}/iw* ${base_sbindir} ${base_bindir} ${sysconfdir}/network"
-- 
1.7.3.4



