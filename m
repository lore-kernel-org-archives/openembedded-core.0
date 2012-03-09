Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S5u2J-0004QG-Mm
	for openembedded-core@openembedded.org; Fri, 09 Mar 2012 08:14:48 +0100
Received: from mail98-tx2-R.bigfish.com (10.9.14.242) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.23; Fri, 9 Mar 2012 06:20:55 +0000
Received: from mail98-tx2 (localhost [127.0.0.1])	by mail98-tx2-R.bigfish.com
	(Postfix) with ESMTP id B40974205D2	for
	<openembedded-core@openembedded.org>; 
	Fri,  9 Mar 2012 06:20:55 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail98-tx2 (localhost.localdomain [127.0.0.1]) by mail98-tx2
	(MessageSwitch) id 1331274044232975_18081;
	Fri,  9 Mar 2012 06:20:44 +0000 (UTC)
Received: from TX2EHSMHS027.bigfish.com (unknown [10.9.14.243])	by
	mail98-tx2.bigfish.com (Postfix) with ESMTP id 31059200043	for
	<openembedded-core@openembedded.org>;
	Fri,  9 Mar 2012 06:20:44 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS027.bigfish.com
	(10.9.99.127) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 9 Mar 2012 06:20:41 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.1.355.3; Fri, 9 Mar 2012 00:20:40 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q296KemM026641
	for <openembedded-core@openembedded.org>; Thu, 8 Mar 2012 23:20:40 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@openembedded.org>
Date: Fri, 9 Mar 2012 00:20:40 -0600
Message-ID: <1331274040-22494-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1331245413-30310-1-git-send-email-msm@freescale.com>
References: <1331245413-30310-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2] packagedata.py: Fix get_subpkgedata_fn for multilib
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
X-List-Received-Date: Fri, 09 Mar 2012 07:14:48 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/lib/oe/packagedata.py |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index a7a40f0..5759fe6 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -27,6 +27,14 @@ def read_pkgdatafile(fn):
 
 def get_subpkgedata_fn(pkg, d):
     archs = d.expand("${PACKAGE_ARCHS}").split(" ")
+    mlarchs = bb.data.getVar("MULTILIB_PACKAGE_ARCHS", d) or None
+
+    if mlarchs:
+        for mlarch in mlarchs.split(" "):
+            if "_" in mlarch:
+                prefix, split, new_arch = mlarch.partition("_")
+                archs.append(new_arch)
+
     archs.reverse()
     pkgdata = d.expand('${TMPDIR}/pkgdata/')
     targetdir = d.expand('${TARGET_VENDOR}-${TARGET_OS}/runtime/')
-- 
1.7.6.1




