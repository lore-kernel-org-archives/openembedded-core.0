Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S5l6c-0008Vm-C9
	for openembedded-core@openembedded.org; Thu, 08 Mar 2012 22:42:38 +0100
Received: from mail108-tx2-R.bigfish.com (10.9.14.241) by
	TX2EHSOBE001.bigfish.com (10.9.40.21) with Microsoft SMTP Server id
	14.1.225.23; Thu, 8 Mar 2012 21:03:51 +0000
Received: from mail108-tx2 (localhost [127.0.0.1])	by
	mail108-tx2-R.bigfish.com (Postfix) with ESMTP id F1D92180590	for
	<openembedded-core@openembedded.org>;
	Thu,  8 Mar 2012 21:03:51 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail108-tx2 (localhost.localdomain [127.0.0.1]) by mail108-tx2
	(MessageSwitch) id 1331240630985287_20267;
	Thu,  8 Mar 2012 21:03:50 +0000 (UTC)
Received: from TX2EHSMHS043.bigfish.com (unknown [10.9.14.246])	by
	mail108-tx2.bigfish.com (Postfix) with ESMTP id EA845260046	for
	<openembedded-core@openembedded.org>;
	Thu,  8 Mar 2012 21:03:50 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS043.bigfish.com
	(10.9.99.143) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 8 Mar 2012 21:03:50 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.1.355.3; Thu, 8 Mar 2012 15:03:49 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q28L3nS4013335
	for <openembedded-core@openembedded.org>; Thu, 8 Mar 2012 14:03:49 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@openembedded.org>
Date: Thu, 8 Mar 2012 15:03:48 -0600
Message-ID: <1331240628-7307-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1331237734.3006.33.camel@ted>
References: <1331237734.3006.33.camel@ted>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2] arch-powerpc.inc: use default value of TUNE_PKGARCH
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
X-List-Received-Date: Thu, 08 Mar 2012 21:42:38 -0000
Content-Type: text/plain

We can use the default value for TUNE_PKGARCH, and now we just
append "-nf" if TARGET_FPU is fpu-soft

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index c9b2829..9f588e8 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -18,10 +18,8 @@ TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}
 
 ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-efs']]}"
 
-PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf", d)}"
-
-PPCPKGARCH = "${TUNE_ARCH}${PPCPKGSFX_FPU}"
-TUNE_PKGARCH ?= "${PPCPKGARCH}"
+PPCPKGSFX_FPU = "${@['', '-nf'][d.getVar('TARGET_FPU',d,1) in ['fpu-soft']]}"
+TUNE_PKGARCH_append = "${PPCPKGSFX_FPU}"
 
 # Basic tune definitions
 AVAILTUNES += "powerpc powerpc-nf" 
-- 
1.7.6.1




