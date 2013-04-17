Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1USPPW-0007BY-5F
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 12:16:25 +0200
Received: from mail73-co1-R.bigfish.com (10.243.78.225) by
	CO1EHSOBE002.bigfish.com (10.243.66.65) with Microsoft SMTP Server id
	14.1.225.23; Wed, 17 Apr 2013 08:43:01 +0000
Received: from mail73-co1 (localhost [127.0.0.1])	by mail73-co1-R.bigfish.com
	(Postfix) with ESMTP id 97A9C4800FF	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 08:43:01 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzd799hzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail73-co1 (localhost.localdomain [127.0.0.1]) by mail73-co1
	(MessageSwitch) id 1366188179887426_30968;
	Wed, 17 Apr 2013 08:42:59 +0000 (UTC)
Received: from CO1EHSMHS004.bigfish.com (unknown [10.243.78.234])	by
	mail73-co1.bigfish.com (Postfix) with ESMTP id D6D23580049	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 08:42:59 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS004.bigfish.com
	(10.243.66.14) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 17 Apr 2013 08:42:59 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 17 Apr 2013 08:42:58 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r3H8guVe011760;	Wed, 17 Apr 2013 01:42:57 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2013 16:42:55 +0800
Message-ID: <1366188175-29768-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: r63875@freescale.com
Subject: [PATCH] augeas: allow empty augeas-lenses package
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
X-List-Received-Date: Wed, 17 Apr 2013 10:16:26 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Fix the error when do_rootfs:
| Loading cache...
| Updating cache...               ######################################## [100%]
|
| Computing transaction...error: Can't install libaugeas0-1.0.0-r1@ppce500v2: no package provides augeas-lenses
|
| Saving cache...
|
| ERROR: Function failed: do_rootfs

augeas-lenses rpm is not generated due to no content:
$ ls tmp/deploy/rpm/ppce500v2/augeas-
augeas-1.0.0-r1.ppce500v2.rpm      augeas-dev-1.0.0-r1.ppce500v2.rpm
augeas-dbg-1.0.0-r1.ppce500v2.rpm  augeas-doc-1.0.0-r1.ppce500v2.rpm
$ ls tmp/work/ppce500v2-fsl_networking-linux-gnuspe/augeas/1.0.0-r1/packages-split/augeas-lenses/
$

Change-Id: I63b871fdbbd45f1c0b1b5605b342e62e1526c37b
Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta/recipes-extended/augeas/augeas.inc      |    3 +++
 meta/recipes-extended/augeas/augeas_1.0.0.bb |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
index c956621..49da973 100644
--- a/meta/recipes-extended/augeas/augeas.inc
+++ b/meta/recipes-extended/augeas/augeas.inc
@@ -29,3 +29,6 @@ LEAD_SONAME = "libaugeas.so"
 do_install_append() {
 	rm -fr ${D}${datadir}/vim
 }
+
+ALLOW_EMPTY_${PN}-lenses = "1" 
+
diff --git a/meta/recipes-extended/augeas/augeas_1.0.0.bb b/meta/recipes-extended/augeas/augeas_1.0.0.bb
index 82bda19..d898eea 100644
--- a/meta/recipes-extended/augeas/augeas_1.0.0.bb
+++ b/meta/recipes-extended/augeas/augeas_1.0.0.bb
@@ -1,6 +1,6 @@
 require augeas.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "82131019432ecf8102e1491610ad2dd1"
 SRC_URI[sha256sum] = "31bf757c5b8197765946b3805f3793c32b03cd92a7a77ec95d37e71a1f131912"
-- 
1.7.5.4




