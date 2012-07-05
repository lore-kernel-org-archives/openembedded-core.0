Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SmsHy-0004l6-6T
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 22:04:34 +0200
Received: from mail124-tx2-R.bigfish.com (10.9.14.246) by
	TX2EHSOBE012.bigfish.com (10.9.40.32) with Microsoft SMTP Server id
	14.1.225.23; Thu, 5 Jul 2012 19:21:11 +0000
Received: from mail124-tx2 (localhost [127.0.0.1])	by
	mail124-tx2-R.bigfish.com (Postfix) with ESMTP id EF49D40112	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2012 19:21:10 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail124-tx2 (localhost.localdomain [127.0.0.1]) by mail124-tx2
	(MessageSwitch) id 13415160691346_6719;
	Thu,  5 Jul 2012 19:21:09 +0000 (UTC)
Received: from TX2EHSMHS031.bigfish.com (unknown [10.9.14.240])	by
	mail124-tx2.bigfish.com (Postfix) with ESMTP id EFD953C0044	for
	<openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2012 19:21:08 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS031.bigfish.com
	(10.9.99.131) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 5 Jul 2012 19:21:07 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Thu, 5 Jul 2012 14:23:11 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q65JNBfa031629
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jul 2012 12:23:12
	-0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jul 2012 14:23:11 -0500
Message-ID: <1341516191-31573-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] utils.bbclass: add helper function to add all multilib variants of a specific package
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
X-List-Received-Date: Thu, 05 Jul 2012 20:04:34 -0000
Content-Type: text/plain

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This is useful for the scenario where we want to add 'gcc' to
the root file system for all multilib variants

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
RP was the author of this patch via pastebin only... I thought
I would properly attribute it to him

 meta/classes/utils.bbclass |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index fde8f44..cc3acfa 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -351,6 +351,15 @@ def extend_variants(d, var, extend, delim=':'):
 			variants.append(eext[1])
 	return " ".join(variants)
 
+def multilib_pkg_extend(d, pkg):
+	variants = (d.getVar("MULTILIB_VARIANTS", True) or "").split()
+	if not variants:
+	    return pkg
+	pkgs = pkg
+	for v in variants:
+	    pkgs = pkgs + " " + v + "-" + pkg
+	return pkgs
+
 def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = ' '):
 	"""Return a string of all ${var} in all multilib tune configuration"""
 	values = []
-- 
1.7.10




