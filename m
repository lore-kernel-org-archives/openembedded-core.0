Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1U2nKD-0002xF-MS
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 19:32:59 +0100
Received: from mail107-db3-R.bigfish.com (10.3.81.246) by
	DB3EHSOBE008.bigfish.com (10.3.84.28) with Microsoft SMTP Server id
	14.1.225.23; Tue, 5 Feb 2013 17:46:59 +0000
Received: from mail107-db3 (localhost [127.0.0.1])	by
	mail107-db3-R.bigfish.com (Postfix) with ESMTP id 417C91A0946	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2013 17:46:59 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 6
X-BigFish: VS6(z37d5kzzz1ee6h1de0h1202h1e76h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h1155h)
Received: from mail107-db3 (localhost.localdomain [127.0.0.1]) by mail107-db3
	(MessageSwitch) id 1360086416430661_12567;
	Tue,  5 Feb 2013 17:46:56 +0000 (UTC)
Received: from DB3EHSMHS011.bigfish.com (unknown [10.3.81.226])	by
	mail107-db3.bigfish.com (Postfix) with ESMTP id 65887E021D	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2013 17:46:56 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS011.bigfish.com
	(10.3.87.111) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 5 Feb 2013 17:46:56 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Tue, 5 Feb 2013 17:46:54 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	r15Hkj8D032069	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Feb 2013 10:46:53 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Feb 2013 11:46:47 -0600
Message-ID: <1360086408-29832-4-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1360086408-29832-1-git-send-email-msm@freescale.com>
References: <1360086408-29832-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 4/5] kernel-arch.bbclass: don't pass extra args to KERNEL_{CC, LD, AR}
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
X-List-Received-Date: Tue, 05 Feb 2013 18:33:00 -0000
Content-Type: text/plain

Commit a3ca06c3b45c791dd38dbf154ad0fc62b4063475 added extra args to
KERNEL_CC, these revert that bit while maintaining machine additions
in TARGET_??_KERNEL_ARCH

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




