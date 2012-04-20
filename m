Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH7L-0005tX-1G
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2012 09:45:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167853"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:04 -0700
Message-Id: <ac3fc912c2f07469d129dd3db4fd7e038224f3f0.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/43] hdparm: Use update-alternatives
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:31 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Switch to using update-alternatives, this ensures that the
call to update-alternatives and package provides are correct.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/hdparm/hdparm_9.39.bb |   16 ++++++----------
 1 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.39.bb b/meta/recipes-extended/hdparm/hdparm_9.39.bb
index ed076cc..42867a9 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.39.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.39.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=910a8a42c962d238619c75fdb78bdb24 \
                     file://wiper/GPLv2.txt;md5=fcb02dc552a041dee27e4b85c7396067 \
                     file://wiper/wiper.sh;beginline=7;endline=31;md5=b7bc642addc152ea307505bf1a296f09"
 
-PR = "r1"
+PR = "r2"
 
 PACKAGES += "wiper"
 
@@ -24,17 +24,13 @@ SRC_URI[sha256sum] = "72d550af4526aa96f0841c79321a0ee39d636cbaf1f294e52193e90c05
 
 EXTRA_OEMAKE += 'STRIP="echo"'
 
+inherit update-alternatives
+
+ALTERNATIVE_LINKS = "${base_sbindir}/hdparm"
+ALTERNATIVE_PRIORITY = "100"
+
 do_install () {
 	install -d ${D}/${base_sbindir} ${D}/${mandir}/man8 ${D}/${bindir}
 	oe_runmake 'DESTDIR=${D}' 'sbindir=${base_sbindir}' install
-	mv ${D}${base_sbindir}/hdparm ${D}${base_sbindir}/hdparm.${PN}
 	cp ${S}/wiper/wiper.sh ${D}/${bindir}
 }
-
-pkg_postinst_${PN} () {
-	update-alternatives --install ${base_sbindir}/hdparm hdparm hdparm.${PN} 100
-}
-
-pkg_prerm_${PN} () {
-	update-alternatives --remove hdparm hdparm.${PN}
-}
-- 
1.7.7.6



