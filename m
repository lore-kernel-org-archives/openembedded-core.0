Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1U1EYw-0000Dp-OB
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 12:13:52 +0100
Received: from mail30-am1-R.bigfish.com (10.3.201.247) by
	AM1EHSOBE019.bigfish.com (10.3.207.141) with Microsoft SMTP Server id
	14.1.225.23; Fri, 1 Feb 2013 10:12:50 +0000
Received: from mail30-am1 (localhost [127.0.0.1])	by mail30-am1-R.bigfish.com
	(Postfix) with ESMTP id 06341160147	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2013 10:12:50 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 4
X-BigFish: VS4(z37d4lzzz1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h1155h)
Received: from mail30-am1 (localhost.localdomain [127.0.0.1]) by mail30-am1
	(MessageSwitch) id 1359713568423871_28127;
	Fri,  1 Feb 2013 10:12:48 +0000 (UTC)
Received: from AM1EHSMHS014.bigfish.com (unknown [10.3.201.247])	by
	mail30-am1.bigfish.com (Postfix) with ESMTP id 65AFB4A0060	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2013 10:12:48 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS014.bigfish.com
	(10.3.207.152) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 1 Feb 2013 10:12:43 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Fri, 1 Feb 2013 10:12:42 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r11ACcaO003401;	Fri, 1 Feb 2013 03:12:39 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Feb 2013 18:12:38 +0800
Message-ID: <1359713558-22689-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b29882@freescale.com
Subject: oprofile: avoid processing files under .pc
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
X-List-Received-Date: Fri, 01 Feb 2013 11:13:52 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Fix the below issue:
| DEBUG: Executing shell function do_configure
| sed: can't read ./.pc/opstart.patch/doc/opstop.1.in: Permission denied
| sed: can't read ./.pc/opstart.patch/doc/opstart.1.in: Permission
denied
| sed: can't read ./.pc/opstart.patch/utils/opstart.c: Permission denied
| ERROR: Function failed: do_configure

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index d6d20ae..b09aaf8 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -19,7 +19,7 @@ FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "file://opstart.patch \
            file://oprofile-no-query-modules.patch \
@@ -30,7 +30,7 @@ inherit autotools
 
 EXTRA_OECONF = "--with-kernel=${STAGING_KERNEL_DIR}  --without-x"
 do_configure () {
-	find . -type f | xargs sed -i 's#ROOTHOME#${ROOT_HOME}#'
+	find . -wholename './.pc' -prune -o -type f -print | xargs sed -i 's#ROOTHOME#${ROOT_HOME}#'
 	cp ${WORKDIR}/acinclude.m4 ${S}/
 	autotools_do_configure
 }
-- 
1.7.5.4




