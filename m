Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1SosB1-0001GS-CY
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 10:21:39 +0200
Received: from mail217-va3-R.bigfish.com (10.7.14.252) by
	VA3EHSOBE008.bigfish.com (10.7.40.28) with Microsoft SMTP Server id
	14.1.225.23; Wed, 11 Jul 2012 07:22:55 +0000
Received: from mail217-va3 (localhost [127.0.0.1])	by
	mail217-va3-R.bigfish.com (Postfix) with ESMTP id 9D2D180129	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 07:22:55 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail217-va3 (localhost.localdomain [127.0.0.1]) by mail217-va3
	(MessageSwitch) id 1341991374974933_30210;
	Wed, 11 Jul 2012 07:22:54 +0000 (UTC)
Received: from VA3EHSMHS010.bigfish.com (unknown [10.7.14.247])	by
	mail217-va3.bigfish.com (Postfix) with ESMTP id EA96C300054	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 07:22:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS010.bigfish.com
	(10.7.99.20) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 11 Jul 2012 07:22:53 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Wed, 11 Jul 2012 02:25:14 -0500
Received: from localhost.localdomain (bjsimics-desktop.ap.freescale.net
	[10.192.208.197])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id q6B7PBq1017218;	Wed, 11 Jul 2012 00:25:12 -0700
From: <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 15:42:17 +0800
Message-ID: <1341992537-22179-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] valgrind: fix default.supp missing issue
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
X-List-Received-Date: Wed, 11 Jul 2012 08:21:39 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    When run valgrind, following error appears:
    ==2254== FATAL: can't open suppressions file "/usr/lib/valgrind/default.supp"

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
index 6b54472..bb954bd 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
 
 X11DEPENDS = "virtual/libx11"
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 	   file://fix_issue_caused_by_ccache.patch \
@@ -32,6 +32,10 @@ EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi"
 EXTRA_OEMAKE = "-w"
 PARALLEL_MAKE = ""
 
+do_install_append () {
+    install -m 644 ${S}/default.supp ${D}/${libdir}/valgrind/
+}
+
 FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"
 RRECOMMENDS_${PN}_powerpc += "${TCLIBC}-dbg"
 RRECOMMENDS_${PN}_powerpc64 += "${TCLIBC}-dbg"
-- 
1.7.0.4




