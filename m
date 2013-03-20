Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UIGRQ-0004IN-1L
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 11:40:20 +0100
Received: from mail72-va3-R.bigfish.com (10.7.14.247) by
	VA3EHSOBE012.bigfish.com (10.7.40.62) with Microsoft SMTP Server id
	14.1.225.23; Wed, 20 Mar 2013 09:38:00 +0000
Received: from mail72-va3 (localhost [127.0.0.1])	by mail72-va3-R.bigfish.com
	(Postfix) with ESMTP id BBF23C056E	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 09:38:00 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail72-va3 (localhost.localdomain [127.0.0.1]) by mail72-va3
	(MessageSwitch) id 1363772153843135_20937;
	Wed, 20 Mar 2013 09:35:53 +0000 (UTC)
Received: from VA3EHSMHS009.bigfish.com (unknown [10.7.14.248])	by
	mail72-va3.bigfish.com (Postfix) with ESMTP id C6943A034A	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 09:35:53 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS009.bigfish.com
	(10.7.99.19) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 20 Mar 2013 09:35:51 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 20 Mar 2013 09:35:50 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r2K9ZkVZ013265;
	Wed, 20 Mar 2013 02:35:48 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2013 17:39:55 +0800
Message-ID: <1363772395-25682-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: B40290@freescale.com, Zhenhua Luo <zhenhua.luo@freescale.com>
Subject: rpm: split out run-postinsts
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
X-List-Received-Date: Wed, 20 Mar 2013 10:40:20 -0000
Content-Type: text/plain

Split out run-postinsts script into separated package, sometimes only the
postinsts script is required to run all postinsts scripts in /etc/rpm-postinsts/
instead of the whole rpm package

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 6286771..896e3a4 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r61"
+PR = "r62"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -223,9 +223,11 @@ FILES_${PN} =  "${bindir}/rpm \
 		${libdir}/rpm/bin/wget \
 		/var/lib/rpm \
 		/var/cache/rpm \
-		${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
 		"
 
+FILES_${PN}-postinsts = "${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
+                "
+
 FILES_${PN}-dbg += "${libdir}/rpm/.debug \
 		${libdir}/rpm/bin/.debug \
 		"
-- 
1.7.9.5




