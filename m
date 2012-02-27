Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S26Xb-00034N-Ac
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 20:47:23 +0100
Received: from mail71-ch1-R.bigfish.com (10.43.68.226) by
	CH1EHSOBE008.bigfish.com (10.43.70.58) with Microsoft SMTP Server id
	14.1.225.23; Mon, 27 Feb 2012 19:38:56 +0000
Received: from mail71-ch1 (localhost [127.0.0.1])	by mail71-ch1-R.bigfish.com
	(Postfix) with ESMTP id 17B3360370	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 19:38:56 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail71-ch1 (localhost.localdomain [127.0.0.1]) by mail71-ch1
	(MessageSwitch) id 1330371534533196_3907;
	Mon, 27 Feb 2012 19:38:54 +0000 (UTC)
Received: from CH1EHSMHS028.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.242])	by mail71-ch1.bigfish.com (Postfix) with ESMTP id
	7CCAF20004C for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 19:38:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS028.bigfish.com
	(10.43.70.28) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 27 Feb 2012 19:38:52 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.355.3; Mon, 27 Feb 2012 13:38:52 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	q1RJcpYB016536	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 13:38:52 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Feb 2012 13:38:50 -0600
Message-ID: <1330371531-28803-3-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1330371531-28803-1-git-send-email-msm@freescale.com>
References: <1330371531-28803-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 3/4] arch-powerpc.inc: use default value of TUNE_PKGARCH
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
X-List-Received-Date: Mon, 27 Feb 2012 19:47:23 -0000
Content-Type: text/plain

We can use the default value for TUNE_PKGARCH, and now we just
append "-nf" if no float is the build target

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index c9b2829..350f9a9 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -20,8 +20,7 @@ ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-e
 
 PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf", d)}"
 
-PPCPKGARCH = "${TUNE_ARCH}${PPCPKGSFX_FPU}"
-TUNE_PKGARCH ?= "${PPCPKGARCH}"
+TUNE_PKGARCH_append = "${PPCPKGSFX_FPU}"
 
 # Basic tune definitions
 AVAILTUNES += "powerpc powerpc-nf" 
-- 
1.7.6.1




