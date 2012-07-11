Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SooBQ-0004bs-VV
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 06:05:49 +0200
Received: from mail187-ch1-R.bigfish.com (10.43.68.234) by
	CH1EHSOBE006.bigfish.com (10.43.70.56) with Microsoft SMTP Server id
	14.1.225.23; Wed, 11 Jul 2012 03:37:10 +0000
Received: from mail187-ch1 (localhost [127.0.0.1])	by
	mail187-ch1-R.bigfish.com (Postfix) with ESMTP id B9AB43C014C	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 03:37:09 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail187-ch1 (localhost.localdomain [127.0.0.1]) by mail187-ch1
	(MessageSwitch) id 1341977827966959_13124;
	Wed, 11 Jul 2012 03:37:07 +0000 (UTC)
Received: from CH1EHSMHS036.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.249])	by mail187-ch1.bigfish.com (Postfix) with ESMTP id
	E9D77E00D7 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 03:37:07 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS036.bigfish.com
	(10.43.69.245) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 11 Jul 2012 03:37:07 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Tue, 10 Jul 2012 22:39:27 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6B3dRj6003920 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 20:39:27 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 22:39:26 -0500
Message-ID: <1341977966-14246-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] gcc-configure-common.inc: use --with-long-double-128 on powerpc to comply with ABI
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
X-List-Received-Date: Wed, 11 Jul 2012 04:05:49 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 3b6e313..ece32c1 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r5"
+PR = "r6"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 3dd9de7..908ad3e 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -61,6 +61,10 @@ EXTRA_OECONF_append_mips64el    = " --with-abi=64 --with-arch-64=mips64 --with-t
 EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
 CPPFLAGS = ""
 
+# powerpc needs this to comply with the ABI
+EXTRA_OECONF_append_powerpc = " --with-long-double-128"
+EXTRA_OECONF_append_powerpc64 = " --with-long-double-128"
+
 # Used by configure to define additional values for FLAGS_FOR_TARGET -
 # passed to all the compilers.
 ARCH_FLAGS_FOR_TARGET = "${TARGET_CC_ARCH}"
-- 
1.7.10




