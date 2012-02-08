Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=DB3EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RvF5j-0001ur-O1
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 22:30:15 +0100
Received: from mail116-db3-R.bigfish.com (10.3.81.228) by
	DB3EHSOBE003.bigfish.com (10.3.84.23) with Microsoft SMTP Server id
	14.1.225.23; Wed, 8 Feb 2012 21:07:05 +0000
Received: from mail116-db3 (localhost [127.0.0.1])	by
	mail116-db3-R.bigfish.com (Postfix) with ESMTP id E5DD1A0219	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2012 21:07:04 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail116-db3 (localhost.localdomain [127.0.0.1]) by mail116-db3
	(MessageSwitch) id 132873522212007_4330;
	Wed,  8 Feb 2012 21:07:02 +0000 (UTC)
Received: from DB3EHSMHS015.bigfish.com (unknown [10.3.81.232])	by
	mail116-db3.bigfish.com (Postfix) with ESMTP id EA8902004A	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2012 21:07:01 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS015.bigfish.com
	(10.3.87.115) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 8 Feb 2012 21:06:58 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.355.3; Wed, 8 Feb 2012 15:06:55 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	q18L6t7u024362	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Feb 2012 15:06:55 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Feb 2012 15:06:54 -0600
Message-ID: <1328735214-1899-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] distutils.bbclass: override LDSHARED so we use the linker for this build and not the one used in sstate-cache
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
X-List-Received-Date: Wed, 08 Feb 2012 21:30:15 -0000
Content-Type: text/plain

Without this fix, when packages are being built using distutils and
the python packages were deployed from sstate-cache is it possible
that the LD command will contain an invalid sysroot override.

We can fix this by always exported LDSHARED, which is the env var
that distutil looks for to override creating shared libraries.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/distutils.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 79b962a..18ae805 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -72,3 +72,5 @@ distutils_do_install() {
 }
 
 EXPORT_FUNCTIONS do_compile do_install
+
+export LDSHARED="${CCLD} -shared"
-- 
1.7.6.1




