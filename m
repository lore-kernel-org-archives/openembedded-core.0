Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9MlR-0004MF-8m
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 21:59:25 +0200
Received: from mail142-ch1-R.bigfish.com (216.32.181.172) by
	CH1EHSOBE006.bigfish.com (10.43.70.56) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 18:53:27 +0000
Received: from mail142-ch1 (localhost.localdomain [127.0.0.1])	by
	mail142-ch1-R.bigfish.com (Postfix) with ESMTP id 0D32DB50383	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 18:53:27 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail142-ch1 (localhost.localdomain [127.0.0.1]) by mail142-ch1
	(MessageSwitch) id 1317322356301990_2944;
	Thu, 29 Sep 2011 18:52:36 +0000 (UTC)
Received: from CH1EHSMHS034.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.249])	by mail142-ch1.bigfish.com (Postfix) with ESMTP id
	440FD780051	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 18:52:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS034.bigfish.com
	(10.43.70.34) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 18:52:35 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.323.7; Thu, 29 Sep 2011 13:52:34 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8TIqXxb010863	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 13:52:33 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 13:52:33 -0500
Message-ID: <1317322353-30258-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 10/16] Fix mdadm for powerpc64
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
X-List-Received-Date: Thu, 29 Sep 2011 19:59:25 -0000
Content-Type: text/plain

This fixes build failures from build warnings on powerpc64

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-extended/mdadm/mdadm_3.2.2.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb b/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
index 5d29ae7..1c83f89 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
                     file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2"
 
@@ -16,6 +16,7 @@ SRC_URI[md5sum] = "12ee2fbf3beddb60601fb7a4c4905651"
 SRC_URI[sha256sum] = "0d1a04e688b082bc88846e3f524abd50bc782b6ffc06123140f7d358c8f9b906"
 
 CFLAGS += "-fno-strict-aliasing"
+EXTRA_OEMAKE_append_powerpc64 = "CXFLAGS=-Wno-error=format"
 
 inherit autotools
 
-- 
1.7.6.1




