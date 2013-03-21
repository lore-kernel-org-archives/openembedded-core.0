Received: from mail-db8lp0186.outbound.messaging.microsoft.com
	([213.199.154.186] helo=db8outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UIVJO-00088n-MC
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 03:33:12 +0100
Received: from mail1-db8-R.bigfish.com (10.174.8.253) by
	DB8EHSOBE013.bigfish.com (10.174.4.76) with Microsoft SMTP Server id
	14.1.225.23; Thu, 21 Mar 2013 02:01:06 +0000
Received: from mail1-db8 (localhost [127.0.0.1])	by mail1-db8-R.bigfish.com
	(Postfix) with ESMTP id C54991B001F4	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2013 02:01:06 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail1-db8 (localhost.localdomain [127.0.0.1]) by mail1-db8
	(MessageSwitch) id 1363831265329089_4126;
	Thu, 21 Mar 2013 02:01:05 +0000 (UTC)
Received: from DB8EHSMHS010.bigfish.com (unknown [10.174.8.232])	by
	mail1-db8.bigfish.com (Postfix) with ESMTP id 4D4C614C0059	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2013 02:01:05 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS010.bigfish.com
	(10.174.4.20) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 21 Mar 2013 02:01:05 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Thu, 21 Mar 2013 02:01:03 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r2L20xx1000949;
	Wed, 20 Mar 2013 19:01:01 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Mar 2013 10:05:11 +0800
Message-ID: <1363831511-800-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: B40290@freescale.com, Zhenhua Luo <zhenhua.luo@freescale.com>
Subject: [oe-core v2] rpm: split out run-postinsts
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
X-List-Received-Date: Thu, 21 Mar 2013 02:33:14 -0000
Content-Type: text/plain

Split out run-postinsts script into separated package, sometimes only the postinsts script is required to run all postinsts scripts in /etc/rpm-postinsts/ instead of the whole rpm package.

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 6286771..cfdc390 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r61"
+PR = "r62"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -199,7 +199,7 @@ CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE"
 
 LDFLAGS_append_libc-uclibc = "-lrt -lpthread"
 
-PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
+PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale ${PN}-postinsts"
 
 SOLIBS = "5.4.so"
 
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




