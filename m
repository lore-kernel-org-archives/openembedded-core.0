Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S26mC-0003g2-RY
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 21:02:29 +0100
Received: from mail115-ch1-R.bigfish.com (10.43.68.227) by
	CH1EHSOBE009.bigfish.com (10.43.70.59) with Microsoft SMTP Server id
	14.1.225.23; Mon, 27 Feb 2012 19:38:56 +0000
Received: from mail115-ch1 (localhost [127.0.0.1])	by
	mail115-ch1-R.bigfish.com (Postfix) with ESMTP id 63EF74002E1	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 19:38:56 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail115-ch1 (localhost.localdomain [127.0.0.1]) by mail115-ch1
	(MessageSwitch) id 1330371534452808_8579;
	Mon, 27 Feb 2012 19:38:54 +0000 (UTC)
Received: from CH1EHSMHS028.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.231])	by mail115-ch1.bigfish.com (Postfix) with ESMTP id
	6AF13E0048 for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 19:38:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS028.bigfish.com
	(10.43.70.28) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 27 Feb 2012 19:38:52 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.355.3; Mon, 27 Feb 2012 13:38:52 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	q1RJcpY9016536	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 13:38:51 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Feb 2012 13:38:48 -0600
Message-ID: <1330371531-28803-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 1/4] multilib.bbclass: allow TARGET_VENDOR_virtclass-multilib to be overriden
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
X-List-Received-Date: Mon, 27 Feb 2012 20:02:29 -0000
Content-Type: text/plain

If we set this bit, we can override the ugly "pokymllib32" to back to
"poky" (powerpc-pokymllib32-linux-gcc -> powerpc-poky-linux-gcc). I've
left this unset by default, but can be set by adding the following:

TARGET_VENDOR_virtclass-multilib-lib32 = "-poky"

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/multilib.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 87d0cd4..61b7765 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -26,7 +26,8 @@ python multilib_virtclass_handler () {
     e.data.setVar("MLPREFIX", variant + "-")
     e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
     e.data.setVar("SHLIBSDIR_virtclass-multilib-" + variant ,e.data.getVar("SHLIBSDIR", False) + "/" + variant)
-    e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + variant, e.data.getVar("TARGET_VENDOR", False) + "ml" + variant)
+    if e.data.getVar("TARGET_VENDOR_virtclass-multilib-" + variant, False) is None:
+	    e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + variant, e.data.getVar("TARGET_VENDOR", False) + "ml" + variant)
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
 }
 
-- 
1.7.6.1




