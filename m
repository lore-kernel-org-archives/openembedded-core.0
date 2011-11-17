Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RRAlf-00013r-0y
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 23:49:15 +0100
Received: from mail212-ch1-R.bigfish.com (10.43.68.240) by
	CH1EHSOBE011.bigfish.com (10.43.70.61) with Microsoft SMTP Server id
	14.1.225.22; Thu, 17 Nov 2011 22:42:15 +0000
Received: from mail212-ch1 (localhost [127.0.0.1])	by
	mail212-ch1-R.bigfish.com (Postfix) with ESMTP id 027CE10010C	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 22:42:37 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail212-ch1 (localhost.localdomain [127.0.0.1]) by mail212-ch1
	(MessageSwitch) id 1321569756930543_9343;
	Thu, 17 Nov 2011 22:42:36 +0000 (UTC)
Received: from CH1EHSMHS034.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.245])	by mail212-ch1.bigfish.com (Postfix) with ESMTP id
	D5FC6300046	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 22:42:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS034.bigfish.com
	(10.43.70.34) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 17 Nov 2011 22:42:14 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.339.2; Thu, 17 Nov 2011 16:42:47 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	pAHMglR7028200	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 16:42:47 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Nov 2011 16:42:47 -0600
Message-ID: <1321569767-21633-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] Add PATCHRESOLVE to excluded vars for generating sstate-cache
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
X-List-Received-Date: Thu, 17 Nov 2011 22:49:15 -0000
Content-Type: text/plain

The method of resolving the patch should not effect the sstate-cache
signature.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
I'm not 100% sure about this one either - should we even generate
sstate-cache at all if we have a scenario where we try to resolve
a patch?

 meta/classes/patch.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 7622163..5f9765c 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -138,7 +138,7 @@ python patch_do_patch() {
 			raise bb.build.FuncFailed(str(sys.exc_value))
 		resolver.Resolve()
 }
-patch_do_patch[vardepsexclude] = "DATE SRCDATE"
+patch_do_patch[vardepsexclude] = "DATE SRCDATE PATCHRESOLVE"
 
 addtask patch after do_unpack
 do_patch[dirs] = "${WORKDIR}"
-- 
1.7.6.1




