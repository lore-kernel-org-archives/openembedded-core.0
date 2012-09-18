Received: from am1ehsobe006.messaging.microsoft.com ([213.199.154.209]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TE6dK-0000i1-HH
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 00:51:10 +0200
Received: from mail46-am1-R.bigfish.com (10.3.201.239) by
	AM1EHSOBE005.bigfish.com (10.3.204.25) with Microsoft SMTP Server id
	14.1.225.23; Tue, 18 Sep 2012 22:08:18 +0000
Received: from mail46-am1 (localhost [127.0.0.1])	by mail46-am1-R.bigfish.com
	(Postfix) with ESMTP id A28021E0129	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 22:08:18 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h1155h)
Received: from mail46-am1 (localhost.localdomain [127.0.0.1]) by mail46-am1
	(MessageSwitch) id 1348006096776778_4945;
	Tue, 18 Sep 2012 22:08:16 +0000 (UTC)
Received: from AM1EHSMHS009.bigfish.com (unknown [10.3.201.247])	by
	mail46-am1.bigfish.com (Postfix) with ESMTP id BBE05460109	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 22:08:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS009.bigfish.com
	(10.3.207.109) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 18 Sep 2012 22:08:14 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Tue, 18 Sep 2012 17:08:12 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8IM8BJO013889 for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 15:08:12 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Sep 2012 17:08:10 -0500
Message-ID: <1348006091-14992-6-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1348006091-14992-1-git-send-email-msm@freescale.com>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] insane.bbclass: skip checking arch (machine/bits) for powerpc kernel recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 22:51:10 -0000
Content-Type: text/plain

For a 32-bit machine, we still might always (or optionally) want to build a
64-bit kernel so we add an exception.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
Not sure if we should just skip for all virtual/kernel's?

 meta/classes/insane.bbclass |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index e74eb3f..2ca1b49 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -366,11 +366,13 @@ def package_qa_check_arch(path,name,d, elf, messages):
 
     # Check the architecture and endiannes of the binary
     if not ((machine == elf.machine()) or \
-	("virtual/kernel" in provides) and (target_os == "linux-gnux32")):
+	("virtual/kernel" in provides) and (target_os == "linux-gnux32") or \
+	("virtual/kernel" in provides) and (target_arch == "powerpc")):
         messages.append("Architecture did not match (%d to %d) on %s" % \
                  (machine, elf.machine(), package_qa_clean_path(path,d)))
     elif not ((bits == elf.abiSize()) or  \
-	("virtual/kernel" in provides) and (target_os == "linux-gnux32")):
+	("virtual/kernel" in provides) and (target_os == "linux-gnux32") or \
+	("virtual/kernel" in provides) and (target_arch == "powerpc")):
         messages.append("Bit size did not match (%d to %d) %s on %s" % \
                  (bits, elf.abiSize(), bpn, package_qa_clean_path(path,d)))
     elif not littleendian == elf.isLittleEndian():
-- 
1.7.9.7




