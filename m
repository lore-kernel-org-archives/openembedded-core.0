Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QciLS-0003Sq-Ib
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 20:21:38 +0200
Received: by wwi14 with SMTP id 14so135154wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 11:17:53 -0700 (PDT)
Received: by 10.227.202.209 with SMTP id ff17mr3225126wbb.23.1309544273402;
	Fri, 01 Jul 2011 11:17:53 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fu18sm2526059wbb.10.2011.07.01.11.17.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 11:17:52 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2011 20:17:47 +0200
Message-Id: <1309544267-24186-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] ppp: sync packaging with OE .dev
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
X-List-Received-Date: Fri, 01 Jul 2011 18:21:38 -0000

This fixes the QA errors and the 2.4.3 vs 2.4.5 copy/paste mistake

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb |   26 ++++++++++++++------------
 1 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
index b865afd..72464bf 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
                     file://chat/chat.c;beginline=1;endline=15;md5=0d374b8545ee5c62d7aff1acbd38add2"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://makefile.patch \
@@ -31,7 +31,8 @@ SRC_URI[sha256sum] = "43317afec9299f9920b96f840414c977f0385410202d48e56d2fdb8230
 
 inherit autotools
 
-EXTRA_OEMAKE = "STRIPPROG=${STRIP} MANDIR=${D}${datadir}/man/man8 INCDIR=${D}/usr/include LIBDIR=${D}/usr/lib/pppd/${PV} BINDIR=${D}/usr/sbin"
+TARGET_CC_ARCH += " ${LDFLAGS}"
+EXTRA_OEMAKE = "STRIPPROG=${STRIP} MANDIR=${D}${datadir}/man/man8 INCDIR=${D}${includedir} LIBDIR=${D}${libdir}/pppd/${PV} BINDIR=${D}${sbindir}"
 EXTRA_OECONF = "--disable-strip"
 
 do_install_append () {
@@ -50,16 +51,17 @@ do_install_append () {
 }
 
 CONFFILES_${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options"
-PACKAGES += "ppp-oa ppp-oe ppp-radius ppp-winbind ppp-minconn ppp-password ppp-tools"
-FILES_${PN}        = "/etc /usr/bin /usr/sbin/chat /usr/sbin/pppd"
-FILES_${PN}-dbg += "${libdir}/pppd/2.4.3/.debug"
-FILES_ppp-oa       = "/usr/lib/pppd/2.4.3/pppoatm.so"
-FILES_ppp-oe       = "/usr/sbin/pppoe-discovery /usr/lib/pppd/2.4.3/rp-pppoe.so"
-FILES_ppp-radius   = "/usr/lib/pppd/2.4.3/radius.so /usr/lib/pppd/2.4.3/radattr.so /usr/lib/pppd/2.4.3/radrealms.so"
-FILES_ppp-winbind  = "/usr/lib/pppd/2.4.3/winbind.so"
-FILES_ppp-minconn  = "/usr/lib/pppd/2.4.3/minconn.so"
-FILES_ppp-password = "/usr/lib/pppd/2.4.3/pass*.so"
-FILES_ppp-tools    = "/usr/sbin/pppstats /usr/sbin/pppdump"
+PACKAGES =+ "ppp-oa ppp-oe ppp-radius ppp-winbind ppp-minconn ppp-password ppp-tools"
+FILES_${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd"
+FILES_${PN}_nylon  = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd ${sbindir}/tdbread"
+FILES_${PN}-dbg += "${libdir}/pppd/${PV}/.debug"
+FILES_${PN}-oa       = "${libdir}/pppd/${PV}/pppoatm.so"
+FILES_${PN}-oe       = "${sbindir}/pppoe-discovery ${libdir}/pppd/${PV}/rp-pppoe.so"
+FILES_${PN}-radius   = "${libdir}/pppd/${PV}/radius.so ${libdir}/pppd/${PV}/radattr.so ${libdir}/pppd/${PV}/radrealms.so"
+FILES_${PN}-winbind  = "${libdir}/pppd/${PV}/winbind.so"
+FILES_${PN}-minconn  = "${libdir}/pppd/${PV}/minconn.so"
+FILES_${PN}-password = "${libdir}/pppd/${PV}/pass*.so"
+FILES_${PN}-tools    = "${sbindir}/pppstats ${sbindir}/pppdump"
 DESCRIPTION_ppp-oa       = "Plugin for PPP needed for PPP-over-ATM"
 DESCRIPTION_ppp-oe       = "Plugin for PPP needed for PPP-over-Ethernet"
 DESCRIPTION_ppp-radius   = "Plugin for PPP that are related to RADIUS"
-- 
1.6.6.1



