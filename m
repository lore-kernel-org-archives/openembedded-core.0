Received: from db3ehsobe004.messaging.microsoft.com ([213.199.154.142]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S54lL-0004NX-UF
	for openembedded-core@openembedded.org; Wed, 07 Mar 2012 01:29:52 +0100
Received: from mail72-db3-R.bigfish.com (10.3.81.230) by
	DB3EHSOBE005.bigfish.com (10.3.84.25) with Microsoft SMTP Server id
	14.1.225.23; Tue, 6 Mar 2012 23:20:59 +0000
Received: from mail72-db3 (localhost [127.0.0.1])	by mail72-db3-R.bigfish.com
	(Postfix) with ESMTP id D44A32201EC	for
	<openembedded-core@openembedded.org>; 
	Tue,  6 Mar 2012 23:20:59 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail72-db3 (localhost.localdomain [127.0.0.1]) by mail72-db3
	(MessageSwitch) id 1331076057983348_29576;
	Tue,  6 Mar 2012 23:20:57 +0000 (UTC)
Received: from DB3EHSMHS016.bigfish.com (unknown [10.3.81.226])	by
	mail72-db3.bigfish.com (Postfix) with ESMTP id EC31B420045	for
	<openembedded-core@openembedded.org>;
	Tue,  6 Mar 2012 23:20:57 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS016.bigfish.com
	(10.3.87.116) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 6 Mar 2012 23:20:57 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.1.355.3; Tue, 6 Mar 2012 17:20:56 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q26NKt9T027864
	for <openembedded-core@openembedded.org>; Tue, 6 Mar 2012 16:20:56 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@openembedded.org>
Date: Tue, 6 Mar 2012 17:20:55 -0600
Message-ID: <1331076055-15262-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
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
X-List-Received-Date: Wed, 07 Mar 2012 00:29:52 -0000
Content-Type: text/plain

We can use the default value for TUNE_PKGARCH, and now we just
append "-nf" if TARGET_FPU is fpu-soft

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index c9b2829..abd72ed 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -18,10 +18,8 @@ TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}
 
 ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-efs']]}"
 
-PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf", d)}"
-
-PPCPKGARCH = "${TUNE_ARCH}${PPCPKGSFX_FPU}"
-TUNE_PKGARCH ?= "${PPCPKGARCH}"
+PPCPKGSFX_FPU = "${@['', '-nf'][bb.data.getVar('TARGET_FPU',d,1) in ['fpu-soft']]}"
+TUNE_PKGARCH_append = "${PPCPKGSFX_FPU}"
 
 # Basic tune definitions
 AVAILTUNES += "powerpc powerpc-nf" 
-- 
1.7.6.1




