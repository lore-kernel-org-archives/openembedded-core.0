Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SJv30-00007E-4p
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 01:09:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3GN00FR000395
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 16:00:00 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 16 Apr 2012 15:59:51 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 18:04:17 -0500
Message-ID: <c46df3724a1d66348996d141dda7a206a9b1c53d.1334616144.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1334616144.git.mark.hatle@windriver.com>
References: <cover.1334616144.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 06/17] hdparm: Use update-alternatives
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
X-List-Received-Date: Mon, 16 Apr 2012 23:09:26 -0000
Content-Type: text/plain

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
1.7.3.4



