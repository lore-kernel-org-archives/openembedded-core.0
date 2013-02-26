Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1UATH2-00057J-KY
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 23:45:31 +0100
Received: from mail25-am1-R.bigfish.com (10.3.201.226) by
	AM1EHSOBE012.bigfish.com (10.3.207.134) with Microsoft SMTP Server id
	14.1.225.23; Tue, 26 Feb 2013 21:58:56 +0000
Received: from mail25-am1 (localhost [127.0.0.1])	by mail25-am1-R.bigfish.com
	(Postfix) with ESMTP id 4599C2C02E2	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 21:58:56 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 6
X-BigFish: VS6(z37d5kzzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1155h)
Received: from mail25-am1 (localhost.localdomain [127.0.0.1]) by mail25-am1
	(MessageSwitch) id 1361915935208299_11101;
	Tue, 26 Feb 2013 21:58:55 +0000 (UTC)
Received: from AM1EHSMHS008.bigfish.com (unknown [10.3.201.230])	by
	mail25-am1.bigfish.com (Postfix) with ESMTP id 301A020062	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 21:58:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS008.bigfish.com
	(10.3.207.108) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 26 Feb 2013 21:58:47 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 26 Feb 2013 21:58:36 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	r1QLwiep007813 for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 14:58:45 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 15:58:41 -0600
Message-ID: <1361915924-23046-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 1/4] kernel-arch.bbclass: don't pass extra args to KERNEL_{CC, LD, AR}
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
X-List-Received-Date: Tue, 26 Feb 2013 22:45:32 -0000
Content-Type: text/plain

Commit a3ca06c3b45c791dd38dbf154ad0fc62b4063475 added extra args to
KERNEL_CC, these revert that bit while maintaining machine additions
in TARGET_??_KERNEL_ARCH

Producing incorrect instructions and generating the following errors:

   CC      arch/powerpc/kernel/init_task.o
| {standard input}: Assembler messages:
| {standard input}:384: Error: junk at end of line: `1'
| {standard input}:949: Error: junk at end of line: `1'
| {standard input}:1428: Error: junk at end of line: `1'
| {standard input}:1526: Error: junk at end of line: `1'
| {standard input}:1626: Error: junk at end of line: `1'
| {standard input}:1685: Error: junk at end of line: `1'
| {standard input}:1973: Error: junk at end of line: `1'
| {standard input}:2001: Error: junk at end of line: `1'
| {standard input}:2100: Error: junk at end of line: `1'
| {standard input}:2168: Error: junk at end of line: `1'
| {standard input}:2520: Error: junk at end of line: `1'
|   CC      arch/powerpc/lib/locks.o

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/kernel-arch.bbclass |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index a51e82b..b3b71ba 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -52,7 +52,7 @@ HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
 TARGET_AR_KERNEL_ARCH ?= ""
 HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 
-KERNEL_CC = "${CC} ${HOST_CC_KERNEL_ARCH}"
-KERNEL_LD = "${LD} ${HOST_LD_KERNEL_ARCH}"
-KERNEL_AR = "${AR} ${HOST_AR_KERNEL_ARCH}"
+KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH}"
+KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld ${HOST_LD_KERNEL_ARCH}"
+KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 
-- 
1.7.9.7




