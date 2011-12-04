Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RXITl-0006Cf-2U
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Dec 2011 21:16:05 +0100
Received: from mail195-ch1-R.bigfish.com (10.43.68.252) by
	CH1EHSOBE018.bigfish.com (10.43.70.68) with Microsoft SMTP Server id
	14.1.225.23; Sun, 4 Dec 2011 20:09:19 +0000
Received: from mail195-ch1 (localhost [127.0.0.1])	by
	mail195-ch1-R.bigfish.com (Postfix) with ESMTP id 48ACF54019E	for
	<openembedded-core@lists.openembedded.org>;
	Sun,  4 Dec 2011 19:21:40 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail195-ch1 (localhost.localdomain [127.0.0.1]) by mail195-ch1
	(MessageSwitch) id 1323026498205681_29049;
	Sun,  4 Dec 2011 19:21:38 +0000 (UTC)
Received: from CH1EHSMHS034.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.241])	by mail195-ch1.bigfish.com (Postfix) with ESMTP id
	2D6922C0043	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Dec 2011 19:21:38 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS034.bigfish.com
	(10.43.70.34) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Sun, 4 Dec 2011 20:09:17 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.339.2; Sun, 4 Dec 2011 14:09:15 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	pB4K9Fah025077	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Dec 2011 14:09:15 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 4 Dec 2011 14:09:14 -0600
Message-ID: <1323029354-14952-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] openjade-native_1.3.2.bb: remove CONFIGUREOPTS as vardep for do_configure
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
X-List-Received-Date: Sun, 04 Dec 2011 20:16:05 -0000
Content-Type: text/plain

This variable was being expanded immediately and pulling in
paths to the variable dependecies which causes it's sstate-cache
to never be reused

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../openjade/openjade-native_1.3.2.bb              |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index 6cc6bb5..72f5bb2 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -28,6 +28,11 @@ EXTRA_OECONF = "--enable-spincludedir=${STAGING_INCDIR}/OpenSP \
 # results in it being specified twice when configure is run.
 CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('--datadir=${datadir}', '--datadir=${STAGING_DATADIR}/sgml/openjade-${PV}')}"
 
+# CONFIGUREOPTS has hard coded paths so we need to ignore it's vardeps
+# there are other bits in there too but they are picked up by other variable
+# dependencies so it all works out
+do_configure[vardepsexclude] += "CONNFIGUREOPTS"
+
 CFLAGS =+ "-I${S}/include"
 
 SSTATEPOSTINSTFUNCS += "openjade_sstate_postinst"
-- 
1.7.6.1




