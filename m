Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SoSUB-0005uE-6Y
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 06:55:43 +0200
Received: from mail202-ch1-R.bigfish.com (10.43.68.236) by
	CH1EHSOBE014.bigfish.com (10.43.70.64) with Microsoft SMTP Server id
	14.1.225.23; Tue, 10 Jul 2012 04:27:08 +0000
Received: from mail202-ch1 (localhost [127.0.0.1])	by
	mail202-ch1-R.bigfish.com (Postfix) with ESMTP id 6D96C1E0296	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 04:27:08 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail202-ch1 (localhost.localdomain [127.0.0.1]) by mail202-ch1
	(MessageSwitch) id 134189442757349_4149;
	Tue, 10 Jul 2012 04:27:07 +0000 (UTC)
Received: from CH1EHSMHS013.bigfish.com (snatpool3.int.messaging.microsoft.com
	[10.43.68.225])	by mail202-ch1.bigfish.com (Postfix) with ESMTP id
	0CA0C8022F for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 04:27:07 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS013.bigfish.com
	(10.43.70.13) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 10 Jul 2012 04:27:07 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Mon, 9 Jul 2012 23:29:24 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6A4TNxD018110
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Jul 2012 21:29:23
	-0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jul 2012 23:29:22 -0500
Message-ID: <1341894563-32675-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 1/2] gcc: gcc-cross-canadian: use correct location for libraries for powerpc64
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
X-List-Received-Date: Tue, 10 Jul 2012 04:55:43 -0000
Content-Type: text/plain

This fixes the issue where gcc invokes the linker with an incorrect -L
library location and gives up because it can't find libraries. It was
looking in a /lib folder instead of /lib64

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc               |    2 +-
 meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
index efa345f..308e6f5 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
@@ -9,8 +9,8 @@ DEPENDS += "gmp-nativesdk mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
 RDEPENDS_${PN} += "mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
 
 SYSTEMHEADERS = "/usr/include"
-SYSTEMLIBS = "/lib/"
-SYSTEMLIBS1 = "/usr/lib/"
+SYSTEMLIBS = "${target_base_libdir}/"
+SYSTEMLIBS1 = "${target_libdir}/"
 
 EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
 		--disable-libgomp --disable-libmudflap \
-- 
1.7.10




