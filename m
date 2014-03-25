Return-Path: <B40290@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe003.messaging.microsoft.com [65.55.88.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0F36D8E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 10:37:27 +0000 (UTC)
Received: from mail210-tx2-R.bigfish.com (10.9.14.232) by
	TX2EHSOBE014.bigfish.com (10.9.40.34) with Microsoft SMTP Server id
	14.1.225.22; Tue, 25 Mar 2014 10:37:28 +0000
Received: from mail210-tx2 (localhost [127.0.0.1])	by
	mail210-tx2-R.bigfish.com (Postfix) with ESMTP id 196598C0304	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 10:37:28 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh1de097hz2dh2a8h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh1155h)
Received: from mail210-tx2 (localhost.localdomain [127.0.0.1]) by mail210-tx2
	(MessageSwitch) id 1395743845980609_4779;
	Tue, 25 Mar 2014 10:37:25 +0000 (UTC)
Received: from TX2EHSMHS036.bigfish.com (unknown [10.9.14.236])	by
	mail210-tx2.bigfish.com (Postfix) with ESMTP id EA6F68A0095;
	Tue, 25 Mar 2014 10:37:25 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS036.bigfish.com
	(10.9.99.136) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 25 Mar 2014 10:37:23 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 25 Mar 2014 10:37:22 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.136])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s2PAbJZs020553; Tue, 25 Mar 2014 03:37:20 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Mar 2014 18:37:16 +0800
Message-ID: <1395743836-17276-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] coreutils: fix search paths for libstdbuf.so
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Mar 2014 10:37:32 -0000
Content-Type: text/plain

        *fix the following error:
        |stdbuf: failed to find 'libstdbuf.so'
        *PKGLIBEXECDIR is the search paths for libstdbuf.so
        |PKGLIBEXECDIR='$(pkglibexecdir)'
        |pkglibexecdir='${libexecdir}/${PACKAGE}'

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-core/coreutils/coreutils_8.22.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.22.bb b/meta/recipes-core/coreutils/coreutils_8.22.bb
index a26aa02..ed5fc84 100644
--- a/meta/recipes-core/coreutils/coreutils_8.22.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.22.bb
@@ -71,8 +71,6 @@ do_install_append() {
 	# in update-alternatives to fail, therefore use lbracket - the name used
 	# for the actual source file.
 	mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${BPN}
-	install -d ${D}${libdir}/coreutils
-	mv ${D}${libexecdir}/coreutils/libstdbuf.so ${D}${libdir}/coreutils
 }
 
 inherit update-alternatives
@@ -101,3 +99,4 @@ python __anonymous() {
 }
 
 BBCLASSEXTEND = "native"
+FILES_${PN}-dbg += "${libexecdir}/coreutils/.debug/*"
-- 
1.8.3.2



