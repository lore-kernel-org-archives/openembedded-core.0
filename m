Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SoMud-0006Jd-SW
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 00:58:40 +0200
Received: from mail22-co1-R.bigfish.com (10.243.78.241) by
	CO1EHSOBE016.bigfish.com (10.243.66.79) with Microsoft SMTP Server id
	14.1.225.23; Mon, 9 Jul 2012 22:45:12 +0000
Received: from mail22-co1 (localhost [127.0.0.1])	by mail22-co1-R.bigfish.com
	(Postfix) with ESMTP id B9D01D40297	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2012 22:45:11 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail22-co1 (localhost.localdomain [127.0.0.1]) by mail22-co1
	(MessageSwitch) id 1341873909817203_7734;
	Mon,  9 Jul 2012 22:45:09 +0000 (UTC)
Received: from CO1EHSMHS003.bigfish.com (unknown [10.243.78.229])	by
	mail22-co1.bigfish.com (Postfix) with ESMTP id C5D68C4004A	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2012 22:45:09 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS003.bigfish.com
	(10.243.66.13) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 9 Jul 2012 22:45:09 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Mon, 9 Jul 2012 17:47:24 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q69MlOGJ006814
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Jul 2012 15:47:24
	-0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jul 2012 17:47:24 -0500
Message-ID: <1341874044-663-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] gcc: gcc-cross-canadian: use correct location for libraries for powerpc64
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
X-List-Received-Date: Mon, 09 Jul 2012 22:58:40 -0000
Content-Type: text/plain

This fixes the issue where gcc invokes the linker with an incorrect -L
library location and gives up because it can't find libraries. It was
looking in a /lib folder instead of /lib64

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc               |    2 +-
 meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb |    2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 65153b3..c7dbc3c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r2"
+PR = "r3"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
index efa345f..48b9b13 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
@@ -11,6 +11,8 @@ RDEPENDS_${PN} += "mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
 SYSTEMHEADERS = "/usr/include"
 SYSTEMLIBS = "/lib/"
 SYSTEMLIBS1 = "/usr/lib/"
+SYSTEMLIBS_powerpc64 = "/lib64/"
+SYSTEMLIBS1_powerpc64 = "/usr/lib64/"
 
 EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
 		--disable-libgomp --disable-libmudflap \
-- 
1.7.10




