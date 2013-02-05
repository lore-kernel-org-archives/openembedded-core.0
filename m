Received: from db3ehsobe005.messaging.microsoft.com ([213.199.154.143]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1U2nK9-0002x7-0V
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 19:32:56 +0100
Received: from mail19-db3-R.bigfish.com (10.3.81.254) by
	DB3EHSOBE007.bigfish.com (10.3.84.27) with Microsoft SMTP Server id
	14.1.225.23; Tue, 5 Feb 2013 17:46:53 +0000
Received: from mail19-db3 (localhost [127.0.0.1])	by mail19-db3-R.bigfish.com
	(Postfix) with ESMTP id 03A2F400190	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2013 17:46:53 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1ee6h1de0h1202h1e76h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h1155h)
Received: from mail19-db3 (localhost.localdomain [127.0.0.1]) by mail19-db3
	(MessageSwitch) id 1360086409993911_29611;
	Tue,  5 Feb 2013 17:46:49 +0000 (UTC)
Received: from DB3EHSMHS006.bigfish.com (unknown [10.3.81.251])	by
	mail19-db3.bigfish.com (Postfix) with ESMTP id F00971E0472	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2013 17:46:49 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS006.bigfish.com
	(10.3.87.106) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 5 Feb 2013 17:46:49 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Tue, 5 Feb 2013 17:46:47 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	r15Hkj8A032069	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Feb 2013 10:46:47 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Feb 2013 11:46:44 -0600
Message-ID: <1360086408-29832-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 1/5] glib: disable selinux for native builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 18:32:56 -0000
Content-Type: text/plain

This improves reusabiliy of sstate-cache across different hosts

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb |    2 +-
 meta/recipes-core/glib-2.0/glib.inc           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
index e1d44e2..fe50220 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r1"
+PR = "r2"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 53b20b6..cb391a2 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -29,7 +29,7 @@ CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap"
 
 PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '', '--disable-modular-tests', d)}"
 EXTRA_OECONF = "--enable-included-printf=no ${CORECONF} ${PTEST_CONF}"
-EXTRA_OECONF_class-native = "${CORECONF}"
+EXTRA_OECONF_class-native = "${CORECONF} --disable-selinux"
 EXTRA_OECONF_linuxstdbase = "--enable-included-printf=no ${CORECONF}"
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS} ${datadir}/glib-2.0/schemas \
-- 
1.7.9.7




