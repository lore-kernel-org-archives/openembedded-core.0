Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S5l4a-0008SY-PL
	for openembedded-core@openembedded.org; Thu, 08 Mar 2012 22:40:32 +0100
Received: from mail210-ch1-R.bigfish.com (10.43.68.240) by
	CH1EHSOBE008.bigfish.com (10.43.70.58) with Microsoft SMTP Server id
	14.1.225.23; Thu, 8 Mar 2012 21:01:38 +0000
Received: from mail210-ch1 (localhost [127.0.0.1])	by
	mail210-ch1-R.bigfish.com (Postfix) with ESMTP id D8A654028B	for
	<openembedded-core@openembedded.org>;
	Thu,  8 Mar 2012 21:01:37 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail210-ch1 (localhost.localdomain [127.0.0.1]) by mail210-ch1
	(MessageSwitch) id 133124049675010_943;
	Thu,  8 Mar 2012 21:01:36 +0000 (UTC)
Received: from CH1EHSMHS005.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.236])	by mail210-ch1.bigfish.com (Postfix) with ESMTP id
	048F224004F	for <openembedded-core@openembedded.org>; Thu,  8 Mar 2012
	21:01:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS005.bigfish.com
	(10.43.70.5) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 8 Mar 2012 21:01:34 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.355.3; Thu, 8 Mar 2012 15:01:33 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	q28L1XKG014824	for <openembedded-core@openembedded.org>;
	Thu, 8 Mar 2012 15:01:33 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@openembedded.org>
Date: Thu, 8 Mar 2012 15:01:32 -0600
Message-ID: <1331240492-6759-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] packagedata.py: Fix get_subpkgedata_fn for multilib
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
X-List-Received-Date: Thu, 08 Mar 2012 21:40:33 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/lib/oe/packagedata.py |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index a7a40f0..124a49d 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -27,6 +27,13 @@ def read_pkgdatafile(fn):
 
 def get_subpkgedata_fn(pkg, d):
     archs = d.expand("${PACKAGE_ARCHS}").split(" ")
+    mlarchs = d.expand("${MULTILIB_PACKAGE_ARCHS}", d).split(" ")
+
+    for mlarch in mlarchs:
+        if "_" in mlarch:
+            prefix, new_arch = mlarch.split("_")
+            archs.append(new_arch)
+
     archs.reverse()
     pkgdata = d.expand('${TMPDIR}/pkgdata/')
     targetdir = d.expand('${TARGET_VENDOR}-${TARGET_OS}/runtime/')
-- 
1.7.6.1




