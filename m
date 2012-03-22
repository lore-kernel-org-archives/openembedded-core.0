Received: from am1ehsobe006.messaging.microsoft.com ([213.199.154.209]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SAlPS-0004MK-6k
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 18:02:46 +0100
Received: from mail36-am1-R.bigfish.com (10.3.201.239) by
	AM1EHSOBE003.bigfish.com (10.3.204.23) with Microsoft SMTP Server id
	14.1.225.23; Thu, 22 Mar 2012 16:53:43 +0000
Received: from mail36-am1 (localhost [127.0.0.1])	by mail36-am1-R.bigfish.com
	(Postfix) with ESMTP id 384E060290;
	Thu, 22 Mar 2012 16:53:43 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail36-am1 (localhost.localdomain [127.0.0.1]) by mail36-am1
	(MessageSwitch) id 1332435221168994_16901;
	Thu, 22 Mar 2012 16:53:41 +0000 (UTC)
Received: from AM1EHSMHS008.bigfish.com (unknown [10.3.201.243])	by
	mail36-am1.bigfish.com (Postfix) with ESMTP id 2505B4E00DB;
	Thu, 22 Mar 2012 16:53:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS008.bigfish.com
	(10.3.207.108) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 22 Mar 2012 16:53:38 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.1.355.3; Thu, 22 Mar 2012 11:53:45 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q2MGriPB006180; Thu, 22 Mar 2012 09:53:44 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>, <chris_larson@mentor.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 22 Mar 2012 11:53:43 -0500
Message-ID: <1332435223-15320-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1332434311.9740.250.camel@ted>
References: <1332434311.9740.250.camel@ted>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] arch-powerpc.inc: use default value of TUNE_PKGARCH
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
X-List-Received-Date: Thu, 22 Mar 2012 17:02:46 -0000
Content-Type: text/plain

We can use the default value for TUNE_PKGARCH, and now we just
append "-nf" if TARGET_FPU is fpu-soft

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index c9b2829..c5fd6b7 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -18,10 +18,8 @@ TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}
 
 ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-efs']]}"
 
-PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf", d)}"
-
-PPCPKGARCH = "${TUNE_ARCH}${PPCPKGSFX_FPU}"
-TUNE_PKGARCH ?= "${PPCPKGARCH}"
+PPCPKGSFX_FPU = "${@['', '-nf'][d.getVar('TARGET_FPU', True) in ['fpu-soft']]}"
+TUNE_PKGARCH_append = "${PPCPKGSFX_FPU}"
 
 # Basic tune definitions
 AVAILTUNES += "powerpc powerpc-nf" 
-- 
1.7.6.1




